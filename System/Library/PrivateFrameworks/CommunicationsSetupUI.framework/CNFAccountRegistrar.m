@implementation CNFAccountRegistrar

- (CNFAccountRegistrar)initWithServiceType:(int64_t)a3 presentationViewController:(id)a4
{
  id v6;
  CNFAccountRegistrar *v7;
  CNFAccountRegistrar *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CNFAccountRegistrar;
  v7 = -[CNFAccountRegistrar init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CNFAccountRegistrar setServiceType:](v7, "setServiceType:", a3);
    -[CNFAccountRegistrar setPresentationViewController:](v8, "setPresentationViewController:", v6);
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeListenerID:", CFSTR("CNFAccountRegistrar"));

  v5.receiver = self;
  v5.super_class = (Class)CNFAccountRegistrar;
  -[CNFAccountRegistrar dealloc](&v5, sel_dealloc);
}

- (void)_startTimer
{
  void *v3;
  void *v4;
  id v5;

  -[CNFAccountRegistrar _stopTimer](self, "_stopTimer");
  objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__registrationTimerFired_, 0, 0, 180.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFAccountRegistrar setRegistrationTimer:](self, "setRegistrationTimer:", v3);

  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFAccountRegistrar registrationTimer](self, "registrationTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTimer:forMode:", v4, *MEMORY[0x24BDBCA90]);

}

- (void)_stopTimer
{
  void *v3;

  -[CNFAccountRegistrar registrationTimer](self, "registrationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CNFAccountRegistrar setRegistrationTimer:](self, "setRegistrationTimer:", 0);
}

- (void)_configureAliasesForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a3;
  objc_msgSend(v3, "aliasesToRegister");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAliases:", v4);

  objc_msgSend(v3, "aliasesToRegister");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "validateAliases:", v5);

  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "supportsSMS"))
  {
    v7 = objc_msgSend(v3, "accountType");

    if (v7 == 1)
    {
      OSLogHandleForIDSCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Adding sentinel alias since this is an AppleID account", v9, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      objc_msgSend(v3, "addAlias:", *MEMORY[0x24BE4FEE0]);
    }
  }
  else
  {

  }
}

- (void)_continueRegisteringAuthenticatedAccount:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  CNFRegLocaleController *v9;
  void *v10;
  CNFRegLocaleController *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  id v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  CNFRegLocaleController *v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = (uint64_t)v4;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Continuing registration for authenticated account: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v21 = v4;
    IMLogString();
  }
  if (objc_msgSend(v4, "profileValidationStatus", v21) != 3)
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v4, "profileValidationStatus");
      *(_DWORD *)buf = 134217984;
      v27 = v8;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Profile is not validated. Current status: %ld", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v22 = objc_msgSend(v4, "profileValidationStatus");
      IMLogString();
    }
    -[CNFAccountRegistrar _stopTimer](self, "_stopTimer", v22);
    v9 = [CNFRegLocaleController alloc];
    +[CNFRegController controllerForServiceType:](CNFRegController, "controllerForServiceType:", -[CNFAccountRegistrar serviceType](self, "serviceType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CNFRegFirstRunController initWithRegController:account:](v9, "initWithRegController:account:", v10, v4);

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __64__CNFAccountRegistrar__continueRegisteringAuthenticatedAccount___block_invoke;
    v23[3] = &unk_24D075D38;
    v23[4] = self;
    v24 = v4;
    -[CNFRegLocaleController setCompletionBlock:](v11, "setCompletionBlock:", v23);
    OSLogHandleForIDSCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "Showing region chooser.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    v13 = objc_alloc_init(MEMORY[0x24BE75588]);
    -[CNFRegLocaleController setRootController:](v11, "setRootController:", v13);
    -[CNFRegLocaleController setParentController:](v11, "setParentController:", v13);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v11, sel_dismiss);
    -[CNFRegFirstRunController setCustomLeftButton:](v11, "setCustomLeftButton:", v14);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 3, 0, 0);
    -[CNFRegFirstRunController setCustomRightButton:](v11, "setCustomRightButton:", v15);
    v25 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setViewControllers:", v16);

    -[CNFAccountRegistrar presentationViewController](self, "presentationViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentedViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[CNFAccountRegistrar completionBlock](self, "completionBlock");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
LABEL_28:

        goto LABEL_29;
      }
      -[CNFAccountRegistrar completionBlock](self, "completionBlock");
      v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v20)[2](v20, 0, v13);
    }
    else
    {
      -[CNFAccountRegistrar presentationViewController](self, "presentationViewController");
      v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "presentModalViewController:withTransition:", v13, 3);
    }

    goto LABEL_28;
  }
  OSLogHandleForIDSCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Profile is validated. Continuing on with registration.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFAccountRegistrar _configureAliasesForAccount:](self, "_configureAliasesForAccount:", v4);
  objc_msgSend(v4, "registerAccount");
