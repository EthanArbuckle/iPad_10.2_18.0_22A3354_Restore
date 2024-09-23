@implementation FACircleStateController

- (FACircleStateController)initWithRequestConfigurator:(id)a3 presenter:(id)a4 circlePresenterFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  FACircleStateController *v12;
  FACircleStateController *v13;
  void *v14;
  id circlePresenterFactory;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)FACircleStateController;
  v12 = -[FACircleStateController init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestConfigurator, a3);
    objc_storeWeak((id *)&v13->_presenter, v10);
    v14 = _Block_copy(v11);
    circlePresenterFactory = v13->_circlePresenterFactory;
    v13->_circlePresenterFactory = v14;

    v13->_isCanceled = 0;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceIdiom");

    v18 = 2;
    if (v17 != 1)
      v18 = -2;
    v13->_modalPresentationStyle = v18;
  }

  return v13;
}

- (void)cancel
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;

  -[FACircleStateController setIsCanceled:](self, "setIsCanceled:", 1);
  -[FACircleStateController circlePresenter](self, "circlePresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[FACircleStateController setCirclePresenter:](self, "setCirclePresenter:", 0);
  -[FACircleStateController completion](self, "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fa_familyErrorWithCode:", -1018);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[FACircleStateController completion](self, "completion");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30A38]), "initWithLoadSuccess:error:userInfo:", 0, v7, 0);
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

    -[FACircleStateController setCompletion:](self, "setCompletion:", 0);
  }
}

- (FACircleStateController)init
{
  id v3;
  FACircleStateController *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE30AE0]);
  v4 = -[FACircleStateController initWithRequestConfigurator:presenter:circlePresenterFactory:](self, "initWithRequestConfigurator:presenter:circlePresenterFactory:", v3, 0, &__block_literal_global_9);

  return v4;
}

FACirclePresenter *__31__FACircleStateController_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  FACirclePresenter *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[FACirclePresenter initWithPresenter:context:]([FACirclePresenter alloc], "initWithPresenter:context:", v5, v4);

  return v6;
}

- (FACircleStateController)initWithPresenter:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  FACircleStateController *v7;

  v4 = (objc_class *)MEMORY[0x24BE30AE0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = -[FACircleStateController initWithRequestConfigurator:presenter:circlePresenterFactory:](self, "initWithRequestConfigurator:presenter:circlePresenterFactory:", v6, v5, &__block_literal_global_16);

  return v7;
}

FACirclePresenter *__45__FACircleStateController_initWithPresenter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  FACirclePresenter *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[FACirclePresenter initWithPresenter:context:]([FACirclePresenter alloc], "initWithPresenter:context:", v5, v4);

  return v6;
}

- (void)performOperationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__FACircleStateController_performOperationWithContext_completion___block_invoke;
  v8[3] = &unk_24C88BD68;
  v9 = v6;
  v7 = v6;
  -[FACircleStateController performWithContext:completion:](self, "performWithContext:completion:", a3, v8);

}

void __66__FACircleStateController_performOperationWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    v4 = objc_msgSend(v3, "loadSuccess");
    objc_msgSend(v3, "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
  }
}

- (void)performWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD aBlock[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v20 = v6;
    _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "Performing operation with context: %{private}@", buf, 0xCu);
  }

  -[FACircleStateController setCompletion:](self, "setCompletion:", v7);
  objc_initWeak((id *)buf, self);
  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__FACircleStateController_performWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C88C660;
  objc_copyWeak(&v18, (id *)buf);
  v10 = _Block_copy(aBlock);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __57__FACircleStateController_performWithContext_completion___block_invoke_2;
  v13[3] = &unk_24C88C700;
  objc_copyWeak(&v16, (id *)buf);
  v11 = v6;
  v14 = v11;
  v12 = v10;
  v15 = v12;
  -[FACircleStateController _ensurePresenterWithCompletion:](self, "_ensurePresenterWithCompletion:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __57__FACircleStateController_performWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(WeakRetained, "completion");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
  objc_msgSend(WeakRetained, "setCompletion:", 0);

}

