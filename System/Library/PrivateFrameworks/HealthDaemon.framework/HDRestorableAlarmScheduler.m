@implementation HDRestorableAlarmScheduler

- (HDRestorableAlarmScheduler)initWithProfile:(id)a3
{
  id v4;
  HDRestorableAlarmScheduler *v5;
  HDRestorableAlarmScheduler *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSMapTable *clients;
  id v11;
  id WeakRetained;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HDXPCAlarm *systemScheduler;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDRestorableAlarmScheduler;
  v5 = -[HDRestorableAlarmScheduler init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    clients = v6->_clients;
    v6->_clients = (NSMapTable *)v9;

    v11 = objc_alloc(MEMORY[0x1E0D298D8]);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "profileIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(v14, "daemon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "alarmScheduler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v11, "initWithProfileIdentifier:scheduler:eventName:eventHandlerQueue:", v13, v16, CFSTR("HDRestorableAlarmScheduler"), v6->_queue);
    systemScheduler = v6->_systemScheduler;
    v6->_systemScheduler = (HDXPCAlarm *)v17;

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v6);

    objc_msgSend(v4, "registerProfileReadyObserver:queue:", v6, v6->_queue);
  }

  return v6;
}

- (void)dealloc
{
  int significantTimeChangeNotificationToken;
  objc_super v4;

  if (self)
  {
    significantTimeChangeNotificationToken = self->_significantTimeChangeNotificationToken;
    if (significantTimeChangeNotificationToken != -1)
      notify_cancel(significantTimeChangeNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)HDRestorableAlarmScheduler;
  -[HDRestorableAlarmScheduler dealloc](&v4, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v4;
  void *v5;
  const char *v6;
  NSObject *queue;
  id WeakRetained;
  void *v9;
  OS_dispatch_queue *v10;
  _QWORD v11[5];
  uint64_t handler;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = MEMORY[0x1E0C809B0];
  if (!self->_hasInitializedSystemScheduler)
  {
    self->_hasInitializedSystemScheduler = 1;
    objc_initWeak(&location, self);
    -[HDRestorableAlarmScheduler systemScheduler](self, "systemScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    handler = v4;
    v13 = 3221225472;
    v14 = __74__HDRestorableAlarmScheduler__queue_beginReceivingSystemEventsIfNecessary__block_invoke;
    v15 = &unk_1E6D01638;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v5, "beginReceivingEventsWithHandler:", &handler);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  self->_significantTimeChangeNotificationToken = -1;
  v6 = (const char *)objc_msgSend(CFSTR("SignificantTimeChangeNotification"), "UTF8String");
  queue = self->_queue;
  handler = v4;
  v13 = 3221225472;
  v14 = __78__HDRestorableAlarmScheduler__startObservingSignificantTimeChangeNotification__block_invoke;
  v15 = &unk_1E6CE8390;
  objc_copyWeak(&v16, &location);
  notify_register_dispatch(v6, &self->_significantTimeChangeNotificationToken, queue, &handler);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_queue;
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __52__HDRestorableAlarmScheduler_profileDidBecomeReady___block_invoke;
  v11[3] = &unk_1E6CE80E8;
  v11[4] = self;
  objc_msgSend(v9, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", v10, v11);

}

void __52__HDRestorableAlarmScheduler_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  -[HDRestorableAlarmScheduler _queue_setNeedsMaintenanceNotifyAndSchedule:](*(_QWORD *)(a1 + 32), 1);
  -[HDRestorableAlarmScheduler _queue_enqueueMaintenanceNotifyAndScheduleWithReason:](*(_QWORD *)(a1 + 32), CFSTR("Daemon ready and data first available"));
}

- (void)_queue_setNeedsMaintenanceNotifyAndSchedule:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    *(_BYTE *)(a1 + 42) = a2;
    -[HDRestorableAlarmScheduler _queue_updateProtectedDataObserverStateIfRequired](a1);
  }
}

- (void)_queue_enqueueMaintenanceNotifyAndScheduleWithReason:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(_BYTE *)(a1 + 41))
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v22 = a1;
        v23 = 2114;
        v24 = v3;
        _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping maintenance operation with reason \"%{public}@\" as we're already waiting on one", buf, 0x16u);
      }

    }
    else
    {
      *(_BYTE *)(a1 + 41) = 1;
      objc_initWeak(&location, (id)a1);
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 16);
      v8 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __83__HDRestorableAlarmScheduler__queue_enqueueMaintenanceNotifyAndScheduleWithReason___block_invoke;
      v17[3] = &unk_1E6CED650;
      objc_copyWeak(&v19, &location);
      v9 = v3;
      v18 = v9;
      +[HDMaintenanceOperation maintenanceOperationWithName:queue:synchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:queue:synchronousBlock:", v6, v7, v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "database");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = __83__HDRestorableAlarmScheduler__queue_enqueueMaintenanceNotifyAndScheduleWithReason___block_invoke_2;
      v15[3] = &unk_1E6CE8080;
      v15[4] = a1;
      v13 = v10;
      v16 = v13;
      objc_msgSend(v12, "performWhenDataProtectedByFirstUnlockIsAvailable:", v15);

      _HKInitializeLogging();
      HKLogInfrastructure();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v22 = a1;
        v23 = 2114;
        v24 = v9;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueued maintenance operation with reason \"%{public}@\", buf, 0x16u);
      }

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }

}

