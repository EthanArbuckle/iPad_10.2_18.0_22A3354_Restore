@implementation ASAccountAuthenticationModificationExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "_as_accountModificationHostInterface");
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "_as_accountModificationExtensionInterface");
}

- (void)getSignInWithAppleUpgradeAuthorizationWithState:(NSString *)state nonce:(NSString *)nonce completionHandler:(void *)completionHandler
{
  void *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v8 = completionHandler;
  v9 = nonce;
  v10 = state;
  -[ASAccountAuthenticationModificationExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __127__ASAccountAuthenticationModificationExtensionContext_getSignInWithAppleUpgradeAuthorizationWithState_nonce_completionHandler___block_invoke;
  v13[3] = &unk_24C950710;
  v13[4] = self;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "getSignInWithAppleAuthorizationWithState:nonce:completion:", v10, v9, v8);
}

uint64_t __127__ASAccountAuthenticationModificationExtensionContext_getSignInWithAppleUpgradeAuthorizationWithState_nonce_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelRequestWithError:", a2);
}

- (void)completeUpgradeToSignInWithAppleWithUserInfo:(NSDictionary *)userInfo
{
  NSDictionary *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = userInfo;
  -[ASAccountAuthenticationModificationExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __100__ASAccountAuthenticationModificationExtensionContext_completeUpgradeToSignInWithAppleWithUserInfo___block_invoke;
  v9[3] = &unk_24C950710;
  v9[4] = self;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __100__ASAccountAuthenticationModificationExtensionContext_completeUpgradeToSignInWithAppleWithUserInfo___block_invoke_2;
  v8[3] = &unk_24C94F558;
  v8[4] = self;
  objc_msgSend(v7, "prepareToCompleteUpgradeToSignInWithAppleWithUserInfo:completion:", v4, v8);

}

uint64_t __100__ASAccountAuthenticationModificationExtensionContext_completeUpgradeToSignInWithAppleWithUserInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelRequestWithError:", a2);
}

uint64_t __100__ASAccountAuthenticationModificationExtensionContext_completeUpgradeToSignInWithAppleWithUserInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeRequestReturningItems:completionHandler:", MEMORY[0x24BDBD1A8], 0);
}

- (void)completeChangePasswordRequestWithUpdatedCredential:(ASPasswordCredential *)updatedCredential userInfo:(NSDictionary *)userInfo
{
  NSDictionary *v6;
  ASPasswordCredential *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v6 = userInfo;
  v7 = updatedCredential;
  -[ASAccountAuthenticationModificationExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __115__ASAccountAuthenticationModificationExtensionContext_completeChangePasswordRequestWithUpdatedCredential_userInfo___block_invoke;
  v12[3] = &unk_24C950710;
  v12[4] = self;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __115__ASAccountAuthenticationModificationExtensionContext_completeChangePasswordRequestWithUpdatedCredential_userInfo___block_invoke_2;
  v11[3] = &unk_24C94F558;
  v11[4] = self;
  objc_msgSend(v10, "prepareToCompleteRequestWithUpdatedCredential:userInfo:completion:", v7, v6, v11);

}

uint64_t __115__ASAccountAuthenticationModificationExtensionContext_completeChangePasswordRequestWithUpdatedCredential_userInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelRequestWithError:", a2);
}

uint64_t __115__ASAccountAuthenticationModificationExtensionContext_completeChangePasswordRequestWithUpdatedCredential_userInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeRequestReturningItems:completionHandler:", MEMORY[0x24BDBD1A8], 0);
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
  ASAccountAuthenticationModificationExtensionContext *v11;
  _QWORD v12[5];

  v4 = error;
  -[ASAccountAuthenticationModificationExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__ASAccountAuthenticationModificationExtensionContext_cancelRequestWithError___block_invoke;
  v12[3] = &unk_24C950710;
  v12[4] = self;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __78__ASAccountAuthenticationModificationExtensionContext_cancelRequestWithError___block_invoke_2;
  v9[3] = &unk_24C94F5F8;
  v10 = v4;
  v11 = self;
  v8 = v4;
  objc_msgSend(v7, "prepareToCancelRequestWithError:completion:", v8, v9);

}

