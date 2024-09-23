@implementation EMCoreAnalyticsCollector

uint64_t __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "addObject:", a1[4]);
  v4 = a1[5];
  if (!*(_BYTE *)(v4 + 8))
  {
    *(_BYTE *)(v4 + 8) = 1;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

- (EMCoreAnalyticsCollector)init
{
  EMCoreAnalyticsCollector *v2;
  id v3;
  id v4;
  uint64_t v5;
  EFLocked *periodicDataProviders;
  uint64_t v7;
  EFScheduler *oneTimeScheduler;
  uint64_t v9;
  EFScheduler *registrationScheduler;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)EMCoreAnalyticsCollector;
  v2 = -[EMCoreAnalyticsCollector init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_msgSend(v3, "initWithObject:", v4);
    periodicDataProviders = v2->_periodicDataProviders;
    v2->_periodicDataProviders = (EFLocked *)v5;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.email.EMCoreAnalyticsCollector.oneTimeScheduler"));
    v7 = objc_claimAutoreleasedReturnValue();
    oneTimeScheduler = v2->_oneTimeScheduler;
    v2->_oneTimeScheduler = (EFScheduler *)v7;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.email.EMCoreAnalyticsCollector.registrationScheduler"));
    v9 = objc_claimAutoreleasedReturnValue();
    registrationScheduler = v2->_registrationScheduler;
    v2->_registrationScheduler = (EFScheduler *)v9;

  }
  return v2;
}

- (void)logOneTimeEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[EMCoreAnalyticsCollector oneTimeScheduler](self, "oneTimeScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__EMCoreAnalyticsCollector_logOneTimeEvent___block_invoke;
  v7[3] = &unk_1E70F1FA0;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

- (EFScheduler)oneTimeScheduler
{
  return self->_oneTimeScheduler;
}

void __44__EMCoreAnalyticsCollector_logOneTimeEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[EMCoreAnalyticsCollector log](EMCoreAnalyticsCollector, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1B99BB000, v2, OS_LOG_TYPE_INFO, "Logging one time event for provider %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__EMCoreAnalyticsCollector_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_9 != -1)
    dispatch_once(&log_onceToken_9, block);
  return (id)log_log_9;
}

- (id)registerForLogEventsWithPeriodicDataProvider:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  EMCoreAnalyticsCollector *v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id from;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v4);
  v5 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, self);
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke;
  v17[3] = &unk_1E70F2870;
  objc_copyWeak(&v18, &from);
  objc_copyWeak(&v19, &location);
  objc_msgSend(v5, "addCancelationBlock:", v17);
  -[EMCoreAnalyticsCollector periodicDataProviders](self, "periodicDataProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke_3;
  v13[3] = &unk_1E70F2898;
  v8 = v4;
  v14 = v8;
  v15 = self;
  v16 = &v21;
  objc_msgSend(v7, "performWhileLocked:", v13);

  if (*((_BYTE *)v22 + 24))
  {
    -[EMCoreAnalyticsCollector registrationScheduler](self, "registrationScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke_4;
    v12[3] = &unk_1E70F1FA0;
    v12[4] = self;
    v10 = (id)objc_msgSend(v9, "afterDelay:performBlock:", v12, 5.0);

  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  _Block_object_dispose(&v21, 8);
  objc_destroyWeak(&location);

  return v5;
}

- (EFLocked)periodicDataProviders
{
  return self->_periodicDataProviders;
}

- (EFScheduler)registrationScheduler
{
  return self->_registrationScheduler;
}

void __31__EMCoreAnalyticsCollector_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_9;
  log_log_9 = (uint64_t)v1;

}

void __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "periodicDataProviders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke_2;
    v5[3] = &unk_1E70F2848;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    objc_msgSend(v4, "performWhileLocked:", v5);

    objc_destroyWeak(&v6);
  }

}

void __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "removeObject:");

}

uint64_t __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerXPCActivity");
}

uint64_t __44__EMCoreAnalyticsCollector_logOneTimeEvent___block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "data");
}

- (void)_registerXPCActivity
{
  void *v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD v6[5];

  if (_registerXPCActivity_onceToken != -1)
    dispatch_once(&_registerXPCActivity_onceToken, &__block_literal_global_7);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_3;
  v6[3] = &unk_1E70F2908;
  v6[4] = self;
  v3 = (void *)MEMORY[0x1BCCC8C10](v6);
  +[EMCoreAnalyticsCollector log](EMCoreAnalyticsCollector, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_INFO, "Registering Core Analytics Periodic Activity", v5, 2u);
  }

  ef_xpc_activity_register();
}

void __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke()
{
  os_activity_t v0;
  void *v1;

  v0 = _os_activity_create(&dword_1B99BB000, "Mail CoreAnalytics Periodic Collector Activity", MEMORY[0x1E0C80FE0], OS_ACTIVITY_FLAG_DEFAULT);
  v1 = (void *)_registerXPCActivity_periodicCoreAnalayticsCollectorActivity;
  _registerXPCActivity_periodicCoreAnalayticsCollectorActivity = (uint64_t)v0;

}

void __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807E8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808A8], 1);

}

void __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = a2;
  v4 = _registerXPCActivity_periodicCoreAnalayticsCollectorActivity;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_4;
  block[3] = &unk_1E70F2070;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  os_activity_apply(v4, block);

}

void __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  xpc_activity_state_t state;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_logPeriodicEvents");
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    +[EMCoreAnalyticsCollector log](EMCoreAnalyticsCollector, "log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 40));
      __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_4_cold_1(v4, state, v2);
    }

  }
}

- (void)_logPeriodicEvents
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  -[EMCoreAnalyticsCollector periodicDataProviders](self, "periodicDataProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__EMCoreAnalyticsCollector__logPeriodicEvents__block_invoke;
  v16[3] = &unk_1E70F2930;
  v16[4] = &v17;
  objc_msgSend(v2, "performWhileLocked:", v16);

  +[EMCoreAnalyticsCollector log](EMCoreAnalyticsCollector, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend((id)v18[5], "count");
    *(_DWORD *)buf = 134217984;
    v25 = v4;
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "Logging periodic events for providers: %ld", buf, 0xCu);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)v18[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "coreAnalyticsPeriodicEvent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v9;
        AnalyticsSendEventLazy();

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v23, 16);
    }
    while (v6);
  }

  _Block_object_dispose(&v17, 8);
}

void __46__EMCoreAnalyticsCollector__logPeriodicEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __46__EMCoreAnalyticsCollector__logPeriodicEvents__block_invoke_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "data");
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationScheduler, 0);
  objc_storeStrong((id *)&self->_oneTimeScheduler, 0);
  objc_storeStrong((id *)&self->_periodicDataProviders, 0);
}

void __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_4_cold_1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 5;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "Failed to transition from state %ld to state %d.", buf, 0x12u);
}

@end
