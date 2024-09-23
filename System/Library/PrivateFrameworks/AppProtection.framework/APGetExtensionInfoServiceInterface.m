@implementation APGetExtensionInfoServiceInterface

uint64_t __APGetExtensionInfoServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2563DE3A0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)APGetExtensionInfoServiceInterface_interface;
  APGetExtensionInfoServiceInterface_interface = v0;

  objc_msgSend((id)APGetExtensionInfoServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getExtensionIsLockedForUUID_completion_, 0, 0);
  objc_msgSend((id)APGetExtensionInfoServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getExtensionIsLockedForUUID_completion_, 0, 1);
  objc_msgSend((id)APGetExtensionInfoServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getExtensionIsLockedForUUID_completion_, 1, 1);
  objc_msgSend((id)APGetExtensionInfoServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_authenticateForExtensionWithUUID_reasonDescription_completion_, 0, 0);
  objc_msgSend((id)APGetExtensionInfoServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_authenticateForExtensionWithUUID_reasonDescription_completion_, 1, 0);
  objc_msgSend((id)APGetExtensionInfoServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_authenticateForExtensionWithUUID_reasonDescription_completion_, 1, 1);
  objc_msgSend((id)APGetExtensionInfoServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_extensionRequiresAuthentication_completion_, 0, 0);
  return objc_msgSend((id)APGetExtensionInfoServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_extensionRequiresAuthentication_completion_, 1, 1);
}

@end
