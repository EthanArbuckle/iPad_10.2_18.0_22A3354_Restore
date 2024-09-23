@implementation ATXIntentMetadataCacheInvalidationMonitor

- (void)setDelegateAndStartMonitoring:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (id)objc_msgSend(v6, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  -[ATXIntentMetadataCacheInvalidationMonitor setDelegateAndStartMonitoring:userDefaults:](self, "setDelegateAndStartMonitoring:userDefaults:", v5, v7);

}

- (void)setDelegateAndStartMonitoring:(id)a3 userDefaults:(id)a4
{
  id v6;

  objc_storeStrong((id *)&self->_userDefaults, a4);
  v6 = a3;
  objc_storeWeak((id *)&self->_delegate, v6);

  -[ATXIntentMetadataCacheInvalidationMonitor _listenForAppRegistrationAndUninstall](self, "_listenForAppRegistrationAndUninstall");
  -[ATXIntentMetadataCacheInvalidationMonitor _checkForOSUpdate](self, "_checkForOSUpdate");
}

- (void)_listenForAppRegistrationAndUninstall
{
  ATXInternalAppRegistrationNotification *v3;
  ATXInternalAppRegistrationNotification *appRegistrationListener;
  ATXInternalAppRegistrationNotification *v5;
  uint64_t v6;
  _ATXInternalUninstallNotification *v7;
  _ATXInternalUninstallNotification *appUninstallListener;
  _ATXInternalUninstallNotification *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  objc_initWeak(&location, self);
  v3 = (ATXInternalAppRegistrationNotification *)objc_opt_new();
  appRegistrationListener = self->_appRegistrationListener;
  self->_appRegistrationListener = v3;

  v5 = self->_appRegistrationListener;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__ATXIntentMetadataCacheInvalidationMonitor__listenForAppRegistrationAndUninstall__block_invoke;
  v12[3] = &unk_1E82DAE70;
  objc_copyWeak(&v13, &location);
  -[ATXInternalAppRegistrationNotification registerForNotificationsWithRegisterBlock:](v5, "registerForNotificationsWithRegisterBlock:", v12);
  v7 = (_ATXInternalUninstallNotification *)objc_opt_new();
  appUninstallListener = self->_appUninstallListener;
  self->_appUninstallListener = v7;

  v9 = self->_appUninstallListener;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __82__ATXIntentMetadataCacheInvalidationMonitor__listenForAppRegistrationAndUninstall__block_invoke_9;
  v10[3] = &unk_1E82DAE98;
  objc_copyWeak(&v11, &location);
  -[_ATXInternalUninstallNotification registerForNotificationsWithUninstallBlock:](v9, "registerForNotificationsWithUninstallBlock:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __82__ATXIntentMetadataCacheInvalidationMonitor__listenForAppRegistrationAndUninstall__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCacheInvalidationMonitor received ATXInternalAppRegistrationNotification", v7, 2u);
    }

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v3);
    objc_msgSend(WeakRetained, "_notifyDelegateApplicationsDidUpdate:", v6);

  }
}

void __82__ATXIntentMetadataCacheInvalidationMonitor__listenForAppRegistrationAndUninstall__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCacheInvalidationMonitor received _ATXInternalUninstallNotification", v6, 2u);
    }

    objc_msgSend(WeakRetained, "_notifyDelegateApplicationsDidUninstall:", v3);
  }

}

- (id)_getCurrentBuild
{
  return (id)objc_msgSend(MEMORY[0x1E0D81590], "currentOsBuild");
}

- (void)_checkForOSUpdate
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("ATXIntentCache.OSVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXIntentMetadataCacheInvalidationMonitor _getCurrentBuild](self, "_getCurrentBuild");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) == 0)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCacheInvalidationMonitor determined that OS updated", v6, 2u);
    }

    -[ATXIntentMetadataCacheInvalidationMonitor _notifyDelegateSystemDidUpdate](self, "_notifyDelegateSystemDidUpdate");
  }
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v4, CFSTR("ATXIntentCache.OSVersion"));

}

- (void)_notifyDelegateApplicationsDidUpdate:(id)a3
{
  ATXIntentMetadataCacheInvalidationDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "applicationsDidUpdate:", v4);

}

- (void)_notifyDelegateApplicationsDidUninstall:(id)a3
{
  ATXIntentMetadataCacheInvalidationDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "applicationsDidUninstall:", v4);

}

- (void)_notifyDelegateSystemDidUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "systemDidUpdate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_appUninstallListener, 0);
  objc_storeStrong((id *)&self->_appRegistrationListener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
