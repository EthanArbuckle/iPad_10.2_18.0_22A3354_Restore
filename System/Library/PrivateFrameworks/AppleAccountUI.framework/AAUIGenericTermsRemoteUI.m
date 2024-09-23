@implementation AAUIGenericTermsRemoteUI

- (AAUIGenericTermsRemoteUI)initWithAccount:(id)a3 inStore:(id)a4
{
  id v7;
  id v8;
  AAUIGenericTermsRemoteUI *v9;
  AAUIGenericTermsRemoteUI *v10;
  RemoteUIController *v11;
  RemoteUIController *remoteUIController;
  void *v13;
  id v14;
  RemoteUIController *v15;
  void *v16;
  objc_class *v17;
  id v18;
  void *v19;
  uint64_t v20;
  RUIServerHookHandler *serverHookHandler;
  AAUIServerHookHandlerDelegate *v22;
  AAUIServerHookHandlerDelegate *hookHandlerDelegate;
  objc_super v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)AAUIGenericTermsRemoteUI;
  v9 = -[AAUIGenericTermsRemoteUI init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_accountStore, a4);
    v11 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E0D872F0]);
    remoteUIController = v10->_remoteUIController;
    v10->_remoteUIController = v11;

    -[RemoteUIController setDelegate:](v10->_remoteUIController, "setDelegate:", v10);
    -[AAUIGenericTermsRemoteUI _sessionConfiguration](v10, "_sessionConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUIController setSessionConfiguration:](v10->_remoteUIController, "setSessionConfiguration:", v13);

    v14 = objc_alloc(MEMORY[0x1E0D872D8]);
    v15 = v10->_remoteUIController;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v16 = (void *)getFALaunchScreenTimeSetupHookClass_softClass_0;
    v30 = getFALaunchScreenTimeSetupHookClass_softClass_0;
    if (!getFALaunchScreenTimeSetupHookClass_softClass_0)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __getFALaunchScreenTimeSetupHookClass_block_invoke_0;
      v26[3] = &unk_1EA2DB6E8;
      v26[4] = &v27;
      __getFALaunchScreenTimeSetupHookClass_block_invoke_0((uint64_t)v26);
      v16 = (void *)v28[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v27, 8);
    v18 = objc_alloc_init(v17);
    v31[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v14, "initWithRemoteUIController:hooks:", v15, v19);
    serverHookHandler = v10->_serverHookHandler;
    v10->_serverHookHandler = (RUIServerHookHandler *)v20;

    v22 = objc_alloc_init(AAUIServerHookHandlerDelegate);
    hookHandlerDelegate = v10->_hookHandlerDelegate;
    v10->_hookHandlerDelegate = v22;

    -[RUIServerHookHandler setDelegate:](v10->_serverHookHandler, "setDelegate:", v10->_hookHandlerDelegate);
    -[AAUIGenericTermsRemoteUI _setupActionForButtons](v10, "_setupActionForButtons");
  }

  return v10;
}

- (AAUIGenericTermsRemoteUI)initWithAccount:(id)a3 inStore:(id)a4 termsEntries:(id)a5
{
  id v9;
  AAUIGenericTermsRemoteUI *v10;
  AAUIGenericTermsRemoteUI *v11;

  v9 = a5;
  v10 = -[AAUIGenericTermsRemoteUI initWithAccount:inStore:](self, "initWithAccount:inStore:", a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_termsEntries, a5);

  return v11;
}

