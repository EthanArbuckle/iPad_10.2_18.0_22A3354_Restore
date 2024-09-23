@implementation ASCAgent

- (ASCAgent)initWithTrafficController:(id)a3 connection:(id)a4 publicKeyCredentialManager:(id)a5 signInEventCollector:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ASCAgent *v15;
  NSObject *v16;
  os_activity_t v17;
  OS_os_activity *authorizationActivity;
  dispatch_semaphore_t v19;
  OS_dispatch_semaphore *internalSemaphore;
  uint64_t v21;
  NSUUID *authorizationTrafficControllerToken;
  char HasEntitlement;
  void *v24;
  NSMutableArray *v25;
  NSMutableArray *test_credentialProviderExtensionLoginChoices;
  NSObject *v27;
  ASCAgent *v28;
  ASCAgent *v29;
  _QWORD block[4];
  ASCAgent *v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[16];
  __int128 v36;
  objc_super v37;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v37.receiver = self;
  v37.super_class = (Class)ASCAgent;
  v15 = -[ASCAgent init](&v37, sel_init);
  if (v15)
  {
    v16 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20E648000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AuthorizationRequestReceivedToShowingUI", ", buf, 2u);
    }
    v17 = _os_activity_create(&dword_20E648000, "ASCAgent request", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    authorizationActivity = v15->_authorizationActivity;
    v15->_authorizationActivity = (OS_os_activity *)v17;

    v19 = dispatch_semaphore_create(1);
    internalSemaphore = v15->_internalSemaphore;
    v15->_internalSemaphore = (OS_dispatch_semaphore *)v19;

    objc_storeStrong((id *)&v15->_authorizationTrafficController, a3);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v21 = objc_claimAutoreleasedReturnValue();
    authorizationTrafficControllerToken = v15->_authorizationTrafficControllerToken;
    v15->_authorizationTrafficControllerToken = (NSUUID *)v21;

    objc_storeStrong((id *)&v15->_connection, a4);
    objc_storeStrong((id *)&v15->_publicKeyCredentialManager, a5);
    objc_storeStrong((id *)&v15->_signInEventCollector, a6);
    *(_OWORD *)buf = 0u;
    v36 = 0u;
    if (v12)
      objc_msgSend(v12, "auditToken");
    v33 = *(_OWORD *)buf;
    v34 = v36;
    if ((WBSAuditTokenHasEntitlement() & 1) != 0
      || (v33 = *(_OWORD *)buf, v34 = v36, (WBSAuditTokenHasEntitlement() & 1) != 0))
    {
      HasEntitlement = 1;
    }
    else
    {
      v33 = *(_OWORD *)buf;
      v34 = v36;
      HasEntitlement = WBSAuditTokenHasEntitlement();
    }
    v15->_isClientEntitledWebBrowser = HasEntitlement;
    v33 = *(_OWORD *)buf;
    v34 = v36;
    v15->_isClientEntitledInternalProcess = WBSAuditTokenHasEntitlement();
    objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addWeakObserver:", v15);

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    test_credentialProviderExtensionLoginChoices = v15->_test_credentialProviderExtensionLoginChoices;
    v15->_test_credentialProviderExtensionLoginChoices = v25;

    v27 = v15->_authorizationActivity;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __97__ASCAgent_initWithTrafficController_connection_publicKeyCredentialManager_signInEventCollector___block_invoke;
    block[3] = &unk_24C97E868;
    v28 = v15;
    v32 = v28;
    os_activity_apply(v27, block);
    v29 = v28;

  }
  return v15;
}

void __97__ASCAgent_initWithTrafficController_connection_publicKeyCredentialManager_signInEventCollector___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 134349056;
    v5 = v3;
    _os_log_impl(&dword_20E648000, v2, OS_LOG_TYPE_DEFAULT, "Initializing ASCAgent %{public}p.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)performAuthorizationRequestsForContext:(id)a3 withCompletionHandler:(id)a4
{
  -[ASCAgent performAuthorizationRequestsForContext:withPresenter:completionHandler:](self, "performAuthorizationRequestsForContext:withPresenter:completionHandler:", a3, 0, a4);
}

- (void)performAuthorizationRequestsForContext:(id)a3 withPresenter:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *authorizationActivity;
  uint64_t v13;
  id v14;
  NSObject *internalSemaphore;
  dispatch_time_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  ASCAgent *v24;
  id v25;
  id v26;
  _QWORD v27[5];
  _QWORD block[4];
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_requestPresenter, a4);
  authorizationActivity = self->_authorizationActivity;
  v13 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke;
  block[3] = &unk_24C97E868;
  v14 = v8;
  v29 = v14;
  os_activity_apply(authorizationActivity, block);
  internalSemaphore = self->_internalSemaphore;
  v16 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(internalSemaphore, v16))
    v17 = &__block_literal_global_0;
  else
    v17 = &__block_literal_global_43;
  os_activity_apply((os_activity_t)self->_authorizationActivity, v17);
  v18 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v27[0] = v13;
  v27[1] = 3221225472;
  v27[2] = __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_45;
  v27[3] = &unk_24C97E868;
  v27[4] = self;
  objc_msgSend(v18, "setHandler:", v27);
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_47;
  v22[3] = &unk_24C97E9C8;
  v23 = v18;
  v24 = self;
  v25 = v11;
  v26 = v10;
  v19 = v11;
  v20 = v10;
  v21 = v18;
  -[ASCAgent _prepareForAuthorizationRequestsForContext:clientConnection:withPresentationHandler:](self, "_prepareForAuthorizationRequestsForContext:clientConnection:withPresentationHandler:", v14, v19, v22);

}

uint64_t __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_20E648000, v2, OS_LOG_TYPE_INFO, "Beginning request: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "logRequest");
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_41()
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
    __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_41_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_42()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[ASCAgent performAuthorizationRequestsForContext:withPresenter:completionHandler:]_block_invoke";
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_INFO, "Acquired lock for %s", (uint8_t *)&v1, 0xCu);
  }
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_45(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 184));
  os_activity_apply(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 176), &__block_literal_global_46);
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_2()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[ASCAgent performAuthorizationRequestsForContext:withPresenter:completionHandler:]_block_invoke_2";
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_INFO, "Released lock for %s", (uint8_t *)&v1, 0xCu);
  }
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD block[4];
  id v22;

  v20 = a2;
  v5 = a3;
  v6 = v5;
  if (!v20)
  {
    v16 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 176);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_2_48;
    block[3] = &unk_24C97E868;
    v22 = v5;
    os_activity_apply(v16, block);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    goto LABEL_15;
  }
  objc_msgSend(v20, "savedAccountContext");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 88);
  *(_QWORD *)(v8 + 88) = v7;

  v10 = objc_msgSend(v20, "requestStyle");
  if (v10 == 2)
  {
    v17 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v15);
  }
  else if (v10 == 1)
  {
    v18 = _Block_copy(*(const void **)(a1 + 56));
    v19 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(v19 + 96);
    *(_QWORD *)(v19 + 96) = v18;
  }
  else
  {
    if (v10)
      goto LABEL_13;
    v11 = _Block_copy(*(const void **)(a1 + 56));
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 96);
    *(_QWORD *)(v12 + 96) = v11;

    v14 = *(_QWORD **)(a1 + 40);
    if (v14[9])
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE0BE88], "processHandleForNSXPCConnection:", *(_QWORD *)(a1 + 48));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD **)(a1 + 40);
    }
    objc_msgSend(v14, "_presentAuthorizationRequestWithContext:implicitlySelectedLoginChoice:forProcess:completionHandler:", v20, 0, v15, *(_QWORD *)(a1 + 56), v20);
  }

LABEL_13:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "test_runBlockToRunAfterReceivingRequest");
LABEL_15:

}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_2_48(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_2_48_cold_1(a1, v2);
}

- (void)performSilentAuthorizationRequestsForContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "requestStyle") == 2)
  {
    v15 = 0;
    v9 = -[ASCAgent _canCreateICloudKeychainPasskeyPreflightWithError:](self, "_canCreateICloudKeychainPasskeyPreflightWithError:", &v15);
    v10 = v15;
    if (v9)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke;
      v12[3] = &unk_24C97EAC8;
      v12[4] = self;
      v14 = v7;
      v13 = v8;
      -[ASCAgent _prepareForAuthorizationRequestsForContext:clientConnection:withPresentationHandler:](self, "_prepareForAuthorizationRequestsForContext:clientConnection:withPresentationHandler:", v6, v13, v12);

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v10);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(void *, _QWORD, void *);
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  ASCAuthorizationPresentationContext *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  id *v35;
  id *v36;
  void *v37;
  _QWORD v38[5];
  ASCAuthorizationPresentationContext *v39;
  id v40;
  void (**v41)(void *, _QWORD, void *);
  _QWORD v42[5];
  ASCAuthorizationPresentationContext *v43;
  id v44;
  void (**v45)(void *, _QWORD, void *);
  _QWORD v46[4];
  id v47;
  _BYTE v48[32];
  _QWORD aBlock[5];
  id v50;
  _QWORD block[4];
  id v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  _QWORD v56[4];

  v56[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_54;
    aBlock[3] = &unk_24C97EA18;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v50 = *(id *)(a1 + 48);
    v9 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
    v10 = *(void **)(a1 + 40);
    if (v10)
      objc_msgSend(v10, "auditToken");
    else
      memset(v48, 0, sizeof(v48));
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v48, 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ASCAuthorizationPresentationContext initWithRequestContext:appIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:]([ASCAuthorizationPresentationContext alloc], "initWithRequestContext:appIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:", v5, 0, 1, v13);
    objc_msgSend(*(id *)(a1 + 32), "_configureLoginChoicesForPresentationContext:withRequestContext:", v14, v5);
    if (objc_msgSend(v5, "isRegistrationRequest"))
    {
      -[ASCAuthorizationPresentationContext loginChoices](v14, "loginChoices");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safari_firstObjectPassingTest:", &__block_literal_global_59);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v16, "isRegistrationRequest") & 1) == 0)
      {
        v21 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
        v46[0] = v8;
        v46[1] = 3221225472;
        v46[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_4;
        v46[3] = &unk_24C97E868;
        v47 = v16;
        v16 = v16;
        os_activity_apply(v21, v46);
        v22 = (void *)MEMORY[0x24BDD1540];
        v55 = *MEMORY[0x24BDD0FD8];
        v56[0] = CFSTR("Found an unexpected credential in conditional registration request.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, 0, v24);

        goto LABEL_26;
      }

    }
    else
    {
      v17 = *(void **)(a1 + 32);
      -[ASCAuthorizationPresentationContext loginChoices](v14, "loginChoices");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_implicitlySelectAssertionLoginChoiceFromChoices:forContext:", v18, v5);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        os_activity_apply(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 176), &__block_literal_global_65);
        v25 = (void *)MEMORY[0x24BDD1540];
        v53 = *MEMORY[0x24BDD0FD8];
        v54 = CFSTR("Could not find the requested credential.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v16);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v9[2](v9, 0, v15);
        goto LABEL_26;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v16;
      if (objc_msgSend(v15, "isRegistrationRequest"))
      {
        objc_msgSend(v5, "setIsConditionalRegistrationRequest:", 1);
        objc_msgSend(*(id *)(a1 + 32), "_bundleIDFromAppID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isEqualToString:", CFSTR("AuthenticationServicesCoreUnitTests")))
        {
          objc_msgSend(MEMORY[0x24BDD1488], "safari_safariApplicationPlatformBundleIdentifier");
          v20 = objc_claimAutoreleasedReturnValue();

          v37 = (void *)v20;
        }
        else
        {
          v37 = v19;
        }
        v27 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(v27 + 80)
          || *(_BYTE *)(v27 + 81)
          && (v32 = objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.sfapp")),
              v27 = *(_QWORD *)(a1 + 32),
              (v32 & 1) == 0))
        {
          v34 = *(void **)(v27 + 112);
          objc_msgSend(v15, "userVisibleName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "relyingPartyIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = v8;
          v42[1] = 3221225472;
          v42[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_73;
          v42[3] = &unk_24C97EAA0;
          v42[4] = *(_QWORD *)(a1 + 32);
          v36 = (id *)&v43;
          v43 = v14;
          v35 = &v44;
          v44 = v5;
          v30 = (id *)&v45;
          v45 = v9;
          v31 = v37;
          objc_msgSend(v34, "providerForRecentlyFilledCredentialWithUsername:forRelyingPartyIdentifier:inAppWithBundleIdentifier:completionHandler:", v28, v29, v37, v42);

        }
        else
        {
          v33 = *(void **)(v27 + 112);
          objc_msgSend(v15, "userVisibleName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = v8;
          v38[1] = 3221225472;
          v38[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_75;
          v38[3] = &unk_24C97EAA0;
          v38[4] = *(_QWORD *)(a1 + 32);
          v36 = (id *)&v39;
          v39 = v14;
          v35 = &v40;
          v40 = v5;
          v30 = (id *)&v41;
          v41 = v9;
          v31 = v37;
          objc_msgSend(v33, "providerForRecentlyFilledCredentialWithUsername:forAppWithBundleIdentifier:completionHandler:", v28, v37, v38);
        }

        v16 = v15;
        goto LABEL_26;
      }

    }
    v26 = *(void **)(a1 + 32);
    objc_msgSend(v5, "authenticatedContext");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "userSelectedLoginChoice:authenticatedContext:completionHandler:", v16, v15, v9);
LABEL_26:

    v12 = v50;
    goto LABEL_27;
  }
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2;
  block[3] = &unk_24C97E868;
  v52 = v6;
  os_activity_apply(v11, block);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v12 = v52;
LABEL_27:

}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_2_48_cold_1(a1, v2);
}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_authorizationCompletedWithCredential:error:", v5, v6);
  v7 = *(_QWORD **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = v7[8];
  v10 = (void *)v7[1];
  v11 = v7[2];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_55;
  v14[3] = &unk_24C97E9F0;
  v16 = v6;
  v17 = v8;
  v15 = v5;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v10, "endAuthorizationForAppIdentifier:token:clearanceHandler:", v9, v11, v14);

}

uint64_t __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_55(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isRegistrationRequest");
  else
    v3 = 0;

  return v3;
}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_4()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_4_cold_1();
}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_64()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_64_cold_1();
}

uint64_t __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_73(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestConditionalRegistrationOnProvider:presentationContext:requestContext:completionHandler:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_75(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestConditionalRegistrationOnProvider:presentationContext:requestContext:completionHandler:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_requestConditionalRegistrationOnProvider:(id)a3 presentationContext:(id)a4 requestContext:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE82F68]))
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_78;
      v24[3] = &unk_24C97EB78;
      v24[4] = self;
      v28 = v13;
      v29 = &v30;
      v25 = v11;
      v26 = v10;
      v27 = v12;
      objc_msgSend(v22, "getExtensionWithBundleID:completion:", v26, v24);

      goto LABEL_9;
    }
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_84);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 12, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v23);
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v11, "loginChoices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safari_firstObjectPassingTest:", &__block_literal_global_76);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v31[5];
  v31[5] = v15;

  objc_msgSend((id)v31[5], "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v31[5], "relyingPartyIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ASCAgent _canPerformConditionalRegistrationInICloudKeychainForUsername:relyingParty:](self, "_canPerformConditionalRegistrationInICloudKeychainForUsername:relyingParty:", v17, v18);

  if (!v19)
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_77);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 2, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v23);
    goto LABEL_8;
  }
  v20 = v31[5];
  objc_msgSend(v12, "authenticatedContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAgent userSelectedLoginChoice:authenticatedContext:completionHandler:](self, "userSelectedLoginChoice:authenticatedContext:completionHandler:", v20, v21, v13);

LABEL_9:
  _Block_object_dispose(&v30, 8);

}

uint64_t __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "loginChoiceKind") == 2)
    v3 = objc_msgSend(v2, "isExternal") ^ 1;
  else
    v3 = 0;

  return v3;
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_cold_1();
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_78(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = (void *)MEMORY[0x24BE83030];
  v4 = a2;
  objc_msgSend(v3, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "extensionSupportsConditionalPasskeyRegistration:", v4);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "loginChoices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_81;
    v14[3] = &unk_24C97EB50;
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v7, "safari_firstObjectPassingTest:", v14);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(MEMORY[0x24BE0BE88], "processHandleForNSXPCConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_presentAuthorizationRequestWithContext:implicitlySelectedLoginChoice:forProcess:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v11, *(_QWORD *)(a1 + 64));

  }
  else
  {
    os_activity_apply(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 176), &__block_literal_global_80);
    v12 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v13);

  }
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_79()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_79_cold_1();
}

uint64_t __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "loginChoiceKind") == 2)
  {
    objc_msgSend(v3, "externalCredentialProviderBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_83()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_83_cold_1();
}

- (void)getPasskeysDataForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "auditToken");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
  }
  if ((WBSAuditTokenHasEntitlement() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE82CE8], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "keyBagLockStatus");

    if (v11)
    {
      v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[ASCAgent getPasskeysDataForRelyingParty:withCompletionHandler:].cold.1();
    }
    -[ASPublicKeyCredentialManagerInterface allPasskeysDataForRelyingParty:](self->_publicKeyCredentialManager, "allPasskeysDataForRelyingParty:", v6, v15, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v13);

  }
  else
  {
    v14 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[ASCAgent getPasskeysDataForRelyingParty:withCompletionHandler:].cold.2();
    v7[2](v7, 0);
  }

}

- (void)deletePasskeyForRelyingParty:(id)a3 withCredentialID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  ASPublicKeyCredentialManagerInterface *publicKeyCredentialManager;
  uint64_t v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v9;
    v27 = 2114;
    v28 = v8;
    _os_log_impl(&dword_20E648000, v11, OS_LOG_TYPE_INFO, "Received request to delete passkey %{public}@ for %{public}@.", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ASCAgent _isConnection:entitledToDeletePasskeysForRelyingParty:](self, "_isConnection:entitledToDeletePasskeysForRelyingParty:", v12, v8))
  {
    objc_msgSend(MEMORY[0x24BE82CE8], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "keyBagLockStatus");

    if (v14)
    {
      v15 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ASCAgent deletePasskeyForRelyingParty:withCredentialID:completionHandler:].cold.1();
      v16 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD0FD8];
      v24 = CFSTR("KeyBag is currently locked.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v18);

    }
    else
    {
      publicKeyCredentialManager = self->_publicKeyCredentialManager;
      v22 = 0;
      v21 = -[ASPublicKeyCredentialManagerInterface deletePasskeyForRelyingParty:withCredentialID:error:](publicKeyCredentialManager, "deletePasskeyForRelyingParty:withCredentialID:error:", v8, v9, &v22);
      v17 = v22;
      v10[2](v10, v21, v17);
    }
  }
  else
  {
    v19 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[ASCAgent deletePasskeyForRelyingParty:withCredentialID:completionHandler:].cold.2();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v17);
  }

}

