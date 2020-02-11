require 'marketingcloudsdk'
require_relative 'sample_helper'

begin
	myclient = MarketingCloudSDK::Client.new auth
	
	TriggeredSendCustomerKey = "TEXTEXT"
	AltTriggeredSendCustomerKey = "FailTest"
	SubscriberEmailAddress = "SDKExample@bh.exacttarget.com"
	
	# Call SendTriggeredSends which can be used to send emails to multiple definitions with a single request
	# Limit usage to 50 subscribers per request. 
	tsOne = {"CustomerKey" => TriggeredSendCustomerKey}
	tsOne['Subscribers'] = [{"EmailAddress"=>SubscriberEmailAddress, "SubscriberKey" => SubscriberEmailAddress}]
	tsTwo = {"CustomerKey" => AltTriggeredSendCustomerKey}
	tsTwo['Subscribers'] = [{"EmailAddress"=>SubscriberEmailAddress, "SubscriberKey" => SubscriberEmailAddress}]
	
	response = myclient.SendTriggeredSends([tsOne,tsTwo])
	p 'Response Status: ' + response.status.to_s
	p 'Code: ' + response.code.to_s
	p 'Message: ' + response.message.to_s	
	p 'Results Length: ' + response.results.length.to_s
	p 'Results: ' + response.results.to_s
	
rescue => e
	p "Caught exception: #{e.message}"
	p e.backtrace
end


