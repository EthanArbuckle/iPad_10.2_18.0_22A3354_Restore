@implementation ASPublicKeyCredentialOperation

- (ASPublicKeyCredentialOperation)initWithRelyingPartyIdentifier:(id)a3 delegate:(id)a4 parentActivity:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  ASPublicKeyCredentialOperation *v11;
  uint64_t v12;
  NSString *relyingPartyIdentifier;
  uint64_t v14;
  NSUUID *uuid;
  dispatch_semaphore_t v16;
  OS_dispatch_semaphore *internalSemaphore;
  os_activity_t v18;
  OS_os_activity *activity;
  ASPublicKeyCredentialOperation *v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ASPublicKeyCredentialOperation;
  v11 = -[ASPublicKeyCredentialOperation init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    relyingPartyIdentifier = v11->_relyingPartyIdentifier;
    v11->_relyingPartyIdentifier = (NSString *)v12;

    objc_storeWeak((id *)&v11->_delegate, v9);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = objc_claimAutoreleasedReturnValue();
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v14;

    v16 = dispatch_semaphore_create(1);
    internalSemaphore = v11->_internalSemaphore;
    v11->_internalSemaphore = (OS_dispatch_semaphore *)v16;

    v18 = _os_activity_create(&dword_20E4D9000, "PublicKeyCredential operation", v10, OS_ACTIVITY_FLAG_DEFAULT);
    activity = v11->_activity;
    v11->_activity = (OS_os_activity *)v18;

    v20 = v11;
  }

  return v11;
}

- (NSDictionary)identifiersToAssertionResponses
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_identifiersToAssertionResponses, "copy");
}

- (void)mergeIdentifiersToAssertionResponses:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *identifiersToAssertionResponses;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_internalSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v5 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __71__ASPublicKeyCredentialOperation_mergeIdentifiersToAssertionResponses___block_invoke;
  v18[3] = &unk_24C94F558;
  v18[4] = self;
  objc_msgSend(v5, "setHandler:", v18);
  if (self->_identifiersToAssertionResponses)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    identifiersToAssertionResponses = (NSMutableDictionary *)v4;
    v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](identifiersToAssertionResponses, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(identifiersToAssertionResponses);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](identifiersToAssertionResponses, "objectForKeyedSubscript:", v11, (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_identifiersToAssertionResponses, "setObject:forKeyedSubscript:", v12, v11);

        }
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](identifiersToAssertionResponses, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v8);
    }
  }
  else
  {
    v13 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
    identifiersToAssertionResponses = self->_identifiersToAssertionResponses;
    self->_identifiersToAssertionResponses = v13;
  }

}

intptr_t __71__ASPublicKeyCredentialOperation_mergeIdentifiersToAssertionResponses___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)setPlatformAssertionSelectionCallback:(id)a3
{
  NSObject *internalSemaphore;
  id v5;
  void *v6;
  id selectPlatformAssertionCallback;

  internalSemaphore = self->_internalSemaphore;
  v5 = a3;
  dispatch_semaphore_wait(internalSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (void *)MEMORY[0x212BBEFEC](v5);

  selectPlatformAssertionCallback = self->_selectPlatformAssertionCallback;
  self->_selectPlatformAssertionCallback = v6;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_internalSemaphore);
}

- (void)setSecurityKeyAssertionSelectionCallback:(id)a3
{
  NSObject *internalSemaphore;
  id v5;
  void *v6;
  id selectSecurityKeyAssertionCallback;

  internalSemaphore = self->_internalSemaphore;
  v5 = a3;
  dispatch_semaphore_wait(internalSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (void *)MEMORY[0x212BBEFEC](v5);

  selectSecurityKeyAssertionCallback = self->_selectSecurityKeyAssertionCallback;
  self->_selectSecurityKeyAssertionCallback = v6;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_internalSemaphore);
}

- (void)selectPlatformAssertion:(id)a3
{
  id selectPlatformAssertionCallback;
  id v5;

  v5 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_internalSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_hasSelectedAssertion)
  {
    os_activity_apply((os_activity_t)self->_activity, &__block_literal_global_31);
  }
  else
  {
    self->_hasSelectedAssertion = 1;
    (*((void (**)(void))self->_selectPlatformAssertionCallback + 2))();
    selectPlatformAssertionCallback = self->_selectPlatformAssertionCallback;
    self->_selectPlatformAssertionCallback = 0;

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_internalSemaphore);
  }

}

void __58__ASPublicKeyCredentialOperation_selectPlatformAssertion___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __58__ASPublicKeyCredentialOperation_selectPlatformAssertion___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (void)selectSecurityKeyAssertion:(id)a3
{
  id selectSecurityKeyAssertionCallback;
  id v5;

  v5 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_internalSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_hasSelectedAssertion)
  {
    os_activity_apply((os_activity_t)self->_activity, &__block_literal_global_2_1);
  }
  else
  {
    self->_hasSelectedAssertion = 1;
    (*((void (**)(void))self->_selectSecurityKeyAssertionCallback + 2))();
    selectSecurityKeyAssertionCallback = self->_selectSecurityKeyAssertionCallback;
    self->_selectSecurityKeyAssertionCallback = 0;

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_internalSemaphore);
  }

}

