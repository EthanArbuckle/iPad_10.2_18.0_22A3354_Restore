@implementation ASCredentialProviderExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "_as_credentialProviderHostInterface");
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "_as_credentialProviderExtensionInterface");
}

- (void)completeRequestWithSelectedCredential:(ASPasswordCredential *)credential completionHandler:(void *)completionHandler
{
  void *v6;
  ASPasswordCredential *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = completionHandler;
  v7 = credential;
  -[ASCredentialProviderExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __96__ASCredentialProviderExtensionContext_completeRequestWithSelectedCredential_completionHandler___block_invoke;
  v15[3] = &unk_24C951450;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __96__ASCredentialProviderExtensionContext_completeRequestWithSelectedCredential_completionHandler___block_invoke_2;
  v13[3] = &unk_24C9501B8;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "prepareToCompleteRequestWithSelectedCredential:completion:", v7, v13);

}

uint64_t __96__ASCredentialProviderExtensionContext_completeRequestWithSelectedCredential_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ASCredentialProviderExtensionContext;
  objc_msgSendSuper2(&v4, sel_cancelRequestWithError_, a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

id __96__ASCredentialProviderExtensionContext_completeRequestWithSelectedCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_completeRequestReturningItems_completionHandler_, MEMORY[0x24BDBD1A8], v1);
}

- (void)completeAssertionRequestWithSelectedPasskeyCredential:(ASPasskeyAssertionCredential *)credential completionHandler:(void *)completionHandler
{
  void *v6;
  ASPasskeyAssertionCredential *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = completionHandler;
  v7 = credential;
  -[ASCredentialProviderExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __112__ASCredentialProviderExtensionContext_completeAssertionRequestWithSelectedPasskeyCredential_completionHandler___block_invoke;
  v15[3] = &unk_24C951450;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __112__ASCredentialProviderExtensionContext_completeAssertionRequestWithSelectedPasskeyCredential_completionHandler___block_invoke_2;
  v13[3] = &unk_24C9501B8;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "prepareToCompleteAssertionRequestWithSelectedPasskeyCredential:completion:", v7, v13);

}

uint64_t __112__ASCredentialProviderExtensionContext_completeAssertionRequestWithSelectedPasskeyCredential_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ASCredentialProviderExtensionContext;
  objc_msgSendSuper2(&v4, sel_cancelRequestWithError_, a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

id __112__ASCredentialProviderExtensionContext_completeAssertionRequestWithSelectedPasskeyCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_completeRequestReturningItems_completionHandler_, MEMORY[0x24BDBD1A8], v1);
}

- (void)completeRegistrationRequestWithSelectedPasskeyCredential:(ASPasskeyRegistrationCredential *)credential completionHandler:(void *)completionHandler
{
  void *v6;
  ASPasskeyRegistrationCredential *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = completionHandler;
  v7 = credential;
  -[ASCredentialProviderExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __115__ASCredentialProviderExtensionContext_completeRegistrationRequestWithSelectedPasskeyCredential_completionHandler___block_invoke;
  v15[3] = &unk_24C951450;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __115__ASCredentialProviderExtensionContext_completeRegistrationRequestWithSelectedPasskeyCredential_completionHandler___block_invoke_2;
  v13[3] = &unk_24C9501B8;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "prepareToCompleteRegistrationRequestWithSelectedPasskeyCredential:completion:", v7, v13);

}

uint64_t __115__ASCredentialProviderExtensionContext_completeRegistrationRequestWithSelectedPasskeyCredential_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ASCredentialProviderExtensionContext;
  objc_msgSendSuper2(&v4, sel_cancelRequestWithError_, a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

id __115__ASCredentialProviderExtensionContext_completeRegistrationRequestWithSelectedPasskeyCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_completeRequestReturningItems_completionHandler_, MEMORY[0x24BDBD1A8], v1);
}

- (void)completeOneTimeCodeRequestWithSelectedCredential:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[ASCredentialProviderExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __107__ASCredentialProviderExtensionContext_completeOneTimeCodeRequestWithSelectedCredential_completionHandler___block_invoke;
  v15[3] = &unk_24C951450;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __107__ASCredentialProviderExtensionContext_completeOneTimeCodeRequestWithSelectedCredential_completionHandler___block_invoke_2;
  v13[3] = &unk_24C9501B8;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "prepareToCompleteOneTimeCodeRequestWithSelectedCredential:completion:", v7, v13);

}

uint64_t __107__ASCredentialProviderExtensionContext_completeOneTimeCodeRequestWithSelectedCredential_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ASCredentialProviderExtensionContext;
  objc_msgSendSuper2(&v4, sel_cancelRequestWithError_, a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

id __107__ASCredentialProviderExtensionContext_completeOneTimeCodeRequestWithSelectedCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_completeRequestReturningItems_completionHandler_, MEMORY[0x24BDBD1A8], v1);
}

