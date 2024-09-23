@implementation AAUIServiceSignInController

- (AAUIServiceSignInController)initWithSignInConfiguration:(id)a3
{
  id v5;
  AAUIServiceSignInController *v6;
  AAUIServiceSignInController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIServiceSignInController;
  v6 = -[AAUIServiceSignInController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_signInConfig, a3);
    -[AAUIServiceSignInController _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (void)_commonInit
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userPersonaNickName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1DB4ED000, a2, v4, "Initializing AAUIServiceSignInController with persona type %@", v5);

}

- (void)loadViewControllerForPresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("sign-in-nav-bar"));

  if (-[AAUIServiceSignInConfiguration newSignInReauth](self->_signInConfig, "newSignInReauth")
    && (-[AAUIServiceSignInConfiguration username](self->_signInConfig, "username"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Service sign in configuration signaled for reauth.", buf, 2u);
    }

    -[AAUIServiceSignInController _spinnerViewController](self, "_spinnerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIServiceSignInController _setInitialViewController:](self, "_setInitialViewController:", v7);

    -[AAUIServiceSignInController _attemptReauthAndSignInToServices](self, "_attemptReauthAndSignInToServices");
  }
  else
  {
    -[AAUIServiceSignInConfiguration authenticationResults](self->_signInConfig, "authenticationResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Continuing sign in with authentication results...", v15, 2u);
      }

      -[AAUIServiceSignInController _spinnerViewController](self, "_spinnerViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIServiceSignInController _setInitialViewController:](self, "_setInitialViewController:", v11);

      -[AAUIServiceSignInConfiguration authenticationResults](self->_signInConfig, "authenticationResults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIServiceSignInController _mainQueue_continueSignInWithAuthenticationResults:parentViewController:](self, "_mainQueue_continueSignInWithAuthenticationResults:parentViewController:", v12, v13);

    }
    else
    {
      if (v10)
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "No authentication results found, displaying sign in...", v14, 2u);
      }

      -[AAUIServiceSignInController signInViewController](self, "signInViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIServiceSignInController _setInitialViewController:](self, "_setInitialViewController:", v12);
    }

  }
}

- (void)_setInitialViewController:(id)a3
{
  AAUIServiceSignInConfiguration *signInConfig;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  signInConfig = self->_signInConfig;
  v5 = a3;
  -[AAUIServiceSignInConfiguration navigationController](signInConfig, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v8)
  {
    objc_msgSend(v9, "pushViewController:animated:", v5, 1);

  }
  else
  {
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setViewControllers:animated:", v10, 0);
  }
}

- (void)_attemptReauthAndSignInToServices
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD aBlock[5];
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__AAUIServiceSignInController__attemptReauthAndSignInToServices__block_invoke;
  aBlock[3] = &unk_1EA2DC1D0;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  -[AAUIServiceSignInController _serviceOwnersManager](self, "_serviceOwnersManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend((id)objc_opt_class(), "supportedServices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    v16 = v3;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v4, "accountForService:", v9, v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "username");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AAUIServiceSignInConfiguration username](self->_signInConfig, "username");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (v13)
        {
          _AAUILogSystem();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v24 = v9;
            _os_log_impl(&dword_1DB4ED000, v14, OS_LOG_TYPE_DEFAULT, "Found account for service %{public}@, prompting for sign in...", buf, 0xCu);
          }

          -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v16;
          -[AAUIServiceSignInController _authenticateExistingAccount:serviceType:inViewController:completion:](self, "_authenticateExistingAccount:serviceType:inViewController:completion:", v10, v9, v15, v16);

          goto LABEL_13;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      v3 = v16;
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

}

void __64__AAUIServiceSignInController__attemptReauthAndSignInToServices__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;

  v5 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (a3)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __64__AAUIServiceSignInController__attemptReauthAndSignInToServices__block_invoke_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "signInViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v8, 1);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setAuthenticationResults:", v5);
    v9 = *(id **)(a1 + 32);
    objc_msgSend(v9[11], "authenticationResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_mainQueue_continueSignInWithAuthenticationResults:parentViewController:", v10, v11);

  }
}

- (id)_serviceOwnersManager
{
  AIDAServiceOwnerProtocol *serviceOwnersManager;
  id v4;
  AIDAServiceOwnerProtocol *v5;
  AIDAServiceOwnerProtocol *v6;

  serviceOwnersManager = self->_serviceOwnersManager;
  if (!serviceOwnersManager)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    v5 = (AIDAServiceOwnerProtocol *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCF68]), "initWithAccountStore:", v4);
    v6 = self->_serviceOwnersManager;
    self->_serviceOwnersManager = v5;

    serviceOwnersManager = self->_serviceOwnersManager;
  }
  return serviceOwnersManager;
}

- (AKAppleIDAuthenticationController)authenticationController
{
  AKAppleIDAuthenticationController *authenticationController;
  id v4;

  authenticationController = self->_authenticationController;
  if (authenticationController)
    return authenticationController;
  v4 = objc_alloc_init(MEMORY[0x1E0D00130]);
  return (AKAppleIDAuthenticationController *)v4;
}

- (id)_spinnerMessageForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_18;
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CFCF18]))
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFCF38]))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7;
      v8 = CFSTR("SIGN_IN_SPINNER_LABEL_STORE");
LABEL_24:
      objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_1EA2E2A18, CFSTR("Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFCF30]))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7;
      v8 = CFSTR("SIGN_IN_SPINNER_LABEL_IMESSAGE");
      goto LABEL_24;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFCF20]))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7;
      v8 = CFSTR("SIGN_IN_SPINNER_LABEL_FACETIME");
      goto LABEL_24;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFCF28]))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7;
      v8 = CFSTR("SIGN_IN_SPINNER_LABEL_GAMECENTER");
      goto LABEL_24;
    }
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AAUIServiceSignInController _spinnerMessageForService:].cold.1();

LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("SIGN_IN_SPINNER_LABEL"), "containsString:", CFSTR("REBRAND")) & 1) == 0
      && (_os_feature_enabled_impl() & 1) != 0)
    {
      v6 = CFSTR("SIGN_IN_SPINNER_LABEL");
      goto LABEL_21;
    }
    v8 = CFSTR("SIGN_IN_SPINNER_LABEL");
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("SIGN_IN_SPINNER_LABEL_ICLOUD"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || (_os_feature_enabled_impl() & 1) == 0)
  {
    v8 = CFSTR("SIGN_IN_SPINNER_LABEL_ICLOUD");
LABEL_23:
    v7 = v5;
    goto LABEL_24;
  }
  v6 = CFSTR("SIGN_IN_SPINNER_LABEL_ICLOUD");
