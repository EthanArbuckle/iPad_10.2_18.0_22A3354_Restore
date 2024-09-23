@implementation AKAppleIDFollowUpServerUIPresenter

- (AKAppleIDFollowUpServerUIPresenter)init
{
  AKAppleIDFollowUpServerUIPresenter *v2;
  uint64_t v3;
  AKAppleIDServerUIEventHandlerImp *eventHandler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKAppleIDFollowUpServerUIPresenter;
  v2 = -[AKAppleIDFollowUpServerUIPresenter init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    eventHandler = v2->_eventHandler;
    v2->_eventHandler = (AKAppleIDServerUIEventHandlerImp *)v3;

  }
  return v2;
}

- (void)presentServerUIWithContext:(id)a3 withCompletion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  NSObject *v9;
  FLFollowUpItem *v10;
  FLFollowUpItem *item;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id presentingClientCompletion;
  AKAppleIDAuthenticationInAppExtensionContext *v19;
  AKAppleIDAuthenticationInAppExtensionContext *authContext;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDFollowUpServerUIPresenter presentServerUIWithContext:withCompletion:].cold.4();

  objc_storeStrong((id *)&self->_followupHelperContext, a3);
  -[AKAppleIDFollowUpServerUIPresenter _fetchCurrentFollowUpItem](self, "_fetchCurrentFollowUpItem");
  v10 = (FLFollowUpItem *)objc_claimAutoreleasedReturnValue();
  item = self->_item;
  self->_item = v10;

  -[FLFollowUpItem userInfo](self->_item, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D00018]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[AKAppleIDFollowUpServerUIPresenter _authKitAccountWithAltDSID:](self, "_authKitAccountWithAltDSID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v7, "urlKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAppleIDFollowUpServerUIPresenter _urlAtKey:](self, "_urlAtKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_storeStrong((id *)&self->_initialURL, v16);
        v17 = (void *)MEMORY[0x1C3B760D8](v8);
        presentingClientCompletion = self->_presentingClientCompletion;
        self->_presentingClientCompletion = v17;

        v19 = objc_alloc_init(AKAppleIDAuthenticationInAppExtensionContext);
        authContext = self->_authContext;
        self->_authContext = v19;

        -[AKAppleIDAuthenticationInAppExtensionContext setAltDSID:](self->_authContext, "setAltDSID:", v13);
        objc_msgSend(v14, "username");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAppleIDAuthenticationInAppExtensionContext setUsername:](self->_authContext, "setUsername:", v21);

        -[AKAppleIDAuthenticationInAppExtensionContext setCellularDataAttributionAppBundleID:](self->_authContext, "setCellularDataAttributionAppBundleID:", *MEMORY[0x1E0CFFFE0]);
        -[AKAppleIDAuthenticationInAppExtensionContext set_shouldSendIdentityTokenForRemoteUI:](self->_authContext, "set_shouldSendIdentityTokenForRemoteUI:", 0);
        objc_msgSend(v7, "presentingViewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAppleIDAuthenticationInAppContext setPresentingViewController:](self->_authContext, "setPresentingViewController:", v22);

        -[AKAppleIDFollowUpServerUIPresenter _prepareServerUIContext](self, "_prepareServerUIContext");
      }
      else
      {
        _AKLogSystem();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[AKAppleIDFollowUpServerUIPresenter presentServerUIWithContext:withCompletion:].cold.3(v7);

        objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7097);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, 0, v26);

      }
    }
    else
    {
      _AKLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[AKAppleIDFollowUpServerUIPresenter presentServerUIWithContext:withCompletion:].cold.2();

      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7055);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v16);
    }

  }
  else
  {
    _AKLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[AKAppleIDFollowUpServerUIPresenter presentServerUIWithContext:withCompletion:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7025);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v14);
  }

}

