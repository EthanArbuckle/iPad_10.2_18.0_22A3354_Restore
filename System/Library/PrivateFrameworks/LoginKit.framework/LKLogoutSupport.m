@implementation LKLogoutSupport

- (LKLogoutSupport)init
{
  LKLogoutSupport *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LKLogoutSupport;
  v2 = -[LKLogoutSupport init](&v4, sel_init);
  if (v2)
    LKRegisterLoginKitLogging();
  return v2;
}

- (BOOL)_canLogoutToLoginSession
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int CanSupportLoginUI;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  BOOL v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loginUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userAuxiliaryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v3, "userAuxiliaryString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v5;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_2167FC000, v9, OS_LOG_TYPE_DEFAULT, "User locale (%@) is different from login user locale (%@)", (uint8_t *)&v19, 0x16u);

    }
  }
  CanSupportLoginUI = _AXSCurrentAccessibilitySettingsCanSupportLoginUI();
  if (!CanSupportLoginUI)
  {
    v12 = LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_2167FC000, v12, OS_LOG_TYPE_DEFAULT, "Accessibility settings are on for user", (uint8_t *)&v19, 2u);
    }
  }
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentUser");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAuditor");

  v16 = v15 ^ 1;
  if (!CanSupportLoginUI)
    v16 = 0;
  if (v7)
    v17 = v16;
  else
    v17 = 0;

  return v17;
}

- (void)logoutToLoginSessionWithCompletionHandler:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a3;
  v4 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2167FC000, v4, OS_LOG_TYPE_DEFAULT, "Switch to the login session", v6, 2u);
  }
  kdebug_trace();
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logoutToLoginSessionWithCompletionHandler:", v3);

}

- (void)logoutToLoginUserWithCompletionHandler:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a3;
  v4 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2167FC000, v4, OS_LOG_TYPE_DEFAULT, "Switch to the login user", v6, 2u);
  }
  kdebug_trace();
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switchToLoginUserWithCompletionHandler:", v3);

}

- (void)_syncPreferencesIfNeeded
{
  _QWORD block[5];

  if (_os_feature_enabled_impl())
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__LKLogoutSupport__syncPreferencesIfNeeded__block_invoke;
    block[3] = &unk_24D59AF00;
    block[4] = self;
    if (_syncPreferencesIfNeeded_onceToken != -1)
      dispatch_once(&_syncPreferencesIfNeeded_onceToken, block);
  }
}

void __43__LKLogoutSupport__syncPreferencesIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t i;
  const __CFString *v14;
  CFDictionaryRef v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isTransientUser") & 1) == 0 && (objc_msgSend(v3, "isAuditor") & 1) == 0)
  {
    v21 = a1;
    +[LKUniversalDiskStorage sharedStorage](LKUniversalDiskStorage, "sharedStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "retrieveValueForKey:", CFSTR("com.apple.idms.config.ApplicationPreferences"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[LKUniversalDiskStorage sharedStorage](LKUniversalDiskStorage, "sharedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = CFSTR("com.apple.idms.config.ApplicationPreferences");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clearKeys:", v6);

    v7 = (void *)objc_opt_new();
    if (!_AXSCurrentAccessibilitySettingsCanSupportLoginUI())
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v8 = objc_msgSend(&unk_24D5A0CD8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v26;
        v11 = (const __CFString *)*MEMORY[0x24BDBD590];
        v12 = (const __CFString *)*MEMORY[0x24BDBD588];
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v26 != v10)
              objc_enumerationMutation(&unk_24D5A0CD8);
            v14 = *(const __CFString **)(*((_QWORD *)&v25 + 1) + 8 * i);
            v15 = CFPreferencesCopyMultiple(0, v14, v11, v12);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);

          }
          v9 = objc_msgSend(&unk_24D5A0CD8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v9);
      }
    }
    if ((objc_msgSend(v7, "isEqualToDictionary:", v22) & 1) == 0
      && (objc_msgSend(v7, "count") || objc_msgSend(v22, "count")))
    {
      kdebug_trace();
      objc_msgSend(MEMORY[0x24BEBF288], "taskWithName:reason:", CFSTR("Upload preferences to idMS"), CFSTR("Upload preferences to idMS"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v21 + 32), "setSyncTask:", v17);

      objc_msgSend(*(id *)(v21 + 32), "syncTask");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "begin");

      v19 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
      objc_msgSend(v3, "alternateDSID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __43__LKLogoutSupport__syncPreferencesIfNeeded__block_invoke_11;
      v23[3] = &unk_24D59B210;
      v23[4] = *(_QWORD *)(v21 + 32);
      objc_msgSend(v19, "setConfigurationInfo:forIdentifier:forAltDSID:completion:", v7, CFSTR("com.apple.idms.config.ApplicationPreferences"), v20, v23);

    }
    else
    {
      v16 = LKLogDefault;
      if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2167FC000, v16, OS_LOG_TYPE_DEFAULT, "idMS has the latest preferences already. No need to sync anything.", buf, 2u);
      }
    }

  }
}

void __43__LKLogoutSupport__syncPreferencesIfNeeded__block_invoke_11(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_2167FC000, v6, OS_LOG_TYPE_DEFAULT, "Wrote preferences data to IdMS, success = %d, error = %{public}@", (uint8_t *)v8, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 32), "syncTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");

  objc_msgSend(*(id *)(a1 + 32), "setSyncTask:", 0);
  kdebug_trace();

}

- (void)logoutToLoginWindowWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  -[LKLogoutSupport _syncPreferencesIfNeeded](self, "_syncPreferencesIfNeeded");
  if (-[LKLogoutSupport _canLogoutToLoginSession](self, "_canLogoutToLoginSession"))
    -[LKLogoutSupport logoutToLoginSessionWithCompletionHandler:](self, "logoutToLoginSessionWithCompletionHandler:", v4);
  else
    -[LKLogoutSupport logoutToLoginUserWithCompletionHandler:](self, "logoutToLoginUserWithCompletionHandler:", v4);

}

- (id)logoutWarningMessage
{
  void *v2;
  void *v3;

  if (-[LKLogoutSupport isCurrentUserAnonymous](self, "isCurrentUserAnonymous"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Data will not be saved."), &stru_24D59BB58, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isCurrentUserAnonymous
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isTransientUser");
  return (char)v2;
}

- (UMUserSwitchBlockingTask)syncTask
{
  return self->_syncTask;
}

- (void)setSyncTask:(id)a3
{
  objc_storeStrong((id *)&self->_syncTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncTask, 0);
}

@end
