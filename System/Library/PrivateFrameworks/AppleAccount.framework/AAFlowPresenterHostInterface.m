@implementation AAFlowPresenterHostInterface

+ (id)XPCInterface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (XPCInterface_onceToken != -1)
    dispatch_once(&XPCInterface_onceToken, &__block_literal_global_1);
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_flowFinishedWithError_completion_, 0, 1);
  v11 = (id)XPCInterface_interface;

  return v11;
}

void __44__AAFlowPresenterHostInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE535BD8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface;
  XPCInterface_interface = v0;

}

@end