- (void)presentServerUIWithContext:(id)a3 withCompletion:(id)a4 withResponse:(id)a5
{
  id v8;
  void *v9;
  id presentingClientResponseCompletion;
  id v11;

  v8 = a4;
  v11 = a3;
  v9 = (void *)MEMORY[0x1C3B760D8](a5);
  presentingClientResponseCompletion = self->_presentingClientResponseCompletion;
  self->_presentingClientResponseCompletion = v9;

  -[AKAppleIDFollowUpServerUIPresenter presentServerUIWithContext:withCompletion:](self, "presentServerUIWithContext:withCompletion:", v11, v8);
}

- (id)_authKitAccountWithAltDSID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D00100];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authKitAccountWithAltDSID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_urlAtKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D002A0];
  v4 = a3;
  objc_msgSend(v3, "sharedBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "urlAtKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_prepareServerUIContext
{
  NSObject *v3;
  AKAppleIDAuthenticationController *v4;
  AKAppleIDAuthenticationController *authController;
  id v6;
  void *v7;
  AKAppleIDAuthenticationController *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Preparing the server UI Load Delegate", buf, 2u);
  }

  -[AKAppleIDFollowUpServerUIPresenter _makeAppleIDAuthenticationController](self, "_makeAppleIDAuthenticationController");
  v4 = (AKAppleIDAuthenticationController *)objc_claimAutoreleasedReturnValue();
  authController = self->_authController;
  self->_authController = v4;

  v6 = objc_alloc_init(MEMORY[0x1E0D00128]);
  -[AKAppleIDAuthenticationInAppExtensionContext altDSID](self->_authContext, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAltDSID:", v7);

  objc_msgSend(v6, "setAnticipateEscrowAttempt:", 1);
  v8 = self->_authController;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__AKAppleIDFollowUpServerUIPresenter__prepareServerUIContext__block_invoke;
  v9[3] = &unk_1E7679A60;
  v9[4] = self;
  -[AKAppleIDAuthenticationController getServerUILoadDelegateWithContext:completion:](v8, "getServerUILoadDelegateWithContext:completion:", v6, v9);

}

void __61__AKAppleIDFollowUpServerUIPresenter__prepareServerUIContext__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "urlKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBagUrlKey:", v6);

    objc_msgSend(*(id *)(a1 + 32), "_signRequestAndPrepareServerConfig:", v9);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "_performClientCompletionWithSuccess:error:", 0, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7019);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_performClientCompletionWithSuccess:error:", 0, v8);

    }
  }

}

- (id)_makeAppleIDAuthenticationController
{
  return objc_alloc_init(MEMORY[0x1E0D00130]);
}

- (void)_signRequestAndPrepareServerConfig:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id serverUICompletion;
  AKAppleIDServerUIContextController *v21;
  AKAppleIDServerUIContextController *serverUIContextController;
  void *v23;
  _QWORD v24[4];
  id v25;
  id buf[2];

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Preparing server configuration...", (uint8_t *)buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appleIDAccountWithAltDSID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "settingsServiceTokenForAccount:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v4, "setServiceToken:", v9);
    objc_msgSend(v4, "setServiceTokenIdentifier:", CFSTR("com.apple.gs.appleid.auth"));
  }
  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", self->_initialURL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00280]), "initWithRequest:requestType:", v10, 0);
  objc_msgSend(v11, "setResourceLoadDelegate:", v4);
  if (self->_item
    && -[AKAppleIDFollowUpServerUIPresenter _shouldSignWithIDMSAppleIDHeader](self, "_shouldSignWithIDMSAppleIDHeader"))
  {
    _AKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BD795000, v12, OS_LOG_TYPE_DEFAULT, "Signing with idms header", (uint8_t *)buf, 2u);
    }

    -[FLFollowUpItem userInfo](self->_item, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0D00020];
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D00020]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v11, "resourceLoadDelegate");
      v16 = objc_claimAutoreleasedReturnValue();
      -[FLFollowUpItem userInfo](self->_item, "userInfo");
      v23 = v8;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setContinuityIDMSData:](v16, "setContinuityIDMSData:", v18);

      v8 = v23;
    }
    else
    {
      _AKLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[AKAppleIDFollowUpServerUIPresenter _signRequestAndPrepareServerConfig:].cold.1((uint64_t)self);
    }

  }
  objc_msgSend(v11, "setPresentationType:", 2);
  objc_initWeak(buf, self);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __73__AKAppleIDFollowUpServerUIPresenter__signRequestAndPrepareServerConfig___block_invoke;
  v24[3] = &unk_1E7679A88;
  objc_copyWeak(&v25, buf);
  v19 = (void *)MEMORY[0x1C3B760D8](v24);
  serverUICompletion = self->_serverUICompletion;
  self->_serverUICompletion = v19;

  v21 = -[AKAppleIDServerUIContextController initWithRequestConfiguration:completion:]([AKAppleIDServerUIContextController alloc], "initWithRequestConfiguration:completion:", v11, self->_serverUICompletion);
  serverUIContextController = self->_serverUIContextController;
  self->_serverUIContextController = v21;

  -[AKAppleIDFollowUpServerUIPresenter _presentServerUIWithConfiguration:](self, "_presentServerUIWithConfiguration:", v11);
  objc_destroyWeak(&v25);
  objc_destroyWeak(buf);

}

