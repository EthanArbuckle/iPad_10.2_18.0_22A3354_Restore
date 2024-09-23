@implementation DNDSSmartTriggerManager

- (DNDSSmartTriggerManager)init
{
  DNDSSmartTriggerManager *v2;
  uint64_t v3;
  OS_dispatch_queue *biomeQueue;
  uint64_t v5;
  NSMutableDictionary *sinks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DNDSSmartTriggerManager;
  v2 = -[DNDSSmartTriggerManager init](&v8, sel_init);
  if (v2)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.private.biome-inferred-mode.queue"));
    v3 = objc_claimAutoreleasedReturnValue();
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    sinks = v2->_sinks;
    v2->_sinks = (NSMutableDictionary *)v5;

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
  objc_msgSend(WeakRetained, "modesSupportingSmartEntryForSmartTriggerManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSSmartTriggerManager _configureSmartTriggerWithSupportedModes:](self, "_configureSmartTriggerWithSupportedModes:", v4);
  -[DNDSSmartTriggerManager _refreshWithSupportedModes:event:](self, "_refreshWithSupportedModes:event:", v4, 0);
  v5 = DNDSLogSmartTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogSmartTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Updated assertions for smart triggers: supportedModes=%{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)_refreshWithSupportedModes:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;

  v6 = a3;
  v7 = a4;
  -[DNDSSmartTriggerManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isStart");

  objc_msgSend(v7, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "modeUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v7, "eventBody");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "modeUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithUUIDString:", v15);

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v6, "allObjects", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __60__DNDSSmartTriggerManager__refreshWithSupportedModes_event___block_invoke;
  v39[3] = &unk_1E86A89A0;
  v19 = v16;
  v40 = v19;
  objc_msgSend(v17, "bs_firstObjectPassingTest:", v39);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "modeIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v8, "triggerManager:assertionsWithClientIdentifer:error:", self, CFSTR("com.apple.donotdisturb.private.smart-trigger"), &v38);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v38;
  if (v21)
  {
    if (v10)
    {
      v24 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
      objc_msgSend(v24, "setIdentifier:", CFSTR("com.apple.donotdisturb.trigger.smart"));
      objc_msgSend(v24, "setLifetime:", 0);
      objc_msgSend(v24, "setModeIdentifier:", v21);
      v37 = v23;
      v25 = (id)objc_msgSend(v8, "triggerManager:takeModeAssertionWithDetails:clientIdentifier:error:", self, v24, CFSTR("com.apple.donotdisturb.private.smart-trigger"), &v37);
      v26 = v37;

      v23 = v26;
      v27 = v33;
    }
    else
    {
      v35[0] = v18;
      v35[1] = 3221225472;
      v35[2] = __60__DNDSSmartTriggerManager__refreshWithSupportedModes_event___block_invoke_2;
      v35[3] = &unk_1E86A5BB0;
      v36 = v21;
      objc_msgSend(v22, "bs_filter:", v35);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v29, "UUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v23;
        v31 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v30, 3, 0, CFSTR("com.apple.donotdisturb.private.smart-trigger"), &v34);
        v32 = v34;

        v23 = v32;
      }
      v27 = v33;

      v24 = v36;
    }

  }
  else
  {
    v27 = v33;
  }

}

uint64_t __60__DNDSSmartTriggerManager__refreshWithSupportedModes_event___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

uint64_t __60__DNDSSmartTriggerManager__refreshWithSupportedModes_event___block_invoke_2(uint64_t a1, void *a2)
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

- (void)_configureSmartTriggerWithSupportedModes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sinks, "objectForKeyedSubscript:", CFSTR("system"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count") || v5)
  {
    if (!objc_msgSend(v4, "count") && v5)
    {
      objc_msgSend(v5, "cancel");
      -[NSMutableDictionary removeObjectForKey:](self->_sinks, "removeObjectForKey:", CFSTR("system"));
    }
  }
  else
  {
    v6 = (void *)DNDSLogSmartTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSmartTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v4, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Adding biome inferred mode event monitor for %{public}@", buf, 0xCu);

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.donotdisturb.smartTrigger"), self->_biomeQueue);
    v10 = objc_alloc_init(MEMORY[0x1E0D02688]);
    objc_msgSend(v10, "publisher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filterWithKeyPath:value:", CFSTR("eventBody.isAutomationEnabled"), MEMORY[0x1E0C9AAB0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subscribeOn:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__DNDSSmartTriggerManager__configureSmartTriggerWithSupportedModes___block_invoke_19;
    v14[3] = &unk_1E86A5C18;
    v14[4] = self;
    objc_msgSend(v13, "sinkWithCompletion:receiveInput:", &__block_literal_global_40, v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sinks, "setObject:forKeyedSubscript:", v5, CFSTR("system"));
  }

}

void __68__DNDSSmartTriggerManager__configureSmartTriggerWithSupportedModes___block_invoke(uint64_t a1, void *a2)
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
  v3 = (void *)DNDSLogSmartTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogSmartTrigger, OS_LOG_TYPE_DEFAULT))
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
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "InferredMode subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);

  }
}

void __68__DNDSSmartTriggerManager__configureSmartTriggerWithSupportedModes___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)DNDSLogSmartTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogSmartTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isStart");
    v10 = CFSTR("N");
    if (v9)
      v10 = CFSTR("Y");
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Received inferred mode event: modeIdentifier=%{public}@ starting=%{public}@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_refreshIfNeccessaryForEvent:", v3);

}

- (void)_refreshIfNeccessaryForEvent:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "modesSupportingSmartEntryForSmartTriggerManager:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v4, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modeUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithUUIDString:", v9);

  objc_msgSend(v6, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __56__DNDSSmartTriggerManager__refreshIfNeccessaryForEvent___block_invoke;
  v18[3] = &unk_1E86A89A0;
  v12 = v10;
  v19 = v12;
  LODWORD(v9) = objc_msgSend(v11, "bs_containsObjectPassingTest:", v18);

  if ((_DWORD)v9)
  {
    -[DNDSSmartTriggerManager _refreshWithSupportedModes:event:](self, "_refreshWithSupportedModes:event:", v6, v4);
    v13 = (void *)DNDSLogSmartTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSmartTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v4, "eventBody");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      v16 = "Updated assertions for inferred mode event: event=%{public}@";
LABEL_6:
      _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);

    }
  }
  else
  {
    v17 = (void *)DNDSLogSmartTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSmartTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v17;
      objc_msgSend(v4, "eventBody");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      v16 = "Ignored automatic entry for unsupported inferred mode event: event=%{public}@";
      goto LABEL_6;
    }
  }

}

uint64_t __56__DNDSSmartTriggerManager__refreshIfNeccessaryForEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (DNDSSmartTriggerManagerDataSource)dataSource
{
  return (DNDSSmartTriggerManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
}

@end
