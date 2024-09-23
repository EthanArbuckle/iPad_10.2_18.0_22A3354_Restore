@implementation DMTNetworkProxyPayload

+ (NSSet)supportedPayloadTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.SystemConfiguration"));
}

@end