- (void)deleteAllPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  ASPublicKeyCredentialManagerInterface *publicKeyCredentialManager;
  uint64_t v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    _os_log_impl(&dword_20E648000, v8, OS_LOG_TYPE_INFO, "Received request to delete all passkeys for %{public}@.", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ASCAgent _isConnection:entitledToDeletePasskeysForRelyingParty:](self, "_isConnection:entitledToDeletePasskeysForRelyingParty:", v9, v6))
  {
    objc_msgSend(MEMORY[0x24BE82CE8], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "keyBagLockStatus");

    if (v11)
    {
      v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ASCAgent deleteAllPasskeysForRelyingParty:completionHandler:].cold.1();
      v13 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BDD0FD8];
      v21 = CFSTR("KeyBag is currently locked.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v15);

    }
    else
    {
      publicKeyCredentialManager = self->_publicKeyCredentialManager;
      v19 = 0;
      v18 = -[ASPublicKeyCredentialManagerInterface deleteAllPasskeysForRelyingParty:error:](publicKeyCredentialManager, "deleteAllPasskeysForRelyingParty:error:", v6, &v19);
      v14 = v19;
      v7[2](v7, v18, v14);
    }
  }
  else
  {
    v16 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[ASCAgent deleteAllPasskeysForRelyingParty:completionHandler:].cold.2();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v14);
  }

}

- (void)preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:(id)a3
{
  void (**v4)(id, _BOOL8, id);
  _BOOL8 v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, _BOOL8, id))a3;
  v5 = -[ASCAgent _canCreateICloudKeychainPasskeyPreflightWithError:](self, "_canCreateICloudKeychainPasskeyPreflightWithError:", &v7);
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (void)renamePasskeyWithCredentialID:(id)a3 newName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, id);
  void *v11;
  void *v12;
  ASPublicKeyCredentialManagerInterface *publicKeyCredentialManager;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, id))a5;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "auditToken");
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
  }
  if ((WBSAuditTokenHasEntitlement() & 1) != 0)
  {
    publicKeyCredentialManager = self->_publicKeyCredentialManager;
    v14 = objc_alloc(MEMORY[0x24BE82D78]);
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithCredentialID:groupID:", v15, &stru_24C985630);
    v20 = 0;
    v17 = -[ASPublicKeyCredentialManagerInterface renamePasskeywithIdentifier:newName:error:](publicKeyCredentialManager, "renamePasskeywithIdentifier:newName:error:", v16, v9, &v20);
    v18 = v20;

    v10[2](v10, v17, v18);
  }
  else
  {
    v19 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[ASCAgent renamePasskeyWithCredentialID:newName:completionHandler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v18);
  }

}

- (void)_openPasswordOptions:(id)a3
{
  void *v3;
  void (**v4)(id, id);
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v3 = (void *)MEMORY[0x24BDBCF48];
  v4 = (void (**)(id, id))a3;
  objc_msgSend(v3, "URLWithString:", CFSTR("prefs:root=PASSWORDS&path=PASSWORD_OPTIONS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=General&path=AUTOFILL"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v7, "openSensitiveURL:withOptions:error:", v5, 0, &v9);
  v8 = v9;

  v4[2](v4, v8);
}

- (void)requestToTurnOnCredentialProviderExtensionWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t buf[16];
  __int128 v23;
  __int128 v24;

  v4 = (void (**)(id, uint64_t))a3;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "auditToken");
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
  }
  WBSApplicationIdentifierFromAuditToken();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASCAgent _bundleIDFromAppID:](self, "_bundleIDFromAppID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "safari_safariApplicationPlatformBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11 = (id)*MEMORY[0x24BE82F68];

    v8 = v11;
  }
  if (-[ASCAgent _isExtensionEnabled:](self, "_isExtensionEnabled:", v8))
  {
    v4[2](v4, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("turnOnAutoFillRequestLastDate-%@"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safari_dateForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14
      && (objc_msgSend(MEMORY[0x24BDBCE60], "now"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "timeIntervalSinceDate:", v14),
          v17 = v16,
          v15,
          v17 <= 10.0))
    {
      v21 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20E648000, v21, OS_LOG_TYPE_INFO, "AutoFill enablement API failed request because not enough time passed since last request.", buf, 2u);
      }
      v18 = 0;
    }
    else
    {
      v18 = -[ASCAgent _showExtensionEnablementAlert:](self, "_showExtensionEnablementAlert:", v8);
      objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "safari_setDate:forKey:", v20, v12);

    }
    v4[2](v4, v18);

  }
}

- (BOOL)_isExtensionEnabled:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82F68]))
  {
    objc_msgSend(MEMORY[0x24BE83018], "sharedFeatureManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldAutoFillPasswordsFromKeychain");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getEnabledExtensionsSynchronously");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __32__ASCAgent__isExtensionEnabled___block_invoke;
    v8[3] = &unk_24C97EBC0;
    v9 = v3;
    v5 = objc_msgSend(v6, "safari_containsObjectPassingTest:", v8);

  }
  return v5;
}

uint64_t __32__ASCAgent__isExtensionEnabled___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sf_bundleIdentifierForContainingApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)_showExtensionEnablementAlert:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFDictionary *v28;
  __CFUserNotification *v29;
  void *v30;
  void *v31;
  CFOptionFlags responseFlags;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  _QWORD v39[4];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82F68]);
  if ((v4 & 1) != 0)
  {
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
LABEL_14:
    v18 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithFormat:", v19, v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringWithFormat:", v22, v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = *MEMORY[0x24BDBD6E0];
    v38[0] = *MEMORY[0x24BDBD6D8];
    v38[1] = v24;
    v39[0] = v23;
    v39[1] = v20;
    v38[2] = *MEMORY[0x24BDBD6F8];
    _WBSLocalizedString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v25;
    v38[3] = *MEMORY[0x24BDBD6F0];
    _WBSLocalizedString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (const __CFDictionary *)objc_msgSend(v27, "mutableCopy");

    v29 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 2uLL, 0, v28);
    responseFlags = 3;
    CFUserNotificationReceiveResponse(v29, 0.0, &responseFlags);
    CFRelease(v29);
    v15 = (responseFlags & 3) == 0;
    if ((responseFlags & 3) == 0)
    {
      objc_msgSend(MEMORY[0x24BE83018], "sharedFeatureManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setShouldAutoFillPasswords:", 1);

      if (v4)
      {
        objc_msgSend(MEMORY[0x24BE83018], "sharedFeatureManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setShouldAutoFillPasswordsFromKeychain:", 1);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setExtension:isEnabled:", v6, 1);
      }

    }
    goto LABEL_20;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extensionsSync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (!v8)
  {
LABEL_11:
    v15 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v9 = v8;
  v10 = *(_QWORD *)v35;
LABEL_5:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v35 != v10)
      objc_enumerationMutation(v6);
    v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v11);
    objc_msgSend(v12, "sf_bundleIdentifierForContainingApp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v3);

    if ((v14 & 1) != 0)
      break;
    if (v9 == ++v11)
    {
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v9)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  v16 = v12;

  if (v16)
  {
    objc_msgSend(v16, "_plugIn");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedContainingName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v16;
    goto LABEL_14;
  }
  v15 = 0;
LABEL_21:

  return v15;
}

- (id)_implicitlySelectAssertionLoginChoiceFromChoices:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *authorizationActivity;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD block[4];
  id v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      authorizationActivity = self->_authorizationActivity;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_111;
      v15[3] = &unk_24C97E868;
      v16 = v8;
      os_activity_apply(authorizationActivity, v15);
      v10 = 0;
      v9 = v16;
      goto LABEL_13;
    }
    v9 = v8;
    if (objc_msgSend(v9, "isRegistrationRequest"))
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_113);
      v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(v7, "authenticatedContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (-[ASCAgent _isValidContext:](self, "_isValidContext:", v13))
      {
        v10 = v9;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_115);
    }
    v10 = 0;
    goto LABEL_12;
  }
  v11 = self->_authorizationActivity;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke;
  block[3] = &unk_24C97E868;
  v18 = v6;
  os_activity_apply(v11, block);
  v10 = 0;
  v8 = v18;
LABEL_14:

  return v10;
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_cold_1(a1, v2);
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_111()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_111_cold_1();
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_112()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_112_cold_1();
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_114()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_114_cold_1();
}

- (void)cancelCurrentRequest
{
  NSObject *internalSemaphore;
  dispatch_time_t v4;
  void *v5;
  uint64_t v6;
  NSUUID *publicKeyCredentialOperationUUID;
  id v8;

  internalSemaphore = self->_internalSemaphore;
  v4 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(internalSemaphore, v4))
    v5 = &__block_literal_global_116;
  else
    v5 = &__block_literal_global_118;
  os_activity_apply((os_activity_t)self->_authorizationActivity, v5);
  -[ASCAuthorizationTrafficController cancelAuthorizationForAppIdentifierIfNecessary:token:](self->_authorizationTrafficController, "cancelAuthorizationForAppIdentifierIfNecessary:token:", self->_clientApplicationIdentifier, self->_authorizationTrafficControllerToken);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 2, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  publicKeyCredentialOperationUUID = self->_publicKeyCredentialOperationUUID;
  v8 = (id)v6;
  if (publicKeyCredentialOperationUUID)
    -[ASPublicKeyCredentialManagerInterface cancelOperationIfNecessaryWithUUID:overrideError:](self->_publicKeyCredentialManager, "cancelOperationIfNecessaryWithUUID:overrideError:", publicKeyCredentialOperationUUID, v6);
  else
    -[ASCAgent _authorizationCompletedWithCredential:error:](self, "_authorizationCompletedWithCredential:error:", 0, v6);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_internalSemaphore);
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_120);

}

void __32__ASCAgent_cancelCurrentRequest__block_invoke()
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
    __32__ASCAgent_cancelCurrentRequest__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void __32__ASCAgent_cancelCurrentRequest__block_invoke_117()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[ASCAgent cancelCurrentRequest]_block_invoke";
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_INFO, "Acquired lock for %s", (uint8_t *)&v1, 0xCu);
  }
}

void __32__ASCAgent_cancelCurrentRequest__block_invoke_119()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[ASCAgent cancelCurrentRequest]_block_invoke";
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_INFO, "Released lock for %s", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_prepareForAuthorizationRequestsForContext:(id)a3 clientConnection:(id)a4 withPresentationHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  ASCAuthorizationTrafficController *authorizationTrafficController;
  NSUUID *authorizationTrafficControllerToken;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  void (**v31)(id, _QWORD, void *);
  id v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(v8, "sanitizeRequestTypesForAutoFillRequestIfNecessary");
  objc_msgSend(v8, "applyMagicCredentialIDIfNecessary");
  if (objc_msgSend(v8, "isCABLEAuthenticatorRequest")
    && !+[ASCWebKitSPISupport shouldUseAlternateCredentialStore](ASCWebKitSPISupport, "shouldUseAlternateCredentialStore"))
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_122);
    v14 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FD8];
    _WBSLocalizedString();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v38[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    v18 = 5;
LABEL_19:
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), v18, v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v27);

    goto LABEL_21;
  }
  objc_msgSend(v8, "proxiedAppIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    if (v9)
    {
      objc_msgSend(v9, "auditToken");
    }
    else
    {
      v33 = 0u;
      v34 = 0u;
    }
    WBSApplicationIdentifierFromAuditToken();
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v13;

  if (!objc_msgSend(v15, "length"))
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_126);
    v26 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FD8];
    v36 = CFSTR("The calling process does not have an application identifier. Make sure it is properly configured.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v26;
    v18 = 1;
    goto LABEL_19;
  }
  if (-[ASCAgent _shouldApplyQuirksToClientWithApplicationIdentifier:](self, "_shouldApplyQuirksToClientWithApplicationIdentifier:", v15))
  {
    v19 = objc_msgSend(v8, "requestTypes");
    if ((ascCredentialRequestTypesAllPasskey() & v19) != 0)
    {
      objc_msgSend(v8, "relyingPartyIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASFeatureManager sharedManager](ASFeatureManager, "sharedManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "arePasskeysDisallowedForRelyingParty:", v20);

      if (v22)
      {
        os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_131);
        objc_msgSend(v8, "removePasskeyRequests");
      }

    }
  }
  v32 = 0;
  v23 = -[ASCAgent _isClientWithApplicationIdentifier:properlyEntitledForRequestContext:error:](self, "_isClientWithApplicationIdentifier:properlyEntitledForRequestContext:error:", v15, v8, &v32);
  v16 = v32;
  if (v23)
  {
    authorizationTrafficController = self->_authorizationTrafficController;
    authorizationTrafficControllerToken = self->_authorizationTrafficControllerToken;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_134;
    v28[3] = &unk_24C97EDE0;
    v31 = v10;
    v28[4] = self;
    v15 = v15;
    v29 = v15;
    v30 = v8;
    -[ASCAuthorizationTrafficController beginAuthorizationForApplicationIdentifier:token:withClearanceHandler:](authorizationTrafficController, "beginAuthorizationForApplicationIdentifier:token:withClearanceHandler:", v15, authorizationTrafficControllerToken, v28);

  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_133);
    v10[2](v10, 0, v16);
  }
LABEL_21:

}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_cold_1();
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_125()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_125_cold_1();
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_130()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_DEFAULT, "Dropping passkey requests from quirked relying party.", v1, 2u);
  }
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_132()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_132_cold_1();
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_134(id *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BYTE *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  _TtC26AuthenticationServicesCore23ASCRelatedOriginFetcher *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id *v33;
  void *v34;
  uint64_t v35;
  _QWORD *v36;
  void *v37;
  id v38;
  _TtC26AuthenticationServicesCore23ASCRelatedOriginFetcher *v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  void *v45;
  _QWORD block[5];
  id v47;
  id v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD v51[4];
  NSObject *v52;
  _QWORD *v53;
  _QWORD v54[4];
  NSObject *v55;
  _QWORD v56[4];
  _QWORD v57[2];
  id v58;
  id v59;
  id v60;
  _QWORD *v61;
  _QWORD v62[4];
  NSObject *v63;
  _QWORD v64[4];
  NSObject *v65;
  _QWORD v66[3];
  char v67;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    objc_storeStrong((id *)a1[4] + 8, a1[5]);
    objc_storeStrong((id *)a1[4] + 7, a1[6]);
    v7 = dispatch_group_create();
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x2020000000;
    v67 = 0;
    v8 = objc_msgSend(*((id *)a1[4] + 7), "requestTypes");
    v9 = MEMORY[0x24BDAC760];
    if ((v8 & 2) != 0)
    {
      dispatch_group_enter(v7);
      v10 = a1[4];
      v11 = a1[6];
      v64[0] = v9;
      v64[1] = 3221225472;
      v64[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_2;
      v64[3] = &unk_24C97E868;
      v65 = v7;
      objc_msgSend(v10, "_configureAppleIDCredentialWithContext:completionHandler:", v11, v64);

    }
    if ((v8 & 1) != 0)
    {
      dispatch_group_enter(v7);
      v12 = a1[4];
      v62[0] = v9;
      v62[1] = 3221225472;
      v62[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_3;
      v62[3] = &unk_24C97E868;
      v63 = v7;
      objc_msgSend(v12, "_configurePasswordCredentialsWithCompletionHandler:", v62);

    }
    if ((v8 & 0x28) == 0)
      goto LABEL_17;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8 & 8) != 0)
    {
      objc_msgSend(a1[6], "platformKeyCredentialAssertionOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

    }
    if ((v8 & 0x20) != 0)
    {
      objc_msgSend(a1[6], "securityKeyCredentialAssertionOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v15);

    }
    dispatch_group_enter(v7);
    objc_msgSend(v13, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "origin");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[6], "relyingPartyIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = a1[4];
    if (v18[80])
    {
      v19 = objc_msgSend(v17, "length");
      v18 = a1[4];
      if (v19)
      {
        if (!objc_msgSend(a1[4], "_isRPIDValid:forOrigin:", v45, v17))
        {
          v39 = objc_alloc_init(_TtC26AuthenticationServicesCore23ASCRelatedOriginFetcher);
          v40 = a1[4];
          v41 = (void *)v40[32];
          v40[32] = v39;

          v42 = (void *)*((_QWORD *)a1[4] + 32);
          v56[0] = MEMORY[0x24BDAC760];
          v56[1] = 3221225472;
          v56[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4;
          v56[3] = &unk_24C97ED08;
          v43 = v7;
          v61 = v66;
          v44 = a1[4];
          v57[0] = v43;
          v57[1] = v44;
          v58 = v13;
          v59 = a1[5];
          v60 = a1[6];
          objc_msgSend(v42, "isOrigin:relatedToRelyingPartyIdentifier:completionHandler:", v17, v45, v56);
          v22 = (id *)v57;

          goto LABEL_16;
        }
        v18 = a1[4];
      }
    }
    v20 = a1[5];
    v21 = objc_msgSend(a1[6], "requestStyle", v45);
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_2_140;
    v54[3] = &unk_24C97E868;
    v55 = v7;
    objc_msgSend(v18, "_configurePublicKeyCredentialsWithAssertionOptions:forProcessWithApplicationIdentifier:requestStyle:completionHandler:", v13, v20, v21, v54);
    v22 = (id *)&v55;
LABEL_16:

    v9 = MEMORY[0x24BDAC760];
LABEL_17:
    if ((v8 & 4) != 0)
    {
      objc_msgSend(a1[6], "platformKeyCredentialCreationOptions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "origin");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[6], "relyingPartyIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_BYTE *)a1[4] + 80)
        && objc_msgSend(v24, "length")
        && (objc_msgSend(a1[4], "_isRPIDValid:forOrigin:", v25, v24) & 1) == 0)
      {
        dispatch_group_enter(v7);
        v26 = objc_alloc_init(_TtC26AuthenticationServicesCore23ASCRelatedOriginFetcher);
        v27 = a1[4];
        v28 = (void *)v27[32];
        v27[32] = v26;

        v29 = (void *)*((_QWORD *)a1[4] + 32);
        v51[0] = v9;
        v51[1] = 3221225472;
        v51[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_3_141;
        v51[3] = &unk_24C97ED30;
        v52 = v7;
        v53 = v66;
        objc_msgSend(v29, "isOrigin:relatedToRelyingPartyIdentifier:completionHandler:", v24, v25, v51);

      }
    }
    if (v8 == 16)
    {
      v30 = a1[4];
      v31 = (void *)*((_QWORD *)v30 + 13);
      objc_msgSend(*((id *)v30 + 7), "securityKeyCredentialCreationOptions");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (id *)a1[4];
      objc_msgSend(v33[7], "globalFrameID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "beginCreatingNewSecurityKeyCredentialIfAvailableWithOptions:delegate:webFrameIdentifier:parentActivity:", v32, v33, v34, *((_QWORD *)a1[4] + 22));
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = a1[4];
      v37 = (void *)v36[21];
      v36[21] = v35;

    }
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_143;
    block[3] = &unk_24C97EDB8;
    v38 = a1[4];
    v49 = v66;
    block[4] = v38;
    v48 = a1[7];
    v50 = v8;
    v47 = a1[6];
    dispatch_group_notify(v7, MEMORY[0x24BDAC9B8], block);

    _Block_object_dispose(v66, 8);
    goto LABEL_29;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 0, CFSTR("Traffic controller denied request."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*((void (**)(void))a1[7] + 2))();
LABEL_29:

}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_5;
  v15[3] = &unk_24C97E868;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v6, "setHandler:", v15);
  if ((a2 & 1) != 0)
  {
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v11 = objc_msgSend(*(id *)(a1 + 64), "requestStyle");
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_138;
    v13[3] = &unk_24C97E868;
    v14 = v6;
    objc_msgSend(v8, "_configurePublicKeyCredentialsWithAssertionOptions:forProcessWithApplicationIdentifier:requestStyle:completionHandler:", v9, v10, v11, v13);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4_cold_1();
  }

}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_2_140(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_3_141(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4_142;
  v8[3] = &unk_24C97E868;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v6, "setHandler:", v8);
  if ((a2 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v7 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4_cold_1();
  }

}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4_142(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_143(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_143_cold_1();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "endAuthorizationForAppIdentifier:token:clearanceHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), &__block_literal_global_145);
    v3 = *(_QWORD *)(a1 + 48);
    v4 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0FD8];
    v11[0] = CFSTR("The requested RPID did not match the origin or related origins.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 17, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v6);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 64);
    if ((objc_msgSend(*(id *)(a1 + 32), "_hasSignInOptionsForRequestContext:", *(_QWORD *)(a1 + 40)) & 1) != 0
      || (v7 & 0x14) != 0)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
    }
    else
    {
      os_activity_apply(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 176), &__block_literal_global_149);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "endAuthorizationForAppIdentifier:token:clearanceHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), &__block_literal_global_151);
      v8 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "_noCredentialsFoundErrorForRequestContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);

    }
  }
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_2_148()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_DEFAULT, "Canceling request due to no matching credentials.", v1, 2u);
  }
}

