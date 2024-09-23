@implementation WDClinicalOnboardingOAuthNavigationViewController

- (WDClinicalOnboardingOAuthNavigationViewController)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (WDClinicalOnboardingOAuthNavigationViewController)initWithContext:(int64_t)a3 onboardingOptions:(unint64_t)a4 sourceIdentifier:(id)a5 profile:(id)a6 existingAccount:(id)a7
{
  id v12;
  id v13;
  id v14;
  WDClinicalAccountOnboardingSession *v15;
  void *v16;
  WDClinicalAccountOnboardingSession *v17;
  WDClinicalOnboardingOAuthNavigationViewController *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = [WDClinicalAccountOnboardingSession alloc];
  +[CHRAnalyticsManager shared](CHRAnalyticsManager, "shared");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[WDClinicalAccountOnboardingSession initWithContext:options:sourceIdentifier:profile:analyticsManager:](v15, "initWithContext:options:sourceIdentifier:profile:analyticsManager:", a3, a4, v14, v13, v16);

  v18 = -[WDClinicalOnboardingOAuthNavigationViewController initWithSession:existingAccount:](self, "initWithSession:existingAccount:", v17, v12);
  return v18;
}

- (WDClinicalOnboardingOAuthNavigationViewController)initWithSession:(id)a3 existingAccount:(id)a4
{
  id v7;
  id v8;
  WDClinicalOnboardingOAuthNavigationViewController *v9;
  WDClinicalOnboardingOAuthNavigationViewController *v10;
  uint64_t v11;
  HKClinicalAccount *onboardingAccount;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WDClinicalOnboardingOAuthNavigationViewController;
  v9 = -[WDClinicalOnboardingOAuthNavigationViewController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_onboardingSession, a3);
    v11 = objc_msgSend(v8, "copy");
    onboardingAccount = v10->_onboardingAccount;
    v10->_onboardingAccount = (HKClinicalAccount *)v11;

    -[WDClinicalOnboardingOAuthNavigationViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 2);
  }

  return v10;
}

- (HRProfile)profile
{
  return -[WDClinicalAccountOnboardingSession profile](self->_onboardingSession, "profile");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDClinicalOnboardingOAuthNavigationViewController;
  -[HKNavigationController viewDidLoad](&v7, sel_viewDidLoad);
  +[HRProfileManager sharedInstance](HRProfileManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingOAuthNavigationViewController profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switchCurrentProfileWithIdentifier:", v6);

  -[WDClinicalOnboardingOAuthNavigationViewController createRootViewController](self, "createRootViewController");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDClinicalOnboardingOAuthNavigationViewController;
  -[HKNavigationController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[WDClinicalOnboardingOAuthNavigationViewController beginListeningToNotification](self, "beginListeningToNotification");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WDClinicalOnboardingOAuthNavigationViewController;
  -[WDClinicalOnboardingOAuthNavigationViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  if ((-[WDClinicalOnboardingOAuthNavigationViewController isMovingFromParentViewController](self, "isMovingFromParentViewController") & 1) != 0|| -[WDClinicalOnboardingOAuthNavigationViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    -[WDClinicalAccountOnboardingSession onboardingWillDisappearWith:animated:](self->_onboardingSession, "onboardingWillDisappearWith:animated:", self->_onboardingTileNavigationViewController, v3);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[WDClinicalOnboardingOAuthNavigationViewController stopListeningToNotification](self, "stopListeningToNotification");
  v5.receiver = self;
  v5.super_class = (Class)WDClinicalOnboardingOAuthNavigationViewController;
  -[HKNavigationController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel__dismissViewController);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)beginListeningToNotification
{
  void *v3;
  id v4;

  -[WDClinicalOnboardingOAuthNavigationViewController stopListeningToNotification](self, "stopListeningToNotification");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "OAuthCompletionNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_completionNotificationHandler_, v3, 0);

}

- (void)stopListeningToNotification
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "OAuthCompletionNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v3, 0);

}

- (void)completionNotificationHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__WDClinicalOnboardingOAuthNavigationViewController_completionNotificationHandler___block_invoke;
  v6[3] = &unk_1E74D1A90;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __83__WDClinicalOnboardingOAuthNavigationViewController_completionNotificationHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_completionNotificationHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_mainQueue_completionNotificationHandler:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  WDClinicalOnboardingOAuthNavigationViewController *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  _HKInitializeLogging();
  v5 = (NSObject **)MEMORY[0x1E0CB52D8];
  v6 = *MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543362;
    v18 = self;
    _os_log_impl(&dword_1BC30A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: got notified by OAuthCompletionNotification", (uint8_t *)&v17, 0xCu);
  }
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAuthCompletionNotificationUserInfoKeys account](_TtC15HealthRecordsUI39OAuthCompletionNotificationUserInfoKeys, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[OAuthCompletionNotificationUserInfoKeys error](_TtC15HealthRecordsUI39OAuthCompletionNotificationUserInfoKeys, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WDClinicalOnboardingOAuthNavigationViewController didLoginToAccount:](self, "didLoginToAccount:", v9);
  }
  else
  {
    -[WDClinicalOnboardingOAuthNavigationViewController _clearLoginBusyIndicator](self, "_clearLoginBusyIndicator");
    _HKInitializeLogging();
    v13 = *v5;
    v14 = *v5;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[WDClinicalOnboardingOAuthNavigationViewController _mainQueue_completionNotificationHandler:].cold.1((uint64_t)self, v13);
      +[HRViewControllerFactory shared](HRViewControllerFactory, "shared");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "makeFailedToOnboardAccountAlertControllerToGateway:error:", 0, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[WDClinicalOnboardingOAuthNavigationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = self;
      _os_log_impl(&dword_1BC30A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: user aborted login (neither account nor error in the notification)", (uint8_t *)&v17, 0xCu);
    }
  }

}

- (void)createRootViewController
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  WDClinicalOnboardingOAuthNavigationViewController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[WDClinicalOnboardingOAuthNavigationViewController _createInitialRootViewController](self, "_createInitialRootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1BC30A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: created initial root view controller %{public}@", buf, 0x16u);
  }
  v6 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingOAuthNavigationViewController setViewControllers:](self, "setViewControllers:", v5);

}

