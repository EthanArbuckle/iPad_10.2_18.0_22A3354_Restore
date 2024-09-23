@implementation NSXPCInterface(CXNetworkExtensionMessageControllerSupport)

+ (uint64_t)cx_networkExtensionMessageControllerHostInterface
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE70F438);
}

@end
