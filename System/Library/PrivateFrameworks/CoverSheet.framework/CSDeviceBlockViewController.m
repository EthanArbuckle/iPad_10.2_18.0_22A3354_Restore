@implementation CSDeviceBlockViewController

- (CSDeviceBlockViewController)initWithDeviceBlockStatusProvider:(id)a3
{
  id v5;
  CSDeviceBlockViewController *v6;
  CSDeviceBlockViewController *v7;
  ACAccountStore *v8;
  ACAccountStore *accountStore;
  uint64_t v10;
  CSLockScreenSettings *lockScreenSettings;
  CSDevicePasscodeRecoveryService *v12;
  CSDevicePasscodeRecoveryService *passcodeRecovery;
  nw_path_monitor_t v14;
  OS_nw_path_monitor *networkPathMonitor;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *networkMonitorQueue;
  void *v19;
  _QWORD *v20;
  void *v21;
  objc_super v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CSDeviceBlockViewController;
  v6 = -[CSDeviceBlockViewController init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_blockStatusProvider, a3);
    v8 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v7->_accountStore;
    v7->_accountStore = v8;

    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v10 = objc_claimAutoreleasedReturnValue();
    lockScreenSettings = v7->_lockScreenSettings;
    v7->_lockScreenSettings = (CSLockScreenSettings *)v10;

    v12 = objc_alloc_init(CSDevicePasscodeRecoveryService);
    passcodeRecovery = v7->_passcodeRecovery;
    v7->_passcodeRecovery = v12;

    v14 = nw_path_monitor_create();
    networkPathMonitor = v7->_networkPathMonitor;
    v7->_networkPathMonitor = (OS_nw_path_monitor *)v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.CoverSheet.deviceBlock", v16);
    networkMonitorQueue = v7->_networkMonitorQueue;
    v7->_networkMonitorQueue = (OS_dispatch_queue *)v17;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v20 = (_QWORD *)getAAUIDeviceLocatorStateDidChangeNotificationSymbolLoc_ptr;
    v27 = getAAUIDeviceLocatorStateDidChangeNotificationSymbolLoc_ptr;
    if (!getAAUIDeviceLocatorStateDidChangeNotificationSymbolLoc_ptr)
    {
      v21 = (void *)AppleAccountUILibrary();
      v20 = dlsym(v21, "AAUIDeviceLocatorStateDidChangeNotification");
      v25[3] = (uint64_t)v20;
      getAAUIDeviceLocatorStateDidChangeNotificationSymbolLoc_ptr = (uint64_t)v20;
    }
    _Block_object_dispose(&v24, 8);
    if (!v20)
      -[CSDeviceBlockViewController initWithDeviceBlockStatusProvider:].cold.1();
    objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel__handleDeviceLocatorStateDidChange_, *v20, 0);

    -[CSDeviceBlockViewController _setUpNetworkPathMonitor](v7, "_setUpNetworkPathMonitor");
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBFDeviceBlockTimer invalidate](self->_blockTimer, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)CSDeviceBlockViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v4, sel_dealloc);
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (id)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSDeviceBlockViewController;
  -[CSModalViewControllerBase view](&v3, sel_view);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)viewIfLoaded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSDeviceBlockViewController;
  -[CSModalViewControllerBase viewIfLoaded](&v3, sel_viewIfLoaded);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewDidLoad
{
  SBFDeviceBlockTimer *v3;
  SBFDeviceBlockTimer *blockTimer;
  SBFDeviceBlockTimer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  id location;

  v3 = (SBFDeviceBlockTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9DF0]), "initWithDeviceBlockStatusProvider:", self->_blockStatusProvider);
  blockTimer = self->_blockTimer;
  self->_blockTimer = v3;

  objc_initWeak(&location, self);
  v5 = self->_blockTimer;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __42__CSDeviceBlockViewController_viewDidLoad__block_invoke;
  v19[3] = &unk_1E8E2E868;
  objc_copyWeak(&v20, &location);
  -[SBFDeviceBlockTimer setHandler:](v5, "setHandler:", v19);
  -[CSDeviceBlockViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeviceBlockDelegate:", self);
  -[SBFDeviceBlockTimer titleText](self->_blockTimer, "titleText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleText:", v7);

  -[SBFDeviceBlockTimer subtitleText](self->_blockTimer, "subtitleText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSubtitleText:", v8);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DASHBOARD_BLOCK_ERASE_LINK"), &stru_1E8E30B28, CFSTR("CoverSheet"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondarySubtitleText:", v10);

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB538], 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverrideSecondarySubtitleFont:", v12);

  objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverrideSecondarySubtitleTextColor:", v13);

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v15 != 1)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DASHBOARD_BLOCK_EMERGENCY_BUTTON"), &stru_1E8E30B28, CFSTR("CoverSheet"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSecondaryActionButtonText:", v17);

  }
