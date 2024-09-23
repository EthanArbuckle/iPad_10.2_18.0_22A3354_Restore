@implementation ASCAuthorizationPresenterHostInterface

+ (id)xpcInterface
{
  if (xpcInterface_onceToken_0 != -1)
    dispatch_once(&xpcInterface_onceToken_0, &__block_literal_global_6);
  return (id)xpcInterface_interface_0;
}

void __54__ASCAuthorizationPresenterHostInterface_xpcInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A43108);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)xpcInterface_interface_0;
  xpcInterface_interface_0 = v0;

  ASAllLoginChoiceClasses();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)xpcInterface_interface_0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_authorizationRequestInitiatedWithLoginChoice_authenticatedContext_completionHandler_, 0, 0);
  v3 = (void *)xpcInterface_interface_0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_authorizationRequestInitiatedWithLoginChoice_authenticatedContext_completionHandler_, 1, 0);

  v5 = (void *)xpcInterface_interface_0;
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_updateInterfaceWithLoginChoices_, 0, 0);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)xpcInterface_interface_0, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_authorizationRequestInitiatedWithLoginChoice_authenticatedContext_completionHandler_, 0, 1);
  objc_msgSend((id)xpcInterface_interface_0, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_authorizationRequestFinishedWithCredential_error_completionHandler_, 0, 0);
  objc_msgSend((id)xpcInterface_interface_0, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_validateUserEnteredPIN_completionHandler_, 0, 1);
  v13 = (void *)xpcInterface_interface_0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_startCABLEAuthenticationWithCompletionHandler_, 0, 1);

  v15 = (void *)xpcInterface_interface_0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_startCABLEAuthenticationWithCompletionHandler_, 1, 1);

}

@end