id __78__ASAccountAuthenticationModificationExtensionContext_cancelRequestWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASAccountAuthenticationModificationExtensionContext;
  return objc_msgSendSuper2(&v3, sel_cancelRequestWithError_, a2);
}

id __78__ASAccountAuthenticationModificationExtensionContext_cancelRequestWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)ASAccountAuthenticationModificationExtensionContext;
  return objc_msgSendSuper2(&v3, sel_cancelRequestWithError_, v1);
}

- (void)upgradeCredentialToSignInWithApple:(id)a3 serviceIdentifier:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id *v12;
  id *v13;
  id *v14;
  NSObject *v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ASAccountAuthenticationModificationExtensionContext _principalObject](self, "_principalObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __117__ASAccountAuthenticationModificationExtensionContext_upgradeCredentialToSignInWithApple_serviceIdentifier_userInfo___block_invoke;
      v26[3] = &unk_24C94F7E0;
      v12 = &v27;
      v27 = v11;
      v13 = &v28;
      v28 = v9;
      v14 = &v29;
      v29 = v8;
      v15 = MEMORY[0x24BDAC9B8];
      v16 = v26;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __117__ASAccountAuthenticationModificationExtensionContext_upgradeCredentialToSignInWithApple_serviceIdentifier_userInfo___block_invoke_3;
        v17[3] = &unk_24C950738;
        v12 = &v18;
        v18 = v11;
        v13 = &v19;
        v19 = v9;
        v14 = &v20;
        v20 = v8;
        v21 = v10;
        dispatch_async(MEMORY[0x24BDAC9B8], v17);

        goto LABEL_8;
      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __117__ASAccountAuthenticationModificationExtensionContext_upgradeCredentialToSignInWithApple_serviceIdentifier_userInfo___block_invoke_2;
      block[3] = &unk_24C94F7E0;
      v12 = &v23;
      v23 = v11;
      v13 = &v24;
      v24 = v9;
      v14 = &v25;
      v25 = v8;
      v15 = MEMORY[0x24BDAC9B8];
      v16 = block;
    }
    dispatch_async(v15, v16);
LABEL_8:

  }
}

uint64_t __117__ASAccountAuthenticationModificationExtensionContext_upgradeCredentialToSignInWithApple_serviceIdentifier_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareToConvertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __117__ASAccountAuthenticationModificationExtensionContext_upgradeCredentialToSignInWithApple_serviceIdentifier_userInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __117__ASAccountAuthenticationModificationExtensionContext_upgradeCredentialToSignInWithApple_serviceIdentifier_userInfo___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)prepareInterfaceToUpgradeCredentialToSignInWithApple:(id)a3 serviceIdentifier:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[ASAccountAuthenticationModificationExtensionContext _principalObject](self, "_principalObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __146__ASAccountAuthenticationModificationExtensionContext_prepareInterfaceToUpgradeCredentialToSignInWithApple_serviceIdentifier_userInfo_completion___block_invoke;
      block[3] = &unk_24C94F718;
      v23 = v14;
      v24 = v11;
      v25 = v10;
      v26 = v13;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      v15 = v23;
    }
    else
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __146__ASAccountAuthenticationModificationExtensionContext_prepareInterfaceToUpgradeCredentialToSignInWithApple_serviceIdentifier_userInfo_completion___block_invoke_2;
      v16[3] = &unk_24C9500F8;
      v17 = v14;
      v18 = v11;
      v19 = v10;
      v20 = v12;
      v21 = v13;
      dispatch_async(MEMORY[0x24BDAC9B8], v16);

      v15 = v17;
    }

  }
  else
  {
    dispatch_async(MEMORY[0x24BDAC9B8], v13);
  }

}