LABEL_6:
  v18.receiver = self;
  v18.super_class = (Class)CSDeviceBlockViewController;
  -[CSModalViewControllerBase viewDidLoad](&v18, sel_viewDidLoad);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __42__CSDeviceBlockViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateText");
    objc_msgSend(v3, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateViewForUnblockDeviceView");

    WeakRetained = v3;
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSDeviceBlockViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SBFDeviceBlockTimer invalidate](self->_blockTimer, "invalidate");
}

- (void)aggregateAppearance:(id)a3
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CSDeviceBlockViewController;
  v4 = a3;
  -[CSModalViewControllerBase aggregateAppearance:](&v16, sel_aggregateAppearance_, v4);
  +[CSComponent homeAffordance](CSComponent, "homeAffordance", v16.receiver, v16.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "priority:", 80);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hidden:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v9);

  +[CSComponent proudLock](CSComponent, "proudLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "priority:", 80);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hidden:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v12);

  +[CSComponent whitePoint](CSComponent, "whitePoint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "priority:", 80);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hidden:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v15);

}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[CSDeviceBlockViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isShowingAuthenticationView") & 1) != 0)
  {
    v6 = 9;
  }
  else
  {
    -[CSDeviceBlockViewController viewIfLoaded](self, "viewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isShowingUnblockDeviceView") & 1) != 0 || self->_attemptingErase)
    {
      v6 = 9;
    }
    else if (self->_attemptingRecovery)
    {
      v6 = 9;
    }
    else
    {
      v6 = 0;
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)CSDeviceBlockViewController;
  -[CSModalViewControllerBase aggregateBehavior:](&v8, sel_aggregateBehavior_, v4);
  objc_msgSend(v4, "addRestrictedCapabilities:", 1048632);
  objc_msgSend(v4, "setIdleTimerDuration:", v6);

}

- (int64_t)presentationPriority
{
  return 570;
}

- (void)handleSecondaryActionForView:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  if (!-[CSDeviceBlockViewController _shouldShowUnblockDeviceButton](self, "_shouldShowUnblockDeviceButton", a3))
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      +[CSAction actionWithType:](CSAction, "actionWithType:", 2);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v6);

    }
  }
}

- (void)handleEmergencyButtonAction
{
  id v3;

  +[CSAction actionWithType:](CSAction, "actionWithType:", 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v3);

}

- (void)authViewController:(id)a3 didConfirmEraseAfterAuthenticationWithResults:(id)a4 shouldEraseDataPlan:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  CSEraseDeviceAuthViewController *v9;
  NSObject *v10;
  const __CFString *v11;
  CSEraseDeviceAuthViewController *authenticationViewController;
  void *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v5 = a5;
  v16 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (CSEraseDeviceAuthViewController *)a3;
  SBLogDashBoard();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v5)
      v11 = CFSTR("YES");
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_1D0337000, v10, OS_LOG_TYPE_DEFAULT, "Device erase attempt confirmed after authentication, will erase data plan: %@", (uint8_t *)&v14, 0xCu);
  }

  authenticationViewController = self->_authenticationViewController;
  if (authenticationViewController == v9)
  {
    self->_shouldEraseDataPlan = v5;
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount aa_setPassword:](self->_findMyAccount, "aa_setPassword:", v13);
    -[CSDeviceBlockViewController _attemptErase](self, "_attemptErase");

  }
}

- (void)authViewControllerDidCancelToEraseDeviceAfterAuthentication:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_authenticationViewController == a3)
  {
    SBLogDashBoard();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "Device erase attempt canceled after authentication", v4, 2u);
    }

  }
}

