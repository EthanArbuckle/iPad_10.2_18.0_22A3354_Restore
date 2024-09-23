@implementation DKEraseFlow

- (DKEraseFlow)initWithConfiguration:(id)a3
{
  id v5;
  DKEraseFlow *v6;
  DKEraseFlow *v7;
  id eraseDevice;
  NWPathEvaluator *v9;
  NWPathEvaluator *pathEvaluator;
  uint64_t v11;
  id hasInternetConnectivity;
  id isBasebandDead;
  id presentNetworkSettings;
  DKFindMyProvider *v15;
  DKFindMyProvider *findMyProvider;
  DKPasscodeProvider *v17;
  DKPasscodeProvider *passcodeProvider;
  void *v19;
  uint64_t v20;
  NSString *deviceName;
  DKCloudProvider *v22;
  DKCloudProvider *cloudProvider;
  DKWalletProvider *v24;
  DKWalletProvider *walletProvider;
  DKAccountProvider *v26;
  DKAccountProvider *accountProvider;
  DKNotableUserDataProvider *v28;
  DKNotableUserDataProvider *notableUserDataProvider;
  uint64_t v31;
  uint64_t v32;
  BOOL (*v33)(uint64_t);
  void *v34;
  id v35;
  id location;
  objc_super v37;

  v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)DKEraseFlow;
  v6 = -[DKEraseFlow init](&v37, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    eraseDevice = v7->_eraseDevice;
    v7->_eraseDevice = &__block_literal_global_1;

    objc_initWeak(&location, v7);
    v9 = (NWPathEvaluator *)objc_alloc_init(MEMORY[0x24BDE07E8]);
    pathEvaluator = v7->_pathEvaluator;
    v7->_pathEvaluator = v9;

    v31 = MEMORY[0x24BDAC760];
    v32 = 3221225472;
    v33 = __37__DKEraseFlow_initWithConfiguration___block_invoke_27;
    v34 = &unk_24F20E578;
    objc_copyWeak(&v35, &location);
    v11 = MEMORY[0x22E2C9654](&v31);
    hasInternetConnectivity = v7->_hasInternetConnectivity;
    v7->_hasInternetConnectivity = (id)v11;

    isBasebandDead = v7->_isBasebandDead;
    v7->_isBasebandDead = &__block_literal_global_29;

    presentNetworkSettings = v7->_presentNetworkSettings;
    v7->_presentNetworkSettings = &__block_literal_global_31;

    v15 = objc_alloc_init(DKFindMyProvider);
    findMyProvider = v7->_findMyProvider;
    v7->_findMyProvider = v15;

    v17 = objc_alloc_init(DKPasscodeProvider);
    passcodeProvider = v7->_passcodeProvider;
    v7->_passcodeProvider = v17;

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", v31, v32, v33, v34);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v20 = objc_claimAutoreleasedReturnValue();
    deviceName = v7->_deviceName;
    v7->_deviceName = (NSString *)v20;

    v22 = objc_alloc_init(DKCloudProvider);
    cloudProvider = v7->_cloudProvider;
    v7->_cloudProvider = v22;

    v24 = objc_alloc_init(DKWalletProvider);
    walletProvider = v7->_walletProvider;
    v7->_walletProvider = v24;

    v26 = -[DKAccountProvider initWithFindMyProvider:]([DKAccountProvider alloc], "initWithFindMyProvider:", v7->_findMyProvider);
    accountProvider = v7->_accountProvider;
    v7->_accountProvider = v26;

    v28 = -[DKNotableUserDataProvider initWithAccountProvider:findMyProvider:walletProvider:]([DKNotableUserDataProvider alloc], "initWithAccountProvider:findMyProvider:walletProvider:", v7->_accountProvider, v7->_findMyProvider, v7->_walletProvider);
    notableUserDataProvider = v7->_notableUserDataProvider;
    v7->_notableUserDataProvider = v28;

    v7->_eraseDataPlan = 0;
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __37__DKEraseFlow_initWithConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = objc_alloc_init(MEMORY[0x24BE2E758]);
  objc_msgSend(v3, "setEraseDataPlan:", a2);
  _DKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_229405000, v4, OS_LOG_TYPE_DEFAULT, "Erasing data partition...", v7, 2u);
  }

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2E760]), "initWithMode:options:reason:", 4, v3, CFSTR("Disembark"));
  objc_msgSend(MEMORY[0x24BE2E768], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetWithRequest:completion:", v5, &__block_literal_global_22);

}

void __37__DKEraseFlow_initWithConfiguration___block_invoke_20(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  _DKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __37__DKEraseFlow_initWithConfiguration___block_invoke_20_cold_1(v2, v4);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_229405000, v4, OS_LOG_TYPE_DEFAULT, "Erase succeeded", v5, 2u);
  }

}

BOOL __37__DKEraseFlow_initWithConfiguration___block_invoke_27(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _BOOL8 v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pathEvaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (objc_msgSend(v3, "status") & 0xFFFFFFFFFFFFFFFDLL) != 0;
  return v4;
}

uint64_t __37__DKEraseFlow_initWithConfiguration___block_invoke_2()
{
  _CTServerConnectionCreateWithIdentifier();
  _CTServerConnectionGetRadioModuleIsDead();
  return 0;
}

void __37__DKEraseFlow_initWithConfiguration___block_invoke_3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs://root=WIFI"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

- (id)initForSetupAssistant
{
  void *v3;
  DKEraseFlow *v4;

  +[DKConfiguration setupAssistantConfiguration](DKConfiguration, "setupAssistantConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DKEraseFlow initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (DKEraseFlow)initWithNavigationController:(id)a3 configuration:(id)a4
{
  id v7;
  DKEraseFlow *v8;
  DKEraseFlow *v9;

  v7 = a3;
  v8 = -[DKEraseFlow initWithConfiguration:](self, "initWithConfiguration:", a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_navigationController, a3);

  return v9;
}

- (DKEraseFlow)initWithNavigationController:(id)a3
{
  id v4;
  void *v5;
  DKEraseFlow *v6;

  v4 = a3;
  +[DKConfiguration defaultConfiguration](DKConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DKEraseFlow initWithNavigationController:configuration:](self, "initWithNavigationController:configuration:", v4, v5);

  return v6;
}

- (void)prepareFlow:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  _DKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_229405000, v5, OS_LOG_TYPE_DEFAULT, "Preparing flow...", buf, 2u);
  }

  dispatch_get_global_queue(25, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __27__DKEraseFlow_prepareFlow___block_invoke;
  v8[3] = &unk_24F20E678;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __27__DKEraseFlow_prepareFlow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "findMyProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__DKEraseFlow_prepareFlow___block_invoke_2;
  v4[3] = &unk_24F20E248;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "fetchFindMyState:", v4);

}