void __73__AKAppleIDFollowUpServerUIPresenter__signRequestAndPrepareServerConfig___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t v14[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1BD795000, v11, OS_LOG_TYPE_DEFAULT, "Server UI finished processing", v14, 2u);
    }

    objc_msgSend(WeakRetained, "_performClientCompletionWithServerResponse:additionalData:error:", v7, v8, v9);
    if (v9)
    {
      v12 = 0;
      v13 = v9;
    }
    else
    {
      v12 = 1;
      v13 = 0;
    }
    objc_msgSend(WeakRetained, "_performClientCompletionWithSuccess:error:", v12, v13);
  }

}

- (void)_presentServerUIWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  FLFollowUpItem *item;
  NSObject *v7;
  _BOOL4 v8;
  AKAppleIDAuthenticationInAppExtensionContext *authContext;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Presenting server provided UI with configuration %@", buf, 0xCu);
  }

  item = self->_item;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (item)
  {
    if (v8)
      -[AKAppleIDFollowUpServerUIPresenter _presentServerUIWithConfiguration:].cold.2();

    -[AKExtensionlessFollowUpHelperContext uniqueItemIdentifier](self->_followupHelperContext, "uniqueItemIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    -[AKAppleIDFollowUpServerUIPresenter acknowledgeActionTakenOnFollowUpWithIdentifier:withAdditionalData:completion:](self, "acknowledgeActionTakenOnFollowUpWithIdentifier:withAdditionalData:completion:", v7, 0, 0);
  }
  else if (v8)
  {
    -[AKAppleIDFollowUpServerUIPresenter _presentServerUIWithConfiguration:].cold.1();
  }

  authContext = self->_authContext;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__AKAppleIDFollowUpServerUIPresenter__presentServerUIWithConfiguration___block_invoke;
  v10[3] = &unk_1E7679AB0;
  v10[4] = self;
  -[AKAppleIDAuthenticationInAppContext presentServerProvidedUIWithConfiguration:completion:](authContext, "presentServerProvidedUIWithConfiguration:completion:", v4, v10);

}

void __72__AKAppleIDFollowUpServerUIPresenter__presentServerUIWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "_performClientCompletionWithServerResponse:additionalData:error:", v10, v9, v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "processResponse:", v10);
  objc_msgSend(*(id *)(a1 + 32), "_performAuthKitActionWithResponse:additionalData:error:", v10, v9, v8);

}