- (void)cancelButtonTapped
{
  void *v3;
  void *v4;
  CSEraseDeviceAuthViewController *authenticationViewController;
  uint64_t v6;
  CSDeviceUnblockViewController *deviceUnblockViewController;
  _QWORD v8[4];
  id v9;
  CSDeviceBlockViewController *v10;
  _QWORD v11[4];
  id v12;
  CSDeviceBlockViewController *v13;

  -[CSDeviceBlockViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  authenticationViewController = self->_authenticationViewController;
  v6 = MEMORY[0x1E0C809B0];
  if (authenticationViewController)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__CSDeviceBlockViewController_cancelButtonTapped__block_invoke;
    v11[3] = &unk_1E8E2DF58;
    v12 = v3;
    v13 = self;
    -[CSDeviceBlockViewController bs_removeChildViewController:animated:transitionBlock:](self, "bs_removeChildViewController:animated:transitionBlock:", authenticationViewController, 0, v11);

  }
  deviceUnblockViewController = self->_deviceUnblockViewController;
  if (deviceUnblockViewController)
  {
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __49__CSDeviceBlockViewController_cancelButtonTapped__block_invoke_2;
    v8[3] = &unk_1E8E2DF58;
    v9 = v4;
    v10 = self;
    -[CSDeviceBlockViewController bs_removeChildViewController:animated:transitionBlock:](self, "bs_removeChildViewController:animated:transitionBlock:", deviceUnblockViewController, 0, v8);

  }
}

void __49__CSDeviceBlockViewController_cancelButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void (**v6)(void);

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "setAuthenticationView:", 0);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 1048);
  *(_QWORD *)(v4 + 1048) = 0;

  v6[2]();
}

void __49__CSDeviceBlockViewController_cancelButtonTapped__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void (**v6)(void);

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "setUnblockDeviceView:", 0);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 1056);
  *(_QWORD *)(v4 + 1056) = 0;

  v6[2]();
}

- (void)deviceUnblockViewModelHandleDidRequestCancel
{
  void *v3;
  void *v4;
  CSDeviceUnblockViewController *deviceUnblockViewController;
  _QWORD v6[5];
  id v7;

  -[CSDeviceBlockViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  deviceUnblockViewController = self->_deviceUnblockViewController;
  if (deviceUnblockViewController)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__CSDeviceBlockViewController_deviceUnblockViewModelHandleDidRequestCancel__block_invoke;
    v6[3] = &unk_1E8E2DF58;
    v6[4] = self;
    v7 = v3;
    -[CSDeviceBlockViewController bs_removeChildViewController:animated:transitionBlock:](self, "bs_removeChildViewController:animated:transitionBlock:", deviceUnblockViewController, 0, v6);

  }
}

void __75__CSDeviceBlockViewController_deviceUnblockViewModelHandleDidRequestCancel__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void (**v6)(void);

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "_updateText");
  objc_msgSend(*(id *)(a1 + 40), "setUnblockDeviceView:", 0);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1056);
  *(_QWORD *)(v4 + 1056) = 0;

  objc_msgSend(*(id *)(a1 + 32), "rebuildBehavior");
  v6[2]();

}

- (void)_presentUnblockDeviceViewController
{
  void *v3;
  void *v4;
  int v5;
  __objc2_class **v6;
  void *v7;
  CSDeviceUnblockViewController *v8;
  CSDeviceUnblockViewController *deviceUnblockViewController;
  CSDeviceUnblockViewController *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  CSDeviceBlockViewController *v17;

  if (_presentUnblockDeviceViewController_onceToken != -1)
    dispatch_once(&_presentUnblockDeviceViewController_onceToken, &__block_literal_global_18);
  dispatch_async((dispatch_queue_t)_presentUnblockDeviceViewController_forgotPasscodeEventQueue, &__block_literal_global_61);
  -[CSDeviceBlockViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDeviceBlockViewController _unblockPolicy](self, "_unblockPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canUnblockDeviceUsingRecovery");
  v6 = off_1E8E2C5C8;
  if (!v5)
    v6 = off_1E8E2C568;
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithUnblockPolicy:blockViewController:", v4, self);
  v8 = -[CSDeviceUnblockViewController initWithViewModel:]([CSDeviceUnblockViewController alloc], "initWithViewModel:", v7);
  deviceUnblockViewController = self->_deviceUnblockViewController;
  self->_deviceUnblockViewController = v8;

  v10 = self->_deviceUnblockViewController;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __66__CSDeviceBlockViewController__presentUnblockDeviceViewController__block_invoke_3;
  v15 = &unk_1E8E2DF58;
  v16 = v3;
  v17 = self;
  v11 = v3;
  -[CSDeviceBlockViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v10, 0, &v12);
  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance", v12, v13, v14, v15);
  objc_msgSend(v11, "setNeedsLayout");

}