void __27__DKEraseFlow_prepareFlow___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "notableUserDataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__DKEraseFlow_prepareFlow___block_invoke_3;
  v4[3] = &unk_24F20E650;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "fetchNotableUserData:", v4);

}

void __27__DKEraseFlow_prepareFlow___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__DKEraseFlow_prepareFlow___block_invoke_4;
  v6[3] = &unk_24F20E628;
  v4 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v5 = v3;
  objc_msgSend(v7, "_supportsNonInteractiveCloudUpload:", v6);

}

void __27__DKEraseFlow_prepareFlow___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__DKEraseFlow_prepareFlow___block_invoke_5;
  block[3] = &unk_24F20E600;
  v12 = a2;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v11 = *(id *)(a1 + 48);
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __27__DKEraseFlow_prepareFlow___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _DKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_229405000, v2, OS_LOG_TYPE_DEFAULT, "Flow preparation completed!", (uint8_t *)&v8, 2u);
  }

  v3 = *(unsigned __int8 *)(a1 + 64);
  _DKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_229405000, v4, OS_LOG_TYPE_DEFAULT, "Starting non-interactive cloud upload...", (uint8_t *)&v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_startNonInteractiveCloudUpload");
  }
  else
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_229405000, v4, OS_LOG_TYPE_DEFAULT, "Unable to start non-interactive cloud upload (%{public}@)", (uint8_t *)&v8, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setNotableUserData:", *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)showFlowContainerFromParentViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[DKEraseFlow navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModalPresentationStyle:", 0);

  -[DKEraseFlow navigationController](self, "navigationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v9, 1, v6);

}

- (id)startFlow
{
  -[DKEraseFlow _startFlow](self, "_startFlow");
  return -[DKEraseFlow initialViewController](self, "initialViewController");
}

- (UINavigationController)navigationController
{
  void *v3;
  void *v4;
  void *v5;

  if (!self->_navigationController)
  {
    -[DKEraseFlow initialViewController](self, "initialViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[DKEraseFlow initialViewController](self, "initialViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKEraseFlow setNavigationController:](self, "setNavigationController:", v5);

    }
  }
  return self->_navigationController;
}

- (void)_registerForAnalyticsNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__hostWillTerminate, *MEMORY[0x24BDF7D20], 0);

}

- (void)_unregisterForAnalyticsNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7D20], 0);

}

- (void)_sendTerminatedAnalyticsEventWithState:(unint64_t)a3 willErase:(BOOL)a4 reason:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v5 = a4;
  v17[3] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("lastPaneShown");
  v7 = a5;
  objc_msgSend((id)objc_opt_class(), "_stringForState:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v16[1] = CFSTR("successful");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = CFSTR("reason");
  v17[1] = v9;
  v17[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _DKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = CFSTR("com.apple.disembarkUI.exited");
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_229405000, v11, OS_LOG_TYPE_DEFAULT, "Sending event for %@ with payload %@", (uint8_t *)&v12, 0x16u);
  }

  AnalyticsSendEvent();
}

- (void)_hostWillTerminate
{
  -[DKEraseFlow _unregisterForAnalyticsNotifications](self, "_unregisterForAnalyticsNotifications");
  -[DKEraseFlow _sendTerminatedAnalyticsEventWithState:willErase:reason:](self, "_sendTerminatedAnalyticsEventWithState:willErase:reason:", -[DKEraseFlow state](self, "state"), 0, CFSTR("Terminated"));
}

- (void)_supportsNonInteractiveCloudUpload:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DKEraseFlow accountProvider](self, "accountProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke;
  v7[3] = &unk_24F20E6F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "preparationRequiredForPrimaryAppleAccountWithCompletion:", v7);

}

void __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  char v12;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke_2;
  v8[3] = &unk_24F20E6C8;
  v9 = v5;
  v6 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    _DKLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke_2_cold_1(v2, v3, v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if (*(_BYTE *)(a1 + 56))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "cloudProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke_65;
    v7[3] = &unk_24F20E6A0;
    v6 = *(id *)(a1 + 48);
    v7[4] = *(_QWORD *)(a1 + 40);
    v8 = v6;
    objc_msgSend(v5, "hasDataToUpload:", v7);

  }
}

void __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke_65(uint64_t a1, char a2)
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  void (*v7)(void);
  void *v8;
  uint64_t v9;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowNonInteractiveCloudUpload");

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "cloudProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isRestoring");

      if (v6)
      {
        v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "cloudProvider");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isUploadSupportedForCurrentNetwork");

        if (!v9 || v9 == 2)
        {
          v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        }
        else
        {
          if (v9 != 1)
            return;
          v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        }
      }
    }
    else
    {
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
  }
  else
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
}

- (void)_startNonInteractiveCloudUpload
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke;
  v8[3] = &unk_24F20E718;
  objc_copyWeak(&v9, &location);
  -[DKEraseFlow setCloudUploadProgressHandler:](self, "setCloudUploadProgressHandler:", v8);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_2;
  v6[3] = &unk_24F20E740;
  objc_copyWeak(&v7, &location);
  -[DKEraseFlow setCloudUploadCompletion:](self, "setCloudUploadCompletion:", v6);
  -[DKEraseFlow setCloudUploadInProgress:](self, "setCloudUploadInProgress:", 1);
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_3;
  v5[3] = &unk_24F20DE18;
  v5[4] = self;
  dispatch_async(v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke(uint64_t a1, float a2, double a3)
{
  double v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v5 = a2;
  objc_msgSend(WeakRetained, "setCloudUploadProgress:", v5);
  objc_msgSend(WeakRetained, "setCloudUploadTimeRemaining:", a3);

}

void __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  double v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setCloudUploadResults:", v3);
  LODWORD(v2) = objc_msgSend(v3, "success");

  if ((_DWORD)v2)
  {
    objc_msgSend(WeakRetained, "setCloudUploadSucceeded:", 1);
    LODWORD(v4) = 0;
    objc_msgSend(WeakRetained, "setCloudUploadProgress:", v4);
  }

}