- (void)acknowledgeActionTakenOnFollowUpWithIdentifier:(id)a3 withAdditionalData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[AKAppleIDFollowUpServerUIPresenter shouldAcknowledgeUserAction](self, "shouldAcknowledgeUserAction"))
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1BD795000, v11, OS_LOG_TYPE_DEFAULT, "Sending acknowledgment for follow up item with id: %@", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    v33 = objc_alloc_init(MEMORY[0x1E0D00130]);
    v12 = (void *)objc_opt_new();
    -[FLFollowUpItem userInfo](self->_item, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0D00020];
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D00020]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[FLFollowUpItem userInfo](self->_item, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("txnid"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKExtensionlessFollowUpHelperContext uniqueItemIdentifier](self->_followupHelperContext, "uniqueItemIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setItemIdentifier:", v18);

    -[FLFollowUpItem userInfo](self->_item, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D00018]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAltDSID:", v20);

    objc_msgSend(v12, "setAkAction:", CFSTR("open"));
    objc_msgSend(v12, "setIsContinuityPush:", 1);
    if (v15)
    {
      -[FLFollowUpItem userInfo](self->_item, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setIdmsData:", v22);

    }
    if (v17)
    {
      -[FLFollowUpItem userInfo](self->_item, "userInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("txnid"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTxnid:", v24);

    }
    v25 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __115__AKAppleIDFollowUpServerUIPresenter_acknowledgeActionTakenOnFollowUpWithIdentifier_withAdditionalData_completion___block_invoke;
    v26[3] = &unk_1E7679AD8;
    p_buf = &buf;
    v27 = v10;
    objc_msgSend(v25, "teardownFollowUpWithContext:completion:", v12, v26);

    _Block_object_dispose(&buf, 8);
  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
  }

}

void __115__AKAppleIDFollowUpServerUIPresenter_acknowledgeActionTakenOnFollowUpWithIdentifier_withAdditionalData_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1BD795000, v6, OS_LOG_TYPE_DEFAULT, "Followup teardown is complete with success: %@, error: %@", (uint8_t *)&v11, 0x16u);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);

}

- (void)signAdditionalHeadersWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  if (self->_item
    && -[AKAppleIDFollowUpServerUIPresenter _shouldSignWithIDMSAppleIDHeader](self, "_shouldSignWithIDMSAppleIDHeader"))
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Signing with idms header", v9, 2u);
    }

    -[FLFollowUpItem userInfo](self->_item, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D00020]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "setValue:forHTTPHeaderField:", v7, CFSTR("X-Apple-I-IdMS-Data"));
    }
    else
    {
      _AKLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AKAppleIDFollowUpServerUIPresenter signAdditionalHeadersWithRequest:].cold.1((uint64_t)self);

    }
  }

}

- (BOOL)_shouldSignWithIDMSAppleIDHeader
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[FLFollowUpItem actions](self->_item, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("continuity_push_followup_notification"));

  return v5;
}

- (BOOL)shouldAcknowledgeUserAction
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[FLFollowUpItem actions](self->_item, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("continuity_push_followup_notification"));

  return v5;
}