- (void)completeRequestWithTextToInsert:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  ASCredentialProviderExtensionContext *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  -[ASCredentialProviderExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __90__ASCredentialProviderExtensionContext_completeRequestWithTextToInsert_completionHandler___block_invoke;
  v20[3] = &unk_24C951450;
  v20[4] = self;
  v10 = v7;
  v21 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __90__ASCredentialProviderExtensionContext_completeRequestWithTextToInsert_completionHandler___block_invoke_2;
  v15[3] = &unk_24C951478;
  v16 = v11;
  v17 = v6;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v6;
  v14 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

uint64_t __90__ASCredentialProviderExtensionContext_completeRequestWithTextToInsert_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ASCredentialProviderExtensionContext;
  objc_msgSendSuper2(&v4, sel_cancelRequestWithError_, a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __90__ASCredentialProviderExtensionContext_completeRequestWithTextToInsert_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __90__ASCredentialProviderExtensionContext_completeRequestWithTextToInsert_completionHandler___block_invoke_3;
  v5[3] = &unk_24C9501B8;
  v4 = *(id *)(a1 + 56);
  v5[4] = *(_QWORD *)(a1 + 48);
  v6 = v4;
  objc_msgSend(v2, "prepareToCompleteRequestWithSelectedText:completion:", v3, v5);

}

id __90__ASCredentialProviderExtensionContext_completeRequestWithTextToInsert_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_completeRequestReturningItems_completionHandler_, MEMORY[0x24BDBD1A8], v1);
}

- (void)cancelRequestWithError:(NSError *)error
{
  NSError *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSError *v8;
  _QWORD v9[4];
  NSError *v10;
  ASCredentialProviderExtensionContext *v11;
  _QWORD v12[5];

  v4 = error;
  -[ASCredentialProviderExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__ASCredentialProviderExtensionContext_cancelRequestWithError___block_invoke;
  v12[3] = &unk_24C950710;
  v12[4] = self;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __63__ASCredentialProviderExtensionContext_cancelRequestWithError___block_invoke_2;
  v9[3] = &unk_24C94F5F8;
  v10 = v4;
  v11 = self;
  v8 = v4;
  objc_msgSend(v7, "prepareToCancelRequestWithError:completion:", v8, v9);

}

id __63__ASCredentialProviderExtensionContext_cancelRequestWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_cancelRequestWithError_, a2);
}

id __63__ASCredentialProviderExtensionContext_cancelRequestWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_cancelRequestWithError_, v1);
}

- (void)completeExtensionConfigurationRequest
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[ASCredentialProviderExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__ASCredentialProviderExtensionContext_completeExtensionConfigurationRequest__block_invoke;
  v7[3] = &unk_24C950710;
  v7[4] = self;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __77__ASCredentialProviderExtensionContext_completeExtensionConfigurationRequest__block_invoke_2;
  v6[3] = &unk_24C94F558;
  v6[4] = self;
  objc_msgSend(v5, "prepareToCompleteExtensionConfigurationRequestWithCompletion:", v6);

}

id __77__ASCredentialProviderExtensionContext_completeExtensionConfigurationRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_cancelRequestWithError_, a2);
}

id __77__ASCredentialProviderExtensionContext_completeExtensionConfigurationRequest__block_invoke_2(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v2, sel_completeRequestReturningItems_completionHandler_, MEMORY[0x24BDBD1A8], 0);
}

- (void)prepareCredentialListForServiceIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[ASCredentialProviderExtensionContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __101__ASCredentialProviderExtensionContext_prepareCredentialListForServiceIdentifiers_completionHandler___block_invoke;
    block[3] = &unk_24C94F6C8;
    v10 = v8;
    v11 = v6;
    v12 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    dispatch_async(MEMORY[0x24BDAC9B8], v7);
  }

}

uint64_t __101__ASCredentialProviderExtensionContext_prepareCredentialListForServiceIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareCredentialListForServiceIdentifiers:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(MEMORY[0x24BDE57D8], "addCommitHandler:forPhase:", *(_QWORD *)(a1 + 48), 2);
}

- (void)prepareCredentialListForServiceIdentifiers:(id)a3 requestParameters:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ASCredentialProviderExtensionContext _principalObject](self, "_principalObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __119__ASCredentialProviderExtensionContext_prepareCredentialListForServiceIdentifiers_requestParameters_completionHandler___block_invoke;
    v12[3] = &unk_24C94F718;
    v13 = v11;
    v14 = v8;
    v15 = v9;
    v16 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);

  }
  else
  {
    dispatch_async(MEMORY[0x24BDAC9B8], v10);
  }

}

uint64_t __119__ASCredentialProviderExtensionContext_prepareCredentialListForServiceIdentifiers_requestParameters_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareCredentialListForServiceIdentifiers:requestParameters:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(MEMORY[0x24BDE57D8], "addCommitHandler:forPhase:", *(_QWORD *)(a1 + 56), 2);
}

- (void)prepareOneTimeCodeCredentialListForServiceIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[ASCredentialProviderExtensionContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __112__ASCredentialProviderExtensionContext_prepareOneTimeCodeCredentialListForServiceIdentifiers_completionHandler___block_invoke;
    block[3] = &unk_24C94F6C8;
    v10 = v8;
    v11 = v6;
    v12 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    dispatch_async(MEMORY[0x24BDAC9B8], v7);
  }

}

