@implementation AKInAppAuthenticationRemoteUIProvider

- (AKInAppAuthenticationRemoteUIProvider)initWithContext:(id)a3
{
  id v4;
  AKInAppAuthenticationRemoteUIProvider *v5;
  AKInAppAuthenticationRemoteUIProvider *v6;
  AKInAppAuthenticationRemoteUIDelegate *v7;
  AKInAppAuthenticationRemoteUIDelegate *remoteUIControllerDelegate;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKInAppAuthenticationRemoteUIProvider;
  v5 = -[AKInAppAuthenticationRemoteUIProvider init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    v7 = -[AKInAppAuthenticationRemoteUIDelegate initWithContext:]([AKInAppAuthenticationRemoteUIDelegate alloc], "initWithContext:", v4);
    remoteUIControllerDelegate = v6->_remoteUIControllerDelegate;
    v6->_remoteUIControllerDelegate = v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_remoteUIController)
    -[AKInAppAuthenticationRemoteUIProvider _clearRemoteUIController](self, "_clearRemoteUIController");
  v3.receiver = self;
  v3.super_class = (Class)AKInAppAuthenticationRemoteUIProvider;
  -[AKInAppAuthenticationRemoteUIProvider dealloc](&v3, sel_dealloc);
}

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  if (-[AKInAppAuthenticationRemoteUIProvider _shouldShowAsView](self, "_shouldShowAsView"))
    -[AKInAppAuthenticationRemoteUIProvider presentBasicLoginUIAsViewWithCompletion:](self, "presentBasicLoginUIAsViewWithCompletion:", v4);
  else
    -[AKInAppAuthenticationRemoteUIProvider presentBasicLoginUIAsAlertWithCompletion:](self, "presentBasicLoginUIAsAlertWithCompletion:", v4);

}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "ak_isAuthenticationErrorWithCode:", -7012)
    && -[AKInAppAuthenticationRemoteUIProvider _shouldUsePasswordDelegate](self, "_shouldUsePasswordDelegate"))
  {
    _AKLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v14, OS_LOG_TYPE_DEFAULT, "Username is present but password is missing and required. Client should provide us with password.", buf, 2u);
    }

    -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "username");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_completion___block_invoke;
    block[3] = &unk_1E76794A0;
    block[4] = self;
    v19 = v16;
    v20 = v13;
    v17 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else if (-[AKInAppAuthenticationRemoteUIProvider _shouldShowAsView](self, "_shouldShowAsView"))
  {
    -[AKInAppAuthenticationRemoteUIProvider presentLoginAlertUIAsViewWithError:title:message:waitForInteraction:completion:](self, "presentLoginAlertUIAsViewWithError:title:message:waitForInteraction:completion:", v10, v11, v12, 0, v13);
  }
  else
  {
    -[AKInAppAuthenticationRemoteUIProvider presentLoginAlertWithError:title:message:waitForInteraction:completion:](self, "presentLoginAlertWithError:title:message:waitForInteraction:completion:", v10, v11, v12, 0, v13);
  }

}

void __93__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_completion___block_invoke(id *a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = objc_msgSend(a1[4], "_shouldShowAsView");
  objc_msgSend(a1[4], "_actionsForLoginWithCompletion:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 8;
  if (v2)
    v4 = 16;
  objc_msgSend(*(id *)((char *)a1[4] + v4), "setLoginActions:", v3);

  objc_msgSend(a1[4], "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_passwordDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_completion___block_invoke_2;
  v7[3] = &unk_1E7679478;
  v9 = a1[6];
  v8 = a1[5];
  objc_msgSend(v6, "context:needsPasswordWithCompletion:", v5, v7);

}

uint64_t __93__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, 0, a3);
}

- (void)dismissBasicLoginUIWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__AKInAppAuthenticationRemoteUIProvider_dismissBasicLoginUIWithCompletion___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __75__AKInAppAuthenticationRemoteUIProvider_dismissBasicLoginUIWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __75__AKInAppAuthenticationRemoteUIProvider_dismissBasicLoginUIWithCompletion___block_invoke_2;
  v2[3] = &unk_1E76794C8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "cleanUpBasicLoginWithCompletion:", v2);

}

uint64_t __75__AKInAppAuthenticationRemoteUIProvider_dismissBasicLoginUIWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentProximityBroadcastUIWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  AKProximityAuthViewController *WeakRetained;
  AKProximityAuthViewController *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  AKProximityMessageViewModel *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD, void *))a3;
  -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = (AKProximityAuthViewController *)objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AKInAppAuthenticationRemoteUIProvider presentProximityBroadcastUIWithCompletion:].cold.1();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFFF20], -13003, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v10);

    }
  }
  else
  {
    -[AKInAppAuthenticationRemoteUIProvider _disableIdleTimerIfNeeded](self, "_disableIdleTimerIfNeeded");
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v11, OS_LOG_TYPE_DEFAULT, "Creating new proximity pairing view.", buf, 2u);
    }

    v12 = -[AKProximityMessageViewModel initWithType:]([AKProximityMessageViewModel alloc], "initWithType:", 0);
    v8 = -[AKProximityAuthViewController initWithViewModel:]([AKProximityAuthViewController alloc], "initWithViewModel:", v12);
    objc_storeWeak((id *)&self->_proximityAuthViewController, v8);

    -[AKInAppAuthenticationRemoteUIProvider _configureProximityAuthLoginOptionsWithCompletion:](self, "_configureProximityAuthLoginOptionsWithCompletion:", v4);
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1BD795000, v13, OS_LOG_TYPE_DEFAULT, "Presenting Proximity Pairing View", v17, 2u);
    }

    objc_msgSend(v6, "ak_topPresentedViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "pushViewController:animated:", v8, 1);
    }
    else
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v8);
      objc_msgSend(v14, "ak_topPresentedViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "presentViewController:animated:completion:", v15, 1, 0);

    }
    v6 = v14;
  }

}

- (void)presentProximityPairingUIWithVerificationCode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  AKProximityMessageViewModel *v11;
  AKProximityAuthViewController *WeakRetained;
  AKProximityAuthViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];

  v6 = a3;
  v7 = a4;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1BD795000, v8, OS_LOG_TYPE_DEFAULT, "Updating Proximity view to show visual pairing.", v17, 2u);
  }

  -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AKProximityMessageViewModel initWithType:]([AKProximityMessageViewModel alloc], "initWithType:", 1);
  WeakRetained = (AKProximityAuthViewController *)objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  v13 = WeakRetained;
  if (!WeakRetained)
  {
    v13 = -[AKProximityAuthViewController initWithViewModel:]([AKProximityAuthViewController alloc], "initWithViewModel:", v11);
    objc_storeWeak((id *)&self->_proximityAuthViewController, v13);
  }
  -[AKProximityAuthViewController setVerificationCode:](v13, "setVerificationCode:", v6);
  -[AKInAppAuthenticationRemoteUIProvider _configureProximityAuthLoginOptionsWithCompletion:](self, "_configureProximityAuthLoginOptionsWithCompletion:", v7);

  if (WeakRetained)
  {
    -[AKProximityAuthViewController updateViewWithViewModel:](v13, "updateViewWithViewModel:", v11);
    v14 = v10;
  }
  else
  {
    objc_msgSend(v10, "ak_topPresentedViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "pushViewController:animated:", v13, 1);
    }
    else
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v13);
      objc_msgSend(v14, "ak_topPresentedViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "presentViewController:animated:completion:", v15, 1, 0);

    }
  }

}

- (void)presentProximityPinCodeUIWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  AKProximityMessageViewModel *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  __int16 v11[8];

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 0;
    _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Updating Proximity view to show PIN code.", (uint8_t *)v11, 2u);
  }

  v6 = -[AKProximityMessageViewModel initWithType:]([AKProximityMessageViewModel alloc], "initWithType:", 2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "updateViewWithViewModel:", v6);
    if (v4)
      v4[2](v4, 1, 0);
  }
  else
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AKInAppAuthenticationRemoteUIProvider presentProximityPinCodeUIWithCompletion:].cold.1();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7013);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v10);

    }
  }

}

