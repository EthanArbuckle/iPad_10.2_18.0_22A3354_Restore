@implementation DNDSWorkoutTriggerManager

- (DNDSWorkoutTriggerManager)init
{
  DNDSWorkoutTriggerManager *v2;
  uint64_t v3;
  OS_dispatch_queue *biomeQueue;
  uint64_t v5;
  NSMutableDictionary *sinks;
  NPSManager *v7;
  NPSManager *npsManager;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *npsQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DNDSWorkoutTriggerManager;
  v2 = -[DNDSWorkoutTriggerManager init](&v14, sel_init);
  if (v2)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.private.biome-workout.queue"));
    v3 = objc_claimAutoreleasedReturnValue();
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    sinks = v2->_sinks;
    v2->_sinks = (NSMutableDictionary *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    v7 = (NPSManager *)objc_alloc_init(MEMORY[0x1E0D51618]);
    npsManager = v2->_npsManager;
    v2->_npsManager = v7;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)DNDWorkoutStateObserverCallback, CFSTR("WorkoutDNDStateChangedNotification"), 0, CFNotificationSuspensionBehaviorDrop);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.donotdisturb.private.nps-workout.queue", v10);
    npsQueue = v2->_npsQueue;
    v2->_npsQueue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("WorkoutDNDStateChangedNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)DNDSWorkoutTriggerManager;
  -[DNDSWorkoutTriggerManager dealloc](&v4, sel_dealloc);
}

- (void)refreshMigratingIfNecessary
{
  NSObject *npsQueue;
  _QWORD block[5];

  npsQueue = self->_npsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__DNDSWorkoutTriggerManager_refreshMigratingIfNecessary__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(npsQueue, block);
}

uint64_t __56__DNDSWorkoutTriggerManager_refreshMigratingIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshMigratingIfNecessary");
}

- (void)_refreshMigratingIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_npsQueue);
  -[DNDSWorkoutTriggerManager _migrateWorkoutDNDNanoPreference](self, "_migrateWorkoutDNDNanoPreference");
  -[DNDSWorkoutTriggerManager _refresh](self, "_refresh");
}

- (void)refresh
{
  NSObject *npsQueue;
  _QWORD block[5];

  npsQueue = self->_npsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__DNDSWorkoutTriggerManager_refresh__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(npsQueue, block);
}

uint64_t __36__DNDSWorkoutTriggerManager_refresh__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refresh");
}

