@implementation DNDSGamingTriggerManager

- (DNDSGamingTriggerManager)init
{
  DNDSGamingTriggerManager *v2;
  uint64_t v3;
  OS_dispatch_queue *biomeQueue;
  uint64_t v5;
  NSMutableDictionary *sinks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DNDSGamingTriggerManager;
  v2 = -[DNDSGamingTriggerManager init](&v8, sel_init);
  if (v2)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.private.biome-gaming.queue"));
    v3 = objc_claimAutoreleasedReturnValue();
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    if (-[DNDSGamingTriggerManager _featureEnabled](v2, "_featureEnabled"))
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
  if (-[DNDSGamingTriggerManager _featureEnabled](self, "_featureEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "gamingModeForGamingTriggerManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSGamingTriggerManager _configureTriggerWithMode:](self, "_configureTriggerWithMode:", v4);
    -[DNDSGamingTriggerManager _refreshWithMode:event:](self, "_refreshWithMode:event:", v4, 0);
    v5 = DNDSLogGamingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Updated assertions for gaming trigger: mode=%{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v6 = DNDSLogGamingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "No action taken for request to refresh gaming trigger; automatic entry not supported",
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
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
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
  -[DNDSGamingTriggerManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0;
  objc_msgSend(v8, "triggerManager:assertionsWithClientIdentifer:error:", self, CFSTR("com.apple.donotdisturb.private.gaming-trigger"), &v58);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v58;
  if (!v6)
  {
    if (!objc_msgSend(v10, "count"))
      goto LABEL_16;
    objc_msgSend(v10, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v9)
    {
      objc_msgSend(v23, "details");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "modeIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v9, "isEqualToString:", v26);

      if ((v27 & 1) != 0)
      {
        v18 = v11;
      }
      else
      {
        objc_msgSend(v24, "details");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(v44, "mutableCopy");

        objc_msgSend(v45, "setModeIdentifier:", v9);
        v56 = v11;
        v46 = (id)objc_msgSend(v8, "triggerManager:takeModeAssertionWithDetails:clientIdentifier:error:", self, v45, CFSTR("com.apple.donotdisturb.private.gaming-trigger"), &v56);
        v18 = v56;

        v47 = (void *)DNDSLogGamingTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v48 = v47;
          objc_msgSend(v24, "details");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "modeIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v60 = v9;
          v61 = 2114;
          v62 = v50;
          _os_log_impl(&dword_1CB895000, v48, OS_LOG_TYPE_DEFAULT, "Updating active assertion to new mode identifer for game controller trigger; modeID=%{public}@ previousModeID=%{public}@",
            buf,
            0x16u);

        }
      }
    }
    else
    {
      objc_msgSend(v23, "UUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v11;
      v37 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v36, 2, 0, CFSTR("com.apple.donotdisturb.private.gaming-trigger"), &v57);
      v18 = v57;

      v38 = (void *)DNDSLogGamingTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v39 = v38;
        objc_msgSend(v24, "details");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "modeIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v41;
        _os_log_impl(&dword_1CB895000, v39, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for game controller trigger; previousModeID=%{public}@",
          buf,
          0xCu);

      }
    }
    goto LABEL_26;
  }
  if (v9)
  {
    objc_msgSend(v6, "eventBody");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isControllerConnected");

    if (!v13 || objc_msgSend(v10, "count"))
    {
      if (objc_msgSend(v10, "count"))
      {
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __51__DNDSGamingTriggerManager__refreshWithMode_event___block_invoke;
        v53[3] = &unk_1E86A5BB0;
        v54 = v9;
        objc_msgSend(v10, "bs_filter:", v53);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "UUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v11;
          v17 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v16, 3, 0, CFSTR("com.apple.donotdisturb.private.gaming-trigger"), &v52);
          v18 = v52;

          v19 = (void *)DNDSLogGamingTrigger;
          if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
          {
            v20 = v19;
            objc_msgSend(v15, "details");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "modeIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v60 = v22;
            _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion for game controller trigger in response to event; previousModeID=%{public}@",
              buf,
              0xCu);

          }
        }
        else
        {
          v18 = v11;
        }

        goto LABEL_27;
      }
LABEL_16:
      v18 = v11;
      goto LABEL_27;
    }
    v24 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
    objc_msgSend(v24, "setIdentifier:", CFSTR("com.apple.donotdisturb.trigger.gaming"));
    objc_msgSend(v24, "setLifetime:", 0);
    objc_msgSend(v24, "setModeIdentifier:", v9);
    v55 = v11;
    v42 = (id)objc_msgSend(v8, "triggerManager:takeModeAssertionWithDetails:clientIdentifier:error:", self, v24, CFSTR("com.apple.donotdisturb.private.gaming-trigger"), &v55);
    v18 = v55;

    v43 = DNDSLogGamingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v60 = v9;
      _os_log_impl(&dword_1CB895000, v43, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for game controller trigger in response to event; modeID=%{public}@",
        buf,
        0xCu);
    }
