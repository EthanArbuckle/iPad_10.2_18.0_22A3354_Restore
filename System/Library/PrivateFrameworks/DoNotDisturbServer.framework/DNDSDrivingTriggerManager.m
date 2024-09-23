@implementation DNDSDrivingTriggerManager

- (DNDSDrivingTriggerManager)init
{
  DNDSDrivingTriggerManager *v2;
  uint64_t v3;
  OS_dispatch_queue *biomeQueue;
  uint64_t v5;
  NSMutableDictionary *sinks;
  CARAutomaticDNDStatus *v7;
  CARAutomaticDNDStatus *status;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DNDSDrivingTriggerManager;
  v2 = -[DNDSDrivingTriggerManager init](&v11, sel_init);
  if (v2)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.private.biome-driving.queue"));
    v3 = objc_claimAutoreleasedReturnValue();
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    if (-[DNDSDrivingTriggerManager _featureEnabled](v2, "_featureEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = objc_claimAutoreleasedReturnValue();
      sinks = v2->_sinks;
      v2->_sinks = (NSMutableDictionary *)v5;

      v2->_lock._os_unfair_lock_opaque = 0;
      v7 = (CARAutomaticDNDStatus *)objc_alloc_init(MEMORY[0x1E0D0D320]);
      status = v2->_status;
      v2->_status = v7;

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)DNDDrivingTriggerObserverCallback, (CFStringRef)*MEMORY[0x1E0D0D2F0], 0, CFNotificationSuspensionBehaviorCoalesce);
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)DNDDrivingTriggerObserverCallback, (CFStringRef)*MEMORY[0x1E0D0D2F8], 0, CFNotificationSuspensionBehaviorCoalesce);
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
  if (objc_msgSend(MEMORY[0x1E0D0D320], "isAutomaticDNDAvailable")
    && -[DNDSDrivingTriggerManager _featureEnabled](self, "_featureEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "drivingModeForDrivingTriggerManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSDrivingTriggerManager _configureDrivingTriggerWithMode:](self, "_configureDrivingTriggerWithMode:", v4);
    -[DNDSDrivingTriggerManager _refreshWithMode:event:](self, "_refreshWithMode:event:", v4, 0);
    v5 = DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Updated assertions for driving trigger: mode=%{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v6 = DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "No action taken for request to refresh driving trigger; automatic entry not supported",
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
  int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
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
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  BOOL v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  uint8_t buf[4];
  id v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[DNDSDrivingTriggerManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "isStart");
  objc_msgSend(v7, "modeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0;
  objc_msgSend(v8, "triggerManager:assertionsWithClientIdentifer:error:", self, CFSTR("com.apple.donotdisturb.private.driving-trigger"), &v75);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v75;
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (objc_msgSend(v12, "count"))
    {
      if (!v11)
      {
        v45 = (void *)DNDSLogDrivingTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v46 = v45;
          objc_msgSend(v14, "details");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "modeIdentifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v77 = v48;
          _os_log_impl(&dword_1CB895000, v46, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for driving trigger; previousModeID=%{public}@",
            buf,
            0xCu);

        }
        objc_msgSend(v14, "UUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v13;
        v49 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v30, 2, 0, CFSTR("com.apple.donotdisturb.private.driving-trigger"), &v74);
        v36 = v74;
        goto LABEL_21;
      }
      objc_msgSend(v14, "details");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "modeIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v11, "isEqualToString:", v27);

      if ((v28 & 1) == 0)
      {
        objc_msgSend(v14, "details");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v29, "mutableCopy");

        objc_msgSend(v30, "setModeIdentifier:", v11);
        v31 = (void *)DNDSLogDrivingTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v32 = v31;
          objc_msgSend(v14, "details");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "modeIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v77 = v11;
          v78 = 2114;
          v79 = v34;
          _os_log_impl(&dword_1CB895000, v32, OS_LOG_TYPE_DEFAULT, "Updating active assertion to new mode identifer for driving trigger; modeID=%{public}@ previousModeID=%{public}@",
            buf,
            0x16u);

        }
        v73 = v13;
        v35 = (id)objc_msgSend(v8, "triggerManager:takeModeAssertionWithDetails:clientIdentifier:error:", self, v30, CFSTR("com.apple.donotdisturb.private.driving-trigger"), &v73);
        v36 = v73;
LABEL_21:
        v25 = v36;

        goto LABEL_34;
      }
    }