LABEL_29:

}

void __64__CNFAccountRegistrar__continueRegisteringAuthenticatedAccount___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Region chooser completed.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  if (a2)
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Success setting region. Continuing on with registration", v10, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog())
        IMLogString();
    }
    objc_msgSend(*(id *)(a1 + 32), "_startTimer");
    objc_msgSend(*(id *)(a1 + 32), "_configureAliasesForAccount:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "registerAccount");
  }
  else
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Failure setting region. Unregistering and calling out to completion block", v9, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(*(id *)(a1 + 32), "completionBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "unregisterAccount");
      objc_msgSend(*(id *)(a1 + 32), "completionBlock");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, 0);

    }
  }
}

- (void)continueRegistrationForAccount:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  OSLogHandleForIDSCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Continuing registration for account: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v11 = v6;
    IMLogString();
  }
  -[CNFAccountRegistrar setAccount:](self, "setAccount:", v6, v11);
  -[CNFAccountRegistrar setCompletionBlock:](self, "setCompletionBlock:", v7);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", self);
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__accountRegistrationStatusChanged_, *MEMORY[0x24BE500B8], 0);
  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateAccount:", v6);

  if (objc_msgSend(v6, "registrationStatus") > 1)
  {
    if (objc_msgSend(v6, "registrationStatus") == 3)
      -[CNFAccountRegistrar _continueRegisteringAuthenticatedAccount:](self, "_continueRegisteringAuthenticatedAccount:", v6);
  }
  else
  {
    objc_msgSend(v6, "authenticateAccount");
  }
  -[CNFAccountRegistrar _startTimer](self, "_startTimer");

}

- (void)registerAccountWithUsername:(id)a3 password:(id)a4 service:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void (**v17)(_QWORD);
  id v18;
  id v19;
  _QWORD block[4];
  void (**v21)(_QWORD);
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  CNFAccountRegistrar *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10 && v11 && v12)
  {
    OSLogHandleForIDSCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v10;
      v29 = 2112;
      v30 = v12;
      _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "Registering account: %@ (service: %@)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v18 = v10;
      v19 = v12;
      IMLogString();
    }
    -[CNFAccountRegistrar setCompletionBlock:](self, "setCompletionBlock:", v13, v18, v19);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__accountRegistrationStatusChanged_, *MEMORY[0x24BE500B8], 0);
    v16 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __84__CNFAccountRegistrar_registerAccountWithUsername_password_service_completionBlock___block_invoke;
    v22[3] = &unk_24D075D60;
    v23 = v12;
    v24 = v10;
    v25 = v11;
    v26 = self;
    v17 = (void (**)(_QWORD))MEMORY[0x2199B8E98](v22);
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
    {
      v17[2](v17);
    }
    else
    {
      block[0] = v16;
      block[1] = 3221225472;
      block[2] = __84__CNFAccountRegistrar_registerAccountWithUsername_password_service_completionBlock___block_invoke_2;
      block[3] = &unk_24D075D88;
      v21 = v17;
      dispatch_sync(MEMORY[0x24BDAC9B8], block);

    }
    -[CNFAccountRegistrar _startTimer](self, "_startTimer");

  }
}