LABEL_21:
  -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("_REBRAND"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v10, &stru_1EA2E2A18, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
  return v11;
}

- (id)_spinnerViewController
{
  UIViewController *spinnerViewController;
  AAUISpinnerViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  UIViewController *v8;

  spinnerViewController = self->_spinnerViewController;
  if (!spinnerViewController)
  {
    if (+[AAUIFeatureFlags isNewSignInProgressEnabled](AAUIFeatureFlags, "isNewSignInProgressEnabled"))
    {
      v4 = +[AAUISpinnerViewController newSignInProgressViewWithFullName:](AAUISpinnerViewController, "newSignInProgressViewWithFullName:", &stru_1EA2E2A18);
    }
    else
    {
      v4 = objc_alloc_init(AAUISpinnerViewController);
      -[AAUISpinnerViewController label](v4, "label");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIServiceSignInConfiguration serviceType](self->_signInConfig, "serviceType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIServiceSignInController _spinnerMessageForService:](self, "_spinnerMessageForService:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setText:", v7);

    }
    v8 = self->_spinnerViewController;
    self->_spinnerViewController = &v4->super;

    spinnerViewController = self->_spinnerViewController;
  }
  return spinnerViewController;
}

- (BOOL)_showsServiceIcons
{
  uint64_t v3;
  void *v4;
  BOOL v5;

  -[AAUIServiceSignInConfiguration serviceType](self->_signInConfig, "serviceType");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 1;
  v4 = (void *)v3;
  v5 = -[AAUIServiceSignInConfiguration splitSignIn](self->_signInConfig, "splitSignIn");

  return v5;
}

- (BOOL)_allowsAccountCreation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[AAUIServiceSignInConfiguration serviceTypes](self->_signInConfig, "serviceTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[AAUIServiceSignInConfiguration serviceTypes](self->_signInConfig, "serviceTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    -[AAUIServiceSignInConfiguration serviceTypes](self->_signInConfig, "serviceTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == (void *)*MEMORY[0x1E0CFCF18];

  }
  else
  {
    v8 = 0;
  }

  return !v4 || v8;
}

- (BOOL)_isAuthenticatingPrimary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  -[AAUIServiceSignInConfiguration serviceType](self->_signInConfig, "serviceType");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[AAUIServiceSignInConfiguration serviceType](self->_signInConfig, "serviceType"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", v4),
        v7,
        v6,
        !v8))
  {
    v11 = 0;
  }
  else
  {
    -[AAUIServiceSignInController _serviceOwnersManager](self, "_serviceOwnersManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountForService:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10 == 0;
  }

  return v11;
}

- (id)_serviceContextWithResults:(id)a3 parentViewController:(id)a4
{
  id v6;
  AAUIServiceSignInConfiguration *signInConfig;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  char v13;
  id v14;
  void *v15;
  CDPUIController *v16;
  CDPUIController *cdpUIController;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  AAUISignInFlowControllerDelegate *v23;
  AAUISignInFlowControllerDelegate *v24;
  void *v25;
  AAUISignInFlowControllerDelegate *v26;
  void *v27;
  AAUISignInFlowControllerDelegate *v28;
  AAUISignInFlowControllerDelegate *flowControllerDelegate;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v6 = a3;
  signInConfig = self->_signInConfig;
  v8 = a4;
  -[AAUIServiceSignInConfiguration serviceContext](signInConfig, "serviceContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (-[AAUIServiceSignInConfiguration serviceContext](self->_signInConfig, "serviceContext"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = (id)objc_msgSend(v10, "mutableCopy"),
        v10,
        v11))
  {
    _AAUILogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[AAUIServiceSignInController _serviceContextWithResults:parentViewController:].cold.1();

    v13 = 0;
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CFCF58]);
    objc_msgSend(v11, "setShouldForceOperation:", -[AAUIServiceSignInConfiguration shouldForceOperation](self->_signInConfig, "shouldForceOperation"));
    v13 = 1;
  }
  objc_msgSend(v11, "setAuthenticationResults:", v6);
  objc_msgSend(v11, "setOperationUIPermissions:", -[AAUIServiceSignInConfiguration aidaOperationUIPermissions](self->_signInConfig, "aidaOperationUIPermissions"));
  objc_msgSend(v11, "setViewController:", v8);

  v14 = objc_alloc(MEMORY[0x1E0D157C8]);
  objc_msgSend(v11, "viewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (CDPUIController *)objc_msgSend(v14, "initWithPresentingViewController:", v15);
  cdpUIController = self->_cdpUIController;
  self->_cdpUIController = v16;

  -[CDPUIController setForceInlinePresentation:](self->_cdpUIController, "setForceInlinePresentation:", 1);
  objc_msgSend(v11, "setCdpUiProvider:", self->_cdpUIController);
  objc_msgSend(v11, "signInContexts");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((v13 & 1) != 0)
  {
    v20 = (void *)objc_msgSend(v18, "mutableCopy");
    v21 = v20;
    if (v20)
      v22 = v20;
    else
      v22 = (id)objc_opt_new();
    v25 = v22;

    v26 = [AAUISignInFlowControllerDelegate alloc];
    objc_msgSend(v11, "viewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[AAUISignInFlowControllerDelegate initWithPresentingViewController:](v26, "initWithPresentingViewController:", v27);
    flowControllerDelegate = self->_flowControllerDelegate;
    self->_flowControllerDelegate = v28;

    -[AAUISignInFlowControllerDelegate setProgressViewAlreadyPresented:](self->_flowControllerDelegate, "setProgressViewAlreadyPresented:", self->_spinnerViewController != 0);
    objc_msgSend(v25, "setObject:forKeyedSubscript:", self->_flowControllerDelegate, *MEMORY[0x1E0CFCF18]);
    objc_msgSend(v11, "setSignInContexts:", v25);
  }
  else
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
    v23 = (AAUISignInFlowControllerDelegate *)objc_claimAutoreleasedReturnValue();
    v24 = self->_flowControllerDelegate;
    self->_flowControllerDelegate = v23;

    objc_msgSend(v11, "viewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUISignInFlowControllerDelegate setPresentingViewController:](self->_flowControllerDelegate, "setPresentingViewController:", v25);
  }

  -[AAUIServiceSignInConfiguration localSecret](self->_signInConfig, "localSecret");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {

  }
  else if (!-[AAUIServiceSignInConfiguration isAttemptingBackupRestore](self->_signInConfig, "isAttemptingBackupRestore"))
  {
    goto LABEL_19;
  }
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D15768]), "initWithAuthenticationResults:", v6);
  objc_msgSend(v31, "setIsAttemptingBackupRestore:", -[AAUIServiceSignInConfiguration isAttemptingBackupRestore](self->_signInConfig, "isAttemptingBackupRestore"));
  -[AAUIServiceSignInConfiguration localSecret](self->_signInConfig, "localSecret");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[AAUIServiceSignInConfiguration localSecret](self->_signInConfig, "localSecret");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "validatedSecret");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCachedLocalSecret:", v34);

    -[AAUIServiceSignInConfiguration localSecret](self->_signInConfig, "localSecret");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCachedLocalSecretType:", objc_msgSend(v35, "secretType"));

  }
  -[AAUISignInFlowControllerDelegate setCdpContext:](self->_flowControllerDelegate, "setCdpContext:", v31);

