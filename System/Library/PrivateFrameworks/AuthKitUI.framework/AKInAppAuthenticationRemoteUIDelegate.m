@implementation AKInAppAuthenticationRemoteUIDelegate

- (AKInAppAuthenticationRemoteUIDelegate)initWithContext:(id)a3
{
  id v4;
  AKInAppAuthenticationRemoteUIDelegate *v5;
  AKInAppAuthenticationRemoteUIDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKInAppAuthenticationRemoteUIDelegate;
  v5 = -[AKInAppAuthenticationRemoteUIDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_context, v4);

  return v6;
}

- (void)clearObjectModel
{
  RUIObjectModel *currentRemoteOM;

  currentRemoteOM = self->_currentRemoteOM;
  self->_currentRemoteOM = 0;

}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  int v19;
  unint64_t v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  int v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  -[AKAppleIDServerUIContextController processResponse:](self->_serverUIContextController, "processResponse:", a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "topViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _AKLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl(&dword_1BD795000, v14, OS_LOG_TYPE_DEFAULT, "Starting nav controller: %@", buf, 0xCu);
    }

    objc_storeWeak((id *)&self->_topViewControllerOnLoadStart, v13);
  }
  objc_msgSend(WeakRetained, "httpHeadersForRemoteUI");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __117__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke;
  v26[3] = &unk_1E7679798;
  v16 = v9;
  v27 = v16;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v26);
  if (objc_msgSend(WeakRetained, "needsCredentialRecovery"))
    v17 = objc_msgSend(WeakRetained, "isRequestedFromOOPViewService");
  else
    v17 = 0;
  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isForgotPasswordNativeTakeoverEnabled");

  if (v19 && v17)
  {
    v20 = -[AKInAppAuthenticationRemoteUIDelegate _passwordResetRequestType](self, "_passwordResetRequestType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forHTTPHeaderField:", v22, *MEMORY[0x1E0CFFEB0]);

    if ((objc_msgSend(WeakRetained, "isNativeTakeover") & 1) != 0)
    {
      v23 = (_QWORD *)MEMORY[0x1E0D000A0];
LABEL_14:
      objc_msgSend(v16, "setValue:forHTTPHeaderField:", *v23, *MEMORY[0x1E0CFFFE8]);
      goto LABEL_15;
    }
    objc_msgSend(WeakRetained, "serviceIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0CFFF30]);

    if (v25)
    {
      v23 = (_QWORD *)MEMORY[0x1E0D00098];
      goto LABEL_14;
    }
  }
LABEL_15:
  -[AKAppleIDServerUIContextController signRequest:withCompletionHandler:](self->_serverUIContextController, "signRequest:withCompletionHandler:", v16, v10);

}