void __84__CNFAccountRegistrar_registerAccountWithUsername_password_service_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addListenerID:capabilities:", CFSTR("CNFAccountRegistrar"), *MEMORY[0x24BE509E8]);

  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE50280]), "initWithService:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "setLogin:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setAutoLogin:", 1);
  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAccount:", v6);

  objc_msgSend(v6, "updateAuthorizationCredentials:token:", 0, 0);
  objc_msgSend(v6, "setTemporaryPassword:", *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateAccount:", v6);

  objc_msgSend(v6, "authenticateAccount");
  objc_msgSend(*(id *)(a1 + 56), "setAccount:", v6);

}

uint64_t __84__CNFAccountRegistrar_registerAccountWithUsername_password_service_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_registrationTimerFired:(id)a3
{
  id v4;
  NSObject *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  uint8_t v24[16];

  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Timed out internally, waiting on registration. Forcing failed state.", v24, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFAccountRegistrar _stopTimer](self, "_stopTimer");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFAccountRegistrar account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deactivateAccount:", v8);

  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFAccountRegistrar account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteAccount:", v10);

  -[CNFAccountRegistrar setAccount:](self, "setAccount:", 0);
  -[CNFAccountRegistrar completionBlock](self, "completionBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    CommunicationsSetupUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    CommunicationsSetupUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_GENERIC"), &stru_24D077260, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    CommunicationsSetupUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v14, v17, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v20, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAction:", v22);

    -[CNFAccountRegistrar completionBlock](self, "completionBlock");
    v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v23)[2](v23, 0, v21);

  }
  if (_registrationTimerFired__onceToken != -1)
    dispatch_once(&_registrationTimerFired__onceToken, &__block_literal_global_7);

}

void __47__CNFAccountRegistrar__registrationTimerFired___block_invoke()
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_90);
}

void __47__CNFAccountRegistrar__registrationTimerFired___block_invoke_2()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  OSLogHandleForIDSCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2138BA000, v0, OS_LOG_TYPE_DEFAULT, "First time we've timed out internally for this process.  Forcing imagent death.", v2, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "killDaemon");

}

