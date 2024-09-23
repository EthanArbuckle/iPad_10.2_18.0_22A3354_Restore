@implementation ATXSuggestionModeFilter

+ (ATXSuggestionModeFilter)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_79);
  return (ATXSuggestionModeFilter *)(id)sharedInstance_filter;
}

void __41__ATXSuggestionModeFilter_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_filter;
  sharedInstance_filter = v0;

}

- (ATXSuggestionModeFilter)init
{
  ATXSuggestionModeFilter *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _PASLock *lock;
  uint64_t v8;
  ATXDNDModeConfigurationClient *client;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ATXSuggestionModeFilter;
  v2 = -[ATXSuggestionModeFilter init](&v12, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)objc_opt_new();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    v5 = (void *)v3[1];
    v3[1] = v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v3);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v6;

    objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    client = v2->_client;
    v2->_client = (ATXDNDModeConfigurationClient *)v8;

    objc_msgSend(MEMORY[0x1E0D80E48], "currentModeUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXSuggestionModeFilter _updateConfigurationWithModeUUID:notifyingObservers:](v2, "_updateConfigurationWithModeUUID:notifyingObservers:", v10, 0);

  }
  return v2;
}

- (void)registerForModeChanges
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  BMBiomeScheduler *v6;
  BMBiomeScheduler *scheduler;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BPSSink *v13;
  BPSSink *sink;
  _QWORD v15[4];
  id v16;
  id location;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.proactive.ATXSuggestionModeFilter.events", v3);
  queue = self->_queue;
  self->_queue = v4;

  v6 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("ATXSuggestionModeFilter"), self->_queue);
  scheduler = self->_scheduler;
  self->_scheduler = v6;

  objc_initWeak(&location, self);
  BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UserFocus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ComputedMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "atx_DSLPublisher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "subscribeOn:", self->_scheduler);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke_25;
  v15[3] = &unk_1E82DE280;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v12, "sinkWithCompletion:receiveInput:", &__block_literal_global_24_1, v15);
  v13 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  sink = self->_sink;
  self->_sink = v13;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_blending();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke_cold_1(v2);

  }
}

void __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id WeakRetained;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "starting");

  if (!v5)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithUUIDString:", v8);

  if (!v9)
  {
    __atxlog_handle_blending();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke_25_cold_1(v3);

    goto LABEL_6;
  }
LABEL_7:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateConfigurationWithModeUUID:notifyingObservers:", v9, 1);

}

- (BOOL)currentModeConfigurationAllowsBundleId:(id)a3
{
  void *v4;
  NSObject *v5;
  BOOL v6;
  _PASLock *lock;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  ATXBundleIdReplacementForBundleId();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (ATXBundleIdIsFakeContainerBundleId())
  {
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ATXSuggestionModeFilter currentModeConfigurationAllowsBundleId:].cold.1();

    v6 = 1;
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 1;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__ATXSuggestionModeFilter_currentModeConfigurationAllowsBundleId___block_invoke;
    v9[3] = &unk_1E82E0990;
    v10 = v4;
    v11 = &v12;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
    v6 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

void __66__ATXSuggestionModeFilter_currentModeConfigurationAllowsBundleId___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)v3[2];
  if (v4)
  {
    if (objc_msgSend(v4, "exceptionForApplication:", *(_QWORD *)(a1 + 32)))
    {
      __atxlog_handle_blending();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXSuggestionModeFilter: filtering out disallowed bundleId %@", (uint8_t *)&v14, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  else
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __66__ATXSuggestionModeFilter_currentModeConfigurationAllowsBundleId___block_invoke_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);

  }
}

- (BOOL)currentModeConfigurationAllowsSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  _PASLock *lock;
  BOOL v26;
  NSObject *v27;
  _QWORD v29[4];
  id v30;
  NSObject *v31;
  __int128 *p_keyExistsAndHasValidFormat;
  __int128 keyExistsAndHasValidFormat;
  uint64_t v34;
  char v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ATXSuggestionPreprocessor bundleIdAssociatedWithSuggestion:](ATXSuggestionPreprocessor, "bundleIdAssociatedWithSuggestion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ATXSuggestionModeFilter currentModeConfigurationAllowsSuggestion:].cold.1();
    goto LABEL_27;
  }
  ATXBundleIdReplacementForBundleId();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v4;
  v8 = v6;
  if (CFPreferencesGetAppBooleanValue(CFSTR("widgetKitDeveloperModeEnabled"), CFSTR("com.apple.duetexpertd"), 0))
  {
    objc_msgSend(MEMORY[0x1E0D81150], "infoSuggestionFromProactiveSuggestion:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "widgetBundleIdentifier");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (CFPreferencesGetAppBooleanValue(CFSTR("widgetKitDeveloperModeEnabled"), CFSTR("com.apple.duetexpertd"), 0))
      {
        LOBYTE(keyExistsAndHasValidFormat) = 0;
        if (CFPreferencesGetAppBooleanValue(CFSTR("ATXWidgetKitDeveloperModeSkipEntitlementCheck"), (CFStringRef)*MEMORY[0x1E0CF9510], (Boolean *)&keyExistsAndHasValidFormat))
        {

          goto LABEL_11;
        }
        v12 = objc_msgSend(MEMORY[0x1E0CF8CE0], "isDebuggingAllowedForExtensionBundleId:", v11);

        if (v12)
        {
LABEL_11:
          __atxlog_handle_blending();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(keyExistsAndHasValidFormat) = 138412290;
            *(_QWORD *)((char *)&keyExistsAndHasValidFormat + 4) = v7;
            _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "ATXSuggestionModeFilter: WidgetKit Developer Mode is enabled and debugging is allowed for widget, allowing suggestion: %@", (uint8_t *)&keyExistsAndHasValidFormat, 0xCu);
          }
          goto LABEL_22;
        }
      }
      else
      {

      }
    }

  }
  if ((ATXBundleIdIsFakeContainerBundleId() & 1) != 0)
  {
LABEL_23:

LABEL_24:
    __atxlog_handle_blending();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[ATXSuggestionModeFilter currentModeConfigurationAllowsSuggestion:].cold.2();

LABEL_27:
    v26 = 1;
    goto LABEL_28;
  }
  v10 = v7;
  v14 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&keyExistsAndHasValidFormat = v15;
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 4);
  v16 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&keyExistsAndHasValidFormat + 1) = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &keyExistsAndHasValidFormat, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithArray:", v17);

  objc_msgSend(v10, "clientModelSpecification");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "clientModelId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend(v18, "containsObject:", v20);

  if ((v16 & 1) != 0)
  {
    objc_msgSend(v10, "atxActionExecutableObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "intent");
    v13 = objc_claimAutoreleasedReturnValue();

    -[NSObject extensionBundleId](v13, "extensionBundleId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.DoNotDisturb.Intents")))
    {

LABEL_22:
      goto LABEL_23;
    }
    -[NSObject _className](v13, "_className");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("DNDToggleDoNotDisturbIntent"));

    if ((v24 & 1) == 0)
      goto LABEL_24;
  }
  else
  {

  }
  *(_QWORD *)&keyExistsAndHasValidFormat = 0;
  *((_QWORD *)&keyExistsAndHasValidFormat + 1) = &keyExistsAndHasValidFormat;
  v34 = 0x2020000000;
  v35 = 1;
  lock = self->_lock;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __68__ATXSuggestionModeFilter_currentModeConfigurationAllowsSuggestion___block_invoke;
  v29[3] = &unk_1E82E09B8;
  v30 = v10;
  v8 = v8;
  v31 = v8;
  p_keyExistsAndHasValidFormat = &keyExistsAndHasValidFormat;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v29);
  v26 = *(_BYTE *)(*((_QWORD *)&keyExistsAndHasValidFormat + 1) + 24) != 0;

  _Block_object_dispose(&keyExistsAndHasValidFormat, 8);
LABEL_28:

  return v26;
}

