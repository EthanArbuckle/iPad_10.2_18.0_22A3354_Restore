@implementation _EKNotificationMonitor

- (unint64_t)notificationCount
{
  NSObject *v3;
  unint64_t v4;
  void *v6;
  unint64_t v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (-[_EKNotificationMonitor isMonitoringOnlyNotificationCount](self, "isMonitoringOnlyNotificationCount"))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    -[_EKNotificationMonitor notificationQueue](self, "notificationQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43___EKNotificationMonitor_notificationCount__block_invoke;
    v8[3] = &unk_1E4785190;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v3, v8);

    v4 = v10[3];
    _Block_object_dispose(&v9, 8);
    return v4;
  }
  else
  {
    -[_EKNotificationMonitor notificationReferences](self, "notificationReferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    return v7;
  }
}

- (void)handleDarwinNotification:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D0BEF8]))
  {
    -[_EKNotificationMonitor _syncDidStart](self, "_syncDidStart");
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D0BF00]))
  {
    -[_EKNotificationMonitor _syncDidEnd:](self, "_syncDidEnd:", 0);
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("EKNotificationCountChangedExternallyNotification")) & 1) != 0
         || self->_excludeUncheckedCalendars
         && (+[EKCalendarVisibilityManager focusModeConfigurationChangedName](EKCalendarVisibilityManager, "focusModeConfigurationChangedName"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v6, "isEqualToString:", v4), v4, v5))
  {
    -[_EKNotificationMonitor _notificationCountChangedExternally](self, "_notificationCountChangedExternally");
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D0BE80]) & 1) != 0
         || objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.eventkit.preference.notification.AlertInviteeDeclines")))
  {
    -[_EKNotificationMonitor _alertPrefChanged](self, "_alertPrefChanged");
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D0BE60]))
  {
    -[_EKNotificationMonitor _databaseChanged](self, "_databaseChanged");
  }

}

- (void)_notificationCountChangedExternally
{
  NSObject *v3;
  NSObject *notificationQueue;
  _QWORD v5[6];
  uint8_t buf[8];
  uint8_t *v7;
  uint64_t v8;
  char v9;

  objc_msgSend((id)objc_opt_class(), "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2318000, v3, OS_LOG_TYPE_DEFAULT, "Notification count changed externally.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v7 = buf;
  v8 = 0x2020000000;
  v9 = 0;
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61___EKNotificationMonitor__notificationCountChangedExternally__block_invoke;
  v5[3] = &unk_1E47850A0;
  v5[4] = self;
  v5[5] = buf;
  dispatch_sync(notificationQueue, v5);
  if (v7[24])
    -[_EKNotificationMonitor attemptReload](self, "attemptReload");
  _Block_object_dispose(buf, 8);
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id buf[2];

  if (!self->_running)
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A2318000, v3, OS_LOG_TYPE_DEFAULT, "Monitor starting up.", (uint8_t *)buf, 2u);
    }

    self->_initialCheck = 1;
    -[_EKNotificationMonitor attemptReload](self, "attemptReload");
    self->_running = 1;
    if (self->_registerForDarwinNotifications)
    {
      if (self->_useSyncIdleTimer)
      {
        objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", self, sel__syncDidStart, *MEMORY[0x1E0D0BEF8]);
        objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", self, sel__syncDidEndExternally, *MEMORY[0x1E0D0BF00]);
        objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", self, sel__notificationCountChangedExternally, CFSTR("EKNotificationCountChangedExternallyNotification"));
      }
      objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", self, sel__alertPrefChanged, *MEMORY[0x1E0D0BE80]);
      objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", self, sel__alertPrefChanged, CFSTR("com.apple.eventkit.preference.notification.AlertInviteeDeclines"));
      if (self->_excludeUncheckedCalendars)
      {
        v4 = (void *)MEMORY[0x1E0D0C2E0];
        +[EKCalendarVisibilityManager focusModeConfigurationChangedName](EKCalendarVisibilityManager, "focusModeConfigurationChangedName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObserver:selector:name:", self, sel__notificationCountChangedExternally, v5);

      }
    }
    if (self->_eventStore)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__eventStoreChangedNotification_, CFSTR("EKEventStoreChangedNotification"), self->_eventStore);

    }
    if (self->_eventStorePurger)
    {
      objc_initWeak(buf, self);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __31___EKNotificationMonitor_start__block_invoke;
      v7[3] = &unk_1E4786548;
      objc_copyWeak(&v8, buf);
      -[EKTimedEventStorePurger setChangedBlock:](self->_eventStorePurger, "setChangedBlock:", v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(buf);
    }
  }
}