void __78__HDRestorableAlarmScheduler__startObservingSignificantTimeChangeNotification__block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  NSObject *v2;
  dispatch_queue_t *v3;
  uint8_t buf[4];
  dispatch_queue_t *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    dispatch_assert_queue_V2(WeakRetained[2]);
    _HKInitializeLogging();
    HKLogInfrastructure();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v5 = v3;
      _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ received significant time change notification", buf, 0xCu);
    }

    dispatch_assert_queue_V2(v3[2]);
    *((_BYTE *)v3 + 42) = 1;
    -[HDRestorableAlarmScheduler _queue_updateProtectedDataObserverStateIfRequired]((uint64_t)v3);
    -[HDRestorableAlarmScheduler _queue_enqueueMaintenanceNotifyAndScheduleWithReason:]((uint64_t)v3, CFSTR("Significant time change"));
    WeakRetained = v3;
  }

}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
    -[HDRestorableAlarmScheduler _queue_enqueueMaintenanceNotifyAndScheduleWithReason:]((uint64_t)self, CFSTR("Protected data became available"));
}

- (void)_queue_updateProtectedDataObserverStateIfRequired
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  if (*(_BYTE *)(a1 + 42) || *(_BYTE *)(a1 + 43))
  {
    if (!*(_BYTE *)(a1 + 46))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "database");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addProtectedDataObserver:queue:", a1, *(_QWORD *)(a1 + 16));

      *(_BYTE *)(a1 + 46) = 1;
    }
  }
  else if (*(_BYTE *)(a1 + 46))
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(v4, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeProtectedDataObserver:", a1);

    *(_BYTE *)(a1 + 46) = 0;
  }
}

void __83__HDRestorableAlarmScheduler__queue_enqueueMaintenanceNotifyAndScheduleWithReason___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t *WeakRetained;
  uint8_t buf[4];
  dispatch_queue_t *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[2]);
    if (*((_BYTE *)WeakRetained + 42) || *((_BYTE *)WeakRetained + 43) || *((_BYTE *)WeakRetained + 45))
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v7 = WeakRetained;
        v8 = 2112;
        v9 = v2;
        _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing due events with maintenance operation reason \"%@\", buf, 0x16u);
      }

      -[HDRestorableAlarmScheduler _queue_processDueEventsWithCompletion:]((uint64_t)WeakRetained, 0);
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v7 = WeakRetained;
        v8 = 2112;
        v9 = v2;
        _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping maintenance operation with reason \"%@\" since no longer needed", buf, 0x16u);
      }

    }
    *((_BYTE *)WeakRetained + 41) = 0;
  }

}

void __83__HDRestorableAlarmScheduler__queue_enqueueMaintenanceNotifyAndScheduleWithReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maintenanceWorkCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueMaintenanceOperation:", *(_QWORD *)(a1 + 40));

}

- (void)_queue_processDueEventsWithCompletion:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v7 = __68__HDRestorableAlarmScheduler__queue_processDueEventsWithCompletion___block_invoke;
    v8 = &unk_1E6CF7C80;
    v9 = a1;
    v10 = v3;
    v4 = *(NSObject **)(a1 + 16);
    v5 = v6;
    dispatch_assert_queue_V2(v4);
    ((void (*)(_QWORD *, _QWORD))v7)(v5, *(unsigned __int8 *)(a1 + 44));

  }
}

