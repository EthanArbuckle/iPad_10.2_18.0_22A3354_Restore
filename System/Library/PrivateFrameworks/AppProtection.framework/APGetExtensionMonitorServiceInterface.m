@implementation APGetExtensionMonitorServiceInterface

uint64_t __APGetExtensionMonitorServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2563DEF98);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)APGetExtensionMonitorServiceInterface_interface;
  APGetExtensionMonitorServiceInterface_interface = v0;

  objc_msgSend((id)APGetExtensionMonitorServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_beginMonitoringForExtensionUUID_monitorUUID_, 0, 0);
  objc_msgSend((id)APGetExtensionMonitorServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_beginMonitoringForExtensionUUID_monitorUUID_, 1, 0);
  return objc_msgSend((id)APGetExtensionMonitorServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_endMonitoringForMonitorUUID_, 0, 0);
}

@end