void __66__CSDeviceBlockViewController__presentUnblockDeviceViewController__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.springboard.mobilekeybag.forgotPasscodeEvent", v2);
  v1 = (void *)_presentUnblockDeviceViewController_forgotPasscodeEventQueue;
  _presentUnblockDeviceViewController_forgotPasscodeEventQueue = (uint64_t)v0;

}

uint64_t __66__CSDeviceBlockViewController__presentUnblockDeviceViewController__block_invoke_2()
{
  return MKBForgottenPasscodeEvent();
}

void __66__CSDeviceBlockViewController__presentUnblockDeviceViewController__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 1056);
  v9 = a2;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUnblockDeviceView:", v5);

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 1056);
  objc_msgSend(*(id *)(v6 + 1072), "timeoutText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeoutString:", v8);

  objc_msgSend(*(id *)(a1 + 40), "rebuildBehavior");
  v9[2]();

}

- (void)_presentAuthenticationViewController
{
  void *v3;
  CSEraseDeviceAuthViewController *v4;
  CSEraseDeviceAuthViewController *authenticationViewController;
  CSEraseDeviceAuthViewController *v6;
  _QWORD v7[4];
  id v8;
  CSDeviceBlockViewController *v9;
  id v10;
  id location;

  -[CSDeviceBlockViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_authenticationViewController)
  {
    v4 = objc_alloc_init(CSEraseDeviceAuthViewController);
    authenticationViewController = self->_authenticationViewController;
    self->_authenticationViewController = v4;

    -[CSEraseDeviceAuthViewController setDelegate:](self->_authenticationViewController, "setDelegate:", self);
    objc_initWeak(&location, self);
    v6 = self->_authenticationViewController;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__CSDeviceBlockViewController__presentAuthenticationViewController__block_invoke;
    v7[3] = &unk_1E8E2FE90;
    objc_copyWeak(&v10, &location);
    v8 = v3;
    v9 = self;
    -[CSDeviceBlockViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v6, 0, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __67__CSDeviceBlockViewController__presentAuthenticationViewController__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  SEL v21;
  void (**v22)(void);

  v22 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAuthenticationView:", v5);

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    v8 = v7 & 0xFFFFFFFFFFFFFFFBLL;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 == 1)
      v11 = CFSTR("DASHBOARD_BLOCK_ERASE_AUTH_MESSAGE_PAD");
    else
      v11 = CFSTR("DASHBOARD_BLOCK_ERASE_AUTH_MESSAGE_PHONE");
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E8E30B28, CFSTR("CoverSheet"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = *(id **)(a1 + 40);
    objc_msgSend(v14[139], "aa_primaryEmail");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_obfuscateUsername:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v12, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "setSubtitleLabelText:", v17);
    v18 = objc_alloc_init(MEMORY[0x1E0D002F8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1112), "username");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setUsername:", v19);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1112), "aa_altDSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAltDSID:", v20);

    objc_msgSend(v18, "setAuthenticationType:", 2);
    objc_msgSend(v18, "setShouldPromptForPasswordOnly:", 1);
    objc_msgSend(v18, "setIsEphemeral:", 1);
    objc_msgSend(v18, "setIsUsernameEditable:", 0);
    objc_msgSend(v18, "setMaximumLoginAttempts:", 2);
    v21 = NSSelectorFromString(CFSTR("setAllowAuthenticationBeforeFirstUnlock:"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      ((void (*)(id, SEL, uint64_t))objc_msgSend(v18, "methodForSelector:", v21))(v18, v21, 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "setAuthContext:", v18);
    objc_msgSend(WeakRetained, "rebuildBehavior");
    v22[2]();

  }
}

- (void)_updateText
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  -[CSDeviceBlockViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFDeviceBlockTimer subtitleText](self->_blockTimer, "subtitleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubtitleText:", v4);

  if (_os_feature_enabled_impl())
  {
    v5 = -[CSDeviceBlockViewController _shouldShowUnblockDeviceButton](self, "_shouldShowUnblockDeviceButton");
    -[CSDeviceBlockViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "addDeviceUnblockButtons");
    else
      objc_msgSend(v6, "removeDeviceUnblockButtons");

  }
}

- (void)_handleDeviceLocatorStateDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CSDeviceBlockViewController__handleDeviceLocatorStateDidChange___block_invoke;
  block[3] = &unk_1E8E2DB38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __66__CSDeviceBlockViewController__handleDeviceLocatorStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "_isFindMyChangingState") & 1) == 0)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088);
    if (v2)
    {
      (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 1088);
      *(_QWORD *)(v3 + 1088) = 0;

    }
  }
}

