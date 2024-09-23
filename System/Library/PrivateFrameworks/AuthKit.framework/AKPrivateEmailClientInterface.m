@implementation AKPrivateEmailClientInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_13 != -1)
    dispatch_once(&XPCInterface_onceToken_13, &__block_literal_global_51);
  return (id)XPCInterface_interface_12;
}

void __45__AKPrivateEmailClientInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE267360);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface_12;
  XPCInterface_interface_12 = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)XPCInterface_interface_12, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_presentPrivateEmailUIForContext_completion_, 0, 0);
  v10 = (void *)XPCInterface_interface_12;
  objc_msgSend(v12, "setByAddingObject:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_presentPrivateEmailUIForContext_completion_, 0, 1);

}

@end