- (void)activateProximitySession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  AKProximityMessageViewModel *v12;
  void *v13;
  id proxAuthCompletion;
  objc_class *PASUIDependentViewPresenterClass;
  PASUIDependentViewPresenter *v16;
  PASUIDependentViewPresenter *pasViewPresenter;
  char v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  PASUIDependentViewPresenter *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v8, OS_LOG_TYPE_DEFAULT, "Activating Proximity message session...", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AKProximityMessageViewModel initWithType:]([AKProximityMessageViewModel alloc], "initWithType:", 3);
    objc_msgSend(v10, "updateViewWithViewModel:", v12);
  }
  else
  {
    _AKLogSystem();
    v12 = (AKProximityMessageViewModel *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
      -[AKInAppAuthenticationRemoteUIProvider activateProximitySession:completion:].cold.3();
    v11 = 0;
  }

  -[AKInAppAuthenticationRemoteUIProvider _configureProximityAuthLoginOptionsWithCompletion:](self, "_configureProximityAuthLoginOptionsWithCompletion:", v6);
  v13 = (void *)MEMORY[0x1C3B760D8](v6);

  proxAuthCompletion = self->_proxAuthCompletion;
  self->_proxAuthCompletion = v13;

  PASUIDependentViewPresenterClass = (objc_class *)ProximityAppleIDSetupUILibraryCore();
  if (PASUIDependentViewPresenterClass)
    PASUIDependentViewPresenterClass = (objc_class *)getPASUIDependentViewPresenterClass();
  v16 = (PASUIDependentViewPresenter *)objc_alloc_init(PASUIDependentViewPresenterClass);
  pasViewPresenter = self->_pasViewPresenter;
  self->_pasViewPresenter = v16;

  -[PASUIDependentViewPresenter setDelegate:](self->_pasViewPresenter, "setDelegate:", self);
  v18 = objc_opt_respondsToSelector();
  _AKLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if ((v18 & 1) != 0)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[AKInAppAuthenticationRemoteUIProvider activateProximitySession:completion:].cold.1((uint64_t *)&self->_pasViewPresenter, v20, v21);

    -[PASUIDependentViewPresenter setShouldSignInForSelf:](self->_pasViewPresenter, "setShouldSignInForSelf:", 1);
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[AKInAppAuthenticationRemoteUIProvider activateProximitySession:completion:].cold.2((uint64_t *)&self->_pasViewPresenter, v20, v22);

  }
  v23 = self->_pasViewPresenter;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __77__AKInAppAuthenticationRemoteUIProvider_activateProximitySession_completion___block_invoke;
  v25[3] = &unk_1E7678D18;
  v25[4] = self;
  v26 = v11;
  v24 = v11;
  -[PASUIDependentViewPresenter activateWithTemplateMessageSession:completionHandler:](v23, "activateWithTemplateMessageSession:completionHandler:", v7, v25);

}

void __77__AKInAppAuthenticationRemoteUIProvider_activateProximitySession_completion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __77__AKInAppAuthenticationRemoteUIProvider_activateProximitySession_completion___block_invoke_2;
  v2[3] = &unk_1E7678D18;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __77__AKInAppAuthenticationRemoteUIProvider_activateProximitySession_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "startFlowWithNavigationController:", *(_QWORD *)(a1 + 40));
}

- (void)_configureProximityAuthLoginOptionsWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  id proxAuthCompletion;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  BOOL v21;
  _QWORD v22[4];
  id v23;
  BOOL v24;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ak_topPresentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v8 = (objc_opt_isKindOfClass() & 1) == 0;
  objc_initWeak(&location, self);
  v9 = objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  v10 = (void *)MEMORY[0x1C3B760D8](v4);
  proxAuthCompletion = self->_proxAuthCompletion;
  self->_proxAuthCompletion = v10;

  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke;
  v22[3] = &unk_1E7678E98;
  objc_copyWeak(&v23, &location);
  v24 = v8;
  objc_msgSend(v9, "setPrimaryButtonAction:", v22);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_3;
  v19[3] = &unk_1E7678E98;
  objc_copyWeak(&v20, &location);
  v21 = v8;
  objc_msgSend(v9, "setAlternateButtonAction:", v19);
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_3_41;
  v17[3] = &unk_1E7678EE8;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v9, "setAlternateButtonAction:", v17);
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2_43;
  v15[3] = &unk_1E7678EE8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v9, "setCancelAction:", v15);
  v13[0] = v12;
  v13[1] = 3221225472;
  v13[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2_45;
  v13[3] = &unk_1E7678EE8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v9, "setDeallocAction:", v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

void __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  _QWORD v15[5];
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User choose primary fallback to proximity auth.", buf, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFFF20], -13008, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_37;
    v15[3] = &unk_1E7678DE8;
    v15[4] = v4;
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3B760D8](v15);
    v9 = v8;
    if (*(_BYTE *)(a1 + 40))
    {
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2;
      v12[3] = &unk_1E76794F0;
      v14 = v8;
      v13 = v6;
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v12);

    }
    else
    {
      objc_msgSend(v5, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v10, "popViewControllerAnimated:", 1);

      ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v6);
    }

  }
}

uint64_t __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_37(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[6];
  if (v3)
  {
    (*(void (**)(_QWORD))(v3 + 16))(v2[6]);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "completeProximityAuth");
}

uint64_t __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  _QWORD v15[5];
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User choose primary fallback to proximity auth.", buf, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFFF20], -13009, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_39;
    v15[3] = &unk_1E7678DE8;
    v15[4] = v4;
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3B760D8](v15);
    v9 = v8;
    if (*(_BYTE *)(a1 + 40))
    {
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2_40;
      v12[3] = &unk_1E76794F0;
      v14 = v8;
      v13 = v6;
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v12);

    }
    else
    {
      objc_msgSend(v5, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v10, "popViewControllerAnimated:", 1);

      ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v6);
    }

  }
}

uint64_t __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_39(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[6];
  if (v3)
  {
    (*(void (**)(_QWORD))(v3 + 16))(v2[6]);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "completeProximityAuth");
}

uint64_t __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2_40(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_3_41(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  _QWORD v6[5];
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User choose secondary fallback to proximity auth.", buf, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 13);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_42;
    v6[3] = &unk_1E76789A0;
    v6[4] = v4;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);
    objc_msgSend(v4, "completeProximityAuth");

  }
}

void __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_42(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFFF20], -13009, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2_43(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD v4[5];
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User canceled proximity auth.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_44;
  v4[3] = &unk_1E7678DE8;
  v4[4] = WeakRetained;
  objc_msgSend(WeakRetained, "dismissProximityPairingUIWithCompletion:", v4);

}

uint64_t __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_44(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[6];
  if (v3)
  {
    (*(void (**)(_QWORD))(v3 + 16))(v2[6]);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "completeProximityAuth");
}

void __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2_45(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && WeakRetained[6])
  {
    _AKLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Calling end proximity auth on view dealloc", v6, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFFF20], -13006, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v2[6];
    if (v5)
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);
    objc_msgSend(v2, "completeProximityAuth");

  }
}

- (void)completeProximityAuth
{
  UINavigationController *navController;
  id proxAuthCompletion;
  NSDictionary *proxAuthResults;
  PASUIDependentViewPresenter *pasViewPresenter;
  NSError *proxSetupError;

  objc_storeWeak((id *)&self->_proximityAuthViewController, 0);
  navController = self->_navController;
  self->_navController = 0;

  proxAuthCompletion = self->_proxAuthCompletion;
  self->_proxAuthCompletion = 0;

  proxAuthResults = self->_proxAuthResults;
  self->_proxAuthResults = 0;

  pasViewPresenter = self->_pasViewPresenter;
  self->_pasViewPresenter = 0;

  proxSetupError = self->_proxSetupError;
  self->_proxSetupError = 0;

  -[AKInAppAuthenticationRemoteUIProvider _enableIdleTimerIfNeeded](self, "_enableIdleTimerIfNeeded");
}

- (void)_enableIdleTimerIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Skipping enabling idle timer...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_disableIdleTimerIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Disabling idle timer...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)dismissProximityPairingUIWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  AKInAppAuthenticationRemoteUIProvider *v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing Proximity Pairing UI...", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__AKInAppAuthenticationRemoteUIProvider_dismissProximityPairingUIWithCompletion___block_invoke;
  block[3] = &unk_1E7678F60;
  v10 = WeakRetained;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __81__AKInAppAuthenticationRemoteUIProvider_dismissProximityPairingUIWithCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];
  _QWORD v7[5];
  id v8;

  v2 = (void *)a1[4];
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__AKInAppAuthenticationRemoteUIProvider_dismissProximityPairingUIWithCompletion___block_invoke_2;
    v7[3] = &unk_1E7678CF0;
    v3 = (void *)a1[6];
    v7[4] = a1[5];
    v8 = v3;
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v7);

  }
  else
  {
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "Proximity Pairing UI is not shown, nothing to clean up", v6, 2u);
    }

    v5 = a1[6];
    if (v5)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);
  }
}

void __81__AKInAppAuthenticationRemoteUIProvider_dismissProximityPairingUIWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFFF20], -13004, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v4)
  {
    v7 = (id)v2;
    v5 = v4;

    v3 = v5;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v8 = v3;
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    v3 = v8;
  }

}

- (void)showProximityErrorWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSError *v6;
  NSError *proxSetupError;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AKInAppAuthenticationRemoteUIProvider *v13;
  id v14;
  uint8_t buf[16];

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Showing Proximity Error UI...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFFF20], -130011, 0);
  v6 = (NSError *)objc_claimAutoreleasedReturnValue();
  proxSetupError = self->_proxSetupError;
  self->_proxSetupError = v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__AKInAppAuthenticationRemoteUIProvider_showProximityErrorWithCompletion___block_invoke;
  block[3] = &unk_1E76794A0;
  v13 = self;
  v14 = v4;
  v12 = WeakRetained;
  v9 = v4;
  v10 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__AKInAppAuthenticationRemoteUIProvider_showProximityErrorWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  AKProximityMessageViewModel *v4;
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = -[AKProximityMessageViewModel initWithType:]([AKProximityMessageViewModel alloc], "initWithType:", 4);
    objc_msgSend(*(id *)(a1 + 32), "updateViewWithViewModel:", v4);

  }
  else
  {
    _AKLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "Proximity Pairing UI is not shown, nothing to clean up", buf, 2u);
    }

    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
  }
}

- (void)presentKeepUsingUIForAppleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  AKInAppAuthenticationRemoteUIProvider *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke;
  block[3] = &unk_1E7678F60;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  char v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  char v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    v43 = v3;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "Presenting keep using alert for %@", buf, 0xCu);
  }

  objc_msgSend(a1[5], "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("KEEP_USING_ALERT_TITLE");
  v8 = objc_msgSend(CFSTR("KEEP_USING_ALERT_TITLE"), "containsString:", CFSTR("REBRAND"));
  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("KEEP_USING_ALERT_TITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E7679C68, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D002B8], "formattedUsernameFromUsername:", a1[4]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceType");
  AKLocStringFromServiceType();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  if ((v8 & 1) == 0)

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v13, 0, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("KEEP_USING_ALERT_YES_BUTTON"), &stru_1E7679C68, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke_65;
  v38[3] = &unk_1E7679518;
  v18 = v4;
  v39 = v18;
  v40 = a1[4];
  v41 = a1[6];
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v38);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v19);

  v20 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = CFSTR("KEEP_USING_ALERT_NO_BUTTON");
  v23 = objc_msgSend(CFSTR("KEEP_USING_ALERT_NO_BUTTON"), "containsString:", CFSTR("REBRAND"));
  if ((v23 & 1) != 0)
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("KEEP_USING_ALERT_NO_BUTTON"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v24 = 1;
    }
    else
    {
      v24 = 0;
    }
  }
  objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_1E7679C68, CFSTR("Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke_69;
  v36[3] = &unk_1E7678D70;
  v37 = a1[6];
  objc_msgSend(v20, "actionWithTitle:style:handler:", v25, 0, v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v26);

  if (v24)
  if ((v23 & 1) == 0)

  v27 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("KEEP_USING_ALERT_CANCEL_BUTTON"), &stru_1E7679C68, CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke_72;
  v34[3] = &unk_1E7678D70;
  v35 = a1[6];
  objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 0, v34);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v30);

  objc_msgSend(v18, "presentingViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "presentViewController:animated:completion:", v14, 1, 0);

}

uint64_t __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke_65(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User accepted using the suggested Apple ID.", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setUsername:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setIsUsernameEditable:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke_69(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User opted to use another Apple ID.", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7119);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

void __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke_72(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User opted to cancel using the suggested Apple ID.", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

- (void)dismissKeepUsingUIWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)presentSecondFactorUIWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorUIWithCompletion___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __77__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorUIWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __77__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorUIWithCompletion___block_invoke_2;
  v2[3] = &unk_1E7678CF0;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "cleanUpBasicLoginWithCompletion:", v2);

}

void __77__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorUIWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  uint64_t v6;
  int v7;
  AKBasicLoginAlertController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AKBasicLoginAlertController *v15;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "presentedViewController");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_msgSend(v2, "piggybackingForTrustedDevice");
    v8 = [AKBasicLoginAlertController alloc];
    if (v7)
    {
      v15 = -[AKBasicLoginAlertController initWithAlertStyle:](v8, "initWithAlertStyle:", 5);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ENTER_VERIFICATION_CODE_REPAIR"), &stru_1E7679C68, CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKBasicLoginAlertController setReason:](v15, "setReason:", v10);
      goto LABEL_9;
    }
    v6 = -[AKBasicLoginAlertController initWithAlertStyle:](v8, "initWithAlertStyle:", 4);
  }
  v15 = (AKBasicLoginAlertController *)v6;
  objc_msgSend(v2, "_message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[AKBasicLoginAlertController setReason:](v15, "setReason:", v9);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ENTER_VERIFICATION_CODE"), &stru_1E7679C68, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginAlertController setReason:](v15, "setReason:", v11);

LABEL_9:
LABEL_10:

  objc_msgSend(v2, "username");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginAlertController setUsername:](v15, "setUsername:", v12);

  -[AKBasicLoginAlertController setDelegate:](v15, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_secondFactorActionsForAlert:completion:", v15, *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginAlertController setSecondFactorActions:](v15, "setSecondFactorActions:", v13);

  -[AKBasicLoginAlertController presentingViewController](v15, "presentingViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    objc_msgSend(v3, "presentViewController:animated:completion:", v15, 1, 0);

}

- (void)presentSecondFactorAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorAlertWithError_title_message_completion___block_invoke;
  block[3] = &unk_1E7679568;
  block[4] = self;
  v19 = v10;
  v21 = v12;
  v22 = v13;
  v20 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v13;
  v17 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __100__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorAlertWithError_title_message_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
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
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0CFFF10]))
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "code");

    if (v5 == -7036)
    {
      objc_msgSend(v3, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "jiggleAView");
      objc_msgSend(v6, "clearSecondFactorEntry");
      objc_msgSend(v6, "setPasscodeFieldDisabled:", 0);
      if (objc_msgSend(v2, "piggybackingForTrustedDevice"))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ENTER_VERIFICATION_CODE_REPAIR"), &stru_1E7679C68, CFSTR("Localizable"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setReason:", v8);
      }
      else
      {
        objc_msgSend(v2, "_message");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v6, "setReason:", v7);
LABEL_11:

          objc_msgSend(*(id *)(a1 + 32), "_secondFactorActionsForAlert:completion:", v6, *(_QWORD *)(a1 + 64));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setSecondFactorActions:", v19);

          goto LABEL_12;
        }
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ENTER_VERIFICATION_CODE"), &stru_1E7679C68, CFSTR("Localizable"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setReason:", v18);

      }
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E7679C68, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __100__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorAlertWithError_title_message_completion___block_invoke_2;
  v22[3] = &unk_1E7678D70;
  v23 = *(id *)(a1 + 64);
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v13);

  v14 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_1E7679C68, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __100__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorAlertWithError_title_message_completion___block_invoke_82;
  v20[3] = &unk_1E7679540;
  v20[4] = *(_QWORD *)(a1 + 32);
  v21 = *(id *)(a1 + 64);
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v17);

  objc_msgSend(v3, "presentViewController:animated:completion:", v6, 1, 0);
LABEL_12:

}

void __100__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorAlertWithError_title_message_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User canceled second-factor entry!", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

uint64_t __100__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorAlertWithError_title_message_completion___block_invoke_82(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentSecondFactorUIWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)dismissSecondFactorUIWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__AKInAppAuthenticationRemoteUIProvider_dismissSecondFactorUIWithCompletion___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __77__AKInAppAuthenticationRemoteUIProvider_dismissSecondFactorUIWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "clearObjectModel");
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)presentIDPProvidedUIWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  objc_class *ASWebAuthenticationSessionClass;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  id v14;
  id v15;
  ASWebAuthenticationSession *v16;
  ASWebAuthenticationSession *webAuthenticationSession;
  void *v18;
  id WeakRetained;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  AKInAppAuthenticationRemoteUIProvider *v27;
  id v28;

  v6 = a3;
  v7 = a4;
  ASWebAuthenticationSessionClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASWebAuthenticationSessionClass)
    ASWebAuthenticationSessionClass = (objc_class *)getASWebAuthenticationSessionClass();
  v9 = [ASWebAuthenticationSessionClass alloc];
  objc_msgSend(v6, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKIDPUtility idpURLFromRequest:](AKIDPUtility, "idpURLFromRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = AKIDPUtilityIDPScheme;
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke;
  v25[3] = &unk_1E76795B8;
  v14 = v6;
  v26 = v14;
  v27 = self;
  v15 = v7;
  v28 = v15;
  v16 = (ASWebAuthenticationSession *)objc_msgSend(v9, "initWithURL:callbackURLScheme:completionHandler:", v11, v12, v25);
  webAuthenticationSession = self->_webAuthenticationSession;
  self->_webAuthenticationSession = v16;

  -[ASWebAuthenticationSession setPrefersEphemeralWebBrowserSession:](self->_webAuthenticationSession, "setPrefersEphemeralWebBrowserSession:", 1);
  -[ASWebAuthenticationSession setPresentationContextProvider:](self->_webAuthenticationSession, "setPresentationContextProvider:", self);
  -[ASWebAuthenticationSession start](self->_webAuthenticationSession, "start");
  -[AKInAppAuthenticationRemoteUIDelegate modalRemoteUINavController](self->_remoteUIControllerDelegate, "modalRemoteUINavController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AKInAppAuthenticationRemoteUIProvider _contextDidPresentLoginController](self, "_contextDidPresentLoginController");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    objc_msgSend(WeakRetained, "presentingViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(MEMORY[0x1E0CEA7B8]);
    v22 = (void *)objc_opt_new();
    v23 = (void *)objc_msgSend(v21, "initWithRootViewController:", v22);
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke_2;
    v24[3] = &unk_1E76789A0;
    v24[4] = self;
    objc_msgSend(v20, "presentViewController:animated:completion:", v23, 1, v24);

  }
}

