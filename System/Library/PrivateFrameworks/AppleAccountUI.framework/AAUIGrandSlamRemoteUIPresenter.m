@implementation AAUIGrandSlamRemoteUIPresenter

- (AAUIGrandSlamRemoteUIPresenter)initWithAccountManager:(id)a3 presenter:(id)a4
{
  return -[AAUIGrandSlamRemoteUIPresenter initWithAccountManager:hookType:presenter:](self, "initWithAccountManager:hookType:presenter:", a3, 0, a4);
}

- (AAUIGrandSlamRemoteUIPresenter)initWithAccountManager:(id)a3 hookType:(unint64_t)a4 presenter:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  AAUIGrandSlamRemoteUIPresenter *v12;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "hooksFor:accountManager:", a4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AAUIGrandSlamRemoteUIPresenter initWithAccountManager:presenter:hooks:](self, "initWithAccountManager:presenter:hooks:", v9, v8, v11);

  return v12;
}

- (AAUIGrandSlamRemoteUIPresenter)initWithAccountManager:(id)a3 hookType:(unint64_t)a4 presenter:(id)a5 cdpContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  AAUIGrandSlamRemoteUIPresenter *v15;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "hooksFor:accountManager:cdpContext:", a4, v12, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[AAUIGrandSlamRemoteUIPresenter initWithAccountManager:presenter:hooks:](self, "initWithAccountManager:presenter:hooks:", v12, v11, v14);
  return v15;
}

- (AAUIGrandSlamRemoteUIPresenter)initWithAccountManager:(id)a3 presenter:(id)a4 hooks:(id)a5
{
  id v9;
  id v10;
  id v11;
  AAUIGrandSlamRemoteUIPresenter *v12;
  AAUIGrandSlamRemoteUIPresenter *v13;
  RemoteUIController *v14;
  RemoteUIController *remoteUIController;
  uint64_t v16;
  RUIServerHookHandler *serverUIHookHandler;
  AAUIServerHookHandlerDelegate *v18;
  AAUIServerHookHandlerDelegate *serverUIHookHandlerDelegate;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AAUIGrandSlamRemoteUIPresenter;
  v12 = -[AAUIGrandSlamRemoteUIPresenter init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountManager, a3);
    objc_storeWeak((id *)&v13->_presenter, v10);
    v14 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E0D872F0]);
    remoteUIController = v13->_remoteUIController;
    v13->_remoteUIController = v14;

    -[RemoteUIController setDelegate:](v13->_remoteUIController, "setDelegate:", v13);
    -[AAUIGrandSlamRemoteUIPresenter _addRemoteUIEventHandler](v13, "_addRemoteUIEventHandler");
    if (v11)
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D872D8]), "initWithRemoteUIController:hooks:", v13->_remoteUIController, v11);
      serverUIHookHandler = v13->_serverUIHookHandler;
      v13->_serverUIHookHandler = (RUIServerHookHandler *)v16;

      v18 = objc_alloc_init(AAUIServerHookHandlerDelegate);
      serverUIHookHandlerDelegate = v13->_serverUIHookHandlerDelegate;
      v13->_serverUIHookHandlerDelegate = v18;

      -[RUIServerHookHandler setDelegate:](v13->_serverUIHookHandler, "setDelegate:", v13->_serverUIHookHandlerDelegate);
    }
  }

  return v13;
}

- (void)loadRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__AAUIGrandSlamRemoteUIPresenter_loadRequest___block_invoke;
  v6[3] = &unk_1EA2DBB10;
  v7 = v4;
  v5 = v4;
  -[AAUIGrandSlamRemoteUIPresenter loadRequest:completion:](self, "loadRequest:completion:", v5, v6);

}

void __46__AAUIGrandSlamRemoteUIPresenter_loadRequest___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "RemoteUI request load success for %@", (uint8_t *)&v9, 0xCu);

    }
  }
  if (v5)
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__AAUIGrandSlamRemoteUIPresenter_loadRequest___block_invoke_cold_1(a1, (uint64_t)v5, v8);

  }
}