void __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  _QWORD v4[4];
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "cloudProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_4;
  v4[3] = &unk_24F20E768;
  v5 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_5;
  v3[3] = &unk_24F20E790;
  v3[4] = v5;
  objc_msgSend(v2, "beginUploadAllowingExpensiveCellular:progressHandler:completion:", 0, v4, v3);

}

void __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_4(uint64_t a1, float a2, double a3)
{
  void *v6;
  void (**v7)(float, double);

  objc_msgSend(*(id *)(a1 + 32), "cloudUploadProgressHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudUploadProgressHandler");
    v7 = (void (**)(float, double))objc_claimAutoreleasedReturnValue();
    v7[2](a2, a3);

  }
}

void __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cloudUploadCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudUploadCompletion");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

  }
}

- (void)_startFlow
{
  NSObject *v3;
  uint8_t v4[16];

  _DKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_229405000, v3, OS_LOG_TYPE_DEFAULT, "Starting flow...", v4, 2u);
  }

  objc_msgSend(MEMORY[0x24BE2CFE0], "clearFollowUp");
  -[DKEraseFlow _registerForAnalyticsNotifications](self, "_registerForAnalyticsNotifications");
  -[DKEraseFlow _advanceToState:](self, "_advanceToState:", 0);
}

- (void)_endFlowWithReason:(id)a3
{
  id v4;

  v4 = a3;
  -[DKEraseFlow _sendTerminatedAnalyticsEventWithState:willErase:reason:](self, "_sendTerminatedAnalyticsEventWithState:willErase:reason:", -[DKEraseFlow state](self, "state"), 1, v4);

  -[DKEraseFlow _endFlow](self, "_endFlow");
}

- (void)_endFlowForCancellationWithReason:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  v5 = -[DKEraseFlow state](self, "state");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("User Cancelled (%@)"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DKEraseFlow _sendTerminatedAnalyticsEventWithState:willErase:reason:](self, "_sendTerminatedAnalyticsEventWithState:willErase:reason:", v5, 1, v6);
  -[DKEraseFlow _endFlow](self, "_endFlow");
}

- (void)_endFlow
{
  NSObject *v3;
  void *v4;
  void (**v5)(void);
  uint8_t v6[16];

  _DKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_229405000, v3, OS_LOG_TYPE_DEFAULT, "Ending flow...", v6, 2u);
  }

  -[DKEraseFlow _allowHomeButton](self, "_allowHomeButton");
  -[DKEraseFlow _unregisterForAnalyticsNotifications](self, "_unregisterForAnalyticsNotifications");
  -[DKEraseFlow completion](self, "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DKEraseFlow completion](self, "completion");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();
  }
  else
  {
    -[DKEraseFlow navigationController](self, "navigationController");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (unint64_t)state
{
  void *v3;
  void *v4;
  objc_class *v5;
  unint64_t v6;

  -[DKEraseFlow navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();

  if (v5 == -[DKEraseFlow _viewControllerClassForState:](self, "_viewControllerClassForState:", 0))
    return 0;
  v6 = 1;
  if (v5 != -[DKEraseFlow _viewControllerClassForState:](self, "_viewControllerClassForState:", 1))
  {
    v6 = 2;
    if (v5 != -[DKEraseFlow _viewControllerClassForState:](self, "_viewControllerClassForState:", 2))
    {
      v6 = 7;
      if (v5 != -[DKEraseFlow _viewControllerClassForState:](self, "_viewControllerClassForState:", 7))
      {
        v6 = 3;
        if (v5 != -[DKEraseFlow _viewControllerClassForState:](self, "_viewControllerClassForState:", 3))
        {
          v6 = 4;
          if (v5 != -[DKEraseFlow _viewControllerClassForState:](self, "_viewControllerClassForState:", 4))
            return 5;
        }
      }
    }
  }
  return v6;
}

- (void)_advanceFromState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[DKEraseFlow navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 0);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__DKEraseFlow__advanceFromState___block_invoke;
  v8[3] = &unk_24F20E7B8;
  v8[4] = self;
  -[DKEraseFlow _nextStateFromState:completion:](self, "_nextStateFromState:completion:", a3, v8);
}

uint64_t __33__DKEraseFlow__advanceFromState___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "_advanceToState:", a2);
}

- (void)_advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD handler[5];
  NSObject *v10;
  uint8_t *v11;
  id v12;
  id location;
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    -[DKEraseFlow _advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses:].cold.1();

  _DKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_229405000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for network settings dismissal", buf, 2u);
  }

  objc_msgSend(v4, "showBusy");
  v7 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  dispatch_source_set_timer(v7, 0, 0x5F5E100uLL, 0x989680uLL);
  *(_QWORD *)buf = 0;
  v15 = buf;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  objc_initWeak(&location, v4);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __81__DKEraseFlow__advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses___block_invoke;
  handler[3] = &unk_24F20E7E0;
  objc_copyWeak(&v12, &location);
  v10 = v7;
  v11 = buf;
  handler[4] = self;
  v8 = v7;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_activate(v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

}

void __81__DKEraseFlow__advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t (**v9)(void);
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];
  uint8_t v20[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    _DKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_229405000, v12, OS_LOG_TYPE_DEFAULT, "Detected internet warning release", v20, 2u);
    }