void __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)a1[4];
  v7 = a2;
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKIDPUtility parametersFromResponseURL:request:](AKIDPUtility, "parametersFromResponseURL:request:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke_cold_1((uint64_t)v5, v11, v12);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v9;
    _os_log_impl(&dword_1BD795000, v11, OS_LOG_TYPE_DEFAULT, "IDP ASWebAuthenticationSession completed parameters: %@", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke_84;
  v16[3] = &unk_1E7679590;
  v13 = (void *)a1[6];
  v16[4] = a1[5];
  v18 = v5;
  v19 = v13;
  v17 = v9;
  v14 = v5;
  v15 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

void __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke_84(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_contextWillDismissLoginAlertController");
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 40);
  +[AKIDPUtility convertError:](AKIDPUtility, "convertError:", *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v2 + 16))(v2, 0, v3, v4);

}

uint64_t __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_contextDidPresentLoginController");
}

- (void)presentServerProvidedUIWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  AKAppleIDServerUIContextController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  AKAppleIDServerUIContextController *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[4];
  AKAppleIDServerUIContextController *v28;
  uint8_t buf[4];
  AKInAppAuthenticationRemoteUIProvider *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = self;
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_1BD795000, v8, OS_LOG_TYPE_DEFAULT, "%@: Presenting server provided UI with configuration (%@)", buf, 0x16u);
  }

  -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "forceInlinePresentation") && objc_msgSend(v6, "presentationType") != 2)
    -[AKInAppAuthenticationRemoteUIDelegate setOverrideFirstActionSignal:](self->_remoteUIControllerDelegate, "setOverrideFirstActionSignal:", 1);
  v10 = -[AKAppleIDServerUIContextController initWithRequestConfiguration:completion:]([AKAppleIDServerUIContextController alloc], "initWithRequestConfiguration:completion:", v6, v7);

  -[AKInAppAuthenticationRemoteUIDelegate setServerUIContextController:](self->_remoteUIControllerDelegate, "setServerUIContextController:", v10);
  objc_msgSend(v9, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInAppAuthenticationRemoteUIProvider remoteUIController](self, "remoteUIController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ak_topPresentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHostViewController:", v13);

  -[AKInAppAuthenticationRemoteUIProvider ruiPreferences](self, "ruiPreferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AKInAppAuthenticationRemoteUIProvider remoteUIController](self, "remoteUIController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKInAppAuthenticationRemoteUIProvider ruiPreferences](self, "ruiPreferences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentLoadingSheet:", v16);

  }
  -[AKInAppAuthenticationRemoteUIProvider remoteUIController](self, "remoteUIController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = *MEMORY[0x1E0CFFEB8];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __93__AKInAppAuthenticationRemoteUIProvider_presentServerProvidedUIWithConfiguration_completion___block_invoke;
  v27[3] = &unk_1E76795E0;
  v28 = v10;
  v20 = v10;
  objc_msgSend(v17, "setHandlerForElementName:handler:", v19, v27);

  if (self->_basicLoginAlertController || self->_basicLoginViewController)
  {
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __93__AKInAppAuthenticationRemoteUIProvider_presentServerProvidedUIWithConfiguration_completion___block_invoke_2;
    v24[3] = &unk_1E7678CC8;
    v24[4] = self;
    v25 = v11;
    v26 = v6;
    -[AKInAppAuthenticationRemoteUIProvider cleanUpBasicLoginWithCompletion:](self, "cleanUpBasicLoginWithCompletion:", v24);

  }
  else
  {
    -[AKInAppAuthenticationRemoteUIProvider remoteUIController](self, "remoteUIController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "request");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");
    objc_msgSend(v21, "loadRequest:completion:", v23, 0);

  }
}

void __93__AKInAppAuthenticationRemoteUIProvider_presentServerProvidedUIWithConfiguration_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFEE0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "handleAuthKitActionAttribute:", v6) & 1) == 0
    && objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CFFEE8]))
  {
    objc_msgSend(*(id *)(a1 + 32), "serverDataHarvester");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "harvestDataFromServerUIObjectModel:", v8);

  }
}

void __93__AKInAppAuthenticationRemoteUIProvider_presentServerProvidedUIWithConfiguration_completion___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1[4], "remoteUIController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "ak_topPresentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHostViewController:", v3);

  objc_msgSend(a1[4], "remoteUIController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v6, "loadRequest:completion:", v5, 0);

}

- (void)dismissServerProvidedUIWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint8_t v12[16];

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Client was asked to dismiss server-provided UI.", v12, 2u);
  }

  -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isPresentingServerUI") & 1) == 0)
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AKInAppAuthenticationRemoteUIProvider dismissServerProvidedUIWithCompletion:].cold.2();
    goto LABEL_11;
  }
  -[UINavigationController viewControllers](self->_navController, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", self->_basicLoginAlertController))
  {

    goto LABEL_9;
  }
  -[UINavigationController viewControllers](self->_navController, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", self->_basicLoginViewController);

  if (v11)
  {
LABEL_9:
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AKInAppAuthenticationRemoteUIProvider dismissServerProvidedUIWithCompletion:].cold.1();
LABEL_11:

    goto LABEL_12;
  }
  if ((objc_msgSend(v6, "forceInlinePresentation") & 1) == 0)
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_12:
  objc_msgSend(v6, "setPresentingServerUI:", 0);
  -[AKInAppAuthenticationRemoteUIProvider _clearRemoteUIController](self, "_clearRemoteUIController");
  v4[2](v4, 1, 0);

}

- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke;
  v7[3] = &unk_1E7678CF0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  int v24;
  id v25;
  id *v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E7679C68, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocalizedCancelTitle:", v4);

  objc_msgSend(v2, "setTouchIDAuthenticationAllowableReuseDuration:", 20.0);
  objc_msgSend(v2, "setTouchIDAuthenticationRetryLimit:", &unk_1E769A9C8);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SIGN_IN"), &stru_1E7679C68, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(WeakRetained, "title");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v6;
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_PASSCODE_VALIDATION_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
  if (objc_msgSend(v14, "isPasscodeOnlyPolicy"))
  {
    v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
    v16 = objc_msgSend(v15, "serviceType");

    if (v16 != 2)
      goto LABEL_11;

    v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
    objc_msgSend(v14, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("PASSCODE_AUTHENTICATION_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
      v19 = (id)objc_claimAutoreleasedReturnValue();

      v13 = v20;
    }

    v11 = &stru_1E7679C68;
    v13 = v19;
  }

LABEL_11:
  v36[0] = &unk_1E769A9E0;
  v36[1] = &unk_1E769A9F8;
  v37[0] = v11;
  v37[1] = v13;
  v21 = 2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
  if (objc_msgSend(v23, "isPasscodeOnlyPolicy"))
    v21 = 1007;

  v33 = 0;
  v24 = objc_msgSend(v2, "canEvaluatePolicy:error:", v21, &v33);
  v25 = v33;
  if (v24)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke_101;
    v31[3] = &unk_1E7678F10;
    v26 = &v32;
    v32 = *(id *)(a1 + 40);
    objc_msgSend(v2, "evaluatePolicy:options:reply:", v21, v22, v31);
  }
  else
  {
    _AKLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v25;
      _os_log_impl(&dword_1BD795000, v27, OS_LOG_TYPE_DEFAULT, "Cannot Evaluate Policy error %@", buf, 0xCu);
    }

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke_103;
    v28[3] = &unk_1E76794F0;
    v26 = &v30;
    v30 = *(id *)(a1 + 40);
    v29 = v25;
    dispatch_async(MEMORY[0x1E0C80D38], v28);

  }
}

void __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "code");
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8 == -2)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BD795000, v9, OS_LOG_TYPE_DEFAULT, "User canceled the biometric authentication!", buf, 2u);
      }

      v11 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB3388];
      v29[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = -7003;
    }
    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 138412290;
        v27 = v7;
        _os_log_impl(&dword_1BD795000, v9, OS_LOG_TYPE_DEFAULT, "Biometric authentication failed with error: %@", buf, 0xCu);
      }

      v16 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB3388];
      v25 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v16;
      v14 = -7068;
    }
    objc_msgSend(v13, "ak_errorWithCode:userInfo:", v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke_102;
  block[3] = &unk_1E7679608;
  v17 = *(id *)(a1 + 32);
  v22 = v15;
  v23 = v17;
  v21 = v5;
  v18 = v15;
  v19 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke_102(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(a1[6] + 16))(a1[6], a1[4] != 0, a1[5]);
}

uint64_t __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke_103(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)presentNativeRecoveryUIWithContext:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  objc_msgSend(v5, "ak_errorWithCode:", -7027);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v7);

}

- (void)dismissNativeRecoveryUIWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(v4, "ak_errorWithCode:", -7027);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void)presentFidoAuthForContext:(id)a3 fidoContext:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  AKFidoUIController *v9;

  v6 = a5;
  v7 = a4;
  _AKLogFido();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AKInAppAuthenticationRemoteUIProvider presentFidoAuthForContext:fidoContext:completion:].cold.1();

  v9 = objc_alloc_init(AKFidoUIController);
  -[AKFidoUIController verifyFidoKeyWithFidoContext:completion:](v9, "verifyFidoKeyWithFidoContext:completion:", v7, v6);

}