- (BOOL)_isRPIDValid:(id)a3 forOrigin:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_8;
  if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) == 0)
  {
    objc_msgSend(v7, "safari_domainFromHost");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasSuffix:", v9))
    {

LABEL_7:
      objc_msgSend(v5, "safari_effectiveTopLevelDomainForHost");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "isEqualToString:", v12) ^ 1;

      goto LABEL_9;
    }
    objc_msgSend(v7, "safari_highLevelDomainFromHost");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "hasSuffix:", v10);

    if (v11)
      goto LABEL_7;
LABEL_8:
    LOBYTE(v8) = 0;
    goto LABEL_9;
  }
  LOBYTE(v8) = 1;
LABEL_9:

  return v8;
}

- (id)_noCredentialsFoundErrorForRequestContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void **v32;
  uint64_t *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "isCABLEAuthenticatorRequest"))
  {
    v39 = v3;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getEnabledExtensionsSynchronously");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v10 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "extensionSupportsPasskeys:", v12);

          if (v14)
          {
            v15 = v12;

            v8 = 1;
            v9 = v15;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }

    v19 = objc_alloc(MEMORY[0x24BDC1540]);
    objc_msgSend(v9, "sf_bundleIdentifierForContainingApp");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithBundleIdentifier:allowPlaceholder:error:", v20, 0, 0);
    objc_msgSend(v21, "localizedName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v39;
    objc_msgSend(v39, "platformKeyCredentialAssertionOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allowedCredentials");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    v26 = (void *)MEMORY[0x24BDD1540];
    if (v25)
    {
      if ((v8 & 1) != 0)
      {
        v52 = *MEMORY[0x24BDD0FD8];
        v27 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "relyingPartyIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringWithFormat:", v28, v22, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v30;
        v31 = (void *)MEMORY[0x24BDBCE70];
        v32 = &v53;
        v33 = &v52;
      }
      else
      {
        v50 = *MEMORY[0x24BDD0FD8];
        v35 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "relyingPartyIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedStringWithFormat:", v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v30;
        v31 = (void *)MEMORY[0x24BDBCE70];
        v32 = &v51;
        v33 = &v50;
      }
    }
    else if ((v8 & 1) != 0)
    {
      v48 = *MEMORY[0x24BDD0FD8];
      v34 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "relyingPartyIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringWithFormat:", v28, v22, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v30;
      v31 = (void *)MEMORY[0x24BDBCE70];
      v32 = &v49;
      v33 = &v48;
    }
    else
    {
      v46 = *MEMORY[0x24BDD0FD8];
      v36 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "relyingPartyIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringWithFormat:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v30;
      v31 = (void *)MEMORY[0x24BDBCE70];
      v32 = &v47;
      v33 = &v46;
    }
    objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 5, v37);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v3, "isClientLinkedOnOrAfterIOS15Aligned"))
      v16 = 2;
    else
      v16 = 0;
    v17 = (void *)MEMORY[0x24BDD1540];
    v44 = *MEMORY[0x24BDD0FD8];
    v45 = CFSTR("No credentials available for login.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), v16, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (void)presentCABLESheetWithCompletionHandler:(id)a3
{
  id v4;
  ASCAuthorizationPresenter *v5;
  ASCAuthorizationPresenterHostProtocol *requestPresenter;
  ASCAuthorizationPresentationContext *v7;
  NSString *clientApplicationIdentifier;
  ASCCredentialRequestContext *requestContext;
  _BOOL4 isClientEntitledWebBrowser;
  NSXPCConnection *connection;
  void *v12;
  ASCAuthorizationPresentationContext *v13;
  void *v14;
  void *v15;
  id v16;
  ASCAuthorizationPresenterHostProtocol *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _OWORD v21[2];

  v4 = a3;
  v5 = objc_alloc_init(ASCAuthorizationPresenter);
  requestPresenter = self->_requestPresenter;
  self->_requestPresenter = (ASCAuthorizationPresenterHostProtocol *)v5;

  -[ASCAuthorizationPresenterHostProtocol setDelegate:](self->_requestPresenter, "setDelegate:", self);
  v7 = [ASCAuthorizationPresentationContext alloc];
  requestContext = self->_requestContext;
  clientApplicationIdentifier = self->_clientApplicationIdentifier;
  isClientEntitledWebBrowser = self->_isClientEntitledWebBrowser;
  connection = self->_connection;
  if (connection)
    -[NSXPCConnection auditToken](connection, "auditToken");
  else
    memset(v21, 0, sizeof(v21));
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v21, 32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ASCAuthorizationPresentationContext initWithRequestContext:appIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:](v7, "initWithRequestContext:appIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:", requestContext, clientApplicationIdentifier, isClientEntitledWebBrowser, v12);

  -[ASCAgent _cableLoginChoiceForRequestContext:](self, "_cableLoginChoiceForRequestContext:", self->_requestContext);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAuthorizationPresentationContext addLoginChoice:](v13, "addLoginChoice:", v14);

  -[ASCCredentialRequestContext securityKeyCredentialAssertionOptions](self->_requestContext, "securityKeyCredentialAssertionOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = -[ASCSecurityKeyPublicKeyCredentialLoginChoice initAssertionPlaceholderChoice]([ASCSecurityKeyPublicKeyCredentialLoginChoice alloc], "initAssertionPlaceholderChoice");
    -[ASCAuthorizationPresentationContext addLoginChoice:](v13, "addLoginChoice:", v16);

  }
  v17 = self->_requestPresenter;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __51__ASCAgent_presentCABLESheetWithCompletionHandler___block_invoke;
  v19[3] = &unk_24C97EA18;
  v19[4] = self;
  v20 = v4;
  v18 = v4;
  -[ASCAuthorizationPresenterHostProtocol presentAuthorizationWithContext:forProcess:completionHandler:](v17, "presentAuthorizationWithContext:forProcess:completionHandler:", v13, 0, v19);

}

void __51__ASCAgent_presentCABLESheetWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ASCAgent_presentCABLESheetWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24C97EE08;
  v15 = v5;
  v16 = v6;
  v8 = v6;
  v13 = v5;
  os_activity_apply(v7, block);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "dismiss");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 72);
  *(_QWORD *)(v9 + 72) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 200);
  *(_QWORD *)(v11 + 200) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 192) = 0;
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v13 != 0);

}

void __51__ASCAgent_presentCABLESheetWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "safari_privacyPreservingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 141558530;
    v8 = 1752392040;
    v9 = 2112;
    v10 = v4;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_20E648000, v5, OS_LOG_TYPE_DEFAULT, "Completed sheet for AutoFill request: %{mask.hash}@ %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)userSelectedLoginChoice:(id)a3 authenticatedContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  switch(objc_msgSend(v10, "loginChoiceKind"))
  {
    case 1:
      -[ASCAgent _credentialRequestedForPasswordLoginChoice:completionHandler:](self, "_credentialRequestedForPasswordLoginChoice:completionHandler:", v10, v9);
      break;
    case 2:
      -[ASCAgent _credentialRequestedForPlatformLoginChoice:authenticatedContext:completionHandler:](self, "_credentialRequestedForPlatformLoginChoice:authenticatedContext:completionHandler:", v10, v8, v9);
      break;
    case 3:
      -[ASCAgent _credentialRequestedForSecurityKeyLoginChoice:](self, "_credentialRequestedForSecurityKeyLoginChoice:", v10);
      break;
    case 4:
      -[ASCAgent _credentialRequestedForCABLELoginChoice:](self, "_credentialRequestedForCABLELoginChoice:", v10);
      break;
    default:
      break;
  }

}

- (void)_configureAppleIDCredentialWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke;
  v21[3] = &unk_24C97EE30;
  v10 = v7;
  v22 = v10;
  objc_msgSend(v8, "setHandler:", v21);
  if (-[ASCAgent _clientHasNecessaryAuthKitEntitlements](self, "_clientHasNecessaryAuthKitEntitlements"))
  {
    -[ASCAgent _bundleIDFromAppID:](self, "_bundleIDFromAppID:", self->_clientApplicationIdentifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "authKitAccountRequestingAuthorization");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "appleIDAuthorizationRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAuthkitAccount:", v13);

      v15 = objc_alloc_init(MEMORY[0x24BE0ACF0]);
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_170;
      v17[3] = &unk_24C97EEE0;
      v17[4] = self;
      v18 = v13;
      v19 = v6;
      v20 = v8;
      v16 = v13;
      objc_msgSend(v15, "getCredentialStateForClientID:completion:", v11, v17);

    }
    else
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_167);
    }

  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_165);
  }

}

uint64_t __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_2()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_2_cold_1();
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_166()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_166_cold_1();
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_170(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2 == 1)
  {
    v17 = v2;
    v18 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_performAuthKitAuthorizationValidationForAccount:", *(_QWORD *)(a1 + 40));
    v5 = objc_alloc_init(MEMORY[0x24BE0AD18]);
    objc_msgSend(*(id *)(a1 + 48), "appleIDAuthorizationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authkitAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAuthkitAccount:", v7);

    objc_msgSend(*(id *)(a1 + 32), "_bundleIDFromAppID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClientID:", v8);

    objc_msgSend(*(id *)(a1 + 32), "_teamIDfromAppID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTeamID:", v9);

    objc_msgSend(v5, "setShouldHideCreateOption:", 1);
    v10 = objc_alloc_init(MEMORY[0x24BE0AD60]);
    objc_msgSend(v10, "setAuthorizationRequest:", v5);
    v11 = objc_alloc_init(MEMORY[0x24BE0ACF0]);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_2_173;
    v13[3] = &unk_24C97EEB8;
    v14 = *(id *)(a1 + 56);
    v15 = v11;
    v16 = *(_QWORD *)(a1 + 32);
    v12 = v11;
    objc_msgSend(v12, "getPresentationContextForRequestContext:completion:", v10, v13);

  }
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_2_173(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a3)
  {
    os_activity_apply(*(os_activity_t *)(*(_QWORD *)(a1 + 48) + 176), &__block_literal_global_174);
  }
  else
  {
    objc_msgSend(a2, "loginChoices");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_3()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_3_cold_1();
}

- (void)clearAllPlatformPublicKeyCredentialsWithCompletionHandler:(id)a3
{
  ASPublicKeyCredentialManagerInterface *publicKeyCredentialManager;
  void (**v4)(void);

  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  v4 = (void (**)(void))a3;
  -[ASPublicKeyCredentialManagerInterface clearAllCredentials](publicKeyCredentialManager, "clearAllCredentials");
  v4[2]();

}

- (void)getShouldUseAlternateCredentialStoreWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v4, +[ASCWebKitSPISupport shouldUseAlternateCredentialStore](ASCWebKitSPISupport, "shouldUseAlternateCredentialStore"));

}

- (void)getArePasskeysDisallowedForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[ASFeatureManager sharedManager](ASFeatureManager, "sharedManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "arePasskeysDisallowedForRelyingParty:", v7);

  (*((void (**)(id, uint64_t))a4 + 2))(v6, v8);
}

- (void)openCABLEURL:(id)a3 fromSourceApplication:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *authorizationActivity;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char HasEntitlement;
  ASCAuthorizationTrafficController *authorizationTrafficController;
  NSUUID *authorizationTrafficControllerToken;
  void *v20;
  void *v21;
  void *v22;
  const __CFString **v23;
  uint64_t *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  void (**v29)(id, void *);
  __int128 v30;
  __int128 v31;
  _QWORD block[4];
  id v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  authorizationActivity = self->_authorizationActivity;
  v12 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke;
  block[3] = &unk_24C97EE08;
  v13 = v8;
  v33 = v13;
  v14 = v9;
  v34 = v14;
  os_activity_apply(authorizationActivity, block);
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "auditToken");
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
  }
  HasEntitlement = WBSAuditTokenHasEntitlement();

  if ((HasEntitlement & 1) == 0)
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_178);
    v21 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FD8];
    v38[0] = CFSTR("Client is missing required entitlement");
    v22 = (void *)MEMORY[0x24BDBCE70];
    v23 = (const __CFString **)v38;
    v24 = &v37;
LABEL_9:
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v25);

    goto LABEL_10;
  }
  if (!v13)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FD8];
    v36 = CFSTR("Invalid request: missing caBLE URL");
    v22 = (void *)MEMORY[0x24BDBCE70];
    v23 = &v36;
    v24 = &v35;
    goto LABEL_9;
  }
  authorizationTrafficController = self->_authorizationTrafficController;
  authorizationTrafficControllerToken = self->_authorizationTrafficControllerToken;
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_183;
  v26[3] = &unk_24C97EDE0;
  v29 = v10;
  v26[4] = self;
  v27 = v13;
  v28 = v14;
  -[ASCAuthorizationTrafficController beginAuthorizationForApplicationIdentifier:token:withClearanceHandler:](authorizationTrafficController, "beginAuthorizationForApplicationIdentifier:token:withClearanceHandler:", CFSTR("com.apple.AuthenticationServicesCore.caBLEAuthenticator"), authorizationTrafficControllerToken, v26);

  v20 = v29;
LABEL_10:

}

void __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138478083;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_20E648000, v2, OS_LOG_TYPE_DEFAULT, "Open caBLE URL: %{private}@, sourceApplication: %@", (uint8_t *)&v5, 0x16u);
  }
}

void __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_177()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_177_cold_1();
}

void __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_183(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  ASCAuthorizationPresenter *v7;
  uint64_t v8;
  void *v9;
  ASCAuthorizationPresentationContext *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *(id *)(a1 + 40));
    v7 = objc_alloc_init(ASCAuthorizationPresenter);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 72);
    *(_QWORD *)(v8 + 72) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setDelegate:");
    v10 = [ASCAuthorizationPresentationContext alloc];
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);
    v12 = *(id *)(a1 + 48);
    if (v12)
    {
      if (shouldRequireCABLEAuthenticatorConsentForSourceApplication_onceToken != -1)
        dispatch_once(&shouldRequireCABLEAuthenticatorConsentForSourceApplication_onceToken, &__block_literal_global_557);
      v13 = objc_msgSend((id)shouldRequireCABLEAuthenticatorConsentForSourceApplication_systemScannerApplications, "containsObject:", v12) ^ 1;
    }
    else
    {
      v13 = 1;
    }

    v15 = -[ASCAuthorizationPresentationContext _initWithCABLEAuthenticatorURL:shouldRequireConsent:passkeyURLType:](v10, "_initWithCABLEAuthenticatorURL:shouldRequireConsent:passkeyURLType:", v11, v13, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "as_passkeyURLType"));
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 72);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_2;
    v21[3] = &unk_24C97EA18;
    v21[4] = v16;
    v22 = *(id *)(a1 + 56);
    objc_msgSend(v17, "presentAuthorizationWithContext:forProcess:completionHandler:", v15, 0, v21);

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v14 + 16))(v14, v5);
    }
    else
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD0FD8];
      v24[0] = CFSTR("Traffic controller denied request.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 0, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v20);

    }
  }

}

void __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_3;
  block[3] = &unk_24C97EE08;
  v19 = v5;
  v20 = v6;
  v8 = v6;
  v17 = v5;
  os_activity_apply(v7, block);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "finishTransactionWithCredential:error:", v17, v8);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 216);
  *(_QWORD *)(v9 + 216) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 104);
  v13 = *(_QWORD *)(v11 + 168);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cancelOperationIfNecessaryWithUUID:overrideError:", v13, v14);

  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 168);
  *(_QWORD *)(v15 + 168) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "endAuthorizationForAppIdentifier:token:clearanceHandler:", CFSTR("com.apple.AuthenticationServicesCore.caBLEAuthenticator"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), &__block_literal_global_187);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  __CFString *v4;
  int v5;
  __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (id)WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = CFSTR("success");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingDescription");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_20E648000, v2, OS_LOG_TYPE_DEFAULT, "Finishing caBLE transaction: %{public}@", (uint8_t *)&v5, 0xCu);
    if (!v3)

  }
}