uint64_t __117__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  UINavigationController *modalRemoteUINavController;
  NSObject *v14;
  _BOOL4 v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v7;
    _os_log_impl(&dword_1BD795000, v8, OS_LOG_TYPE_DEFAULT, "A server UI request load succeeded with response: %@", (uint8_t *)&v16, 0xCu);
  }

  -[AKAppleIDServerUIContextController processResponse:](self->_serverUIContextController, "processResponse:", v7);
  if (-[AKInAppAuthenticationRemoteUIDelegate _isDeferrableFinalResponseHarvested](self, "_isDeferrableFinalResponseHarvested"))
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1BD795000, v9, OS_LOG_TYPE_DEFAULT, "A deferrable final response detected, waiting for object model to load before completing", (uint8_t *)&v16, 2u);
    }

  }
  else
  {
    if (self->_currentRemoteOM)
    {
      -[AKAppleIDServerUIContextController serverDataHarvester](self->_serverUIContextController, "serverDataHarvester");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "harvestDataFromServerUIObjectModel:", self->_currentRemoteOM);

    }
    -[AKAppleIDServerUIContextController serverUIDelegate](self->_serverUIContextController, "serverUIDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isResponseFinal:", v7);

    if (v12)
    {
      modalRemoteUINavController = self->_modalRemoteUINavController;
      _AKLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (modalRemoteUINavController)
      {
        if (v15)
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1BD795000, v14, OS_LOG_TYPE_DEFAULT, "We are inside a modal flow, deferring response processing", (uint8_t *)&v16, 2u);
        }

        objc_storeStrong((id *)&self->_deferredResponse, a4);
      }
      else
      {
        if (v15)
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1BD795000, v14, OS_LOG_TYPE_DEFAULT, "Final response detected and we are not modal, finishing...", (uint8_t *)&v16, 2u);
        }

        -[AKAppleIDServerUIContextController completeWithFinalResponse:](self->_serverUIContextController, "completeWithFinalResponse:", v7);
      }
    }
  }

}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  AKAuthHandlerUIImpl *v16;
  id WeakRetained;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    if (objc_msgSend(v9, "code") == -999
      && (objc_msgSend(v9, "domain"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB32E8]),
          v11,
          v12))
    {
      _AKLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BD795000, v13, OS_LOG_TYPE_DEFAULT, "User cancelled error, nothing to do here", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v9, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D87328]);
      v13 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject statusCode](v13, "statusCode") == 401)
      {
        _AKLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BD795000, v15, OS_LOG_TYPE_DEFAULT, "Received a 401 , Trying to refresh tokens", buf, 2u);
        }

        v16 = objc_alloc_init(AKAuthHandlerUIImpl);
        WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        v24 = 0;
        -[AKAuthHandlerUIImpl buildReauthenticationContextFromContext:error:](v16, "buildReauthenticationContextFromContext:error:", WeakRetained, &v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v24;

        if (v19)
        {
          -[AKInAppAuthenticationRemoteUIDelegate _showAlert:](self, "_showAlert:", v9);
        }
        else
        {
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __94__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didFinishLoadWithError_forRequest___block_invoke;
          v21[3] = &unk_1E76797C0;
          v21[4] = self;
          v22 = v8;
          v23 = v10;
          -[AKAuthHandlerImpl reauthenticateWithContext:completionWithResults:](v16, "reauthenticateWithContext:completionWithResults:", v18, v21);

        }
      }
      else if (-[NSObject statusCode](v13, "statusCode") == 409)
      {
        _AKLogSystem();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BD795000, v20, OS_LOG_TYPE_DEFAULT, "Received a 409 , Trying to rsolve the conflict by calling the appropriate endpoint.", buf, 2u);
        }

        -[AKInAppAuthenticationRemoteUIDelegate _processAndHandleConflictErrorFromResponse:](self, "_processAndHandleConflictErrorFromResponse:", v13);
      }
      else
      {
        -[AKInAppAuthenticationRemoteUIDelegate _showAlert:](self, "_showAlert:", v9);
      }
    }

  }
}

void __94__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didFinishLoadWithError_forRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = *(id **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6[5], "serverUIDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateWithAuthResults:", v5);

    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1BD795000, v8, OS_LOG_TYPE_DEFAULT, "Tokens refreshed try reloading the server UI", v9, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "loadRequest:completion:", *(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    objc_msgSend(v6, "_showAlert:", a3);
  }

}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  UINavigationController *v5;
  NSObject *v6;
  UINavigationController *modalRemoteUINavController;
  UINavigationController *v8;
  id WeakRetained;
  int v10;
  UINavigationController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (UINavigationController *)a4;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1BD795000, v6, OS_LOG_TYPE_DEFAULT, "Presenting modal nav controller: %@", (uint8_t *)&v10, 0xCu);
  }

  modalRemoteUINavController = self->_modalRemoteUINavController;
  self->_modalRemoteUINavController = v5;
  v8 = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "willPresentModalNavigationController:", v8);

}

- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4
{
  NSObject *v5;
  id WeakRetained;
  UINavigationController *modalRemoteUINavController;
  void *deferredResponse;
  AKAppleIDServerUIContextController *serverUIContextController;
  void *v10;
  void *v11;
  uint8_t v12[16];

  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Dismissed the modal nav controller", v12, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  modalRemoteUINavController = self->_modalRemoteUINavController;
  self->_modalRemoteUINavController = 0;

  objc_msgSend(WeakRetained, "willPresentModalNavigationController:", 0);
  if (self->_deferredResponse)
  {
    objc_msgSend(WeakRetained, "setPresentingServerUI:", 0);
    -[AKAppleIDServerUIContextController completeWithFinalResponse:](self->_serverUIContextController, "completeWithFinalResponse:", self->_deferredResponse);
    deferredResponse = self->_deferredResponse;
    self->_deferredResponse = 0;
  }
  else
  {
    serverUIContextController = self->_serverUIContextController;
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
    deferredResponse = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDServerUIContextController serverDataHarvester](self->_serverUIContextController, "serverDataHarvester");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "harvestedData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDServerUIContextController completeWithError:additionalData:](serverUIContextController, "completeWithError:additionalData:", deferredResponse, v11);

  }
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id WeakRetained;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  void *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  _BOOL4 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v48 = v9;
    v49 = 1024;
    v50 = a5 != 0;
    _os_log_impl(&dword_1BD795000, v10, OS_LOG_TYPE_DEFAULT, "Server UI object model received: %@ - %d", buf, 0x12u);
  }

  objc_storeStrong((id *)&self->_currentRemoteOM, a4);
  objc_msgSend(v9, "allPages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {

  }
  else
  {
    objc_msgSend(v9, "clientInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      _AKLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BD795000, v14, OS_LOG_TYPE_DEFAULT, "Request doesn't present anything, invoking processObjectModel since willPresentObjectModel won't get called", buf, 2u);
      }

      -[AAUICDPStingrayRemoteUIController processObjectModel:isModal:](self->_stingrayController, "processObjectModel:isModal:", v9, 0);
    }
  }
  objc_msgSend(v8, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v17 = objc_loadWeakRetained((id *)&self->_topViewControllerOnLoadStart);
  if (objc_msgSend(WeakRetained, "forceInlinePresentation") && v17)
  {
    objc_msgSend(WeakRetained, "presentingViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topViewController");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19 == v17)
    {
      v41 = MEMORY[0x1E0C809B0];
      v42 = 3221225472;
      v43 = __95__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke;
      v44 = &unk_1E7678D18;
      v45 = WeakRetained;
      v46 = v17;
      dispatch_async(MEMORY[0x1E0C80D38], &v41);

    }
    else
    {
      _AKLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BD795000, v20, OS_LOG_TYPE_DEFAULT, "Top view controller has changed since load start. Aborting flow.", buf, 2u);
      }

      if (a5)
        *a5 = 0;
    }

  }
  if (a5)
  {
    v21 = *a5;
    if (*a5 == 1)
    {
      _AKLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BD795000, v22, OS_LOG_TYPE_DEFAULT, "Server UI is being dismissed.", buf, 2u);
      }

      if (self->_deferredResponse)
      {
        _AKLogSystem();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BD795000, v23, OS_LOG_TYPE_DEFAULT, "We have a deferred server response, waiting until dismissal completion", buf, 2u);
        }
      }
      else
      {
        objc_msgSend(WeakRetained, "setPresentingServerUI:", 0);
        objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
        v23 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "completeWithError:", v23);
      }

    }
    objc_msgSend(v15, "presentedViewController", v41, v42, v43, v44);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = *a5;
    if (v24)
    {
      v26 = 2;
      if (v25 && v25 != 5)
        goto LABEL_35;
      goto LABEL_34;
    }
    if ((v25 | 2) == 2)
    {
      v26 = 5;
LABEL_34:
      *a5 = v26;
    }
  }
  else
  {
    v21 = 0;
  }
LABEL_35:
  if (objc_msgSend(WeakRetained, "forceInlinePresentation", v41, v42, v43, v44))
  {
    _AKLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v27, OS_LOG_TYPE_DEFAULT, "Starting inline presentation", buf, 2u);
    }

    if (a5)
    {
      *a5 = v21;
      _AKLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *a5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v29;
        _os_log_impl(&dword_1BD795000, v28, OS_LOG_TYPE_DEFAULT, "Incoming signal: %@", buf, 0xCu);

      }
      if (self->_overrideFirstActionSignal)
      {
        if (*a5 != 2)
        {
          if (*a5 != 5)
            goto LABEL_56;
          *a5 = 2;
        }
        if (objc_msgSend(WeakRetained, "needsCredentialRecovery"))
          v30 = objc_msgSend(WeakRetained, "isRequestedFromOOPViewService");
        else
          v30 = 0;
        objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isForgotPasswordNativeTakeoverEnabled");

        objc_msgSend(v15, "viewControllers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        if (v32 && v30)
        {
          if (v34)
          {
            objc_msgSend(v15, "viewControllers");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "count");

            if (v36 == 1)
            {
              objc_msgSend(v9, "defaultPages");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "firstObject");
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v38, "setLeftNavigationBarButtonItem:", 0);
              -[AKInAppAuthenticationRemoteUIDelegate _addBackButtonForController:](self, "_addBackButtonForController:", v17);

            }
          }
        }
        else
        {
          if (v34)
          {
            objc_msgSend(v9, "defaultPages");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "firstObject");
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v40, "setLeftNavigationBarButtonItem:", 0);
          }
          -[AKInAppAuthenticationRemoteUIDelegate _addBackButtonForController:](self, "_addBackButtonForController:", v17);
        }
      }
    }
  }