- (void)attemptReload
{
  -[_EKNotificationMonitor attemptReloadSynchronously:](self, "attemptReloadSynchronously:", 0);
}

- (void)attemptReloadSynchronously:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke;
  v7[3] = &unk_1E4785078;
  v7[4] = self;
  v5 = (void *)MEMORY[0x1A85849D4](v7, a2);
  queue = self->_queue;
  if (v3)
    dispatch_sync(queue, v5);
  else
    dispatch_async(queue, v5);

}

- (id)_fetchEventNotificationReferencesFromEventStore:(id)a3 earliestExpiringNotification:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD block[5];
  _QWORD v17[5];
  __int128 buf;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend((id)objc_opt_class(), "logHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_DEFAULT, "Fetching event notifications from event store: %@.", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v6, "eventNotificationsExcludingUncheckedCalendars:filteredByShowsNotificationsFlag:earliestExpiringNotification:", self->_excludeUncheckedCalendars, self->_filteredByShowsNotificationsFlag, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "logHandle");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_DEFAULT, "Fetched event notifications from event store: %@.", (uint8_t *)&buf, 0xCu);
  }

  v10 = MEMORY[0x1E0C809B0];
  if (self->_automaticallyFaultNotifications)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __103___EKNotificationMonitor__fetchEventNotificationReferencesFromEventStore_earliestExpiringNotification___block_invoke;
    v17[3] = &unk_1E47865E0;
    v17[4] = self;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__13;
  v21 = __Block_byref_object_dispose__13;
  v22 = 0;
  +[_EKNotificationMonitor blacklistedNotificationQueue](_EKNotificationMonitor, "blacklistedNotificationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __103___EKNotificationMonitor__fetchEventNotificationReferencesFromEventStore_earliestExpiringNotification___block_invoke_70;
  block[3] = &unk_1E4784C68;
  block[4] = &buf;
  dispatch_sync(v11, block);

  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __103___EKNotificationMonitor__fetchEventNotificationReferencesFromEventStore_earliestExpiringNotification___block_invoke_2;
  v15[3] = &unk_1E4786608;
  v15[4] = &buf;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&buf, 8);
  return v13;
}

+ (OS_os_log)logHandle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35___EKNotificationMonitor_logHandle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (logHandle_onceToken != -1)
    dispatch_once(&logHandle_onceToken, block);
  return (OS_os_log *)(id)logHandle_logHandle;
}

- (BOOL)isMonitoringOnlyNotificationCount
{
  return self->_isMonitoringOnlyNotificationCount;
}

