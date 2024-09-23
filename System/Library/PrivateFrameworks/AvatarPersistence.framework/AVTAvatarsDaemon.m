@implementation AVTAvatarsDaemon

+ (id)xpcInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255104EB8);
}

@end
