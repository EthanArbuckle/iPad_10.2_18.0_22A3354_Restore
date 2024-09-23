@implementation HKLocalAppInstallationManager

- (HKLocalAppInstallationManager)initWithBundleIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKLocalAppInstallationManager;
  return -[HKWatchAppInstallationManager initWithBundleIdentifier:](&v4, sel_initWithBundleIdentifier_, a3);
}

- (id)isWatchAppInstalledWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWatchAppInstallationManager bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "applicationIsInstalled:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)startObserving
{
  NSObject *v3;
  void *v4;
  int v5;
  HKLocalAppInstallationManager *v6;
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

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (void)stopObserving
{
  NSObject *v3;
  void *v4;
  int v5;
  HKLocalAppInstallationManager *v6;
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

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *queue;
  _QWORD block[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKWatchAppInstallationManager bundleIdentifier](self, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if (v11)
        {
          queue = self->super._queue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __56__HKLocalAppInstallationManager_applicationsDidInstall___block_invoke;
          block[3] = &unk_1E37E6770;
          block[4] = self;
          dispatch_async(queue, block);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

uint64_t __56__HKLocalAppInstallationManager_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *queue;
  _QWORD block[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKWatchAppInstallationManager bundleIdentifier](self, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if (v11)
        {
          queue = self->super._queue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __58__HKLocalAppInstallationManager_applicationsDidUninstall___block_invoke;
          block[3] = &unk_1E37E6770;
          block[4] = self;
          dispatch_async(queue, block);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

uint64_t __58__HKLocalAppInstallationManager_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
}

@end