void __74__HDRestorableAlarmScheduler__queue_beginReceivingSystemEventsIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138543362;
      v4 = WeakRetained;
      _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Received system alert to check for due alarms", (uint8_t *)&v3, 0xCu);
    }

    -[HDRestorableAlarmScheduler _queue_processDueEventsWithCompletion:]((uint64_t)WeakRetained, 0);
  }

}

void __68__HDRestorableAlarmScheduler__queue_processDueEventsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _BOOL8 v12;
  id v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _BYTE v37[24];
  void *v38;
  uint64_t v39;
  __int128 buf;
  uint64_t (*v41)(_QWORD *, void *);
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
    _HKInitializeLogging();
    HKLogInfrastructure();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v2;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Enumerating due events", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend((id)v2, "_unitTest_currentDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v7 = v6;

    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__149;
    v35 = __Block_byref_object_dispose__149;
    v36 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v22 = 0;
    v9 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v41 = __94__HDRestorableAlarmScheduler__queue_notifyClientsOfDueEventsAndScheduleNextFireDateWithError___block_invoke;
    v42 = &unk_1E6D01660;
    v10 = v7;
    v43 = v10;
    v44 = v2;
    v46 = &v23;
    v47 = &v27;
    v11 = v8;
    v45 = v11;
    v48 = &v31;
    v12 = -[HDRestorableAlarmScheduler _enumerateAllAlarmEventsWithError:enumerationHandler:](v2, (uint64_t)&v22, &buf);
    v13 = v22;
    if (v12)
    {
      v14 = *((_BYTE *)v24 + 24);
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
      *(_BYTE *)(v2 + 43) = v14;
      -[HDRestorableAlarmScheduler _queue_updateProtectedDataObserverStateIfRequired](v2);
      if (*((_BYTE *)v28 + 24))
      {
        if (!*(_BYTE *)(v2 + 45))
        {
          *(_BYTE *)(v2 + 45) = 1;
          _HKInitializeLogging();
          HKLogInfrastructure();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v37 = 138543362;
            *(_QWORD *)&v37[4] = v2;
            _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Registered for on-wrist updates", v37, 0xCu);
          }

        }
      }
      else
      {
        *(_BYTE *)(v2 + 45) = 0;
      }
      *(_QWORD *)v37 = v9;
      *(_QWORD *)&v37[8] = 3221225472;
      *(_QWORD *)&v37[16] = __94__HDRestorableAlarmScheduler__queue_notifyClientsOfDueEventsAndScheduleNextFireDateWithError___block_invoke_206;
      v38 = &unk_1E6D01688;
      v39 = v2;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v37);
      if (v32[5])
      {
        objc_msgSend((id)v2, "systemScheduler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setNextFireDate:isUserVisible:", v32[5], 0);
      }
      else
      {
        objc_msgSend((id)v2, "systemScheduler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "unschedule");
      }

      v2 = 0;
    }
    else
    {
      if ((HKIsUnitTesting() & 1) == 0)
      {
        _HKInitializeLogging();
        HKLogInfrastructure();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v37 = 138543618;
          *(_QWORD *)&v37[4] = v2;
          *(_WORD *)&v37[12] = 2114;
          *(_QWORD *)&v37[14] = v13;
          _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to enumerate due events: %{public}@", v37, 0x16u);
        }

      }
      v17 = v13;
      v2 = (uint64_t)v17;
      if (v17)
        v18 = objc_retainAutorelease(v17);

    }
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    v12 = 0;
  }
  v20 = (id)v2;
  -[HDRestorableAlarmScheduler _queue_setNeedsMaintenanceNotifyAndSchedule:](*(_QWORD *)(a1 + 32), !v12);
  v21 = *(_QWORD *)(a1 + 40);
  if (v21)
    (*(void (**)(uint64_t, _BOOL8, id))(v21 + 16))(v21, v12, v20);

}

