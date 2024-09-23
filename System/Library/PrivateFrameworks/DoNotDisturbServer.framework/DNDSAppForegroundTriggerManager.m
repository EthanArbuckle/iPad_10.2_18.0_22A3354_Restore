@implementation DNDSAppForegroundTriggerManager

- (DNDSAppForegroundTriggerManager)init
{
  DNDSAppForegroundTriggerManager *v2;
  uint64_t v3;
  OS_dispatch_queue *biomeQueue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *coalescingQueue;
  uint64_t v8;
  NSMutableDictionary *sinks;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DNDSAppForegroundTriggerManager;
  v2 = -[DNDSAppForegroundTriggerManager init](&v11, sel_init);
  if (v2)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.private.biome-app-launch.queue"));
    v3 = objc_claimAutoreleasedReturnValue();
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.donotdisturb.appForeground.coalescing", v5);
    coalescingQueue = v2->_coalescingQueue;
    v2->_coalescingQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    sinks = v2->_sinks;
    v2->_sinks = (NSMutableDictionary *)v8;

  }
  return v2;
}

- (void)refresh
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "appForegroundTriggerConfigurationForAppForegroundTriggerManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSAppForegroundTriggerManager _configureAppForegroundTriggerWithConfiguration:](self, "_configureAppForegroundTriggerWithConfiguration:", v4);
  -[DNDSAppForegroundTriggerManager _refreshWithTriggerConfiguration:event:](self, "_refreshWithTriggerConfiguration:event:", v4, 0);
  v5 = DNDSLogAppForegroundTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Updated assertions for app launch triggers: configuration=%@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)_refreshWithTriggerConfiguration:(id)a3 event:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  DNDSAppForegroundTriggerManager *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  uint8_t buf[4];
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v43 = a4;
  -[DNDSAppForegroundTriggerManager dataSource](self, "dataSource");
  v57 = 0;
  v45 = self;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "triggerManager:assertionsWithClientIdentifer:error:", self, CFSTR("com.apple.donotdisturb.private.app-launch"), &v57);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v57;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v44 = v6;
  objc_msgSend(v6, "triggeringBundleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v16, "source");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "deviceIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          objc_msgSend(v16, "details");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v20, "hasSuffix:", CFSTR(".donotdisturb.trigger")))
          {
            objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".donotdisturb.trigger"), &stru_1E86A90B0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v47, "containsObject:", v21) & 1) == 0)
            {
              v22 = DNDSLogAppForegroundTrigger;
              if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v59 = v21;
                _os_log_impl(&dword_1CB895000, v22, OS_LOG_TYPE_DEFAULT, "Don't have trigger for identifier '%@'. Invalidating...", buf, 0xCu);
              }
              objc_msgSend(v16, "UUID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v8;
              v24 = (id)objc_msgSend(v46, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", v45, v23, 3, 0, CFSTR("com.apple.donotdisturb.private.app-launch"), &v52);
              v25 = v52;

              v8 = v25;
            }
          }
          else
          {
            v21 = v20;
          }

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v13);
  }

  if (v43)
  {
    v26 = DNDSLogAppForegroundTrigger;
    v27 = v44;
    if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v43;
      _os_log_impl(&dword_1CB895000, v26, OS_LOG_TYPE_DEFAULT, "Refreshing with event %@", buf, 0xCu);
    }
    objc_msgSend(v43, "eventBody");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isStarting");

    objc_msgSend(v43, "eventBody");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bundleID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "modeIdentifierForBundleIdentifier:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v29)
    {
      v34 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
      objc_msgSend(v31, "stringByAppendingString:", CFSTR(".donotdisturb.trigger"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setIdentifier:", v35);

      objc_msgSend(v34, "setLifetime:", 0);
      objc_msgSend(v34, "setModeIdentifier:", v33);
      objc_msgSend(v34, "setReason:", 3);
      v51 = v8;
      v36 = (id)objc_msgSend(v46, "triggerManager:takeModeAssertionWithDetails:clientIdentifier:error:", v45, v34, CFSTR("com.apple.donotdisturb.private.app-launch"), &v51);
      v37 = v51;

      v8 = v37;
    }
    else
    {
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __74__DNDSAppForegroundTriggerManager__refreshWithTriggerConfiguration_event___block_invoke;
      v49[3] = &unk_1E86A5BB0;
      v50 = v32;
      objc_msgSend(v11, "bs_filter:", v49);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v39, "UUID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v8;
        v41 = (id)objc_msgSend(v46, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", v45, v40, 3, 0, CFSTR("com.apple.donotdisturb.private.app-launch"), &v48);
        v42 = v48;

        v8 = v42;
      }

      v34 = v50;
    }

  }
  else
  {
    v27 = v44;
  }

}

