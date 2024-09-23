@implementation DMTEthernetPayload

+ (NSSet)supportedPayloadTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.firstethernet.managed"), CFSTR("com.apple.secondethernet.managed"), CFSTR("com.apple.thirdethernet.managed"), CFSTR("com.apple.globalethernet.managed"), CFSTR("com.apple.firstactiveethernet.managed"), CFSTR("com.apple.secondactiveethernet.managed"), CFSTR("com.apple.thirdactiveethernet.managed"), 0);
}

@end