- (void)loadRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!self->_currentRequest)
  {
    objc_storeStrong((id *)&self->_currentRequest, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    _AAUILogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v7;
      v15 = 2112;
      v16 = WeakRetained;
      _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "AAUIGrandSlamRemoteUIPresenter loading request %@ on presenter %@ ", (uint8_t *)&v13, 0x16u);
    }

    -[RemoteUIController setHostViewController:](self->_remoteUIController, "setHostViewController:", WeakRetained);
    if (!-[AAUIGrandSlamRemoteUIPresenter isModalInPresentation](self, "isModalInPresentation"))
    {
      objc_msgSend(WeakRetained, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = WeakRetained;

        v11 = v12;
      }
      -[RemoteUIController setNavigationController:](self->_remoteUIController, "setNavigationController:", v11);

    }
    -[RemoteUIController loadRequest:completion:](self->_remoteUIController, "loadRequest:completion:", v7, v8);

  }
}

- (id)_appleAccount
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accountStore
{
  return (id)-[AIDAAccountManager accountStore](self->_accountManager, "accountStore");
}

- (id)_grandSlamAccount
{
  ACAccount *grandSlamAccount;
  void *v4;
  void *v5;
  void *v6;
  ACAccount *v7;
  ACAccount *v8;
  NSObject *v9;
  uint8_t v11[16];

  grandSlamAccount = self->_grandSlamAccount;
  if (!grandSlamAccount)
  {
    -[AAUIGrandSlamRemoteUIPresenter _appleAccount](self, "_appleAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[AAUIGrandSlamRemoteUIPresenter _accountStore](self, "_accountStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIGrandSlamRemoteUIPresenter _appleAccount](self, "_appleAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "aida_accountForiCloudAccount:", v6);
      v7 = (ACAccount *)objc_claimAutoreleasedReturnValue();
      v8 = self->_grandSlamAccount;
      self->_grandSlamAccount = v7;

    }
    grandSlamAccount = self->_grandSlamAccount;
    if (!grandSlamAccount)
    {
      _AAUILogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Could not fetch GrandSlam Account", v11, 2u);
      }

      grandSlamAccount = self->_grandSlamAccount;
    }
  }
  return grandSlamAccount;
}

- (id)_authContext
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D00128]);
  objc_msgSend(v3, "setVerifyCredentialReason:", 3);
  -[AAUIGrandSlamRemoteUIPresenter _appleAccount](self, "_appleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAltDSID:", v5);

  return v3;
}

- (id)_remoteUICancelButtonForPage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("label");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D872C0]), "initWithAttributes:parent:", v5, 0);
  return v6;
}

- (void)_addRemoteUIEventHandler
{
  RemoteUIController *remoteUIController;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  remoteUIController = self->_remoteUIController;
  v4 = *MEMORY[0x1E0CFFEB8];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AAUIGrandSlamRemoteUIPresenter__addRemoteUIEventHandler__block_invoke;
  v5[3] = &unk_1EA2DBB38;
  objc_copyWeak(&v6, &location);
  -[RemoteUIController setHandlerForElementName:handler:](remoteUIController, "setHandlerForElementName:handler:", v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__AAUIGrandSlamRemoteUIPresenter__addRemoteUIEventHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFEE0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CFFEC0]))
  {
    objc_msgSend(v6, "visiblePage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissIfPresentedWithCompletion:", 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    _AAUILogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Calling remoteUIDidHandleButton for delegate %@", (uint8_t *)&v16, 0xCu);

    }
    objc_msgSend(WeakRetained, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteUIDidHandleButton:", v7);

  }
}

- (void)_addHeadersToRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__AAUIGrandSlamRemoteUIPresenter__addHeadersToRequest_withCompletion___block_invoke;
  v10[3] = &unk_1EA2DBB60;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[AAUIGrandSlamRemoteUIPresenter _getServerUILoadDelegateWithCompletion:](self, "_getServerUILoadDelegateWithCompletion:", v10);

}

void __70__AAUIGrandSlamRemoteUIPresenter__addHeadersToRequest_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_grandSlamAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_accountStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "credentialForAccount:serviceID:", v7, *MEMORY[0x1E0CFAB40]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "token");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setServiceToken:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "signRequest:", *(_QWORD *)(a1 + 40));
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v7, "aida_dsid");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v12);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "remoteUIWillLoadRequest:", *(_QWORD *)(a1 + 40));

    }
    v15 = *(_QWORD *)(a1 + 48);
    if (v15)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v15 + 16))(v15, 1, 0);

  }
}

