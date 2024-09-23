@implementation EDWidgetUpdateController

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__EDWidgetUpdateController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_99 != -1)
    dispatch_once(&log_onceToken_99, block);
  return (OS_os_log *)(id)log_log_99;
}

void __31__EDWidgetUpdateController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_99;
  log_log_99 = (uint64_t)v1;

}

- (EDWidgetUpdateController)initWithWidgetBundleIdentifier:(id)a3 widgetKindIdentifiers:(id)a4 hookRegistry:(id)a5
{
  id v8;
  id v9;
  id v10;
  EDWidgetUpdateController *v11;
  NSObject *v12;
  uint64_t v13;
  NSSet *identifiers;
  uint64_t v15;
  NSArray *timelineControllers;
  CHSWidgetConfigurationReader *v17;
  CHSWidgetConfigurationReader *reader;
  _QWORD v20[4];
  id v21;
  uint8_t buf[16];
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)EDWidgetUpdateController;
  v11 = -[EDWidgetUpdateController init](&v23, sel_init);
  if (v11)
  {
    +[EDWidgetUpdateController log](EDWidgetUpdateController, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Waiting for updates", buf, 2u);
    }

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v9);
    identifiers = v11->_identifiers;
    v11->_identifiers = (NSSet *)v13;

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __94__EDWidgetUpdateController_initWithWidgetBundleIdentifier_widgetKindIdentifiers_hookRegistry___block_invoke;
    v20[3] = &unk_1E94A0180;
    v21 = v8;
    objc_msgSend(v9, "ef_map:", v20);
    v15 = objc_claimAutoreleasedReturnValue();
    timelineControllers = v11->_timelineControllers;
    v11->_timelineControllers = (NSArray *)v15;

    v17 = (CHSWidgetConfigurationReader *)objc_alloc_init((Class)getCHSWidgetConfigurationReaderClass[0]());
    reader = v11->_reader;
    v11->_reader = v17;

    objc_msgSend(v10, "registerMessageChangeHookResponder:", v11);
    -[EDWidgetUpdateController _restoreFromUserDefaults](v11, "_restoreFromUserDefaults");
    -[EDWidgetUpdateController _runActivity](v11, "_runActivity");

  }
  return v11;
}

id __94__EDWidgetUpdateController_initWithWidgetBundleIdentifier_widgetKindIdentifiers_hookRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc((Class)getCHSTimelineControllerClass[0]()), "initWithExtensionBundleIdentifier:kind:", *(_QWORD *)(a1 + 32), v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  xpc_activity_unregister((const char *)EDWidgetUpdateActivityIdentifier);
  v3.receiver = self;
  v3.super_class = (Class)EDWidgetUpdateController;
  -[EDWidgetUpdateController dealloc](&v3, sel_dealloc);
}

- (void)_hasUserConfiguredMailWidget:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[EDWidgetUpdateController reader](self, "reader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke;
  v7[3] = &unk_1E94A3828;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "allConfiguredWidgetsWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke_2;
  v10[3] = &unk_1E94A3800;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v7 = v5;
  v11 = v7;
  v13 = *(id *)(a1 + 32);
  v8 = v6;
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v10[0], 3221225472, __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke_2, &unk_1E94A3800);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performBlock:", v10);

  objc_destroyWeak(&v14);
}

void __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSObject *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[16];
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      obj = v3;
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(obj);
            v4 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            v19 = 0u;
            v20 = 0u;
            v21 = 0u;
            v22 = 0u;
            objc_msgSend(v4, "widgetConfigurations", v15);
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
            if (v6)
            {
              v7 = *(_QWORD *)v20;
              while (2)
              {
                for (j = 0; j != v6; ++j)
                {
                  if (*(_QWORD *)v20 != v7)
                    objc_enumerationMutation(v5);
                  v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
                  objc_msgSend(WeakRetained, "identifiers");
                  v10 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "widget");
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "kind");
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  v13 = objc_msgSend(v10, "containsObject:", v12);

                  if (v13)
                  {
                    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

                    goto LABEL_23;
                  }
                }
                v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
                if (v6)
                  continue;
                break;
              }
            }

          }
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        }
        while (v15);
      }
    }
    else
    {
      +[EDWidgetUpdateController log](EDWidgetUpdateController, "log");
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke_2_cold_1(v14, (uint64_t)v27, obj);
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_23:

}

- (void)_scheduleActivityWithReason:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke;
  v6[3] = &unk_1E94A3870;
  v6[4] = self;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  -[EDWidgetUpdateController _hasUserConfiguredMailWidget:](self, "_hasUserConfiguredMailWidget:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke(id *a1, char a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD aBlock[5];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = objc_msgSend(a1[4], "_activityDelay");
    +[EDWidgetUpdateController log](EDWidgetUpdateController, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = v3;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Schedule activity with %llds delay", buf, 0xCu);
    }

    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke_17;
    aBlock[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
    aBlock[4] = v3;
    v6 = _Block_copy(aBlock);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke_2;
    v8[3] = &unk_1E94A1288;
    objc_copyWeak(&v10, a1 + 6);
    v9 = a1[5];
    v7 = _Block_copy(v8);
    ef_xpc_activity_register_withcriteria();

    objc_destroyWeak(&v10);
  }
  else
  {
    +[EDWidgetUpdateController log](EDWidgetUpdateController, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Skip widget update - no Mail widgets are configured", buf, 2u);
    }
  }

}

void __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke_17(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C80760], *(_QWORD *)(a1 + 32));
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C8]);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);

}