uint64_t __74__DNDSAppForegroundTriggerManager__refreshWithTriggerConfiguration_event___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)_configureAppForegroundTriggerWithConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "triggeringBundleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  -[DNDSAppForegroundTriggerConfiguration triggeringBundleIdentifiers](self->_currentTriggerConfiguration, "triggeringBundleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sinks, "objectForKeyedSubscript:", CFSTR("system"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v13) & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sinks, "setObject:forKeyedSubscript:", 0, CFSTR("system"));
    objc_msgSend(v14, "cancel");

    objc_storeStrong((id *)&self->_currentTriggerConfiguration, a3);
    v14 = 0;
  }
  if (!objc_msgSend(v9, "count") || v14)
  {
    if (!objc_msgSend(v9, "count") && v14)
    {
      objc_msgSend(v14, "cancel");
      -[NSMutableDictionary removeObjectForKey:](self->_sinks, "removeObjectForKey:", CFSTR("system"));
    }
  }
  else
  {
    v22 = v5;
    v15 = DNDSLogAppForegroundTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Adding biome app launch event monitor for %{public}@", buf, 0xCu);
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.donotdisturb.appLaunch"), self->_biomeQueue);
    objc_msgSend(MEMORY[0x1E0D027B8], "appLaunch");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "publisher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "filterWithKeyPath:comparison:value:", CFSTR("eventBody.bundleID"), 3, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "subscribeOn:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __83__DNDSAppForegroundTriggerManager__configureAppForegroundTriggerWithConfiguration___block_invoke_22;
    v23[3] = &unk_1E86A5C18;
    v23[4] = self;
    objc_msgSend(v21, "sinkWithCompletion:receiveInput:", &__block_literal_global_1, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sinks, "setObject:forKeyedSubscript:", v14, CFSTR("system"));
    v5 = v22;
  }

}

void __83__DNDSAppForegroundTriggerManager__configureAppForegroundTriggerWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)DNDSLogAppForegroundTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = a2;
    v6 = objc_msgSend(v5, "state");
    objc_msgSend(v5, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 134218242;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "AppLaunch subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);

  }
}

void __83__DNDSAppForegroundTriggerManager__configureAppForegroundTriggerWithConfiguration___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)DNDSLogAppForegroundTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isStarting"))
      v9 = CFSTR("Y");
    else
      v9 = CFSTR("N");
    objc_msgSend(v3, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Received app launch event: bundleID=%{public}@ starting=%{public}@ event=%{public}@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_refreshIfNeccessaryForEvent:", v3);

}

- (void)_refreshIfNeccessaryForEvent:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *coalescingQueue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "appForegroundTriggerConfigurationForAppForegroundTriggerManager:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  coalescingQueue = self->_coalescingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__DNDSAppForegroundTriggerManager__refreshIfNeccessaryForEvent___block_invoke;
  block[3] = &unk_1E86A58D0;
  block[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(coalescingQueue, block);

}