void __68__ATXSuggestionModeFilter_currentModeConfigurationAllowsSuggestion___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3[2];
  if (!v4)
  {
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __68__ATXSuggestionModeFilter_currentModeConfigurationAllowsSuggestion___block_invoke_cold_1((uint64_t)a1, v8, v9, v10, v11, v12, v13, v14);
LABEL_21:

    goto LABEL_22;
  }
  if (!objc_msgSend(v4, "exceptionForApplication:", a1[5]))
  {
    +[ATXSuggestionPreprocessor contactIdsAssociatedWithSuggestion:](ATXSuggestionPreprocessor, "contactIdsAssociatedWithSuggestion:", a1[4]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v8);
          v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v20 = (void *)objc_opt_new();
          objc_msgSend(v20, "setContactIdentifier:", v19, (_QWORD)v23);
          if (objc_msgSend(v3[2], "exceptionForContactHandle:", v20))
          {
            __atxlog_handle_blending();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = a1[4];
              *(_DWORD *)buf = 138412546;
              v29 = v19;
              v30 = 2112;
              v31 = v22;
              _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "ATXSuggestionModeFilter: filtering out disallowed contactId %@ in suggestion: %@", buf, 0x16u);
            }

            *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
            goto LABEL_20;
          }

        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    v6 = a1[5];
    *(_DWORD *)buf = 138412546;
    v29 = v6;
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXSuggestionModeFilter: filtering out disallowed bundleId %@ in suggestion: %@", buf, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
LABEL_22:

}

- (void)registerObserver:(id)a3
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
  v7[2] = __44__ATXSuggestionModeFilter_registerObserver___block_invoke;
  v7[3] = &unk_1E82E09E0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __44__ATXSuggestionModeFilter_registerObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)removeObserver:(id)a3
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
  v7[2] = __42__ATXSuggestionModeFilter_removeObserver___block_invoke;
  v7[3] = &unk_1E82E09E0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __42__ATXSuggestionModeFilter_removeObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)_updateConfigurationWithModeUUID:(id)a3 notifyingObservers:(BOOL)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v9[4];
  id v10;
  ATXSuggestionModeFilter *v11;
  BOOL v12;

  v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__ATXSuggestionModeFilter__updateConfigurationWithModeUUID_notifyingObservers___block_invoke;
  v9[3] = &unk_1E82E0A08;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

}

void __79__ATXSuggestionModeFilter__updateConfigurationWithModeUUID_notifyingObservers___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_QWORD *)(a1 + 32))
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "ATXSuggestionModeFilter: no current mode", buf, 2u);
    }
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "modeConfigurationForDNDModeWithUUID:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_blending();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __79__ATXSuggestionModeFilter__updateConfigurationWithModeUUID_notifyingObservers___block_invoke_cold_1((uint64_t *)(a1 + 32), v7);
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "ATXSuggestionModeFilter: fetched configuration for mode: %@", buf, 0xCu);
  }
LABEL_10:

  objc_storeStrong(v3 + 2, v5);
  if (*(_BYTE *)(a1 + 48))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v3[1];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "configurationDidChangeForFilter:", *(_QWORD *)(a1 + 40), (_QWORD)v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "ATXSuggestionModeFilter: unable to subscribe to computed mode stream: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke_25_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "eventBody");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "ATXSuggestionModeFilter: could not create NSUUID from latest mode: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)currentModeConfigurationAllowsBundleId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "ATXSuggestionModeFilter: allowing filter exception bundleId: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __66__ATXSuggestionModeFilter_currentModeConfigurationAllowsBundleId___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "ATXSuggestionModeFilter: allowing bundleId, currently not in a mode: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)currentModeConfigurationAllowsSuggestion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "ATXSuggestionModeFilter: allowing suggestion since we are unable to get its bundleId: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)currentModeConfigurationAllowsSuggestion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "ATXSuggestionModeFilter: bypassing filter for suggestion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __68__ATXSuggestionModeFilter_currentModeConfigurationAllowsSuggestion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "ATXSuggestionModeFilter: allowing suggestion, currently not in a mode: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __79__ATXSuggestionModeFilter__updateConfigurationWithModeUUID_notifyingObservers___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestionModeFilter: could not fetch configuration for mode: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
