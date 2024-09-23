@implementation ATXAppPredictionBlacklist

void __72__ATXAppPredictionBlacklist__createBlacklistFromPreferencesDisabledApps__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  v4 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v6 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchSuggestAppDisabled"), CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  v10 = objc_msgSend(v3, "initWithArray:", v9);
  v11 = (void *)v2[1];
  v2[1] = v10;

  __atxlog_handle_default();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)v2[1];
    v25 = 138412546;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "%@ - apps that cannot be suggested: %@", (uint8_t *)&v25, 0x16u);

  }
  __atxlog_handle_default();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __72__ATXAppPredictionBlacklist__createBlacklistFromPreferencesDisabledApps__block_invoke_cold_1();

  __atxlog_handle_default();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchDisabledApps"), CFSTR("com.apple.spotlightui"), v4, v5);
    v21 = v20;
    if (v20)
    {
      v22 = v20;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v22;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 138412546;
    v26 = v19;
    v27 = 2112;
    v28 = v24;
    _os_log_debug_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEBUG, "%@ - apps that cannot show in search: %@", (uint8_t *)&v25, 0x16u);

  }
}

void __71__ATXAppPredictionBlacklist__updateBlacklistFromGlobalsBlacklistedApps__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  id v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = a1 + 32;
  objc_msgSend(*(id *)(v5 + 40), "blacklistedAppsForAppPredictions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v3[1], "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v8);
  }

  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v3[1];
    *(_DWORD *)buf = 138412546;
    v21 = v13;
    v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "%@ - updated suggest app blacklist: %@", buf, 0x16u);

  }
  __atxlog_handle_default();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    __71__ATXAppPredictionBlacklist__updateBlacklistFromGlobalsBlacklistedApps__block_invoke_cold_1(v4);

}

void __46__ATXAppPredictionBlacklist_disabledBundleIds__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(*(id *)(a2 + 8), "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "_updateBlacklist");
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__44;
  v17 = __Block_byref_object_dispose__44;
  v18 = 0;
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke_31;
  v12[3] = &unk_1E82E2430;
  v12[4] = &v13;
  objc_msgSend(v3, "runWithLockAcquired:", v12);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = (id)v14[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
    }
    while (v5);
  }

  ATXUpdatePredictionsImmediatelyWithReason(13);
  _Block_object_dispose(&v13, 8);

}

- (void)_updateBlacklist
{
  -[ATXAppPredictionBlacklist _createBlacklistFromPreferencesDisabledApps](self, "_createBlacklistFromPreferencesDisabledApps");
  -[ATXAppPredictionBlacklist _updateBlacklistFromGlobalsBlacklistedApps](self, "_updateBlacklistFromGlobalsBlacklistedApps");
}

- (void)_createBlacklistFromPreferencesDisabledApps
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__ATXAppPredictionBlacklist__createBlacklistFromPreferencesDisabledApps__block_invoke;
  v3[3] = &unk_1E82E24C8;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (id)disabledBundleIds
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__44;
  v10 = __Block_byref_object_dispose__44;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__ATXAppPredictionBlacklist_disabledBundleIds__block_invoke;
  v5[3] = &unk_1E82E2430;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (ATXAppPredictionBlacklist)sharedInstance
{
  if (sharedInstance__pasOnceToken6_14 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_14, &__block_literal_global_96);
  return (ATXAppPredictionBlacklist *)(id)sharedInstance__pasExprOnceResult_18;
}

void __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD v5[6];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke_2;
    v5[3] = &unk_1E82DACB0;
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = v3;
    dispatch_async(v4, v5);
  }

}

- (void)_updateBlacklistFromGlobalsBlacklistedApps
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__ATXAppPredictionBlacklist__updateBlacklistFromGlobalsBlacklistedApps__block_invoke;
  v3[3] = &unk_1E82E24C8;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (ATXAppPredictionBlacklist)init
{
  id v3;
  void *v4;
  void *v5;
  ATXAppPredictionBlacklist *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXAppPredictionBlacklist initWithUserDefaults:globals:](self, "initWithUserDefaults:globals:", v4, v5);

  return v6;
}