LABEL_14:
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    goto LABEL_15;
  }
  objc_msgSend(WeakRetained, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      _DKLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229405000, v5, OS_LOG_TYPE_DEFAULT, "Detected network settings dismissal", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
    objc_msgSend(*(id *)(a1 + 32), "hasInternetConnectivity");
    v9 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v10 = v9[2]();

    if (v10)
    {
      _DKLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_229405000, v11, OS_LOG_TYPE_DEFAULT, "Detected network settings connectivity", v18, 2u);
      }

      objc_msgSend(v3, "showAvailable");
      objc_msgSend(*(id *)(a1 + 32), "_advanceFromState:", objc_msgSend(*(id *)(a1 + 32), "state"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      v15 = v14;

      if (v15 < 2.0)
        goto LABEL_15;
      _DKLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_229405000, v16, OS_LOG_TYPE_DEFAULT, "Network settings did not change connectivity after delay", v17, 2u);
      }

      objc_msgSend(v3, "showAvailable");
    }
    goto LABEL_14;
  }
LABEL_15:

}

- (void)_advanceToState:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, float, double);
  float v14;
  float v15;
  double v16;
  void *v17;
  void *v18;
  char v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  _DKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "_stringForState:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v35 = v6;
    _os_log_impl(&dword_229405000, v5, OS_LOG_TYPE_DEFAULT, "Advancing to state %{public}@...", buf, 0xCu);

  }
  if (-[DKEraseFlow _isHomeButtonAllowedForState:](self, "_isHomeButtonAllowedForState:", a3))
    -[DKEraseFlow _allowHomeButton](self, "_allowHomeButton");
  else
    -[DKEraseFlow _disallowHomeButton](self, "_disallowHomeButton");
  -[DKEraseFlow _viewControllerForState:](self, "_viewControllerForState:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    _DKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v7;
      _os_log_impl(&dword_229405000, v8, OS_LOG_TYPE_DEFAULT, "Pushing to %{public}@...", buf, 0xCu);
    }

    if (a3 != 4)
      goto LABEL_20;
    v9 = v7;
    objc_initWeak((id *)buf, self);
    v10 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __31__DKEraseFlow__advanceToState___block_invoke;
    v32[3] = &unk_24F20E768;
    v11 = v9;
    v33 = v11;
    -[DKEraseFlow setCloudUploadProgressHandler:](self, "setCloudUploadProgressHandler:", v32);
    v29[0] = v10;
    v29[1] = 3221225472;
    v29[2] = __31__DKEraseFlow__advanceToState___block_invoke_2;
    v29[3] = &unk_24F20E808;
    objc_copyWeak(&v31, (id *)buf);
    v12 = v11;
    v30 = v12;
    -[DKEraseFlow setCloudUploadCompletion:](self, "setCloudUploadCompletion:", v29);
    if (-[DKEraseFlow isCloudUploadInProgress](self, "isCloudUploadInProgress"))
    {
      -[DKEraseFlow cloudUploadProgressHandler](self, "cloudUploadProgressHandler");
      v13 = (void (**)(_QWORD, float, double))objc_claimAutoreleasedReturnValue();
      -[DKEraseFlow cloudUploadProgress](self, "cloudUploadProgress");
      v15 = v14;
      -[DKEraseFlow cloudUploadTimeRemaining](self, "cloudUploadTimeRemaining");
      v13[2](v13, v15, v16);

      -[DKEraseFlow cloudUploadResults](self, "cloudUploadResults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        goto LABEL_19;
      -[DKEraseFlow cloudUploadResults](self, "cloudUploadResults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "success");

      if ((v19 & 1) != 0)
        goto LABEL_19;
      -[DKEraseFlow cloudUploadCompletion](self, "cloudUploadCompletion");
      v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[DKEraseFlow cloudUploadResults](self, "cloudUploadResults");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v20)[2](v20, v21);
    }
    else
    {
      -[DKEraseFlow cloudProvider](self, "cloudProvider");
      v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v22 = -[DKEraseFlow allowExpensiveCellular](self, "allowExpensiveCellular");
      -[DKEraseFlow cloudUploadProgressHandler](self, "cloudUploadProgressHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKEraseFlow cloudUploadCompletion](self, "cloudUploadCompletion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "beginUploadAllowingExpensiveCellular:progressHandler:completion:", v22, v21, v23);

    }
LABEL_19:

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);

LABEL_20:
    -[DKEraseFlow navigationController](self, "navigationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[DKEraseFlow navigationController](self, "navigationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "pushViewController:animated:", v7, 1);

    }
    else
    {
      -[DKEraseFlow setInitialViewController:](self, "setInitialViewController:", v7);
    }
    goto LABEL_25;
  }
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 7uLL:
      -[DKEraseFlow _advanceToState:].cold.1();
    case 5uLL:
      if (-[DKEraseFlow continueWithoutInternet](self, "continueWithoutInternet"))
        -[DKEraseFlow _eraseDevice](self, "_eraseDevice");
      else
        -[DKEraseFlow _signOutAndEraseDevice](self, "_signOutAndEraseDevice");
      break;
    case 6uLL:
      -[DKEraseFlow accountProvider](self, "accountProvider");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKEraseFlow navigationController](self, "navigationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __31__DKEraseFlow__advanceToState___block_invoke_3;
      v28[3] = &unk_24F20E830;
      v28[4] = self;
      objc_msgSend(v26, "preparePrimaryAppleAccountForSignOutWithPresentingViewController:completion:", v27, v28);

      break;
    default:
      break;
  }
LABEL_25:

}

uint64_t __31__DKEraseFlow__advanceToState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "uploadProgress:withTimeRemaining:");
}

void __31__DKEraseFlow__advanceToState___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "success"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_advanceToState:", 5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "uploadDidComplete:", v4);
  }

}

void __31__DKEraseFlow__advanceToState___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__DKEraseFlow__advanceToState___block_invoke_4;
  block[3] = &unk_24F20DDA0;
  v9 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __31__DKEraseFlow__advanceToState___block_invoke_4(uint64_t a1)
{
  void *v1;
  NSObject *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "_advanceFromState:", 6);
  _DKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = _DKIsInternalInstall();
    v6 = *(void **)(a1 + 40);
    if ((v5 & 1) == 0 && v6)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 40), "domain");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v1, objc_msgSend(*(id *)(a1 + 40), "code"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_error_impl(&dword_229405000, v4, OS_LOG_TYPE_ERROR, "Failed to prepare primary Apple Account for sign out: %@", buf, 0xCu);
    if (v7)
    {

    }
  }

  return objc_msgSend(*(id *)(a1 + 32), "_endFlowWithReason:", CFSTR("Primary Apple Account Preparation Failure"));
}

