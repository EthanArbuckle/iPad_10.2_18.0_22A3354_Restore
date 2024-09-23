@implementation DNDSMindfulnessTriggerManager

- (DNDSMindfulnessTriggerManager)init
{
  DNDSMindfulnessTriggerManager *v2;
  uint64_t v3;
  OS_dispatch_queue *biomeQueue;
  uint64_t v5;
  NSMutableDictionary *sinks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DNDSMindfulnessTriggerManager;
  v2 = -[DNDSMindfulnessTriggerManager init](&v8, sel_init);
  if (v2)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.private.biome-mindfulness.queue"));
    v3 = objc_claimAutoreleasedReturnValue();
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    if (-[DNDSMindfulnessTriggerManager _featureEnabled](v2, "_featureEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = objc_claimAutoreleasedReturnValue();
      sinks = v2->_sinks;
      v2->_sinks = (NSMutableDictionary *)v5;

    }
  }
  return v2;
}

- (void)refresh
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[DNDSMindfulnessTriggerManager _featureEnabled](self, "_featureEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "mindfulnessModeForMindfulnessTriggerManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSMindfulnessTriggerManager _configureTriggerWithMode:](self, "_configureTriggerWithMode:", v4);
    -[DNDSMindfulnessTriggerManager _refreshWithMode:event:](self, "_refreshWithMode:event:", v4, 0);
    v5 = DNDSLogMindfulnessTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Updated assertions for mindfulness trigger: mode=%{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v6 = DNDSLogMindfulnessTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "No action taken for request to refresh mindfulness trigger; automatic entry not supported",
        (uint8_t *)&v7,
        2u);
    }
  }
}

- (void)_refreshWithMode:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[DNDSMindfulnessTriggerManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0;
  objc_msgSend(v8, "triggerManager:assertionsWithClientIdentifer:error:", self, CFSTR("com.apple.donotdisturb.private.mindfulness-trigger"), &v58);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v58;
  if (!v6)
  {
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v18;
      if (v9)
      {
        objc_msgSend(v18, "details");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "modeIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v9, "isEqualToString:", v20);

        if ((v21 & 1) != 0)
        {
          v16 = v11;
        }
        else
        {
          objc_msgSend(v14, "details");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)objc_msgSend(v44, "mutableCopy");

          objc_msgSend(v45, "setModeIdentifier:", v9);
          v56 = v11;
          v46 = (id)objc_msgSend(v8, "triggerManager:takeModeAssertionWithDetails:clientIdentifier:error:", self, v45, CFSTR("com.apple.donotdisturb.private.mindfulness-trigger"), &v56);
          v16 = v56;

          v47 = (void *)DNDSLogMindfulnessTrigger;
          if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
          {
            v48 = v47;
            objc_msgSend(v14, "details");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "modeIdentifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v60 = v9;
            v61 = 2114;
            v62 = v50;
            _os_log_impl(&dword_1CB895000, v48, OS_LOG_TYPE_DEFAULT, "Updating active assertion to new mode identifer for mindfulness session trigger; modeID=%{public}@ previou"
              "sModeID=%{public}@",
              buf,
              0x16u);

          }
        }
      }
      else
      {
        objc_msgSend(v18, "UUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v11;
        v39 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v38, 2, 0, CFSTR("com.apple.donotdisturb.private.mindfulness-trigger"), &v57);
        v16 = v57;

        v40 = (void *)DNDSLogMindfulnessTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v41 = v40;
          objc_msgSend(v14, "details");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "modeIdentifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v60 = v43;
          _os_log_impl(&dword_1CB895000, v41, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for mindfulness session trigger; previousModeID=%{public}@",
            buf,
            0xCu);

        }
      }
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  if (v9)
  {
    objc_msgSend(v6, "eventBody");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "stateType");

    if (v13 != 2)
    {
      if (v13 == 1 && !objc_msgSend(v10, "count"))
      {
        v14 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
        objc_msgSend(v14, "setIdentifier:", CFSTR("com.apple.donotdisturb.trigger.mindfulness"));
        objc_msgSend(v14, "setLifetime:", 0);
        objc_msgSend(v14, "setModeIdentifier:", v9);
        v55 = v11;
        v15 = (id)objc_msgSend(v8, "triggerManager:takeModeAssertionWithDetails:clientIdentifier:error:", self, v14, CFSTR("com.apple.donotdisturb.private.mindfulness-trigger"), &v55);
        v16 = v55;

        v17 = DNDSLogMindfulnessTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v60 = v9;
          _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for mindfulness session trigger in response to event; modeID=%{public}@",
            buf,
            0xCu);
        }