LABEL_19:
  return v11;
}

- (AAUISignInViewController)signInViewController
{
  AAUISignInViewController *signInViewController;
  AAUISignInViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  AAUISignInViewController *v11;

  signInViewController = self->_signInViewController;
  if (signInViewController)
    return signInViewController;
  objc_msgSend(MEMORY[0x1E0CFACE8], "verifyAndFixPersonaIfNeeded:desiredContext:", self->_originalPersona, self->_originalPersonaContext);
  v4 = objc_alloc_init(AAUISignInViewController);
  -[AAUIServiceSignInConfiguration serviceType](self->_signInConfig, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController _setAkServiceType:](v4, "_setAkServiceType:", AKServiceTypeFromAIDAServiceType(v5));

  -[AAUIServiceSignInConfiguration username](self->_signInConfig, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController setUsername:](v4, "setUsername:", v6);

  -[AAUIServiceSignInConfiguration privacyLinkIdentifiers](self->_signInConfig, "privacyLinkIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController setPrivacyLinkIdentifiers:](v4, "setPrivacyLinkIdentifiers:", v7);

  -[AAUISignInViewController setAllowSkip:](v4, "setAllowSkip:", -[AAUIServiceSignInConfiguration allowSkip](self->_signInConfig, "allowSkip"));
  -[AAUISignInViewController setShouldShowSystemBackButton:](v4, "setShouldShowSystemBackButton:", -[AAUIServiceSignInConfiguration shouldShowSystemBackButton](self->_signInConfig, "shouldShowSystemBackButton"));
  -[AAUISignInViewController setHidesBackOrCancelButton:](v4, "setHidesBackOrCancelButton:", -[AAUIServiceSignInConfiguration hidesBackOrCancelButton](self->_signInConfig, "hidesBackOrCancelButton"));
  if (!-[AAUIServiceSignInConfiguration canEditUsername](self->_signInConfig, "canEditUsername"))
  {
    -[AAUISignInViewController setCanEditUsername:](v4, "setCanEditUsername:", 0);
    goto LABEL_6;
  }
  if (-[AAUIServiceSignInConfiguration shouldDisableAccountCreation](self->_signInConfig, "shouldDisableAccountCreation"))
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = -[AAUIServiceSignInController _allowsAccountCreation](self, "_allowsAccountCreation");
LABEL_7:
  -[AAUISignInViewController setAllowsAccountCreation:](v4, "setAllowsAccountCreation:", v8);
  if (-[AAUIServiceSignInConfiguration offeriCloudAMSSplitSignIn](self->_signInConfig, "offeriCloudAMSSplitSignIn"))
    -[AAUISignInViewController setShowOtherOptions:](v4, "setShowOtherOptions:", 1);
  -[AAUISignInViewController setDelegate:](v4, "setDelegate:", self);
  -[AAUISignInViewController setShowServiceIcons:](v4, "setShowServiceIcons:", -[AAUIServiceSignInController _showsServiceIcons](self, "_showsServiceIcons"));
  +[AAUIServiceSignInMessageProvider messageForConfiguration:](AAUIServiceSignInMessageProvider, "messageForConfiguration:", self->_signInConfig);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[AAUISignInViewController setMessageLabel:](v4, "setMessageLabel:", v9);
  if (-[AAUIServiceSignInController _isAuthenticatingPrimary:](self, "_isAuthenticatingPrimary:", *MEMORY[0x1E0CFCF18]))
  {
    -[AAUISignInViewController _setShouldAnticipatePiggybacking:](v4, "_setShouldAnticipatePiggybacking:", 1);
    -[AAUISignInViewController _setAkServiceType:](v4, "_setAkServiceType:", 1);
  }
  -[AAUISignInViewController setShowsChildSignIn:](v4, "setShowsChildSignIn:", -[AAUIServiceSignInConfiguration showsChildSignIn](self->_signInConfig, "showsChildSignIn"));
  -[AAUIServiceSignInController akURLBag](self, "akURLBag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController setAKURLBag:](v4, "setAKURLBag:", v10);

  v11 = self->_signInViewController;
  self->_signInViewController = v4;

  signInViewController = self->_signInViewController;
  return signInViewController;
}

- (id)_alertControllerForReusingAccount:(id)a3 serviceType:(id)a4 inViewController:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  AAUIServiceSignInController *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[5];
  id v78;
  id v79;
  id v80;
  id v81;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  AALocalizedStringForServiceType();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIServiceSignInConfiguration serviceType](self->_signInConfig, "serviceType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  AALocalizedStringForServiceType();
  v16 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "userFullName");
  v17 = objc_claimAutoreleasedReturnValue();
  v70 = (void *)v16;
  v66 = v12;
  v68 = v11;
  v62 = self;
  v64 = (void *)v17;
  v65 = v13;
  if (v17)
  {
    v18 = v17;
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_CONTINUE_USING_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v21, v16, v18);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CFSTR("SIGN_IN_CONTINUE_USING_MESSAGE");
    v25 = v18;
    if ((objc_msgSend(CFSTR("SIGN_IN_CONTINUE_USING_MESSAGE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
      || !_os_feature_enabled_impl())
    {
      v26 = 0;
    }
    else
    {
      objc_msgSend(CFSTR("SIGN_IN_CONTINUE_USING_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v26 = 1;
    }
    objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_1EA2E2A18, CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "aa_formattedUsername");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v27, v14, v28, v25, v16);
    v29 = objc_claimAutoreleasedReturnValue();

    if (v26)
    v30 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_CONTINUE_USING_DIFFERENT"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", v32, v25);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "aa_formattedUsername");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_CONTINUE_USING_TITLE_USERNAME"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", v35, v16, v31);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = CFSTR("SIGN_IN_CONTINUE_USING_MESSAGE_USERNAME");
    if ((objc_msgSend(CFSTR("SIGN_IN_CONTINUE_USING_MESSAGE_USERNAME"), "containsString:", CFSTR("REBRAND")) & 1) != 0)
    {
      v39 = 0;
    }
    else if (_os_feature_enabled_impl())
    {
      objc_msgSend(CFSTR("SIGN_IN_CONTINUE_USING_MESSAGE_USERNAME"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v39 = 1;
    }
    else
    {
      v39 = 0;
    }
    objc_msgSend(v37, "localizedStringForKey:value:table:", v38, &stru_1EA2E2A18, CFSTR("Localizable"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", v40, v14, v31, v31, v16);
    v29 = objc_claimAutoreleasedReturnValue();

    if (v39)
    v41 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_CONTINUE_USING_DIFFERENT_USERNAME"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringWithFormat:", v42, v31);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v63 = (void *)v29;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", v72, v29);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_CONTINUE_USING_SAME"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __105__AAUIServiceSignInController__alertControllerForReusingAccount_serviceType_inViewController_completion___block_invoke;
  v77[3] = &unk_1EA2DDA50;
  v77[4] = v62;
  v78 = v10;
  v79 = v68;
  v80 = v66;
  v47 = v65;
  v81 = v47;
  v67 = v66;
  v69 = v68;
  v71 = v10;
  objc_msgSend(v44, "actionWithTitle:style:handler:", v46, 0, v77);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addAction:", v48);

  v49 = (void *)MEMORY[0x1E0DC3448];
  v50 = MEMORY[0x1E0C809B0];
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __105__AAUIServiceSignInController__alertControllerForReusingAccount_serviceType_inViewController_completion___block_invoke_81;
  v75[3] = &unk_1EA2DC540;
  v51 = v47;
  v76 = v51;
  objc_msgSend(v49, "actionWithTitle:style:handler:", v61, 0, v75);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addAction:", v52);

  v53 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_CONTINUE_USING_CANCEL"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v50;
  v73[1] = 3221225472;
  v73[2] = __105__AAUIServiceSignInController__alertControllerForReusingAccount_serviceType_inViewController_completion___block_invoke_84;
  v73[3] = &unk_1EA2DC540;
  v74 = v51;
  v56 = v51;
  objc_msgSend(v53, "actionWithTitle:style:handler:", v55, 0, v73);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addAction:", v57);

  objc_msgSend(v43, "actions");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "firstObject");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setPreferredAction:", v59);

  return v43;
}

uint64_t __105__AAUIServiceSignInController__alertControllerForReusingAccount_serviceType_inViewController_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "User opted to continue using account.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_authenticateExistingAccount:serviceType:inViewController:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __105__AAUIServiceSignInController__alertControllerForReusingAccount_serviceType_inViewController_completion___block_invoke_81(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "User opted to sign in as a different account.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__AAUIServiceSignInController__alertControllerForReusingAccount_serviceType_inViewController_completion___block_invoke_84(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "User canceled option to continue using...", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

- (void)prepareInViewController:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD aBlock[5];
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__AAUIServiceSignInController_prepareInViewController_completion___block_invoke;
  aBlock[3] = &unk_1EA2DCD48;
  aBlock[4] = self;
  v22 = v6;
  v29 = v22;
  v21 = _Block_copy(aBlock);
  -[AAUIServiceSignInController _serviceOwnersManager](self, "_serviceOwnersManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend((id)objc_opt_class(), "supportedServices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v7, "accountForService:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "username");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "length");

        if (v16)
        {
          _AAUILogSystem();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v31 = v13;
            _os_log_impl(&dword_1DB4ED000, v20, OS_LOG_TYPE_DEFAULT, "Found account for service %{public}@, prompting for sign in...", buf, 0xCu);
          }

          v19 = v23;
          v18 = v21;
          -[AAUIServiceSignInController _mainQueue_presentContinueUsingInViewController:account:serviceType:completion:](self, "_mainQueue_presentContinueUsingInViewController:account:serviceType:completion:", v23, v14, v13, v21);

          goto LABEL_15;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v10)
        continue;
      break;
    }
  }

  _AAUILogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v17, OS_LOG_TYPE_DEFAULT, "No primary account to attempt continuation against, bailing...", buf, 2u);
  }

  v18 = v21;
  (*((void (**)(void *, _QWORD, _QWORD))v21 + 2))(v21, 0, 0);
  v19 = v23;