- (void)browserPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *authorizationActivity;
  __int128 v20;
  __int128 v21;
  _QWORD block[5];
  _OWORD v23[2];
  __int128 v24;
  __int128 v25;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "auditToken");
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }

  v11 = (void *)MEMORY[0x24BE85408];
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "auditToken");
  else
    memset(v23, 0, sizeof(v23));
  v14 = objc_msgSend(v11, "checkBrowserEngineEntitlementForAuditToken:", v23);

  if ((v14 & 1) == 0)
  {
    authorizationActivity = self->_authorizationActivity;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__ASCAgent_browserPasskeysForRelyingParty_completionHandler___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a2;
    os_activity_apply(authorizationActivity, block);
LABEL_15:
    v8[2](v8, MEMORY[0x24BDBD1A8]);
    goto LABEL_16;
  }
  v20 = v24;
  v21 = v25;
  v15 = TCCAccessCheckAuditToken();
  v16 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  v17 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ASCAgent browserPasskeysForRelyingParty:completionHandler:].cold.1();
    goto LABEL_15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_20E648000, v17, OS_LOG_TYPE_INFO, "TCC access granted for browser passkey request.", (uint8_t *)&v20, 2u);
  }
  -[ASPublicKeyCredentialManagerInterface browserPasskeysForRelyingParty:](self->_publicKeyCredentialManager, "browserPasskeysForRelyingParty:", v7, v20, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v8)[2](v8, v18);

LABEL_16:
}

void __61__ASCAgent_browserPasskeysForRelyingParty_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __61__ASCAgent_browserPasskeysForRelyingParty_completionHandler___block_invoke_cold_1(a1, v2);
}

- (void)getCanCurrentProcessAccessPasskeysForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _BOOL8);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _BOOL8 v13;
  NSObject *v14;

  v6 = a3;
  v7 = (void (**)(id, _BOOL8))a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "auditToken");
  WBSApplicationIdentifierFromAuditToken();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "canKeychainSyncBeEnabled");

  if ((v12 & 1) != 0)
  {
    v13 = self->_isClientEntitledWebBrowser
       || -[ASCAgent _approvalStateForApplicationIdentifier:relyingParty:](self, "_approvalStateForApplicationIdentifier:relyingParty:", v10, v6) == 1;
  }
  else
  {
    v14 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ASCAgent getCanCurrentProcessAccessPasskeysForRelyingParty:withCompletionHandler:].cold.1();
    v13 = 0;
  }
  v7[2](v7, v13);

}

- (void)_configurePasswordCredentialsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, void *);
  void *v11;
  ASCAgent *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __63__ASCAgent__configurePasswordCredentialsWithCompletionHandler___block_invoke;
  v11 = &unk_24C97EF88;
  v12 = self;
  v5 = v4;
  v13 = v5;
  v6 = _Block_copy(&v8);
  -[ASCCredentialRequestContext proxiedAssociatedDomains](self->_requestContext, "proxiedAssociatedDomains", v8, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(MEMORY[0x24BE83068], "getCredentialsForAppWithAppID:externallyVerifiedAndApprovedSharedWebCredentialDomains:completionHandler:", 0, v7, v6);
  else
    objc_msgSend(MEMORY[0x24BE83068], "getCredentialsForAppWithAppID:completionHandler:", self->_clientApplicationIdentifier, v6);

}

uint64_t __63__ASCAgent__configurePasswordCredentialsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "safari_filterObjectsUsingBlock:", &__block_literal_global_191);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v3;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __63__ASCAgent__configurePasswordCredentialsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isExternalPasskey") ^ 1;
}

- (void)_configurePublicKeyCredentialsWithAssertionOptions:(id)a3 forProcessWithApplicationIdentifier:(id)a4 requestStyle:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id didLoadPlatformCredentialsCallback;
  ASPublicKeyCredentialManagerInterface *publicKeyCredentialManager;
  NSUUID *v15;
  NSUUID *publicKeyCredentialOperationUUID;
  id v17;

  v10 = a4;
  v11 = a3;
  v12 = _Block_copy(a6);
  didLoadPlatformCredentialsCallback = self->_didLoadPlatformCredentialsCallback;
  self->_didLoadPlatformCredentialsCallback = v12;

  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  -[ASCCredentialRequestContext globalFrameID](self->_requestContext, "globalFrameID");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[ASPublicKeyCredentialManagerInterface beginAssertionsWithOptions:forProcessWithApplicationIdentifier:delegate:requestStyle:webFrameIdentifier:parentActivity:](publicKeyCredentialManager, "beginAssertionsWithOptions:forProcessWithApplicationIdentifier:delegate:requestStyle:webFrameIdentifier:parentActivity:", v11, v10, self, a5, v17, self->_authorizationActivity);
  v15 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  publicKeyCredentialOperationUUID = self->_publicKeyCredentialOperationUUID;
  self->_publicKeyCredentialOperationUUID = v15;

}

- (void)_configureLoginChoicesForPresentationContext:(id)a3 withRequestContext:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ASCAgent _allAvailableLoginChoicesForRequestContext:](self, "_allAvailableLoginChoicesForRequestContext:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addLoginChoice:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)_allAvailableLoginChoicesForRequestContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  ASCAppleIDLoginChoice *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  ASCPasswordLoginChoice *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ASCPasswordLoginChoice *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  ASCPlatformPublicKeyCredentialLoginChoice *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  ASCPlatformPublicKeyCredentialLoginChoice *v48;
  void *v49;
  id v50;
  ASCPlatformPublicKeyCredentialLoginChoice *v51;
  void *v52;
  id v53;
  NSArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t n;
  void *v59;
  void *v60;
  BOOL v61;
  void *v62;
  char v63;
  void *v64;
  _BOOL4 v65;
  ASCSecurityKeyPublicKeyCredentialLoginChoice *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t ii;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  ASCCredentialProviderExtensionLoginChoice *v87;
  void *v88;
  ASCCredentialProviderExtensionLoginChoice *v89;
  NSMutableArray *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t jj;
  void *v95;
  uint64_t v96;
  id v97;
  uint64_t v99;
  char v100;
  void *v101;
  NSArray *obj;
  int obja;
  ASCAgent *v104;
  void *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint8_t v135[128];
  uint8_t buf[4];
  void *v137;
  __int16 v138;
  id v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  uint64_t v146;

  v146 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v4;
  v6 = objc_msgSend(v4, "requestTypes");
  v7 = v6;
  v99 = v6;
  if ((v6 & 2) != 0 && self->_existingAppleIDCredentialAvailableForLogIn)
  {
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v8 = self->_appleIDChoices;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v131, v145, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v132;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v132 != v11)
            objc_enumerationMutation(v8);
          v13 = -[ASCAppleIDLoginChoice initWithAppleIDLoginChoice:]([ASCAppleIDLoginChoice alloc], "initWithAppleIDLoginChoice:", *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * i));
          objc_msgSend(v5, "addObject:", v13);

        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v131, v145, 16);
      }
      while (v10);
    }

    v7 = v99;
  }
  v104 = self;
  if ((v7 & 1) != 0)
  {
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    obj = self->_passwordCredentials;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v127, v144, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v128;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v128 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * j);
          if (objc_msgSend(v18, "isExternal", v99))
          {
            objc_msgSend(v18, "externalCredential");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v19 = 0;
          }
          v20 = [ASCPasswordLoginChoice alloc];
          objc_msgSend(v18, "user");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "site");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "customTitle");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "groupName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[ASCPasswordLoginChoice initWithUsername:site:externalCredentialIdentity:customTitle:groupName:](v20, "initWithUsername:site:externalCredentialIdentity:customTitle:groupName:", v21, v22, v19, v23, v24);

          objc_msgSend(v5, "addObject:", v25);
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v127, v144, 16);
      }
      while (v15);
    }

    self = v104;
    v7 = v99;
  }
  obja = -[ASCAgent _allowedAuthenticatorModalitiesForRequestContext:](self, "_allowedAuthenticatorModalitiesForRequestContext:", v105, v99);
  if ((v7 & 4) != 0 && (obja & 8) != 0)
  {
    if (-[NSArray count](self->_test_overrideExtensionStates, "count"))
    {
      v125 = 0uLL;
      v126 = 0uLL;
      v123 = 0uLL;
      v124 = 0uLL;
      v26 = self->_test_overrideExtensionStates;
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v123, v143, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v124;
        do
        {
          for (k = 0; k != v28; ++k)
          {
            if (*(_QWORD *)v124 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * k);
            objc_msgSend(v105, "platformKeyCredentialCreationOptions");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASPublicKeyCredentialManagerInterface computeClientDataIfNeededForCreationOptions:](self->_publicKeyCredentialManager, "computeClientDataIfNeededForCreationOptions:", v32);
            objc_msgSend(v31, "localizedDisplayName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = [ASCPlatformPublicKeyCredentialLoginChoice alloc];
            objc_msgSend(v31, "providerBundleID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = -[ASCPlatformPublicKeyCredentialLoginChoice initRegistrationChoiceWithOptions:externalCredentialProviderName:externalCredentialProviderBundleID:](v34, "initRegistrationChoiceWithOptions:externalCredentialProviderName:externalCredentialProviderBundleID:", v32, v33, v35);
            objc_msgSend(v5, "addObject:", v36);

            self = v104;
          }
          v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v123, v143, 16);
        }
        while (v28);
LABEL_42:
        v7 = v100;
      }
    }
    else
    {
      v121 = 0uLL;
      v122 = 0uLL;
      v119 = 0uLL;
      v120 = 0uLL;
      objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "getEnabledExtensionsSynchronously");
      v26 = (NSArray *)objc_claimAutoreleasedReturnValue();

      v38 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v119, v142, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v120;
        do
        {
          for (m = 0; m != v39; ++m)
          {
            if (*(_QWORD *)v120 != v40)
              objc_enumerationMutation(v26);
            v42 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * m);
            objc_msgSend(v105, "platformKeyCredentialCreationOptions");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASPublicKeyCredentialManagerInterface computeClientDataIfNeededForCreationOptions:](v104->_publicKeyCredentialManager, "computeClientDataIfNeededForCreationOptions:", v43);
            v44 = objc_alloc(MEMORY[0x24BDC1540]);
            objc_msgSend(v42, "sf_bundleIdentifierForContainingApp");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)objc_msgSend(v44, "initWithBundleIdentifier:allowPlaceholder:error:", v45, 0, 0);
            objc_msgSend(v46, "localizedName");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            v48 = [ASCPlatformPublicKeyCredentialLoginChoice alloc];
            objc_msgSend(v42, "sf_bundleIdentifierForContainingApp");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = -[ASCPlatformPublicKeyCredentialLoginChoice initRegistrationChoiceWithOptions:externalCredentialProviderName:externalCredentialProviderBundleID:](v48, "initRegistrationChoiceWithOptions:externalCredentialProviderName:externalCredentialProviderBundleID:", v43, v47, v49);
            objc_msgSend(v5, "addObject:", v50);

          }
          v39 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v119, v142, 16);
        }
        while (v39);
        self = v104;
        goto LABEL_42;
      }
    }

  }
  if ((v7 & 4) != 0 && (obja & 1) != 0)
  {
    v51 = [ASCPlatformPublicKeyCredentialLoginChoice alloc];
    objc_msgSend(v105, "platformKeyCredentialCreationOptions");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[ASCPlatformPublicKeyCredentialLoginChoice initRegistrationChoiceWithOptions:](v51, "initRegistrationChoiceWithOptions:", v52);
    objc_msgSend(v5, "addObject:", v53);

  }
  if ((v7 & 8) != 0)
  {
    v101 = v5;
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v54 = self->_platformLoginChoices;
    v55 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v115, v141, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v116;
      do
      {
        for (n = 0; n != v56; ++n)
        {
          if (*(_QWORD *)v116 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * n);
          objc_msgSend(v59, "externalCredentialProviderName");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (v60)
            v61 = (obja & 8) != 0;
          else
            v61 = 0;

          objc_msgSend(v59, "relyingPartyIdentifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("apple.com"));

          objc_msgSend(v59, "externalCredentialProviderName");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v64 == 0;

          if (v61 || (v63 & 1) != 0 || (v65 & obja) != 0)
            objc_msgSend(v101, "addObject:", v59);
        }
        v56 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v115, v141, 16);
      }
      while (v56);
    }

    self = v104;
    v7 = v100;
    v5 = v101;
  }
  if ((v7 & 0x10) != 0 && (obja & 4) != 0)
  {
    v66 = [ASCSecurityKeyPublicKeyCredentialLoginChoice alloc];
    objc_msgSend(v105, "securityKeyCredentialCreationOptions");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = -[ASCSecurityKeyPublicKeyCredentialLoginChoice initRegistrationChoiceWithOptions:](v66, "initRegistrationChoiceWithOptions:", v67);
    objc_msgSend(v5, "addObject:", v68);

  }
  if ((v7 & 0x20) != 0 && (obja & 4) != 0)
  {
    if (-[NSArray count](self->_securityKeyLoginChoices, "count"))
    {
      objc_msgSend(v5, "addObjectsFromArray:", self->_securityKeyLoginChoices);
    }
    else
    {
      v69 = -[ASCSecurityKeyPublicKeyCredentialLoginChoice initAssertionPlaceholderChoice]([ASCSecurityKeyPublicKeyCredentialLoginChoice alloc], "initAssertionPlaceholderChoice");
      objc_msgSend(v5, "addObject:", v69);

    }
  }
  if ((obja & 2) != 0)
  {
    -[ASCAgent _cableLoginChoiceForRequestContext:](self, "_cableLoginChoiceForRequestContext:", v105);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v70);

  }
  if ((v7 & 9) != 0)
  {
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "getEnabledExtensionsSynchronously");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = v72;
    v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v111, v140, 16);
    if (!v74)
      goto LABEL_86;
    v75 = v74;
    v76 = *(_QWORD *)v112;
    while (1)
    {
      for (ii = 0; ii != v75; ++ii)
      {
        if (*(_QWORD *)v112 != v76)
          objc_enumerationMutation(v73);
        v78 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * ii);
        v79 = objc_alloc(MEMORY[0x24BDC1540]);
        objc_msgSend(v78, "sf_bundleIdentifierForContainingApp");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = 0;
        v81 = (void *)objc_msgSend(v79, "initWithBundleIdentifier:allowPlaceholder:error:", v80, 0, &v110);
        v82 = v110;
        objc_msgSend(v81, "localizedName");
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (v82)
        {
          v84 = WBS_LOG_CHANNEL_PREFIXAuthorization();
          if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            goto LABEL_84;
          v85 = v84;
          objc_msgSend(v78, "sf_bundleIdentifierForContainingApp");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v137 = v86;
          v138 = 2112;
          v139 = v82;
          _os_log_error_impl(&dword_20E648000, v85, OS_LOG_TYPE_ERROR, "failed to get LSApplicationRecord for app with bundle ID %{public}@: %@", buf, 0x16u);

        }
        else
        {
          v87 = [ASCCredentialProviderExtensionLoginChoice alloc];
          objc_msgSend(v78, "identifier");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "sf_bundleIdentifierForContainingApp");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = -[ASCCredentialProviderExtensionLoginChoice initWithProviderName:providerBundleID:providerExtensionContainingAppBundleID:](v87, "initWithProviderName:providerBundleID:providerExtensionContainingAppBundleID:", v83, v86, v88);
          objc_msgSend(v5, "addObject:", v89);

        }
LABEL_84:

      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v111, v140, 16);
      if (!v75)
      {
LABEL_86:

        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v90 = v104->_test_credentialProviderExtensionLoginChoices;
        v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v106, v135, 16);
        if (v91)
        {
          v92 = v91;
          v93 = *(_QWORD *)v107;
          do
          {
            for (jj = 0; jj != v92; ++jj)
            {
              if (*(_QWORD *)v107 != v93)
                objc_enumerationMutation(v90);
              objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * jj));
            }
            v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v106, v135, 16);
          }
          while (v92);
        }

        break;
      }
    }
  }
  if ((objc_msgSend(v105, "requestOptions") & 1) != 0
    && (objc_msgSend(v5, "safari_filterObjectsUsingBlock:", &__block_literal_global_199),
        v95 = (void *)objc_claimAutoreleasedReturnValue(),
        v96 = objc_msgSend(v95, "count"),
        v95,
        !v96))
  {
    v97 = (id)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v97 = v5;
  }

  return v97;
}

BOOL __55__ASCAgent__allAvailableLoginChoicesForRequestContext___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "loginChoiceKind") < 4;
}

- (unint64_t)_allowedAuthenticatorModalitiesForRequestContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  unsigned int v29;
  int v30;
  int v31;
  ASCAgent *v32;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "atLeastOneEnabledExtensionSupportsPasskeys");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE83018], "sharedFeatureManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldAutoFillPasswordsFromKeychain");

    v9 = v8;
  }
  else
  {
    v9 = 1;
  }
  v10 = objc_msgSend(v4, "requestTypes");
  if ((v10 & 4) != 0)
  {
    objc_msgSend(v4, "platformKeyCredentialCreationOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attestationPreference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("enterprise"));

    v15 = 8;
    if (v14)
      v15 = 0;
    if (!v6)
      v15 = 0;
    v11 = v15 | v9;
  }
  else
  {
    v11 = 0;
  }
  v16 = v11 | (v10 >> 2) & 4;
  if ((v10 & 0x28) == 0)
    goto LABEL_33;
  -[ASCAgent _allTransportsForAssertionRequest:](self, "_allTransportsForAssertionRequest:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ASCAgent _allowListExclusivelyMatchesPlatformLoginChoices:](self, "_allowListExclusivelyMatchesPlatformLoginChoices:", v4);
  if (objc_msgSend(v17, "count"))
  {
    v32 = self;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("usb"), CFSTR("nfc"), CFSTR("ble"), 0);
    v31 = v6;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v17, "isSubsetOfSet:", v19);
    v29 = objc_msgSend(v17, "intersectsSet:", v19) ^ 1;
    +[ASCPublicKeyCredentialDescriptor cableTransports](ASCPublicKeyCredentialDescriptor, "cableTransports");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v17, "isSubsetOfSet:", v20);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("internal"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v17, "isEqualToSet:", v22);

    self = v32;
    v24 = v29;
    v6 = v31;
    if (v30 | v21)
      v9 = 0;
  }
  else
  {
    v23 = 0;
    v24 = 0;
  }
  v25 = v16 | 8;
  if (!v6)
    v25 = v16;
  v26 = v25 | v9;
  if ((v10 & 8) == 0)
    v26 = v16;
  v27 = (v10 & 0x20) == 0 || v18;
  v16 = v27 | v24 ? v26 : v26 | 4;

  if (((v18 | v23) & 1) == 0)
  {
LABEL_33:
    if (-[ASCAgent _shouldAddCABLEChoiceForRequestContext:](self, "_shouldAddCABLEChoiceForRequestContext:", v4))
      v16 |= 2uLL;
  }

  return v16;
}