- (void)presentFromViewController:(id)a3 modal:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  id WeakRetained;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_storeWeak((id *)&self->_originatingViewController, v6);
  -[AAUIGenericTermsRemoteUI remoteUIController](self, "remoteUIController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHostViewController:", v6);

  objc_msgSend(v6, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_parentNavController, v8);

  self->_isModal = v4;
  _AAUILogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentNavController);
    objc_msgSend(WeakRetained, "viewControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Terms: Attempting to show terms UI modally: %@ on parent: %@ with children: %@", (uint8_t *)&v13, 0x20u);

  }
  -[AAUIGenericTermsRemoteUI _loadRequestPreferringPassword:](self, "_loadRequestPreferringPassword:", 1);

}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  objc_msgSend(a4, "setModalInPresentation:", self->_isModal);
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D872B8], "signalWithType:", *a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Terms: Got object model with signal: %@", (uint8_t *)&v13, 0xCu);

  }
  if (*a5 == 1)
  {
    -[AAUIGenericTermsRemoteUI _cleanUpAndDismissWithSuccess:agreeURL:serverInfo:](self, "_cleanUpAndDismissWithSuccess:agreeURL:serverInfo:", 0, 0, 0);
    objc_msgSend(v7, "clientInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _AAUILogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[AAUIGenericTermsRemoteUI remoteUIController:didReceiveObjectModel:actionSignal:].cold.1();

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("agreeUrl"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIGenericTermsRemoteUI _reportTermsUserAction:agreeUrl:](self, "_reportTermsUserAction:agreeUrl:", CFSTR("Dismiss"), v12);

  }
}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v7 = a4;
  -[AAUIGenericTermsRemoteUI serverHookHandler](self, "serverHookHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processObjectModel:isModal:", v7, v5);

}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  void (**v8)(id, uint64_t, _QWORD);

  v8 = (void (**)(id, uint64_t, _QWORD))a6;
  -[AAUIGenericTermsRemoteUI _addHeadersToRequest:](self, "_addHeadersToRequest:", a4);
  v8[2](v8, 1, 0);

}

- (BOOL)_isUnauthorizedError:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  if (objc_msgSend(v3, "code") == -1012)
  {
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

    if ((v5 & 1) != 0)
      goto LABEL_5;
  }
  objc_msgSend(v3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D87310]) & 1) != 0)
  {
    objc_msgSend(v3, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("statusCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    if (v9 == 401)
    {
LABEL_5:
      v10 = 1;
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D87320]))
  {
    objc_msgSend(v3, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("statusCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "integerValue") == 401;

  }
  else
  {
    v10 = 0;
  }

LABEL_11:
  return v10;
}

- (void)_setupActionForButtons
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  id location;

  objc_initWeak(&location, self);
  -[AAUIGenericTermsRemoteUI remoteUIController](self, "remoteUIController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke;
  v11[3] = &unk_1EA2DCBC8;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  objc_msgSend(v3, "setHandlerForButtonName:handler:", CFSTR("agree"), v11);

  -[AAUIGenericTermsRemoteUI remoteUIController](self, "remoteUIController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_63;
  v9[3] = &unk_1EA2DCBF0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "setHandlerForButtonName:handler:", CFSTR("defer"), v9);

  -[AAUIGenericTermsRemoteUI remoteUIController](self, "remoteUIController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_66;
  v7[3] = &unk_1EA2DCBF0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "setHandlerForButtonName:handler:", CFSTR("disagree"), v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v3, "clientInfo");
    v5 = objc_claimAutoreleasedReturnValue();
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_cold_2();

    -[NSObject objectForKey:](v5, "objectForKey:", CFSTR("agreeUrl"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v5, "objectForKey:", CFSTR("agreeDialogTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v5, "objectForKey:", CFSTR("agreeDialogText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v5, "objectForKey:", CFSTR("agreeDialogOK"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v5, "objectForKey:", CFSTR("agreeDialogCancel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v5, "objectForKey:", CFSTR("SLAVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 56);
    *(_QWORD *)(v13 + 56) = v12;

    objc_msgSend(v3, "serverInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("serverInfoKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && v10 && v11)
    {
      v36 = v10;
      _AAUILogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB4ED000, v17, OS_LOG_TYPE_DEFAULT, "Attempting to show alert view", buf, 2u);
      }

      v18 = (void *)MEMORY[0x1E0DC3450];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_58;
      v37[3] = &unk_1EA2DCBA0;
      v19 = WeakRetained;
      v38 = v19;
      v39 = v7;
      v40 = v16;
      v35 = v9;
      objc_msgSend(v18, "alertWithTitle:message:cancelButtonTitle:defaultButtonTitle:actionHandler:", v8, v9, v11, v36, v37);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _AAUILogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "remoteUIController");
        v34 = v7;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "currentPresentationContext");
        v33 = v8;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v42 = v23;
        _os_log_impl(&dword_1DB4ED000, v21, OS_LOG_TYPE_DEFAULT, "Attempting to present terms and conditions alert on current presentation context %@", buf, 0xCu);

        v8 = v33;
        v7 = v34;
      }

      objc_msgSend(v19, "remoteUIController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "currentPresentationContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "presentViewController:animated:completion:", v20, 1, 0);

      v9 = v35;
      v10 = v36;
    }
    else
    {
      objc_msgSend(WeakRetained, "_cleanUpAndDismissWithSuccess:agreeURL:serverInfo:", 1, v7, v16);
    }

  }
  else
  {
    _AAUILogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_cold_1(v5, v26, v27, v28, v29, v30, v31, v32);
  }

}

