@implementation EKBirthdayListener

+ (id)sharedListener
{
  if (sharedListener_onceToken != -1)
    dispatch_once(&sharedListener_onceToken, &__block_literal_global_38);
  return (id)sharedListener_listener;
}

void __36__EKBirthdayListener_sharedListener__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[EKBirthdayListener initSingleton]([EKBirthdayListener alloc], "initSingleton");
  v1 = (void *)sharedListener_listener;
  sharedListener_listener = (uint64_t)v0;

}

- (id)initSingleton
{
  EKBirthdayListener *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *updateJobQueue;
  id v7;
  OS_dispatch_queue *v8;
  uint64_t v9;
  CalAccumulatingQueue *updateQueue;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)EKBirthdayListener;
  v2 = -[EKBirthdayListener init](&v15, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("EKBirthdayListener", v4);
    updateJobQueue = v2->_updateJobQueue;
    v2->_updateJobQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc(MEMORY[0x1E0D0C250]);
    v8 = v2->_updateJobQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __35__EKBirthdayListener_initSingleton__block_invoke;
    v12[3] = &unk_1E47861C0;
    objc_copyWeak(&v13, &location);
    v9 = objc_msgSend(v7, "initWithQueue:andBlock:", v8, v12);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (CalAccumulatingQueue *)v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __35__EKBirthdayListener_initSingleton__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _BYTE *WeakRetained;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[33])
      objc_msgSend(WeakRetained, "_performUpdateWithContext:", v4);
  }
  else
  {
    v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __35__EKBirthdayListener_initSingleton__block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (void)_performUpdateWithContext:(id)a3
{
  id v4;
  _BOOL4 v5;
  EKBirthdayListener *v6;
  _BOOL8 needsReset;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
  {
    v5 = +[EKBirthdayListener areBirthdaysEnabled](EKBirthdayListener, "areBirthdaysEnabled");
    v6 = self;
    objc_sync_enter(v6);
    needsReset = v6->_needsReset;
    v6->_needsReset = 0;
    objc_sync_exit(v6);

    -[EKBirthdayListener eventStoreWithReset:](v6, "eventStoreWithReset:", needsReset);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (needsReset
        || (-[EKBirthdayListener birthdayCalendarsInStore:](v6, "birthdayCalendarsInStore:", v8),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "count"),
            v9,
            v10 != 1))
      {
        -[EKBirthdayListener resetAllBirthdaysInStore:](v6, "resetAllBirthdaysInStore:", v8);
      }
      else
      {
        -[EKBirthdayListener incrementalUpdateWithContext:](v6, "incrementalUpdateWithContext:", v4);
      }
    }
    else
    {
      -[EKBirthdayListener disableBirthdayCalendarsInStore:](v6, "disableBirthdayCalendarsInStore:", v8);
      v11 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v12[0] = 67109376;
        v12[1] = needsReset;
        v13 = 1024;
        v14 = 0;
        _os_log_impl(&dword_1A2318000, v11, OS_LOG_TYPE_DEFAULT, "Not updating birthday events -- need reset? [%{BOOL}d] birthdays enabled? [%{BOOL}d]", (uint8_t *)v12, 0xEu);
      }
    }

  }
}

- (void)start
{
  if ((_os_feature_enabled_impl() & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
    -[EKBirthdayListener _start](self, "_start");
}

- (void)_start
{
  NSObject *updateJobQueue;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  EKBirthdayListener *v18;
  EKBirthdayListener *v19;
  _BOOL4 needsReset;
  void *v21;
  _QWORD block[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  updateJobQueue = self->_updateJobQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__EKBirthdayListener__start__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(updateJobQueue, block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__localeChanged, *MEMORY[0x1E0C99720], 0);

  objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("BirthdayEventsGenerationLastLocale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("BirthdayEventsGenerationLastLocale"));

    v13 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x1E0C99DC8];
      v15 = v13;
      objc_msgSend(v14, "currentLocale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v6;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_1A2318000, v15, OS_LOG_TYPE_DEFAULT, "BirthdayEventsGenerationLocale (%@) does not match current (%@). Forcing regeneration.", buf, 0x16u);

    }
    v18 = self;
    objc_sync_enter(v18);
    v18->_needsReset = 1;
    objc_sync_exit(v18);

  }
  v19 = self;
  objc_sync_enter(v19);
  needsReset = v19->_needsReset;
  objc_sync_exit(v19);

  if (!needsReset)
    -[EKBirthdayListener checkForFailures](v19, "checkForFailures");
  -[CalAccumulatingQueue updateTagsAndExecuteBlock:withContext:](v19->_updateQueue, "updateTagsAndExecuteBlock:withContext:", 0, &unk_1E47B5C68);
  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "registerForContactChangeNotifications:", v19);

}

void __28__EKBirthdayListener__start__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
  objc_msgSend(*(id *)(a1 + 32), "eventStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "birthdayCalendarVersion");
  if (v3 != 13)
  {
    v4 = v3;
    objc_msgSend(v2, "setBirthdayCalendarVersion:", 13);
    v5 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109376;
      v7[1] = v4;
      v8 = 1024;
      v9 = 13;
      _os_log_impl(&dword_1A2318000, v5, OS_LOG_TYPE_DEFAULT, "birthdayCalendarVersion (%d) does not match current version (%d). Forcing regeneration.", (uint8_t *)v7, 0xEu);
    }
    v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
    objc_sync_exit(v6);

  }
}

