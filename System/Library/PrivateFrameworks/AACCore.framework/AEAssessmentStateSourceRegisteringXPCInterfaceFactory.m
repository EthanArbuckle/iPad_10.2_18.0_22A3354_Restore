@implementation AEAssessmentStateSourceRegisteringXPCInterfaceFactory

- (id)makeInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E027B0);
}

@end