uint64_t __94__HDRestorableAlarmScheduler__queue_notifyClientsOfDueEventsAndScheduleNextFireDateWithError___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  char v7;
  int v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  v3 = a2;
  objc_msgSend(v3, "currentDueDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hk_isBeforeOrEqualToDate:", a1[4]))
  {
    if (objc_msgSend(v3, "requiresDeviceUnlocked"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
      objc_msgSend(WeakRetained, "database");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isProtectedDataAvailable");

      v8 = 1;
      if ((v7 & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
        v8 = 0;
      }
    }
    else
    {
      v8 = 1;
    }
    if (objc_msgSend(v3, "requiresDeviceOnWrist") && !*(_BYTE *)(a1[5] + 44))
    {
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
    }
    else if (v8)
    {
      v16 = (void *)a1[6];
      objc_msgSend(v3, "clientIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v19 = (void *)a1[6];
        objc_msgSend(v3, "clientIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

      }
      objc_msgSend(v18, "addObject:", v3);

    }
  }
  else
  {
    v9 = *(_QWORD *)(a1[9] + 8);
    v12 = *(void **)(v9 + 40);
    v10 = (id *)(v9 + 40);
    v11 = v12;
    if (v12)
    {
      objc_msgSend(v11, "earlierDate:", v4);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1[9] + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
    else
    {
      objc_storeStrong(v10, v4);
    }
  }

  return 1;
}

- (BOOL)_enumerateAllAlarmEventsWithError:(void *)a3 enumerationHandler:
{
  id v5;
  id WeakRetained;
  void *v7;
  _BOOL8 v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__HDRestorableAlarmScheduler__enumerateAllAlarmEventsWithError_enumerationHandler___block_invoke;
    v10[3] = &unk_1E6CF1650;
    v11 = v5;
    v8 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDAlarmEventEntity, "performReadTransactionWithHealthDatabase:error:block:", v7, a2, v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __94__HDRestorableAlarmScheduler__queue_notifyClientsOfDueEventsAndScheduleNextFireDateWithError___block_invoke_206(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "eventsDidFire:", v6);
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543874;
      v12 = v10;
      v13 = 2114;
      v14 = v5;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ No client found with identifier %{public}@. Skipping notifying for due events: %{public}@", (uint8_t *)&v11, 0x20u);
    }

  }
}

- (void)addAlarm:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HDRestorableAlarmScheduler_addAlarm___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __39__HDRestorableAlarmScheduler_addAlarm___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "clientIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v16;
      v20 = 2114;
      v21 = v17;
      v22 = 2114;
      v23 = v4;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Client identifier conflict detected for \"%{public}@\". Replacing client %{public}@", buf, 0x20u);

    }
  }
  _HKInitializeLogging();
  HKLogInfrastructure();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering alarm: %{public}@", buf, 0x16u);
  }

  v9 = *(void **)(a1 + 40);
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(v9, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Alarm %@ added"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDRestorableAlarmScheduler _queue_enqueueMaintenanceNotifyAndScheduleWithReason:](v13, v15);

}

- (void)removeAlarm:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HDRestorableAlarmScheduler_removeAlarm___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __42__HDRestorableAlarmScheduler_removeAlarm___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

- (BOOL)scheduleEvents:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  HDRestorableAlarmScheduler *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduling events %{public}@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__HDRestorableAlarmScheduler_scheduleEvents_error___block_invoke;
  v11[3] = &unk_1E6CEBC00;
  v12 = v6;
  v8 = v6;
  v9 = -[HDRestorableAlarmScheduler _performWriteTransactionAndFireEventsWithError:block:]((uint64_t)self, (uint64_t)a4, v11);

  return v9;
}

BOOL __51__HDRestorableAlarmScheduler_scheduleEvents_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAlarmEventEntity insertOrReplaceAlarmEvents:transaction:error:](HDAlarmEventEntity, "insertOrReplaceAlarmEvents:transaction:error:", *(_QWORD *)(a1 + 32), a2, a3);
}

