@implementation FIFitnessAppsStateObserver

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (FIFitnessAppsStateObserver)init
{
  void *v3;
  FIFitnessAppsStateObserver *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("com.apple.ActivityMonitorApp");
  v6[1] = CFSTR("com.apple.Fitness");
  v6[2] = CFSTR("com.apple.Mind");
  v6[3] = CFSTR("com.apple.SessionTrackerApp");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FIFitnessAppsStateObserver initWithBundleIdentifiers:](self, "initWithBundleIdentifiers:", v3);

  return v4;
}

- (FIFitnessAppsStateObserver)initWithBundleIdentifiers:(id)a3
{
  id v5;
  FIFitnessAppsStateObserver *v6;
  FIFitnessAppsStateObserver *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *fitnessAppsInstallationState;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FIFitnessAppsStateObserver;
  v6 = -[FIFitnessAppsStateObserver init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_fitnessAppsRestrictedState = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    fitnessAppsInstallationState = v7->_fitnessAppsInstallationState;
    v7->_fitnessAppsInstallationState = v8;

    objc_storeStrong((id *)&v7->_appBundleIdentifersToMonitor, a3);
    -[FIFitnessAppsStateObserver _cacheInitialFitnessAppsInstallState](v7, "_cacheInitialFitnessAppsInstallState");
    -[FIFitnessAppsStateObserver _cacheInitialFitnessAppsRestrictedState](v7, "_cacheInitialFitnessAppsRestrictedState");
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", v7);

  }
  return v7;
}

- (int64_t)installStateForBundleIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  int64_t v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = -[FIFitnessAppsStateObserver _lock_installStateForBundleIdentifier:](self, "_lock_installStateForBundleIdentifier:", v5);

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (int64_t)_lock_installStateForBundleIdentifier:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_fitnessAppsInstallationState, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)_cacheInitialFitnessAppsInstallState
{
  NSObject *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  os_unfair_lock_t lock;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21168F000, v3, OS_LOG_TYPE_DEFAULT, "Caching app installation states", buf, 2u);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_appBundleIdentifersToMonitor;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isInstalled");

        _HKInitializeLogging();
        v13 = *MEMORY[0x24BDD2FA8];
        v14 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          v15 = &unk_24CC58BD0;
          if (v14)
          {
            *(_DWORD *)buf = 138543362;
            v22 = v9;
            _os_log_impl(&dword_21168F000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ is installed", buf, 0xCu);
            v15 = &unk_24CC58BD0;
          }
        }
        else
        {
          v15 = &unk_24CC58BE8;
          if (v14)
          {
            *(_DWORD *)buf = 138543362;
            v22 = v9;
            _os_log_impl(&dword_21168F000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ is uninstalled", buf, 0xCu);
            v15 = &unk_24CC58BE8;
          }
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fitnessAppsInstallationState, "setObject:forKeyedSubscript:", v15, v9);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
}

- (void)_updateCurrentFitnessAppsRestrictedStateWithProxies:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  id WeakRetained;
  char v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  __CFString *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "appState", (_QWORD)v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isRestricted");

        if ((v10 & 1) != 0)
        {
          LODWORD(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  if (self->_fitnessAppsRestrictedState == v6)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_fitnessAppsRestrictedState = v6;
    os_unfair_lock_unlock(&self->_lock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = CFSTR("Allowed");
      if ((_DWORD)v6)
        v13 = CFSTR("Restricted");
      v14 = v13;
      _HKInitializeLogging();
      v15 = *MEMORY[0x24BDD2FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v14;
        _os_log_impl(&dword_21168F000, v15, OS_LOG_TYPE_DEFAULT, "Fitness App Restricted State changed to %{public}@, notifying delegate", buf, 0xCu);
      }
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "fitnessAppsStateObserver:restrictedStateDidChange:", self, v6);

    }
  }

}