- (id)_fetchCurrentFollowUpItem
{
  NSObject *v3;
  void *v4;
  objc_class *FLFollowUpItemClass;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[AKExtensionlessFollowUpHelperContext uniqueItemIdentifier](self->_followupHelperContext, "uniqueItemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Fetching follow up item with id: %@", buf, 0xCu);

  }
  FLFollowUpItemClass = (objc_class *)CoreFollowUpLibraryCore();
  if (FLFollowUpItemClass)
    FLFollowUpItemClass = (objc_class *)getFLFollowUpItemClass();
  v6 = objc_alloc_init(FLFollowUpItemClass);
  -[AKAppleIDFollowUpServerUIPresenter followUpProvider](self, "followUpProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDFollowUpServerUIPresenter _fetchCurrentFollowUpItem].cold.2();

    objc_msgSend(MEMORY[0x1E0D00210], "sharedAuthKitFollowupProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDFollowUpServerUIPresenter setFollowUpProvider:](self, "setFollowUpProvider:", v9);

  }
  -[AKAppleIDFollowUpServerUIPresenter followUpProvider](self, "followUpProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v10, "pendingFollowUpItems:", &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__AKAppleIDFollowUpServerUIPresenter__fetchCurrentFollowUpItem__block_invoke;
  v16[3] = &unk_1E7679B00;
  v16[4] = self;
  objc_msgSend(v11, "aaf_firstObjectPassingTest:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 || !v13)
  {
    _AKLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AKAppleIDFollowUpServerUIPresenter _fetchCurrentFollowUpItem].cold.1((uint64_t)self);

  }
  return v13;
}

uint64_t __63__AKAppleIDFollowUpServerUIPresenter__fetchCurrentFollowUpItem__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "uniqueItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)_signWithIDMSAppleIDHeaderForRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (self->_item)
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1BD795000, v8, OS_LOG_TYPE_DEFAULT, "Signing with IDMS data", v12, 2u);
    }

    -[FLFollowUpItem userInfo](self->_item, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D00020]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "setValue:forHTTPHeaderField:", v10, CFSTR("X-Apple-I-IdMS-Data"));
    }
    else
    {
      _AKLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[AKAppleIDFollowUpServerUIPresenter signAdditionalHeadersWithRequest:].cold.1((uint64_t)self);

    }
  }
  v7[2](v7, v6);

}

- (void)_performClientCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void (**presentingClientCompletion)(id, _BOOL8, id);
  id v8;

  v4 = a3;
  v8 = a4;
  -[AKAppleIDServerUIContextController serverUIDelegate](self->_serverUIContextController, "serverUIDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContinuityIDMSData:", 0);

  presentingClientCompletion = (void (**)(id, _BOOL8, id))self->_presentingClientCompletion;
  if (presentingClientCompletion)
    presentingClientCompletion[2](presentingClientCompletion, v4, v8);
  -[AKAppleIDAuthenticationInAppContext dismissServerProvidedUIWithCompletion:](self->_authContext, "dismissServerProvidedUIWithCompletion:", 0);

}

- (void)_performClientCompletionWithServerResponse:(id)a3 additionalData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  if (self->_presentingClientResponseCompletion)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1BD795000, v11, OS_LOG_TYPE_DEFAULT, "Handing the server response to the calling client", v12, 2u);
    }

    (*((void (**)(void))self->_presentingClientResponseCompletion + 2))();
  }
}