- (RemoteUIController)remoteUIController
{
  void *v3;
  RemoteUIController *remoteUIController;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  RemoteUIController *v11;
  RemoteUIController *v12;
  RemoteUIController *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  objc_class *AAUICDPStingrayRemoteUIControllerClass;
  void *v20;
  void *v21;
  RemoteUIController *v22;

  -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  remoteUIController = self->_remoteUIController;
  if (!remoteUIController)
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0D00140]);
    objc_msgSend(v3, "proxiedDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      _AKLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[AKInAppAuthenticationRemoteUIProvider remoteUIController].cold.1();

      objc_msgSend(v3, "anisetteDataProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAnisetteDataProvider:", v9);

      objc_msgSend(v3, "proxiedDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPairedDevice:", v10);

    }
    objc_msgSend(v5, "set_appleIDContext:", v6);
    v11 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E0D872F0]);
    v12 = self->_remoteUIController;
    self->_remoteUIController = v11;

    -[RemoteUIController setSessionConfiguration:](self->_remoteUIController, "setSessionConfiguration:", v5);
    -[RemoteUIController setNavigationController:](self->_remoteUIController, "setNavigationController:", self->_navController);
    v13 = self->_remoteUIController;
    objc_msgSend(v3, "remoteUIStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUIController setStyle:](v13, "setStyle:", v14);

    -[RemoteUIController setDelegate:](self->_remoteUIController, "setDelegate:", v3);
    objc_msgSend(v3, "prepareRUIController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v3, "prepareRUIController");
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, RemoteUIController *))v16)[2](v16, self->_remoteUIController);

    }
    objc_msgSend(v3, "cellularDataAttributionAppBundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v3, "cellularDataAttributionAppBundleID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", v18);

    }
    AAUICDPStingrayRemoteUIControllerClass = (objc_class *)AppleAccountUILibraryCore();
    if (AAUICDPStingrayRemoteUIControllerClass)
      AAUICDPStingrayRemoteUIControllerClass = (objc_class *)getAAUICDPStingrayRemoteUIControllerClass();
    v20 = (void *)objc_msgSend([AAUICDPStingrayRemoteUIControllerClass alloc], "initWithRemoteUIController:", self->_remoteUIController);
    -[AKInAppAuthenticationRemoteUIDelegate setStingrayController:](self->_remoteUIControllerDelegate, "setStingrayController:", v20);

    -[AKInAppAuthenticationRemoteUIDelegate stingrayController](self->_remoteUIControllerDelegate, "stingrayController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "attachAllHandlers");

    remoteUIController = self->_remoteUIController;
  }
  if ((-[RemoteUIController isListeningForHSATokenAutoFill](remoteUIController, "isListeningForHSATokenAutoFill") & 1) == 0)
    -[RemoteUIController startListeningForHSATokenAutoFill](self->_remoteUIController, "startListeningForHSATokenAutoFill");
  v22 = self->_remoteUIController;

  return v22;
}

- (void)_clearRemoteUIController
{
  RemoteUIController *remoteUIController;

  if (-[RemoteUIController isListeningForHSATokenAutoFill](self->_remoteUIController, "isListeningForHSATokenAutoFill"))-[RemoteUIController stopListeningForHSATokenAutoFill](self->_remoteUIController, "stopListeningForHSATokenAutoFill");
  -[RemoteUIController setDelegate:](self->_remoteUIController, "setDelegate:", 0);
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = 0;

}

- (id)_navController
{
  UINavigationController *navController;
  UINavigationController *v4;
  UINavigationController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;

  navController = self->_navController;
  if (!navController)
  {
    v4 = (UINavigationController *)objc_alloc_init(MEMORY[0x1E0CEA7B8]);
    v5 = self->_navController;
    self->_navController = v4;

    -[UINavigationController navigationItem](self->_navController, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidesBackButton:", 1);

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 == 1)
      -[UINavigationController setModalPresentationStyle:](self->_navController, "setModalPresentationStyle:", 2);
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    objc_msgSend(WeakRetained, "willPresentModalNavigationController:", self->_navController);

    navController = self->_navController;
  }
  return navController;
}

- (void)cleanUpBasicLoginWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  AKBasicLoginViewController *basicLoginViewController;
  NSObject *v6;
  void *basicLoginAlertController;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  UINavigationController *navController;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = (void (**)(_QWORD))a3;
  if (-[AKInAppAuthenticationRemoteUIProvider _shouldShowAsView](self, "_shouldShowAsView"))
  {
    basicLoginViewController = self->_basicLoginViewController;
    if (basicLoginViewController)
    {
      if (-[AKBasicLoginViewController isPresentedModally](basicLoginViewController, "isPresentedModally"))
      {
        _AKLogSystem();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BD795000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up Basic Login View", buf, 2u);
        }

        -[AKBasicLoginViewController setLoginActions:](self->_basicLoginViewController, "setLoginActions:", 0);
        -[AKBasicLoginViewController stopAnimating](self->_basicLoginViewController, "stopAnimating");
        -[AKBasicLoginViewController dismissViewControllerAnimated:completion:](self->_basicLoginViewController, "dismissViewControllerAnimated:completion:", 1, v4);
        basicLoginAlertController = self->_basicLoginViewController;
        self->_basicLoginViewController = 0;
LABEL_19:

        navController = self->_navController;
        self->_navController = 0;

        goto LABEL_20;
      }
    }
  }
  if (self->_basicLoginAlertController)
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1BD795000, v8, OS_LOG_TYPE_DEFAULT, "Cleaning up Basic Login Alert View", v13, 2u);
    }

    -[AKBasicLoginAlertController setLoginActions:](self->_basicLoginAlertController, "setLoginActions:", 0);
    -[AKBasicLoginAlertController setSecondFactorActions:](self->_basicLoginAlertController, "setSecondFactorActions:", 0);
    -[AKBasicLoginAlertController stopAnimating](self->_basicLoginAlertController, "stopAnimating");
    -[AKBasicLoginViewController presentingViewController](self->_basicLoginViewController, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[AKBasicLoginAlertController dismissViewControllerAnimated:completion:](self->_basicLoginAlertController, "dismissViewControllerAnimated:completion:", 1, v4);
    }
    else if (v4)
    {
      v4[2](v4);
    }
    basicLoginAlertController = self->_basicLoginAlertController;
    self->_basicLoginAlertController = 0;
    goto LABEL_19;
  }
  if (v4)
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1BD795000, v10, OS_LOG_TYPE_DEFAULT, "Asked to cleanup Basic Login UI, but there is nothing to clean up.", v12, 2u);
    }

    v4[2](v4);
  }
LABEL_20:

}

- (void)_contextDidPresentLoginController
{
  void *v2;
  id v3;

  -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contextDidPresentLoginAlertController:", v3);

}

- (void)_contextWillDismissLoginAlertController
{
  void *v2;
  id v3;

  -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contextWillDismissLoginAlertController:", v3);

}

- (void)_contextDidDismissLoginAlertController
{
  void *v2;
  id v3;

  -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contextDidDismissLoginAlertController:", v3);

}

- (BOOL)_shouldShowAsView
{
  return 1;
}

- (void)_showMaxAttemptAlertWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke;
  v6[3] = &unk_1E76794F0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AKInAppAuthenticationRemoteUIProvider cleanUpBasicLoginWithCompletion:](self, "cleanUpBasicLoginWithCompletion:", v6);

}

void __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
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
  id WeakRetained;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v1 = (void *)MEMORY[0x1E0D001D8];
  if (objc_msgSend(CFSTR("FORGOT_PASSWORD_ALERT_MESSAGE"), "containsString:", CFSTR("REBRAND")))
  {
    objc_msgSend(v1, "deviceSpecificLocalizedStringWithKey:", CFSTR("FORGOT_PASSWORD_ALERT_MESSAGE"));
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("FORGOT_PASSWORD_ALERT_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "deviceSpecificLocalizedStringWithKey:", v4);
      v2 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v1, "deviceSpecificLocalizedStringWithKey:", CFSTR("FORGOT_PASSWORD_ALERT_MESSAGE"));
      v2 = objc_claimAutoreleasedReturnValue();
    }

  }
  v5 = (void *)MEMORY[0x1E0CEA2E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"), v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FORGOT_PASSWORD_ALERT_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v2, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FORGOT_PASSWORD_ALERT_CANCEL_BUTTON"), &stru_1E7679C68, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_2;
  v24[3] = &unk_1E7678D70;
  v25 = *(id *)(a1 + 40);
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13);

  v14 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FORGOT_PASSWORD_ALERT_RESET_BUTTON"), &stru_1E7679C68, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_126;
  v22[3] = &unk_1E7678D70;
  v23 = *(id *)(a1 + 40);
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v17);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(WeakRetained, "presentingViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentViewController:animated:completion:", v8, 1, 0);

}