- (id)_createInitialRootViewController
{
  WDClinicalProviderDetailsViewController *v3;
  void *v4;
  void *v5;
  HRClinicalSharingOnboardingInformationalViewController *v6;
  void *v7;
  void *v8;
  HKClinicalAccount *onboardingAccount;
  uint64_t v10;
  void *v11;
  WDClinicalOnboardingViewController *v12;
  void *v13;
  void *v14;

  if (self->_providerToPresent)
  {
    v3 = [WDClinicalProviderDetailsViewController alloc];
    -[WDClinicalOnboardingOAuthNavigationViewController profile](self, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDClinicalOnboardingOAuthNavigationViewController providerToPresent](self, "providerToPresent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WDClinicalProviderDetailsViewController initWithProfile:provider:](v3, "initWithProfile:provider:", v4, v5);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__dismissViewController);
    -[OBBaseWelcomeController navigationItem](v6, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:", v7);

LABEL_14:
    return v6;
  }
  if (!-[WDClinicalAccountOnboardingSession shouldLaunchClinicalSharing](self->_onboardingSession, "shouldLaunchClinicalSharing"))
  {
    -[WDClinicalOnboardingOAuthNavigationViewController gatewayProxyToTry](self, "gatewayProxyToTry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = [WDClinicalOnboardingViewController alloc];
    -[WDClinicalOnboardingOAuthNavigationViewController profile](self, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[WDClinicalOnboardingOAuthNavigationViewController gatewayProxyToTry](self, "gatewayProxyToTry");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WDClinicalOnboardingViewController initWithProfile:gatewayProxy:](v12, "initWithProfile:gatewayProxy:", v13, v14);

      -[WDClinicalOnboardingOAuthNavigationViewController setGatewayProxyToTry:](self, "setGatewayProxyToTry:", 0);
    }
    else
    {
      v6 = -[WDClinicalOnboardingViewController initWithProfile:](v12, "initWithProfile:", v13);

      -[HRClinicalSharingOnboardingInformationalViewController setShowProviderNotFound:](v6, "setShowProviderNotFound:", -[WDClinicalOnboardingOAuthNavigationViewController showProviderNotFound](self, "showProviderNotFound"));
    }
    -[OBBaseWelcomeController navigationItem](v6, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLargeTitleDisplayMode:", 2);
    goto LABEL_14;
  }
  onboardingAccount = self->_onboardingAccount;
  if (onboardingAccount)
  {
    if (-[HKClinicalAccount needsLoginToEnableClinicalSharing](onboardingAccount, "needsLoginToEnableClinicalSharing"))
      v10 = 1;
    else
      v10 = 2;
  }
  else
  {
    v10 = 0;
  }
  v6 = -[HRClinicalSharingOnboardingInformationalViewController initWithOnboardingSession:flowType:selectedAccount:delegate:]([HRClinicalSharingOnboardingInformationalViewController alloc], "initWithOnboardingSession:flowType:selectedAccount:delegate:", self->_onboardingSession, v10, self->_onboardingAccount, self);
  return v6;
}

- (void)_clearLoginBusyIndicator
{
  void *v3;
  char isKindOfClass;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  WDClinicalOnboardingOAuthNavigationViewController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[WDClinicalOnboardingOAuthNavigationViewController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB52D8];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_INFO);
  if ((isKindOfClass & 1) != 0)
  {
    if (v6)
    {
      v7 = 138543618;
      v8 = self;
      v9 = 2114;
      v10 = v3;
      _os_log_impl(&dword_1BC30A000, v5, OS_LOG_TYPE_INFO, "%{public}@: finished login, clearing busy indicator from %{public}@", (uint8_t *)&v7, 0x16u);
    }
    objc_msgSend(v3, "clearLoginBusyIndicator");
  }
  else if (v6)
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1BC30A000, v5, OS_LOG_TYPE_INFO, "%{public}@: finished login but top view controller is %{public}@, not , unable to clear busy indicator", (uint8_t *)&v7, 0x16u);
  }

}