- (BOOL)_allowListExclusivelyMatchesPlatformLoginChoices:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v5, "platformKeyCredentialAssertionOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allowedCredentials");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "securityKeyCredentialAssertionOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allowedCredentials");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v10);

  if (objc_msgSend(v8, "count")
    && (v11 = objc_msgSend(v8, "count"), v11 <= -[NSArray count](self->_platformLoginChoices, "count")))
  {
    objc_msgSend(v8, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_212);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDBCF20];
    -[NSArray safari_mapObjectsUsingBlock:](self->_platformLoginChoices, "safari_mapObjectsUsingBlock:", &__block_literal_global_214);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v13, "isSubsetOfSet:", v16);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __61__ASCAgent__allowListExclusivelyMatchesPlatformLoginChoices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "credentialID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __61__ASCAgent__allowListExclusivelyMatchesPlatformLoginChoices___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_allTransportsForAssertionRequest:(id)a3
{
  id v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "requestTypes");
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 8) != 0)
  {
    objc_msgSend(v3, "platformKeyCredentialAssertionOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allowedCredentials");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "count"))
    {
LABEL_25:

      goto LABEL_28;
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = v8;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "transports");
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
          {

            goto LABEL_25;
          }
          v14 = (void *)v13;
          objc_msgSend(v5, "addObjectsFromArray:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v10)
          continue;
        break;
      }
    }

    if ((v4 & 0x20) == 0)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(v3, "securityKeyCredentialAssertionOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allowedCredentials");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count"))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v16 = v16;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v25;
        while (2)
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v20), "transports", (_QWORD)v24);
            v21 = objc_claimAutoreleasedReturnValue();
            if (!v21)
            {

              goto LABEL_27;
            }
            v22 = (void *)v21;
            objc_msgSend(v5, "addObjectsFromArray:", v21);

            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v18)
            continue;
          break;
        }
      }

      goto LABEL_3;
    }
LABEL_27:

LABEL_28:
    v6 = 0;
    goto LABEL_29;
  }
  if ((v4 & 0x20) != 0)
    goto LABEL_14;
LABEL_3:
  v6 = v5;
LABEL_29:

  return v6;
}

- (id)_cableLoginChoiceForRequestContext:(id)a3
{
  _TtC26AuthenticationServicesCore13ASCABLEClient *v4;
  _TtC26AuthenticationServicesCore13ASCABLEClient *cableClient;
  ASCABLELoginChoice *v6;
  void *v7;
  ASCABLELoginChoice *v8;

  if (!self->_cableClient)
  {
    v4 = -[ASCABLEClient initWithDelegate:isRegistrationRequest:]([_TtC26AuthenticationServicesCore13ASCABLEClient alloc], "initWithDelegate:isRegistrationRequest:", self, (objc_msgSend(a3, "requestTypes") & 0x14) != 0);
    cableClient = self->_cableClient;
    self->_cableClient = v4;

  }
  v6 = [ASCABLELoginChoice alloc];
  -[ASCABLEClient qrCodeURL](self->_cableClient, "qrCodeURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASCABLELoginChoice initWithQRCodeURL:](v6, "initWithQRCodeURL:", v7);

  return v8;
}

- (void)_presentAuthorizationRequestWithContext:(id)a3 implicitlySelectedLoginChoice:(id)a4 forProcess:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSXPCConnection *connection;
  void *v14;
  void *v15;
  ASCAuthorizationPresentationContext *v16;
  ASCAuthorizationPresentationContext *v17;
  NSString *clientApplicationIdentifier;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ASCAuthorizationPresentationContext *v25;
  ASCAuthorizationPresenter *v26;
  ASCAuthorizationPresenterHostProtocol *requestPresenter;
  NSObject *v28;
  ASCAuthorizationPresenterHostProtocol *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[16];
  _OWORD v37[2];

  v10 = a3;
  v11 = a4;
  v33 = a5;
  v32 = a6;
  v12 = (void *)MEMORY[0x24BDBCE50];
  connection = self->_connection;
  if (connection)
    -[NSXPCConnection auditToken](connection, "auditToken");
  else
    memset(v37, 0, sizeof(v37));
  objc_msgSend(v12, "dataWithBytes:length:", v37, 32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "globalFrameID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [ASCAuthorizationPresentationContext alloc];
  v17 = v16;
  clientApplicationIdentifier = self->_clientApplicationIdentifier;
  if (v15)
  {
    v31 = v11;
    v19 = objc_alloc(MEMORY[0x24BE82CE0]);
    objc_msgSend(v10, "globalFrameID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "webPageID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "globalFrameID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "webFrameID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v19, "initWithPageID:frameID:", v21, v23);
    v25 = -[ASCAuthorizationPresentationContext initWithRequestContext:appIdentifier:frameIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:](v17, "initWithRequestContext:appIdentifier:frameIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:", v10, clientApplicationIdentifier, v24, self->_isClientEntitledWebBrowser, v14);

    v11 = v31;
    if (v31)
    {
LABEL_6:
      -[ASCAuthorizationPresentationContext addLoginChoice:](v25, "addLoginChoice:", v11);
      goto LABEL_9;
    }
  }
  else
  {
    v25 = -[ASCAuthorizationPresentationContext initWithRequestContext:appIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:](v16, "initWithRequestContext:appIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:", v10, self->_clientApplicationIdentifier, self->_isClientEntitledWebBrowser, v14);
    if (v11)
      goto LABEL_6;
  }
  -[ASCAgent _configureLoginChoicesForPresentationContext:withRequestContext:](self, "_configureLoginChoicesForPresentationContext:withRequestContext:", v25, v10);
LABEL_9:
  if (!self->_requestPresenter)
  {
    v26 = objc_alloc_init(ASCAuthorizationPresenter);
    requestPresenter = self->_requestPresenter;
    self->_requestPresenter = (ASCAuthorizationPresenterHostProtocol *)v26;

    -[ASCAuthorizationPresenterHostProtocol setDelegate:](self->_requestPresenter, "setDelegate:", self);
  }
  v28 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20E648000, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AuthorizationRequestReceivedToShowingUI", ", buf, 2u);
  }
  v29 = self->_requestPresenter;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __111__ASCAgent__presentAuthorizationRequestWithContext_implicitlySelectedLoginChoice_forProcess_completionHandler___block_invoke;
  v34[3] = &unk_24C97EA18;
  v34[4] = self;
  v35 = v32;
  v30 = v32;
  -[ASCAuthorizationPresenterHostProtocol presentAuthorizationWithContext:forProcess:completionHandler:](v29, "presentAuthorizationWithContext:forProcess:completionHandler:", v25, v33, v34);

}

void __111__ASCAgent__presentAuthorizationRequestWithContext_implicitlySelectedLoginChoice_forProcess_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = 0;
  v7 = a3;
  v8 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_hasSignInOptionsForRequestContext:(id)a3
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (-[ASCAgent _hasAnyCredentialsAvailableForRequestContext:](self, "_hasAnyCredentialsAvailableForRequestContext:", v4))
  {
    LOBYTE(v5) = 1;
  }
  else if (objc_msgSend(v4, "isProxiedRequest"))
  {
    v5 = objc_msgSend(v4, "requestTypes") & 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_hasAnyCredentialsAvailableForRequestContext:(id)a3
{
  void *v3;
  BOOL v4;

  -[ASCAgent _allAvailableLoginChoicesForRequestContext:](self, "_allAvailableLoginChoicesForRequestContext:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)_clientHasNecessaryAuthKitEntitlements
{
  return -[ASCAgent _clientHasAuthKitDeveloperEntitlement](self, "_clientHasAuthKitDeveloperEntitlement")
      || -[ASCAgent _clientIsAuthKitOwner](self, "_clientIsAuthKitOwner")
      || -[ASCAgent _clientIsInternalAuthKit](self, "_clientIsInternalAuthKit")
      || -[ASCAgent _clientIsPrivateAuthKit](self, "_clientIsPrivateAuthKit");
}

- (BOOL)_clientIsAuthKitOwner
{
  void *v2;
  char v3;

  -[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", CFSTR("com.apple.authkit.client.owner"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)_clientHasAuthKitDeveloperEntitlement
{
  void *v2;
  void *v3;
  BOOL v4;

  -[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", CFSTR("com.apple.developer.applesignin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v4 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "length") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_clientIsInternalAuthKit
{
  void *v2;
  char v3;

  -[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", CFSTR("com.apple.authkit.client.internal"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)_clientIsPrivateAuthKit
{
  void *v2;
  char v3;

  -[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", CFSTR("com.apple.authkit.client.private"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)_bundleIDFromAppID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *authorizationActivity;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  -[ASCCredentialRequestContext proxiedBundleIdentifier](self->_requestContext, "proxiedBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASCCredentialRequestContext proxiedBundleIdentifier](self->_requestContext, "proxiedBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    objc_msgSend(v4, "safari_bundleIdentifierFromApplicationIdentifier:", &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v8 = v7;
    if (v7)
    {
      authorizationActivity = self->_authorizationActivity;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __31__ASCAgent__bundleIDFromAppID___block_invoke;
      v11[3] = &unk_24C97E868;
      v12 = v7;
      os_activity_apply(authorizationActivity, v11);

    }
  }

  return v6;
}

void __31__ASCAgent__bundleIDFromAppID___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __31__ASCAgent__bundleIDFromAppID___block_invoke_cold_1(a1, v2);
}

- (id)_teamIDfromAppID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *authorizationActivity;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  -[ASCCredentialRequestContext proxiedTeamIdentifier](self->_requestContext, "proxiedTeamIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASCCredentialRequestContext proxiedTeamIdentifier](self->_requestContext, "proxiedTeamIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    objc_msgSend(v4, "safari_teamIdentifierFromApplicationIdentifier:", &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v8 = v7;
    if (v7)
    {
      authorizationActivity = self->_authorizationActivity;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __29__ASCAgent__teamIDfromAppID___block_invoke;
      v11[3] = &unk_24C97E868;
      v12 = v7;
      os_activity_apply(authorizationActivity, v11);

    }
  }

  return v6;
}

void __29__ASCAgent__teamIDfromAppID___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __29__ASCAgent__teamIDfromAppID___block_invoke_cold_1(a1, v2);
}

- (void)_performAuthKitAuthorizationValidationForAccount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  NSObject *authorizationActivity;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE0AD18]);
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setAuthkitAccount:", v4);
    v7 = objc_alloc_init(MEMORY[0x24BE0AD60]);
    objc_msgSend(v7, "setAuthorizationRequest:", v6);
    v15 = 0;
    v8 = objc_msgSend(MEMORY[0x24BE0AD38], "canPerformAuthorizationRequest:error:", v7, &v15);
    v9 = v15;
    v10 = v9;
    if (v9)
    {
      authorizationActivity = self->_authorizationActivity;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __61__ASCAgent__performAuthKitAuthorizationValidationForAccount___block_invoke;
      v13[3] = &unk_24C97E868;
      v14 = v9;
      os_activity_apply(authorizationActivity, v13);

    }
    self->_existingAppleIDCredentialAvailableForLogIn = v8;

  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ASCAgent _performAuthKitAuthorizationValidationForAccount:].cold.1();
    self->_existingAppleIDCredentialAvailableForLogIn = 0;
  }

}

void __61__ASCAgent__performAuthKitAuthorizationValidationForAccount___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__ASCAgent__performAuthKitAuthorizationValidationForAccount___block_invoke_cold_1(a1, v2);
}

- (unsigned)_approvalStateForApplicationIdentifier:(id)a3 relyingParty:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *authorizationActivity;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unsigned __int8 v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  dispatch_time_t v27;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v39[6];
  NSObject *v40;
  uint64_t *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  id v54;
  _QWORD block[4];
  id v56;
  id v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _QWORD v60[5];

  v60[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v33 = a4;
  v57 = 0;
  v37 = v5;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "safari_initWithExtensionApplicationIdentifier:error:", v37, &v57);
  v6 = v57;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", *MEMORY[0x24BDD1100], -10814) & 1) == 0)
  {
    authorizationActivity = self->_authorizationActivity;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke;
    block[3] = &unk_24C97E868;
    v56 = v7;
    os_activity_apply(authorizationActivity, block);

  }
  v9 = *MEMORY[0x24BE830C0];
  v60[0] = CFSTR("com.apple.AppSSO.idp-extension");
  v60[1] = v9;
  v60[2] = CFSTR("com.apple.ui-services");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "extensionPointRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v37;
  if (v35)
  {
    v36 = v37;
    if (objc_msgSend(v31, "containsObject:", v35))
    {
      objc_msgSend(v34, "containingBundleRecord");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "applicationIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v12 = objc_alloc(MEMORY[0x24BE8F730]);
  v32 = (void *)objc_msgSend(v12, "initWithServiceType:applicationIdentifier:domain:", *MEMORY[0x24BE8F768], v36, v33);
  v54 = v7;
  objc_msgSend(MEMORY[0x24BE8F728], "serviceDetailsWithServiceSpecifier:error:", v32, &v54);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v54;

  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 2;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v47;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v47 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v17);
        if (*((_BYTE *)v51 + 24) == 2
          && !objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v17), "siteApprovalState", v29))
        {
          *((_BYTE *)v51 + 24) = 0;
        }
        else if (objc_msgSend(v18, "isApproved", v29))
        {
          *((_BYTE *)v51 + 24) = 1;
          goto LABEL_21;
        }
        ++v17;
      }
      while (v15 != v17);
      v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
      v15 = v19;
    }
    while (v19);
  }
LABEL_21:
  v30 = v14;

  v20 = *((_BYTE *)v51 + 24);
  if (!v20)
  {
    v21 = dispatch_group_create();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v22 = v14;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v43 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if (!objc_msgSend(v26, "siteApprovalState", v29))
          {
            os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_230);
            dispatch_group_enter(v21);
            v39[0] = MEMORY[0x24BDAC760];
            v39[1] = 3221225472;
            v39[2] = __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_231;
            v39[3] = &unk_24C97F070;
            v41 = &v50;
            v39[4] = self;
            v39[5] = v26;
            v40 = v21;
            objc_msgSend(v26, "waitForSiteApprovalWithCompletionHandler:", v39);

          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
      }
      while (v23);
    }

    v27 = dispatch_time(0, 1000000000);
    dispatch_group_wait(v21, v27);

    v20 = *((_BYTE *)v51 + 24);
  }
  _Block_object_dispose(&v50, 8);

  return v20;
}

void __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_cold_1(a1, v2);
}

void __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_229()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_DEFAULT, "SWC approval state was unspecified, will wait for approval", v1, 2u);
  }
}

void __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_231(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  char v8;
  id v9;
  uint64_t block;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
    block = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_2;
    v13 = &unk_24C97E868;
    v14 = v5;
    os_activity_apply(v7, &block);

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 2
    && !objc_msgSend(*(id *)(a1 + 40), "siteApprovalState", v9))
  {
    v8 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isApproved", v9, block, v11, v12, v13))
  {
    v8 = 1;
LABEL_8:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_2_cold_1(a1, v2);
}

- (BOOL)_isClientWithApplicationIdentifier:(id)a3 properlyEntitledForRequestContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSXPCConnection *connection;
  NSObject *authorizationActivity;
  void *v12;
  id v13;
  void *v14;
  char v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  const __CFString **v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD block[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const __CFString *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  const __CFString *v86;
  uint64_t v87;
  const __CFString *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  _QWORD v94[3];

  v94[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "requestStyle") == 2)
  {
    connection = self->_connection;
    if (connection)
    {
      -[NSXPCConnection auditToken](connection, "auditToken");
    }
    else
    {
      v73 = 0u;
      v74 = 0u;
    }
    if (WBSAuditTokenHasEntitlement())
    {
      authorizationActivity = self->_authorizationActivity;
      v12 = &__block_literal_global_233;
LABEL_13:
      os_activity_apply(authorizationActivity, v12);
      goto LABEL_14;
    }
    if (objc_msgSend(v9, "requestTypes") == 8)
    {
      authorizationActivity = self->_authorizationActivity;
      if (!self->_isClientEntitledWebBrowser)
      {
        os_activity_apply(authorizationActivity, &__block_literal_global_235);
        if (a5)
        {
          v21 = (void *)MEMORY[0x24BDD1540];
          v93 = *MEMORY[0x24BDD0FD8];
          v94[0] = CFSTR("Only entitled web browsers can make this request.");
          v22 = (void *)MEMORY[0x24BDBCE70];
          v23 = (const __CFString **)v94;
          v24 = &v93;
          goto LABEL_27;
        }
LABEL_60:
        v16 = 0;
        goto LABEL_42;
      }
      v12 = &__block_literal_global_239;
      goto LABEL_13;
    }
    if (objc_msgSend(v9, "requestTypes") != 4)
    {
      v38 = self->_authorizationActivity;
      v69[0] = MEMORY[0x24BDAC760];
      v69[1] = 3221225472;
      v69[2] = __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_249;
      v69[3] = &unk_24C97E868;
      v70 = v9;
      os_activity_apply(v38, v69);
      if (a5)
      {
        v39 = (void *)MEMORY[0x24BDD1540];
        v87 = *MEMORY[0x24BDD0FD8];
        v88 = CFSTR("Silent requests are only allowed for platform assertions.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v40);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v16 = 0;
      v13 = v70;
      goto LABEL_41;
    }
    if (self->_isClientEntitledWebBrowser)
    {
      authorizationActivity = self->_authorizationActivity;
      v12 = &__block_literal_global_241;
      goto LABEL_13;
    }
    objc_msgSend(v9, "relyingPartyIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[ASCAgent _approvalStateForApplicationIdentifier:relyingParty:](self, "_approvalStateForApplicationIdentifier:relyingParty:", v8, v52);

    switch(v53)
    {
      case 0:
        if (a5)
        {
          v54 = (void *)MEMORY[0x24BDD1540];
          v91 = *MEMORY[0x24BDD0FD8];
          v55 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v9, "relyingPartyIdentifier");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "stringWithFormat:", CFSTR("Unable to verify webcredentials association of %@ with domain %@. Please try again in a few seconds."), v8, v13);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = v56;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v57);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_53:
          v16 = 0;
          goto LABEL_41;
        }
        goto LABEL_60;
      case 2:
        v58 = self->_authorizationActivity;
        v71[0] = MEMORY[0x24BDAC760];
        v71[1] = 3221225472;
        v71[2] = __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_246;
        v71[3] = &unk_24C97E868;
        v59 = v9;
        v72 = v59;
        os_activity_apply(v58, v71);
        if (a5)
        {
          v60 = (void *)MEMORY[0x24BDD1540];
          v89 = *MEMORY[0x24BDD0FD8];
          v61 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v59, "relyingPartyIdentifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "stringWithFormat:", CFSTR("Application with identifier %@ is not associated with domain %@"), v8, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v63;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v64);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v16 = 0;
        v13 = v72;
        goto LABEL_41;
      case 1:
        authorizationActivity = self->_authorizationActivity;
        v12 = &__block_literal_global_243;
        goto LABEL_13;
    }
  }
LABEL_14:
  if (!objc_msgSend(v9, "isProxiedRequest"))
  {
    objc_msgSend(v9, "relyingPartyIdentifier");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "platformKeyCredentialCreationOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attestationPreference");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "isEqualToString:", CFSTR("enterprise"))
      && (+[ASFeatureManager sharedManager](ASFeatureManager, "sharedManager"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "canRequestEnterpriseAttestationForRelyingParty:", v13),
          v19,
          (v20 & 1) == 0))
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_262);
      if (a5)
      {
        v34 = (void *)MEMORY[0x24BDD1540];
        v81 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This device is not configured to allow enterprise attestation for “%@”."), v13);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v35;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v36);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (self->_isClientEntitledWebBrowser)
      {
        os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_266);
LABEL_24:
        v16 = 1;
LABEL_40:

        goto LABEL_41;
      }
      if (objc_msgSend(v9, "isUsingWebBrowserOnlyOptions"))
      {
        os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_268);
        if (a5)
        {
          v25 = (void *)MEMORY[0x24BDD1540];
          v79 = *MEMORY[0x24BDD0FD8];
          v80 = CFSTR("Only entitled web browsers can use these options.");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v26);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      if (!v13)
        goto LABEL_24;
      v27 = -[ASCAgent _approvalStateForApplicationIdentifier:relyingParty:](self, "_approvalStateForApplicationIdentifier:relyingParty:", v8, v13);
      if (v27)
      {
        if (v27 != 2)
          goto LABEL_24;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Application with identifier %@ is not associated with domain %@"), v8, v13);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v28;
        if (a5)
        {
          v30 = (void *)MEMORY[0x24BDD1540];
          v77 = *MEMORY[0x24BDD0FD8];
          v78 = v28;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v31);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v32 = self->_authorizationActivity;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_271;
        block[3] = &unk_24C97E868;
        v66 = v29;
        v33 = v29;
        os_activity_apply(v32, block);

      }
      else if (a5)
      {
        v41 = (void *)MEMORY[0x24BDD1540];
        v75 = *MEMORY[0x24BDD0FD8];
        v42 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v9, "relyingPartyIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "stringWithFormat:", CFSTR("Unable to verify webcredentials association of %@ with domain %@. Please try again in a few seconds."), v8, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v44;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v45);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v16 = 0;
    goto LABEL_40;
  }
  if (!-[ASCAgent _connection:hasEntitlement:](self, "_connection:hasEntitlement:", self->_connection, CFSTR("com.apple.authentication-services-core.allow-authentication-request-proxying")))
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_253);
    if (a5)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      v85 = *MEMORY[0x24BDD0FD8];
      v86 = CFSTR("Client does not have entitlement for using proxied credential request context.");
      v22 = (void *)MEMORY[0x24BDBCE70];
      v23 = &v86;
      v24 = &v85;