LABEL_15:

}

void __66__AAUIServiceSignInController_prepareInViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setAuthenticationResults:", v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v7 == 0);

}

- (void)_mainQueue_presentContinueUsingInViewController:(id)a3 account:(id)a4 serviceType:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v10 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __110__AAUIServiceSignInController__mainQueue_presentContinueUsingInViewController_account_serviceType_completion___block_invoke;
  v14[3] = &unk_1EA2DDA78;
  v15 = v10;
  v11 = v10;
  v12 = a3;
  -[AAUIServiceSignInController _alertControllerForReusingAccount:serviceType:inViewController:completion:](self, "_alertControllerForReusingAccount:serviceType:inViewController:completion:", a4, a5, v12, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, 0);

}

void __110__AAUIServiceSignInController__mainQueue_presentContinueUsingInViewController_account_serviceType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = v5;
  if (v12)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else if (v5)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D00240], "sharedNetworkObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isNetworkReachable");

    v10 = *(_QWORD *)(a1 + 32);
    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAB90], -8009, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

      goto LABEL_6;
    }
    v7 = *(void (**)(void))(v10 + 16);
  }
  v7();
LABEL_6:

}

- (void)_authenticateExistingAccount:(id)a3 serviceType:(id)a4 inViewController:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x1E0D002F8]);
  objc_msgSend(v14, "setShouldOfferSecurityUpgrade:", 0);
  -[AAUIServiceSignInController _serviceOwnersManager](self, "_serviceOwnersManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "altDSIDForAccount:service:", v10, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAltDSID:", v16);

  -[AAUIServiceSignInController _serviceOwnersManager](self, "_serviceOwnersManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "DSIDForAccount:service:", v10, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDSID:", v18);

  objc_msgSend(v10, "username");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIsUsernameEditable:", objc_msgSend(v19, "length") == 0);

  objc_msgSend(v14, "setPresentingViewController:", v12);
  -[AAUIServiceSignInConfiguration serviceType](self->_signInConfig, "serviceType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setServiceType:", AKServiceTypeFromAIDAServiceType(v20));

  objc_msgSend(v10, "username");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUsername:", v21);

  LODWORD(v18) = -[AAUIServiceSignInController _isAuthenticatingPrimary:](self, "_isAuthenticatingPrimary:", *MEMORY[0x1E0CFCF18]);
  _AAUILogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v18)
  {
    if (v23)
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_1DB4ED000, v22, OS_LOG_TYPE_DEFAULT, "%@ detected primary iCloud sign in.", (uint8_t *)&buf, 0xCu);

    }
    objc_msgSend(v14, "setAnticipateEscrowAttempt:", 1);
    objc_msgSend(v14, "setServiceType:", 1);
    objc_msgSend(v14, "setAuthenticationType:", 2);
    objc_msgSend(v14, "setShouldOfferSecurityUpgrade:", 1);
    objc_msgSend(v14, "setSupportsPiggybacking:", 1);
  }
  else
  {
    if (v23)
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v27;
      _os_log_impl(&dword_1DB4ED000, v22, OS_LOG_TYPE_DEFAULT, "%@ detected non-primary iCloud sign in.", (uint8_t *)&buf, 0xCu);

    }
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__14;
  v36 = __Block_byref_object_dispose__14;
  -[AAUIServiceSignInController authenticationController](self, "authenticationController");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v28 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __100__AAUIServiceSignInController__authenticateExistingAccount_serviceType_inViewController_completion___block_invoke;
  v30[3] = &unk_1EA2DDAA0;
  p_buf = &buf;
  v29 = v13;
  v31 = v29;
  objc_msgSend(v28, "authenticateWithContext:completion:", v14, v30);

  _Block_object_dispose(&buf, 8);
}