- (NSArray)notificationReferences
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__13;
  v11 = __Block_byref_object_dispose__13;
  v12 = 0;
  -[_EKNotificationMonitor notificationQueue](self, "notificationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48___EKNotificationMonitor_notificationReferences__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (id)effectiveCallbackQueue
{
  OS_dispatch_queue *callbackNotificationQueue;
  OS_dispatch_queue *v3;
  id v4;

  callbackNotificationQueue = self->_callbackNotificationQueue;
  if (callbackNotificationQueue)
  {
    v3 = callbackNotificationQueue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    v4 = MEMORY[0x1E0C80D38];
  }
  return v3;
}

- (id)_eventStore
{
  void (**eventStoreGetter)(id, SEL);
  void *eventStorePurger;
  EKEventStore *eventStore;

  eventStoreGetter = (void (**)(id, SEL))self->_eventStoreGetter;
  if (eventStoreGetter)
  {
    eventStoreGetter[2](self->_eventStoreGetter, a2);
    eventStorePurger = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    eventStore = self->_eventStore;
    if (eventStore)
      return eventStore;
    eventStorePurger = self->_eventStorePurger;
    if (eventStorePurger)
    {
      objc_msgSend(eventStorePurger, "acquireCachedEventStoreOrCreate:", 1);
      eventStorePurger = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return eventStorePurger;
}

+ (id)blacklistedNotificationQueue
{
  if (blacklistedNotificationQueue_onceToken != -1)
    dispatch_once(&blacklistedNotificationQueue_onceToken, &__block_literal_global_65);
  return (id)blacklistedNotificationQueue__blacklistedNotificationQueue;
}

- (void)_updateTimerFireDate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  NSDate *v10;
  NSDate *nextFireTime;
  PCPersistentTimer *v12;
  PCPersistentTimer *timer;
  PCPersistentTimer *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[_EKNotificationMonitor _killTimer](self, "_killTimer");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "CalIsBeforeDate:", v5);
    v7 = v6;
    if (v6 && self->_lastExpirationTimerFireDateWasInThePast)
    {
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_EKNotificationMonitor _updateTimerFireDate:].cold.1((uint64_t)v4, v8);

      self->_lastExpirationTimerFireDateWasInThePast = v7;
    }
    else
    {
      self->_lastExpirationTimerFireDateWasInThePast = v6;
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138543362;
        v17 = v4;
        _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_DEFAULT, "Next expiration fire time will be %{public}@.", (uint8_t *)&v16, 0xCu);
      }

      v10 = (NSDate *)objc_msgSend(v4, "copy");
      nextFireTime = self->_nextFireTime;
      self->_nextFireTime = v10;

      v12 = (PCPersistentTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70A38]), "initWithFireDate:serviceIdentifier:target:selector:userInfo:", self->_nextFireTime, CFSTR("com.apple.eventkit.invitationmonitor"), self, sel__timerFired, 0);
      timer = self->_timer;
      self->_timer = v12;

      -[PCPersistentTimer setMinimumEarlyFireProportion:](self->_timer, "setMinimumEarlyFireProportion:", 1.0);
      v14 = self->_timer;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCPersistentTimer scheduleInRunLoop:](v14, "scheduleInRunLoop:", v15);

    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1A2318000, v5, OS_LOG_TYPE_DEFAULT, "No expiring notifications. Not setting expiration timer.", (uint8_t *)&v16, 2u);
    }
  }

}

- (void)_killTimer
{
  PCPersistentTimer *timer;
  PCPersistentTimer *v4;
  NSDate *nextFireTime;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  timer = self->_timer;
  if (timer)
  {
    -[PCPersistentTimer invalidate](timer, "invalidate");
    v4 = self->_timer;
    self->_timer = 0;

  }
  nextFireTime = self->_nextFireTime;
  self->_nextFireTime = 0;

}

