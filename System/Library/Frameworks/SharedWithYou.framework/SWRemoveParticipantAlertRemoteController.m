@implementation SWRemoveParticipantAlertRemoteController

void __75___SWRemoveParticipantAlertRemoteController_serviceViewControllerInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1519A0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceViewControllerInterface_interface;
  serviceViewControllerInterface_interface = v0;

}

void __62___SWRemoveParticipantAlertRemoteController_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE148BB8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_interface;
  exportedInterface_interface = v0;

}

@end