void __100__AAUIServiceSignInController__authenticateExistingAccount_serviceType_inViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__AAUIServiceSignInController__authenticateExistingAccount_serviceType_inViewController_completion___block_invoke_2;
  block[3] = &unk_1EA2DB500;
  v9 = *(id *)(a1 + 32);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __100__AAUIServiceSignInController__authenticateExistingAccount_serviceType_inViewController_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_mainQueue_continueSignInWithAuthenticationResults:(id)a3 parentViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__AAUIServiceSignInController__mainQueue_continueSignInWithAuthenticationResults_parentViewController___block_invoke;
  aBlock[3] = &unk_1EA2DBB10;
  aBlock[4] = self;
  v8 = _Block_copy(aBlock);
  -[AAUIServiceSignInConfiguration serviceTypes](self->_signInConfig, "serviceTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  _AAUILogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      -[AAUIServiceSignInConfiguration serviceTypes](self->_signInConfig, "serviceTypes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Client opted to sign in %{public}@, attempting sign in now...", buf, 0xCu);

    }
    -[AAUIServiceSignInConfiguration serviceTypes](self->_signInConfig, "serviceTypes");
    v14 = objc_claimAutoreleasedReturnValue();
    -[AAUIServiceSignInController _prepareToSignInForServices:withAuthenticationResults:parentViewController:](self, "_prepareToSignInForServices:withAuthenticationResults:parentViewController:", v14, v7, v6);

    v6 = v7;
    v7 = (id)v14;
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "No service specified by client, attempting sign in for all...", buf, 2u);
    }

    -[AAUIServiceSignInController continueSignInWithAuthenticationResults:viewController:completion:](self, "continueSignInWithAuthenticationResults:viewController:completion:", v7, v6, v8);
  }

}

void __103__AAUIServiceSignInController__mainQueue_continueSignInWithAuthenticationResults_parentViewController___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD block[5];
  id v11;
  char v12;
  uint8_t buf[16];

  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "AAUISignInController signed in with authentication results successfully!", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __103__AAUIServiceSignInController__mainQueue_continueSignInWithAuthenticationResults_parentViewController___block_invoke_cold_1();
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__AAUIServiceSignInController__mainQueue_continueSignInWithAuthenticationResults_parentViewController___block_invoke_89;
  block[3] = &unk_1EA2DDAC8;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = a2;
  block[4] = v8;
  v11 = v5;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __103__AAUIServiceSignInController__mainQueue_continueSignInWithAuthenticationResults_parentViewController___block_invoke_89(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_delegate_signInControllerDidCompleteWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)continueSignInWithAuthenticationResults:(id)a3 viewController:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  -[AAUIServiceSignInController _serviceContextWithResults:parentViewController:](self, "_serviceContextWithResults:parentViewController:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIServiceSignInController _serviceOwnersManager](self, "_serviceOwnersManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AAUIServiceSignInController _serviceOwnersManager](self, "_serviceOwnersManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __97__AAUIServiceSignInController_continueSignInWithAuthenticationResults_viewController_completion___block_invoke;
    v14[3] = &unk_1EA2DBC90;
    v15 = v8;
    objc_msgSend(v12, "signInToAllServicesInBackgroundUsingContext:completion:", v9, v14);

  }
  else
  {
    _AAUILogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AAUIServiceSignInController continueSignInWithAuthenticationResults:viewController:completion:].cold.1();

    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

void __97__AAUIServiceSignInController_continueSignInWithAuthenticationResults_viewController_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  _QWORD aBlock[4];
  id v10;
  id v11;
  char v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__AAUIServiceSignInController_continueSignInWithAuthenticationResults_viewController_completion___block_invoke_2;
  aBlock[3] = &unk_1EA2DCCA8;
  v11 = *(id *)(a1 + 32);
  v12 = a2;
  v6 = v5;
  v10 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((a2 & 1) == 0)
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Sign in attempt for iCloud failed, error: %{public}@", buf, 0xCu);
    }

  }
  v7[2](v7);

}