uint64_t __64__DNDSAppForegroundTriggerManager__refreshIfNeccessaryForEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coalescingQueue_coalesceWithTriggerConfiguration:event:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_coalescingQueue_refreshWithTriggerConfiguration:(id)a3
{
  -[DNDSAppForegroundTriggerManager _refreshWithTriggerConfiguration:event:](self, "_refreshWithTriggerConfiguration:event:", a3, self->_latestEvent);
}

- (void)_coalescingQueue_coalesceWithTriggerConfiguration:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  BMStoreEvent *latestEvent;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  BMStoreEvent *v15;
  NSObject *v16;
  void *v17;
  OS_os_transaction *v18;
  OS_os_transaction *eventCoalescingTransaction;
  OS_dispatch_source *v20;
  OS_dispatch_source *coalescingTimer;
  NSObject *v22;
  dispatch_time_t v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  latestEvent = self->_latestEvent;
  if (latestEvent)
  {
    -[BMStoreEvent eventBody](latestEvent, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqualToString:", v12);

    if ((v13 & 1) == 0)
    {
      -[DNDSAppForegroundTriggerManager _coalescingQueue_resetCoalescingTimer](self, "_coalescingQueue_resetCoalescingTimer");
      -[DNDSAppForegroundTriggerManager _coalescingQueue_refreshWithTriggerConfiguration:](self, "_coalescingQueue_refreshWithTriggerConfiguration:", v6);
      v14 = (void *)DNDSLogAppForegroundTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_latestEvent;
        v16 = v14;
        -[BMStoreEvent eventBody](v15, "eventBody");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v17;
        _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "reset coalescing timer due to bundleID change; updated assertions for app launch event: event=%{public}@",
          buf,
          0xCu);

      }
    }
  }
  objc_storeStrong((id *)&self->_latestEvent, a4);
  if (!self->_coalescingTimer)
  {
    v18 = (OS_os_transaction *)os_transaction_create();
    eventCoalescingTransaction = self->_eventCoalescingTransaction;
    self->_eventCoalescingTransaction = v18;

    v20 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_coalescingQueue);
    coalescingTimer = self->_coalescingTimer;
    self->_coalescingTimer = v20;

    v22 = self->_coalescingTimer;
    v23 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0);
    v24 = self->_coalescingTimer;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __91__DNDSAppForegroundTriggerManager__coalescingQueue_coalesceWithTriggerConfiguration_event___block_invoke;
    v25[3] = &unk_1E86A59E8;
    v25[4] = self;
    v26 = v6;
    dispatch_source_set_event_handler(v24, v25);
    dispatch_resume((dispatch_object_t)self->_coalescingTimer);

  }
}

uint64_t __91__DNDSAppForegroundTriggerManager__coalescingQueue_coalesceWithTriggerConfiguration_event___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_coalescingQueue_refreshWithTriggerConfiguration:", *(_QWORD *)(a1 + 40));
  v2 = (void *)DNDSLogAppForegroundTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v4 = v2;
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "coalescing timer fired; updated assertions for app launch event: event=%{public}@",
      (uint8_t *)&v9,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_coalescingQueue_resetCoalescingTimer");
}

- (void)_coalescingQueue_resetCoalescingTimer
{
  NSObject *coalescingTimer;
  OS_dispatch_source *v4;
  OS_os_transaction *eventCoalescingTransaction;

  coalescingTimer = self->_coalescingTimer;
  if (coalescingTimer)
  {
    dispatch_source_cancel(coalescingTimer);
    v4 = self->_coalescingTimer;
    self->_coalescingTimer = 0;

    eventCoalescingTransaction = self->_eventCoalescingTransaction;
    self->_eventCoalescingTransaction = 0;

  }
}

- (DNDSAppForegroundTriggerManagerDataSource)dataSource
{
  return (DNDSAppForegroundTriggerManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_eventCoalescingTransaction, 0);
  objc_storeStrong((id *)&self->_latestEvent, 0);
  objc_storeStrong((id *)&self->_currentTriggerConfiguration, 0);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_coalescingQueue, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
}

@end
