@implementation MSDSetupUIController

+ (MSDSetupUIController)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_3);
  return (MSDSetupUIController *)(id)sharedInstance_sharedInstance_0;
}

void __38__MSDSetupUIController_sharedInstance__block_invoke()
{
  MSDSetupUIController *v0;
  void *v1;

  v0 = objc_alloc_init(MSDSetupUIController);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void)pushViewController:(id)a3 andRemoveTopmostView:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v6 = a3;
  -[MSDSetupUIController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__MSDSetupUIController_pushViewController_andRemoveTopmostView___block_invoke;
  v11[3] = &unk_24F47D3E8;
  v11[4] = self;
  v12 = v6;
  v14 = a4;
  v13 = v8;
  v9 = v8;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __64__MSDSetupUIController_pushViewController_andRemoveTopmostView___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__MSDSetupUIController_pushViewController_andRemoveTopmostView___block_invoke_2;
  v6[3] = &unk_24F47D3C0;
  v9 = *(_BYTE *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "pushViewController:completion:", v3, v6);

}

void __64__MSDSetupUIController_pushViewController_andRemoveTopmostView___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 48))
  {
    defaultLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = (id)objc_opt_class();
      v3 = v9;
      _os_log_impl(&dword_22A6E6000, v2, OS_LOG_TYPE_DEFAULT, "Removing top most view: %{public}@", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setViewControllers:", v6);

  }
}

- (void)popTopmostViewController
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__MSDSetupUIController_popTopmostViewController__block_invoke;
  block[3] = &unk_24F47D240;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __48__MSDSetupUIController_popTopmostViewController__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

- (void)setCompletionHandler:(id)a3
{
  void *v4;
  id completionHandler;

  v4 = (void *)MEMORY[0x22E2E02B4](a3, a2);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v4;

}

- (void)setupCompleteWithStoreID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_22A6E6000, v5, OS_LOG_TYPE_DEFAULT, "MobileStoreDemo setup UI complete with store ID: %@", buf, 0xCu);
  }

  if (v4)
  {
    v11 = *MEMORY[0x24BE676C0];
    v12 = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  defaultLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_22A6E6000, v7, OS_LOG_TYPE_DEFAULT, "Starting demod with options: %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendAutoEnrollmentResult:withStoreId:withHelpMenuRowSelection:", v4, self->_helpMenuUserTapped, self->_autoEnrollmentTimeStamp);

  objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "prepareWithOptions:", v6);

  -[MSDSetupUIController _setupComplete:](self, "_setupComplete:", v10);
}

- (void)quitToCustomerFlow
{
  NSObject *v3;
  uint8_t v4[16];

  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22A6E6000, v3, OS_LOG_TYPE_DEFAULT, "MobileStoreDemo setup UI exit, proceed to customer Buddy flow", v4, 2u);
  }

  -[MSDSetupUIController _setupComplete:](self, "_setupComplete:", 0);
}

- (void)quitToOfflineMode
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[16];

  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22A6E6000, v3, OS_LOG_TYPE_DEFAULT, "MobileStoreDemo setup UI exit, proceed to offline mode", v6, 2u);
  }

  objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enterOfflineModeWithOptions:error:", 0, 0);

  -[MSDSetupUIController _setupComplete:](self, "_setupComplete:", v5);
}

- (BOOL)hasSecureCookie
{
  void *v2;
  uint64_t v3;
  _BOOL4 v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "typeOfDemoDevice");

  v5 = v3 == 5 || v3 == 3;
  defaultLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl(&dword_22A6E6000, v6, OS_LOG_TYPE_DEFAULT, "Device has secure cookie: %d", (uint8_t *)v8, 8u);
  }

  return v5;
}

- (void)quitToHomeScreen
{
  NSObject *v3;
  uint8_t v4[16];

  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22A6E6000, v3, OS_LOG_TYPE_DEFAULT, "MobileStoreDemo setup UI exit, proceed to home screen", v4, 2u);
  }

  -[MSDSetupUIController _setupComplete:](self, "_setupComplete:", 1);
}