- (void)didLoginToAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  WDClinicalAccountAddedViewController *v10;
  uint64_t v11;
  id v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  WDClinicalAccountAddedViewController **v17;
  void *v18;
  WDClinicalAccountOnboardingSession *onboardingSession;
  NSObject *v20;
  void *v21;
  void *v22;
  WDClinicalAccountOnboardingSession *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  _BOOL4 v29;
  WDClinicalAccountOnboardingSession *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  WDClinicalAccountAddedViewController *v35;
  _QWORD v36[5];
  id v37;
  WDClinicalAccountAddedViewController *v38;
  uint8_t buf[4];
  WDClinicalOnboardingOAuthNavigationViewController *v40;
  __int16 v41;
  void *v42;
  WDClinicalAccountAddedViewController *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[WDClinicalAccountOnboardingSession shouldLaunchClinicalSharing](self->_onboardingSession, "shouldLaunchClinicalSharing")|| (objc_msgSend(v4, "gateway"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "canEnableSharingToProvider"), v5, !v6))
  {
    v10 = -[WDClinicalAccountAddedViewController initWithOnboardingSession:account:]([WDClinicalAccountAddedViewController alloc], "initWithOnboardingSession:account:", self->_onboardingSession, v4);
    v11 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke;
    v36[3] = &unk_1E74D1A90;
    v36[4] = self;
    v12 = v4;
    v37 = v12;
    -[WDClinicalAccountAddedViewController setDismissHandler:](v10, "setDismissHandler:", v36);
    if (objc_msgSend(v12, "canEnableSharingToProvider"))
    {
      v13 = objc_msgSend(v12, "hasClinicalSharingScopes");
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB52D8];
      v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          *(_DWORD *)buf = 138543362;
          v40 = self;
          _os_log_impl(&dword_1BC30A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: did log in but may proceed to clinical sharing, not storing account just yet", buf, 0xCu);
        }
        v43 = v10;
        v16 = (void *)MEMORY[0x1E0C99D20];
        v17 = &v43;
        goto LABEL_22;
      }
      if (v15)
      {
        *(_DWORD *)buf = 138543362;
        v40 = self;
        _os_log_impl(&dword_1BC30A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: did log in to a gateway supporting clinical sharing, but don't have the necessary scopes, proceeding as if logging in to a non-clinical-sharing gateway", buf, 0xCu);
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      _HKInitializeLogging();
      v18 = (void *)*MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEFAULT))
      {
        onboardingSession = self->_onboardingSession;
        v20 = v18;
        -[WDClinicalAccountOnboardingSession profile](onboardingSession, "profile");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "clinicalAccountStore");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = self;
        v41 = 2114;
        v42 = v22;
        _os_log_impl(&dword_1BC30A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: did log in, persisting account and kicking off ingestion on %{public}@", buf, 0x16u);

      }
      v23 = self->_onboardingSession;
      v34[0] = v11;
      v34[1] = 3221225472;
      v34[2] = __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke_213;
      v34[3] = &unk_1E74D22B0;
      v34[4] = self;
      v35 = v10;
      -[WDClinicalAccountOnboardingSession persistEphemeralAccount:fromSharing:completion:](v23, "persistEphemeralAccount:fromSharing:completion:", v12, 0, v34);

      goto LABEL_26;
    }
    objc_msgSend(v12, "gateway");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "baseURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "absoluteString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("https://localhost:9090/resource"));

    _HKInitializeLogging();
    v28 = *MEMORY[0x1E0CB52D8];
    v29 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEFAULT);
    if (!v27)
    {
      if (v29)
      {
        *(_DWORD *)buf = 138543362;
        v40 = self;
        _os_log_impl(&dword_1BC30A000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: account re-logged in. How did you get here? File a Radar to CHR Ingest & Extract if you see me!", buf, 0xCu);
      }
      -[WDClinicalOnboardingOAuthNavigationViewController dismissWithAccount:error:animated:](self, "dismissWithAccount:error:animated:", v12, 0, 1);
      goto LABEL_26;
    }
    if (v29)
    {
      *(_DWORD *)buf = 138543362;
      v40 = self;
      _os_log_impl(&dword_1BC30A000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: static sample account added", buf, 0xCu);
    }
    v30 = self->_onboardingSession;
    objc_msgSend(v12, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDClinicalAccountOnboardingSession didAddStaticSampleAccount:](v30, "didAddStaticSampleAccount:", v31);

    v38 = v10;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = &v38;
LABEL_22:
    objc_msgSend(v16, "arrayWithObjects:count:", v17, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDClinicalOnboardingOAuthNavigationViewController setViewControllers:animated:](self, "setViewControllers:animated:", v32, 1);

LABEL_26:
    goto LABEL_31;
  }
  v7 = objc_msgSend(v4, "hasClinicalSharingScopes");
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB52D8];
  v9 = *MEMORY[0x1E0CB52D8];
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = self;
      _os_log_impl(&dword_1BC30A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: did log in but onboarding for clinical sharing, not storing account just yet", buf, 0xCu);
    }
    -[WDClinicalAccountOnboardingSession makeDataTypeSelectionViewControllerForAccount:](self->_onboardingSession, "makeDataTypeSelectionViewControllerForAccount:", v4);
    v10 = (WDClinicalAccountAddedViewController *)objc_claimAutoreleasedReturnValue();
    -[WDClinicalAccountOnboardingSession submitClinicalSharingOnboardingStepAnalytic:](self->_onboardingSession, "submitClinicalSharingOnboardingStepAnalytic:", 2);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WDClinicalOnboardingOAuthNavigationViewController didLoginToAccount:].cold.1((uint64_t)self, v8);
    -[WDClinicalAccountOnboardingSession makeNecessaryScopesNotPresentViewControllerForAccount:](self->_onboardingSession, "makeNecessaryScopesNotPresentViewControllerForAccount:", v4);
    v10 = (WDClinicalAccountAddedViewController *)objc_claimAutoreleasedReturnValue();
  }
  v44[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingOAuthNavigationViewController setViewControllers:animated:](self, "setViewControllers:animated:", v33, 1);