uint64_t __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_58(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_cleanUpAndDismissWithSuccess:agreeURL:serverInfo:", 1, *(_QWORD *)(result + 40), *(_QWORD *)(result + 48));
  return result;
}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_cleanUpAndDismissWithSuccess:agreeURL:serverInfo:", 1, 0, 0);
    objc_msgSend(v3, "clientInfo");
    v6 = objc_claimAutoreleasedReturnValue();
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_63_cold_2();

    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("agreeUrl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_reportTermsUserAction:agreeUrl:", CFSTR("Not Now"), v8);

  }
  else
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_cold_1(v6, v9, v10, v11, v12, v13, v14, v15);
  }

}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "clientInfo");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("disagreeUrl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serverInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("serverInfoKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_66_cold_2();

    objc_msgSend(WeakRetained, "_disagreeToTermsWithURLString:serverInfo:", v6, v8);
    objc_msgSend(WeakRetained, "_cleanUpAndDismissWithSuccess:agreeURL:serverInfo:", 0, 0, 0);
    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("agreeUrl"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_reportTermsUserAction:agreeUrl:", CFSTR("Decline"), v10);

  }
  else
  {
    _AAUILogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_cold_1(v5, v11, v12, v13, v14, v15, v16, v17);
  }

}

- (void)_loadRequestPreferringPassword:(BOOL)a3
{
  NSSet *termsEntries;
  NSSet *v5;
  NSSet *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  self->_isPreferringPassword = a3;
  termsEntries = self->_termsEntries;
  if (termsEntries)
  {
    v5 = termsEntries;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CFAB98], 0);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFAC70]), "initWithAccount:termsEntries:", self->_account, v5);
  objc_msgSend(v7, "setPreferPassword:", self->_isPreferringPassword);
  -[AAUIGenericTermsRemoteUI additionalHeaders](self, "additionalHeaders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAdditionalHeaders:", v8);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ACAccount _aa_termsServerInfo](self->_account, "_aa_termsServerInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setServerInfo:", v9);

    -[ACAccount _aa_setTermsServerInfo:](self->_account, "_aa_setTermsServerInfo:", 0);
  }
  objc_msgSend(v7, "urlRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[AAUIGenericTermsRemoteUI _addHeadersToRequest:](self, "_addHeadersToRequest:", v11);
  -[AAUIGenericTermsRemoteUI remoteUIController](self, "remoteUIController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke;
  v13[3] = &unk_1EA2DBB10;
  v13[4] = self;
  objc_msgSend(v12, "loadRequest:completion:", v11, v13);

}

void __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[8];
  _QWORD v14[5];

  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_cold_3();

    if (objc_msgSend(*(id *)(a1 + 32), "_isUnauthorizedError:", v5)
      && (v7 = *(_QWORD *)(a1 + 32), *(_BYTE *)(v7 + 49)))
    {
      if (*(_BYTE *)(v7 + 50))
      {
        _AAUILogSystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_cold_2();

        objc_msgSend(*(id *)(a1 + 32), "_loadRequestPreferringPassword:", 0);
      }
      else
      {
        *(_BYTE *)(v7 + 50) = 1;
        _AAUILogSystem();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_cold_1();

        v11 = *(void **)(a1 + 32);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_71;
        v14[3] = &unk_1EA2DBAA8;
        v14[4] = v11;
        objc_msgSend(v11, "_renewCredentialsWithCompletion:", v14);
      }
    }
    else
    {
      _AAUILogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Presenting failure alert to user", buf, 2u);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_72;
      block[3] = &unk_1EA2DB208;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_71(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;

  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if ((_DWORD)a2)
  {
    if (v5)
      __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_71_cold_1();
  }
  else if (v5)
  {
    __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_71_cold_2();
  }

  return objc_msgSend(*(id *)(a1 + 32), "_loadRequestPreferringPassword:", a2);
}

uint64_t __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_72(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayConnectionErrorAndDismiss");
}

- (id)_viewControllerForAlertPresentation
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  -[AAUIGenericTermsRemoteUI delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AAUIGenericTermsRemoteUI delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "parentViewControllerPresentsErrorAlert");

    if (v5)
    {
      _AAUILogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Sign in controller supports displaying it's own error", buf, 2u);
      }
      v7 = 0;
      goto LABEL_10;
    }
  }
  else
  {

  }
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Presenting alert on remoteUIController currentPresentationContext", v10, 2u);
  }

  -[AAUIGenericTermsRemoteUI remoteUIController](self, "remoteUIController");
  v6 = objc_claimAutoreleasedReturnValue();
  -[NSObject currentPresentationContext](v6, "currentPresentationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v7;
}