- (void)_refresh
{
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "workoutModeForWorkoutTriggerManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(WeakRetained) = -[DNDSWorkoutTriggerManager _isWorkoutTriggerEnabledForModeConfiguration:](self, "_isWorkoutTriggerEnabledForModeConfiguration:", v4);
  -[DNDSWorkoutTriggerManager _updateNanoPreferencesForRefreshWithModeConfiguration:](self, "_updateNanoPreferencesForRefreshWithModeConfiguration:", v4);
  if ((_DWORD)WeakRetained)
  {
    objc_msgSend(v4, "mode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[DNDSWorkoutTriggerManager _configureWorkoutTriggerWithMode:](self, "_configureWorkoutTriggerWithMode:", v5);
  -[DNDSWorkoutTriggerManager _refreshWithMode:event:](self, "_refreshWithMode:event:", v5, 0);
  v6 = DNDSLogWorkoutTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Refresh workout trigger for system: mode=%{public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)pairedDeviceDidChange
{
  NSObject *npsQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  npsQueue = self->_npsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__DNDSWorkoutTriggerManager_pairedDeviceDidChange__block_invoke;
  v4[3] = &unk_1E86A6B40;
  objc_copyWeak(&v5, &location);
  dispatch_async(npsQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__DNDSWorkoutTriggerManager_pairedDeviceDidChange__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;
    v3 = WeakRetained;

    objc_msgSend(v3, "_refresh");
    WeakRetained = v3;
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
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[DNDSWorkoutTriggerManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = 0;
  objc_msgSend(v8, "triggerManager:assertionsWithClientIdentifer:error:", self, CFSTR("com.apple.donotdisturb.private.workout-trigger"), &v66);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v66;
  if (v6)
  {
    if (v9)
    {
      objc_msgSend(v6, "eventBody");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "eventType");

      -[DNDSWorkoutTriggerManager _assertionIdentifierForHealthKitWorkoutEvent:](self, "_assertionIdentifierForHealthKitWorkoutEvent:", v6);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "details");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v16 = objc_claimAutoreleasedReturnValue();

      if (v13 == 1)
      {
        if (objc_msgSend(v10, "count"))
        {
          v18 = v58;
          v17 = (void *)v16;
          if (objc_msgSend(v58, "isEqualToString:", v16))
          {
            v61[0] = MEMORY[0x1E0C809B0];
            v61[1] = 3221225472;
            v61[2] = __52__DNDSWorkoutTriggerManager__refreshWithMode_event___block_invoke;
            v61[3] = &unk_1E86A5BB0;
            v62 = v9;
            objc_msgSend(v10, "bs_filter:", v61);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "firstObject");
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              objc_msgSend(v38, "UUID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = v11;
              v40 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v39, 2, 0, CFSTR("com.apple.donotdisturb.private.workout-trigger"), &v60);
              v21 = v60;

              v41 = (void *)DNDSLogWorkoutTrigger;
              if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
              {
                v42 = v41;
                objc_msgSend(v38, "details");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "modeIdentifier");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v68 = v44;
                _os_log_impl(&dword_1CB895000, v42, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion workout trigger in response to event; previousModeID=%{public}@",
                  buf,
                  0xCu);

                v17 = (void *)v16;
              }
            }
            else
            {
              v21 = v11;
            }
            v18 = v58;

            v19 = v62;
LABEL_30:

            v11 = v21;
          }
LABEL_31:

          goto LABEL_32;
        }
      }
      else if (!v13)
      {
        v17 = (void *)v16;
        v18 = v58;
        if (objc_msgSend(v10, "count") && (objc_msgSend(v58, "isEqualToString:", v16) & 1) != 0)
          goto LABEL_31;
        v19 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
        objc_msgSend(v19, "setIdentifier:", v58);
        objc_msgSend(v19, "setLifetime:", 0);
        objc_msgSend(v19, "setModeIdentifier:", v9);
        objc_msgSend(v19, "setReason:", 1);
        v63 = v11;
        v20 = (id)objc_msgSend(v8, "triggerManager:takeModeAssertionWithDetails:clientIdentifier:error:", self, v19, CFSTR("com.apple.donotdisturb.private.workout-trigger"), &v63);
        v21 = v63;

        v22 = DNDSLogWorkoutTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v68 = v9;
          _os_log_impl(&dword_1CB895000, v22, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for workout trigger in response to event; modeID=%{public}@",
            buf,
            0xCu);
        }
        goto LABEL_30;
      }
      v17 = (void *)v16;
      v18 = v58;
      goto LABEL_31;
    }
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "UUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v11;
      v31 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v30, 3, 0, CFSTR("com.apple.donotdisturb.private.workout-trigger"), &v59);
      v28 = v59;

      v32 = (void *)DNDSLogWorkoutTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        objc_msgSend(v10, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "details");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "modeIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v36;
        _os_log_impl(&dword_1CB895000, v33, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for workout trigger in response to event; previousModeID=%{public}@",
          buf,
          0xCu);

      }
      goto LABEL_33;
    }