- (void)_accountRegistrationStatusChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _BOOL4 v42;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void (**v61)(_QWORD, _QWORD, _QWORD);
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  BOOL v88;
  void *v89;
  void *v90;
  void *v91;
  _QWORD v92[4];
  __CFString *v93;
  BOOL v94;
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  void *v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFAccountRegistrar account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0x24BDD1000uLL;
  if (v5 == v6)
  {
    switch(objc_msgSend(v5, "registrationStatus"))
    {
      case -1:
        CommunicationsSetupUIBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringTableNameForServiceType(-[CNFAccountRegistrar serviceType](self, "serviceType"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        CommunicationsSetupUIBundle();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringTableNameForServiceType(-[CNFAccountRegistrar serviceType](self, "serviceType"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_GENERIC"), &stru_24D077260, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        CommunicationsSetupUIBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringTableNameForServiceType(-[CNFAccountRegistrar serviceType](self, "serviceType"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v16);
        v89 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v5, "registrationFailureReason");
        objc_msgSend(v5, "registrationFailureAlertInfo");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        OSLogHandleForIDSCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v96 = v5;
          v97 = 2112;
          v98 = v19;
          v99 = 2112;
          v100 = v90;
          _os_log_impl(&dword_2138BA000, v18, OS_LOG_TYPE_DEFAULT, "Account (%@) failed with failure reason: %@ and alert info %@.", buf, 0x20u);

        }
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v90;
          v84 = v5;
          IMLogString();

        }
        v88 = v90 == 0;
        if (v90)
        {
          objc_msgSend(v90, "objectForKey:", *MEMORY[0x24BE500A8]);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            v87 = v20;
          }
          else
          {
            CommunicationsSetupUIBundle();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            CNFRegStringTableNameForServiceType(-[CNFAccountRegistrar serviceType](self, "serviceType"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v46);
            v87 = (id)objc_claimAutoreleasedReturnValue();

            v11 = v45;
          }

          objc_msgSend(v90, "objectForKey:", *MEMORY[0x24BE500A0]);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v47)
          {
            v35 = v47;
          }
          else
          {
            CommunicationsSetupUIBundle();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            CNFRegStringTableNameForServiceType(-[CNFAccountRegistrar serviceType](self, "serviceType"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_GENERIC"), &stru_24D077260, v50);
            v35 = (id)objc_claimAutoreleasedReturnValue();

            v14 = v49;
          }

          objc_msgSend(v90, "objectForKey:", *MEMORY[0x24BE50098]);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v51;
          if (v51)
          {
            v38 = v51;
            v53 = v89;
          }
          else
          {
            CommunicationsSetupUIBundle();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            CNFRegStringTableNameForServiceType(-[CNFAccountRegistrar serviceType](self, "serviceType"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_CANCEL"), &stru_24D077260, v54);
            v38 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v90, "objectForKey:", *MEMORY[0x24BE50080]);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "valueForKey:", *MEMORY[0x24BE50078]);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "valueForKey:", *MEMORY[0x24BE50090]);
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "valueForKey:", *MEMORY[0x24BE50088]);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v40, "integerValue") == 1;
          goto LABEL_59;
        }
        if (!_os_feature_enabled_impl())
          goto LABEL_50;
        if (v17 == 28)
        {
          CommunicationsSetupUIBundle();
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableNameForServiceType(-[CNFAccountRegistrar serviceType](self, "serviceType"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("MESSAGES_ACTIVATION_ERROR_TITLE_VERBOSE"), &stru_24D077260, v79);
          v87 = (id)objc_claimAutoreleasedReturnValue();

          CommunicationsSetupUIBundle();
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableNameForServiceType(-[CNFAccountRegistrar serviceType](self, "serviceType"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("UPDATE_APPLEID_ERROR_MESSAGE"), &stru_24D077260, v81);
          v35 = (id)objc_claimAutoreleasedReturnValue();

          CommunicationsSetupUIBundle();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableNameForServiceType(-[CNFAccountRegistrar serviceType](self, "serviceType"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_CANCEL"), &stru_24D077260, v83);
          v38 = (id)objc_claimAutoreleasedReturnValue();

          CommunicationsSetupUIBundle();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableName();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("UPDATE_APPLEID_ERROR_ACTION"), &stru_24D077260, v40);
          v41 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v17 != 29)
          {
LABEL_50:
            v42 = 0;
            v88 = 0;
            v43 = 0;
            v44 = 0;
LABEL_60:
            objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v11, v14, 1, v84, v85, v86);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
              v55 = v42;
            else
              v55 = 0;
            if (v55)
            {
              v56 = (void *)MEMORY[0x24BEBD3A8];
              v92[0] = MEMORY[0x24BDAC760];
              v92[1] = 3221225472;
              v92[2] = __57__CNFAccountRegistrar__accountRegistrationStatusChanged___block_invoke_130;
              v92[3] = &unk_24D075E30;
              v93 = v43;
              v94 = v88;
              objc_msgSend(v56, "actionWithTitle:style:handler:", v44, 0, v92);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "addAction:", v57);

            }
            objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v89, 1, 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addAction:", v58);

            goto LABEL_66;
          }
          CommunicationsSetupUIBundle();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableNameForServiceType(-[CNFAccountRegistrar serviceType](self, "serviceType"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("MESSAGES_ACTIVATION_ERROR_TITLE_VERBOSE"), &stru_24D077260, v32);
          v87 = (id)objc_claimAutoreleasedReturnValue();

          CommunicationsSetupUIBundle();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableNameForServiceType(-[CNFAccountRegistrar serviceType](self, "serviceType"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("WAITING_FOR_ICLOUD_ERROR_MESSAGE"), &stru_24D077260, v34);
          v35 = (id)objc_claimAutoreleasedReturnValue();

          CommunicationsSetupUIBundle();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableNameForServiceType(-[CNFAccountRegistrar serviceType](self, "serviceType"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_CANCEL"), &stru_24D077260, v37);
          v38 = (id)objc_claimAutoreleasedReturnValue();

          CommunicationsSetupUIBundle();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableNameForServiceType(-[CNFAccountRegistrar serviceType](self, "serviceType"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("WAITING_FOR_ICLOUD_ERROR_ACTION"), &stru_24D077260, v40);
          v41 = objc_claimAutoreleasedReturnValue();
        }
        v44 = (void *)v41;
        v43 = CFSTR("prefs:root=APPLE_ACCOUNT&path=TRANSPARENCY");
        v42 = 1;
LABEL_59:

        v89 = v38;
        v14 = v35;
        v11 = v87;
        goto LABEL_60;
      case 0:
        OSLogHandleForIDSCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v22, OS_LOG_TYPE_DEFAULT, "Account is unknown.", buf, 2u);
        }

        v7 = 0x24BDD1000;
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          goto LABEL_39;
        break;
      case 1:
        OSLogHandleForIDSCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v23, OS_LOG_TYPE_DEFAULT, "Account is unregistered.", buf, 2u);
        }

        v7 = 0x24BDD1000;
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          goto LABEL_39;
        break;
      case 2:
        OSLogHandleForIDSCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v24, OS_LOG_TYPE_DEFAULT, "Account is authenticating.", buf, 2u);
        }

        v7 = 0x24BDD1000;
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          goto LABEL_39;
        break;
      case 3:
        OSLogHandleForIDSCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v25, OS_LOG_TYPE_DEFAULT, "Account is authenticated.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();
        objc_msgSend(v5, "aliasesToRegister");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "count") || (objc_msgSend(v5, "canSendMessages") & 1) != 0)
        {
          -[CNFAccountRegistrar _continueRegisteringAuthenticatedAccount:](self, "_continueRegisteringAuthenticatedAccount:", v5);

        }
        else
        {
          CommunicationsSetupUIBundle();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableName();
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_NO_VALID_ALIASES_TITLE"), &stru_24D077260, v64);
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          CommunicationsSetupUIBundle();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableName();
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_NO_VALID_ALIASES_MESSAGE"), &stru_24D077260, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          CommunicationsSetupUIBundle();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableName();
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_NO_VALID_ALIASES_ACTION_TITLE"), &stru_24D077260, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          CommunicationsSetupUIBundle();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableName();
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_CANCEL"), &stru_24D077260, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v91, v67, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v70, 0, &__block_literal_global_104);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addAction:", v74);

          objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v73, 1, 0);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addAction:", v75);

          -[CNFAccountRegistrar setAccount:](self, "setAccount:", 0);
          objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "deactivateAccount:", v5);

          objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "deleteAccount:", v5);