- (void)_agreeToTermsWithURLString:(id)a3 serverInfo:(id)a4 preferPassword:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v6 = a5;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0CFAD78];
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v11 alloc], "initWithURLString:account:", v13, self->_account);

  -[AAUIGenericTermsRemoteUI additionalHeaders](self, "additionalHeaders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdditionalHeaders:", v15);

  objc_msgSend(v14, "setPreferPassword:", v6);
  objc_msgSend(v14, "setServerInfo:", v12);

  if (self->_slaVersion)
  {
    _AAUILogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[AAUIGenericTermsRemoteUI _agreeToTermsWithURLString:serverInfo:preferPassword:completion:].cold.1();

    objc_msgSend(v14, "setSlaVersion:", self->_slaVersion);
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke;
  v18[3] = &unk_1EA2DCC18;
  v18[4] = self;
  v19 = v10;
  v17 = v10;
  objc_msgSend(v14, "performRequestWithHandler:", v18);

}

void __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  uint8_t v18[16];

  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_3();

  if ((unint64_t)(objc_msgSend(v6, "statusCode") - 200) > 0x63)
  {
    _AAUILogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v17)
        __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_2();
    }
    else if (v17)
    {
      __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Successfully agreed to iCloud terms!", v18, 2u);
    }

    v10 = *(void **)(a1 + 32);
    v11 = v6;
    objc_msgSend(v11, "acceptedTermsInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_sendAcceptedTermsInfo:", v12);

    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "responseDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("serverInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, 1, v15);

  }
}

- (void)_disagreeToTermsWithURLString:(id)a3 serverInfo:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0CFAD80];
  v7 = a4;
  v8 = a3;
  v10 = (id)objc_msgSend([v6 alloc], "initWithURLString:account:", v8, self->_account);

  -[AAUIGenericTermsRemoteUI additionalHeaders](self, "additionalHeaders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdditionalHeaders:", v9);

  objc_msgSend(v10, "setServerInfo:", v7);
  objc_msgSend(v10, "performRequestWithHandler:", &__block_literal_global_15);

}

void __69__AAUIGenericTermsRemoteUI__disagreeToTermsWithURLString_serverInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69__AAUIGenericTermsRemoteUI__disagreeToTermsWithURLString_serverInfo___block_invoke_cold_2();
  }
  else
  {
    v8 = objc_msgSend(v5, "statusCode");
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v8 == 200)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "Marked terms as disagreed in iCloud", v10, 2u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __69__AAUIGenericTermsRemoteUI__disagreeToTermsWithURLString_serverInfo___block_invoke_cold_1(v5, v7);
    }
  }

}

- (void)_sendAcceptedTermsInfo:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    -[AAUIGenericTermsRemoteUI delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[AAUIGenericTermsRemoteUI delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "genericTermsRemoteUI:acceptedTermsInfo:", self, v7);

    }
  }

}

- (void)_cleanUpAndDismissWithSuccess:(BOOL)a3 agreeURL:(id)a4 serverInfo:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[16];
  _QWORD aBlock[5];
  id v22;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  -[AAUIGenericTermsRemoteUI remoteUIController](self, "remoteUIController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentPresentationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUIGenericTermsRemoteUI _cleanupRUILoader](self, "_cleanupRUILoader");
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke;
  aBlock[3] = &unk_1EA2DCCD0;
  aBlock[4] = self;
  v13 = v11;
  v22 = v13;
  v14 = _Block_copy(aBlock);
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))v14;
  if (v8 && v6)
  {
    _AAUILogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "Marking account as agreed to terms...", buf, 2u);
    }

    -[ACAccount aa_setNeedsToVerifyTerms:](self->_account, "aa_setNeedsToVerifyTerms:", 0);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_88;
    v17[3] = &unk_1EA2DCCF8;
    v19 = v15;
    v17[4] = self;
    v18 = v8;
    -[AAUIGenericTermsRemoteUI _agreeToTermsWithURLString:serverInfo:preferPassword:completion:](self, "_agreeToTermsWithURLString:serverInfo:preferPassword:completion:", v18, v9, 1, v17);

  }
  else if (v6)
  {
    (*((void (**)(void *, uint64_t, _QWORD))v14 + 2))(v14, 1, 0);
  }
  else
  {
    -[ACAccount aa_setNeedsToVerifyTerms:](self->_account, "aa_setNeedsToVerifyTerms:", 1);
    v15[2](v15, 0, 0);
  }

}