LABEL_32:
    v28 = v11;
    goto LABEL_33;
  }
  if (!objc_msgSend(v10, "count"))
    goto LABEL_32;
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
      v28 = v11;
    }
    else
    {
      objc_msgSend(v24, "details");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)objc_msgSend(v51, "mutableCopy");

      objc_msgSend(v52, "setModeIdentifier:", v9);
      v64 = v11;
      v53 = (id)objc_msgSend(v8, "triggerManager:takeModeAssertionWithDetails:clientIdentifier:error:", self, v52, CFSTR("com.apple.donotdisturb.private.workout-trigger"), &v64);
      v28 = v64;

      v54 = (void *)DNDSLogWorkoutTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v55 = v54;
        objc_msgSend(v24, "details");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "modeIdentifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v9;
        v69 = 2114;
        v70 = v57;
        _os_log_impl(&dword_1CB895000, v55, OS_LOG_TYPE_DEFAULT, "Updating active assertion to new mode identifer for workout trigger; modeID=%{public}@ previousModeID=%{public}@",
          buf,
          0x16u);

      }
    }
  }
  else
  {
    objc_msgSend(v23, "UUID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v11;
    v46 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v45, 2, 0, CFSTR("com.apple.donotdisturb.private.workout-trigger"), &v65);
    v28 = v65;

    v47 = (void *)DNDSLogWorkoutTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      objc_msgSend(v24, "details");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "modeIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v50;
      _os_log_impl(&dword_1CB895000, v48, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for workout trigger; previousModeID=%{public}@",
        buf,
        0xCu);

    }
  }

LABEL_33:
}

uint64_t __52__DNDSWorkoutTriggerManager__refreshWithMode_event___block_invoke(uint64_t a1, void *a2)
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

- (id)_assertionIdentifierForHealthKitWorkoutEvent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.donotdisturb.trigger.workout"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_configureWorkoutTriggerWithMode:(id)a3
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
  DNDSWorkoutTriggerManager *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
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
    v7 = DNDSLogWorkoutTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v4;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Adding biome workout event monitor; mode=%{public}@",
        buf,
        0xCu);
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.donotdisturb.workoutTrigger"), self->_biomeQueue);
    objc_msgSend(MEMORY[0x1E0D027B8], "healthKitWorkoutStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "publisher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subscribeOn:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __62__DNDSWorkoutTriggerManager__configureWorkoutTriggerWithMode___block_invoke_29;
    v15 = &unk_1E86A6B88;
    v16 = self;
    v17 = v4;
    objc_msgSend(v11, "sinkWithCompletion:receiveInput:", &__block_literal_global_13, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sinks, "setObject:forKeyedSubscript:", v6, CFSTR("system"), v12, v13, v14, v15, v16);
  }
  os_unfair_lock_unlock(&self->_lock);

}

void __62__DNDSWorkoutTriggerManager__configureWorkoutTriggerWithMode___block_invoke(uint64_t a1, void *a2)
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
  v3 = (void *)DNDSLogWorkoutTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
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
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Workout subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);

  }
}

void __62__DNDSWorkoutTriggerManager__configureWorkoutTriggerWithMode___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  __CFString *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)DNDSLogWorkoutTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "eventType");
    if (v7 > 3)
      v8 = CFSTR("unspecified");
    else
      v8 = off_1E86A6BA8[v7];
    v12 = 138543362;
    v13 = v8;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Received workout event: eventType=%{public}@", (uint8_t *)&v12, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_refreshWithMode:event:", *(_QWORD *)(a1 + 40), v3);
  v9 = (void *)DNDSLogWorkoutTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v3, "eventBody");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Updated assertions for workout event: event=%{public}@", (uint8_t *)&v12, 0xCu);

  }
}

- (BOOL)_isWorkoutTriggerEnabledForModeConfiguration:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "triggers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  v8 = objc_msgSend(v4, "isEnabled");
  return v8;
}

- (void)_migrateWorkoutDNDNanoPreference
{
  void *v3;
  id WeakRetained;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[DNDSWorkoutTriggerManager _accessor](self, "_accessor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "workoutModeForWorkoutTriggerManager:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[DNDSWorkoutTriggerManager _isWorkoutDNDNanoPreferenceEnabled](self, "_isWorkoutDNDNanoPreferenceEnabled");
    if (!v5 && v6)
    {
      v7 = DNDSLogWorkoutTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Create mode for workout trigger to match existing nano preferences setting.", (uint8_t *)&v11, 2u);
      }
      objc_msgSend(WeakRetained, "createWorkoutModeForWorkoutTriggerManager:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)DNDSLogWorkoutTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        objc_msgSend(v5, "mode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Created mode for workout trigger: mode=%{public}@", (uint8_t *)&v11, 0xCu);

      }
    }

  }
}