LABEL_27:
      objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v13);
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
    goto LABEL_60;
  }
  objc_msgSend(v9, "relyingPartyIdentifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (!self->_isClientEntitledWebBrowser)
    {
      objc_msgSend(v9, "proxiedAssociatedDomains");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v13);

      if ((v15 & 1) == 0)
      {
        v46 = self->_authorizationActivity;
        v67[0] = MEMORY[0x24BDAC760];
        v67[1] = 3221225472;
        v67[2] = __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_256;
        v67[3] = &unk_24C97E868;
        v13 = v13;
        v68 = v13;
        os_activity_apply(v46, v67);
        if (a5)
        {
          v47 = (void *)MEMORY[0x24BDD1540];
          v83 = *MEMORY[0x24BDD0FD8];
          v48 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v9, "proxiedAppName");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", CFSTR("\"%@\" is not associated with domain \"%@\"."), v49, v13);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = v50;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v51);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_53;
      }
    }
  }
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_260);
  v16 = 1;
LABEL_41:

LABEL_42:
  return v16;
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_INFO, "Allowing silent internal request.", v1, 2u);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_234()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_234_cold_1();
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_238()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_INFO, "Allowing silent request from web browser.", v1, 2u);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_240()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_INFO, "Allowing conditional request from web browser.", v1, 2u);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_242()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_INFO, "Allowing conditional request from associated app.", v1, 2u);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_246(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_246_cold_1(a1, v2);
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_249(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_249_cold_1(a1, v2);
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_252()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_252_cold_1();
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_256()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_256_cold_1();
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_259()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_DEFAULT, "Allowing proxied request.", v1, 2u);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_261()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_261_cold_1();
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_265()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_DEFAULT, "Allowing request from web browser.", v1, 2u);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_267()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_267_cold_1();
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_271()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_271_cold_1();
}

- (BOOL)_shouldApplyQuirksToClientWithApplicationIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD1488], "safari_isSafariFamilyBundleIdentifier:", v3) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82FD0]);

  return v4;
}

- (BOOL)_shouldAddCABLEChoiceForRequestContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "requestTypes");
  if ((ascCredentialRequestTypesAllPublicKey() & v5) == 0
    || objc_msgSend(v4, "requestStyle") == 2
    || !+[_ASDevice isCABLEClient](_ASDevice, "isCABLEClient")
    || !+[ASCWebKitSPISupport shouldUseAlternateCredentialStore](ASCWebKitSPISupport, "shouldUseAlternateCredentialStore")|| (objc_msgSend(v4, "isProxiedRequest") & 1) != 0|| (objc_msgSend(v4, "isCABLEAuthenticatorRequest") & 1) != 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(v4, "platformKeyCredentialCreationOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "shouldHideHybrid"))
  {

    goto LABEL_10;
  }
  objc_msgSend(v4, "platformKeyCredentialAssertionOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldHideHybrid");

  if ((v8 & 1) != 0)
    goto LABEL_10;
  if (!objc_msgSend(v4, "isRegistrationRequest"))
  {
    if (!self->_isClientEntitledWebBrowser && (v5 & 8) == 0)
      goto LABEL_10;
    if ((v5 & 8) != 0)
      objc_msgSend(v4, "platformKeyCredentialAssertionOptions");
    else
      objc_msgSend(v4, "securityKeyCredentialAssertionOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allowedCredentials");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
      v9 = objc_msgSend(v11, "safari_containsObjectPassingTest:", &__block_literal_global_274);
    else
      v9 = 1;
LABEL_27:

    goto LABEL_11;
  }
  if (!self->_isClientEntitledWebBrowser)
  {
    v9 = v5 != 16;
    goto LABEL_11;
  }
  if (v5 != 4)
  {
    if (v5 != 16)
    {
      v9 = 1;
      goto LABEL_11;
    }
    objc_msgSend(v4, "securityKeyCredentialCreationOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "residentKeyPreference") != 1;
    goto LABEL_27;
  }
LABEL_10:
  v9 = 0;
LABEL_11:

  return v9;
}

uint64_t __51__ASCAgent__shouldAddCABLEChoiceForRequestContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "transports");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") && (objc_msgSend(v2, "hasInternalTransport") & 1) == 0)
    v4 = objc_msgSend(v2, "hasCABLETransport");
  else
    v4 = 1;

  return v4;
}

- (void)authorizationPresenter:(id)a3 credentialRequestedForLoginChoice:(id)a4 authenticatedContext:(id)a5 completionHandler:(id)a6
{
  -[ASCAgent userSelectedLoginChoice:authenticatedContext:completionHandler:](self, "userSelectedLoginChoice:authenticatedContext:completionHandler:", a4, a5, a6);
}

- (void)_credentialRequestedForPasswordLoginChoice:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  ASCPasswordCredential *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ASCPasswordCredential *v22;
  ASCAgent *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = self;
  v8 = self->_passwordCredentials;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
      objc_msgSend(v6, "username");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "user");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

      if ((v16 & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v17 = [ASCPasswordCredential alloc];
    objc_msgSend(v13, "user");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "password");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "site");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "creationDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[ASCPasswordCredential initWithUser:password:site:creationDate:externalProviderBundleIdentifier:](v17, "initWithUser:password:site:creationDate:externalProviderBundleIdentifier:", v18, v19, v20, v21, 0);

    if (!v22)
      goto LABEL_12;
    v7[2](v7, v22, 0);
  }
  else
  {
LABEL_9:

LABEL_12:
    os_activity_apply((os_activity_t)v23->_authorizationActivity, &__block_literal_global_276);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, 0);
    v22 = (ASCPasswordCredential *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, ASCPasswordCredential *))v7)[2](v7, 0, v22);
  }

}

void __73__ASCAgent__credentialRequestedForPasswordLoginChoice_completionHandler___block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __73__ASCAgent__credentialRequestedForPasswordLoginChoice_completionHandler___block_invoke_cold_1();
}

- (void)_credentialRequestedForPlatformLoginChoice:(id)a3 authenticatedContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id passkeyCredentialCallback;
  int v11;
  ASPublicKeyCredentialManagerInterface *publicKeyCredentialManager;
  void *v13;
  void *v14;
  NSUUID *v15;
  NSUUID *publicKeyCredentialOperationUUID;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = _Block_copy(a5);
  passkeyCredentialCallback = self->_passkeyCredentialCallback;
  self->_passkeyCredentialCallback = v9;

  v11 = objc_msgSend(v17, "isRegistrationRequest");
  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  if (v11)
  {
    -[ASCCredentialRequestContext platformKeyCredentialCreationOptions](self->_requestContext, "platformKeyCredentialCreationOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCCredentialRequestContext globalFrameID](self->_requestContext, "globalFrameID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASPublicKeyCredentialManagerInterface createNewPlatformCredentialWithOptions:authenticatedContext:delegate:webFrameIdentifier:parentActivity:isConditionalRegistration:](publicKeyCredentialManager, "createNewPlatformCredentialWithOptions:authenticatedContext:delegate:webFrameIdentifier:parentActivity:isConditionalRegistration:", v13, v8, self, v14, self->_authorizationActivity, -[ASCCredentialRequestContext isConditionalRegistrationRequest](self->_requestContext, "isConditionalRegistrationRequest"));
    v15 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    publicKeyCredentialOperationUUID = self->_publicKeyCredentialOperationUUID;
    self->_publicKeyCredentialOperationUUID = v15;

  }
  else
  {
    -[ASPublicKeyCredentialManagerInterface assertUsingPlatformCredentialForLoginChoice:authenticatedContext:](self->_publicKeyCredentialManager, "assertUsingPlatformCredentialForLoginChoice:authenticatedContext:", v17, v8);
  }

}

- (void)_credentialRequestedForSecurityKeyLoginChoice:(id)a3
{
  id v4;
  uint64_t v5;
  ASPublicKeyCredentialManagerInterface *publicKeyCredentialManager;
  void *v7;
  void *v8;
  id v9;
  ASPublicKeyCredentialManagerInterface *v10;
  NSUUID *publicKeyCredentialOperationUUID;
  void *v12;
  ASPublicKeyCredentialManagerInterface *v13;
  NSString *clientApplicationIdentifier;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "credentialKind");
  switch(v5)
  {
    case 0:
      publicKeyCredentialManager = self->_publicKeyCredentialManager;
      -[ASCCredentialRequestContext securityKeyCredentialCreationOptions](self->_requestContext, "securityKeyCredentialCreationOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCCredentialRequestContext globalFrameID](self->_requestContext, "globalFrameID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)-[ASPublicKeyCredentialManagerInterface beginCreatingNewSecurityKeyCredentialIfAvailableWithOptions:delegate:webFrameIdentifier:parentActivity:](publicKeyCredentialManager, "beginCreatingNewSecurityKeyCredentialIfAvailableWithOptions:delegate:webFrameIdentifier:parentActivity:", v7, self, v8, self->_authorizationActivity);
      goto LABEL_8;
    case 2:
      if (-[ASCCredentialRequestContext requestStyle](self->_requestContext, "requestStyle") != 1)
        break;
      v10 = self->_publicKeyCredentialManager;
      publicKeyCredentialOperationUUID = self->_publicKeyCredentialOperationUUID;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 12, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASPublicKeyCredentialManagerInterface cancelOperationIfNecessaryWithUUID:overrideError:](v10, "cancelOperationIfNecessaryWithUUID:overrideError:", publicKeyCredentialOperationUUID, v12);

      v13 = self->_publicKeyCredentialManager;
      -[ASCCredentialRequestContext securityKeyCredentialAssertionOptions](self->_requestContext, "securityKeyCredentialAssertionOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      clientApplicationIdentifier = self->_clientApplicationIdentifier;
      -[ASCCredentialRequestContext globalFrameID](self->_requestContext, "globalFrameID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)-[ASPublicKeyCredentialManagerInterface beginAssertionsWithOptions:forProcessWithApplicationIdentifier:delegate:requestStyle:webFrameIdentifier:parentActivity:](v13, "beginAssertionsWithOptions:forProcessWithApplicationIdentifier:delegate:requestStyle:webFrameIdentifier:parentActivity:", v8, clientApplicationIdentifier, self, 0, v15, self->_authorizationActivity);

LABEL_8:
      break;
    case 1:
      -[ASPublicKeyCredentialManagerInterface assertUsingSecurityKeyCredentialForLoginChoice:](self->_publicKeyCredentialManager, "assertUsingSecurityKeyCredentialForLoginChoice:", v4);
      break;
  }

}

- (void)_credentialRequestedForCABLELoginChoice:(id)a3
{
  _BOOL4 didStartCABLEClient;
  NSObject *authorizationActivity;
  uint64_t v6;
  void *v7;
  void *v8;
  _TtC26AuthenticationServicesCore13ASCABLEClient *cableClient;
  void *v10;
  _TtC26AuthenticationServicesCore13ASCABLEClient *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _TtC26AuthenticationServicesCore13ASCABLEClient *v16;
  _QWORD aBlock[5];

  didStartCABLEClient = self->_didStartCABLEClient;
  authorizationActivity = self->_authorizationActivity;
  if (didStartCABLEClient)
  {
    os_activity_apply(authorizationActivity, &__block_literal_global_277);
  }
  else
  {
    os_activity_apply(authorizationActivity, &__block_literal_global_279);
    v6 = MEMORY[0x24BDAC760];
    self->_didStartCABLEClient = 1;
    aBlock[0] = v6;
    aBlock[1] = 3221225472;
    aBlock[2] = __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke_280;
    aBlock[3] = &unk_24C97F2C0;
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    -[ASCCredentialRequestContext platformKeyCredentialAssertionOptions](self->_requestContext, "platformKeyCredentialAssertionOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      || (-[ASCCredentialRequestContext securityKeyCredentialAssertionOptions](self->_requestContext, "securityKeyCredentialAssertionOptions"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      cableClient = self->_cableClient;
      objc_msgSend(v8, "relyingPartyIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = cableClient;
      v12 = 1;
    }
    else
    {
      -[ASCCredentialRequestContext platformKeyCredentialCreationOptions](self->_requestContext, "platformKeyCredentialCreationOptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        -[ASCCredentialRequestContext securityKeyCredentialCreationOptions](self->_requestContext, "securityKeyCredentialCreationOptions");
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v8 = v15;

      v16 = self->_cableClient;
      objc_msgSend(v8, "relyingPartyIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      v12 = 0;
    }
    -[ASCABLEClient performAuthenticationOperation:forRelyingPartyIdentifier:completionHandler:](v11, "performAuthenticationOperation:forRelyingPartyIdentifier:completionHandler:", v12, v10, v7);

  }
}

void __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_DEFAULT, "caBLE client already started", v1, 2u);
  }
}

void __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke_278()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_DEFAULT, "Starting caBLE client", v1, 2u);
  }
}

void __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke_280(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "requestStyle") != 1)
  {
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError")))
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == 16)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "updateInterfaceForUserVisibleError:", v6);
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "_authorizationCompletedWithCredential:error:", v5, v6);
    goto LABEL_11;
  }
  if (v6 && objc_msgSend(v6, "code") == 12)
  {
    os_activity_apply(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 176), &__block_literal_global_281);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 72);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke_282;
    v11[3] = &unk_24C97F298;
    v11[4] = v9;
    v12 = v5;
    v13 = v6;
    objc_msgSend(v10, "authorizationRequestFinishedWithCredential:error:completionHandler:", v12, v13, v11);

  }
LABEL_11:

}

void __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_DEFAULT, "Not propagating internal cancel for caBLE in AutoFill", v1, 2u);
  }
}

uint64_t __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke_282(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_authorizationCompletedWithCredential:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)_canPerformConditionalRegistrationInICloudKeychainForUsername:(id)a3 relyingParty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE82CC8], "isAutomaticPasskeyUpgradesEnabled"))
  {
    if (!-[ASPublicKeyCredentialManagerInterface passkeyExistsForRelyingParty:username:](self->_publicKeyCredentialManager, "passkeyExistsForRelyingParty:username:", v7, v6))
    {
      v9 = 1;
      goto LABEL_7;
    }
    v8 = &__block_literal_global_285;
  }
  else
  {
    v8 = &__block_literal_global_283;
  }
  os_activity_apply((os_activity_t)self->_authorizationActivity, v8);
  v9 = 0;
LABEL_7:

  return v9;
}

void __87__ASCAgent__canPerformConditionalRegistrationInICloudKeychainForUsername_relyingParty___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_INFO, "Automatic passkey upgrades is off", v1, 2u);
  }
}

void __87__ASCAgent__canPerformConditionalRegistrationInICloudKeychainForUsername_relyingParty___block_invoke_284()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_INFO, "Matching passkey already exists.", v1, 2u);
  }
}