- (void)stop
{
  void *v3;
  void *v4;
  NSObject *updateJobQueue;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterForContactChangeNotifications:", self);

  updateJobQueue = self->_updateJobQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EKBirthdayListener_stop__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(updateJobQueue, block);
}

uint64_t __26__EKBirthdayListener_stop__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 33) = 1;
  return result;
}

- (void)checkForFailures
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  EKBirthdayListener *v12;

  objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("BirthdayEventsGenerationLastAttemptTimeResetKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerForKey:", CFSTR("BirthdayEventsGenerationAttemptsToResetKey"));

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__EKBirthdayListener_checkForFailures__block_invoke;
    v10[3] = &unk_1E47861E8;
    v11 = v4;
    v12 = self;
    v7 = MEMORY[0x1A85849D4](v10);
    v8 = (void *)v7;
    if ((unint64_t)(v6 - 1) > 2)
      v9 = 84600;
    else
      v9 = qword_1A244A498[v6 - 1];
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v9);

  }
}

void __38__EKBirthdayListener_checkForFailures__block_invoke(uint64_t a1, uint64_t a2)
{
  double v3;
  void *v4;
  double v5;
  double v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD block[5];

  v3 = (double)a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v6 = v3 - v5;

  if (v6 >= 0.0)
  {
    v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__EKBirthdayListener_checkForFailures__block_invoke_2;
    block[3] = &unk_1E4785078;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_after(v7, v8, block);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 32) = 1;
  }
}

uint64_t __38__EKBirthdayListener_checkForFailures__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (id)eventStoreProvider
{
  return -[EKBirthdayListener eventStoreProviderWithReset:](self, "eventStoreProviderWithReset:", 0);
}

- (id)eventStoreProviderWithReset:(BOOL)a3
{
  _BOOL4 v3;
  EKEventStoreProvider *eventStoreProvider;
  BOOL v6;
  EKEphemeralCacheEventStoreProvider *v7;
  EKEventStoreProvider *v8;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateJobQueue);
  eventStoreProvider = self->_eventStoreProvider;
  if (eventStoreProvider)
    v6 = !v3;
  else
    v6 = 0;
  if (!v6)
  {
    v7 = -[EKEphemeralCacheEventStoreProvider initWithCreationBlock:]([EKEphemeralCacheEventStoreProvider alloc], "initWithCreationBlock:", &__block_literal_global_37);
    v8 = self->_eventStoreProvider;
    self->_eventStoreProvider = (EKEventStoreProvider *)v7;

    eventStoreProvider = self->_eventStoreProvider;
  }
  return eventStoreProvider;
}

EKEventStore *__50__EKBirthdayListener_eventStoreProviderWithReset___block_invoke()
{
  return -[EKEventStore initWithBirthdayCalendarModifications]([EKEventStore alloc], "initWithBirthdayCalendarModifications");
}

- (id)eventStore
{
  return -[EKBirthdayListener eventStoreWithReset:](self, "eventStoreWithReset:", 0);
}

