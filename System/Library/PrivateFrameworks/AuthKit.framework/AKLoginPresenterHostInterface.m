@implementation AKLoginPresenterHostInterface

+ (id)XPCInterface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (XPCInterface_onceToken_6 != -1)
    dispatch_once(&XPCInterface_onceToken_6, &__block_literal_global_23);
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)XPCInterface_interface_5, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_authenticationRequestFinishedWithResults_password_additionalData_error_, 0, 0);
  v10 = (id)XPCInterface_interface_5;

  return v10;
}

void __45__AKLoginPresenterHostInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE25EAC0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface_5;
  XPCInterface_interface_5 = v0;

}

@end