LABEL_25:

        goto LABEL_28;
      }
      goto LABEL_19;
    }
    if (objc_msgSend(v10, "count"))
    {
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __56__DNDSMindfulnessTriggerManager__refreshWithMode_event___block_invoke;
      v53[3] = &unk_1E86A5BB0;
      v54 = v9;
      objc_msgSend(v10, "bs_filter:", v53);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v31, "UUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v11;
        v33 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v32, 3, 0, CFSTR("com.apple.donotdisturb.private.mindfulness-trigger"), &v52);
        v16 = v52;

        v34 = (void *)DNDSLogMindfulnessTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v35 = v34;
          objc_msgSend(v31, "details");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "modeIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v60 = v37;
          _os_log_impl(&dword_1CB895000, v35, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion for mindfulness session trigger in response to event; previousModeID=%{public}@",
            buf,
            0xCu);

        }
      }
      else
      {
        v16 = v11;
      }

      goto LABEL_28;
    }
LABEL_19:
    v16 = v11;
    goto LABEL_28;
  }
  if (!objc_msgSend(v10, "count"))
    goto LABEL_19;
  objc_msgSend(v10, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v11;
  v24 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v23, 3, 0, CFSTR("com.apple.donotdisturb.private.mindfulness-trigger"), &v51);
  v16 = v51;

  v25 = (void *)DNDSLogMindfulnessTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    objc_msgSend(v10, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "details");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "modeIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = v29;
    _os_log_impl(&dword_1CB895000, v26, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion for mindfulness session trigger in response to event, trigger is disabled; previousM"
      "odeID=%{public}@",
      buf,
      0xCu);

  }
LABEL_28:

}

uint64_t __56__DNDSMindfulnessTriggerManager__refreshWithMode_event___block_invoke(uint64_t a1, void *a2)
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

- (void)_configureTriggerWithMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  DNDSMindfulnessTriggerManager *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sinks, "objectForKeyedSubscript:", CFSTR("system"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4 || v5)
  {
    if (!v4 && v5)
    {
      objc_msgSend(v5, "cancel");
      -[NSMutableDictionary removeObjectForKey:](self->_sinks, "removeObjectForKey:", CFSTR("system"));
    }
  }
  else
  {
    v7 = DNDSLogMindfulnessTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v4;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Adding biome mindfulness session event monitor; mode=%{public}@",
        buf,
        0xCu);
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.donotdisturb.mindfulnessTrigger"), self->_biomeQueue);
    objc_msgSend(MEMORY[0x1E0D027B8], "mindfulnessStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "publisher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subscribeOn:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __59__DNDSMindfulnessTriggerManager__configureTriggerWithMode___block_invoke_15;
    v15 = &unk_1E86A6B88;
    v16 = self;
    v17 = v4;
    objc_msgSend(v11, "sinkWithCompletion:receiveInput:", &__block_literal_global_27, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sinks, "setObject:forKeyedSubscript:", v6, CFSTR("system"), v12, v13, v14, v15, v16);
  }

}

void __59__DNDSMindfulnessTriggerManager__configureTriggerWithMode___block_invoke(uint64_t a1, void *a2)
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
  v3 = (void *)DNDSLogMindfulnessTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
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
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Mindfulness session subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);

  }
}

void __59__DNDSMindfulnessTriggerManager__configureTriggerWithMode___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)DNDSLogMindfulnessTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "stateType");
    if ((unint64_t)(v7 - 1) > 3)
      v8 = CFSTR("unspecified");
    else
      v8 = off_1E86A7E68[v7 - 1];
    v16 = 138543362;
    v17 = v8;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Received mindfulness session event: eventType=%{public}@", (uint8_t *)&v16, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_refreshWithMode:event:", *(_QWORD *)(a1 + 40), v3);
  v9 = (id)DNDSLogMindfulnessTrigger;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "stateType") - 1;
    if (v11 > 3)
      v12 = CFSTR("unspecified");
    else
      v12 = off_1E86A7E68[v11];
    objc_msgSend(v3, "eventBody");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "sessionType");
    if (v14 > 2)
      v15 = CFSTR("unspecified");
    else
      v15 = off_1E86A7E88[v14];
    v16 = 138543618;
    v17 = v12;
    v18 = 2114;
    v19 = v15;
    _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Updated assertions for mindfulness session event: eventType=%{public}@ sessionType=%{public}@", (uint8_t *)&v16, 0x16u);

  }
}

- (BOOL)_featureEnabled
{
  return 1;
}

- (DNDSMindfulnessTriggerManagerDataSource)dataSource
{
  return (DNDSMindfulnessTriggerManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
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