void __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_2;
  v8[3] = &unk_1EA2DC6F8;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v11 = a2;
  v9 = v6;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char isKindOfClass;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;
  _QWORD aBlock[5];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_3;
  aBlock[3] = &unk_1EA2DCC80;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v3 = _Block_copy(aBlock);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((isKindOfClass & 1) != 0)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing presented RUINavigationController %@...", buf, 0xCu);
    }

    v8 = *(void **)(a1 + 40);
    v10[0] = v2;
    v10[1] = 3221225472;
    v10[2] = __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_87;
    v10[3] = &unk_1EA2DCCA8;
    v12 = v3;
    v13 = *(_BYTE *)(a1 + 56);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v10);

  }
  else
  {
    if (v6)
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Terms error alert is not being presented %@. Skipping dismiss", buf, 0xCu);
    }

    (*((void (**)(void *, _QWORD, _QWORD))v3 + 2))(v3, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }

}

void __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  if ((v6 & 1) != 0)
    objc_msgSend(v7, "genericTermsRemoteUI:didFinishWithSuccess:serverInfo:", v9, a2, v10);
  else
    objc_msgSend(v7, "genericTermsRemoteUI:didFinishWithSuccess:", v9, a2);

}

uint64_t __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_87(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "Dismissed presented RUINavigationController", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_88(uint64_t a1, int a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, id);
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(void (**)(uint64_t, uint64_t, id))(v4 + 16);
    v6 = a3;
    v5(v4, 1, v6);
  }
  else
  {
    v7 = a3;
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Failed to agree using PET, attempting with token...", buf, 2u);
    }

    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_89;
    v11[3] = &unk_1EA2DC0E8;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v9, "_agreeToTermsWithURLString:serverInfo:preferPassword:completion:", v10, v7, 0, v11);

    v6 = v12;
  }

}

uint64_t __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_89(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_cleanupRUILoader
{
  RemoteUIController *remoteUIController;

  -[RemoteUIController setDelegate:](self->_remoteUIController, "setDelegate:", 0);
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = 0;

}

- (id)_sessionConfiguration
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D00140]);
  objc_msgSend(v2, "set_appleIDContext:", v3);

  return v2;
}

- (void)_displayConnectionErrorAndDismiss
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[AAUIGenericTermsRemoteUI remoteUIController](self, "remoteUIController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPresentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SERVER_UNREACHABLE_MESSAGE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__AAUIGenericTermsRemoteUI__displayConnectionErrorAndDismiss__block_invoke;
    v11[3] = &unk_1EA2DB208;
    v11[4] = self;
    objc_msgSend(v5, "alertWithTitle:message:buttonTitle:actionHandler:", v7, 0, v9, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "presentViewController:animated:completion:", v10, 1, 0);
  }
  else
  {
    -[AAUIGenericTermsRemoteUI _cleanUpAndDismissWithSuccess:agreeURL:serverInfo:](self, "_cleanUpAndDismissWithSuccess:agreeURL:serverInfo:", 0, 0, 0);
  }

}

uint64_t __61__AAUIGenericTermsRemoteUI__displayConnectionErrorAndDismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpAndDismissWithSuccess:agreeURL:serverInfo:", 0, 0, 0);
}

- (void)_addHeadersToRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "aa_addClientInfoHeaders");
  objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", self->_account, self->_isPreferringPassword);
  -[AAUIGenericTermsRemoteUI additionalHeaders](self, "additionalHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AAUIGenericTermsRemoteUI additionalHeaders](self, "additionalHeaders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__AAUIGenericTermsRemoteUI__addHeadersToRequest___block_invoke;
    v9[3] = &unk_1EA2DCD20;
    v10 = v4;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "allHTTPHeaderFields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "Terms Secondary Request Headers: %@", buf, 0xCu);

  }
}