void __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_2_cold_1();

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v3 + 16))(v3, 0, 0, 0, v4);

}

void __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_126(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_126_cold_1();

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7017);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v3 + 16))(v3, 0, 0, 0, v4);

}

- (id)_actionsForLoginWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_opt_new();
  v6 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke;
  v25[3] = &unk_1E7679630;
  objc_copyWeak(&v27, &location);
  v7 = v4;
  v26 = v7;
  objc_msgSend(v5, "setAuthenticateAction:", v25);
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_129;
  v22[3] = &unk_1E7679658;
  objc_copyWeak(&v24, &location);
  v8 = v7;
  v23 = v8;
  objc_msgSend(v5, "setAk_cancelAction:", v22);
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_2;
  v19[3] = &unk_1E7679658;
  objc_copyWeak(&v21, &location);
  v9 = v8;
  v20 = v9;
  objc_msgSend(v5, "setCreateIDAction:", v19);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_2_132;
  v16[3] = &unk_1E7679658;
  objc_copyWeak(&v18, &location);
  v10 = v9;
  v17 = v10;
  objc_msgSend(v5, "setUseIDAction:", v16);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_2_134;
  v13[3] = &unk_1E7679680;
  objc_copyWeak(&v15, &location);
  v11 = v10;
  v14 = v11;
  objc_msgSend(v5, "setForgotPasswordAction:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v5;
}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BD795000, v7, OS_LOG_TYPE_DEFAULT, "User is trying to sign in!", v10, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_startAnimating");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_129(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User canceled!", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_130;
  v4[3] = &unk_1E76794C8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "cleanUpBasicLoginWithCompletion:", v4);

}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_130(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, 0, v2);

}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User is creating an AppleID!", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_131;
  v4[3] = &unk_1E76794C8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "cleanUpBasicLoginWithCompletion:", v4);

}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_131(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7016);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, 0, v2);

}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_2_132(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD v4[5];
  id v5;
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User is using an AppleID!", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_133;
  v4[3] = &unk_1E7678CF0;
  v4[4] = WeakRetained;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "cleanUpBasicLoginWithCompletion:", v4);

}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_133(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldAllowAppleIDCreation:", 0);
  objc_msgSend(v8, "username");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(v8, "username"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        v3,
        v5))
  {
    v6 = v8;
    v7 = 0;
  }
  else
  {
    v6 = v8;
    v7 = 1;
  }
  objc_msgSend(v6, "setIsUsernameEditable:", v7);
  objc_msgSend(*(id *)(a1 + 32), "presentBasicLoginUIWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_2_134(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User forgot the password!", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_135;
  v4[3] = &unk_1E76794C8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "cleanUpBasicLoginWithCompletion:", v4);

}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_135(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7017);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, 0, v2);

}

- (void)_startAnimating
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[AKInAppAuthenticationRemoteUIProvider _shouldShowAsView](self, "_shouldShowAsView");
  v4 = 8;
  if (v3)
    v4 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "startAnimating");
}

- (id)_secondFactorActionsForAlert:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__AKInAppAuthenticationRemoteUIProvider__secondFactorActionsForAlert_completion___block_invoke;
  v19[3] = &unk_1E76794C8;
  v9 = v6;
  v20 = v9;
  objc_msgSend(v7, "setAk_cancelAction:", v19);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __81__AKInAppAuthenticationRemoteUIProvider__secondFactorActionsForAlert_completion___block_invoke_138;
  v17[3] = &unk_1E76794C8;
  v10 = v9;
  v18 = v10;
  objc_msgSend(v7, "setRegenerateCodeAction:", v17);
  objc_initWeak(&location, v5);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __81__AKInAppAuthenticationRemoteUIProvider__secondFactorActionsForAlert_completion___block_invoke_139;
  v13[3] = &unk_1E7679680;
  objc_copyWeak(&v15, &location);
  v11 = v10;
  v14 = v11;
  objc_msgSend(v7, "setCodeEnteredAction:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v7;
}

void __81__AKInAppAuthenticationRemoteUIProvider__secondFactorActionsForAlert_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User canceled second-factor entry!", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

void __81__AKInAppAuthenticationRemoteUIProvider__secondFactorActionsForAlert_completion___block_invoke_138(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "User says they did not get a code.", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7035);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

void __81__AKInAppAuthenticationRemoteUIProvider__secondFactorActionsForAlert_completion___block_invoke_139(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "User entered code %@.", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setPasscodeFieldDisabled:", 1);
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "integerValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

}

- (void)_updateReason
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  objc_msgSend(v16, "username");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v16, "isUsernameEditable");

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isMultiUserMode");

      if (v8)
      {
        objc_msgSend(v16, "serviceType");
        AKSharedDevicePasscodePromptAlertMessageWithServiceType();
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setReason:", v3);
      }
      else
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DEFAULT_PLACEHOLDER_AUTHENTICATION_REASON"), &stru_1E7679C68, CFSTR("Localizable"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0D002B8];
        WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        objc_msgSend(WeakRetained, "username");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "formattedUsernameFromUsername:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", v10, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setReason:", v15);

      }
LABEL_2:

    }
  }

}

- (BOOL)_shouldUsePasswordDelegate
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v2, "_password");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v2, "_passwordDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6 != 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_showPasswordFieldWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__AKInAppAuthenticationRemoteUIProvider__showPasswordFieldWithCompletion___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __74__AKInAppAuthenticationRemoteUIProvider__showPasswordFieldWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to show password field.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "_shouldShowAsView");
  objc_msgSend(*(id *)(a1 + 32), "_actionsForLoginWithCompletion:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 8;
  if (v4)
    v6 = 16;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v6), "setLoginActions:", v5);

  objc_msgSend(v3, "_passwordDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__AKInAppAuthenticationRemoteUIProvider__showPasswordFieldWithCompletion___block_invoke_143;
  v9[3] = &unk_1E7679478;
  v8 = *(id *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v7, "context:needsPasswordWithCompletion:", v3, v9);

}

void __74__AKInAppAuthenticationRemoteUIProvider__showPasswordFieldWithCompletion___block_invoke_143(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "context");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, _QWORD, id))(v4 + 16))(v4, v8, v7, 0, v6);

}

- (void)presentBasicLoginUIAsAlertWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AKBasicLoginAlertController *basicLoginAlertController;
  NSObject *v8;
  _BOOL4 v9;
  AKBasicLoginAlertController *v10;
  AKBasicLoginAlertController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  AKBasicLoginAlertController *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint8_t v27[16];
  uint8_t buf[16];
  uint8_t v29[16];

  v4 = a3;
  -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  basicLoginAlertController = self->_basicLoginAlertController;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (basicLoginAlertController)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v8, OS_LOG_TYPE_DEFAULT, "Basic login UI is already on screen.", buf, 2u);
    }
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1BD795000, v8, OS_LOG_TYPE_DEFAULT, "Creating new basic login UI instance as alert.", v29, 2u);
    }

    v10 = -[AKBasicLoginAlertController initWithNibName:bundle:]([AKBasicLoginAlertController alloc], "initWithNibName:bundle:", 0, 0);
    v11 = self->_basicLoginAlertController;
    self->_basicLoginAlertController = v10;

    objc_msgSend(v5, "defaultButtonString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[AKBasicLoginAlertController setAuthenticateButtonTitle:](self->_basicLoginAlertController, "setAuthenticateButtonTitle:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SIGN_IN"), &stru_1E7679C68, CFSTR("Localizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKBasicLoginAlertController setAuthenticateButtonTitle:](self->_basicLoginAlertController, "setAuthenticateButtonTitle:", v14);

    }
    objc_msgSend(v5, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginAlertController setAuthenticateTitle:](self->_basicLoginAlertController, "setAuthenticateTitle:", v15);

    -[AKBasicLoginAlertController setDelegate:](self->_basicLoginAlertController, "setDelegate:", self);
    objc_msgSend(v5, "username");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginAlertController setUsername:](self->_basicLoginAlertController, "setUsername:", v16);

    if ((objc_msgSend(v5, "isUsernameEditable") & 1) == 0 && (objc_msgSend(v5, "shouldAllowAppleIDCreation") & 1) == 0)
    {
      -[AKBasicLoginAlertController setAlertStyle:](self->_basicLoginAlertController, "setAlertStyle:", 1);
      WeakRetained = objc_loadWeakRetained((id *)&self->_context);
      objc_msgSend(WeakRetained, "username");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("username must not be nil for pre-filled alert style"));
    }
    -[AKInAppAuthenticationRemoteUIProvider _updateReason](self, "_updateReason");
    if (objc_msgSend(v5, "shouldAllowAppleIDCreation"))
      -[AKBasicLoginAlertController setAlertStyle:](self->_basicLoginAlertController, "setAlertStyle:", 2);
    v19 = self->_basicLoginAlertController;
    objc_msgSend(v5, "_interpolatedReasonWithBlame");
    v8 = objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginAlertController setReason:](v19, "setReason:", v8);
  }

  -[AKInAppAuthenticationRemoteUIProvider _actionsForLoginWithCompletion:](self, "_actionsForLoginWithCompletion:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKBasicLoginAlertController setLoginActions:](self->_basicLoginAlertController, "setLoginActions:", v20);
  if (!basicLoginAlertController)
  {
    objc_msgSend(v6, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "transitionCoordinator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22
      || (objc_msgSend(v6, "view"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v24, "superview"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v25,
          v24,
          !v25))
    {
      _AKLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[AKInAppAuthenticationRemoteUIProvider presentBasicLoginUIAsAlertWithCompletion:].cold.1();

    }
    _AKLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1BD795000, v26, OS_LOG_TYPE_DEFAULT, "Presenting basic login instance as alert...", v27, 2u);
    }

    objc_msgSend(v6, "presentViewController:animated:completion:", self->_basicLoginAlertController, 1, 0);
  }

}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 waitForInteraction:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke;
  v20[3] = &unk_1E76796F8;
  v20[4] = self;
  v21 = v12;
  v23 = v14;
  v24 = v15;
  v22 = v13;
  v25 = a6;
  v16 = v14;
  v17 = v13;
  v18 = v15;
  v19 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

}