- (Class)_viewControllerClassForState:(unint64_t)a3
{
  void *v3;

  if (a3 <= 7 && ((0x9Fu >> a3) & 1) != 0)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (Class)v3;
}

- (id)_viewControllerForState:(unint64_t)a3
{
  DKIntroViewController *v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t (**v9)(void);
  void *v10;
  uint64_t v11;
  DKScreenTimePasscodeViewController *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v3 = 0;
  v44 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0uLL:
      v3 = objc_alloc_init(DKIntroViewController);
      -[DKEraseFlow notableUserData](self, "notableUserData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKIntroViewController setNotableUserData:](v3, "setNotableUserData:", v5);

      _DKLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[DKIntroViewController notableUserData](v3, "notableUserData");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v43 = v7;
        _os_log_impl(&dword_229405000, v6, OS_LOG_TYPE_DEFAULT, "viewController.notableUserData %@", buf, 0xCu);

      }
      -[DKEraseFlow hasInternetConnectivity](self, "hasInternetConnectivity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKIntroViewController setHasInternetConnectivity:](v3, "setHasInternetConnectivity:", v8);

      -[DKEraseFlow isBasebandDead](self, "isBasebandDead");
      v9 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
      -[DKIntroViewController setIsBasebandDead:](v3, "setIsBasebandDead:", v9[2]());

      -[DKEraseFlow configuration](self, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKIntroViewController setPreventOpeningSafari:](v3, "setPreventOpeningSafari:", objc_msgSend(v10, "preventOpeningSafari"));

      v11 = MEMORY[0x24BDAC760];
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __39__DKEraseFlow__viewControllerForState___block_invoke;
      v41[3] = &unk_24F20E858;
      v41[4] = self;
      -[DKIntroViewController setFetchRestoreState:](v3, "setFetchRestoreState:", v41);
      v40[0] = v11;
      v40[1] = 3221225472;
      v40[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_2;
      v40[3] = &unk_24F20E8A8;
      v40[4] = self;
      -[DKIntroViewController setConfirmErase:](v3, "setConfirmErase:", v40);
      v39[0] = v11;
      v39[1] = 3221225472;
      v39[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_4;
      v39[3] = &unk_24F20E298;
      v39[4] = self;
      -[DKIntroViewController setBeginEraseBlock:](v3, "setBeginEraseBlock:", v39);
      v38[0] = v11;
      v38[1] = 3221225472;
      v38[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_5;
      v38[3] = &unk_24F20DE18;
      v38[4] = self;
      -[DKIntroViewController setEraseLaterBlock:](v3, "setEraseLaterBlock:", v38);
      break;
    case 1uLL:
      v3 = objc_alloc_init(DKPasscodeViewController);
      -[DKEraseFlow passcodeProvider](self, "passcodeProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unlockType");
      -[DKEraseFlow passcodeProvider](self, "passcodeProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKIntroViewController setUnlockScreenType:simplePasscodeType:](v3, "setUnlockScreenType:simplePasscodeType:", v18, objc_msgSend(v19, "simplePasscodeType"));

      v20 = MEMORY[0x24BDAC760];
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_6;
      v37[3] = &unk_24F20E8D0;
      v37[4] = self;
      -[DKIntroViewController setVerifyPasscode:](v3, "setVerifyPasscode:", v37);
      v36[0] = v20;
      v36[1] = 3221225472;
      v36[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_7;
      v36[3] = &unk_24F20E8F8;
      v36[4] = self;
      -[DKIntroViewController setPasscodeVerified:](v3, "setPasscodeVerified:", v36);
      break;
    case 2uLL:
      v12 = [DKScreenTimePasscodeViewController alloc];
      -[DKEraseFlow deviceName](self, "deviceName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[DKScreenTimePasscodeViewController initWithDeviceName:](v12, "initWithDeviceName:", v13);

      v14 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_8;
      v35[3] = &unk_24F20E8D0;
      v35[4] = self;
      -[DKIntroViewController setVerifyPasscode:](v3, "setVerifyPasscode:", v35);
      v34[0] = v14;
      v34[1] = 3221225472;
      v34[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_9;
      v34[3] = &unk_24F20DE18;
      v34[4] = self;
      -[DKIntroViewController setPasscodeVerified:](v3, "setPasscodeVerified:", v34);
      break;
    case 3uLL:
      v3 = objc_alloc_init(DKPromptCloudUploadViewController);
      v21 = MEMORY[0x24BDAC760];
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_103;
      v30[3] = &unk_24F20E948;
      v30[4] = self;
      -[DKIntroViewController setHasInternetConnectivity:](v3, "setHasInternetConnectivity:", v30);
      v29[0] = v21;
      v29[1] = 3221225472;
      v29[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_2_104;
      v29[3] = &unk_24F20E948;
      v29[4] = self;
      -[DKIntroViewController setShouldWarnForDataUsage:](v3, "setShouldWarnForDataUsage:", v29);
      -[DKEraseFlow presentNetworkSettings](self, "presentNetworkSettings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKIntroViewController setPresentNetworkSettings:](v3, "setPresentNetworkSettings:", v22);

      v28[0] = v21;
      v28[1] = 3221225472;
      v28[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_3_105;
      v28[3] = &unk_24F20DE18;
      v28[4] = self;
      -[DKIntroViewController setEraseNowBlock:](v3, "setEraseNowBlock:", v28);
      v27[0] = v21;
      v27[1] = 3221225472;
      v27[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_4_106;
      v27[3] = &unk_24F20E298;
      v27[4] = self;
      -[DKIntroViewController setUploadThenEraseBlock:](v3, "setUploadThenEraseBlock:", v27);
      break;
    case 4uLL:
      v3 = objc_alloc_init(DKCloudUploadViewController);
      v23 = MEMORY[0x24BDAC760];
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_5_107;
      v26[3] = &unk_24F20DE18;
      v26[4] = self;
      -[DKIntroViewController setCancelBlock:](v3, "setCancelBlock:", v26);
      v25[0] = v23;
      v25[1] = 3221225472;
      v25[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_6_110;
      v25[3] = &unk_24F20DE18;
      v25[4] = self;
      -[DKIntroViewController setSkipBlock:](v3, "setSkipBlock:", v25);
      break;
    case 7uLL:
      v3 = objc_alloc_init(DKInternetWarningViewController);
      -[DKEraseFlow notableUserData](self, "notableUserData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKIntroViewController setNotableUserData:](v3, "setNotableUserData:", v15);

      objc_initWeak((id *)buf, v3);
      v16 = MEMORY[0x24BDAC760];
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_10;
      v32[3] = &unk_24F20E920;
      v32[4] = self;
      objc_copyWeak(&v33, (id *)buf);
      -[DKIntroViewController setRequireInternetBlock:](v3, "setRequireInternetBlock:", v32);
      v31[0] = v16;
      v31[1] = 3221225472;
      v31[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_102;
      v31[3] = &unk_24F20DE18;
      v31[4] = self;
      -[DKIntroViewController setContinueWithoutInternetBlock:](v3, "setContinueWithoutInternetBlock:", v31);
      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
      break;
    default:
      return v3;
  }
  return v3;
}

void __39__DKEraseFlow__viewControllerForState___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "cloudProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  a2[2](v4, objc_msgSend(v5, "isRestoring"));

}

void __39__DKEraseFlow__viewControllerForState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_3;
  v6[3] = &unk_24F20E880;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_presentEraseConfirmation:", v6);

}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_3(uint64_t a1, int a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (!a2)
    return objc_msgSend(v3, "_endFlowForCancellationWithReason:", CFSTR("Confirmation"));
  objc_msgSend(v3, "setEraseDataPlan:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setSkipLocalDataCheck:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_advanceFromState:", objc_msgSend(*(id *)(a1 + 32), "state"));
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "postFollowUp");

  if (v3)
    objc_msgSend(MEMORY[0x24BE2CFE0], "postFollowUp");
  return objc_msgSend(*(id *)(a1 + 32), "_endFlowWithReason:", CFSTR("Not Now"));
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "passcodeProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "verifyPasscode:", v3);

  return v5;
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "accountProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cacheLocalDevicePasscode:passcodeType:", v6, a3);

  return objc_msgSend(*(id *)(a1 + 32), "_advanceFromState:", objc_msgSend(*(id *)(a1 + 32), "state"));
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "passcodeProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "verifyScreenTimePasscode:", v3);

  return v5;
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_advanceFromState:", objc_msgSend(*(id *)(a1 + 32), "state"));
}

void __39__DKEraseFlow__viewControllerForState___block_invoke_10(uint64_t a1)
{
  NSObject *v2;
  void (**v3)(void);
  void *v4;
  int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint8_t v9[16];

  _DKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_229405000, v2, OS_LOG_TYPE_DEFAULT, "Requiring internet and presenting network settings", v9, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setContinueWithoutInternet:", 0);
  objc_msgSend(*(id *)(a1 + 32), "presentNetworkSettings");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "presentsNetworkSettingsModally");

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "presentedViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        objc_msgSend(*(id *)(a1 + 32), "_advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses:", v7);
    }

  }
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_102(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _DKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_229405000, v2, OS_LOG_TYPE_DEFAULT, "Continuing without internet", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setContinueWithoutInternet:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_advanceFromState:", objc_msgSend(*(id *)(a1 + 32), "state"));
}

BOOL __39__DKEraseFlow__viewControllerForState___block_invoke_103(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "cloudProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isUploadSupportedForCurrentNetwork");

  return (unint64_t)(v2 - 1) < 2;
}

BOOL __39__DKEraseFlow__viewControllerForState___block_invoke_2_104(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "cloudProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isUploadSupportedForCurrentNetwork");

  return v2 == 2;
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_3_105(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_advanceToState:", 5);
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_4_106(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setAllowExpensiveCellular:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_advanceFromState:", objc_msgSend(*(id *)(a1 + 32), "state"));
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_5_107(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endFlowForCancellationWithReason:", CFSTR("Cloud Upload"));
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_6_110(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "cloudProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelUpload");

  return objc_msgSend(*(id *)(a1 + 32), "_advanceFromState:", objc_msgSend(*(id *)(a1 + 32), "state"));
}

- (void)_nextStateFromState:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t (**v12)(void);
  char v13;
  void *v14;
  void (**v15)(id, uint64_t);
  void *v16;
  int v17;
  void (*v18)(id, uint64_t);
  _BOOL4 v19;
  void (**v20)(id, uint64_t);
  uint64_t v21;
  DKEraseFlow *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  void (**v26)(id, uint64_t);
  _QWORD v27[5];
  void (**v28)(id, uint64_t);

  v6 = (void (**)(id, uint64_t))a4;
  switch(a3)
  {
    case 0uLL:
      -[DKEraseFlow passcodeProvider](self, "passcodeProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isDevicePasscodeSet");

      if (v8)
      {
        v6[2](v6, 1);
        goto LABEL_25;
      }
      v22 = self;
      v23 = 1;
      goto LABEL_20;
    case 1uLL:
      -[DKEraseFlow passcodeProvider](self, "passcodeProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isScreenTimePasscodeSet");

      if (v10)
      {
        v6[2](v6, 2);
        goto LABEL_25;
      }
      v22 = self;
      v23 = 2;
      goto LABEL_20;
    case 2uLL:
      -[DKEraseFlow notableUserData](self, "notableUserData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "findMyEnabled") & 1) != 0)
      {
        -[DKEraseFlow hasInternetConnectivity](self, "hasInternetConnectivity");
        v12 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
        v13 = v12[2]();

        if ((v13 & 1) == 0)
        {
          -[DKEraseFlow accountProvider](self, "accountProvider");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __46__DKEraseFlow__nextStateFromState_completion___block_invoke;
          v27[3] = &unk_24F20E6A0;
          v27[4] = self;
          v28 = v6;
          objc_msgSend(v14, "primaryAppleAccountAllowsOfflineEraseWithCompletion:", v27);

          v15 = v28;
          goto LABEL_9;
        }
      }
      else
      {

      }
      v22 = self;
      v23 = 7;
LABEL_20:
      -[DKEraseFlow _nextStateFromState:completion:](v22, "_nextStateFromState:completion:", v23, v6);
      goto LABEL_25;
    case 3uLL:
      goto LABEL_23;
    case 4uLL:
      goto LABEL_13;
    case 5uLL:
      -[DKEraseFlow _nextStateFromState:completion:].cold.1();
    case 6uLL:
      if (-[DKEraseFlow cloudUploadSucceeded](self, "cloudUploadSucceeded")
        || -[DKEraseFlow skipLocalDataCheck](self, "skipLocalDataCheck")
        || (-[DKEraseFlow configuration](self, "configuration"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "skipBackup"),
            v16,
            v17))
      {
LABEL_13:
        v18 = v6[2];
LABEL_15:
        v20 = v6;
        v21 = 5;
        goto LABEL_24;
      }
      if (-[DKEraseFlow isCloudUploadInProgress](self, "isCloudUploadInProgress"))
      {
LABEL_23:
        v18 = v6[2];
        v20 = v6;
        v21 = 4;
LABEL_24:
        v18(v20, v21);
        goto LABEL_25;
      }
      -[DKEraseFlow cloudProvider](self, "cloudProvider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __46__DKEraseFlow__nextStateFromState_completion___block_invoke_111;
      v25[3] = &unk_24F20DFC0;
      v26 = v6;
      objc_msgSend(v24, "hasDataToUpload:", v25);

      v15 = v26;
LABEL_9:

LABEL_25:
      return;
    case 7uLL:
      v19 = -[DKEraseFlow continueWithoutInternet](self, "continueWithoutInternet");
      v18 = v6[2];
      if (v19)
        goto LABEL_15;
      v20 = v6;
      v21 = 6;
      goto LABEL_24;
    default:
      goto LABEL_25;
  }
}

void __46__DKEraseFlow__nextStateFromState_completion___block_invoke(uint64_t a1, char a2)
{
  id v3;
  _QWORD block[5];
  id v5;
  char v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__DKEraseFlow__nextStateFromState_completion___block_invoke_2;
  block[3] = &unk_24F20E970;
  v6 = a2;
  v3 = *(id *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __46__DKEraseFlow__nextStateFromState_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _DKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 48);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_229405000, v2, OS_LOG_TYPE_DEFAULT, "Allows offline erase %d", (uint8_t *)v5, 8u);
  }

  if (*(_BYTE *)(a1 + 48))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setContinueWithoutInternet:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_nextStateFromState:completion:", 7, *(_QWORD *)(a1 + 40));
}

uint64_t __46__DKEraseFlow__nextStateFromState_completion___block_invoke_111(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 3;
  else
    v3 = 5;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

+ (id)_stringForState:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return CFSTR("Introduction");
  else
    return *(&off_24F20E9D0 + a3 - 1);
}

- (BOOL)_isHomeButtonAllowedForState:(unint64_t)a3
{
  return (a3 < 8) & (0xEFu >> a3);
}

- (void)_disallowHomeButton
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  -[DKEraseFlow homeButtonConsumer](self, "homeButtonConsumer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _DKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_229405000, v4, OS_LOG_TYPE_DEFAULT, "Disallowing home button use...", v7, 2u);
    }

    objc_msgSend(MEMORY[0x24BEB0A78], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginConsumingPressesForButtonKind:eventConsumer:priority:", 1, self, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKEraseFlow setHomeButtonConsumer:](self, "setHomeButtonConsumer:", v6);

  }
}

- (void)_allowHomeButton
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[DKEraseFlow homeButtonConsumer](self, "homeButtonConsumer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _DKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_229405000, v4, OS_LOG_TYPE_DEFAULT, "Allowing home button use...", v6, 2u);
    }

    -[DKEraseFlow homeButtonConsumer](self, "homeButtonConsumer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[DKEraseFlow setHomeButtonConsumer:](self, "setHomeButtonConsumer:", 0);
  }
}

- (void)_presentEraseConfirmation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[DKEraseFlow notableUserData](self, "notableUserData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellularPlans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DKEraseConfirmationAlertController alertControllerWithCellularPlans:completion:](DKEraseConfirmationAlertController, "alertControllerWithCellularPlans:completion:", v6, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[DKEraseFlow navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)_eraseDevice
{
  void (**v3)(id, BOOL);

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[DKEraseFlow _sendTerminatedAnalyticsEventWithState:willErase:reason:](self, "_sendTerminatedAnalyticsEventWithState:willErase:reason:", -[DKEraseFlow state](self, "state"), 1, CFSTR("User Initiated"));
  -[DKEraseFlow eraseDevice](self, "eraseDevice");
  v3 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue();
  v3[2](v3, -[DKEraseFlow eraseDataPlan](self, "eraseDataPlan"));

}

- (void)_signOutAndEraseDevice
{
  __assert_rtn("-[DKEraseFlow _signOutAndEraseDevice]", "DKEraseFlow.m", 927, "self.navigationController.topViewController");
}

void __37__DKEraseFlow__signOutAndEraseDevice__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__DKEraseFlow__signOutAndEraseDevice__block_invoke_2;
  block[3] = &unk_24F20DDA0;
  v11 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __37__DKEraseFlow__signOutAndEraseDevice__block_invoke_2(uint64_t a1)
{
  NSObject *v3;
  uint64_t v4;

  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 40), "_eraseDevice");
  _DKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __37__DKEraseFlow__signOutAndEraseDevice__block_invoke_2_cold_1(a1, v3, v4);

  return objc_msgSend(*(id *)(a1 + 40), "_endFlowForCancellationWithReason:", CFSTR("Apple Account"));
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)eraseDevice
{
  return self->_eraseDevice;
}

- (void)setEraseDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)hasInternetConnectivity
{
  return self->_hasInternetConnectivity;
}

- (void)setHasInternetConnectivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)isBasebandDead
{
  return self->_isBasebandDead;
}

- (void)setIsBasebandDead:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)presentNetworkSettings
{
  return self->_presentNetworkSettings;
}

- (void)setPresentNetworkSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (DKAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (void)setAccountProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountProvider, a3);
}

- (DKFindMyProvider)findMyProvider
{
  return self->_findMyProvider;
}

- (void)setFindMyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_findMyProvider, a3);
}