LABEL_66:
          v30 = 0;
LABEL_67:
          -[CNFAccountRegistrar registrationTimer](self, "registrationTimer");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "invalidate");

          -[CNFAccountRegistrar setRegistrationTimer:](self, "setRegistrationTimer:", 0);
          -[CNFAccountRegistrar completionBlock](self, "completionBlock");
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (v60)
          {
            -[CNFAccountRegistrar completionBlock](self, "completionBlock");
            v61 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, uint64_t, void *))v61)[2](v61, v30, v29);

          }
          -[CNFAccountRegistrar setAccount:](self, "setAccount:", 0);
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "removeObserver:", self);

        }
        v7 = 0x24BDD1000;
        break;
      case 4:
        OSLogHandleForIDSCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v27, OS_LOG_TYPE_DEFAULT, "Account is registering.", buf, 2u);
        }

        v7 = 0x24BDD1000;
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
LABEL_39:
          IMLogString();
        break;
      case 5:
        OSLogHandleForIDSCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v28, OS_LOG_TYPE_DEFAULT, "Account is registered.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();
        v29 = 0;
        v30 = 1;
        goto LABEL_67;
      default:
        break;
    }
  }
  objc_msgSend(*(id *)(v7 + 1744), "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("CNFAccountRegistarStateChangedNotification"), 0);

}

void __57__CNFAccountRegistrar__accountRegistrationStatusChanged___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://appleid.apple.com"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openURL:withCompletionHandler:", v0, 0);

}

void __57__CNFAccountRegistrar__accountRegistrationStatusChanged___block_invoke_130(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "openSensitiveURL:withOptions:", v4, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "openURL:withCompletionHandler:", v4, 0);
    }

  }
  else
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v9 = v7;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Invalid action URL %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }

}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (IMAccount)account
{
  return (IMAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSTimer)registrationTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegistrationTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (UIViewController)presentationViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPresentationViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationViewController, 0);
  objc_storeStrong((id *)&self->_registrationTimer, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