- (void)_performAuthKitActionWithResponse:(id)a3 additionalData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  AKAppleIDServerUIEventHandlerImp *eventHandler;
  AKAppleIDAuthenticationInAppExtensionContext *authContext;
  void *v18;
  NSObject *v19;
  AKAppleIDAuthenticationInAppExtensionContext *v20;
  AKAppleIDServerUIEventHandlerImp *v21;
  AKAppleIDAuthenticationController *authController;
  NSObject *v23;
  AKAppleIDServerUIEventHandlerImp *v24;
  AKAppleIDAuthenticationInAppExtensionContext *v25;
  int v26;
  NSObject *v27;
  _BOOL4 v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AKAppleIDServerUIContextController serverUIDelegate](self->_serverUIContextController, "serverUIDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isAuthenticationRequired:", v8) & 1) != 0
    || (objc_msgSend(v10, "userInfo"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("statusCode")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqual:", &unk_1E769AAA0),
        v13,
        v12,
        v14))
  {
    _AKLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v15, OS_LOG_TYPE_DEFAULT, "Signal received with authentication required", buf, 2u);
    }

    eventHandler = self->_eventHandler;
    authContext = self->_authContext;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __93__AKAppleIDFollowUpServerUIPresenter__performAuthKitActionWithResponse_additionalData_error___block_invoke;
    v33[3] = &unk_1E7679748;
    v33[4] = self;
    v34 = v11;
    -[AKAppleIDServerUIEventHandlerImp reauthenticateWithContext:withCompletion:](eventHandler, "reauthenticateWithContext:withCompletion:", authContext, v33);
    v18 = v34;
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v11, "isResponseActionable:", v8))
  {
    _AKLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v19, OS_LOG_TYPE_DEFAULT, "Signal received with an actionable response", buf, 2u);
    }

    v20 = self->_authContext;
    authController = self->_authController;
    v21 = self->_eventHandler;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __93__AKAppleIDFollowUpServerUIPresenter__performAuthKitActionWithResponse_additionalData_error___block_invoke_44;
    v32[3] = &unk_1E7679190;
    v32[4] = self;
    -[AKAppleIDServerUIEventHandlerImp updateStateWithExternalAuthenticationResponse:forContext:withAuthController:completion:](v21, "updateStateWithExternalAuthenticationResponse:forContext:withAuthController:completion:", v8, v20, authController, v32);
  }
  else
  {
    if (objc_msgSend(v11, "isResponseFinalForHSA2ServerFlow:", v8))
    {
      _AKLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BD795000, v23, OS_LOG_TYPE_DEFAULT, "Signal received for Final HSAA2 Server Flow", buf, 2u);
      }

      v24 = self->_eventHandler;
      v25 = self->_authContext;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __93__AKAppleIDFollowUpServerUIPresenter__performAuthKitActionWithResponse_additionalData_error___block_invoke_45;
      v29[3] = &unk_1E7679B28;
      v29[4] = self;
      v30 = v8;
      v31 = v9;
      -[AKAppleIDServerUIEventHandlerImp startCDPRepairWithContext:withAdditionalData:completion:](v24, "startCDPRepairWithContext:withAdditionalData:completion:", v25, v31, v29);

      v18 = v30;
      goto LABEL_6;
    }
    v26 = objc_msgSend(v11, "isResponseCompleteAndConflict:", v8);
    _AKLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BD795000, v27, OS_LOG_TYPE_DEFAULT, "Signal received with complete", buf, 2u);
      }

      -[AKAppleIDFollowUpServerUIPresenter _performClientCompletionWithSuccess:error:](self, "_performClientCompletionWithSuccess:error:", 1, 0);
    }
    else
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BD795000, v27, OS_LOG_TYPE_DEFAULT, "Handling final response", buf, 2u);
      }

      -[AKAppleIDFollowUpServerUIPresenter handleFinalResponse:additionalData:error:](self, "handleFinalResponse:additionalData:error:", v8, v9, v10);
    }
  }
LABEL_7:

}

uint64_t __93__AKAppleIDFollowUpServerUIPresenter__performAuthKitActionWithResponse_additionalData_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v4, "_performClientCompletionWithSuccess:error:", 0, a3);
  else
    return objc_msgSend(v4, "_signRequestAndPrepareServerConfig:", *(_QWORD *)(a1 + 40));
}

uint64_t __93__AKAppleIDFollowUpServerUIPresenter__performAuthKitActionWithResponse_additionalData_error___block_invoke_44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performClientCompletionWithSuccess:error:", a2, a3);
}

void __93__AKAppleIDFollowUpServerUIPresenter__performAuthKitActionWithResponse_additionalData_error___block_invoke_45(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "postCDPFollowUpForError:", v5);
    v5 = v6;
  }
  objc_msgSend(*(id *)(a1 + 32), "handleFinalResponse:additionalData:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5);

}

- (void)handleFinalResponse:(id)a3 additionalData:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  AKAppleIDServerUIEventHandlerImp *eventHandler;
  void *v14;
  NSObject *v15;
  AKAppleIDServerUIContextController *serverUIContextController;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(MEMORY[0x1E0D00138], "signalFromServerResponse:", v7);
  -[AKAppleIDServerUIContextController serverUIDelegate](self->_serverUIContextController, "serverUIDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isResponseFinal:", v7);

  if (!v11)
  {
    if (v9 == 2)
    {
      _AKLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_1BD795000, v15, OS_LOG_TYPE_DEFAULT, "Signal received to cancel", (uint8_t *)&v25, 2u);
      }

      serverUIContextController = self->_serverUIContextController;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = -7003;