- (void)_getServerUILoadDelegateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  AKAppleIDServerResourceLoadDelegate *resourceLoadDelegate;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = v4;
  resourceLoadDelegate = self->_resourceLoadDelegate;
  if (resourceLoadDelegate)
  {
    (*((void (**)(id, AKAppleIDServerResourceLoadDelegate *, _QWORD))v4 + 2))(v4, resourceLoadDelegate, 0);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D00130]);
    -[AAUIGrandSlamRemoteUIPresenter _authContext](self, "_authContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__AAUIGrandSlamRemoteUIPresenter__getServerUILoadDelegateWithCompletion___block_invoke;
    v9[3] = &unk_1EA2DBB88;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v7, "getServerUILoadDelegateWithContext:completion:", v8, v9);

  }
}

void __73__AAUIGrandSlamRemoteUIPresenter__getServerUILoadDelegateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void (*v9)(void);

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __73__AAUIGrandSlamRemoteUIPresenter__getServerUILoadDelegateWithCompletion___block_invoke_cold_1((uint64_t)v7, v8);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(v6, "setShouldSendSigningHeaders:", 1);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

- (BOOL)_isAuthError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_11;
  objc_msgSend(v3, "userInfo");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_11;
  v6 = (void *)v5;
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_11;
  objc_msgSend(v4, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D87310]);
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D87320]) & 1) == 0)
    {

LABEL_11:
      v13 = 0;
      goto LABEL_12;
    }
  }
  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("statusCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  if ((v9 & 1) == 0)
  if (v12 != 401)
    goto LABEL_11;
  v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)_checkFlowEndForResponse:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "allHeaderFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFED8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFFED0]) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFFEC8]);

  return v5;
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  AKAppleIDServerResourceLoadDelegate *resourceLoadDelegate;
  id v10;
  id v11;

  resourceLoadDelegate = self->_resourceLoadDelegate;
  v10 = a6;
  v11 = a4;
  -[AKAppleIDServerResourceLoadDelegate processResponse:](resourceLoadDelegate, "processResponse:", a5);
  -[AAUIGrandSlamRemoteUIPresenter _addHeadersToRequest:withCompletion:](self, "_addHeadersToRequest:withCompletion:", v11, v10);

}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSURLRequest *v9;
  NSObject *v10;
  AAUIGrandSlamRemoteUIPresenter *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AAUIGrandSlamRemoteUIPresenterDelegate **p_delegate;
  id WeakRetained;
  char v20;
  _QWORD v21[4];
  id v22;
  AAUIGrandSlamRemoteUIPresenter *v23;
  NSURLRequest *v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  AAUIGrandSlamRemoteUIPresenter *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v30 = self;
    v31 = 2112;
    v32 = v6;
    v33 = 2112;
    v34 = v7;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "%@: Controller (%@) did receive HTTP response (%@)", buf, 0x20u);
  }

  -[AKAppleIDServerResourceLoadDelegate processResponse:](self->_resourceLoadDelegate, "processResponse:", v7);
  -[RUIServerHookHandler processServerResponse:](self->_serverUIHookHandler, "processServerResponse:", v7);
  self->_isEndOfFlow = -[AAUIGrandSlamRemoteUIPresenter _checkFlowEndForResponse:](self, "_checkFlowEndForResponse:", v7);
  v9 = self->_currentRequest;
  if (objc_msgSend(v7, "statusCode") == 401)
  {
    _AAUILogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "URL");
      v11 = (AAUIGrandSlamRemoteUIPresenter *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Remote UI request returned 401 for %@", buf, 0xCu);

    }
    v12 = *MEMORY[0x1E0C8F330];
    v28[0] = MEMORY[0x1E0C9AAB0];
    v13 = *MEMORY[0x1E0C8F318];
    v27[0] = v12;
    v27[1] = v13;
    v26 = *MEMORY[0x1E0CFAB40];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[AAUIGrandSlamRemoteUIPresenter _accountStore](self, "_accountStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIGrandSlamRemoteUIPresenter _grandSlamAccount](self, "_grandSlamAccount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __76__AAUIGrandSlamRemoteUIPresenter_remoteUIController_didReceiveHTTPResponse___block_invoke;
    v21[3] = &unk_1EA2DBBF0;
    v22 = v7;
    v23 = self;
    v24 = v9;
    v25 = v6;
    objc_msgSend(v16, "renewCredentialsForAccount:options:completion:", v17, v15, v21);

    goto LABEL_9;
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    v15 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v15, "remoteUIDidReceiveHTTPResponse:", v7);
LABEL_9:

  }
}