void __57__FACircleStateController_performWithContext_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD aBlock[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!v5)
  {
    _FALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "No presenter provided", buf, 2u);
    }

  }
  if ((objc_msgSend(a1[4], "isPlatformSupported") & 1) != 0)
  {
    v9 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__FACircleStateController_performWithContext_completion___block_invoke_18;
    aBlock[3] = &unk_24C88C6B0;
    objc_copyWeak(&v23, a1 + 6);
    v20 = a1[4];
    v10 = v5;
    v21 = v10;
    v22 = a1[5];
    v11 = _Block_copy(aBlock);
    if (objc_msgSend(WeakRetained, "_contextRequiresRemoteService:", a1[4]))
    {
      if (objc_msgSend(WeakRetained, "_processRequiresSpringBoardServices"))
      {
        _FALogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DE41000, v12, OS_LOG_TYPE_DEFAULT, "Presenting flow using springboard...", buf, 2u);
        }

        objc_msgSend(WeakRetained, "_presentFlowUsingSpringBoardWithContext:completion:", a1[4], a1[5]);
      }
      else
      {
        _FALogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DE41000, v15, OS_LOG_TYPE_DEFAULT, "Presenting flow using UIRemoteViewController...", buf, 2u);
        }

        objc_msgSend(WeakRetained, "_presentViewServiceWithContext:viewController:completion:", a1[4], v10, a1[5]);
      }
    }
    else
    {
      _FALogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __57__FACircleStateController_performWithContext_completion___block_invoke_2_cold_1(v13);

      v14 = a1[4];
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __57__FACircleStateController_performWithContext_completion___block_invoke_21;
      v16[3] = &unk_24C88C6D8;
      v17 = v11;
      v18 = a1[5];
      objc_msgSend(WeakRetained, "_performOperationWithContext:viewController:completion:", v14, v10, v16);

    }
    objc_destroyWeak(&v23);
  }
  else
  {
    objc_msgSend(WeakRetained, "_presentPlatformUnsupportedAlertWithCompletion:", a1[5]);
  }

}

void __57__FACircleStateController_performWithContext_completion___block_invoke_18(id *a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  uint8_t buf[16];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "Renewing credentials and trying operation one more time...", buf, 2u);
  }

  objc_msgSend(WeakRetained, "requestConfigurator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__FACircleStateController_performWithContext_completion___block_invoke_19;
  v10[3] = &unk_24C88C688;
  objc_copyWeak(&v15, a1 + 7);
  v11 = a1[4];
  v12 = a1[5];
  v14 = a1[6];
  v16 = a2;
  v9 = v5;
  v13 = v9;
  objc_msgSend(v8, "renewCredentialsWithCompletion:", v10);

  objc_destroyWeak(&v15);
}

void __57__FACircleStateController_performWithContext_completion___block_invoke_19(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v6 = WeakRetained;
  if (a2)
  {
    objc_msgSend(WeakRetained, "_performOperationWithContext:viewController:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30A38]), "initWithLoadSuccess:error:userInfo:", *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __57__FACircleStateController_performWithContext_completion___block_invoke_21(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE30908]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE30900]) || objc_msgSend(v3, "code") != -1002)
  {

    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "statusCode");

  if (v7 != 401)
  {
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_7;
  }
  (*(void (**)(_QWORD, uint64_t, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v8, "loadSuccess"), v3);
LABEL_7:

}

- (void)_presentPlatformUnsupportedAlertWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  -[FACircleStateController presenter](self, "presenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FEATURE_NOT_SUPPORTED_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FEATURE_NOT_SUPPORTED_DESCRIPTION"), &stru_24C8A3000, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageNamed:inBundle:", CFSTR("family"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setImage:", v13);
  v14 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C8A3000, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __74__FACircleStateController__presentPlatformUnsupportedAlertWithCompletion___block_invoke;
  v20[3] = &unk_24C88C580;
  v21 = v4;
  v17 = v4;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v18);

  objc_msgSend(v19, "presentViewController:animated:completion:", v10, 1, 0);
}

