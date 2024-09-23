@implementation AKAuthorizationPresenterHostInterface

+ (id)XPCInterface
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  if (XPCInterface_onceToken_2 != -1)
    dispatch_once(&XPCInterface_onceToken_2, &__block_literal_global_10);
  v19 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v18, v17, v16, v15, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_authorizationRequestInitiatedWithUserProvidedInformation_completion_, 0, 0);
  v13 = (id)XPCInterface_interface_2;

  return v13;
}

void __53__AKAuthorizationPresenterHostInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE270C38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface_2;
  XPCInterface_interface_2 = v0;

}

@end