- (void)_addRemovedOrAddedObjectIDsTo:(id)a3 oldNotifications:(id)a4 newNotifications:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v12 = (id)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v12, "intersectSet:", v7);
  objc_msgSend(v8, "minusSet:", v12);
  objc_msgSend(v7, "minusSet:", v12);
  objc_msgSend(v8, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectsFromArray:", v10);
  objc_msgSend(v7, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectsFromArray:", v11);
}

- (_EKNotificationMonitor)initWithOptions:(int64_t)a3 eventStore:(id)a4
{
  return (_EKNotificationMonitor *)-[_EKNotificationMonitor _initWithOptions:eventStore:eventStoreGetter:](self, "_initWithOptions:eventStore:eventStoreGetter:", a3, a4, 0);
}

- (id)_initWithOptions:(int64_t)a3 eventStore:(id)a4 eventStoreGetter:(id)a5
{
  unsigned int v7;
  id v9;
  id v10;
  char *v11;
  int16x8_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  EKTimedEventStorePurger *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  void *v22;
  id v23;
  const char *v24;
  NSObject *v25;
  dispatch_queue_t v26;
  void *v27;
  objc_super v29;

  v7 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)_EKNotificationMonitor;
  v11 = -[_EKNotificationMonitor init](&v29, sel_init);
  v13 = v11;
  if (v11)
  {
    v11[102] = v7 & 1;
    v12.i64[0] = *(_QWORD *)&vshl_u16((uint16x4_t)(*(_QWORD *)&vdup_n_s16(v7) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFFFFFELL) & 0xFF01FF01FF01FF01;
    *(_DWORD *)(v11 + 93) = vmovn_s16(v12).u32[0];
    v11[97] = (v7 & 0x20) != 0;
    v11[98] = (v7 & 0x40) != 0;
    v11[100] = (v7 & 0x80) != 0;
    v11[101] = BYTE1(v7) & 1;
    v14 = objc_msgSend(v10, "copy");
    v15 = (void *)*((_QWORD *)v13 + 1);
    *((_QWORD *)v13 + 1) = v14;

    objc_storeStrong((id *)v13 + 18, a4);
    if (!*((_QWORD *)v13 + 18) && !*((_QWORD *)v13 + 1))
    {
      v16 = objc_alloc_init(EKTimedEventStorePurger);
      v17 = (void *)*((_QWORD *)v13 + 17);
      *((_QWORD *)v13 + 17) = v16;

      objc_msgSend(*((id *)v13 + 17), "setPurgingAllowed:", 1);
      objc_msgSend(*((id *)v13 + 17), "setTimeout:", 10.0);
      objc_msgSend(*((id *)v13 + 17), "setCreationBlock:", &__block_literal_global_46);
    }
    if (*((_BYTE *)v13 + 97))
    {
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19 = (void *)*((_QWORD *)v13 + 10);
      *((_QWORD *)v13 + 10) = v18;

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.eventkit.notificationMonitor", v20);
    v22 = (void *)*((_QWORD *)v13 + 7);
    *((_QWORD *)v13 + 7) = v21;

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = (const char *)objc_msgSend(v23, "UTF8String");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = dispatch_queue_create(v24, v25);
    v27 = (void *)*((_QWORD *)v13 + 16);
    *((_QWORD *)v13 + 16) = v26;

  }
  return v13;
}

+ (id)requestedDarwinNotifications
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D0BE80];
  v5[0] = CFSTR("EKNotificationCountChangedExternallyNotification");
  v5[1] = v2;
  v3 = *MEMORY[0x1E0D0BF00];
  v5[2] = *MEMORY[0x1E0D0BEF8];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_EKNotificationMonitor)init
{
  return (_EKNotificationMonitor *)-[_EKNotificationMonitor _initWithOptions:eventStore:eventStoreGetter:](self, "_initWithOptions:eventStore:eventStoreGetter:", 0, 0, 0);
}

- (_EKNotificationMonitor)initWithOptions:(int64_t)a3
{
  return (_EKNotificationMonitor *)-[_EKNotificationMonitor _initWithOptions:eventStore:eventStoreGetter:](self, "_initWithOptions:eventStore:eventStoreGetter:", a3, 0, 0);
}

- (_EKNotificationMonitor)initWithOptions:(int64_t)a3 eventStoreGetter:(id)a4
{
  return (_EKNotificationMonitor *)-[_EKNotificationMonitor _initWithOptions:eventStore:eventStoreGetter:](self, "_initWithOptions:eventStore:eventStoreGetter:", a3, 0, a4);
}

- (void)dealloc
{
  objc_super v3;

  -[_EKNotificationMonitor _killSyncTimer:](self, "_killSyncTimer:", 0);
  -[_EKNotificationMonitor stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)_EKNotificationMonitor;
  -[_EKNotificationMonitor dealloc](&v3, sel_dealloc);
}