- (void)_refreshForNanoPreferenceChange
{
  NSObject *npsQueue;
  _QWORD block[5];

  npsQueue = self->_npsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__DNDSWorkoutTriggerManager__refreshForNanoPreferenceChange__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(npsQueue, block);
}

uint64_t __60__DNDSWorkoutTriggerManager__refreshForNanoPreferenceChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_npsQueue_refreshForNanoPreferenceChange");
}

- (void)_npsQueue_refreshForNanoPreferenceChange
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  int v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  int v18;
  int v19;
  char v20;
  void *v21;
  const __CFString *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  NSObject *v27;
  const char *v28;
  id WeakRetained;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[DNDSWorkoutTriggerManager _accessor](self, "_accessor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "workoutModeForWorkoutTriggerManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[DNDSWorkoutTriggerManager _isWorkoutDNDNanoPreferenceEnabled](self, "_isWorkoutDNDNanoPreferenceEnabled");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v4, "triggers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v12;

            v9 = v13;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v14 = objc_msgSend(v9, "isEnabled");
    if (v4)
      v15 = 0;
    else
      v15 = v5;
    if (v15)
    {
      v16 = DNDSLogWorkoutTrigger;
      v17 = WeakRetained;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "Create mode for workout trigger in response to nano preference update.", buf, 2u);
      }
      objc_msgSend(WeakRetained, "createWorkoutModeForWorkoutTriggerManager:", self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 1;
    }
    else
    {
      v19 = !v5;
      if (!v4)
        v19 = 1;
      v17 = WeakRetained;
      if ((v19 | v14) != 1 || ((v18 = 0, !v4) ? (v20 = 1) : (v20 = v5), (v20 & 1) == 0 && ((v14 ^ 1) & 1) == 0))
      {
        v21 = (void *)DNDSLogWorkoutTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
        {
          if (v5)
            v22 = CFSTR("Y");
          else
            v22 = CFSTR("N");
          v23 = v21;
          objc_msgSend(v4, "mode");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v22;
          v36 = 2114;
          v37 = v24;
          _os_log_impl(&dword_1CB895000, v23, OS_LOG_TYPE_DEFAULT, "Update workout trigger for mode in response to nano preference update: enabled=%{public}@ mode=%{public}@", buf, 0x16u);

        }
        objc_msgSend(WeakRetained, "setWorkoutTriggerEnabled:forWorkoutTriggerManager:", v5, self);
        objc_msgSend(WeakRetained, "workoutModeForWorkoutTriggerManager:", self);
        v25 = objc_claimAutoreleasedReturnValue();

        v18 = 1;
        v4 = (void *)v25;
      }
    }
    if (v5)
    {
      objc_msgSend(v4, "mode");
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_36;
    }
    else
    {
      v26 = 0;
      if (!v18)
      {
LABEL_36:
        v27 = DNDSLogWorkoutTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v26;
          v28 = "Workout trigger already matches nano preferences update: mode=%{public}@";
LABEL_41:
          _os_log_impl(&dword_1CB895000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
          goto LABEL_42;
        }
        goto LABEL_42;
      }
    }
    -[DNDSWorkoutTriggerManager _configureWorkoutTriggerWithMode:](self, "_configureWorkoutTriggerWithMode:", v26);
    -[DNDSWorkoutTriggerManager _refreshWithMode:event:](self, "_refreshWithMode:event:", v26, 0);
    v27 = DNDSLogWorkoutTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v26;
      v28 = "Refreshed workout trigger for nano preferences update: mode=%{public}@";
      goto LABEL_41;
    }
LABEL_42:

  }
}