- (BOOL)_performWriteTransactionAndFireEventsWithError:(void *)a3 block:
{
  id v5;
  id WeakRetained;
  void *v7;
  _BOOL8 v8;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__HDRestorableAlarmScheduler__performWriteTransactionAndFireEventsWithError_block___block_invoke;
    v10[3] = &unk_1E6CEE458;
    v10[4] = a1;
    v11 = v5;
    v8 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDAlarmEventEntity, "performWriteTransactionWithHealthDatabase:error:block:", v7, a2, v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)removeEvents:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  HDRestorableAlarmScheduler *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing events %{public}@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__HDRestorableAlarmScheduler_removeEvents_error___block_invoke;
  v11[3] = &unk_1E6CEBC00;
  v12 = v6;
  v8 = v6;
  v9 = -[HDRestorableAlarmScheduler _performWriteTransactionAndFireEventsWithError:block:]((uint64_t)self, (uint64_t)a4, v11);

  return v9;
}

BOOL __49__HDRestorableAlarmScheduler_removeEvents_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAlarmEventEntity deleteAlarmEvents:transaction:error:](HDAlarmEventEntity, "deleteAlarmEvents:transaction:error:", *(_QWORD *)(a1 + 32), a2, a3);
}

- (BOOL)removeAllEventsWithClientIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  HDRestorableAlarmScheduler *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing all events with client identifier: %{public}@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__HDRestorableAlarmScheduler_removeAllEventsWithClientIdentifier_error___block_invoke;
  v11[3] = &unk_1E6CEBC00;
  v12 = v6;
  v8 = v6;
  v9 = -[HDRestorableAlarmScheduler _performWriteTransactionAndFireEventsWithError:block:]((uint64_t)self, (uint64_t)a4, v11);

  return v9;
}

BOOL __72__HDRestorableAlarmScheduler_removeAllEventsWithClientIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAlarmEventEntity deleteAllAlarmEventsWithClientIdentifier:transaction:error:](HDAlarmEventEntity, "deleteAllAlarmEventsWithClientIdentifier:transaction:error:", *(_QWORD *)(a1 + 32), a2, a3);
}

- (id)replaceAllScheduledEventsWithClientIdentifier:(id)a3 newEvents:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  HDAlarmEventChanges *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  HDRestorableAlarmScheduler *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v22 = self;
    v23 = 2114;
    v24 = v8;
    v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Replace all scheduled events with client identifier %{public}@ with events %{public}@", buf, 0x20u);
  }

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__HDRestorableAlarmScheduler_replaceAllScheduledEventsWithClientIdentifier_newEvents_error___block_invoke;
  v17[3] = &unk_1E6CEB3F8;
  v12 = v8;
  v18 = v12;
  v13 = v11;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  if (-[HDRestorableAlarmScheduler _performWriteTransactionAndFireEventsWithError:block:]((uint64_t)self, (uint64_t)a5, v17))
  {
    v15 = -[HDAlarmEventChanges initWithOldEvents:scheduledEvents:]([HDAlarmEventChanges alloc], "initWithOldEvents:scheduledEvents:", v13, v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

BOOL __92__HDRestorableAlarmScheduler_replaceAllScheduledEventsWithClientIdentifier_newEvents_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__HDRestorableAlarmScheduler_replaceAllScheduledEventsWithClientIdentifier_newEvents_error___block_invoke_2;
  v9[3] = &unk_1E6D016B0;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  if (+[HDAlarmEventEntity deleteAllAlarmEventsWithClientIdentifier:transaction:enumerationHandler:error:](HDAlarmEventEntity, "deleteAllAlarmEventsWithClientIdentifier:transaction:enumerationHandler:error:", v6, v5, v9, a3))
  {
    v7 = +[HDAlarmEventEntity insertOrReplaceAlarmEvents:transaction:error:](HDAlarmEventEntity, "insertOrReplaceAlarmEvents:transaction:error:", *(_QWORD *)(a1 + 48), v5, a3);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __92__HDRestorableAlarmScheduler_replaceAllScheduledEventsWithClientIdentifier_newEvents_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (id)scheduledEventsForClientIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__149;
  v20 = __Block_byref_object_dispose__149;
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__HDRestorableAlarmScheduler_scheduledEventsForClientIdentifier_error___block_invoke;
  v13[3] = &unk_1E6CE8D70;
  v9 = v6;
  v14 = v9;
  v15 = &v16;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDAlarmEventEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, a4, v13);

  if ((_DWORD)a4)
    v10 = (void *)v17[5];
  else
    v10 = 0;
  v11 = v10;

  _Block_object_dispose(&v16, 8);
  return v11;
}

BOOL __71__HDRestorableAlarmScheduler_scheduledEventsForClientIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__HDRestorableAlarmScheduler_scheduledEventsForClientIdentifier_error___block_invoke_2;
  v6[3] = &unk_1E6D016D8;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return +[HDAlarmEventEntity enumerateAllAlarmEventsWithClientIdentifier:transaction:error:enumerationHandler:](HDAlarmEventEntity, "enumerateAllAlarmEventsWithClientIdentifier:transaction:error:enumerationHandler:", v4, a2, a3, v6);
}

