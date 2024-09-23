@implementation AELifecycleEventHandlingXPCInterfaceFactory

- (id)makeInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E025B8);
}

@end