- (void)authorizationPresenter:(id)a3 validateUserEnteredPIN:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  id pinResultCallback;
  void *userEnteredPINCallback;
  NSObject *authorizationActivity;
  void (**v12)(id, _QWORD, void *);
  id v13;

  v13 = a4;
  if (self->_userEnteredPINCallback)
  {
    v7 = a5;
    v8 = _Block_copy(v7);

    pinResultCallback = self->_pinResultCallback;
    self->_pinResultCallback = v8;

    (*((void (**)(void))self->_userEnteredPINCallback + 2))();
    userEnteredPINCallback = self->_userEnteredPINCallback;
    self->_userEnteredPINCallback = 0;
  }
  else
  {
    authorizationActivity = self->_authorizationActivity;
    v12 = (void (**)(id, _QWORD, void *))a5;
    os_activity_apply(authorizationActivity, &__block_literal_global_286);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, 0);
    userEnteredPINCallback = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, userEnteredPINCallback);

  }
}

void __76__ASCAgent_authorizationPresenter_validateUserEnteredPIN_completionHandler___block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __76__ASCAgent_authorizationPresenter_validateUserEnteredPIN_completionHandler___block_invoke_cold_1();
}

- (void)authorizationPresenter:(id)a3 startCABLEAuthenticationWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _TtC26AuthenticationServicesCore20ASCABLEAuthenticator *v9;
  NSURL *cableAuthenticationURL;
  _TtC26AuthenticationServicesCore20ASCABLEAuthenticator *v11;
  id v12;
  _TtC26AuthenticationServicesCore20ASCABLEAuthenticator *cableAuthenticator;
  OS_os_activity *v14;
  _TtC26AuthenticationServicesCore20ASCABLEAuthenticator *v15;
  OS_os_activity *v16;
  NSObject *authorizationActivity;
  id v18;
  _QWORD v19[4];
  OS_os_activity *v20;
  id v21;
  id v22;
  id v23;
  id location;
  _QWORD block[4];
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_287);
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [_TtC26AuthenticationServicesCore20ASCABLEAuthenticator alloc];
  cableAuthenticationURL = self->_cableAuthenticationURL;
  v27 = 0;
  v11 = -[ASCABLEAuthenticator initWithCaBLEURL:error:](v9, "initWithCaBLEURL:error:", cableAuthenticationURL, &v27);
  v12 = v27;
  cableAuthenticator = self->_cableAuthenticator;
  self->_cableAuthenticator = v11;

  if (self->_cableAuthenticator)
  {
    objc_initWeak(&location, self);
    v14 = self->_authorizationActivity;
    v15 = self->_cableAuthenticator;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_290;
    v19[3] = &unk_24C97F3A8;
    objc_copyWeak(&v23, &location);
    v16 = v14;
    v20 = v16;
    v22 = v7;
    v21 = v8;
    -[ASCABLEAuthenticator startWithCompletionHandler:](v15, "startWithCompletionHandler:", v19);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    authorizationActivity = self->_authorizationActivity;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_289;
    block[3] = &unk_24C97E868;
    v18 = v12;
    v26 = v18;
    os_activity_apply(authorizationActivity, block);
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v18);

  }
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_DEFAULT, "Starting caBLE authentication", v1, 2u);
  }
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_289(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_289_cold_1(a1, v2);
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_290(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 7);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      v9 = WeakRetained[22];
      v10 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_293;
      block[3] = &unk_24C97E868;
      v11 = v5;
      v21 = v11;
      os_activity_apply(v9, block);
      v12 = a1[5];
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_294;
      v15[3] = &unk_24C97F3A8;
      objc_copyWeak(&v19, a1 + 7);
      v16 = a1[4];
      v18 = a1[6];
      v17 = a1[5];
      objc_msgSend(v8, "_prepareForAuthorizationRequestsForContext:clientConnection:withPresentationHandler:", v11, v12, v15);

      objc_destroyWeak(&v19);
      v13 = v21;
    }
    else
    {
      v14 = a1[4];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_292;
      v22[3] = &unk_24C97E868;
      v23 = v6;
      os_activity_apply(v14, v22);
      (*((void (**)(void))a1[6] + 2))();
      v13 = v23;
    }

  }
  else
  {
    os_activity_apply((os_activity_t)a1[4], &__block_literal_global_291);
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_2()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_2_cold_1();
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_292(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_292_cold_1(a1, v2);
}

uint64_t __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_293(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_20E648000, v2, OS_LOG_TYPE_INFO, "Beginning caBLE request: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "logRequest");
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_294(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  ASCAuthorizationPresentationContext *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  ASCAuthorizationPresentationContext *v13;
  uint64_t v14;
  _OWORD v15[2];
  _QWORD block[4];
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5)
    {
      v8 = [ASCAuthorizationPresentationContext alloc];
      v9 = (void *)MEMORY[0x24BDBCE50];
      v10 = *(void **)(a1 + 40);
      if (v10)
        objc_msgSend(v10, "auditToken");
      else
        memset(v15, 0, sizeof(v15));
      objc_msgSend(v9, "dataWithBytes:length:", v15, 32);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[ASCAuthorizationPresentationContext initWithRequestContext:appIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:](v8, "initWithRequestContext:appIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:", v5, 0, 1, v12);

      objc_msgSend(WeakRetained, "_configureLoginChoicesForPresentationContext:withRequestContext:", v13, v5);
      (*(void (**)(_QWORD, ASCAuthorizationPresentationContext *, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48)
                                                                                             + 16))(*(_QWORD *)(a1 + 48), v13, 0, v14);

    }
    else
    {
      v11 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_297;
      block[3] = &unk_24C97E868;
      v17 = v6;
      os_activity_apply(v11, block);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  else
  {
    os_activity_apply(*(os_activity_t *)(a1 + 32), &__block_literal_global_296);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_2_295()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_2_295_cold_1();
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_297(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_297_cold_1(a1, v2);
}

- (void)authorizationPresenter:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5
{
  -[ASCAgent _authorizationCompletedWithCredential:error:](self, "_authorizationCompletedWithCredential:error:", a4, a5);
}

- (void)didFetchPlatformLoginChoices:(id)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *platformLoginChoices;
  void (**didLoadPlatformCredentialsCallback)(void);
  id v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v10, "safari_filterObjectsUsingBlock:", &__block_literal_global_300);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (NSArray *)v10;
  }
  platformLoginChoices = self->_platformLoginChoices;
  self->_platformLoginChoices = v6;

  didLoadPlatformCredentialsCallback = (void (**)(void))self->_didLoadPlatformCredentialsCallback;
  if (didLoadPlatformCredentialsCallback)
  {
    didLoadPlatformCredentialsCallback[2]();
    v9 = self->_didLoadPlatformCredentialsCallback;
    self->_didLoadPlatformCredentialsCallback = 0;

  }
}

BOOL __41__ASCAgent_didFetchPlatformLoginChoices___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  if (objc_msgSend(v2, "isSharedCredential"))
  {
    objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "groupID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cachedGroupWithID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)didFetchSecurityKeyLoginChoices:(id)a3
{
  id v5;
  ASCAuthorizationPresenterHostProtocol *requestPresenter;
  id v7;

  objc_storeStrong((id *)&self->_securityKeyLoginChoices, a3);
  v5 = a3;
  requestPresenter = self->_requestPresenter;
  -[ASCAgent _allAvailableLoginChoicesForRequestContext:](self, "_allAvailableLoginChoicesForRequestContext:", self->_requestContext);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCAuthorizationPresenterHostProtocol updateInterfaceWithLoginChoices:](requestPresenter, "updateInterfaceWithLoginChoices:", v7);

}

- (void)requestPINWithRemainingRetries:(unint64_t)a3 completionHandler:(id)a4
{
  void (**userEnteredPINCallback)(id, _QWORD);
  void *v6;
  id v7;
  id aBlock;

  aBlock = a4;
  userEnteredPINCallback = (void (**)(id, _QWORD))self->_userEnteredPINCallback;
  if (userEnteredPINCallback)
    userEnteredPINCallback[2](userEnteredPINCallback, 0);
  v6 = _Block_copy(aBlock);
  v7 = self->_userEnteredPINCallback;
  self->_userEnteredPINCallback = v6;

  -[ASCAuthorizationPresenterHostProtocol presentPINEntryInterface](self->_requestPresenter, "presentPINEntryInterface");
}

- (void)didReceiveError:(int64_t)a3
{
  uint64_t v5;
  NSObject *authorizationActivity;
  id v7;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), a3, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v5;
  if ((unint64_t)a3 > 0xD)
    goto LABEL_10;
  if (((1 << a3) & 0x2070) != 0)
  {
    -[ASCAuthorizationPresenterHostProtocol updateInterfaceForUserVisibleError:](self->_requestPresenter, "updateInterfaceForUserVisibleError:", v5, v5);
    goto LABEL_6;
  }
  if (((1 << a3) & 0x700) != 0)
  {
    (*((void (**)(id))self->_pinResultCallback + 2))(self->_pinResultCallback);
    goto LABEL_6;
  }
  if (a3 != 7)
  {
LABEL_10:
    authorizationActivity = self->_authorizationActivity;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__ASCAgent_didReceiveError___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a3;
    os_activity_apply(authorizationActivity, block);
    goto LABEL_6;
  }
  if (-[ASCCredentialRequestContext isCABLEAuthenticatorRequest](self->_requestContext, "isCABLEAuthenticatorRequest", v5, v5))
  {
    -[ASCABLEAuthenticator sendExcludedCredentialMatchError](self->_cableAuthenticator, "sendExcludedCredentialMatchError");
  }
LABEL_6:

}

void __28__ASCAgent_didReceiveError___block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __28__ASCAgent_didReceiveError___block_invoke_cold_1();
}

- (void)didCompleteRegistrationWithCredential:(id)a3 error:(id)a4
{
  void (**passkeyCredentialCallback)(id, id, id);
  id v6;

  passkeyCredentialCallback = (void (**)(id, id, id))self->_passkeyCredentialCallback;
  if (passkeyCredentialCallback)
  {
    passkeyCredentialCallback[2](passkeyCredentialCallback, a3, a4);
    v6 = self->_passkeyCredentialCallback;
    self->_passkeyCredentialCallback = 0;

  }
  else
  {
    -[ASCAgent _authorizationCompletedWithCredential:error:](self, "_authorizationCompletedWithCredential:error:", a3, a4);
  }
}

- (void)didCompleteAssertionWithCredential:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void (**passkeyCredentialCallback)(id, id, id);
  id v9;
  ASCAuthorizationPresenterHostProtocol *requestPresenter;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  passkeyCredentialCallback = (void (**)(id, id, id))self->_passkeyCredentialCallback;
  if (passkeyCredentialCallback)
  {
    passkeyCredentialCallback[2](passkeyCredentialCallback, v6, v7);
    v9 = self->_passkeyCredentialCallback;
    self->_passkeyCredentialCallback = 0;
  }
  else
  {
    if (-[ASCCredentialRequestContext requestStyle](self->_requestContext, "requestStyle") != 1
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      -[ASCAgent _authorizationCompletedWithCredential:error:](self, "_authorizationCompletedWithCredential:error:", v6, v7);
      goto LABEL_8;
    }
    requestPresenter = self->_requestPresenter;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__ASCAgent_didCompleteAssertionWithCredential_error___block_invoke;
    v11[3] = &unk_24C97F298;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    -[ASCAuthorizationPresenterHostProtocol authorizationRequestFinishedWithCredential:error:completionHandler:](requestPresenter, "authorizationRequestFinishedWithCredential:error:completionHandler:", v12, v13, v11);

    v9 = v12;
  }

LABEL_8:
}

uint64_t __53__ASCAgent_didCompleteAssertionWithCredential_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_authorizationCompletedWithCredential:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_authorizationCompletedWithCredential:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *authorizationActivity;
  id v9;
  NSUUID *publicKeyCredentialOperationUUID;
  ASPublicKeyCredentialManagerInterface *publicKeyCredentialManager;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  ASPublicKeyCredentialManagerInterface *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  ASPublicKeyCredentialManagerInterface *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  NSString *clientApplicationIdentifier;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  _TtC26AuthenticationServicesCore30ASPasswordSignInEventCollector *signInEventCollector;
  void *v46;
  void *v47;
  NSString *v48;
  ASCAuthorizationTrafficController *authorizationTrafficController;
  NSUUID *authorizationTrafficControllerToken;
  _TtC26AuthenticationServicesCore13ASCABLEClient *cableClient;
  _TtC26AuthenticationServicesCore20ASCABLEAuthenticator *cableAuthenticator;
  void *v53;
  void *v54;
  _QWORD v55[5];
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _QWORD block[5];
  id v62;
  id v63;

  v6 = a3;
  v7 = a4;
  if (!-[ASCCredentialRequestContext isCABLEAuthenticatorRequest](self->_requestContext, "isCABLEAuthenticatorRequest"))
  {
    authorizationActivity = self->_authorizationActivity;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke;
    block[3] = &unk_24C97F298;
    block[4] = self;
    v9 = v6;
    v62 = v9;
    v7 = v7;
    v63 = v7;
    os_activity_apply(authorizationActivity, block);
    publicKeyCredentialOperationUUID = self->_publicKeyCredentialOperationUUID;
    if (publicKeyCredentialOperationUUID)
    {
      publicKeyCredentialManager = self->_publicKeyCredentialManager;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 12, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASPublicKeyCredentialManagerInterface cancelOperationIfNecessaryWithUUID:overrideError:](publicKeyCredentialManager, "cancelOperationIfNecessaryWithUUID:overrideError:", publicKeyCredentialOperationUUID, v12);

    }
    if (objc_msgSend(v7, "safari_matchesErrorDomain:andCode:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 12))
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_303);
    }
    else
    {
      -[ASCCredentialRequestContext globalFrameID](self->_requestContext, "globalFrameID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[ASPublicKeyCredentialManagerInterface internalErrorToWKErrorIfApplicable:](self->_publicKeyCredentialManager, "internalErrorToWKErrorIfApplicable:", v7);
        v14 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v9;
        if (objc_msgSend(v15, "isExternal"))
        {
          objc_msgSend(v15, "rawClientDataJSON");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            v17 = self->_publicKeyCredentialManager;
            -[ASCCredentialRequestContext platformKeyCredentialAssertionOptions](self->_requestContext, "platformKeyCredentialAssertionOptions");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASPublicKeyCredentialManagerInterface computeClientDataIfNeededForAssertionOptions:](v17, "computeClientDataIfNeededForAssertionOptions:", v18);

            -[ASCCredentialRequestContext platformKeyCredentialAssertionOptions](self->_requestContext, "platformKeyCredentialAssertionOptions");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "clientDataJSON");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setRawClientDataJSON:", v20);

          }
        }

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v9;
        if (objc_msgSend(v21, "isExternal"))
        {
          objc_msgSend(v21, "rawClientDataJSON");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            v23 = self->_publicKeyCredentialManager;
            -[ASCCredentialRequestContext platformKeyCredentialCreationOptions](self->_requestContext, "platformKeyCredentialCreationOptions");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASPublicKeyCredentialManagerInterface computeClientDataIfNeededForCreationOptions:](v23, "computeClientDataIfNeededForCreationOptions:", v24);

            -[ASCCredentialRequestContext platformKeyCredentialCreationOptions](self->_requestContext, "platformKeyCredentialCreationOptions");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "clientDataJSON");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setRawClientDataJSON:", v26);

          }
        }

      }
      v27 = -[ASCCredentialRequestContext isConditionalRegistrationRequest](self->_requestContext, "isConditionalRegistrationRequest");
      if (v9 && v27)
      {
        v28 = v9;
        objc_msgSend(v28, "relyingPartyIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v28, "isExternal") & 1) == 0
          && (objc_msgSend(v29, "isEqualToString:", CFSTR("apple.com")) & 1) == 0)
        {
          if (!self->_isClientEntitledWebBrowser)
          {
            clientApplicationIdentifier = self->_clientApplicationIdentifier;
            v60 = 0;
            objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithApplicationIdentifier:error:", clientApplicationIdentifier, &v60);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v60;
            if (v31)
            {
              objc_msgSend(v31, "localizedName");
              v33 = objc_claimAutoreleasedReturnValue();
              v34 = v29;
              v29 = (void *)v33;
            }
            else
            {
              v35 = self->_authorizationActivity;
              v58[0] = MEMORY[0x24BDAC760];
              v58[1] = 3221225472;
              v58[2] = __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_307;
              v58[3] = &unk_24C97E868;
              v59 = v7;
              os_activity_apply(v35, v58);
              v34 = v59;
            }

          }
          objc_msgSend(MEMORY[0x24BE82D68], "sharedNotificationManager");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "relyingPartyIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASCCredentialRequestContext platformKeyCredentialCreationOptions](self->_requestContext, "platformKeyCredentialCreationOptions");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "userName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "credentialID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "scheduleAutomaticallyCreatedPasskeyNotificationWithServiceName:relyingPartyID:userName:credentialID:completionHandler:", v29, v37, v38, v39, &__block_literal_global_310);

        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = v9;
        objc_msgSend(v40, "externalProviderBundleIdentifier");
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)v41;
        v43 = (void *)*MEMORY[0x24BE82F68];
        if (v41)
          v43 = (void *)v41;
        v44 = v43;

        signInEventCollector = self->_signInEventCollector;
        objc_msgSend(v40, "user");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCAgent _bundleIDFromAppID:](self, "_bundleIDFromAppID:", self->_clientApplicationIdentifier);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASPasswordSignInEventCollector didUseCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:](signInEventCollector, "didUseCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:", v46, 0, v44, v47);

      }
      -[ASCAuthorizationPresenterHostProtocol dismiss](self->_requestPresenter, "dismiss");
      if (self->_authorizationCompletionHandler)
      {
        v48 = self->_clientApplicationIdentifier;
        authorizationTrafficController = self->_authorizationTrafficController;
        authorizationTrafficControllerToken = self->_authorizationTrafficControllerToken;
        v55[0] = MEMORY[0x24BDAC760];
        v55[1] = 3221225472;
        v55[2] = __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_2;
        v55[3] = &unk_24C97F298;
        v55[4] = self;
        v56 = v9;
        v57 = v7;
        -[ASCAuthorizationTrafficController endAuthorizationForAppIdentifier:token:clearanceHandler:](authorizationTrafficController, "endAuthorizationForAppIdentifier:token:clearanceHandler:", v48, authorizationTrafficControllerToken, v55);

      }
      -[ASCABLEClient cancelIfNecessary](self->_cableClient, "cancelIfNecessary");
      cableClient = self->_cableClient;
      self->_cableClient = 0;

      cableAuthenticator = self->_cableAuthenticator;
      self->_cableAuthenticator = 0;

      objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "removeObserver:", self);

    }
  }

}

