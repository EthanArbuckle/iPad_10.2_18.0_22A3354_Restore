@implementation AAAccountUserNotificationDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_0 != -1)
    dispatch_once(&XPCInterface_onceToken_0, &__block_literal_global_3);
  return (id)XPCInterface_interface_0;
}

void __56__AAAccountUserNotificationDaemonInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE54EE38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface_0;
  XPCInterface_interface_0 = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)XPCInterface_interface_0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_postAccountUserNotificationWith_completion_, 0, 0);

  objc_msgSend((id)XPCInterface_interface_0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_postAccountUserNotificationWith_completion_, 0, 1);
}

@end
