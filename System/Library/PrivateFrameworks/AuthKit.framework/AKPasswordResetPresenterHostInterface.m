@implementation AKPasswordResetPresenterHostInterface

+ (id)XPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (XPCInterface_onceToken_0 != -1)
    dispatch_once(&XPCInterface_onceToken_0, &__block_literal_global_2);
  v2 = (void *)XPCInterface_interface_0;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_passwordResetFinishedWithResult_error_completion_, 0, 0);

  return (id)XPCInterface_interface_0;
}

void __53__AKPasswordResetPresenterHostInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE270B18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface_0;
  XPCInterface_interface_0 = v0;

}

@end