void __97__AAUIServiceSignInController_continueSignInWithAuthenticationResults_viewController_completion___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__AAUIServiceSignInController_continueSignInWithAuthenticationResults_viewController_completion___block_invoke_3;
  block[3] = &unk_1EA2DCCA8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_BYTE *)(a1 + 48);
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __97__AAUIServiceSignInController_continueSignInWithAuthenticationResults_viewController_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_delegate_signInControllerDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  BOOL v21;
  _QWORD aBlock[6];
  _QWORD v23[5];
  id v24;

  v4 = a3;
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__14;
  v23[4] = __Block_byref_object_dispose__14;
  -[AAUIServiceSignInConfiguration serviceType](self->_signInConfig, "serviceType");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)*MEMORY[0x1E0CFCF18];
  if (v7)
    v9 = (void *)v7;
  v24 = v9;

  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke;
  aBlock[3] = &unk_1EA2DDAF0;
  aBlock[4] = self;
  aBlock[5] = v23;
  v11 = _Block_copy(aBlock);
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  if (!v6)
  {
    (*((void (**)(void *, _BOOL8, _QWORD))v11 + 2))(v11, v4, 0);
    goto LABEL_14;
  }
  objc_msgSend(v6, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D15750]);

  if (v14)
  {
    if (!objc_msgSend(v6, "shouldDisplayToUser"))
    {
LABEL_6:
      _AAUILogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[AAUIServiceSignInController _delegate_signInControllerDidCompleteWithSuccess:error:].cold.2();

      ((void (**)(_QWORD, _BOOL8, id))v12)[2](v12, v4, v6);
      goto LABEL_14;
    }
  }
  else if ((objc_msgSend(v6, "aa_isAASignInErrorWithCode:", -8006) & 1) != 0)
  {
    goto LABEL_6;
  }
  _AAUILogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[AAUIServiceSignInController _delegate_signInControllerDidCompleteWithSuccess:error:].cold.1();

  -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke_96;
  v18[3] = &unk_1EA2DDB18;
  v19 = v6;
  v20 = v12;
  v21 = v4;
  -[AAUIServiceSignInController _mainQueue_presentAlertForError:inViewController:completion:](self, "_mainQueue_presentAlertForError:inViewController:completion:", v19, v17, v18);

LABEL_14:
  _Block_object_dispose(v23, 8);

}

void __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "serviceDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceSignInController:didCompleteWithSuccess:error:", v6, a2, v11);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCF60]), "initWithSuccess:error:type:", a2, v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v5, "serviceSignInController:didCompleteWithOperationsResults:", v9, v10);

  }
}

uint64_t __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke_96(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke_96_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)controllerFinishedWithAIDAResults:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(void *, id);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void (**v22)(void *, id);
  _QWORD aBlock[5];

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke;
  aBlock[3] = &unk_1EA2DDB80;
  aBlock[4] = self;
  v6 = (void (**)(void *, id))_Block_copy(aBlock);
  v7 = *MEMORY[0x1E0CFCF18];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D15750]);

      if ((v15 & 1) != 0)
      {
        if (!objc_msgSend(v13, "shouldDisplayToUser"))
        {
LABEL_5:
          _AAUILogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[AAUIServiceSignInController _delegate_signInControllerDidCompleteWithSuccess:error:].cold.2();

          v6[2](v6, v4);
LABEL_13:

          goto LABEL_14;
        }
      }
      else if ((objc_msgSend(v13, "aa_isAASignInErrorWithCode:", -8006) & 1) != 0)
      {
        goto LABEL_5;
      }
      _AAUILogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[AAUIServiceSignInController _delegate_signInControllerDidCompleteWithSuccess:error:].cold.1();

      -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v5;
      v19[1] = 3221225472;
      v19[2] = __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke_100;
      v19[3] = &unk_1EA2DB3E8;
      v20 = v13;
      v22 = v6;
      v21 = v4;
      -[AAUIServiceSignInController _mainQueue_presentAlertForError:inViewController:completion:](self, "_mainQueue_presentAlertForError:inViewController:completion:", v20, v18, v19);

      goto LABEL_13;
    }
  }
  v6[2](v6, v4);
LABEL_14:

}

void __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "serviceDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceSignInController:didCompleteWithOperationsResults:", v5, v3);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CFCF18]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      _AAUILogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "error");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v8;
        _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "AAUIServiceSignInController calling deprecated delegate callback for cloud service type %@", (uint8_t *)&v17, 0xCu);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serviceSignInController:didCompleteWithSuccess:error:", v9, v10 == 0, v11);

    }
    else
    {
      objc_msgSend(v3, "allValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "aaf_filter:", &__block_literal_global_23);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _AAUILogSystem();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke_cold_1(v10, v13);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "navigationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "serviceSignInController:didCompleteWithSuccess:error:", v14, 0, v15);

      }
      else
      {
        _AAUILogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "AAUIServiceSignInController calling deprecated delegate callback for success", (uint8_t *)&v17, 2u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "navigationController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "serviceSignInController:didCompleteWithSuccess:error:", v10, 1, 0);
      }
    }

  }
}

uint64_t __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke_97(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "success") ^ 1;
}

uint64_t __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke_100(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke_96_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_prepareToSignInForServices:(id)a3 withAuthenticationResults:(id)a4 parentViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[8];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") == 1
    && (objc_msgSend(v8, "objectAtIndexedSubscript:", 0),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = (void *)*MEMORY[0x1E0CFCF18],
        v11,
        v11 == v12))
  {
    _AAUILogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1DB4ED000, v14, OS_LOG_TYPE_DEFAULT, "Detected cloud only service sign in.", v17, 2u);
    }

    -[AAUIServiceSignInController _serviceContextForCloudAndInactiveStoreWithAuthResults:parentViewController:](self, "_serviceContextForCloudAndInactiveStoreWithAuthResults:parentViewController:", v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0CFCF38];
    v18[0] = v11;
    v18[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v16 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v16;
  }
  else
  {
    -[AAUIServiceSignInController _serviceContextWithResults:parentViewController:](self, "_serviceContextWithResults:parentViewController:", v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AAUIServiceSignInController _attemptSignInForServices:serviceContext:](self, "_attemptSignInForServices:serviceContext:", v8, v13);

}

- (void)_attemptSignInForServices:(id)a3 serviceContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AAUIServiceSignInController _attemptSignInForServices:serviceContext:].cold.2(v8, v9, v10);

  objc_msgSend(MEMORY[0x1E0CFACE8], "verifyAndFixPersonaIfNeeded:desiredContext:", self->_originalPersona, self->_originalPersonaContext);
  _AAUILogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v6;
    _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Attempting sign in for services %{public}@ with authentication results", buf, 0xCu);
  }

  -[AAUIServiceSignInController _serviceOwnersManager](self, "_serviceOwnersManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AAUIServiceSignInController _serviceOwnersManager](self, "_serviceOwnersManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __72__AAUIServiceSignInController__attemptSignInForServices_serviceContext___block_invoke;
    v20[3] = &unk_1EA2DDBA8;
    v20[4] = self;
    objc_msgSend(v14, "signInToServices:usingContext:completion:", v6, v7, v20);
  }
  else
  {
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[AAUIServiceSignInController _attemptSignInForServices:serviceContext:].cold.1();

    v16 = objc_alloc(MEMORY[0x1E0CFCF60]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0CFCF18];
    v14 = (void *)objc_msgSend(v16, "initWithSuccess:error:type:", 0, v17, *MEMORY[0x1E0CFCF18]);

    v21 = v18;
    v22 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIServiceSignInController controllerFinishedWithAIDAResults:](self, "controllerFinishedWithAIDAResults:", v19);

  }
}

