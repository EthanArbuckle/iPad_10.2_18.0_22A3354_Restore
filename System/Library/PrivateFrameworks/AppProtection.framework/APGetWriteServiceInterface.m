@implementation APGetWriteServiceInterface

uint64_t __APGetWriteServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2563DE5D0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)APGetWriteServiceInterface_interface;
  APGetWriteServiceInterface_interface = v0;

  objc_msgSend((id)APGetWriteServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setBundleIdentifier_hidden_completion_, 0, 0);
  objc_msgSend((id)APGetWriteServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setBundleIdentifier_hidden_completion_, 0, 1);
  objc_msgSend((id)APGetWriteServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setBundleIdentifier_locked_completion_, 0, 0);
  return objc_msgSend((id)APGetWriteServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setBundleIdentifier_locked_completion_, 0, 1);
}

@end