void __76__AAUIGrandSlamRemoteUIPresenter_remoteUIController_didReceiveHTTPResponse___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v7;
    v15 = 2048;
    v16 = a2;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "renewing account token for request URL %@ with result %ld error %@", (uint8_t *)&v13, 0x20u);

  }
  if (a2)
  {
    if (a2 == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));

      if (WeakRetained)
      {
        if (!v5)
        {
          v9 = (void *)MEMORY[0x1E0CB35C8];
          v10 = -1;
          goto LABEL_13;
        }
LABEL_14:
        v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));
        objc_msgSend(v12, "remoteUIRequestComplete:error:", *(_QWORD *)(a1 + 48), v5);

      }
    }
    else if (a2 == 2)
    {
      v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));

      if (v8)
      {
        if (!v5)
        {
          v9 = (void *)MEMORY[0x1E0CB35C8];
          v10 = 0;
LABEL_13:
          objc_msgSend(v9, "aa_errorWithCode:", v10);
          v5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "loadRequest:completion:", *(_QWORD *)(a1 + 48), &__block_literal_global_3);
  }

}

void __76__AAUIGrandSlamRemoteUIPresenter_remoteUIController_didReceiveHTTPResponse___block_invoke_49(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (a2)
      v6 = CFSTR("YES");
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "RemoteUI Retry request completed with success: %@, error: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  AAUIGrandSlamRemoteUIPresenterDelegate **p_delegate;
  id WeakRetained;
  void *v13;
  BOOL v14;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  _AAUILogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Remote UI load finish with error %@ request %@", (uint8_t *)&v16, 0x16u);

  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v13 = WeakRetained;
    v14 = -[AAUIGrandSlamRemoteUIPresenter _isAuthError:](self, "_isAuthError:", v7);

    if (v8)
    {
      if (!v14)
      {
        v15 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v15, "remoteUIRequestComplete:error:", v8, v7);

      }
    }
  }

}

- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  AAUIRemotePage *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(AAUIRemotePage);
  -[AAUIRemotePage setHidesBottomBarWhenPushed:](v11, "setHidesBottomBarWhenPushed:", 1);
  if (-[AAUIGrandSlamRemoteUIPresenter isModalInPresentation](self, "isModalInPresentation"))
  {
    if (-[AAUIGrandSlamRemoteUIPresenter showCancelInModalPresentation](self, "showCancelInModalPresentation"))
    {
      objc_msgSend(v8, "displayedPages");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (!v13)
      {
        -[AAUIGrandSlamRemoteUIPresenter _remoteUICancelButtonForPage:](self, "_remoteUICancelButtonForPage:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[AAUIRemotePage setLeftNavigationBarButtonItem:](v11, "setLeftNavigationBarButtonItem:", v14);

        objc_initWeak(&location, v11);
        -[AAUIRemotePage leftNavigationBarButtonItem](v11, "leftNavigationBarButtonItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __83__AAUIGrandSlamRemoteUIPresenter_remoteUIController_createPageWithName_attributes___block_invoke;
        v17[3] = &unk_1EA2DBC18;
        objc_copyWeak(&v18, &location);
        objc_msgSend(v15, "setAction:", v17);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
    }
  }

  return v11;
}

void __83__AAUIGrandSlamRemoteUIPresenter_remoteUIController_createPageWithName_attributes___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissIfPresentedWithCompletion:", 0);

}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  AAUIGrandSlamRemoteUIPresenterDelegate **p_delegate;
  id WeakRetained;
  char v16;
  id v17;
  NSObject *v18;
  int v19;
  AAUIGrandSlamRemoteUIPresenter *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = *a5;
  if (*a5)
  {
LABEL_4:
    if (v11 == 1 && self->_isEndOfFlow)
    {
      p_delegate = &self->_delegate;
      WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        v17 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v17, "remoteUIDidEndFlow:", v8);

      }
    }
    goto LABEL_11;
  }
  objc_msgSend(v9, "allPages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v11 = *a5;
    goto LABEL_4;
  }
  _AAUILogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = self;
    _os_log_impl(&dword_1DB4ED000, v18, OS_LOG_TYPE_DEFAULT, "%@: Undefined action signal and no page, not displaying modally", (uint8_t *)&v19, 0xCu);
  }

  -[RUIServerHookHandler processObjectModel:isModal:](self->_serverUIHookHandler, "processObjectModel:isModal:", v10, 0);
