@implementation APGetClientExtensionMonitorInterface

uint64_t __APGetClientExtensionMonitorInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2563DDC50);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)APGetClientExtensionMonitorInterface_interface;
  APGetClientExtensionMonitorInterface_interface = v0;

  return objc_msgSend((id)APGetClientExtensionMonitorInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_extensionMonitorWithUUID_lockedStatusUpdate_, 0, 0);
}

@end