- (id)eventStoreWithReset:(BOOL)a3
{
  void *v3;
  void *v4;

  -[EKBirthdayListener eventStoreProviderWithReset:](self, "eventStoreProviderWithReset:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)areBirthdaysEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0D0BF30]);

  return v3;
}

- (void)addBirthdayCalendars
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBool:forKey:", 1, *MEMORY[0x1E0D0BF30]);
  -[CalAccumulatingQueue updateTagsAndExecuteBlock:withContext:](self->_updateQueue, "updateTagsAndExecuteBlock:withContext:", 0, &unk_1E47B5C90);

}

- (void)_localeChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("BirthdayEventsGenerationLastLocale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1A2318000, v8, OS_LOG_TYPE_DEFAULT, "BirthdayEventsGenerationLocale ignoring locale change because locale identifier has not changed (%@)", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("BirthdayEventsGenerationLastLocale"));

    v12 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)MEMORY[0x1E0C99DC8];
      v14 = v12;
      objc_msgSend(v13, "currentLocale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localeIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v4;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_1A2318000, v14, OS_LOG_TYPE_DEFAULT, "BirthdayEventsGenerationLocale (%@) does not match current (%@). Forcing regeneration.", (uint8_t *)&v17, 0x16u);

    }
    -[EKBirthdayListener reset](self, "reset");
  }

}

- (id)birthdayCalendarsInStore:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "calendarsForEntityType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 4)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)disableBirthdayCalendars
{
  NSObject *updateJobQueue;
  id v4;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", 0, *MEMORY[0x1E0D0BF30]);
  if ((_os_feature_enabled_impl() & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
  {
    updateJobQueue = self->_updateJobQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__EKBirthdayListener_disableBirthdayCalendars__block_invoke;
    block[3] = &unk_1E4785078;
    block[4] = self;
    dispatch_sync(updateJobQueue, block);
  }

}

void __46__EKBirthdayListener_disableBirthdayCalendars__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "eventStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "disableBirthdayCalendarsInStore:", v2);

}

- (void)disableBirthdayCalendarsInStore:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  char v14;
  NSObject *v15;
  char v16;
  id v17;
  __int128 v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[EKBirthdayListener birthdayCalendarsInStore:](self, "birthdayCalendarsInStore:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v6)
  {
    v8 = v6;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    *(_QWORD *)&v7 = 138412546;
    v18 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        v12 = v9;
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v5);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v20 = v9;
        v14 = objc_msgSend(v4, "removeCalendar:commit:error:", v13, 0, &v20, v18);
        v9 = v20;

        if ((v14 & 1) == 0)
        {
          v15 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v26 = v13;
            v27 = 2112;
            v28 = v9;
            _os_log_error_impl(&dword_1A2318000, v15, OS_LOG_TYPE_ERROR, "EKBirthdayListener unable to delete birthday calendar %@, %@", buf, 0x16u);
          }
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v19 = v9;
  v16 = objc_msgSend(v4, "commitWithRollback:", &v19);
  v17 = v19;

  if ((v16 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKBirthdayListener disableBirthdayCalendarsInStore:].cold.1();

}

- (id)birthdayCalendarsCreateIfNeeded:(BOOL)a3 inStore:(id)a4 originalIdentifier:(id)a5 originalAlarms:(id)a6 ignoreAlarms:(BOOL)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[16];
  _QWORD v26[2];

  v8 = a3;
  v26[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  -[EKBirthdayListener birthdayCalendarsInStore:](self, "birthdayCalendarsInStore:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8 && !objc_msgSend(v12, "count"))
  {
    v16 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2318000, v16, OS_LOG_TYPE_DEFAULT, "Creating Birthday Calendar", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v10, "localBirthdayCalendarCreateIfNeededWithError:", &v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v24;
    if (v11)
      objc_msgSend(v18, "setCalendarIdentifier:", v11);
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Birthdays"), CFSTR("Birthdays"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v20);

    v23 = v19;
    v21 = objc_msgSend(v10, "saveCalendar:commit:error:", v18, 1, &v23);
    v22 = v23;

    if ((v21 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKBirthdayListener birthdayCalendarsCreateIfNeeded:inStore:originalIdentifier:originalAlarms:ignoreAlarms:].cold.1();
      if (v18)
        goto LABEL_12;
    }
    else if (v18)
    {
LABEL_12:
      v26[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

      goto LABEL_4;
    }
    v14 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_15;
  }
  v14 = v13;
LABEL_4:

  return v14;
}

- (id)allContactsWithBirthdays
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0C97210]);
  objc_msgSend(MEMORY[0x1E0C97200], "CalKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithKeysToFetch:", v5);

  v15 = (id)objc_opt_new();
  v16 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __46__EKBirthdayListener_allContactsWithBirthdays__block_invoke;
  v14 = &unk_1E4786250;
  v7 = v15;
  objc_msgSend(v3, "enumerateContactsWithFetchRequest:error:usingBlock:", v6, &v16, &v11);
  v8 = v16;
  v9 = (void *)objc_msgSend(v7, "copy", v11, v12, v13, v14);

  return v9;
}

void __46__EKBirthdayListener_allContactsWithBirthdays__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "birthday");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    goto LABEL_5;
  }
  objc_msgSend(v5, "nonGregorianBirthday");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_4;