- (void)stop
{
  NSObject *v3;
  void *v4;
  EKTimedEventStorePurger *eventStorePurger;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  if (self->_running)
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2318000, v3, OS_LOG_TYPE_DEFAULT, "Monitor shutting down.", buf, 2u);
    }

    if (self->_registerForDarwinNotifications)
    {
      if (self->_useSyncIdleTimer)
      {
        objc_msgSend(MEMORY[0x1E0D0C2E0], "removeObserver:name:", self, *MEMORY[0x1E0D0BEF8]);
        objc_msgSend(MEMORY[0x1E0D0C2E0], "removeObserver:name:", self, *MEMORY[0x1E0D0BF00]);
        objc_msgSend(MEMORY[0x1E0D0C2E0], "removeObserver:name:", self, CFSTR("EKNotificationCountChangedExternallyNotification"));
      }
      objc_msgSend(MEMORY[0x1E0D0C2E0], "removeObserver:name:", self, *MEMORY[0x1E0D0BE80]);
    }
    if (self->_eventStore)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("EKEventStoreChangedNotification"), self->_eventStore);

    }
    eventStorePurger = self->_eventStorePurger;
    if (eventStorePurger)
      -[EKTimedEventStorePurger setChangedBlock:](eventStorePurger, "setChangedBlock:", 0);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30___EKNotificationMonitor_stop__block_invoke;
    block[3] = &unk_1E4785078;
    block[4] = self;
    dispatch_sync(queue, block);
    self->_running = 0;
  }
}

- (void)adjust
{
  NSObject *v2;
  uint8_t v3[16];

  if (self->_running)
  {
    -[_EKNotificationMonitor attemptReload](self, "attemptReload");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A2318000, v2, OS_LOG_TYPE_DEFAULT, "Ignoring expiration timer because the notification monitor is not running.", v3, 2u);
    }

  }
}

- (void)_eventStoreChangedNotification:(id)a3
{
  if (!+[EKChangeListener isSyncStatusChangeNotification:](EKChangeListener, "isSyncStatusChangeNotification:", a3))-[_EKNotificationMonitor _eventStoreChanged](self, "_eventStoreChanged");
}

- (void)_eventStoreChanged
{
  -[_EKNotificationMonitor trackChangesInEventStore](self, "trackChangesInEventStore");
  -[_EKNotificationMonitor attemptReload](self, "attemptReload");
}

- (void)_databaseChanged
{
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend((id)objc_opt_class(), "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A2318000, v3, OS_LOG_TYPE_DEFAULT, "Database changed.", v4, 2u);
  }

  -[_EKNotificationMonitor trackChangesInEventStore](self, "trackChangesInEventStore");
  -[_EKNotificationMonitor attemptReload](self, "attemptReload");
}

- (void)_alertPrefChanged
{
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend((id)objc_opt_class(), "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A2318000, v3, OS_LOG_TYPE_DEFAULT, "Alert pref changed.", v4, 2u);
  }

  -[_EKNotificationMonitor attemptReload](self, "attemptReload");
}

- (void)_timerFired
{
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend((id)objc_opt_class(), "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A2318000, v3, OS_LOG_TYPE_DEFAULT, "Expiration timer fired.", v4, 2u);
  }

  -[_EKNotificationMonitor adjust](self, "adjust");
}

+ (void)addBlacklistedNotificationObjectID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "blacklistedNotificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___EKNotificationMonitor_addBlacklistedNotificationObjectID___block_invoke;
  block[3] = &unk_1E4785078;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