- (ATXAppPredictionBlacklist)initWithUserDefaults:(id)a3 globals:(id)a4
{
  id v7;
  id v8;
  ATXAppPredictionBlacklist *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _PASLock *lock;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *notificationQueue;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ATXAppPredictionBlacklist;
  v9 = -[ATXAppPredictionBlacklist init](&v19, sel_init);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0D815F0]);
    v11 = (void *)objc_opt_new();
    v12 = objc_msgSend(v10, "initWithGuardedData:", v11);
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UTILITY, 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = dispatch_queue_create("ATXAppPredictionBlacklist-notifications", v15);
    notificationQueue = v9->_notificationQueue;
    v9->_notificationQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v9->_userDefaults, a3);
    objc_storeStrong((id *)&v9->_globals, a4);
    -[ATXAppPredictionBlacklist _performMigrationsIfNeeded](v9, "_performMigrationsIfNeeded");
    -[ATXAppPredictionBlacklist _updateBlacklist](v9, "_updateBlacklist");
    -[ATXAppPredictionBlacklist _listenForUpdates](v9, "_listenForUpdates");

  }
  return v9;
}

void __43__ATXAppPredictionBlacklist_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_18;
  sharedInstance__pasExprOnceResult_18 = v1;

  objc_autoreleasePoolPop(v0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_blacklistNotificationToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_blacklistNotificationToken);

  }
  v4.receiver = self;
  v4.super_class = (Class)ATXAppPredictionBlacklist;
  -[ATXAppPredictionBlacklist dealloc](&v4, sel_dealloc);
}

- (int)registerPrefsChangeHandler:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ATXAppPredictionBlacklist_registerPrefsChangeHandler___block_invoke;
  v8[3] = &unk_1E82E2458;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LODWORD(lock) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)lock;
}

void __56__ATXAppPredictionBlacklist_registerPrefsChangeHandler___block_invoke(uint64_t a1, _DWORD *a2)
{
  int v3;
  const void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2[6];
  a2[6] = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  v4 = *(const void **)(a1 + 32);
  v5 = a2;
  v8 = _Block_copy(v4);
  v6 = (void *)v5[2];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)deregisterPrefsChangeHandlerWithToken:(int)a3
{
  _PASLock *lock;
  _QWORD v4[4];
  int v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__ATXAppPredictionBlacklist_deregisterPrefsChangeHandlerWithToken___block_invoke;
  v4[3] = &__block_descriptor_36_e32_v16__0__ATXGuardedAppBlacklist_8l;
  v5 = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v4);
}

void __67__ATXAppPredictionBlacklist_deregisterPrefsChangeHandlerWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a2 + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, v3);

}

- (void)_listenForUpdates
{
  void *v3;
  void *v4;
  id blacklistNotificationToken;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  if (!self->_blacklistNotificationToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke;
    v6[3] = &unk_1E82E24A0;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.spotlightui.prefschanged"), 0, 0, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    blacklistNotificationToken = self->_blacklistNotificationToken;
    self->_blacklistNotificationToken = v4;

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

void __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke_31(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 16), "allValues");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_performMigrationsIfNeeded
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "%@ - ShowInSearchToSuggestOnHomeScreenMigration was previously performed", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)_resetBlacklistWithSet:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__ATXAppPredictionBlacklist__resetBlacklistWithSet___block_invoke;
  v7[3] = &unk_1E82E24C8;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __52__ATXAppPredictionBlacklist__resetBlacklistWithSet___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v2, "mutableCopy");
  v5 = (id)v3[1];
  v3[1] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globals, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong(&self->_blacklistNotificationToken, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke_2_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_5();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "%@ - received Spotlight blacklist update notification", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __72__ATXAppPredictionBlacklist__createBlacklistFromPreferencesDisabledApps__block_invoke_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_5();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  ATXAppsThatCannotShowContentInSearch();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - apps that cannot show content in search: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __71__ATXAppPredictionBlacklist__updateBlacklistFromGlobalsBlacklistedApps__block_invoke_cold_1(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)a1 + 40), "blacklistedAppsForAppPredictions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v4, v5, "%@ - global blacklisted apps: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