LABEL_11:

}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  AAUIGrandSlamRemoteUIPresenterDelegate **p_delegate;
  id WeakRetained;
  char v14;
  id v15;
  int v16;
  AAUIGrandSlamRemoteUIPresenter *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  _AAUILogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    v16 = 138413058;
    v17 = self;
    if (v5)
      v11 = CFSTR("YES");
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "%@: Controller (%@) will present objectModel (%@) modally (%@)", (uint8_t *)&v16, 0x2Au);
  }

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v15 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v15, "remoteUIWillPresentObjectModel:modally:", v9, v5);

  }
}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  AAUIGrandSlamRemoteUIPresenterDelegate **p_delegate;
  id WeakRetained;
  char v14;
  id v15;
  int v16;
  AAUIGrandSlamRemoteUIPresenter *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  _AAUILogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    v16 = 138413058;
    v17 = self;
    if (v5)
      v11 = CFSTR("YES");
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "%@: Controller (%@) did present objectModel (%@) modally (%@)", (uint8_t *)&v16, 0x2Au);
  }

  -[RUIServerHookHandler processObjectModel:isModal:](self->_serverUIHookHandler, "processObjectModel:isModal:", v9, v5);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v15 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v15, "remoteUIDidPresentObjectModel:modally:", v9, v5);

  }
}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  AAUIGrandSlamRemoteUIPresenter *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412802;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "%@: Controller (%@) did refresh objectModel (%@)", (uint8_t *)&v9, 0x20u);
  }

  -[RUIServerHookHandler processObjectModel:isModal:](self->_serverUIHookHandler, "processObjectModel:isModal:", v7, 0);
}

- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  RUIServerHookHandler *serverUIHookHandler;
  int v13;
  id v14;
  __int16 v15;
  RUIServerHookHandler *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Dismissing modal for delegate %@", (uint8_t *)&v13, 0xCu);

    }
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "remoteUIDidDismiss:", v5);

  }
  _AAUILogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    serverUIHookHandler = self->_serverUIHookHandler;
    v13 = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = serverUIHookHandler;
    _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Dismissing modal for controller: %@, serverHookHandler: %@", (uint8_t *)&v13, 0x16u);
  }

}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  id v4;
  NSObject *v5;
  AAUIGrandSlamRemoteUIPresenterDelegate **p_delegate;
  id WeakRetained;
  char v8;
  NSObject *v9;
  AAUIGrandSlamRemoteUIPresenter *v10;
  id v11;
  int v12;
  AAUIGrandSlamRemoteUIPresenter *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "%@: Did dismiss controller (%@)", (uint8_t *)&v12, 0x16u);
  }

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (AAUIGrandSlamRemoteUIPresenter *)objc_loadWeakRetained((id *)p_delegate);
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Dismissing controller for delegate %@", (uint8_t *)&v12, 0xCu);

    }
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "remoteUIDidDismiss:", v4);

  }
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  RUIServerHookHandler *serverUIHookHandler;
  int v10;
  AAUIGrandSlamRemoteUIPresenter *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  RUIServerHookHandler *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    serverUIHookHandler = self->_serverUIHookHandler;
    v10 = 138413058;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = serverUIHookHandler;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "%@: Will present modal for controller (%@) with navigationController (%@) using handler (%@)", (uint8_t *)&v10, 0x2Au);
  }

}

- (AAUIGrandSlamRemoteUIPresenterDelegate)delegate
{
  return (AAUIGrandSlamRemoteUIPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)presenter
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (BOOL)isModalInPresentation
{
  return self->_modalInPresentation;
}

- (void)setModalInPresentation:(BOOL)a3
{
  self->_modalInPresentation = a3;
}

- (BOOL)showCancelInModalPresentation
{
  return self->_showCancelInModalPresentation;
}

- (void)setShowCancelInModalPresentation:(BOOL)a3
{
  self->_showCancelInModalPresentation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverUIHookHandlerDelegate, 0);
  objc_storeStrong((id *)&self->_serverUIHookHandler, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_resourceLoadDelegate, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
}

void __46__AAUIGrandSlamRemoteUIPresenter_loadRequest___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1DB4ED000, a3, OS_LOG_TYPE_ERROR, "RemoteUI load error for request %@ error %@", (uint8_t *)&v6, 0x16u);

}

void __73__AAUIGrandSlamRemoteUIPresenter__getServerUILoadDelegateWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_ERROR, "AAUIGrandSlamRemoteUIPresenter resource load delegate error %@", (uint8_t *)&v2, 0xCu);
}

@end