void __72__AAUIServiceSignInController__attemptSignInForServices_serviceContext___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "AAUISignInController sign in for services completed successfully! %@ ", buf, 0xCu);
    }

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__AAUIServiceSignInController__attemptSignInForServices_serviceContext___block_invoke_101;
  v8[3] = &unk_1EA2DB778;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __72__AAUIServiceSignInController__attemptSignInForServices_serviceContext___block_invoke_101(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "controllerFinishedWithAIDAResults:", *(_QWORD *)(a1 + 40));
}

- (id)_serviceContextForCloudAndInactiveStoreWithAuthResults:(id)a3 parentViewController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  -[AAUIServiceSignInController _serviceContextWithResults:parentViewController:](self, "_serviceContextWithResults:parentViewController:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signInContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = objc_alloc_init(MEMORY[0x1E0CFDC30]);
  objc_msgSend(v7, "setCanMakeAccountActive:", 0);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CFCF38]);
  v8 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setSignInContexts:", v8);

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
}

- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4
{
  void *v4;
  void *v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  _QWORD aBlock[5];
  id v25;
  id v26;
  uint8_t buf[16];

  v8 = a4;
  v9 = a3;
  _AAUILogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Sign in view controller completed with authentication results!", buf, 2u);
  }

  objc_msgSend(v9, "parentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__AAUIServiceSignInController_signInViewController_didCompleteWithAuthenticationResults___block_invoke;
  aBlock[3] = &unk_1EA2DB818;
  aBlock[4] = self;
  v12 = v8;
  v25 = v12;
  v13 = v11;
  v26 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!+[AAUIFeatureFlags isNewSignInProgressEnabled](AAUIFeatureFlags, "isNewSignInProgressEnabled"))
    goto LABEL_12;
  -[AAUIServiceSignInConfiguration serviceTypes](self->_signInConfig, "serviceTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  if (v16)
  {
    v17 = *MEMORY[0x1E0CFCF18];
    goto LABEL_6;
  }
  -[AAUIServiceSignInConfiguration serviceType](self->_signInConfig, "serviceType");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
LABEL_16:

    goto LABEL_17;
  }
  v4 = (void *)v21;
  -[AAUIServiceSignInConfiguration serviceType](self->_signInConfig, "serviceType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v22;
  v17 = *MEMORY[0x1E0CFCF18];
  if (v22 == (void *)*MEMORY[0x1E0CFCF18])
  {

    goto LABEL_16;
  }
LABEL_6:
  -[AAUIServiceSignInConfiguration serviceTypes](self->_signInConfig, "serviceTypes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", v17);

  if (!v16)
  {

  }
  if ((v19 & 1) == 0)
  {
    _AAUILogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[AAUIServiceSignInController signInViewController:didCompleteWithAuthenticationResults:].cold.2();

LABEL_12:
    -[AAUIServiceSignInController _mainQueue_presentSpinnerViewControllerInParentViewController:withCompletion:](self, "_mainQueue_presentSpinnerViewControllerInParentViewController:withCompletion:", v13, v14);
    goto LABEL_20;
  }
LABEL_17:
  _AAUILogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[AAUIServiceSignInController signInViewController:didCompleteWithAuthenticationResults:].cold.1();

  v14[2](v14);
LABEL_20:

}

uint64_t __89__AAUIServiceSignInController_signInViewController_didCompleteWithAuthenticationResults___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_continueSignInWithAuthenticationResults:parentViewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)signInViewControllerDidCancel:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  id v9;
  AAUIOnboardingSignInController *splitAccountSignInController;
  uint8_t v11[16];

  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Sign in view controller canceled!", v11, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_splitAccountSignInController)
  {
    -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (id)-[NSObject popViewControllerAnimated:](v8, "popViewControllerAnimated:", 1);
    }
    else
    {
      _AAUILogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AAUIServiceSignInController signInViewControllerDidCancel:].cold.1();
    }

    splitAccountSignInController = self->_splitAccountSignInController;
    self->_splitAccountSignInController = 0;

  }
  else
  {
    -[AAUIServiceSignInController _delegate_serviceSignInControllerDidCancel](self, "_delegate_serviceSignInControllerDidCancel");
  }
}

- (void)_delegate_serviceSignInControllerDidCancel
{
  void *v3;
  id v4;

  -[AAUIServiceSignInConfiguration serviceDelegate](self->_signInConfig, "serviceDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceSignInControllerDidCancel:", v3);

  }
}

- (void)signInViewControllerDidSkip:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Sign in view controller skipped!", v7, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUIServiceSignInConfiguration serviceDelegate](self->_signInConfig, "serviceDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceSignInController:didSkipWithReason:", v6, 0);

  }
}

- (void)signInViewControllerDidSelectChildSignIn:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Sign in view controller selected child sign in option", v7, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUIServiceSignInConfiguration serviceDelegate](self->_signInConfig, "serviceDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceSignInController:didSkipWithReason:", v6, 1);

  }
}

- (void)signInViewControllerDidSelectOtherOptions:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  if (-[AAUIServiceSignInConfiguration offeriCloudAMSSplitSignIn](self->_signInConfig, "offeriCloudAMSSplitSignIn", a3)
    && (-[AAUIServiceSignInConfiguration serviceTypes](self->_signInConfig, "serviceTypes"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        !v5))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_OTHER_SIGN_IN_OPTIONS"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_OTHER_SIGN_IN_OPTIONS_USE_MULTIPLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __73__AAUIServiceSignInController_signInViewControllerDidSelectOtherOptions___block_invoke;
    v16[3] = &unk_1EA2DB868;
    v16[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v9, 0, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v13);

    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v11, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v14);

    -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentViewController:animated:completion:", v12, 1, 0);

  }
  else
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AAUIServiceSignInController signInViewControllerDidSelectOtherOptions:].cold.1();
  }

}