uint64_t __71__HDRestorableAlarmScheduler_scheduledEventsForClientIdentifier_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  return 1;
}

uint64_t __83__HDRestorableAlarmScheduler__performWriteTransactionAndFireEventsWithError_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__HDRestorableAlarmScheduler__performWriteTransactionAndFireEventsWithError_block___block_invoke_2;
  v6[3] = &unk_1E6CE80E8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "onCommit:orRollback:", v6, 0);
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v4;
}

void __83__HDRestorableAlarmScheduler__performWriteTransactionAndFireEventsWithError_block___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__HDRestorableAlarmScheduler__performWriteTransactionAndFireEventsWithError_block___block_invoke_3;
  block[3] = &unk_1E6CE80E8;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void __83__HDRestorableAlarmScheduler__performWriteTransactionAndFireEventsWithError_block___block_invoke_3(uint64_t a1)
{
  -[HDRestorableAlarmScheduler _queue_processDueEventsWithCompletion:](*(_QWORD *)(a1 + 32), 0);
}

- (void)checkForDueEventsImmediatelyWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__HDRestorableAlarmScheduler_checkForDueEventsImmediatelyWithCompletion___block_invoke;
  block[3] = &unk_1E6CE9C08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __73__HDRestorableAlarmScheduler_checkForDueEventsImmediatelyWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__HDRestorableAlarmScheduler_checkForDueEventsImmediatelyWithCompletion___block_invoke_2;
  v4[3] = &unk_1E6CECC08;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  -[HDRestorableAlarmScheduler _queue_processDueEventsWithCompletion:](v2, v4);

}

uint64_t __73__HDRestorableAlarmScheduler_checkForDueEventsImmediatelyWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

BOOL __83__HDRestorableAlarmScheduler__enumerateAllAlarmEventsWithError_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAlarmEventEntity enumerateAllAlarmEventsWithTransaction:error:enumerationHandler:](HDAlarmEventEntity, "enumerateAllAlarmEventsWithTransaction:error:enumerationHandler:", a2, a3, *(_QWORD *)(a1 + 32));
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
}

- (id)diagnosticDescription
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  NSObject *queue;
  id v11;
  void *v12;
  _QWORD block[4];
  id v15;
  HDRestorableAlarmScheduler *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDRestorableAlarmScheduler description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(v3, "addObject:", CFSTR("\tAlarm Events"));
  v19 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__HDRestorableAlarmScheduler_diagnosticDescription__block_invoke;
  v17[3] = &unk_1E6D016B0;
  v6 = v3;
  v18 = v6;
  v7 = -[HDRestorableAlarmScheduler _enumerateAllAlarmEventsWithError:enumerationHandler:]((uint64_t)self, (uint64_t)&v19, v17);
  v8 = v19;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\t%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  queue = self->_queue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __51__HDRestorableAlarmScheduler_diagnosticDescription__block_invoke_2;
  block[3] = &unk_1E6CE8080;
  v15 = v6;
  v16 = self;
  v11 = v6;
  dispatch_sync(queue, block);
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __51__HDRestorableAlarmScheduler_diagnosticDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\t%@"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

void __51__HDRestorableAlarmScheduler_diagnosticDescription__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("\tClients"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 32);
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "diagnosticDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("\t\t%@"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (HDXPCAlarm)systemScheduler
{
  return self->_systemScheduler;
}

- (NSDate)_unitTest_currentDate
{
  return self->__unitTest_currentDate;
}

- (void)set_unitTest_currentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isRegisteredForOnWristUpdates
{
  return self->_isRegisteredForOnWristUpdates;
}

- (BOOL)isRegisteredForLockStateUpdates
{
  return self->_isRegisteredForLockStateUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__unitTest_currentDate, 0);
  objc_storeStrong((id *)&self->_systemScheduler, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