LABEL_17:
    v25 = v13;
    goto LABEL_34;
  }
  if (v11)
  {
    v72 = v13;
    objc_msgSend(v8, "triggerManager:assertionsWithClientIdentifer:error:", self, CFSTR("com.apple.focus.activity-manager"), &v72);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v72;

    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __52__DNDSDrivingTriggerManager__refreshWithMode_event___block_invoke;
    v70[3] = &unk_1E86A5BB0;
    v17 = v11;
    v71 = v17;
    objc_msgSend(v15, "bs_filter:", v70);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = v18;
    objc_msgSend(v18, "firstObject");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v14
      && v19
      && (v21 = DNDSLogDrivingTrigger,
          os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 138543874;
      v77 = v17;
      v78 = 2114;
      v79 = v14;
      v80 = 2114;
      v81 = v20;
      _os_log_error_impl(&dword_1CB895000, v21, OS_LOG_TYPE_ERROR, "Existing assertions found for driving trigger manager and activity manager; modeID=%{public}@ assertion=%{public"
        "}@ userAssertion=%{public}@",
        buf,
        0x20u);
      if (v10)
        goto LABEL_7;
    }
    else if (v10)
    {
LABEL_7:
      v22 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
      objc_msgSend(v22, "setIdentifier:", CFSTR("com.apple.donotdisturb.trigger.driving"));
      objc_msgSend(v22, "setLifetime:", 0);
      objc_msgSend(v22, "setModeIdentifier:", v17);
      objc_msgSend(v22, "setReason:", 3);
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __52__DNDSDrivingTriggerManager__refreshWithMode_event___block_invoke_23;
      v65[3] = &unk_1E86A6D90;
      v69 = v20 != 0;
      v66 = v20;
      v67 = v17;
      v68 = v22;
      v23 = v22;
      v24 = (id)objc_msgSend(v8, "triggerManager:performModeAssertionUpdatesWithHandler:", self, v65);

      v25 = v66;
      goto LABEL_32;
    }
    if (v20)
    {
      v50 = (void *)DNDSLogDrivingTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v51 = v50;
        objc_msgSend(v20, "details");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "modeIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v77 = v53;
        _os_log_impl(&dword_1CB895000, v51, OS_LOG_TYPE_DEFAULT, "Invalidating active user assertion in driving trigger in response to event; previousModeID=%{public}@",
          buf,
          0xCu);

      }
      objc_msgSend(v20, "UUID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v16;
      v55 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v54, 3, 0, CFSTR("com.apple.donotdisturb.private.driving-trigger"), &v64);
      v25 = v64;

      if (!v14)
        goto LABEL_33;
    }
    else
    {
      v25 = v16;
      if (!v14)
      {
LABEL_33:

        goto LABEL_34;
      }
    }
    v56 = (void *)DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v57 = v56;
      objc_msgSend(v14, "details");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "modeIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v77 = v59;
      _os_log_impl(&dword_1CB895000, v57, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion in driving trigger in response to event; previousModeID=%{public}@",
        buf,
        0xCu);

    }
    objc_msgSend(v14, "UUID");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v63 = v25;
    v60 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v23, 3, 0, CFSTR("com.apple.donotdisturb.private.driving-trigger"), &v63);
    v16 = v63;
LABEL_32:

    v25 = v16;
    goto LABEL_33;
  }
  if (!objc_msgSend(v12, "count"))
    goto LABEL_17;
  objc_msgSend(v12, "firstObject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "UUID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v13;
  v39 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v38, 3, 0, CFSTR("com.apple.donotdisturb.private.driving-trigger"), &v62);
  v25 = v62;

  v40 = (void *)DNDSLogDrivingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v41 = v40;
    objc_msgSend(v12, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "details");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "modeIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v77 = v44;
    _os_log_impl(&dword_1CB895000, v41, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for driving trigger in response to event; previousModeID=%{public}@",
      buf,
      0xCu);

  }
LABEL_34:

}

uint64_t __52__DNDSDrivingTriggerManager__refreshWithMode_event___block_invoke(uint64_t a1, void *a2)
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

uint64_t __52__DNDSDrivingTriggerManager__refreshWithMode_event___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionInvalidationPredicate predicateForAssertionClientIdentifiers:](DNDSModeAssertionInvalidationPredicate, "predicateForAssertionClientIdentifiers:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", CFSTR("com.apple.donotdisturb.private.driving-trigger"), 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:details:source:reason:reasonOverride:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:details:source:reason:reasonOverride:", v7, v9, 0, v8, 4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v12 = *(void **)(a1 + 48);
      v14 = v11;
      objc_msgSend(v12, "lifetime");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v13;
      v26 = 2114;
      v27 = v15;
      _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Invalidating user assertion for mode in response to event; modeID=%{public}@ lifetime=%{public}@",
        (uint8_t *)&v24,
        0x16u);

    }
    v16 = (id)objc_msgSend(v3, "invalidateAssertionsForRequest:", v10);

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", CFSTR("com.apple.donotdisturb.private.driving-trigger"), 0);
  v18 = DNDSLogDrivingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 40);
    v24 = 138543362;
    v25 = v19;
    _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for driving trigger in response to event; modeID=%{public}@",
      (uint8_t *)&v24,
      0xCu);
  }
  v20 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v3, "takeAssertionWithDetails:source:startDate:", v20, v17, v21);

  return 1;
}

- (void)_configureDrivingTriggerWithMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
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
    v7 = DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v4;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Adding biome driving event monitor; mode=%{public}@",
        buf,
        0xCu);
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.donotdisturb.drivingTrigger"), self->_biomeQueue);
    objc_msgSend(MEMORY[0x1E0D027B8], "doNotDisturbWhileDrivingStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "publisher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subscribeOn:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__DNDSDrivingTriggerManager__configureDrivingTriggerWithMode___block_invoke_37;
    v19[3] = &unk_1E86A6B88;
    v19[4] = self;
    v12 = v4;
    v20 = v12;
    objc_msgSend(v11, "sinkWithCompletion:receiveInput:", &__block_literal_global_15, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sinks, "setObject:forKeyedSubscript:", v13, CFSTR("system"));
    objc_msgSend(MEMORY[0x1E0D027B8], "doNotDisturbWhileDrivingStream");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "publisherFromStartTime:", CFAbsoluteTimeGetCurrent() + -2.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "last");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__DNDSDrivingTriggerManager__configureDrivingTriggerWithMode___block_invoke_45;
    v17[3] = &unk_1E86A6B88;
    v17[4] = self;
    v18 = v12;
    objc_msgSend(v16, "sinkWithCompletion:receiveInput:", &__block_literal_global_44_0, v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  os_unfair_lock_unlock(&self->_lock);

}

void __62__DNDSDrivingTriggerManager__configureDrivingTriggerWithMode___block_invoke(uint64_t a1, void *a2)
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
  v3 = (void *)DNDSLogDrivingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
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
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Driving subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);

  }
}

void __62__DNDSDrivingTriggerManager__configureDrivingTriggerWithMode___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)DNDSLogDrivingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "reason");
    if (v7 > 6)
      v8 = CFSTR("unspecified");
    else
      v8 = off_1E86A6DF0[v7];
    objc_msgSend(v3, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isStart"))
      v10 = CFSTR("Y");
    else
      v10 = CFSTR("N");
    v18 = 138543618;
    v19 = v8;
    v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Received driving event: reason=%{public}@ starting=%{public}@", (uint8_t *)&v18, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_refreshWithMode:event:", *(_QWORD *)(a1 + 40), v3);
  v11 = (void *)DNDSLogDrivingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v3, "eventBody");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "reason");
    if (v14 > 6)
      v15 = CFSTR("unspecified");
    else
      v15 = off_1E86A6DF0[v14];
    objc_msgSend(v3, "eventBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isStart"))
      v17 = CFSTR("Y");
    else
      v17 = CFSTR("N");
    v18 = 138543618;
    v19 = v15;
    v20 = 2114;
    v21 = v17;
    _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Updated assertions for driving event: reason=%{public}@ starting=%{public}@", (uint8_t *)&v18, 0x16u);

  }
}

void __62__DNDSDrivingTriggerManager__configureDrivingTriggerWithMode___block_invoke_43(uint64_t a1, void *a2)
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
  v3 = (void *)DNDSLogDrivingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
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
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Driving most recent event in the past 2s completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);

  }
}

void __62__DNDSDrivingTriggerManager__configureDrivingTriggerWithMode___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      objc_msgSend(v3, "eventBody");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "reason");
      if (v7 > 6)
        v8 = CFSTR("unspecified");
      else
        v8 = off_1E86A6DF0[v7];
      objc_msgSend(v3, "eventBody");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isStart"))
        v10 = CFSTR("Y");
      else
        v10 = CFSTR("N");
      v18 = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Received last driving event in the prior 2s: reason=%{public}@ starting=%{public}@", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_refreshWithMode:event:", *(_QWORD *)(a1 + 40), v3);
    v11 = (void *)DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_msgSend(v3, "eventBody");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "reason");
      if (v14 > 6)
        v15 = CFSTR("unspecified");
      else
        v15 = off_1E86A6DF0[v14];
      objc_msgSend(v3, "eventBody");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isStart"))
        v17 = CFSTR("Y");
      else
        v17 = CFSTR("N");
      v18 = 138543618;
      v19 = v15;
      v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Updated assertions for last driving event in the prior 2s: reason=%{public}@ starting=%{public}@", (uint8_t *)&v18, 0x16u);

    }
  }

}

- (BOOL)_featureEnabled
{
  return 1;
}

- (DNDSDrivingTriggerManagerDataSource)dataSource
{
  return (DNDSDrivingTriggerManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
}

@end
