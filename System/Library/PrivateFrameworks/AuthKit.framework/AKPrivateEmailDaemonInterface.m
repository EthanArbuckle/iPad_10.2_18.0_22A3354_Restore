@implementation AKPrivateEmailDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_8 != -1)
    dispatch_once(&XPCInterface_onceToken_8, &__block_literal_global_26);
  return (id)XPCInterface_interface_7;
}

void __45__AKPrivateEmailDaemonInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE259908);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface_7;
  XPCInterface_interface_7 = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)XPCInterface_interface_7, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_registerPrivateEmailWithContext_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface_7, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_fetchSignInWithApplePrivateEmailWithContext_completion_, 0, 0);

}

@end
