@implementation IPClientExportedInterface

uint64_t __IPClientExportedInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256DFF5E0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)IPClientExportedInterface_interface;
  IPClientExportedInterface_interface = v0;

  objc_msgSend((id)IPClientExportedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_installableForIdentity_progressChanged_, 0, 0);
  objc_msgSend((id)IPClientExportedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_installableForIdentity_progressChanged_, 1, 0);
  return objc_msgSend((id)IPClientExportedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_installableForIdentity_progressEndedForReason_, 0, 0);
}

@end