uint64_t __112__ASCredentialProviderExtensionContext_prepareOneTimeCodeCredentialListForServiceIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareOneTimeCodeCredentialListForServiceIdentifiers:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(MEMORY[0x24BDE57D8], "addCommitHandler:forPhase:", *(_QWORD *)(a1 + 48), 2);
}

- (void)prepareInterfaceForUserChoosingTextToInsert
{
  void *v2;
  _QWORD block[4];
  id v4;

  -[ASCredentialProviderExtensionContext _principalObject](self, "_principalObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__ASCredentialProviderExtensionContext_prepareInterfaceForUserChoosingTextToInsert__block_invoke;
    block[3] = &unk_24C94F558;
    v4 = v2;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __83__ASCredentialProviderExtensionContext_prepareInterfaceForUserChoosingTextToInsert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareInterfaceForUserChoosingTextToInsert");
}

- (void)provideCredentialWithoutUserInteractionForIdentity:(id)a3
{
  id v4;

  +[ASPasswordCredentialRequest requestWithCredentialIdentity:](ASPasswordCredentialRequest, "requestWithCredentialIdentity:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCredentialProviderExtensionContext provideCredentialWithoutUserInteractionForRequest:](self, "provideCredentialWithoutUserInteractionForRequest:", v4);

}

- (void)provideCredentialWithoutUserInteractionForRequest:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  -[ASCredentialProviderExtensionContext _principalObject](self, "_principalObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __90__ASCredentialProviderExtensionContext_provideCredentialWithoutUserInteractionForRequest___block_invoke;
    v6[3] = &unk_24C94F5F8;
    v7 = v5;
    v8 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
}

uint64_t __90__ASCredentialProviderExtensionContext_provideCredentialWithoutUserInteractionForRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "provideCredentialWithoutUserInteractionForRequest:", *(_QWORD *)(a1 + 40));
}

- (void)prepareInterfaceToProvideCredentialForIdentity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[ASPasswordCredentialRequest requestWithCredentialIdentity:](ASPasswordCredentialRequest, "requestWithCredentialIdentity:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCredentialProviderExtensionContext prepareInterfaceToProvideCredentialForRequest:completionHandler:](self, "prepareInterfaceToProvideCredentialForRequest:completionHandler:", v7, v6);

}

- (void)prepareInterfaceToProvideCredentialForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[ASCredentialProviderExtensionContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__ASCredentialProviderExtensionContext_prepareInterfaceToProvideCredentialForRequest_completionHandler___block_invoke;
    block[3] = &unk_24C94F6C8;
    v10 = v8;
    v11 = v6;
    v12 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    dispatch_async(MEMORY[0x24BDAC9B8], v7);
  }

}

uint64_t __104__ASCredentialProviderExtensionContext_prepareInterfaceToProvideCredentialForRequest_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareInterfaceToProvideCredentialForRequest:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(MEMORY[0x24BDE57D8], "addCommitHandler:forPhase:", *(_QWORD *)(a1 + 48), 2);
}

- (void)prepareInterfaceForPasskeyRegistration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[ASCredentialProviderExtensionContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __97__ASCredentialProviderExtensionContext_prepareInterfaceForPasskeyRegistration_completionHandler___block_invoke;
    block[3] = &unk_24C94F6C8;
    v10 = v8;
    v11 = v6;
    v12 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    dispatch_async(MEMORY[0x24BDAC9B8], v7);
  }

}

uint64_t __97__ASCredentialProviderExtensionContext_prepareInterfaceForPasskeyRegistration_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareInterfaceForPasskeyRegistration:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(MEMORY[0x24BDE57D8], "addCommitHandler:forPhase:", *(_QWORD *)(a1 + 48), 2);
}

- (void)prepareInterfaceForExtensionConfiguration
{
  void *v2;
  _QWORD block[4];
  id v4;

  -[ASCredentialProviderExtensionContext _principalObject](self, "_principalObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__ASCredentialProviderExtensionContext_prepareInterfaceForExtensionConfiguration__block_invoke;
    block[3] = &unk_24C94F558;
    v4 = v2;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __81__ASCredentialProviderExtensionContext_prepareInterfaceForExtensionConfiguration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareInterfaceForExtensionConfiguration");
}

- (void)performPasskeyRegistrationWithoutUserInteractionIfPossible:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  -[ASCredentialProviderExtensionContext _principalObject](self, "_principalObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __99__ASCredentialProviderExtensionContext_performPasskeyRegistrationWithoutUserInteractionIfPossible___block_invoke;
    v7[3] = &unk_24C94F5F8;
    v8 = v5;
    v9 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ASCredentialProviderExtensionContext performPasskeyRegistrationWithoutUserInteractionIfPossible:].cold.1(v6);
  }

}

uint64_t __99__ASCredentialProviderExtensionContext_performPasskeyRegistrationWithoutUserInteractionIfPossible___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performPasskeyRegistrationWithoutUserInteractionIfPossible:", *(_QWORD *)(a1 + 40));
}

- (void)performPasskeyRegistrationWithoutUserInteractionIfPossible:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_20E4D9000, v1, OS_LOG_TYPE_ERROR, "Found principal object of unexpected class %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
