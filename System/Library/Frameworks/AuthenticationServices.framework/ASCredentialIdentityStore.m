@implementation ASCredentialIdentityStore

+ (ASCredentialIdentityStore)sharedStore
{
  if (sharedStore_onceToken != -1)
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_21);
  return (ASCredentialIdentityStore *)(id)sharedStore_store;
}

void __40__ASCredentialIdentityStore_sharedStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ASCredentialIdentityStore _initCredentialIdentityStore]([ASCredentialIdentityStore alloc], "_initCredentialIdentityStore");
  v1 = (void *)sharedStore_store;
  sharedStore_store = (uint64_t)v0;

}

- (id)_initCredentialIdentityStore
{
  ASCredentialIdentityStore *v2;
  SFCredentialProviderExtensionHelperProxy *v3;
  SFCredentialProviderExtensionHelperProxy *helperProxy;
  ASCredentialIdentityStore *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCredentialIdentityStore;
  v2 = -[ASCredentialIdentityStore init](&v7, sel_init);
  if (v2)
  {
    v3 = (SFCredentialProviderExtensionHelperProxy *)objc_alloc_init(MEMORY[0x24BE83028]);
    helperProxy = v2->_helperProxy;
    v2->_helperProxy = v3;

    v5 = v2;
  }

  return v2;
}

- (void)getCredentialIdentityStoreStateWithCompletion:(void *)completion
{
  void *v4;
  void *v5;
  SFCredentialProviderExtensionHelperProxy *helperProxy;
  _QWORD v7[4];
  id v8;

  v4 = completion;
  v5 = v4;
  if (v4)
  {
    helperProxy = self->_helperProxy;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __75__ASCredentialIdentityStore_getCredentialIdentityStoreStateWithCompletion___block_invoke;
    v7[3] = &unk_24C950E98;
    v8 = v4;
    -[SFCredentialProviderExtensionHelperProxy getCredentialProviderExtensionStateWithCompletion:](helperProxy, "getCredentialProviderExtensionStateWithCompletion:", v7);

  }
}

void __75__ASCredentialIdentityStore_getCredentialIdentityStoreStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  ASCredentialIdentityStoreState *v4;
  uint64_t v5;
  uint64_t v6;
  ASCredentialIdentityStoreState *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = [ASCredentialIdentityStoreState alloc];
  v5 = objc_msgSend(v3, "isEnabled");
  v6 = objc_msgSend(v3, "supportsIncrementalUpdates");

  v7 = -[ASCredentialIdentityStoreState initWithEnabledState:supportsIncrementalUpdates:](v4, "initWithEnabledState:supportsIncrementalUpdates:", v5, v6);
  (*(void (**)(uint64_t, ASCredentialIdentityStoreState *))(v2 + 16))(v2, v7);

}

- (void)saveCredentialIdentityEntries:(NSArray *)credentialIdentities completion:(void *)completion
{
  void *v6;
  SFCredentialProviderExtensionHelperProxy *helperProxy;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = completion;
  helperProxy = self->_helperProxy;
  safariCredentialIdentitiesFromCredentialIdentities(credentialIdentities);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__ASCredentialIdentityStore_saveCredentialIdentityEntries_completion___block_invoke;
  v10[3] = &unk_24C950AB8;
  v11 = v6;
  v9 = v6;
  -[SFCredentialProviderExtensionHelperProxy saveCredentialIdentities:completion:](helperProxy, "saveCredentialIdentities:completion:", v8, v10);

}

void __70__ASCredentialIdentityStore_saveCredentialIdentityEntries_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    if (v5 || (a2 & 1) != 0)
    {
      credentialIdentityStoreErrorFromSFExternalCredentialIdentityStoreError(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, a2, v11);

    }
    else
    {
      v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __70__ASCredentialIdentityStore_saveCredentialIdentityEntries_completion___block_invoke_cold_1();
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASCredentialIdentityStoreErrorDomain"), 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    }
  }

}

