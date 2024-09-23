@implementation DMTGlobalHTTPProxyPayload

+ (NSSet)supportedPayloadTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.proxy.http.global"));
}

@end