- (void)setHelpMenuRowSelection:(id)a3
{
  NSData *v4;
  NSData *helpMenuUserTapped;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 0, 0);
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  helpMenuUserTapped = self->_helpMenuUserTapped;
  self->_helpMenuUserTapped = v4;

}

- (void)markAsNotDemoAndEraseDataPlan:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  uint8_t buf[16];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  dispatch_semaphore_t v25;

  v3 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = dispatch_semaphore_create(0);
  if (os_variant_has_internal_content()
    && (+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "skipMarkAsNotDemo"),
        v5,
        v6))
  {
    defaultLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A6E6000, v17, OS_LOG_TYPE_DEFAULT, "Skipping making the device as not demo...", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "typeOfDemoDevice");

    if (v8 == 5)
    {
      objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getCurrentDeviceLanguage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getCurrentDeviceRegion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sendAutoEnrollmentAbortEvent:countryCode:", v11, v13);

    }
    defaultLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A6E6000, v14, OS_LOG_TYPE_DEFAULT, "Requesting device to be marked as not demo", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __54__MSDSetupUIController_markAsNotDemoAndEraseDataPlan___block_invoke;
    v18[3] = &unk_24F47D410;
    v18[4] = &v20;
    objc_msgSend(v15, "markAsNotDemoWithCompletion:", v18);

    defaultLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A6E6000, v16, OS_LOG_TYPE_DEFAULT, "Waiting for mark as demo to complete...", buf, 2u);
    }

    dispatch_semaphore_wait((dispatch_semaphore_t)v21[5], 0xFFFFFFFFFFFFFFFFLL);
  }
  -[MSDSetupUIController _startEACSWithReason:eraseDataPlan:](self, "_startEACSWithReason:eraseDataPlan:", CFSTR("Not a Demo Device Erase"), v3);
  _Block_object_dispose(&v20, 8);

}

void __54__MSDSetupUIController_markAsNotDemoAndEraseDataPlan___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  defaultLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_22A6E6000, v6, OS_LOG_TYPE_DEFAULT, "MarkAsNotDemo returned success: %d; error: %{public}@",
      (uint8_t *)v7,
      0x12u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (void)disconnectWiFi
{
  id v2;

  objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnectAndForgetWiFi:", 0);

}

- (void)enableLocationServices
{
  NSObject *v2;
  uint8_t v3[16];

  defaultLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_22A6E6000, v2, OS_LOG_TYPE_DEFAULT, "Enabling location services...", v3, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBFA88], "setLocationServicesEnabled:", 1);
}

- (void)saveLocationServicesState
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__MSDSetupUIController_saveLocationServicesState__block_invoke;
  block[3] = &unk_24F47D240;
  block[4] = self;
  if (saveLocationServicesState_onceToken != -1)
    dispatch_once(&saveLocationServicesState_onceToken, block);
}

void __49__MSDSetupUIController_saveLocationServicesState__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  dispatch_time_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  intptr_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setOriginalLocationServicesState:", objc_msgSend(*(id *)(a1 + 32), "hasSecureCookie"));
  v2 = dispatch_semaphore_create(0);
  v3 = dispatch_time(0, 30000000000);
  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A6E6000, v4, OS_LOG_TYPE_DEFAULT, "Saving original Location Services state...", buf, 2u);
  }

  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __49__MSDSetupUIController_saveLocationServicesState__block_invoke_20;
  v12 = &unk_24F47D350;
  v13 = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v14 = v6;
  dispatch_async(v5, &v9);

  if (dispatch_semaphore_wait(v6, v3))
  {
    defaultLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "originalLocationServicesState", v9, v10, v11, v12, v13);
      *(_DWORD *)buf = 67109376;
      v16 = 30;
      v17 = 1024;
      v18 = v8;
      _os_log_impl(&dword_22A6E6000, v7, OS_LOG_TYPE_DEFAULT, "Timed out waiting for location services state after %ds; assume Location Services is %{BOOL}d",
        buf,
        0xEu);
    }

  }
}