- (void)_updateNanoPreferencesForRefreshWithModeConfiguration:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  int v13;
  char v14;
  NSObject *v15;
  _BOOL4 v16;
  uint8_t v17[16];
  uint8_t buf[2];
  __int16 v19;

  v4 = a3;
  -[DNDSWorkoutTriggerManager _accessor](self, "_accessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[DNDSWorkoutTriggerManager _isWorkoutDNDNanoPreferenceEnabled](self, "_isWorkoutDNDNanoPreferenceEnabled");
    v7 = -[DNDSWorkoutTriggerManager _isWorkoutTriggerEnabledForModeConfiguration:](self, "_isWorkoutTriggerEnabledForModeConfiguration:", v4);
    if (!v4 && v6)
    {
      v8 = DNDSLogWorkoutTrigger;
      v9 = os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT);
      v10 = 0;
      if (v9)
      {
        v19 = 0;
        v11 = "Disable workout DND preference for workout trigger mode deletion.";
        v12 = (uint8_t *)&v19;
LABEL_19:
        _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
        v10 = 0;
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    v13 = !v6;
    if (!v4)
      v13 = 1;
    if (((v13 | v7) & 1) == 0)
    {
      v8 = DNDSLogWorkoutTrigger;
      v16 = os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT);
      v10 = 0;
      if (v16)
      {
        *(_WORD *)buf = 0;
        v11 = "Disable workout DND preference to match disabled workout trigger.";
        v12 = buf;
        goto LABEL_19;
      }
LABEL_20:
      -[DNDSWorkoutTriggerManager _setWorkoutDNDNanoPreferenceEnabled:](self, "_setWorkoutDNDNanoPreferenceEnabled:", v10);
      goto LABEL_21;
    }
    if (v4)
      v14 = v6;
    else
      v14 = 1;
    if ((v14 & 1) == 0 && v7)
    {
      v15 = DNDSLogWorkoutTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Enable workout DND preference to match enabled workout trigger.", v17, 2u);
      }
      v10 = 1;
      goto LABEL_20;
    }
  }
LABEL_21:

}

- (id)_accessor
{
  NPSDomainAccessor *accessor;
  void *v4;
  NPSDomainAccessor *v5;
  NPSDomainAccessor *v6;

  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  accessor = self->_accessor;
  if (!accessor)
  {
    objc_msgSend(MEMORY[0x1E0D1D5C8], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "deviceClass") == 1 || objc_msgSend(v4, "deviceClass") == 5)
    {
      v5 = (NPSDomainAccessor *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.nano"));
      v6 = self->_accessor;
      self->_accessor = v5;

    }
    accessor = self->_accessor;
  }
  return accessor;
}

- (BOOL)_isWorkoutDNDNanoPreferenceEnabled
{
  void *v2;
  id v3;
  char v4;
  BOOL v5;
  char v7;

  -[DNDSWorkoutTriggerManager _accessor](self, "_accessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "synchronize");
  v7 = 0;
  v4 = objc_msgSend(v2, "BOOLForKey:keyExistsAndHasValidFormat:", CFSTR("workoutDND"), &v7);
  if (v7)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)_setWorkoutDNDNanoPreferenceEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  NPSManager *npsManager;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v10;

  v3 = a3;
  -[DNDSWorkoutTriggerManager _accessor](self, "_accessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DNDSWorkoutTriggerManager _accessor](self, "_accessor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBool:forKey:", v3, CFSTR("workoutDND"));
    v6 = (id)objc_msgSend(v10, "synchronize");
    npsManager = self->_npsManager;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("workoutDND"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPSManager synchronizeNanoDomain:keys:](npsManager, "synchronizeNanoDomain:keys:", CFSTR("com.apple.nano"), v8);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("WorkoutDNDStateChangedNotification"), 0, 0, 0);

  }
}

- (DNDSWorkoutTriggerManagerDataSource)dataSource
{
  return (DNDSWorkoutTriggerManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_npsQueue, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_accessor, 0);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
}

@end