uint64_t __49__AAUIGenericTermsRemoteUI__addHeadersToRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (void)_renewCredentialsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (self->_account)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D00130]);
    -[AAUIGenericTermsRemoteUI _authContextForRenewCredentials](self, "_authContextForRenewCredentials");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__AAUIGenericTermsRemoteUI__renewCredentialsWithCompletion___block_invoke;
    v8[3] = &unk_1EA2DCD48;
    v8[4] = self;
    v9 = v5;
    objc_msgSend(v6, "authenticateWithContext:completion:", v7, v8);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __60__AAUIGenericTermsRemoteUI__renewCredentialsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "aa_setPassword:", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (id)_authContextForRenewCredentials
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D002F8]);
  -[ACAccount username](self->_account, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUsername:", v4);

  objc_msgSend(v3, "setIsUsernameEditable:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_originatingViewController);
  objc_msgSend(v3, "setPresentingViewController:", WeakRetained);

  objc_msgSend(v3, "setShouldOfferSecurityUpgrade:", 0);
  objc_msgSend(v3, "setServiceType:", 1);
  objc_msgSend(v3, "setAuthenticationType:", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PASSWORD_REQUIRED_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RENEW_FOR_TERMS_AND_CONDITIONS_MESSAGE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount username](self->_account, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReason:", v12);

  return v3;
}

- (void)_reportTermsUserAction:(id)a3 agreeUrl:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  v12 = *MEMORY[0x1E0CFADA0];
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithDictionary:", v9);

  if (v7)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("agreeUrl"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFAD40]), "initWithAccount:parameters:", self->_account, v10);
  objc_msgSend(v11, "reportEvent");

}

- (AAUIGenericTermsRemoteUIDelegate)delegate
{
  return (AAUIGenericTermsRemoteUIDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)originatingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_originatingViewController);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_additionalHeaders, a3);
}

- (AAUIServerHookHandlerDelegate)hookHandlerDelegate
{
  return self->_hookHandlerDelegate;
}

- (void)setHookHandlerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_hookHandlerDelegate, a3);
}

- (RemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (void)setRemoteUIController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUIController, a3);
}

- (RUIServerHookHandler)serverHookHandler
{
  return self->_serverHookHandler;
}

- (void)setServerHookHandler:(id)a3
{
  objc_storeStrong((id *)&self->_serverHookHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHookHandler, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_hookHandlerDelegate, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_destroyWeak((id *)&self->_originatingViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_slaVersion, 0);
  objc_storeStrong((id *)&self->_termsEntries, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_genericTermsUIViewController, 0);
  objc_destroyWeak((id *)&self->_parentNavController);
}

- (void)remoteUIController:didReceiveObjectModel:actionSignal:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, v0, v1, "Terms dismiss handler, clientInfo dictionary %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a1, a3, "%s: self is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, v0, v1, "Terms agree handler, clientInfo dictionary %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_63_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, v0, v1, "Terms defer handler, clientInfo dictionary %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_66_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, v0, v1, "Terms disagree handler, clientInfo dictionary %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Is unauthorized error, will attempt renewCredentials", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Attempt with renewed credentials failed, reattempting request using token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_cold_3()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_1DB4ED000, v1, OS_LOG_TYPE_ERROR, "RUILoader didFailWithError: %@, success = %i", v2, 0x12u);
  OUTLINED_FUNCTION_4();
}

void __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_71_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Renew succeeded, reattempting request using PET", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_71_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Renew failed, reattempting request using token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_agreeToTermsWithURLString:serverInfo:preferPassword:completion:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1DB4ED000, v0, OS_LOG_TYPE_DEBUG, "Adding SLAVersion to the request.", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Error agreeing to iCloud terms!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Error agreeing to iCloud terms: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1DB4ED000, v1, OS_LOG_TYPE_DEBUG, "AAiCloudTermsAgreeRequest response: %@. Error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __69__AAUIGenericTermsRemoteUI__disagreeToTermsWithURLString_serverInfo___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "statusCode");
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_ERROR, "Failed to mark terms as disagreed in iCloud with HTTP status %ld", v3, 0xCu);
}

void __69__AAUIGenericTermsRemoteUI__disagreeToTermsWithURLString_serverInfo___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Failed to mark terms as disagreed in iCloud with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