LABEL_56:

}

void __95__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "willShowViewController:", *(_QWORD *)(a1 + 40));
      v3 = v5;
    }
  }

}

- (void)_addBackButtonForController:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Handling first action signal", v11, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CEA7A8], "_setUseCustomBackButtonAction:", 1);
  self->_navBarButtonOverridden = 1;
  v6 = objc_alloc(MEMORY[0x1E0CEA380]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GENERIC_BACK_BUTTON"), &stru_1E7679C68, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 0, self, sel__handleBackButtonTap_);
  objc_msgSend(v4, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setBackBarButtonItem:", v9);
  self->_overrideFirstActionSignal = 0;
}

- (void)_handleBackButtonTap:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (self->_navBarButtonOverridden)
  {
    objc_msgSend(MEMORY[0x1E0CEA7A8], "_setUseCustomBackButtonAction:", 0);
    self->_navBarButtonOverridden = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "_handleBackButtonTap:", v5);

}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  id v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v9;
    _os_log_impl(&dword_1BD795000, v10, OS_LOG_TYPE_DEFAULT, "Server UI will present an object model: %@", (uint8_t *)&v24, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "setPresentingServerUI:", 1);
  if (!v5 && objc_msgSend(WeakRetained, "forceInlinePresentation"))
  {
    objc_msgSend(v8, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = objc_msgSend(WeakRetained, "needsCredentialRecovery")
          ? objc_msgSend(WeakRetained, "isRequestedFromOOPViewService")
          : 0;
      objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isForgotPasswordNativeTakeoverEnabled");

      if (!v17
        || !v15
        || (objc_msgSend(v12, "viewControllers"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "count"),
            v18,
            v19 == 1))
      {
        objc_msgSend(v9, "defaultPages");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "setLeftNavigationBarButtonItem:", 0);
      }
    }

  }
  if (self->_currentRemoteOM
    && -[AKInAppAuthenticationRemoteUIDelegate _isDeferrableFinalResponseHarvested](self, "_isDeferrableFinalResponseHarvested"))
  {
    _AKLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1BD795000, v22, OS_LOG_TYPE_DEFAULT, "Deferred final response detected, finishing...", (uint8_t *)&v24, 2u);
    }

    -[AKAppleIDServerUIContextController serverDataHarvester](self->_serverUIContextController, "serverDataHarvester");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "harvestDataFromServerUIObjectModel:", self->_currentRemoteOM);

    -[AKAppleIDServerUIContextController completeWithFinalResponse:](self->_serverUIContextController, "completeWithFinalResponse:", 0);
  }
  else
  {
    -[AAUICDPStingrayRemoteUIController processObjectModel:isModal:](self->_stingrayController, "processObjectModel:isModal:", v9, v5);
  }

}

- (void)remoteUIController:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  v7 = a5;
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveChallenge_completionHandler___block_invoke;
  v11[3] = &unk_1E7678CF0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

uint64_t __98__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t (*v11)(void);
  NSObject *v12;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __98__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveChallenge_completionHandler___block_invoke_cold_2(v2);

  objc_msgSend(*(id *)(a1 + 32), "protectionSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authenticationMethod");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB32C8]);

  if (!v5)
    goto LABEL_5;
  v6 = (void *)MEMORY[0x1E0D001C0];
  objc_msgSend(*(id *)(a1 + 32), "protectionSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "serverTrust");
  objc_msgSend(*(id *)(a1 + 32), "protectionSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isValidCertificateTrust:forHostname:", v8, v10);

  if (!(_DWORD)v6)
  {
    _AKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __98__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveChallenge_completionHandler___block_invoke_cold_1(v12);

    v11 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
LABEL_5:
    v11 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v11();
}

- (unint64_t)_passwordResetRequestType
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryAuthKitAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(WeakRetained, "username");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_9:
    v11 = 2;
    goto LABEL_10;
  }
  v6 = (void *)v5;
  objc_msgSend(WeakRetained, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {

    goto LABEL_9;
  }
  objc_msgSend(v4, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
    v11 = 1;
  else
    v11 = 2;
LABEL_10:

  return v11;
}

- (BOOL)_isDeferrableFinalResponseHarvested
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  -[AKAppleIDServerUIContextController serverDataHarvester](self->_serverUIContextController, "serverDataHarvester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "harvestedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CFFED8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFED8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CFFEF0]) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[AKAppleIDServerUIContextController serverDataHarvester](self->_serverUIContextController, "serverDataHarvester");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "harvestedData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CFFEF8]);

  }
  return v7;
}