void __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_refreshTimelinesWithReason:", *(_QWORD *)(a1 + 32));
    if (!xpc_activity_set_state(v3, 5))
    {
      +[EDWidgetUpdateController log](EDWidgetUpdateController, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke_2_cold_1(v6);

    }
  }

}

- (void)_runActivity
{
  id v2;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  ef_xpc_activity_run_if_necessary();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __40__EDWidgetUpdateController__runActivity__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refreshTimelinesWithReason:", CFSTR("daemonLaunched"));

}

- (int64_t)_activityDelay
{
  int64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;

  v2 = *MEMORY[0x1E0C807C8];
  -[EDWidgetUpdateController lastUpdate](self, "lastUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 64, 10, v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 600.0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "ef_isEarlierThanDate:", v8);

    if (v10)
      v2 = *MEMORY[0x1E0C807E0];

  }
  return v2;
}

- (void)_refreshTimelinesWithReason:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  int64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[EDWidgetUpdateController timelineControllers](self, "timelineControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "reloadTimelineWithReason:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ef_addOptionalObject:", v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

  -[EDWidgetUpdateController _updateLastUpdateInformation](self, "_updateLastUpdateInformation");
  if (objc_msgSend(v5, "count"))
  {
    +[EDWidgetUpdateController log](EDWidgetUpdateController, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[EDWidgetUpdateController _refreshTimelinesWithReason:].cold.1((uint64_t)v5, v11, v12);
  }
  else
  {
    +[EDWidgetUpdateController log](EDWidgetUpdateController, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[EDWidgetUpdateController numberOfUpdates](self, "numberOfUpdates");
      *(_DWORD *)buf = 134217984;
      v19 = v13;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Successfully updated widget (%ld)", buf, 0xCu);
    }
  }

}

- (void)_updateLastUpdateInformation
{
  void *v3;
  void *v4;
  int64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[EDWidgetUpdateController lastUpdate](self, "lastUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDateInToday:", v3) && objc_msgSend(v4, "isDateInToday:", v6))
    v5 = -[EDWidgetUpdateController numberOfUpdates](self, "numberOfUpdates") + 1;
  else
    v5 = 1;
  -[EDWidgetUpdateController setNumberOfUpdates:](self, "setNumberOfUpdates:", v5);
  -[EDWidgetUpdateController setLastUpdate:](self, "setLastUpdate:", v6);
  -[EDWidgetUpdateController _writeUserDefaults](self, "_writeUserDefaults");

}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  +[EDWidgetUpdateController log](EDWidgetUpdateController, "log", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Persistence did add messages", v6, 2u);
  }

  -[EDWidgetUpdateController _scheduleActivityWithReason:](self, "_scheduleActivityWithReason:", CFSTR("messageAdded"));
}

- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "hasChanges")
    && ((objc_msgSend(v6, "readChanged") & 1) != 0 || objc_msgSend(v6, "deletedChanged")))
  {
    +[EDWidgetUpdateController log](EDWidgetUpdateController, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "ef_publicDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Persistence did change flags: %{public}@", (uint8_t *)&v11, 0xCu);

    }
    -[EDWidgetUpdateController _scheduleActivityWithReason:](self, "_scheduleActivityWithReason:", CFSTR("flagChanged"));
  }
  else
  {
    +[EDWidgetUpdateController log](EDWidgetUpdateController, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "ef_publicDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDWidgetUpdateController persistenceDidChangeFlags:messages:generationWindow:].cold.1(v10, (uint8_t *)&v11, v9);
    }

  }
}

- (void)_restoreFromUserDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("kLastWidgetUpdateDefaultsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[EDWidgetUpdateController setLastUpdate:](self, "setLastUpdate:", v4);
  if (!v3)

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDWidgetUpdateController lastUpdate](self, "lastUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isDateInToday:", v6);

  if (v7)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("kNumberOfWidgetUpdatesDefaultsKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDWidgetUpdateController setNumberOfUpdates:](self, "setNumberOfUpdates:", objc_msgSend(v8, "integerValue"));

  }
  else
  {
    -[EDWidgetUpdateController setNumberOfUpdates:](self, "setNumberOfUpdates:", 0);
  }

}

- (void)_writeUserDefaults
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EDWidgetUpdateController lastUpdate](self, "lastUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, CFSTR("kLastWidgetUpdateDefaultsKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[EDWidgetUpdateController numberOfUpdates](self, "numberOfUpdates"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("kNumberOfWidgetUpdatesDefaultsKey"));

}

- (NSArray)timelineControllers
{
  return self->_timelineControllers;
}

- (void)setTimelineControllers:(id)a3
{
  objc_storeStrong((id *)&self->_timelineControllers, a3);
}

- (CHSWidgetConfigurationReader)reader
{
  return self->_reader;
}

- (void)setReader:(id)a3
{
  objc_storeStrong((id *)&self->_reader, a3);
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (void)setLastUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdate, a3);
}

- (int64_t)numberOfUpdates
{
  return self->_numberOfUpdates;
}

- (void)setNumberOfUpdates:(int64_t)a3
{
  self->_numberOfUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_timelineControllers, 0);
}

void __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a3, (uint64_t)a3, "Failed to get widget configuration: %{public}@", (uint8_t *)a2);

}

void __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Failed to set activity to done", v1, 2u);
}

- (void)_refreshTimelinesWithReason:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Update timelines failed: %{public}@", (uint8_t *)&v3);
}

- (void)persistenceDidChangeFlags:(void *)a1 messages:(uint8_t *)buf generationWindow:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_DEBUG, "Persistence did change flag which is not relevant: %{public}@", buf, 0xCu);

}

@end