LABEL_16:
      objc_msgSend(v17, "ak_errorWithCode:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAppleIDServerUIContextController completeWithError:](serverUIContextController, "completeWithError:", v24);

      goto LABEL_21;
    }
    if ((unint64_t)(v9 - 7) > 1)
    {
      _AKLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v9 == 1)
      {
        if (v23)
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_1BD795000, v19, OS_LOG_TYPE_DEFAULT, "Signal received to skip user action", (uint8_t *)&v25, 2u);
        }

        serverUIContextController = self->_serverUIContextController;
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = -7038;
        goto LABEL_16;
      }
      if (v23)
      {
        v25 = 138412290;
        v26 = v7;
        v20 = "Unknown server response %@";
        v21 = v19;
        v22 = 12;
        goto LABEL_19;
      }
    }
    else
    {
      _AKLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        v20 = "Signal received to teardown/ delete";
        v21 = v19;
        v22 = 2;
LABEL_19:
        _os_log_impl(&dword_1BD795000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v25, v22);
      }
    }

    -[AKAppleIDFollowUpServerUIPresenter _performClientCompletionWithSuccess:error:](self, "_performClientCompletionWithSuccess:error:", 0, 0);
    goto LABEL_21;
  }
  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1BD795000, v12, OS_LOG_TYPE_DEFAULT, "Signal received with final response", (uint8_t *)&v25, 2u);
  }

  eventHandler = self->_eventHandler;
  -[AKAppleIDAuthenticationInAppExtensionContext altDSID](self->_authContext, "altDSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerUIEventHandlerImp updateAccountUsernameForAltDSID:withHarvestedData:](eventHandler, "updateAccountUsernameForAltDSID:withHarvestedData:", v14, v8);

  -[AKAppleIDServerUIContextController completeWithFinalResponse:](self->_serverUIContextController, "completeWithFinalResponse:", v7);
LABEL_21:

}

- (AKFollowUpProvider)followUpProvider
{
  return (AKFollowUpProvider *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFollowUpProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (AKExtensionlessFollowUpHelperContext)followupHelperContext
{
  return self->_followupHelperContext;
}

- (void)setFollowupHelperContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (AKAppleIDAuthenticationInAppExtensionContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_followupHelperContext, 0);
  objc_storeStrong((id *)&self->followUpProvider, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_initialURL, 0);
  objc_storeStrong(&self->_serverUICompletion, 0);
  objc_storeStrong(&self->_presentingClientResponseCompletion, 0);
  objc_storeStrong(&self->_presentingClientCompletion, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_serverUIContextController, 0);
}

- (void)presentServerUIWithContext:withCompletion:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1BD795000, v0, OS_LOG_TYPE_ERROR, "No altDSID provided in FollowUp, cannot present server UI.", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)presentServerUIWithContext:withCompletion:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1BD795000, v0, OS_LOG_TYPE_ERROR, "No account found with altDSID %@, cannot present server UI", v1, 0xCu);
}

- (void)presentServerUIWithContext:(void *)a1 withCompletion:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "urlKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1BD795000, v2, v3, "Failed to find Url key: %@ in bag, cannot present server UI", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

- (void)presentServerUIWithContext:withCompletion:.cold.4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1BD795000, v0, OS_LOG_TYPE_DEBUG, "Present Server UI with follow up context: %@", v1, 0xCu);
}

- (void)_signRequestAndPrepareServerConfig:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1), "uniqueItemIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1BD795000, v2, v3, "Failed to find IDMS data with id: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

- (void)_presentServerUIWithConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Follow up item is missing, user interaction will not be acknowledged with server.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_presentServerUIWithConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Acknowledging user interacted with continuity push", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)signAdditionalHeadersWithRequest:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1), "uniqueItemIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1BD795000, v2, v3, "Failed to find IDMS data with id: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

- (void)_fetchCurrentFollowUpItem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Client did not provide a followUpProvider, defaulting to the AuthKit default one, which will only work with follow ups posted by AuthKit.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