- (void)_showAlert:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v3;
    _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "A server UI load failed with error %@", buf, 0xCu);
  }

  v5 = (void *)MEMORY[0x1E0CEA2E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("VERIFICATION_FAILED"), &stru_1E7679C68, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SERVER_ERROR"), &stru_1E7679C68, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E7679C68, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__AKInAppAuthenticationRemoteUIDelegate__showAlert___block_invoke;
  v21[3] = &unk_1E76797E8;
  v21[4] = self;
  v22 = v3;
  v14 = v3;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 1, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v15);

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "presentingViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentedViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
    v18 = v17;
  objc_msgSend(v18, "presentViewController:animated:completion:", v10, 1, 0);

}

void __52__AKInAppAuthenticationRemoteUIDelegate__showAlert___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:underlyingError:", -7019, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "completeWithError:", v2);

}

- (void)_processAndHandleConflictErrorFromResponse:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = a3;
  -[AKAppleIDServerUIContextController processResponse:](self->_serverUIContextController, "processResponse:", v4);
  if (-[AKInAppAuthenticationRemoteUIDelegate _isDeferrableFinalResponseHarvested](self, "_isDeferrableFinalResponseHarvested")|| (-[AKAppleIDServerUIContextController serverUIDelegate](self->_serverUIContextController, "serverUIDelegate"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "isResponseCompleteAndConflict:", v4), v5, !v6))
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1BD795000, v8, OS_LOG_TYPE_DEFAULT, "A deferrable final response detected, waiting for object model to load before completing", v9, 2u);
    }

  }
  else
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v7, OS_LOG_TYPE_DEFAULT, "We have a conflict but complete response.", buf, 2u);
    }

    -[AKAppleIDServerUIContextController completeWithFinalResponse:](self->_serverUIContextController, "completeWithFinalResponse:", v4);
  }

}

- (AKAppleIDServerUIContextController)serverUIContextController
{
  return self->_serverUIContextController;
}

- (void)setServerUIContextController:(id)a3
{
  objc_storeStrong((id *)&self->_serverUIContextController, a3);
}

- (RUIObjectModel)currentRemoteOM
{
  return self->_currentRemoteOM;
}

- (UINavigationController)modalRemoteUINavController
{
  return self->_modalRemoteUINavController;
}

- (BOOL)overrideFirstActionSignal
{
  return self->_overrideFirstActionSignal;
}

- (void)setOverrideFirstActionSignal:(BOOL)a3
{
  self->_overrideFirstActionSignal = a3;
}

- (AAUICDPStingrayRemoteUIController)stingrayController
{
  return self->_stingrayController;
}

- (void)setStingrayController:(id)a3
{
  objc_storeStrong((id *)&self->_stingrayController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stingrayController, 0);
  objc_storeStrong((id *)&self->_modalRemoteUINavController, 0);
  objc_storeStrong((id *)&self->_currentRemoteOM, 0);
  objc_storeStrong((id *)&self->_serverUIContextController, 0);
  objc_storeStrong((id *)&self->_deferredResponse, 0);
  objc_destroyWeak((id *)&self->_topViewControllerOnLoadStart);
  objc_destroyWeak((id *)&self->_context);
}

void __98__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveChallenge_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD795000, log, OS_LOG_TYPE_ERROR, "Server cert validity check failed!", v1, 2u);
}

void __98__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveChallenge_completionHandler___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD795000, log, OS_LOG_TYPE_DEBUG, "Server UI received a challange, validating...", v1, 2u);
}

@end