void __74__FACircleStateController__presentPlatformUnsupportedAlertWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1540], "fa_familyErrorWithCode:", -1003);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30A38]), "initWithLoadSuccess:error:userInfo:", 0, v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_ensurePresenterWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, _QWORD);

  v6 = (void (**)(id, void *, _QWORD))a3;
  -[FACircleStateController presenter](self, "presenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6[2](v6, v4, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE30900], -1000, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v5);

  }
}

- (void)setPresenter:(id)a3
{
  UIViewController **p_presenter;
  id v5;

  p_presenter = &self->_presenter;
  v5 = a3;
  objc_storeWeak((id *)p_presenter, v5);
  -[FACirclePresenter setPresenter:](self->_circlePresenter, "setPresenter:", v5);

}

- (BOOL)_contextRequiresRemoteService:(id)a3
{
  id v4;
  NSObject *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  int v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16 = -[FACircleStateController presentationType](self, "presentationType");
    _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "presentationtype: %lu", (uint8_t *)&v15, 0xCu);
  }

  if (-[FACircleStateController presentationType](self, "presentationType") == 1)
  {
    v6 = 0;
  }
  else if (-[FACircleStateController presentationType](self, "presentationType") == 2)
  {
    v6 = 1;
  }
  else
  {
    -[FACircleStateController _whitelistedInProcessClients](self, "_whitelistedInProcessClients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsObject:", v9);

    _FALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        objc_msgSend(v4, "clientBundleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = (unint64_t)v13;
        _os_log_impl(&dword_20DE41000, v11, OS_LOG_TYPE_DEFAULT, "%@ is allowed in process UI", (uint8_t *)&v15, 0xCu);

      }
    }
    else if (v12)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_20DE41000, v11, OS_LOG_TYPE_DEFAULT, "Context requires remote service", (uint8_t *)&v15, 2u);
    }
    v6 = v10 ^ 1;

  }
  return v6;
}

- (id)_whitelistedInProcessClients
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.preferences"), CFSTR("com.apple.bridge"), 0);
}

- (BOOL)_processRequiresSpringBoardServices
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuspended");

  return v3;
}

- (void)_presentFlowUsingSpringBoardWithContext:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v12 = CFSTR("FARemoteAlertServiceUserInfoContextData");
  objc_msgSend(a3, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BE30AB8]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__FACircleStateController__presentFlowUsingSpringBoardWithContext_completion___block_invoke;
  v10[3] = &unk_24C88BD68;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "launchOutOfProcessUIWithOptions:completion:", v7, v10);

}

void __78__FACircleStateController__presentFlowUsingSpringBoardWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__FACircleStateController__presentFlowUsingSpringBoardWithContext_completion___block_invoke_2;
  v6[3] = &unk_24C88BEF0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __78__FACircleStateController__presentFlowUsingSpringBoardWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_presentViewServiceWithContext:(id)a3 viewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t modalPresentationStyle;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  modalPresentationStyle = self->_modalPresentationStyle;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __84__FACircleStateController__presentViewServiceWithContext_viewController_completion___block_invoke;
  v16[3] = &unk_24C88C728;
  v19 = v10;
  v20 = modalPresentationStyle;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  v15 = +[FARemoteViewController requestViewControllerWithCompletion:](FARemoteViewController, "requestViewControllerWithCompletion:", v16);

}

void __84__FACircleStateController__presentViewServiceWithContext_viewController_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v8, "setModalPresentationStyle:", a1[8]);
  if (v5)
  {
    v6 = a1[7];
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30A38]), "initWithLoadSuccess:error:userInfo:", 0, v5, 0);
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
  }
  else
  {
    objc_msgSend(v8, "setDelegate:", a1[4]);
    objc_msgSend(v8, "startFlowWithContext:viewController:completion:", a1[5], a1[6], a1[7]);
  }

}

- (void)_performOperationWithContext:(id)a3 viewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  FACircleStateController *v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[FACircleStateController requestConfigurator](self, "requestConfigurator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke;
  v14[3] = &unk_24C88C778;
  objc_copyWeak(&v18, &location);
  v12 = v8;
  v15 = v12;
  v13 = v10;
  v16 = self;
  v17 = v13;
  objc_msgSend(v11, "requestForContext:withCompletion:", v12, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (!v5)
  {
    _FALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke_cold_1(a1, v12);

    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BE30900];
    v11 = -1001;
    goto LABEL_7;
  }
  if (objc_msgSend(WeakRetained, "isCanceled"))
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BE30900];
    v11 = -1018;