- (void)removeCredentialIdentityEntries:(NSArray *)credentialIdentities completion:(void *)completion
{
  void *v6;
  SFCredentialProviderExtensionHelperProxy *helperProxy;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = completion;
  helperProxy = self->_helperProxy;
  safariCredentialIdentitiesFromCredentialIdentities(credentialIdentities);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__ASCredentialIdentityStore_removeCredentialIdentityEntries_completion___block_invoke;
  v10[3] = &unk_24C950AB8;
  v11 = v6;
  v9 = v6;
  -[SFCredentialProviderExtensionHelperProxy removeCredentialIdentities:completion:](helperProxy, "removeCredentialIdentities:completion:", v8, v10);

}

void __72__ASCredentialIdentityStore_removeCredentialIdentityEntries_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    if (v5 || (a2 & 1) != 0)
    {
      credentialIdentityStoreErrorFromSFExternalCredentialIdentityStoreError(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, a2, v11);

    }
    else
    {
      v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __70__ASCredentialIdentityStore_saveCredentialIdentityEntries_completion___block_invoke_cold_1();
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASCredentialIdentityStoreErrorDomain"), 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    }
  }

}

- (void)removeAllCredentialIdentitiesWithCompletion:(void *)completion
{
  id v4;
  SFCredentialProviderExtensionHelperProxy *helperProxy;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = completion;
  helperProxy = self->_helperProxy;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__ASCredentialIdentityStore_removeAllCredentialIdentitiesWithCompletion___block_invoke;
  v7[3] = &unk_24C950AB8;
  v8 = v4;
  v6 = v4;
  -[SFCredentialProviderExtensionHelperProxy removeAllCredentialIdentitiesWithCompletion:](helperProxy, "removeAllCredentialIdentitiesWithCompletion:", v7);

}

void __73__ASCredentialIdentityStore_removeAllCredentialIdentitiesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    if (v5 || (a2 & 1) != 0)
    {
      credentialIdentityStoreErrorFromSFExternalCredentialIdentityStoreError(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, a2, v11);

    }
    else
    {
      v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __70__ASCredentialIdentityStore_saveCredentialIdentityEntries_completion___block_invoke_cold_1();
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASCredentialIdentityStoreErrorDomain"), 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    }
  }

}

- (void)replaceCredentialIdentityEntries:(NSArray *)newCredentialIdentities completion:(void *)completion
{
  void *v6;
  SFCredentialProviderExtensionHelperProxy *helperProxy;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = completion;
  helperProxy = self->_helperProxy;
  safariCredentialIdentitiesFromCredentialIdentities(newCredentialIdentities);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__ASCredentialIdentityStore_replaceCredentialIdentityEntries_completion___block_invoke;
  v10[3] = &unk_24C950AB8;
  v11 = v6;
  v9 = v6;
  -[SFCredentialProviderExtensionHelperProxy replaceCredentialIdentitiesWithIdentities:completion:](helperProxy, "replaceCredentialIdentitiesWithIdentities:completion:", v8, v10);

}

void __73__ASCredentialIdentityStore_replaceCredentialIdentityEntries_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    if (v5 || (a2 & 1) != 0)
    {
      credentialIdentityStoreErrorFromSFExternalCredentialIdentityStoreError(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, a2, v11);

    }
    else
    {
      v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __70__ASCredentialIdentityStore_saveCredentialIdentityEntries_completion___block_invoke_cold_1();
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASCredentialIdentityStoreErrorDomain"), 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    }
  }

}

- (void)getCredentialIdentitiesForService:(id)a3 credentialIdentityTypes:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  _BOOL8 v9;
  unint64_t v10;
  SFCredentialProviderExtensionHelperProxy *helperProxy;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  if (v13)
    v9 = objc_msgSend(v13, "type") == 1;
  else
    v9 = 0;
  if (a4)
    v10 = a4 & 7;
  else
    v10 = 7;
  helperProxy = self->_helperProxy;
  objc_msgSend(v13, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCredentialProviderExtensionHelperProxy fetchCredentialIdentitiesForService:serviceIdentifierType:credentialIdentityTypes:completion:](helperProxy, "fetchCredentialIdentitiesForService:serviceIdentifierType:credentialIdentityTypes:completion:", v12, v9, v10, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperProxy, 0);
}

void __70__ASCredentialIdentityStore_saveCredentialIdentityEntries_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_20E4D9000, v0, v1, "nil error returned for failed operation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