void __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = (void *)a1[6];
    v6 = v2;
    objc_msgSend(v5, "safari_privacyPreservingDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[4] + 168);
    v9 = 134218754;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    v13 = 2114;
    v14 = v7;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_20E648000, v6, OS_LOG_TYPE_DEFAULT, "Completing authorization: %p %{public}@ %{public}@ %{public}@", (uint8_t *)&v9, 0x2Au);

  }
}

void __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_302()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_DEFAULT, "Received internal cancel. Dropping.", v1, 2u);
  }
}

void __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_307(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_307_cold_1(a1, v2);
}

void __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 176);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_3;
  block[3] = &unk_24C97E868;
  block[4] = v2;
  os_activity_apply(v3, block);
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16))();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = 0;

}

void __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v4 = 138477827;
    v5 = v3;
    _os_log_impl(&dword_20E648000, v2, OS_LOG_TYPE_DEFAULT, "Completed request for %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)isCABLEAuthenticatorRequest
{
  return -[ASCCredentialRequestContext isCABLEAuthenticatorRequest](self->_requestContext, "isCABLEAuthenticatorRequest");
}

- (void)dealloc
{
  NSObject *authorizationActivity;
  NSUUID *v4;
  objc_super v5;
  _QWORD block[5];

  authorizationActivity = self->_authorizationActivity;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __19__ASCAgent_dealloc__block_invoke;
  block[3] = &unk_24C97E868;
  block[4] = self;
  os_activity_apply(authorizationActivity, block);
  v4 = self->_publicKeyCredentialOperationUUID;
  if (v4)
    -[ASPublicKeyCredentialManagerInterface cancelOperationIfNecessaryWithUUID:overrideError:](self->_publicKeyCredentialManager, "cancelOperationIfNecessaryWithUUID:overrideError:", v4, 0);
  -[ASCAuthorizationTrafficController cancelAuthorizationForAppIdentifierIfNecessary:token:](self->_authorizationTrafficController, "cancelAuthorizationForAppIdentifierIfNecessary:token:", self->_clientApplicationIdentifier, self->_authorizationTrafficControllerToken);

  v5.receiver = self;
  v5.super_class = (Class)ASCAgent;
  -[ASCAgent dealloc](&v5, sel_dealloc);
}

void __19__ASCAgent_dealloc__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 134349056;
    v5 = v3;
    _os_log_impl(&dword_20E648000, v2, OS_LOG_TYPE_DEFAULT, "Dealloc for %{public}p. Cancelling any outstanding requests.", (uint8_t *)&v4, 0xCu);
  }
}

- (id)encodeMakeCredentialCTAPCommandForAuthenticatorWithUserVerificationAvailability:(unint64_t)a3 authenticatorSupportedExtensions:(id)a4
{
  id v6;
  ASPublicKeyCredentialManagerInterface *publicKeyCredentialManager;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  -[ASCCredentialRequestContext platformKeyCredentialCreationOptions](self->_requestContext, "platformKeyCredentialCreationOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ASPublicKeyCredentialManagerInterface encodeMakeCredentialCommandWithOptions:authenticatorUserVerificationAvailability:authenticatorSupportedExtensions:](publicKeyCredentialManager, "encodeMakeCredentialCommandWithOptions:authenticatorUserVerificationAvailability:authenticatorSupportedExtensions:", v8, a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ASCCredentialRequestContext securityKeyCredentialCreationOptions](self->_requestContext, "securityKeyCredentialCreationOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASPublicKeyCredentialManagerInterface encodeMakeCredentialCommandWithOptions:authenticatorUserVerificationAvailability:authenticatorSupportedExtensions:](publicKeyCredentialManager, "encodeMakeCredentialCommandWithOptions:authenticatorUserVerificationAvailability:authenticatorSupportedExtensions:", v10, a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)encodeGetAssertionCTAPCommandForAuthenticatorWithUserVerificationAvailability:(unint64_t)a3 authenticatorSupportedExtensions:(id)a4
{
  id v6;
  ASPublicKeyCredentialManagerInterface *publicKeyCredentialManager;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  -[ASCCredentialRequestContext platformKeyCredentialAssertionOptions](self->_requestContext, "platformKeyCredentialAssertionOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ASPublicKeyCredentialManagerInterface encodeGetAssertionCommandWithOptions:authenticatorUserVerificationAvailability:authenticatorSupportedExtensions:](publicKeyCredentialManager, "encodeGetAssertionCommandWithOptions:authenticatorUserVerificationAvailability:authenticatorSupportedExtensions:", v8, a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ASCCredentialRequestContext securityKeyCredentialAssertionOptions](self->_requestContext, "securityKeyCredentialAssertionOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASPublicKeyCredentialManagerInterface encodeGetAssertionCommandWithOptions:authenticatorUserVerificationAvailability:authenticatorSupportedExtensions:](publicKeyCredentialManager, "encodeGetAssertionCommandWithOptions:authenticatorUserVerificationAvailability:authenticatorSupportedExtensions:", v10, a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)cableClientWillConnect:(id)a3
{
  -[ASCAuthorizationPresenterHostProtocol cableClientWillConnect](self->_requestPresenter, "cableClientWillConnect", a3);
}

- (void)cableClientWillAuthenticate:(id)a3
{
  -[ASCAuthorizationPresenterHostProtocol cableClientWillAuthenticate](self->_requestPresenter, "cableClientWillAuthenticate", a3);
}

- (BOOL)_canCreateICloudKeychainPasskeyPreflightWithError:(id *)a3
{
  NSObject *v5;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_test_overrideCanCreateICloudKeychainPasskey
    && objc_msgSend(MEMORY[0x24BE82CC8], "isInternalInstall"))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[ASCAgent _canCreateICloudKeychainPasskeyPreflightWithError:]";
      _os_log_impl(&dword_20E648000, v5, OS_LOG_TYPE_INFO, "Using test override for %s", buf, 0xCu);
    }
    return -[NSNumber BOOLValue](self->_test_overrideCanCreateICloudKeychainPasskey, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isKeychainSyncEnabled");

    if ((v8 & 1) != 0)
    {
      return 1;
    }
    else
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_313);
      v9 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD0FD8];
      v12 = CFSTR("iCloud Keychain is off.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
  }
}

void __62__ASCAgent__canCreateICloudKeychainPasskeyPreflightWithError___block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __62__ASCAgent__canCreateICloudKeychainPasskeyPreflightWithError___block_invoke_cold_1();
}

- (BOOL)_isConnection:(id)a3 entitledToDeletePasskeysForRelyingParty:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "safari_arrayForEntitlement:containingObjectsOfClass:", CFSTR("com.apple.private.authentication-services.delete-passkeys-by-rpid"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    v8 = objc_msgSend(v7, "containsObject:", v5);
  else
    v8 = 0;

  return v8;
}

- (BOOL)_connection:(id)a3 hasEntitlement:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char HasEntitlement;
  BOOL v10;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[NSDictionary count](self->_test_overrideEntitlements, "count")
    && objc_msgSend(MEMORY[0x24BE82CC8], "isInternalInstall"))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[ASCAgent _connection:hasEntitlement:]";
      _os_log_impl(&dword_20E648000, v8, OS_LOG_TYPE_INFO, "Using test override for %s", buf, 0xCu);
    }
    HasEntitlement = -[NSDictionary safari_BOOLForKey:](self->_test_overrideEntitlements, "safari_BOOLForKey:", v7);
  }
  else
  {
    if (v6)
      objc_msgSend(v6, "auditToken");
    HasEntitlement = WBSAuditTokenHasEntitlement();
  }
  v10 = HasEntitlement;

  return v10;
}

- (BOOL)_isValidContext:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *authorizationActivity;
  _QWORD v13[4];
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_test_overrideIsLAContextValid && objc_msgSend(MEMORY[0x24BE82CC8], "isInternalInstall"))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[ASCAgent _isValidContext:]";
      _os_log_impl(&dword_20E648000, v5, OS_LOG_TYPE_INFO, "Using test override for %s", buf, 0xCu);
    }
    v6 = -[NSNumber BOOLValue](self->_test_overrideIsLAContextValid, "BOOLValue");
  }
  else
  {
    v7 = WBSAuthenticationPolicyForPasswordManager();
    v16 = &unk_24C990508;
    v17 = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v4, "evaluatePolicy:options:error:", v7, v8, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;

    v6 = v9 != 0;
    if (!v9)
    {
      authorizationActivity = self->_authorizationActivity;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __28__ASCAgent__isValidContext___block_invoke;
      v13[3] = &unk_24C97E868;
      v14 = v10;
      os_activity_apply(authorizationActivity, v13);

    }
  }

  return v6;
}

void __28__ASCAgent__isValidContext___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __28__ASCAgent__isValidContext___block_invoke_cold_1(a1, v2);
}

- (void)test_setIsClientEntitledWebBrowser:(BOOL)a3
{
  self->_isClientEntitledWebBrowser = a3;
}

- (void)test_setOverrideEntitlements:(id)a3
{
  NSDictionary *v4;
  NSDictionary *test_overrideEntitlements;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  test_overrideEntitlements = self->_test_overrideEntitlements;
  self->_test_overrideEntitlements = v4;

}

- (void)test_setOverrideCanCreateICloudKeychainPasskey:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *test_overrideCanCreateICloudKeychainPasskey;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  test_overrideCanCreateICloudKeychainPasskey = self->_test_overrideCanCreateICloudKeychainPasskey;
  self->_test_overrideCanCreateICloudKeychainPasskey = v4;

}

- (void)test_setOverrideISLAContextValid:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *test_overrideIsLAContextValid;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  test_overrideIsLAContextValid = self->_test_overrideIsLAContextValid;
  self->_test_overrideIsLAContextValid = v4;

}

- (void)test_setOverrideExtensionStates:(id)a3
{
  NSArray *v4;
  NSArray *test_overrideExtensionStates;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  test_overrideExtensionStates = self->_test_overrideExtensionStates;
  self->_test_overrideExtensionStates = v4;

}

- (void)test_addCredentialProviderExtensionLoginChoiceWithName:(id)a3 extensionBundleID:(id)a4 containingAppBundleID:(id)a5
{
  NSMutableArray *test_credentialProviderExtensionLoginChoices;
  id v8;
  id v9;
  id v10;
  ASCCredentialProviderExtensionLoginChoice *v11;

  test_credentialProviderExtensionLoginChoices = self->_test_credentialProviderExtensionLoginChoices;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[ASCCredentialProviderExtensionLoginChoice initWithProviderName:providerBundleID:providerExtensionContainingAppBundleID:]([ASCCredentialProviderExtensionLoginChoice alloc], "initWithProviderName:providerBundleID:providerExtensionContainingAppBundleID:", v10, v9, v8);

  -[NSMutableArray addObject:](test_credentialProviderExtensionLoginChoices, "addObject:", v11);
}

- (void)test_clearCredentialProviderExtensionLoginChoices
{
  -[NSMutableArray removeAllObjects](self->_test_credentialProviderExtensionLoginChoices, "removeAllObjects");
}

- (void)test_addAutoFillEvent:(id)a3 url:(id)a4
{
  _TtC26AuthenticationServicesCore30ASPasswordSignInEventCollector *signInEventCollector;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  signInEventCollector = self->_signInEventCollector;
  v6 = *MEMORY[0x24BE82F68];
  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "safari_safariApplicationPlatformBundleIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ASPasswordSignInEventCollector didUseCredentialForUsername:forURL:fromProviderWithBundleIdentifier:inBrowserWithBundleIdentifier:](signInEventCollector, "didUseCredentialForUsername:forURL:fromProviderWithBundleIdentifier:inBrowserWithBundleIdentifier:", v9, v8, v6, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_test_credentialProviderExtensionLoginChoices, 0);
  objc_storeStrong((id *)&self->_relatedOriginFetcher, 0);
  objc_storeStrong((id *)&self->_test_overrideExtensionStates, 0);
  objc_storeStrong((id *)&self->_test_overrideIsLAContextValid, 0);
  objc_storeStrong((id *)&self->_test_overrideCanCreateICloudKeychainPasskey, 0);
  objc_storeStrong((id *)&self->_test_overrideEntitlements, 0);
  objc_storeStrong((id *)&self->_cableAuthenticator, 0);
  objc_storeStrong((id *)&self->_cableAuthenticationURL, 0);
  objc_storeStrong((id *)&self->_cableClient, 0);
  objc_storeStrong((id *)&self->_internalSemaphore, 0);
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_publicKeyCredentialOperationUUID, 0);
  objc_storeStrong(&self->_passkeyCredentialCallback, 0);
  objc_storeStrong(&self->_pinResultCallback, 0);
  objc_storeStrong(&self->_userEnteredPINCallback, 0);
  objc_storeStrong(&self->_didLoadPlatformCredentialsCallback, 0);
  objc_storeStrong((id *)&self->_securityKeyLoginChoices, 0);
  objc_storeStrong((id *)&self->_platformLoginChoices, 0);
  objc_storeStrong((id *)&self->_signInEventCollector, 0);
  objc_storeStrong((id *)&self->_publicKeyCredentialManager, 0);
  objc_storeStrong(&self->_authorizationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_savedAccountContext, 0);
  objc_storeStrong((id *)&self->_requestPresenter, 0);
  objc_storeStrong((id *)&self->_clientApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_appleIDChoices, 0);
  objc_storeStrong((id *)&self->_passwordCredentials, 0);
  objc_storeStrong((id *)&self->_authorizationTrafficControllerToken, 0);
  objc_storeStrong((id *)&self->_authorizationTrafficController, 0);
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_41_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_20E648000, a1, a3, "Failed to acquire lock for %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_9();
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_2_48_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v4, v5, "Could not perform authorization: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_20E648000, v0, v1, "Found unexpected implicitly selected login choice: %{public}@", v2);
  OUTLINED_FUNCTION_9();
}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_64_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Could not find implicitly selected login choice.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Not performing conditional registration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_79_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Selected credential provider does not support conditional registration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_83_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Got a conditional registration request but don't know where to send it (probably a web extension?)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)getPasskeysDataForRelyingParty:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_11(&dword_20E648000, v0, v1, "Attempting to fetch passkey data while KeyBag is locked. This likely won't work.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)getPasskeysDataForRelyingParty:withCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_11(&dword_20E648000, v0, v1, "Unentitled client attempted to read passkey data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)deletePasskeyForRelyingParty:withCredentialID:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Not deleting passkey. KeyBag is currently locked.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)deletePasskeyForRelyingParty:withCredentialID:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_20E648000, v0, v1, "Unentitled client attempted to delete passkey for %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)deleteAllPasskeysForRelyingParty:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Not deleting passkeys. KeyBag is currently locked.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)deleteAllPasskeysForRelyingParty:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_20E648000, v0, v1, "Unentitled client attempted to delete passkeys for %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)renamePasskeyWithCredentialID:newName:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_11(&dword_20E648000, v0, v1, "Unentitled client attempted to rename passkey.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "count");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v3, v4, "Found unexpected number of login choices: %{public}ld", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_111_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_20E648000, v0, v1, "Expected passkey for implicitly selected login choice, but found: %{public}@", v2);
  OUTLINED_FUNCTION_9();
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_112_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Unexpected found registration login choice.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_114_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Attempted to perform silent assertion without authenticated context.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __32__ASCAgent_cancelCurrentRequest__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_20E648000, a1, a3, "Failed to acquire lock for %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_9();
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Attempted to perform caBLE transaction with passkeys disabled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_125_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Attempted to perform authorization from process without application identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_132_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Client is not properly entitled for this request. Rejecting.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_20E648000, v0, v1, "Error evaluating passkey related origins: %{public}@", v2);
  OUTLINED_FUNCTION_9();
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_143_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "The requested RPID did not match the origin or related origins.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Client does not have necessary entitlements to access Sign in with Apple credentials.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_166_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Unable to fetch client bundle identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Unable to fetch presentation context for Sign in with Apple.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_177_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Client is missing required entitlement open caBLE URLs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)browserPasskeysForRelyingParty:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "TCC access denied for browser passkey request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __61__ASCAgent_browserPasskeysForRelyingParty_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  const char *v3;
  void *v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3_0(a1, a2);
  v3 = (const char *)OUTLINED_FUNCTION_3();
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_20E648000, v2, OS_LOG_TYPE_FAULT, "Rejecting invocation of restricted method %{public}@ from unentitled process.", v5, 0xCu);

  OUTLINED_FUNCTION_1();
}

- (void)getCanCurrentProcessAccessPasskeysForRelyingParty:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Passkeys are unavailable because iCloud Keychain has been disabled by a configuration profile.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __31__ASCAgent__bundleIDFromAppID___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v4, v5, "Failed to get application bundle identifier with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __29__ASCAgent__teamIDfromAppID___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v4, v5, "Failed to get application team identifier with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_performAuthKitAuthorizationValidationForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Failed to get AuthKit account when checking for Sign in with Apple credential.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __61__ASCAgent__performAuthKitAuthorizationValidationForAccount___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v4, v5, "Cannot perform AuthKit authorization due to error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v4, v5, "Error checking extension application identifier: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v4, v5, "Error while waiting for site approval: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_234_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Client attempted to make silent request without web browser entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_246_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "relyingPartyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v4, v5, "Client attempted to make conditional request for non-associated rp: %{private}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_249_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "requestTypes");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v3, v4, "Client attempted to make silent request for unsupported credential types: %{public}ld", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_252_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Client is making proxied credential request but is not entitled to do so.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_256_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_20E648000, v0, v1, "Proxied client is not associated with %{public}@", v2);
  OUTLINED_FUNCTION_9();
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_261_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Requested enterprise attestation for unconfigured relying party.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_267_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Client tried to use web-browser-only options.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_271_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_20E648000, v0, v1, "%{public}@", v2);
  OUTLINED_FUNCTION_9();
}

void __73__ASCAgent__credentialRequestedForPasswordLoginChoice_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Could not find a credential for the user's login choice.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __76__ASCAgent_authorizationPresenter_validateUserEnteredPIN_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Unexpectedly received PIN callback.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_289_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v4, v5, "Failed to create caBLE authenticator: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Could not authenticator: agent no longer exists.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_292_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v4, v5, "Failed to start caBLE authenticator: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_2_295_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Could not prepare for caBLE authorization: agent no longer exists.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_297_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v4, v5, "Failed to prepare for caBLE authorization: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __28__ASCAgent_didReceiveError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_20E648000, v0, v1, "Received unexpected error: %ld", v2);
  OUTLINED_FUNCTION_9();
}

void __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_307_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v4, v5, "Could not fetch application record for client: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __62__ASCAgent__canCreateICloudKeychainPasskeyPreflightWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Cannot create a passkey. iCloud Keychain is off.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __28__ASCAgent__isValidContext___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v4, v5, "Invalid LAContext provided: %{public}@.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

@end