- (void)_cacheInitialFitnessAppsRestrictedState
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_appBundleIdentifersToMonitor;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[FIFitnessAppsStateObserver _updateCurrentFitnessAppsRestrictedStateWithProxies:](self, "_updateCurrentFitnessAppsRestrictedStateWithProxies:", v3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FIFitnessAppsStateObserver;
  -[FIFitnessAppsStateObserver dealloc](&v4, sel_dealloc);
}

- (BOOL)areFitnessAppsRestricted
{
  FIFitnessAppsStateObserver *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_fitnessAppsRestrictedState == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)_filteredAppProxies:(id)a3
{
  void *v3;
  NSArray *appBundleIdentifersToMonitor;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x24BDBCF20];
  appBundleIdentifersToMonitor = self->_appBundleIdentifersToMonitor;
  v5 = a3;
  objc_msgSend(v3, "setWithArray:", appBundleIdentifersToMonitor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__FIFitnessAppsStateObserver__filteredAppProxies___block_invoke;
  v10[3] = &unk_24CC4E780;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v5, "hk_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __50__FIFitnessAppsStateObserver__filteredAppProxies___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)applicationStateDidChange:(id)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[FIFitnessAppsStateObserver _filteredAppProxies:](self, "_filteredAppProxies:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21168F000, v5, OS_LOG_TYPE_DEFAULT, "App State notice received for monitored apps", v6, 2u);
    }
    -[FIFitnessAppsStateObserver _updateCurrentFitnessAppsRestrictedStateWithProxies:](self, "_updateCurrentFitnessAppsRestrictedStateWithProxies:", v4);
  }

}

- (void)applicationsDidUninstall:(id)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[FIFitnessAppsStateObserver _filteredAppProxies:](self, "_filteredAppProxies:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21168F000, v5, OS_LOG_TYPE_DEFAULT, "Uninstall notice received for monitored apps", v6, 2u);
    }
    -[FIFitnessAppsStateObserver _updateCurrentFitnessAppsInstallStateWithProxies:newState:](self, "_updateCurrentFitnessAppsInstallStateWithProxies:newState:", v4, 2);
  }

}

- (void)applicationsDidInstall:(id)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[FIFitnessAppsStateObserver _filteredAppProxies:](self, "_filteredAppProxies:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21168F000, v5, OS_LOG_TYPE_DEFAULT, "Install notice received for monitored apps", v6, 2u);
    }
    -[FIFitnessAppsStateObserver _updateCurrentFitnessAppsInstallStateWithProxies:newState:](self, "_updateCurrentFitnessAppsInstallStateWithProxies:newState:", v4, 1);
  }

}

- (void)_updateCurrentFitnessAppsInstallStateWithProxies:(id)a3 newState:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  id WeakRetained;
  char v18;
  id v19;
  void *v20;
  const __CFString *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    v12 = CFSTR("Uninstalled");
    if (a4 == 1)
      v12 = CFSTR("Installed");
    v21 = v12;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[FIFitnessAppsStateObserver _lock_installStateForBundleIdentifier:](self, "_lock_installStateForBundleIdentifier:", v14) != a4)
        {
          _HKInitializeLogging();
          v15 = *MEMORY[0x24BDD2FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v27 = v14;
            v28 = 2114;
            v29 = v21;
            _os_log_impl(&dword_21168F000, v15, OS_LOG_TYPE_DEFAULT, "Updating installed stated for %{public}@ to %{public}@", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fitnessAppsInstallationState, "setObject:forKeyedSubscript:", v16, v14);

          objc_msgSend(v7, "addObject:", v14);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_lock);
  if (objc_msgSend(v7, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      v19 = objc_loadWeakRetained((id *)&self->_delegate);
      v20 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v19, "fitnessAppsStateObserver:applicationInstallStateDidChangeForBundleIdentifiers:", self, v20);

    }
  }

}

- (FIFitnessAppsStateObserverDelegate)delegate
{
  return (FIFitnessAppsStateObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fitnessAppsInstallationState, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifersToMonitor, 0);
}

@end
