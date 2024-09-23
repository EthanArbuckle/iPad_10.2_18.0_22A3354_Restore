@implementation APGetMaintenanceServiceInterface

uint64_t __APGetMaintenanceServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2563DE510);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)APGetMaintenanceServiceInterface_interface;
  APGetMaintenanceServiceInterface_interface = v0;

  objc_msgSend((id)APGetMaintenanceServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clearAccessTableWithCompletion_, 0, 1);
  objc_msgSend((id)APGetMaintenanceServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getStateDumpWithCompletion_, 0, 1);
  return objc_msgSend((id)APGetMaintenanceServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getStateDumpWithCompletion_, 1, 1);
}

@end