uint64_t __73__AAUIServiceSignInController_signInViewControllerDidSelectOtherOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startSplitAcountSignInFlow");
}

- (void)startSplitAcountSignInFlow
{
  AAUIAppleIDSignInConfigSplitAccountiCloud *v3;
  void *v4;
  AAUIOnboardingSignInController *v5;
  AAUIOnboardingSignInController *splitAccountSignInController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AAUIOnboardingSplitSignInDelegate *v12;
  AAUIOnboardingSplitSignInDelegate *splitSignInDelegate;
  AAUIAppleIDSignInConfigSplitAccountiCloud *v14;

  v3 = [AAUIAppleIDSignInConfigSplitAccountiCloud alloc];
  -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AAUIAppleIDSignInConfigSplitAccountiCloud initWithNavController:](v3, "initWithNavController:", v4);

  v5 = -[AAUIOnboardingSignInController initWithSetupSignInConfig:]([AAUIOnboardingSignInController alloc], "initWithSetupSignInConfig:", v14);
  splitAccountSignInController = self->_splitAccountSignInController;
  self->_splitAccountSignInController = v5;

  -[AAUIServiceSignInController authenticationController](self, "authenticationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIOnboardingSignInController serviceController](self->_splitAccountSignInController, "serviceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signInViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAuthenticationController:", v7);

  -[AAUIServiceSignInController _serviceOwnersManager](self, "_serviceOwnersManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIOnboardingSignInController serviceController](self->_splitAccountSignInController, "serviceController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setServiceOwnersManager:", v10);

  v12 = -[AAUIOnboardingSplitSignInDelegate initWithServiceSignInController:]([AAUIOnboardingSplitSignInDelegate alloc], "initWithServiceSignInController:", self);
  splitSignInDelegate = self->_splitSignInDelegate;
  self->_splitSignInDelegate = v12;

  -[AAUIOnboardingSignInController setDelegate:](self->_splitAccountSignInController, "setDelegate:", self->_splitSignInDelegate);
  -[AAUIOnboardingSignInController start](self->_splitAccountSignInController, "start");

}

- (void)willAuthenticateWithContext:(id)a3
{
  id v3;

  -[AAUIServiceSignInConfiguration navigationController](self->_signInConfig, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModalInPresentation:", 1);

}

- (void)_mainQueue_presentSpinnerViewControllerInParentViewController:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a4;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUIServiceSignInController _spinnerViewController](self, "_spinnerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showViewController:sender:", v7, self);

  v8[2]();
}

- (void)_mainQueue_presentAlertForError:(id)a3 inViewController:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0CB34D0];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_MESSAGE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_BUTTON"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", v12, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0DC3448];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __91__AAUIServiceSignInController__mainQueue_presentAlertForError_inViewController_completion___block_invoke;
  v24[3] = &unk_1EA2DC540;
  v25 = v7;
  v22 = v7;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v19, 0, v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v23);

  objc_msgSend(v9, "presentViewController:animated:completion:", v20, 1, 0);
}

uint64_t __91__AAUIServiceSignInController__mainQueue_presentAlertForError_inViewController_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (AKURLBag)akURLBag
{
  return self->akURLBag;
}

- (void)setAkURLBag:(id)a3
{
  objc_storeStrong((id *)&self->akURLBag, a3);
}

- (AIDAServiceOwnerProtocol)serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (void)setServiceOwnersManager:(id)a3
{
  objc_storeStrong((id *)&self->_serviceOwnersManager, a3);
}

- (AAUISignInFlowControllerDelegate)flowControllerDelegate
{
  return self->_flowControllerDelegate;
}

- (void)setFlowControllerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_flowControllerDelegate, a3);
}

- (void)setAuthenticationController:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationController, a3);
}

- (AAUIServiceSignInConfiguration)signInConfig
{
  return self->_signInConfig;
}

- (void)setSignInConfig:(id)a3
{
  objc_storeStrong((id *)&self->_signInConfig, a3);
}

- (void)setSignInViewController:(id)a3
{
  objc_storeStrong((id *)&self->_signInViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInViewController, 0);
  objc_storeStrong((id *)&self->_signInConfig, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_flowControllerDelegate, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->akURLBag, 0);
  objc_storeStrong((id *)&self->_originalPersonaContext, 0);
  objc_storeStrong((id *)&self->_originalPersona, 0);
  objc_storeStrong((id *)&self->_splitSignInDelegate, 0);
  objc_storeStrong((id *)&self->_splitAccountSignInController, 0);
  objc_storeStrong((id *)&self->_spinnerViewController, 0);
  objc_storeStrong((id *)&self->_cdpUIController, 0);
}

void __64__AAUIServiceSignInController__attemptReauthAndSignInToServices__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Service sign in controller encountered authentication error. Loading sign in UI.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_spinnerMessageForService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Invalid service type (%{private}@) provided, please file a radar!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_serviceContextWithResults:parentViewController:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Client provided service context.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __103__AAUIServiceSignInController__mainQueue_continueSignInWithAuthenticationResults_parentViewController___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Failed to sign in to service(s) with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)continueSignInWithAuthenticationResults:viewController:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Sign in attempt for iCloud failed due to incorrect service owners manager type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_delegate_signInControllerDidCompleteWithSuccess:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Attempting to display error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_delegate_signInControllerDidCompleteWithSuccess:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Skipping alert. CDP Error should not be displayed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke_96_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "Presented alert for error %@ from AAUISignInController", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_ERROR, "AAUIServiceSignInController calling deprecated delegate callback for service %@ with error %@", (uint8_t *)&v6, 0x16u);

}

- (void)_attemptSignInForServices:serviceContext:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1DB4ED000, v0, OS_LOG_TYPE_FAULT, "Sign in to cloud service failed because sign in was attempted on an incomplete AIDAServiceOwnersManager", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_attemptSignInForServices:(uint64_t)a3 serviceContext:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[AAUIServiceSignInController _attemptSignInForServices:serviceContext:]";
  OUTLINED_FUNCTION_2_0(&dword_1DB4ED000, a1, a3, "Verifying persona in %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

- (void)signInViewController:didCompleteWithAuthenticationResults:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Determined that cloud service type will be signed in, progress view will be presented automatically", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)signInViewController:didCompleteWithAuthenticationResults:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Not signing into cloud service, directly presenting progress view", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)signInViewControllerDidCancel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Skipped popping the view controller because it's not our sign in controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)signInViewControllerDidSelectOtherOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Unexpected configuration when handling other options callback.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