- (void)_attemptErase
{
  ACAccount *findMyAccount;
  _QWORD v4[4];
  id v5;
  id location;

  if (_os_feature_enabled_impl())
  {
    self->_attemptingErase = 1;
    -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
    objc_initWeak(&location, self);
    findMyAccount = self->_findMyAccount;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __44__CSDeviceBlockViewController__attemptErase__block_invoke;
    v4[3] = &unk_1E8E2FEB8;
    objc_copyWeak(&v5, &location);
    -[CSDeviceBlockViewController _attemptToDisableFindMyWithAccount:completion:](self, "_attemptToDisableFindMyWithAccount:completion:", findMyAccount, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __44__CSDeviceBlockViewController__attemptErase__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BYTE *WeakRetained;
  void *v6;

  v3 = a2;
  if (v3)
  {
    SBLogDashBoard();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44__CSDeviceBlockViewController__attemptErase__block_invoke_cold_1(v3);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1120] = 0;
    objc_msgSend(WeakRetained, "rebuildBehavior");
  }

}

- (void)_attemptRecovery
{
  CSDevicePasscodeRecoveryService *passcodeRecovery;
  _QWORD v4[4];
  id v5;
  id location;

  self->_attemptingRecovery = 1;
  -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
  objc_initWeak(&location, self);
  passcodeRecovery = self->_passcodeRecovery;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__CSDeviceBlockViewController__attemptRecovery__block_invoke;
  v4[3] = &unk_1E8E2FEB8;
  objc_copyWeak(&v5, &location);
  -[CSDevicePasscodeRecoveryService startRecoveryInParentVC:completion:](passcodeRecovery, "startRecoveryInParentVC:completion:", self, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__CSDeviceBlockViewController__attemptRecovery__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1121] = 0;
    objc_msgSend(WeakRetained, "rebuildBehavior");
    if (!v3)
      goto LABEL_6;
    SBLogDashBoard();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __47__CSDeviceBlockViewController__attemptRecovery__block_invoke_cold_1();

    objc_msgSend(v5, "_unblockPolicy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canUnblockDeviceUsingRecovery");

    if ((v8 & 1) == 0)
LABEL_6:
      objc_msgSend(v5, "deviceUnblockViewModelHandleDidRequestCancel");
  }

}