LABEL_31:
}

uint64_t __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWithAccount:error:animated:", *(_QWORD *)(a1 + 40), 0, 1);
}

void __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke_213(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke_2;
  v11[3] = &unk_1E74D1288;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v14 = v8;
  v15 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    v8[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setViewControllers:animated:", v3, 1);
  }
  else
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke_2_cold_1(a1, v4);
    +[HRViewControllerFactory shared](HRViewControllerFactory, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(v5, "makeFailedToOnboardAccountAlertControllerToGateway:error:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:userInfo:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "makeFailedToOnboardAccountAlertControllerToGateway:error:", 0, v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v3, 1, 0);
  }

}

- (void)dismissWithAccount:(id)a3 error:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  void **v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[2];

  v5 = a5;
  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    +[ClinicalAccountOnboardingCompletionNotificationUserInfoKeys error](_TtC15HealthRecordsUI59ClinicalAccountOnboardingCompletionNotificationUserInfoKeys, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    v23[0] = v9;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = (id *)v23;
    v13 = &v22;
  }
  else
  {
    if (!v8)
    {
      v14 = 0;
      goto LABEL_6;
    }
    +[ClinicalAccountOnboardingCompletionNotificationUserInfoKeys account](_TtC15HealthRecordsUI59ClinicalAccountOnboardingCompletionNotificationUserInfoKeys, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v10;
    v21 = v8;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v21;
    v13 = &v20;
  }
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  v15 = (void *)MEMORY[0x1E0CB37C0];
  objc_msgSend(MEMORY[0x1E0CB37C0], "ClinicalAccountOnboardingCompletionNotification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "notificationWithName:object:userInfo:", v16, self, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotification:", v17);

  -[WDClinicalAccountOnboardingSession markShouldDismissOnboardingTileViewController](self->_onboardingSession, "markShouldDismissOnboardingTileViewController");
  -[WDClinicalOnboardingOAuthNavigationViewController presentingViewController](self, "presentingViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dismissViewControllerAnimated:completion:", v5, 0);

}

- (void)_dismissViewController
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 7, CFSTR("User Cancelled"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingOAuthNavigationViewController dismissWithAccount:error:animated:](self, "dismissWithAccount:error:animated:", 0, v3, 1);

}