LABEL_5:

}

- (void)insertEventWithContact:(id)a3 forDateComponents:(id)a4 intoCalendar:(id)a5 inStore:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  EKRecurrenceRule *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  char v34;
  id v35;
  void *context;
  void *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  context = (void *)MEMORY[0x1A85847F4]();
  v38 = v12;
  +[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCalendar:", v11);
  objc_msgSend(MEMORY[0x1E0C99D48], "CalDateFromBirthdayComponents:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllDay:", 1);
  v16 = (void *)MEMORY[0x1E0D0C298];
  objc_msgSend(v9, "CalDisplayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "calendarIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "birthdayStringForContactName:eventDate:birthDate:lunarCalendar:", v17, 0, v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setAlarms:", 0);
  v37 = v11;
  objc_msgSend(v11, "source");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "defaultAlarmOffset");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_msgSend(v21, "intValue");
    +[EKAlarm alarmWithRelativeOffset:](EKAlarm, "alarmWithRelativeOffset:", (double)(int)v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("relative=%i"), v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setExternalID:", v24);

    objc_msgSend(v13, "addAlarm:", v23);
  }
  v25 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v15, "calendarIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@/%@"), v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUniqueID:", v28);

  objc_msgSend(v13, "setTitle:", v19);
  objc_msgSend(v13, "setStartDate:", v14);
  objc_msgSend(v13, "setEndDateUnadjustedForLegacyClients:", v14);
  v29 = -[EKRecurrenceRule initRecurrenceWithFrequency:interval:end:]([EKRecurrenceRule alloc], "initRecurrenceWithFrequency:interval:end:", 3, 1, 0);
  objc_msgSend(v13, "addRecurrenceRule:", v29);
  objc_msgSend(v13, "setBirthdayContact:", v9);
  objc_msgSend(v15, "calendarIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLunarCalendarString:", v30);

  v31 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v32 = v31;
    objc_msgSend(v9, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v41 = v19;
    v42 = 2112;
    v43 = v33;
    _os_log_impl(&dword_1A2318000, v32, OS_LOG_TYPE_DEFAULT, "EKBirthdayListener inserting birthday for %@ (%@)", buf, 0x16u);

  }
  v39 = 0;
  v34 = objc_msgSend(v38, "saveEvent:span:commit:error:", v13, 1, 0, &v39);
  v35 = v39;
  if ((v34 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKBirthdayListener insertEventWithContact:forDateComponents:intoCalendar:inStore:].cold.1();

  objc_autoreleasePoolPop(context);
}

- (void)_insertEventsForContact:(id)a3 intoCalendar:(id)a4 inStore:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v14, "birthday");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v14, "birthday");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKBirthdayListener insertEventWithContact:forDateComponents:intoCalendar:inStore:](self, "insertEventWithContact:forDateComponents:intoCalendar:inStore:", v14, v11, v8, v9);

  }
  objc_msgSend(v14, "nonGregorianBirthday");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v14, "nonGregorianBirthday");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKBirthdayListener insertEventWithContact:forDateComponents:intoCalendar:inStore:](self, "insertEventWithContact:forDateComponents:intoCalendar:inStore:", v14, v13, v8, v9);

  }
}

