@implementation MSMessageConverter

+ (BOOL)sendPayload:(id)a3 extensionBundleID:(id)a4 chatGUID:(id)a5 withRecipients:(id)a6
{
  return IMSPISendMSMessagePayload(a3, a6, a4, a5, 0);
}

@end