intptr_t __49__MSDSetupUIController_saveLocationServicesState__block_invoke_20(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setOriginalLocationServicesState:", objc_msgSend(MEMORY[0x24BDBFA88], "locationServicesEnabled:", 0));
  defaultLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "originalLocationServicesState");
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_22A6E6000, v2, OS_LOG_TYPE_DEFAULT, "Saved original Location Services state as %{BOOL}d", (uint8_t *)v5, 8u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_setupComplete:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD block[5];
  BOOL v9;

  -[MSDSetupUIController _restoreLocationServicesState](self, "_restoreLocationServicesState");
  -[MSDSetupUIController completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__MSDSetupUIController__setupComplete___block_invoke;
    block[3] = &unk_24F47D438;
    v9 = a3;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22A6E6000, v6, OS_LOG_TYPE_DEFAULT, "No completion handler provided", v7, 2u);
    }

  }
}

void __39__MSDSetupUIController__setupComplete___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void (**v4)(_QWORD, _QWORD);
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_22A6E6000, v2, OS_LOG_TYPE_DEFAULT, "Calling MobileStoreDemoSetupUI completion handler with success=%{BOOL}d", (uint8_t *)v5, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, *(unsigned __int8 *)(a1 + 40));

}

- (void)_startEACSWithReason:(id)a3 eraseDataPlan:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a4;
  v5 = a3;
  defaultLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22A6E6000, v6, OS_LOG_TYPE_DEFAULT, "Starting Erase Content and Settings...", v10, 2u);
  }

  v7 = objc_alloc_init(MEMORY[0x24BE2E758]);
  objc_msgSend(v7, "setEraseDataPlan:", v4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2E760]), "initWithMode:options:reason:", 4, v7, v5);

  objc_msgSend(MEMORY[0x24BE2E768], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetWithRequest:completion:", v8, &__block_literal_global_25);

}

void __59__MSDSetupUIController__startEACSWithReason_eraseDataPlan___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v8 = 138543362;
      v9 = v2;
      v5 = "Request to erase all content and settings failed =  %{public}@";
      v6 = v3;
      v7 = 12;
LABEL_6:
      _os_log_impl(&dword_22A6E6000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    v5 = "Reset was successful";
    v6 = v3;
    v7 = 2;
    goto LABEL_6;
  }

}

- (void)_restoreLocationServicesState
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = -[MSDSetupUIController originalLocationServicesState](self, "originalLocationServicesState");
    _os_log_impl(&dword_22A6E6000, v3, OS_LOG_TYPE_DEFAULT, "Restoring Location Services state to %{BOOL}d", (uint8_t *)v4, 8u);
  }

  objc_msgSend(MEMORY[0x24BDBFA88], "setLocationServicesEnabled:", -[MSDSetupUIController originalLocationServicesState](self, "originalLocationServicesState"));
}

- (double)autoEnrollmentTimeStamp
{
  return self->_autoEnrollmentTimeStamp;
}

- (void)setAutoEnrollmentTimeStamp:(double)a3
{
  self->_autoEnrollmentTimeStamp = a3;
}

- (BFFNavigationController)navigationController
{
  return self->_navigationController;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSData)helpMenuUserTapped
{
  return self->_helpMenuUserTapped;
}

- (void)setHelpMenuUserTapped:(id)a3
{
  objc_storeStrong((id *)&self->_helpMenuUserTapped, a3);
}

- (BOOL)originalLocationServicesState
{
  return self->_originalLocationServicesState;
}

- (void)setOriginalLocationServicesState:(BOOL)a3
{
  self->_originalLocationServicesState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helpMenuUserTapped, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