LABEL_7:
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 48);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30A38]), "initWithLoadSuccess:error:userInfo:", 0, v13, 0);
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

    goto LABEL_11;
  }
  objc_msgSend(v8, "circlePresenterFactory");
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v16)[2](v16, v17, *(_QWORD *)(a1 + 32));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCirclePresenter:", v18);

  objc_msgSend(v8, "customRUIStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v8, "circlePresenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "customRUIStyle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCustomRUIStyle:", v21);

  }
  v22 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "circlePresenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDelegate:", v22);

  objc_msgSend(v8, "circlePresenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke_52;
  v25[3] = &unk_24C88C750;
  objc_copyWeak(&v28, (id *)(a1 + 56));
  v26 = *(id *)(a1 + 32);
  v27 = *(id *)(a1 + 48);
  objc_msgSend(v24, "loadRequest:completion:", v5, v25);

  objc_destroyWeak(&v28);
LABEL_11:

}

void __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setCirclePresenter:", 0);
  v5 = objc_msgSend(v3, "loadSuccess");
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138477827;
      v10 = v8;
      _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "Successfully completed flow for context: %{private}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke_52_cold_1(a1, v3, v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_20DE41000, a2, OS_LOG_TYPE_DEBUG, "%@ deallocated", (uint8_t *)&v2, 0xCu);
}

- (void)remoteViewControllerDidStartFlow:(id)a3
{
  void (**presentationHandler)(void);

  presentationHandler = (void (**)(void))self->_presentationHandler;
  if (presentationHandler)
    presentationHandler[2]();
}

- (void)circlePresenterDidPresent:(id)a3
{
  void (**presentationHandler)(id, SEL, id);
  id v5;

  presentationHandler = (void (**)(id, SEL, id))self->_presentationHandler;
  if (presentationHandler)
  {
    presentationHandler[2](presentationHandler, a2, a3);
    v5 = self->_presentationHandler;
    self->_presentationHandler = 0;

  }
}

- (UIViewController)presenter
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (id)presentationHandler
{
  return self->_presentationHandler;
}

- (void)setPresentationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(unint64_t)a3
{
  self->_presentationType = a3;
}

- (RUIStyle)customRUIStyle
{
  return self->_customRUIStyle;
}

- (void)setCustomRUIStyle:(id)a3
{
  objc_storeStrong((id *)&self->_customRUIStyle, a3);
}

- (int64_t)modalPresentationStyle
{
  return self->_modalPresentationStyle;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  self->_modalPresentationStyle = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (FACirclePresenter)circlePresenter
{
  return self->_circlePresenter;
}

- (void)setCirclePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_circlePresenter, a3);
}

- (FARequestConfigurator)requestConfigurator
{
  return self->_requestConfigurator;
}

- (void)setRequestConfigurator:(id)a3
{
  objc_storeStrong((id *)&self->_requestConfigurator, a3);
}

- (id)circlePresenterFactory
{
  return self->_circlePresenterFactory;
}

- (void)setCirclePresenterFactory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_circlePresenterFactory, 0);
  objc_storeStrong((id *)&self->_requestConfigurator, 0);
  objc_storeStrong((id *)&self->_circlePresenter, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_customRUIStyle, 0);
  objc_storeStrong(&self->_presentationHandler, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

void __57__FACircleStateController_performWithContext_completion___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20DE41000, log, OS_LOG_TYPE_DEBUG, "Presenting flow in client process...", v1, 2u);
}

void __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "eventType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138477827;
  v5 = v3;
  _os_log_error_impl(&dword_20DE41000, a2, OS_LOG_TYPE_ERROR, "Failed to find URL for event type: %{private}@", (uint8_t *)&v4, 0xCu);

}

void __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke_52_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138478083;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_20DE41000, a3, OS_LOG_TYPE_ERROR, "Failed to complete flow for context: %{private}@, error: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