- (DKNotableUserDataProvider)notableUserDataProvider
{
  return self->_notableUserDataProvider;
}

- (void)setNotableUserDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_notableUserDataProvider, a3);
}

- (DKPasscodeProvider)passcodeProvider
{
  return self->_passcodeProvider;
}

- (void)setPasscodeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeProvider, a3);
}

- (DKCloudProvider)cloudProvider
{
  return self->_cloudProvider;
}

- (void)setCloudProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cloudProvider, a3);
}

- (DKWalletProvider)walletProvider
{
  return self->_walletProvider;
}

- (void)setWalletProvider:(id)a3
{
  objc_storeStrong((id *)&self->_walletProvider, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (DKConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (UIViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
  objc_storeStrong((id *)&self->_initialViewController, a3);
}

- (BOOL)skipLocalDataCheck
{
  return self->_skipLocalDataCheck;
}

- (void)setSkipLocalDataCheck:(BOOL)a3
{
  self->_skipLocalDataCheck = a3;
}

- (BOOL)continueWithoutInternet
{
  return self->_continueWithoutInternet;
}

- (void)setContinueWithoutInternet:(BOOL)a3
{
  self->_continueWithoutInternet = a3;
}

- (BOOL)allowExpensiveCellular
{
  return self->_allowExpensiveCellular;
}

- (void)setAllowExpensiveCellular:(BOOL)a3
{
  self->_allowExpensiveCellular = a3;
}

- (DKNotableUserData)notableUserData
{
  return self->_notableUserData;
}

- (void)setNotableUserData:(id)a3
{
  objc_storeStrong((id *)&self->_notableUserData, a3);
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_pathEvaluator, a3);
}

- (id)cloudUploadProgressHandler
{
  return self->_cloudUploadProgressHandler;
}

- (void)setCloudUploadProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)cloudUploadCompletion
{
  return self->_cloudUploadCompletion;
}

- (void)setCloudUploadCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (float)cloudUploadProgress
{
  return self->_cloudUploadProgress;
}

- (void)setCloudUploadProgress:(float)a3
{
  self->_cloudUploadProgress = a3;
}

- (double)cloudUploadTimeRemaining
{
  return self->_cloudUploadTimeRemaining;
}

- (void)setCloudUploadTimeRemaining:(double)a3
{
  self->_cloudUploadTimeRemaining = a3;
}

- (DKCloudUploadResults)cloudUploadResults
{
  return self->_cloudUploadResults;
}

- (void)setCloudUploadResults:(id)a3
{
  objc_storeStrong((id *)&self->_cloudUploadResults, a3);
}

- (BOOL)isCloudUploadInProgress
{
  return self->_cloudUploadInProgress;
}

- (void)setCloudUploadInProgress:(BOOL)a3
{
  self->_cloudUploadInProgress = a3;
}

- (BOOL)cloudUploadSucceeded
{
  return self->_cloudUploadSucceeded;
}

- (void)setCloudUploadSucceeded:(BOOL)a3
{
  self->_cloudUploadSucceeded = a3;
}

- (BSInvalidatable)homeButtonConsumer
{
  return self->_homeButtonConsumer;
}

- (void)setHomeButtonConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_homeButtonConsumer, a3);
}

