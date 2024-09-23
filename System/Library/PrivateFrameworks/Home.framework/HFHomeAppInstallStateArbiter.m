@implementation HFHomeAppInstallStateArbiter

+ (HFHomeAppInstallStateArbiter)sharedInstance
{
  if (_MergedGlobals_321 != -1)
    dispatch_once(&_MergedGlobals_321, &__block_literal_global_2_35);
  return (HFHomeAppInstallStateArbiter *)(id)qword_1ED379E20;
}

- (NAFuture)homeAppInstalledFuture
{
  NAFuture *homeAppInstalledFuture;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NAFuture *v8;
  NAFuture *v9;

  homeAppInstalledFuture = self->_homeAppInstalledFuture;
  if (!homeAppInstalledFuture)
  {
    v4 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithBlock:scheduler:", &__block_literal_global_7_15, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reschedule:", v7);
    v8 = (NAFuture *)objc_claimAutoreleasedReturnValue();
    v9 = self->_homeAppInstalledFuture;
    self->_homeAppInstalledFuture = v8;

    homeAppInstalledFuture = self->_homeAppInstalledFuture;
  }
  return homeAppInstalledFuture;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeAppInstallStateArbiter observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSHashTable)observers
{
  return self->_observers;
}

void __46__HFHomeAppInstallStateArbiter_sharedInstance__block_invoke_2()
{
  HFHomeAppInstallStateArbiter *v0;
  void *v1;

  v0 = objc_alloc_init(HFHomeAppInstallStateArbiter);
  v1 = (void *)qword_1ED379E20;
  qword_1ED379E20 = (uint64_t)v0;

}

- (HFHomeAppInstallStateArbiter)init
{
  HFHomeAppInstallStateArbiter *v2;
  uint64_t v3;
  NSHashTable *observers;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFHomeAppInstallStateArbiter;
  v2 = -[HFHomeAppInstallStateArbiter init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    if (-[HFHomeAppInstallStateArbiter _fastPath_isHomeAppInstalled](v2, "_fastPath_isHomeAppInstalled"))
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFHomeAppInstallStateArbiter setHomeAppInstalledFuture:](v2, "setHomeAppInstalledFuture:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:", v2);
    }

  }
  return v2;
}

- (void)setHomeAppInstalledFuture:(id)a3
{
  objc_storeStrong((id *)&self->_homeAppInstalledFuture, a3);
}

- (BOOL)_fastPath_isHomeAppInstalled
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HFPlatformSpecificHomeAppBundleID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    HFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "We are running in Home.app; using fast path for install check",
        buf,
        2u);
    }
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v6 = v9;

    if (!v6)
      goto LABEL_13;
    -[NSObject containingBundle](v6, "containingBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HFPlatformSpecificHomeAppBundleID();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (v13)
    {
      HFLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "We are contained in Home.app's bundle; using fast path for install check",
          v17,
          2u);
      }
      v7 = 1;
    }
    else
    {
LABEL_13:
      HFLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Fast path for Home.app install check is not available", v16, 2u);
      }
      v7 = 0;
    }

  }
  return v7;
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeAppInstallStateArbiter observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

void __54__HFHomeAppInstallStateArbiter_homeAppInstalledFuture__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CA5860];
  v3 = a2;
  HFPlatformSpecificHomeAppBundleID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationProxyForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInstalled");

  HFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v7;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Initializing Home.app install state to: %{BOOL}d", (uint8_t *)v10, 8u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:", v9);

}

- (void)_applications:(id)a3 didInstall:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "na_any:", &__block_literal_global_12_15))
  {
    HFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v10 = v4;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Home.app install state changed: %d", buf, 8u);
    }

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__HFHomeAppInstallStateArbiter__applications_didInstall___block_invoke_13;
    v7[3] = &unk_1EA73D570;
    v7[4] = self;
    v8 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v7);
  }
}

uint64_t __57__HFHomeAppInstallStateArbiter__applications_didInstall___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  __HFHomeApplicationBundleIdentifiers_block_invoke();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v3, "containsObject:", v4);
  return v5;
}

void __57__HFHomeAppInstallStateArbiter__applications_didInstall___block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHomeAppInstalledFuture:", v4);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "installStateArbiter:installStateDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSURL)homeAppBundleURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CA5860];
  HFPlatformSpecificHomeAppBundleID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationProxyForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (void)applicationsWillUninstall:(id)a3
{
  -[HFHomeAppInstallStateArbiter _applications:didInstall:](self, "_applications:didInstall:", a3, 0);
}

- (void)applicationsDidInstall:(id)a3
{
  -[HFHomeAppInstallStateArbiter _applications:didInstall:](self, "_applications:didInstall:", a3, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_homeAppInstalledFuture, 0);
}

@end