void __61__ASPublicKeyCredentialOperation_selectSecurityKeyAssertion___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __58__ASPublicKeyCredentialOperation_selectPlatformAssertion___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (BOOL)hasTornDown
{
  BOOL hasTornDown;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_internalSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  hasTornDown = self->_hasTornDown;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_internalSemaphore);
  return hasTornDown;
}

- (BOOL)hasSelectedAssertion
{
  BOOL hasSelectedAssertion;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_internalSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  hasSelectedAssertion = self->_hasSelectedAssertion;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_internalSemaphore);
  return hasSelectedAssertion;
}

- (void)tearDownIfNecessary
{
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  ASPublicKeyCredentialOperation *v7;
  _QWORD v8[5];

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_internalSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v3 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__ASPublicKeyCredentialOperation_tearDownIfNecessary__block_invoke;
  v8[3] = &unk_24C94F558;
  v8[4] = self;
  objc_msgSend(v3, "setHandler:", v8);
  if (!self->_hasTornDown)
  {
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __53__ASPublicKeyCredentialOperation_tearDownIfNecessary__block_invoke_2;
    block[3] = &unk_24C94F5F8;
    v6 = v3;
    v7 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

intptr_t __53__ASPublicKeyCredentialOperation_tearDownIfNecessary__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __53__ASPublicKeyCredentialOperation_tearDownIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

    v2 = *(_QWORD *)(a1 + 40);
  }
  v6 = *(_QWORD *)(v2 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = 0;

    v2 = *(_QWORD *)(a1 + 40);
  }
  result = objc_msgSend(*(id *)(v2 + 72), "cancel");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 40) = 1;
  return result;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (ASPublicKeyCredentialManagerDelegate)delegate
{
  return (ASPublicKeyCredentialManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (_WKWebAuthenticationPanel)panel
{
  return self->_panel;
}

- (void)setPanel:(id)a3
{
  objc_storeStrong((id *)&self->_panel, a3);
}

- (NSString)sourceApplicationIdentifier
{
  return self->_sourceApplicationIdentifier;
}

- (void)setSourceApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)shouldRequireUserVerification
{
  return self->_shouldRequireUserVerification;
}

- (void)setShouldRequireUserVerification:(BOOL)a3
{
  self->_shouldRequireUserVerification = a3;
}

- (LAContext)authenticatedLAContext
{
  return self->_authenticatedLAContext;
}

- (void)setAuthenticatedLAContext:(id)a3
{
  objc_storeStrong((id *)&self->_authenticatedLAContext, a3);
}

- (NSError)overrideError
{
  return self->_overrideError;
}

- (void)setOverrideError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (WBSSavedAccountContext)savedAccountContext
{
  return self->_savedAccountContext;
}

- (void)setSavedAccountContext:(id)a3
{
  objc_storeStrong((id *)&self->_savedAccountContext, a3);
}

- (ASCPublicKeyCredentialCreationOptions)creationOptions
{
  return self->_creationOptions;
}

- (void)setCreationOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (ASCPublicKeyCredentialAssertionOptions)assertionOptions
{
  return self->_assertionOptions;
}

- (void)setAssertionOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSData)clientDataJSONForApps
{
  return self->_clientDataJSONForApps;
}

- (void)setClientDataJSONForApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)requestUsedNonEmptyAllowList
{
  return self->_requestUsedNonEmptyAllowList;
}

- (void)setRequestUsedNonEmptyAllowList:(BOOL)a3
{
  self->_requestUsedNonEmptyAllowList = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDataJSONForApps, 0);
  objc_storeStrong((id *)&self->_assertionOptions, 0);
  objc_storeStrong((id *)&self->_creationOptions, 0);
  objc_storeStrong((id *)&self->_savedAccountContext, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_overrideError, 0);
  objc_storeStrong((id *)&self->_authenticatedLAContext, 0);
  objc_storeStrong((id *)&self->_sourceApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_panel, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_selectSecurityKeyAssertionCallback, 0);
  objc_storeStrong(&self->_selectPlatformAssertionCallback, 0);
  objc_storeStrong((id *)&self->_identifiersToAssertionResponses, 0);
  objc_storeStrong((id *)&self->_internalSemaphore, 0);
}

void __58__ASPublicKeyCredentialOperation_selectPlatformAssertion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_20E4D9000, a1, a3, "Attempted to select assertion response multiple times.", a5, a6, a7, a8, 0);
}

@end