void __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  NSObject *v12;
  int v13;
  id *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  char v27;
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "akd says there was an issue with the login. Will display alert.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0CFFF10]))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "code");

    if (v6 == -7028)
    {
      objc_msgSend(*(id *)(a1 + 32), "_showMaxAttemptAlertWithCompletion:", *(_QWORD *)(a1 + 64));
      goto LABEL_18;
    }
  }
  else
  {

  }
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_147;
  v19 = &unk_1E76796D0;
  v20 = *(id *)(a1 + 48);
  v21 = *(id *)(a1 + 56);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  v22 = v8;
  v23 = v9;
  v26 = *(id *)(a1 + 64);
  v27 = *(_BYTE *)(a1 + 72);
  v24 = *(id *)(a1 + 40);
  v25 = v4;
  v10 = (void (**)(_QWORD))MEMORY[0x1C3B760D8](&v16);
  objc_msgSend(v3, "alertDelegate", v16, v17, v18, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    _AKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_cold_1();

    objc_msgSend(v11, "displayAlertForContext:error:completion:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  }
  else if (v8)
  {
    v13 = objc_msgSend(*(id *)(a1 + 40), "ak_isAuthenticationErrorWithCode:", -7006);
    v14 = *(id **)(a1 + 32);
    if (v13)
    {
      objc_msgSend(v14[1], "stopAnimating");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "jiggleAView");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clearPasswordField");
      objc_msgSend(*(id *)(a1 + 32), "_actionsForLoginWithCompletion:", *(_QWORD *)(a1 + 64));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setLoginActions:", v15);

    }
    else
    {
      objc_msgSend(v14, "cleanUpBasicLoginWithCompletion:", v10);
    }
  }
  else
  {
    v10[2](v10);
    if (!*(_BYTE *)(a1 + 72))
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

LABEL_18:
}

void __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_147(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  char v15;
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "Displaying login alert...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E7679C68, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_150;
  v10[3] = &unk_1E76796A8;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v11 = v7;
  v12 = v8;
  v14 = *(id *)(a1 + 80);
  v15 = *(_BYTE *)(a1 + 88);
  v13 = *(id *)(a1 + 64);
  objc_msgSend(v4, "actionWithTitle:style:handler:", v6, 1, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v9);

  objc_msgSend(*(id *)(a1 + 72), "presentViewController:animated:completion:", v3, 1, 0);
}

void __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_150(uint64_t a1)
{
  NSObject *v2;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_150_cold_1();

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "presentBasicLoginUIWithCompletion:", *(_QWORD *)(a1 + 56));
  }
  else if (*(_BYTE *)(a1 + 64))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)presentBasicLoginUIAsViewWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t *p_basicLoginViewController;
  AKBasicLoginViewController *basicLoginViewController;
  NSObject *v9;
  _BOOL4 v10;
  AKBasicLoginViewController *v11;
  AKBasicLoginViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_basicLoginViewController = (uint64_t *)&self->_basicLoginViewController;
  basicLoginViewController = self->_basicLoginViewController;
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (basicLoginViewController)
  {
    if (v10)
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1BD795000, v9, OS_LOG_TYPE_DEFAULT, "Basic login UI is already on screen.", (uint8_t *)&v27, 2u);
    }

  }
  else
  {
    if (v10)
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1BD795000, v9, OS_LOG_TYPE_DEFAULT, "Creating new basic login UI instance as view.", (uint8_t *)&v27, 2u);
    }

    v11 = -[AKBasicLoginViewController initWithContext:]([AKBasicLoginViewController alloc], "initWithContext:", v5);
    v12 = self->_basicLoginViewController;
    self->_basicLoginViewController = v11;

    objc_msgSend(v5, "_setPasswordDelegate:", self->_basicLoginViewController);
    -[AKBasicLoginViewController setDelegate:](self->_basicLoginViewController, "setDelegate:", self);
    -[AKInAppAuthenticationRemoteUIProvider _updateReason](self, "_updateReason");
  }
  -[AKInAppAuthenticationRemoteUIProvider _actionsForLoginWithCompletion:](self, "_actionsForLoginWithCompletion:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKBasicLoginViewController setLoginActions:](self->_basicLoginViewController, "setLoginActions:", v13);
  if (basicLoginViewController)
  {
    v14 = v6;
  }
  else
  {
    objc_msgSend(v6, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transitionCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_11;
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    objc_msgSend(WeakRetained, "presentingViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
LABEL_11:
      _AKLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[AKInAppAuthenticationRemoteUIProvider presentBasicLoginUIAsAlertWithCompletion:].cold.1();

    }
    _AKLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1BD795000, v22, OS_LOG_TYPE_DEFAULT, "Presenting basic login instance as view...", (uint8_t *)&v27, 2u);
    }

    objc_msgSend(v6, "ak_topPresentedViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      _AKLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[AKInAppAuthenticationRemoteUIProvider presentBasicLoginUIAsViewWithCompletion:].cold.1(p_basicLoginViewController, (uint64_t)v14, v23);

      objc_msgSend(v14, "pushViewController:animated:", *p_basicLoginViewController, 1);
    }
    else
    {
      -[AKInAppAuthenticationRemoteUIProvider _navController](self, "_navController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _AKLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v26 = *p_basicLoginViewController;
        v27 = 138412802;
        v28 = v26;
        v29 = 2112;
        v30 = v24;
        v31 = 2112;
        v32 = v14;
        _os_log_debug_impl(&dword_1BD795000, v25, OS_LOG_TYPE_DEBUG, "Pushing %@ onto %@ and presenting on %@", (uint8_t *)&v27, 0x20u);
      }

      objc_msgSend(v24, "pushViewController:animated:", *p_basicLoginViewController, 0);
      objc_msgSend(v14, "presentViewController:animated:completion:", v24, 1, &__block_literal_global_4);

    }
  }

}

- (void)presentLoginAlertUIAsViewWithError:(id)a3 title:(id)a4 message:(id)a5 waitForInteraction:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __120__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertUIAsViewWithError_title_message_waitForInteraction_completion___block_invoke;
  v20[3] = &unk_1E76796F8;
  v20[4] = self;
  v21 = v12;
  v23 = v14;
  v24 = v15;
  v22 = v13;
  v25 = a6;
  v16 = v14;
  v17 = v13;
  v18 = v15;
  v19 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

}

