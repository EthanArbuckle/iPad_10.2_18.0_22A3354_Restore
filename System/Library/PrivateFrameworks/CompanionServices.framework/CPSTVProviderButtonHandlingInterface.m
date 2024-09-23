@implementation CPSTVProviderButtonHandlingInterface

+ (NSXPCInterface)handlerInterface
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256909988);
}

@end