- (void)resetAllBirthdaysInStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[16];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("BirthdayEventsGenerationLastAttemptTimeResetKey"));

  objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerForKey:", CFSTR("BirthdayEventsGenerationAttemptsToResetKey"));

  objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInteger:forKey:", v8 + 1, CFSTR("BirthdayEventsGenerationAttemptsToResetKey"));

  v10 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2318000, v10, OS_LOG_TYPE_DEFAULT, "Resetting All Birthdays in Store", buf, 2u);
  }
  -[EKBirthdayListener birthdayCalendarsInStore:](self, "birthdayCalendarsInStore:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v12, "calendarIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKBirthdayListener disableBirthdayCalendarsInStore:](self, "disableBirthdayCalendarsInStore:", v4);
  -[EKBirthdayListener birthdayCalendarsCreateIfNeeded:inStore:originalIdentifier:originalAlarms:ignoreAlarms:](self, "birthdayCalendarsCreateIfNeeded:inStore:originalIdentifier:originalAlarms:ignoreAlarms:", 1, v4, v13, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count") == 1)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKBirthdayListener allContactsWithBirthdays](self, "allContactsWithBirthdays");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          -[EKBirthdayListener _insertEventsForContact:intoCalendar:inStore:](self, "_insertEventsForContact:intoCalendar:inStore:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20++), v15, v4);
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v18);
    }
    v26 = 0;
    v21 = objc_msgSend(v4, "commitWithRollback:", &v26);
    v22 = v26;
    if ((v21 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKBirthdayListener resetAllBirthdaysInStore:].cold.1();
    objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", 0, CFSTR("BirthdayEventsGenerationLastAttemptTimeResetKey"));

    objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setInteger:forKey:", 0, CFSTR("BirthdayEventsGenerationAttemptsToResetKey"));

  }
  else
  {
    v25 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKBirthdayListener resetAllBirthdaysInStore:].cold.2(v25, v14);
  }

}

- (void)incrementalUpdateWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  char v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inserts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("updates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deletes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") || objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    v8 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      *(_DWORD *)buf = 134218496;
      v53 = objc_msgSend(v5, "count");
      v54 = 2048;
      v55 = objc_msgSend(v6, "count");
      v56 = 2048;
      v57 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_DEFAULT, "EKBirthdayListener handling a total of %ld inserted, %ld updated, %ld deleted contacts", buf, 0x20u);

    }
    -[EKBirthdayListener eventStore](self, "eventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKBirthdayListener birthdayCalendarsCreateIfNeeded:inStore:originalIdentifier:originalAlarms:ignoreAlarms:](self, "birthdayCalendarsCreateIfNeeded:inStore:originalIdentifier:originalAlarms:ignoreAlarms:", 0, v10, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v37 = v4;
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForKeyPath:", CFSTR("identifier"));
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "valueForKey:", CFSTR("identifier"));
      v14 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v13;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)v14;
      objc_msgSend(v15, "addObjectsFromArray:", v14);
      v40 = v7;
      objc_msgSend(v15, "addObjectsFromArray:", v7);
      objc_msgSend(v10, "predicateForMasterEventsInCalendar:", v12);
      v16 = objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke;
      v48[3] = &unk_1E4786278;
      v35 = v15;
      v49 = v35;
      v17 = v10;
      v50 = v17;
      v36 = (void *)v16;
      objc_msgSend(v17, "enumerateEventsMatchingPredicate:usingBlock:", v16, v48);
      v41 = v6;
      v42 = v5;
      objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v45;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v45 != v21)
              objc_enumerationMutation(v18);
            -[EKBirthdayListener _insertEventsForContact:intoCalendar:inStore:](self, "_insertEventsForContact:intoCalendar:inStore:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v22++), v12, v17);
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
        }
        while (v20);
      }
      v23 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2318000, v23, OS_LOG_TYPE_DEFAULT, "EKBirthdayListener committing changes", buf, 2u);
      }
      v43 = 0;
      v24 = objc_msgSend(v17, "commitWithRollback:", &v43);
      v25 = v43;
      v6 = v41;
      v4 = v37;
      if ((v24 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        -[EKBirthdayListener incrementalUpdateWithContext:].cold.2();

      v5 = v42;
      v7 = v40;
    }
    else
    {
      v26 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        -[EKBirthdayListener incrementalUpdateWithContext:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
    }

  }
  else
  {
    v34 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2318000, v34, OS_LOG_TYPE_DEFAULT, "EKBirthdayListener has nothing to do; skipping this update.",
        buf,
        2u);
    }
  }

}

