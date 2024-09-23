@implementation HKPairedDeviceAppInstallationManager

- (HKPairedDeviceAppInstallationManager)initWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HKPairedDeviceAppInstallationManager *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getNRPairedDeviceRegistryClass_softClass;
  v14 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v10[3] = &unk_1E37E8690;
    v10[4] = &v11;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v6, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKPairedDeviceAppInstallationManager initWithBundleIdentifier:forPairedDeviceRegistry:](self, "initWithBundleIdentifier:forPairedDeviceRegistry:", v4, v7);

  return v8;
}

- (HKPairedDeviceAppInstallationManager)initWithBundleIdentifier:(id)a3 forPairedDeviceRegistry:(id)a4
{
  id v7;
  HKPairedDeviceAppInstallationManager *v8;
  HKPairedDeviceAppInstallationManager *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKPairedDeviceAppInstallationManager;
  v8 = -[HKWatchAppInstallationManager initWithBundleIdentifier:](&v11, sel_initWithBundleIdentifier_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong(&v8->_pairedDeviceRegistry, a4);

  return v9;
}

- (id)isWatchAppInstalledWithError:(id *)a3
{
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v19 = 0;
  objc_msgSend(self->_pairedDeviceRegistry, "getActivePairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v6 = (_QWORD *)getNRDevicePropertyIsSetupSymbolLoc_ptr;
    v23 = getNRDevicePropertyIsSetupSymbolLoc_ptr;
    if (!getNRDevicePropertyIsSetupSymbolLoc_ptr)
    {
      v7 = (void *)NanoRegistryLibrary();
      v6 = dlsym(v7, "NRDevicePropertyIsSetup");
      v21[3] = (uint64_t)v6;
      getNRDevicePropertyIsSetupSymbolLoc_ptr = (uint64_t)v6;
    }
    _Block_object_dispose(&v20, 8);
    if (!v6)
      -[HKPairedDeviceAppInstallationManager isWatchAppInstalledWithError:].cold.1();
    objc_msgSend(v5, "valueForProperty:", *v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKWatchAppInstallationManager bundleIdentifier](self, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v9 & 1) != 0)
    {
      v17 = 0;
      v12 = objc_msgSend(v10, "getApplicationIsInstalled:withBundleID:onPairedDevice:error:", &v19, v11, v5, &v17);
      v13 = v17;
    }
    else
    {
      v18 = 0;
      v12 = objc_msgSend(v10, "getApplicationWithBundleID:willInstallAfterPairing:onDevice:error:", v11, &v19, v5, &v18);
      v13 = v18;
    }
    v15 = v13;

    if ((v12 & 1) != 0)
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
    else
      -[HKPairedDeviceAppInstallationManager handleErrorWithAppConduitFetch:errorOut:](self, "handleErrorWithAppConduitFetch:errorOut:", v15, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)handleErrorWithAppConduitFetch:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError(v6);
  }

  _HKInitializeLogging();
  HKLogInfrastructure();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[HKPairedDeviceAppInstallationManager handleErrorWithAppConduitFetch:errorOut:].cold.1(self, (uint64_t)v7, v8);

  return 0;
}

- (void)startObserving
{
  NSObject *v3;
  void *v4;
  int v5;
  HKPairedDeviceAppInstallationManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting observation", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__watchAppInstallStateDidChange_, *MEMORY[0x1E0CF8838], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__watchAppInstallStateDidChange_, *MEMORY[0x1E0CF8840], 0);

}

- (void)stopObserving
{
  NSObject *v3;
  void *v4;
  int v5;
  HKPairedDeviceAppInstallationManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping observation", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CF8838], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CF8840], 0);

}

- (void)_watchAppInstallStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *queue;
  NSObject *v14;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v6;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received pairing/active notification: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CF8830]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HKWatchAppInstallationManager bundleIdentifier](self, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if (v12)
    {
      queue = self->super._queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__HKPairedDeviceAppInstallationManager__watchAppInstallStateDidChange___block_invoke;
      block[3] = &unk_1E37E6770;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[HKPairedDeviceAppInstallationManager _watchAppInstallStateDidChange:].cold.1(v14);

  }
}

uint64_t __71__HKPairedDeviceAppInstallationManager__watchAppInstallStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pairedDeviceRegistry, 0);
}

- (void)isWatchAppInstalledWithError:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyIsSetup(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("HKWatchAppInstallationManager.m"), 27, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)handleErrorWithAppConduitFetch:(NSObject *)a3 errorOut:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_19A0E6000, a3, OS_LOG_TYPE_ERROR, "Failed to check install status of %@ with error: %@", (uint8_t *)&v6, 0x16u);

}

- (void)_watchAppInstallStateDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "Notification user info dictionary is of wrong type", v1, 2u);
}

@end