- (BOOL)_isFindMyEnabled
{
  void *v2;
  char v3;

  objc_msgSend(getAAUIDeviceLocatorServiceClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (BOOL)_isFindMyChangingState
{
  void *v2;
  char v3;

  objc_msgSend(getAAUIDeviceLocatorServiceClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isChangingState");

  return v3;
}

- (void)_setUpNetworkPathMonitor
{
  NSObject *networkPathMonitor;
  NSObject *v4;
  _QWORD update_handler[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  networkPathMonitor = self->_networkPathMonitor;
  update_handler[0] = MEMORY[0x1E0C809B0];
  update_handler[1] = 3221225472;
  update_handler[2] = __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke;
  update_handler[3] = &unk_1E8E2FEE0;
  objc_copyWeak(&v6, &location);
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(networkPathMonitor, update_handler);
  nw_path_monitor_set_queue((nw_path_monitor_t)self->_networkPathMonitor, (dispatch_queue_t)self->_networkMonitorQueue);
  -[CSDeviceBlockViewController networkPathMonitor](self, "networkPathMonitor");
  v4 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_start(v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD v5[5];
  id v6;
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_initWeak(&location, WeakRetained);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke_2;
    v5[3] = &unk_1E8E2E958;
    objc_copyWeak(&v6, &location);
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "_setNetworkMonitorUpdateHandlerWithPath:completion:", v3, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

void __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke_3;
  v3[3] = &unk_1E8E2DB38;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "_getUserAccountWithCompletion:", v3);

}

void __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke_4;
  block[3] = &unk_1E8E2DB38;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "start");
}

- (void)_setNetworkMonitorUpdateHandlerWithPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  CSDeviceBlockViewController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__CSDeviceBlockViewController__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke;
  block[3] = &unk_1E8E2E5F0;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __82__CSDeviceBlockViewController__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1122) = nw_path_get_status(*(nw_path_t *)(a1 + 32)) == nw_path_status_satisfied;
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_getUserAccountWithCompletion:(id)a3
{
  id v4;
  ACAccountStore *accountStore;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accountStore = self->_accountStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CSDeviceBlockViewController__getUserAccountWithCompletion___block_invoke;
  v7[3] = &unk_1E8E2FF08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ACAccountStore aa_primaryAppleAccountWithCompletion:](accountStore, "aa_primaryAppleAccountWithCompletion:", v7);

}

void __61__CSDeviceBlockViewController__getUserAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    SBLogDashBoard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61__CSDeviceBlockViewController__getUserAccountWithCompletion___block_invoke_cold_1(v6);

  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 1112);
  *(_QWORD *)(v8 + 1112) = v5;
  v10 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_attemptToDisableFindMyWithAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  CSDeviceBlockViewController *v10;
  uint64_t v11;
  id pendingAction;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  CSDeviceBlockViewController *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 buf;
  Class (*v27)(uint64_t);
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogDashBoard();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[CSDeviceBlockViewController _isFindMyEnabled](self, "_isFindMyEnabled");
    NSStringFromBOOL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1D0337000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to disable FindMy with FindMy enabled: %@", (uint8_t *)&buf, 0xCu);

  }
  if (-[CSDeviceBlockViewController _isFindMyChangingState](self, "_isFindMyChangingState"))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__CSDeviceBlockViewController__attemptToDisableFindMyWithAccount_completion___block_invoke;
    v19[3] = &unk_1E8E2FF30;
    v21 = v7;
    v19[4] = self;
    v20 = v6;
    v10 = self;
    v11 = MEMORY[0x1D17E1614](v19);
    pendingAction = v10->_pendingAction;
    v10->_pendingAction = (id)v11;

    -[CSDeviceBlockViewController _cancelPendingActionAfterDelay:](v10, "_cancelPendingActionAfterDelay:", 10.0);
  }
  else if (-[CSDeviceBlockViewController _isFindMyEnabled](self, "_isFindMyEnabled"))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v13 = (void *)getAAUIDeviceLocatorConfirmationUtilitiesContextClass_softClass;
    v25 = getAAUIDeviceLocatorConfirmationUtilitiesContextClass_softClass;
    v14 = MEMORY[0x1E0C809B0];
    if (!getAAUIDeviceLocatorConfirmationUtilitiesContextClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v27 = __getAAUIDeviceLocatorConfirmationUtilitiesContextClass_block_invoke;
      v28 = &unk_1E8E2EB18;
      v29 = &v22;
      __getAAUIDeviceLocatorConfirmationUtilitiesContextClass_block_invoke((uint64_t)&buf);
      v13 = (void *)v23[3];
    }
    v15 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v22, 8);
    v10 = (CSDeviceBlockViewController *)objc_alloc_init(v15);
    -[CSDeviceBlockViewController setAccount:](v10, "setAccount:", v6);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __77__CSDeviceBlockViewController__attemptToDisableFindMyWithAccount_completion___block_invoke_2;
    v17[3] = &unk_1E8E2FF58;
    v17[4] = self;
    v18 = v7;
    v16 = self;
    -[CSDeviceBlockViewController _performFMIPAuthenticationForContext:account:completion:](v16, "_performFMIPAuthenticationForContext:account:completion:", v10, v6, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSDeviceBlockEraseErrorDomain"), 3, 0);
    v10 = (CSDeviceBlockViewController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, CSDeviceBlockViewController *))v7 + 2))(v7, v10);
  }

}

