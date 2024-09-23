@implementation NSXPCInterface

void __83__NSXPCInterface_AuthenticationServicesExtras___as_credentialProviderHostInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A3F660);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_as_credentialProviderHostInterface_interface;
  _as_credentialProviderHostInterface_interface = v0;

  v2 = (void *)_as_credentialProviderHostInterface_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_prepareToCompleteRequestWithSelectedCredential_completion_, 0, 0);

  v4 = (void *)_as_credentialProviderHostInterface_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_prepareToCompleteAssertionRequestWithSelectedPasskeyCredential_completion_, 0, 0);

  v6 = (void *)_as_credentialProviderHostInterface_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_prepareToCompleteRegistrationRequestWithSelectedPasskeyCredential_completion_, 0, 0);

}

void __88__NSXPCInterface_AuthenticationServicesExtras___as_credentialProviderExtensionInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A508C0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_as_credentialProviderExtensionInterface_interface;
  _as_credentialProviderExtensionInterface_interface = v0;

  v2 = (void *)_as_credentialProviderExtensionInterface_interface;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_prepareCredentialListForServiceIdentifiers_completionHandler_, 0, 0);

  v6 = (void *)_as_credentialProviderExtensionInterface_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_provideCredentialWithoutUserInteractionForIdentity_, 0, 0);

  v8 = (void *)_as_credentialProviderExtensionInterface_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_prepareInterfaceToProvideCredentialForIdentity_completionHandler_, 0, 0);

  v10 = (void *)_as_credentialProviderExtensionInterface_interface;
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_prepareCredentialListForServiceIdentifiers_requestParameters_completionHandler_, 0, 0);

  v14 = (void *)_as_credentialProviderExtensionInterface_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_prepareCredentialListForServiceIdentifiers_requestParameters_completionHandler_, 1, 0);

  v16 = (void *)_as_credentialProviderExtensionInterface_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_prepareInterfaceForPasskeyRegistration_completionHandler_, 0, 0);

  v18 = (void *)MEMORY[0x24BDBCF20];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_as_credentialProviderExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_provideCredentialWithoutUserInteractionForRequest_, 0, 0);
  objc_msgSend((id)_as_credentialProviderExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_prepareInterfaceToProvideCredentialForRequest_completionHandler_, 0, 0);

}

void __84__NSXPCInterface_AuthenticationServicesExtras___as_accountModificationHostInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A2BCC8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_as_accountModificationHostInterface_interface;
  _as_accountModificationHostInterface_interface = v0;

}

void __89__NSXPCInterface_AuthenticationServicesExtras___as_accountModificationExtensionInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A41AF0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_as_accountModificationExtensionInterface_interface;
  _as_accountModificationExtensionInterface_interface = v0;

}

@end