uint64_t __146__ASAccountAuthenticationModificationExtensionContext_prepareInterfaceToUpgradeCredentialToSignInWithApple_serviceIdentifier_userInfo_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareInterfaceToConvertAccountToSignInWithAppleForServiceIdentifier:existingCredential:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __146__ASAccountAuthenticationModificationExtensionContext_prepareInterfaceToUpgradeCredentialToSignInWithApple_serviceIdentifier_userInfo_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareInterfaceToConvertAccountToSignInWithAppleForServiceIdentifier:existingCredential:userInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)updatePasswordForServiceIdentifier:(id)a3 existingCredential:(id)a4 newPassword:(id)a5 userInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[ASAccountAuthenticationModificationExtensionContext _principalObject](self, "_principalObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __130__ASAccountAuthenticationModificationExtensionContext_updatePasswordForServiceIdentifier_existingCredential_newPassword_userInfo___block_invoke;
    block[3] = &unk_24C950760;
    v16 = v14;
    v17 = v10;
    v18 = v11;
    v19 = v12;
    v20 = v13;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __130__ASAccountAuthenticationModificationExtensionContext_updatePasswordForServiceIdentifier_existingCredential_newPassword_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changePasswordWithoutUserInteractionForServiceIdentifier:existingCredential:newPassword:userInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)prepareInterfaceToUpdatePasswordForServiceIdentifier:(id)a3 existingCredential:(id)a4 newPassword:(id)a5 userInfo:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[ASAccountAuthenticationModificationExtensionContext _principalObject](self, "_principalObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __159__ASAccountAuthenticationModificationExtensionContext_prepareInterfaceToUpdatePasswordForServiceIdentifier_existingCredential_newPassword_userInfo_completion___block_invoke;
    v18[3] = &unk_24C950788;
    v19 = v17;
    v20 = v12;
    v21 = v13;
    v22 = v14;
    v23 = v15;
    v24 = v16;
    dispatch_async(MEMORY[0x24BDAC9B8], v18);

  }
  else
  {
    dispatch_async(MEMORY[0x24BDAC9B8], v16);
  }

}

uint64_t __159__ASAccountAuthenticationModificationExtensionContext_prepareInterfaceToUpdatePasswordForServiceIdentifier_existingCredential_newPassword_userInfo_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareInterfaceToChangePasswordForServiceIdentifier:existingCredential:newPassword:userInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

- (void)cancelRequest
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD block[4];
  id v14;
  id v15;
  _QWORD v16[5];

  -[ASAccountAuthenticationModificationExtensionContext _principalObject](self, "_principalObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ASAccountAuthenticationModificationExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __68__ASAccountAuthenticationModificationExtensionContext_cancelRequest__block_invoke;
    v16[3] = &unk_24C950710;
    v16[4] = self;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __68__ASAccountAuthenticationModificationExtensionContext_cancelRequest__block_invoke_2;
    block[3] = &unk_24C94F5F8;
    v14 = v3;
    v15 = v6;
    v7 = v6;
    v8 = MEMORY[0x24BDAC9B8];
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_initWeak(&location, self);
    v9 = dispatch_time(0, 10000000000);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __68__ASAccountAuthenticationModificationExtensionContext_cancelRequest__block_invoke_3;
    v10[3] = &unk_24C94F530;
    objc_copyWeak(&v11, &location);
    dispatch_after(v9, v8, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

uint64_t __68__ASAccountAuthenticationModificationExtensionContext_cancelRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelRequestWithError:", a2);
}

uint64_t __68__ASAccountAuthenticationModificationExtensionContext_cancelRequest__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancelRequest");
  return objc_msgSend(*(id *)(a1 + 40), "dismissRequestUI");
}

void __68__ASAccountAuthenticationModificationExtensionContext_cancelRequest__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 1, 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "cancelRequestWithError:", v1);

  }
}

@end