LABEL_26:

    goto LABEL_27;
  }
  if (!objc_msgSend(v10, "count"))
    goto LABEL_16;
  objc_msgSend(v10, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "UUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v11;
  v30 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v29, 3, 0, CFSTR("com.apple.donotdisturb.private.gaming-trigger"), &v51);
  v18 = v51;

  v31 = (void *)DNDSLogGamingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v32 = v31;
    objc_msgSend(v10, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "details");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "modeIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = v35;
    _os_log_impl(&dword_1CB895000, v32, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion for game controller trigger in response to event, trigger is disabled; previousModeID=%{public}@",
      buf,
      0xCu);

  }
LABEL_27:

}

uint64_t __51__DNDSGamingTriggerManager__refreshWithMode_event___block_invoke(uint64_t a1, void *a2)
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
  DNDSGamingTriggerManager *v16;
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
    v7 = DNDSLogGamingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v4;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Adding biome game controller event monitor; mode=%{public}@",
        buf,
        0xCu);
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.donotdisturb.gamingTrigger"), self->_biomeQueue);
    objc_msgSend(MEMORY[0x1E0D027B8], "gameControllerStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "publisher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subscribeOn:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __54__DNDSGamingTriggerManager__configureTriggerWithMode___block_invoke_15;
    v15 = &unk_1E86A6B88;
    v16 = self;
    v17 = v4;
    objc_msgSend(v11, "sinkWithCompletion:receiveInput:", &__block_literal_global_34, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sinks, "setObject:forKeyedSubscript:", v6, CFSTR("system"), v12, v13, v14, v15, v16);
  }

}

void __54__DNDSGamingTriggerManager__configureTriggerWithMode___block_invoke(uint64_t a1, void *a2)
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
  v3 = (void *)DNDSLogGamingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
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
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Game controller subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);

  }
}

void __54__DNDSGamingTriggerManager__configureTriggerWithMode___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  int v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)DNDSLogGamingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isControllerConnected");
    objc_msgSend(v3, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 67109376;
    v16 = v7;
    v17 = 2048;
    v18 = objc_msgSend(v8, "numberOfControllersConnected");
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Received controller event: isControllerConnected=%{BOOL}d number=%lu", (uint8_t *)&v15, 0x12u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_refreshWithMode:event:", *(_QWORD *)(a1 + 40), v3);
  v9 = (void *)DNDSLogGamingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v3, "eventBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isControllerConnected");
    objc_msgSend(v3, "eventBody");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "numberOfControllersConnected");
    v15 = 67109376;
    v16 = v12;
    v17 = 2048;
    v18 = v14;
    _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Updated assertions for controller event: isControllerConnected=%{BOOL}d number=%lu", (uint8_t *)&v15, 0x12u);

  }
}

- (BOOL)_featureEnabled
{
  return 1;
}

- (DNDSGamingTriggerManagerDataSource)dataSource
{
  return (DNDSGamingTriggerManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
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