void __77__CSDeviceBlockViewController__attemptToDisableFindMyWithAccount_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSDeviceBlockEraseErrorDomain"), 1, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_attemptToDisableFindMyWithAccount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

void __77__CSDeviceBlockViewController__attemptToDisableFindMyWithAccount_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "fmipWipeToken");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  objc_msgSend(*(id *)(a1 + 32), "_disableFindMyInContext:withWipeToken:completion:", 4, v4, *(_QWORD *)(a1 + 40));

}

- (void)_performFMIPAuthenticationForContext:(id)a3 account:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v10 = (void *)getAAFMIPAuthenticateRequestClass_softClass;
  v22 = getAAFMIPAuthenticateRequestClass_softClass;
  v11 = MEMORY[0x1E0C809B0];
  if (!getAAFMIPAuthenticateRequestClass_softClass)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getAAFMIPAuthenticateRequestClass_block_invoke;
    v18[3] = &unk_1E8E2EB18;
    v18[4] = &v19;
    __getAAFMIPAuthenticateRequestClass_block_invoke((uint64_t)v18);
    v10 = (void *)v20[3];
  }
  v12 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v19, 8);
  v13 = (void *)objc_msgSend([v12 alloc], "initWithAccount:", v8);
  objc_msgSend(v7, "customRequestHeaders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCustomHeaders:", v14);

  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __87__CSDeviceBlockViewController__performFMIPAuthenticationForContext_account_completion___block_invoke;
  v16[3] = &unk_1E8E2FF80;
  v17 = v9;
  v15 = v9;
  objc_msgSend(v13, "performRequestWithHandler:", v16);

}

void __87__CSDeviceBlockViewController__performFMIPAuthenticationForContext_account_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    SBLogDashBoard();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __87__CSDeviceBlockViewController__performFMIPAuthenticationForContext_account_completion___block_invoke_cold_1(v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_disableFindMyInContext:(unint64_t)a3 withWipeToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v8 = a5;
  v9 = a4;
  objc_msgSend(getAAUIDeviceLocatorServiceClass(), "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__CSDeviceBlockViewController__disableFindMyInContext_withWipeToken_completion___block_invoke;
  v12[3] = &unk_1E8E2E5A0;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "disableInContext:withWipeToken:completion:", a3, v9, v12);

}

void __80__CSDeviceBlockViewController__disableFindMyInContext_withWipeToken_completion___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__CSDeviceBlockViewController__disableFindMyInContext_withWipeToken_completion___block_invoke_2;
  block[3] = &unk_1E8E2E360;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __80__CSDeviceBlockViewController__disableFindMyInContext_withWipeToken_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, int);
  void *v10;
  void *v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __80__CSDeviceBlockViewController__disableFindMyInContext_withWipeToken_completion___block_invoke_3;
    v10 = &unk_1E8E2E5A0;
    v11 = v2;
    v12 = *(id *)(a1 + 40);
    v3 = v2;
    v4 = MEMORY[0x1D17E1614](&v7);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1088);
    *(_QWORD *)(v5 + 1088) = v4;

    objc_msgSend(*(id *)(a1 + 32), "_cancelPendingActionAfterDelay:", 10.0, v7, v8, v9, v10, v11);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_eraseDeviceWithCompletion:", *(_QWORD *)(a1 + 40));
  }
}

void __80__CSDeviceBlockViewController__disableFindMyInContext_withWipeToken_completion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_eraseDeviceWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSDeviceBlockEraseErrorDomain"), 1, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)_eraseDeviceWithCompletion:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0D1F1E8];
  v5 = a3;
  v8 = objc_alloc_init(v4);
  objc_msgSend(v8, "setHideProgress:", 0);
  objc_msgSend(v8, "setEraseDataPlan:", self->_shouldEraseDataPlan);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F1F0]), "initWithMode:options:reason:", 4, v8, CFSTR("BlockedDeviceUserErase"));
  objc_msgSend(MEMORY[0x1E0D1F1F8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetWithRequest:completion:", v6, v5);

}

- (void)_cancelPendingActionAfterDelay:(double)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CSDeviceBlockViewController__cancelPendingActionAfterDelay___block_invoke;
  block[3] = &unk_1E8E2DB38;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

void __62__CSDeviceBlockViewController__cancelPendingActionAfterDelay___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1088);
    *(_QWORD *)(v3 + 1088) = 0;

  }
}

