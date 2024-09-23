@implementation DCDeviceMetadataInterface

+ (id)XPCInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255A401D0);
}

@end