- (BOOL)eraseDataPlan
{
  return self->_eraseDataPlan;
}

- (void)setEraseDataPlan:(BOOL)a3
{
  self->_eraseDataPlan = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeButtonConsumer, 0);
  objc_storeStrong((id *)&self->_cloudUploadResults, 0);
  objc_storeStrong(&self->_cloudUploadCompletion, 0);
  objc_storeStrong(&self->_cloudUploadProgressHandler, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_notableUserData, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_walletProvider, 0);
  objc_storeStrong((id *)&self->_cloudProvider, 0);
  objc_storeStrong((id *)&self->_passcodeProvider, 0);
  objc_storeStrong((id *)&self->_notableUserDataProvider, 0);
  objc_storeStrong((id *)&self->_findMyProvider, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong(&self->_presentNetworkSettings, 0);
  objc_storeStrong(&self->_isBasebandDead, 0);
  objc_storeStrong(&self->_hasInternetConnectivity, 0);
  objc_storeStrong(&self->_eraseDevice, 0);
  objc_storeStrong(&self->_completion, 0);
}

void __37__DKEraseFlow_initWithConfiguration___block_invoke_20_cold_1(void *a1, NSObject *a2)
{
  void *v2;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = _DKIsInternalInstall();
  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "domain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(a1, "code"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = 138543362;
  v9 = a1;
  OUTLINED_FUNCTION_0_0(&dword_229405000, a2, v5, "Failed to erase: %{public}@", (uint8_t *)&v8);
  if (!v6)
  {

  }
}

void __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_229405000, a2, a3, "Failed to determine preparation requirements for primary Apple Account: %@", (uint8_t *)&v4);
}

- (void)_advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses:.cold.1()
{
  __assert_rtn("-[DKEraseFlow _advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses:]", "DKEraseFlow.m", 425, "internetWarningViewController.presentedViewController");
}

- (void)_advanceToState:.cold.1()
{
  __assert_rtn("-[DKEraseFlow _advanceToState:]", "DKEraseFlow.m", 552, "0");
}

- (void)_nextStateFromState:completion:.cold.1()
{
  __assert_rtn("-[DKEraseFlow _nextStateFromState:completion:]", "DKEraseFlow.m", 842, "0");
}

void __37__DKEraseFlow__signOutAndEraseDevice__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_229405000, a2, a3, "Failed to sign out of primary Apple account: %@", (uint8_t *)&v4);
}

@end