- (id)_obfuscateUsername:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("@")) - 1;
  objc_msgSend(&stru_1E8E30B28, "stringByPaddingToLength:withString:startingAtIndex:", 4, CFSTR("*"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 1, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_shouldShowUnblockDeviceButton
{
  void *v2;
  char v3;

  -[CSDeviceBlockViewController _unblockPolicy](self, "_unblockPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canUnblockDevice");

  return v3;
}

- (id)_unblockPolicy
{
  CSDeviceUnblockPolicy *v3;
  void *v4;
  CSDeviceUnblockPolicy *v5;
  _QWORD v7[5];

  v3 = [CSDeviceUnblockPolicy alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__CSDeviceBlockViewController__unblockPolicy__block_invoke;
  v7[3] = &unk_1E8E2FFA8;
  v7[4] = self;
  __45__CSDeviceBlockViewController__unblockPolicy__block_invoke((uint64_t)v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CSDeviceUnblockPolicy initWithEnvironment:](v3, "initWithEnvironment:", v4);

  return v5;
}

CSDeviceUnblockPolicyEnvironment *__45__CSDeviceBlockViewController__unblockPolicy__block_invoke(uint64_t a1)
{
  CSDeviceUnblockPolicyEnvironment *v2;
  _QWORD v4[5];

  v2 = [CSDeviceUnblockPolicyEnvironment alloc];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__CSDeviceBlockViewController__unblockPolicy__block_invoke_2;
  v4[3] = &unk_1E8E2DA58;
  v4[4] = *(_QWORD *)(a1 + 32);
  return -[CSDeviceUnblockPolicyEnvironment initWithBuilder:](v2, "initWithBuilder:", v4);
}

void __45__CSDeviceBlockViewController__unblockPolicy__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setIsDeviceInternetConnectionActive:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1122));
  objc_msgSend(v4, "setIsUserFindMyAccountPresent:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112) != 0);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "isUserRequestedEraseEnabled") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "alwaysEnableUserRequestedErase");
  objc_msgSend(v4, "setIsUserRequestedEraseEnabled:", v3);
  objc_msgSend(v4, "setIsPasscodeGracePeriodUsable:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "canStartRecovery"));

}

- (OS_nw_path_monitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (OS_dispatch_queue)networkMonitorQueue
{
  return self->_networkMonitorQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMonitorQueue, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_findMyAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_accountAccessQueue, 0);
  objc_storeStrong(&self->_pendingAction, 0);
  objc_storeStrong((id *)&self->_lockScreenSettings, 0);
  objc_storeStrong((id *)&self->_blockTimer, 0);
  objc_storeStrong((id *)&self->_passcodeRecovery, 0);
  objc_storeStrong((id *)&self->_deviceUnblockViewController, 0);
  objc_storeStrong((id *)&self->_authenticationViewController, 0);
  objc_storeStrong((id *)&self->_blockStatusProvider, 0);
}

- (void)initWithDeviceBlockStatusProvider:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAAUIDeviceLocatorStateDidChangeNotification(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CSDeviceBlockViewController.m"), 41, CFSTR("%s"), dlerror());

  __break(1u);
}

void __44__CSDeviceBlockViewController__attemptErase__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_5(&dword_1D0337000, v2, v3, "Failed attempt to disable FindMy with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

void __47__CSDeviceBlockViewController__attemptRecovery__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1D0337000, v0, OS_LOG_TYPE_ERROR, "Failed to recover passcode with error: %@", v1, 0xCu);
}

void __61__CSDeviceBlockViewController__getUserAccountWithCompletion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_5(&dword_1D0337000, v2, v3, "Error while getting primary Apple account: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

void __87__CSDeviceBlockViewController__performFMIPAuthenticationForContext_account_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_5(&dword_1D0337000, v2, v3, "Request to authenticate FindMy IP failed with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

@end