- (void)didCompleteOnboardingFor:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  int v9;
  WDClinicalOnboardingOAuthNavigationViewController *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_onboardingDelegate);
    v9 = 138543874;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = WeakRetained;
    _os_log_impl(&dword_1BC30A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didCompleteOnboardingFor %@ _onboardingDelegate %@", (uint8_t *)&v9, 0x20u);

  }
  v8 = objc_loadWeakRetained((id *)&self->_onboardingDelegate);
  objc_msgSend(v8, "didAddAccount:", v4);

}

- (ClinicalSharingOnboardingDelegate)onboardingDelegate
{
  return (ClinicalSharingOnboardingDelegate *)objc_loadWeakRetained((id *)&self->_onboardingDelegate);
}

- (void)setOnboardingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_onboardingDelegate, a3);
}

- (HKClinicalProvider)providerToPresent
{
  return self->_providerToPresent;
}

- (void)setProviderToPresent:(id)a3
{
  objc_storeStrong((id *)&self->_providerToPresent, a3);
}

- (WDClinicalGatewayProxy)gatewayProxyToTry
{
  return self->_gatewayProxyToTry;
}

- (void)setGatewayProxyToTry:(id)a3
{
  objc_storeStrong((id *)&self->_gatewayProxyToTry, a3);
}

- (BOOL)showProviderNotFound
{
  return self->_showProviderNotFound;
}

- (void)setShowProviderNotFound:(BOOL)a3
{
  self->_showProviderNotFound = a3;
}

- (BOOL)onboardingSourceIsDeepLink
{
  return self->_onboardingSourceIsDeepLink;
}

- (void)setOnboardingSourceIsDeepLink:(BOOL)a3
{
  self->_onboardingSourceIsDeepLink = a3;
}

- (HKNavigationController)onboardingTileNavigationViewController
{
  return self->_onboardingTileNavigationViewController;
}

- (void)setOnboardingTileNavigationViewController:(id)a3
{
  self->_onboardingTileNavigationViewController = (HKNavigationController *)a3;
}

- (WDClinicalAccountOnboardingSession)onboardingSession
{
  return self->_onboardingSession;
}

- (HKClinicalAccount)onboardingAccount
{
  return self->_onboardingAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingAccount, 0);
  objc_storeStrong((id *)&self->_onboardingSession, 0);
  objc_storeStrong((id *)&self->_gatewayProxyToTry, 0);
  objc_storeStrong((id *)&self->_providerToPresent, 0);
  objc_destroyWeak((id *)&self->_onboardingDelegate);
}

- (void)_mainQueue_completionNotificationHandler:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSensitiveLogItem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v4;
  OUTLINED_FUNCTION_9(&dword_1BC30A000, v3, v5, "%{public}@: login failed with error: %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_3();
}

- (void)didLoginToAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1BC30A000, a2, OS_LOG_TYPE_ERROR, "%{public}@: did log in for clinical sharing but do not have the necessary scopes", (uint8_t *)&v2, 0xCu);
}

void __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = a2;
  HKSensitiveLogItem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v2;
  v8 = 2114;
  v9 = v4;
  OUTLINED_FUNCTION_9(&dword_1BC30A000, v3, v5, "%{public}@: persisting account failed with error: %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_3();
}

@end