void __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "birthdayContactIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        v6 = *(void **)(a1 + 32),
        objc_msgSend(v3, "birthdayContactIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7),
        v7,
        v5,
        (_DWORD)v6))
  {
    v8 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v3, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "birthdayContactIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v10;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_DEFAULT, "EKBirthdayListener removing birthday for %@ (%@)", buf, 0x16u);

    }
    v12 = *(void **)(a1 + 40);
    v27 = 0;
    v13 = objc_msgSend(v12, "removeEvent:span:commit:error:", v3, 4, 0, &v27);
    v14 = v27;
    if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(v3, "birthdayContactName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "birthdayContactIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unifiedContactWithIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v14 = 0;
      }
      else
      {
        v22 = (void *)EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_4(v22, v3);
        v23 = *(void **)(a1 + 40);
        v25 = 0;
        v24 = objc_msgSend(v23, "removeEvent:span:commit:error:", v3, 4, 0, &v25);
        v14 = v25;
        if ((v24 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_1();
      }
    }
    else
    {
      v19 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_2(v19, v3);
      v20 = *(void **)(a1 + 40);
      v26 = 0;
      v21 = objc_msgSend(v20, "removeEvent:span:commit:error:", v3, 4, 0, &v26);
      v14 = v26;
      if ((v21 & 1) == 0 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_1();
    }
  }

}

- (void)contactsInserted:(id)a3 updated:(id)a4 deleted:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  CalAccumulatingQueue *updateQueue;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[3];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 134218496;
    v18 = objc_msgSend(v8, "count");
    v19 = 2048;
    v20 = objc_msgSend(v9, "count");
    v21 = 2048;
    v22 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1A2318000, v12, OS_LOG_TYPE_DEFAULT, "EKBirthdayListener received %ld inserted, %ld updated, %ld deleted contacts", buf, 0x20u);

  }
  updateQueue = self->_updateQueue;
  v15[0] = CFSTR("inserts");
  v15[1] = CFSTR("updates");
  v16[0] = v8;
  v16[1] = v9;
  v15[2] = CFSTR("deletes");
  v16[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalAccumulatingQueue updateTagsAndExecuteBlock:withContext:](updateQueue, "updateTagsAndExecuteBlock:withContext:", 0, v14);

}

- (void)reset
{
  EKBirthdayListener *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_needsReset = 1;
  -[CalAccumulatingQueue updateTagsAndExecuteBlock:withContext:](obj->_updateQueue, "updateTagsAndExecuteBlock:withContext:", 0, &unk_1E47B5CB8);
  objc_sync_exit(obj);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateJobQueue, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

void __35__EKBirthdayListener_initSingleton__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "Unexpected nil self in birthday update block", a5, a6, a7, a8, 0);
}

- (void)disableBirthdayCalendarsInStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "EKBirthdayListener unable to commit birthday calendar deletion %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)birthdayCalendarsCreateIfNeeded:inStore:originalIdentifier:originalAlarms:ignoreAlarms:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "EKBirthdayListenerFailed to save calendar to event store with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)insertEventWithContact:forDateComponents:intoCalendar:inStore:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_1A2318000, v0, v1, "EKBirthdayListener unable to save event %@, %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)resetAllBirthdaysInStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "EKBirthdayListener unable to commit to store %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)resetAllBirthdaysInStore:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  uint8_t v4[24];

  v3 = OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1A2318000, v3, OS_LOG_TYPE_ERROR, "Expected exactly 1 birthday calendar, but instead there are %lu", v4, 0xCu);

}

- (void)incrementalUpdateWithContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "No birthday calendar found when trying to add birthdays", a5, a6, a7, a8, 0);
}

- (void)incrementalUpdateWithContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "EKBirthdayListener unable to commit to store %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_1A2318000, v0, v1, "EKBirthdayListener unable to remove event %@ %@");
  OUTLINED_FUNCTION_1_0();
}

void __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend(a2, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "birthdayContactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_5(&dword_1A2318000, v3, v6, "EKBirthdayListener removing invalid birthday for %@ (%@), No Contact Name!", v7);

  OUTLINED_FUNCTION_1_1();
}

void __51__EKBirthdayListener_incrementalUpdateWithContext___block_invoke_cold_4(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend(a2, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "birthdayContactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_5(&dword_1A2318000, v3, v6, "EKBirthdayListener removing invalid birthday for %@ (%@), Invalid Contact Identifier!", v7);

  OUTLINED_FUNCTION_1_1();
}

@end