void __120__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertUIAsViewWithError_title_message_waitForInteraction_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t (*__ptr32 *v15)(int, int, id);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id WeakRetained;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  id v34;
  char v35;
  _QWORD v36[4];
  id v37;
  id v38;
  char v39;
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "akd says there was an issue with the login. Will display alert.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0CFFF10]))
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "code");

    if (v5 == -7028)
    {
      objc_msgSend(*(id *)(a1 + 32), "_showMaxAttemptAlertWithCompletion:", *(_QWORD *)(a1 + 64));
      goto LABEL_21;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "alertDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_cold_1();

    objc_msgSend(v6, "displayAlertForContext:error:completion:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v9, OS_LOG_TYPE_DEFAULT, "Displaying login alert...", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E7679C68, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(*(id *)(a1 + 40), "ak_isAuthenticationErrorWithCode:", -7094);
    v14 = MEMORY[0x1E0C809B0];
    v15 = &off_1BD7FA000;
    if (v13)
    {
      v16 = (void *)MEMORY[0x1E0CEA2E0];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1E7679C68, CFSTR("Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __120__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertUIAsViewWithError_title_message_waitForInteraction_completion___block_invoke_156;
      v36[3] = &unk_1E7679720;
      v39 = *(_BYTE *)(a1 + 72);
      v38 = *(id *)(a1 + 64);
      v37 = *(id *)(a1 + 40);
      objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, v36);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addAction:", v19);
      objc_msgSend(v10, "setPreferredAction:", v19);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E7679C68, CFSTR("Localizable"));
      v21 = objc_claimAutoreleasedReturnValue();

      v15 = &off_1BD7FA000;
      v14 = MEMORY[0x1E0C809B0];
      v12 = (void *)v21;
    }
    v22 = (void *)MEMORY[0x1E0CEA2E0];
    v29 = v14;
    v30 = *((_QWORD *)v15 + 136);
    v31 = __120__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertUIAsViewWithError_title_message_waitForInteraction_completion___block_invoke_161;
    v32 = &unk_1E7679720;
    v35 = *(_BYTE *)(a1 + 72);
    v34 = *(id *)(a1 + 64);
    v33 = *(id *)(a1 + 40);
    objc_msgSend(v22, "actionWithTitle:style:handler:", v12, 1, &v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v23, v29, v30, v31, v32);

    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(v24 + 16);
    if (v25)
    {
      objc_msgSend(v25, "stopAnimating");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clearPasswordField");
      objc_msgSend(*(id *)(a1 + 32), "_actionsForLoginWithCompletion:", *(_QWORD *)(a1 + 64));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setLoginActions:", v26);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "presentViewController:animated:completion:", v10, 1, 0);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(v24 + 112));
      objc_msgSend(WeakRetained, "presentingViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "presentViewController:animated:completion:", v10, 1, 0);

      if (!*(_BYTE *)(a1 + 72))
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
LABEL_21:

}

void __120__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertUIAsViewWithError_title_message_waitForInteraction_completion___block_invoke_156(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=ManagedConfigurationList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to redirect to device management landing page", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v2, 0);

  if (*(_BYTE *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __120__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertUIAsViewWithError_title_message_waitForInteraction_completion___block_invoke_161(uint64_t a1)
{
  NSObject *v2;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_150_cold_1();

  if (*(_BYTE *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AKInAppAuthenticationRemoteUIDelegate modalRemoteUINavController](self->_remoteUIControllerDelegate, "modalRemoteUINavController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKInAppAuthenticationRemoteUIDelegate modalRemoteUINavController](self->_remoteUIControllerDelegate, "modalRemoteUINavController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AKInAppAuthenticationRemoteUIProvider context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)proximitySetupCompletedWithResult:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id WeakRetained;
  char v12;
  AKProximityAuthViewController **p_proximityAuthViewController;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  _QWORD v23[5];
  id v24;

  v4 = a3;
  -[AKInAppAuthenticationRemoteUIProvider _enableIdleTimerIfNeeded](self, "_enableIdleTimerIfNeeded");
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AKInAppAuthenticationRemoteUIProvider proximitySetupCompletedWithResult:].cold.2(v4, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[AKInAppAuthenticationRemoteUIProvider proximitySetupCompletedWithResult:].cold.1(v4, v7);
  }

  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __75__AKInAppAuthenticationRemoteUIProvider_proximitySetupCompletedWithResult___block_invoke;
  v23[3] = &unk_1E7679748;
  v23[4] = self;
  v9 = v4;
  v24 = v9;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3B760D8](v23);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v12 = objc_msgSend(WeakRetained, "_shouldBroadcastForProximityAuthOnly");

  p_proximityAuthViewController = &self->_proximityAuthViewController;
  if ((v12 & 1) != 0)
  {
    objc_storeWeak((id *)p_proximityAuthViewController, 0);
    objc_msgSend(v9, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "code");

    if (v16 == -7003)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFFF20], -13004, 0);
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v17;
    }
    objc_msgSend(v9, "authResults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v10)[2](v10, v18, v14);

  }
  else
  {
    v19 = objc_loadWeakRetained((id *)p_proximityAuthViewController);
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __75__AKInAppAuthenticationRemoteUIProvider_proximitySetupCompletedWithResult___block_invoke_2;
    v20[3] = &unk_1E76794A0;
    v20[4] = self;
    v22 = v10;
    v21 = v9;
    objc_msgSend(v19, "dismissViewControllerAnimated:completion:", 0, v20);

  }
}

void __75__AKInAppAuthenticationRemoteUIProvider_proximitySetupCompletedWithResult___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 48);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "authResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "authResults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v7, v13);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), v13);
    }

    v4 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v4 + 48);
  }
  else
  {
    v8 = 0;
  }
  *(_QWORD *)(v4 + 48) = 0;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 56);
  *(_QWORD *)(v9 + 56) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

}

void __75__AKInAppAuthenticationRemoteUIProvider_proximitySetupCompletedWithResult___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 104), 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__AKInAppAuthenticationRemoteUIProvider_proximitySetupCompletedWithResult___block_invoke_3;
    v9[3] = &unk_1E76794A0;
    v9[4] = v4;
    v11 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, v9);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "authResults");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v7);

  }
}

void __75__AKInAppAuthenticationRemoteUIProvider_proximitySetupCompletedWithResult___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "authResults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v6, v5);

}

- (void)setupPasscodeAndBiometricWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)setupPerformAIDASignInWith:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_proxAuthResults, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (objc_msgSend(WeakRetained, "_shouldBroadcastForProximityAuthOnly")
    && (objc_msgSend(WeakRetained, "proximityAIDAHandler"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    objc_msgSend(WeakRetained, "proximityAIDAHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__AKInAppAuthenticationRemoteUIProvider_setupPerformAIDASignInWith_completion___block_invoke;
    v14[3] = &unk_1E76794C8;
    v15 = v8;
    ((void (**)(_QWORD, id, _QWORD *))v11)[2](v11, v7, v14);

  }
  else
  {
    if (objc_msgSend(WeakRetained, "_shouldBroadcastForProximityAuthOnly"))
    {
      v12 = v8;
      v13 = 0;
    }
    else
    {
      v12 = v8;
      v13 = 1;
    }
    (*((void (**)(id, uint64_t))v8 + 2))(v12, v13);
  }

}

uint64_t __79__AKInAppAuthenticationRemoteUIProvider_setupPerformAIDASignInWith_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)proximitySetupSelectedAccount:(int64_t)a3 completion:(id)a4
{
  (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
}

- (RemoteUIControllerPreferences)ruiPreferences
{
  return self->_ruiPreferences;
}

- (void)setRuiPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_ruiPreferences, a3);
}

- (void)setRemoteUIController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUIController, a3);
}

- (AKInAppAuthenticationRemoteUIDelegate)remoteUIControllerDelegate
{
  return self->_remoteUIControllerDelegate;
}

- (AKProximityAuthViewController)proximityAuthViewController
{
  return (AKProximityAuthViewController *)objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
}

- (void)setProximityAuthViewController:(id)a3
{
  objc_storeWeak((id *)&self->_proximityAuthViewController, a3);
}

- (AKAppleIDAuthenticationInAppContext)context
{
  return (AKAppleIDAuthenticationInAppContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_proximityAuthViewController);
  objc_storeStrong((id *)&self->_remoteUIControllerDelegate, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_ruiPreferences, 0);
  objc_storeStrong((id *)&self->_proxSetupError, 0);
  objc_storeStrong((id *)&self->_proxAuthResults, 0);
  objc_storeStrong(&self->_proxAuthCompletion, 0);
  objc_storeStrong((id *)&self->_pasViewPresenter, 0);
  objc_storeStrong((id *)&self->_webAuthenticationSession, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_basicLoginViewController, 0);
  objc_storeStrong((id *)&self->_basicLoginAlertController, 0);
}

- (void)presentProximityBroadcastUIWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1BD795000, v0, v1, "Proximity Authentication login UI is already on screen.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)presentProximityPinCodeUIWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1BD795000, v0, v1, "Attempting to show prox PIN code, but there is no prox view.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)activateProximitySession:(uint64_t)a3 completion:.cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_4(&dword_1BD795000, a2, a3, "Setting 'shouldSignInForSelf=YES' for PAS view presenter (%@)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

- (void)activateProximitySession:(uint64_t)a3 completion:.cold.2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_1(&dword_1BD795000, a2, a3, "PAS view presenter (%@) does not respond to 'shouldSignInForSelf' selector", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

- (void)activateProximitySession:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1BD795000, v0, v1, "Missing navigation controller to initate set up for self...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_1BD795000, a2, a3, "IDP ASWebAuthenticationSession completed error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)dismissServerProvidedUIWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "We still have basic login UI in our nav stack. Ignoring dismiss request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)dismissServerProvidedUIWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Looks like the InApp UI has already been dismissed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)presentFidoAuthForContext:fidoContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Presenting Fido authentication flow in remote UI provider.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)remoteUIController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Proxying for another device, so attaching secondary Anisette controller to our URL session config.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "User canceled login error alert.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_126_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "User asked to reset password in response to login error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)presentBasicLoginUIAsAlertWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1BD795000, v0, v1, "Attempting to present basic login instance during animation or without a superview... dragons ahead...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Will skip showing login error alert.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_150_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "User dismissed login error alert.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)presentBasicLoginUIAsViewWithCompletion:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1BD795000, log, OS_LOG_TYPE_DEBUG, "Pushing %@ onto %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)proximitySetupCompletedWithResult:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "authResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_4(&dword_1BD795000, a2, v4, "Proximity Setup Completed with auth results: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_11();
}

- (void)proximitySetupCompletedWithResult:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_1(&dword_1BD795000, a2, v4, "Proximity Setup Completed with error: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_11();
}

@end