+ (id)blacklistedRowIDs
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD block[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__13;
  v15 = __Block_byref_object_dispose__13;
  v16 = 0;
  objc_msgSend(a1, "blacklistedNotificationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___EKNotificationMonitor_blacklistedRowIDs__block_invoke;
  block[3] = &unk_1E4784C68;
  block[4] = &v11;
  dispatch_sync(v2, block);

  v4 = (void *)objc_opt_new();
  v5 = (void *)v12[5];
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __43___EKNotificationMonitor_blacklistedRowIDs__block_invoke_2;
  v8[3] = &unk_1E47865B8;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_resetSyncTimer
{
  id v3;
  void *v4;
  NSTimer *v5;
  NSTimer *syncTimer;
  id v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  if (self->_useSyncIdleTimer)
  {
    -[_EKNotificationMonitor _killSyncTimer:](self, "_killSyncTimer:", 0);
    v3 = objc_alloc(MEMORY[0x1E0C99E88]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 30.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSTimer *)objc_msgSend(v3, "initWithFireDate:interval:target:selector:userInfo:repeats:", v4, self, sel__syncTimerFired_, 0, 0, 0.0);
    syncTimer = self->_syncTimer;
    self->_syncTimer = v5;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTimer:forMode:", self->_syncTimer, *MEMORY[0x1E0C99860]);

  }
}

- (void)_killSyncTimer:(id)a3
{
  NSTimer *v4;
  NSTimer *syncTimer;
  BOOL v6;
  NSTimer *v7;
  NSTimer *v8;

  v4 = (NSTimer *)a3;
  syncTimer = self->_syncTimer;
  if (!v4 || (v6 = syncTimer == v4, syncTimer = v4, v6))
  {
    v8 = v4;
    -[NSTimer invalidate](syncTimer, "invalidate");
    v7 = self->_syncTimer;
    self->_syncTimer = 0;

    v4 = v8;
  }

}

- (void)_syncTimerFired:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A2318000, v5, OS_LOG_TYPE_DEFAULT, "Sync timer fired.", v6, 2u);
  }

  -[_EKNotificationMonitor _syncDidEnd:](self, "_syncDidEnd:", v4);
}

- (void)_syncDidStart
{
  NSObject *v3;
  NSObject *notificationQueue;
  _QWORD block[5];
  uint8_t buf[16];

  objc_msgSend((id)objc_opt_class(), "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2318000, v3, OS_LOG_TYPE_DEFAULT, "Sync started. Suppressing notification monitor checks while it runs.", buf, 2u);
  }

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39___EKNotificationMonitor__syncDidStart__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(notificationQueue, block);
}

- (void)_syncDidEndExternally
{
  -[_EKNotificationMonitor _syncDidEnd:](self, "_syncDidEnd:", 0);
}

- (void)_syncDidEnd:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38___EKNotificationMonitor__syncDidEnd___block_invoke;
  block[3] = &unk_1E47850C8;
  block[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  dispatch_sync(notificationQueue, block);
  if (*((_BYTE *)v11 + 24))
    -[_EKNotificationMonitor attemptReload](self, "attemptReload");

  _Block_object_dispose(&v10, 8);
}

- (void)trackChangesInEventStore
{
  void *v3;
  void *v4;
  void *v5;
  CADInMemoryChangeTimestamp *lastChangedTimestamp;
  _QWORD v7[5];

  if (self->_computeChangedNotificationSet && !self->_isMonitoringOnlyNotificationCount)
  {
    -[_EKNotificationMonitor _eventStore](self, "_eventStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CADOperationProxySync");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    lastChangedTimestamp = self->_lastChangedTimestamp;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50___EKNotificationMonitor_trackChangesInEventStore__block_invoke;
    v7[3] = &unk_1E4786630;
    v7[4] = self;
    objc_msgSend(v5, "CADDatabaseGetChangedEntityIDsSinceTimestamp:reply:", lastChangedTimestamp, v7);

  }
}

- (OS_dispatch_queue)callbackNotificationQueue
{
  return self->_callbackNotificationQueue;
}

- (void)setCallbackNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackNotificationQueue, a3);
}

- (EKTimedEventStorePurger)eventStorePurger
{
  return self->_eventStorePurger;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_eventStorePurger, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_callbackNotificationQueue, 0);
  objc_storeStrong((id *)&self->_notificationReferences, 0);
  objc_storeStrong((id *)&self->_changedIDs, 0);
  objc_storeStrong((id *)&self->_lastChangedTimestamp, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_syncTimer, 0);
  objc_storeStrong((id *)&self->_nextFireTime, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_eventStoreGetter, 0);
}

- (void)_updateTimerFireDate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "Received multiple expiration dates in the past. Will not set expiration timer. Most recent expiration date received was %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
