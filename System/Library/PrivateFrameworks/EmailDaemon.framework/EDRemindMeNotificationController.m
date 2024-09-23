@implementation EDRemindMeNotificationController

uint64_t __56__EDRemindMeNotificationController_addRemindMeObserver___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (id)addRemindMeObserver:(id)a3
{
  id v4;
  EFLocked *observers;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id from;
  id location;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  observers = self->_observers;
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__EDRemindMeNotificationController_addRemindMeObserver___block_invoke;
  v16[3] = &unk_1E94A01D0;
  v7 = v4;
  v17 = v7;
  -[EFLocked performWhileLocked:](observers, "performWhileLocked:", v16);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v7);
  v8 = (void *)MEMORY[0x1E0D1EE90];
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __56__EDRemindMeNotificationController_addRemindMeObserver___block_invoke_2;
  v11[3] = &unk_1E949E7A0;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  objc_msgSend(v8, "tokenWithCancelationBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v9;
}

- (EDRemindMeNotificationController)initWithHookRegistry:(id)a3 messagePersistence:(id)a4 alarmScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  DefaultEDRemindMeNotificationControllerAlarmDateProvider *v11;
  EDRemindMeNotificationController *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(DefaultEDRemindMeNotificationControllerAlarmDateProvider);
  v12 = -[EDRemindMeNotificationController initWithHookRegistry:messagePersistence:alarmDateProvider:eventDelegate:alarmScheduler:](self, "initWithHookRegistry:messagePersistence:alarmDateProvider:eventDelegate:alarmScheduler:", v8, v9, v11, self, v10);

  return v12;
}

- (EDRemindMeNotificationController)initWithHookRegistry:(id)a3 messagePersistence:(id)a4 alarmDateProvider:(id)a5 eventDelegate:(id)a6 alarmScheduler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  EDRemindMeNotificationController *v18;
  EDRemindMeNotificationController *v19;
  void *v20;
  uint64_t v21;
  EFLocked *observers;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *alarmQueue;
  uint64_t v26;
  EFXPCAlarm *xpcAlarm;
  EFXPCAlarm *v28;
  EDQueryCreator *v29;
  uint64_t v30;
  EDQueryCreator *readLaterQueryCreator;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  id v37;
  id location;
  objc_super v39;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v39.receiver = self;
  v39.super_class = (Class)EDRemindMeNotificationController;
  v18 = -[EDRemindMeNotificationController init](&v39, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_hookRegistry, a3);
    objc_storeStrong((id *)&v19->_messagePersistence, a4);
    objc_storeStrong((id *)&v19->_alarmDateProvider, a5);
    objc_storeWeak((id *)&v19->_eventDelegate, v16);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EEF0]), "initWithObject:", v20);
    observers = v19->_observers;
    v19->_observers = (EFLocked *)v21;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("com.apple.EmailDaemon.EDRemindMeNotificationController.messageScheduler", v23);
    alarmQueue = v19->_alarmQueue;
    v19->_alarmQueue = (OS_dispatch_queue *)v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F090]), "initWithScheduler:eventName:eventHandlerQueue:", v17, CFSTR("EDRemindMeNotificationController.alarm"), v19->_alarmQueue);
    xpcAlarm = v19->_xpcAlarm;
    v19->_xpcAlarm = (EFXPCAlarm *)v26;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v19);
    v28 = v19->_xpcAlarm;
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __123__EDRemindMeNotificationController_initWithHookRegistry_messagePersistence_alarmDateProvider_eventDelegate_alarmScheduler___block_invoke;
    v36 = &unk_1E94A01A8;
    objc_copyWeak(&v37, &location);
    -[EFXPCAlarm beginReceivingEventsWithHandler:](v28, "beginReceivingEventsWithHandler:", &v33);
    v29 = [EDQueryCreator alloc];
    v30 = -[EDQueryCreator initWithQueryType:](v29, "initWithQueryType:", *MEMORY[0x1E0D1DE28], v33, v34, v35, v36);
    readLaterQueryCreator = v19->_readLaterQueryCreator;
    v19->_readLaterQueryCreator = (EDQueryCreator *)v30;

    objc_msgSend(v13, "registerMessageChangeHookResponder:", v19);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

  }
  return v19;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__EDRemindMeNotificationController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_71 != -1)
    dispatch_once(&log_onceToken_71, block);
  return (OS_os_log *)(id)log_log_71;
}

void __39__EDRemindMeNotificationController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_71;
  log_log_71 = (uint64_t)v1;

}

+ (NSString)localizedRemindMeNotificationTitle
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)localizedRemindMeNotificationPlaceholder
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)localizedRemindMeNotificationTitleNoSender
{
  return (NSString *)_EFLocalizedString();
}

void __123__EDRemindMeNotificationController_initWithHookRegistry_messagePersistence_alarmDateProvider_eventDelegate_alarmScheduler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_alarmFired");

}

- (void)test_waitForUpdates
{
  void *v4;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDRemindMeNotificationController.m"), 110, CFSTR("%s can only be called from unit tests"), "-[EDRemindMeNotificationController test_waitForUpdates]");

  }
  dispatch_sync((dispatch_queue_t)self->_alarmQueue, &__block_literal_global_54);
}

- (void)test_tearDown
{
  void *v4;
  NSObject *alarmQueue;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[4];
  id v11;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDRemindMeNotificationController.m"), 116, CFSTR("%s can only be called from unit tests"), "-[EDRemindMeNotificationController test_tearDown]");

  }
  -[EFXPCAlarm invalidate](self->_xpcAlarm, "invalidate");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
  alarmQueue = self->_alarmQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__EDRemindMeNotificationController_test_tearDown__block_invoke;
  block[3] = &unk_1E949AEB8;
  v6 = v4;
  v11 = v6;
  dispatch_async(alarmQueue, block);
  while ((objc_msgSend(v6, "tryLockWhenCondition:", 1) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.001);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "runUntilDate:", v7);

    objc_msgSend(MEMORY[0x1E0CB3978], "sleepUntilDate:", v7);
  }
  objc_msgSend(v6, "unlock");

}

uint64_t __49__EDRemindMeNotificationController_test_tearDown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unlockWithCondition:", 1);
}

- (NSHashTable)observers
{
  return (NSHashTable *)-[EFLocked getObject](self->_observers, "getObject");
}

void __56__EDRemindMeNotificationController_addRemindMeObserver___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3)
      objc_msgSend(v4, "removeRemindMeObserver:", v3);

    WeakRetained = v4;
  }

}

- (void)removeRemindMeObserver:(id)a3
{
  id v4;
  EFLocked *observers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__EDRemindMeNotificationController_removeRemindMeObserver___block_invoke;
  v7[3] = &unk_1E94A01D0;
  v8 = v4;
  v6 = v4;
  -[EFLocked performWhileLocked:](observers, "performWhileLocked:", v7);

}

uint64_t __59__EDRemindMeNotificationController_removeRemindMeObserver___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (id)nextAlarmDate
{
  if (a1)
  {
    objc_msgSend(a1[3], "nextDate");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)setNextAlarmDate:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
    objc_msgSend(*(id *)(a1 + 24), "setNextDate:", v3);

}

- (void)performDelayedTasks
{
  NSObject *alarmQueue;
  _QWORD v3[6];

  alarmQueue = self->_alarmQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__EDRemindMeNotificationController_performDelayedTasks__block_invoke;
  v3[3] = &unk_1E949B658;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async(alarmQueue, v3);
}

void __55__EDRemindMeNotificationController_performDelayedTasks__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[EDRemindMeNotificationController nextAlarmDate](*(id **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDRemindMeNotificationController log](EDRemindMeNotificationController, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v2;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ nextAlarmDate:%{public}@", (uint8_t *)&v7, 0x16u);

  }
  if (!v2
    || (objc_msgSend(MEMORY[0x1E0C99D68], "now"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v2, "ef_isEarlierThanDate:", v5),
        v5,
        v6))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateAlarmStartDate:", 0);
  }

}

- (void)_updateAlarmStartDate:(id)a3
{
  -[EDRemindMeNotificationController _updateAlarmUpdatedMessages:readLaterDate:startDate:changeIsRemote:](self, "_updateAlarmUpdatedMessages:readLaterDate:startDate:changeIsRemote:", 0, 0, a3, 0);
}

- (void)_updateAlarmUpdatedMessages:(id)a3 readLaterDate:(id)a4 startDate:(id)a5 changeIsRemote:(BOOL)a6
{
  void *v6;
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  EDQueryCreator *v19;
  uint64_t v20;
  EDMessagePersistence *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  BOOL v28;
  int v29;
  id v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v7 = a6;
  v51 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_alarmQueue);
  if (!v14)
  {
    -[EDRemindMeNotificationController nextAlarmDate]((id *)&self->super.isa);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v14 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ec_integerDate");
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v18 = a2;
  v19 = self->_readLaterQueryCreator;
  -[EDQueryCreator queryWithStartDate:endDate:](v19, "queryWithStartDate:endDate:", v14, 0);
  v20 = objc_claimAutoreleasedReturnValue();

  v21 = self->_messagePersistence;
  v36 = (void *)v20;
  -[EDMessagePersistence persistedMessagesMatchingQuery:limit:](v21, "persistedMessagesMatchingQuery:limit:", v20, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v12, "count");
  if (!v13 && v23)
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __103__EDRemindMeNotificationController__updateAlarmUpdatedMessages_readLaterDate_startDate_changeIsRemote___block_invoke;
    v37[3] = &unk_1E949D590;
    v38 = v12;
    objc_msgSend(v22, "ef_filter:", v37);
    v24 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v24;
  }
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(v22, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "readLater");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "date");
    v26 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_14;
  }
  else
  {
    v26 = 0;
    if (!v7)
      goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "ef_isLaterThanDate:", v6))
  {
LABEL_27:

    goto LABEL_28;
  }
LABEL_14:
  v27 = objc_msgSend(v12, "count");
  if (v13)
    v28 = v27 == 0;
  else
    v28 = 1;
  v29 = !v28;
  if (v7)
  {

    if ((v29 & 1) == 0)
      goto LABEL_28;
  }
  else if (!v29)
  {
    goto LABEL_28;
  }
  if (!v26 || objc_msgSend(v13, "ef_isEarlierThanDate:", v26))
  {
    v30 = v12;

    v6 = v26;
    v22 = v30;
    v26 = v13;
    goto LABEL_27;
  }
LABEL_28:
  +[EDRemindMeNotificationController log](EDRemindMeNotificationController, "log");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(v18);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 138544642;
    v40 = v32;
    v41 = 2048;
    v42 = v33;
    v43 = 2114;
    v44 = v13;
    v45 = 2114;
    v46 = v14;
    v47 = 1024;
    v48 = v7;
    v49 = 2114;
    v50 = v26;
    _os_log_impl(&dword_1D2F2C000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ updatedMessages:%lu readLaterDate:%{public}@ startDate:%{public}@ changeIsRemote:%{BOOL}d firstMessageReadLaterDate:%{public}@", buf, 0x3Au);

  }
  -[EDRemindMeNotificationController eventDelegate](self, "eventDelegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v22, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
  objc_msgSend(v34, "controller:scheduleAlarmForMessage:date:", self, v35, v26);
  -[EDRemindMeNotificationController setNextAlarmDate:]((uint64_t)self, v26);

}

uint64_t __103__EDRemindMeNotificationController__updateAlarmUpdatedMessages_readLaterDate_startDate_changeIsRemote___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)_fetchMessagesToNotifyWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  EDQueryCreator *readLaterQueryCreator;
  void *v10;
  NSObject *v11;
  void *v12;
  EDMessagePersistence *messagePersistence;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (self)
    readLaterQueryCreator = self->_readLaterQueryCreator;
  else
    readLaterQueryCreator = 0;
  -[EDQueryCreator queryWithStartDate:endDate:](readLaterQueryCreator, "queryWithStartDate:endDate:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDRemindMeNotificationController log](EDRemindMeNotificationController, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v12;
    v19 = 2114;
    v20 = v7;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ startDate:%{public}@ endDate:%{public}@", (uint8_t *)&v17, 0x20u);

  }
  if (self)
    messagePersistence = self->_messagePersistence;
  else
    messagePersistence = 0;
  -[EDMessagePersistence persistedMessagesMatchingQuery:limit:](messagePersistence, "persistedMessagesMatchingQuery:limit:", v10, 0x7FFFFFFFFFFFFFFFLL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ef_uniquifyWithComparator:", &__block_literal_global_80);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __80__EDRemindMeNotificationController__fetchMessagesToNotifyWithStartDate_endDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "globalMessageID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "globalMessageID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  return v8;
}

- (void)_alarmFired
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_alarmQueue);
  -[EDRemindMeNotificationController nextAlarmDate]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ec_integerDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "ef_isLaterThanDate:", v4) & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v4, "dateByAddingTimeInterval:", 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ec_integerDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[EDRemindMeNotificationController log](EDRemindMeNotificationController, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v10;
      v27 = 2114;
      v28 = v7;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ update endDate to %{public}@ so it's after startDate", buf, 0x16u);

    }
  }
  -[EDRemindMeNotificationController _fetchMessagesToNotifyWithStartDate:endDate:](self, "_fetchMessagesToNotifyWithStartDate:endDate:", v4, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDRemindMeNotificationController log](EDRemindMeNotificationController, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[EDRemindMeNotificationController nextAlarmDate]((id *)&self->super.isa);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 138543874;
    v26 = v13;
    v27 = 2114;
    v28 = v14;
    v29 = 2048;
    v30 = v15;
    _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ nextAlarmDate:%{public}@ messages to notify:%lu", buf, 0x20u);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v16);
        -[EDRemindMeNotificationController _notify:](self, "_notify:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

  -[EDRemindMeNotificationController _updateAlarmStartDate:](self, "_updateAlarmStartDate:", v7);
}

- (void)_notify:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_alarmQueue);
  -[EDRemindMeNotificationController observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "controller:messageTimerFired:", self, v4, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)resetRemindMeAlarmIfNeeded
{
  EDRemindMeNotificationControllerAlarmDateProvider *alarmDateProvider;
  EDRemindMeNotificationControllerAlarmDateProvider *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self)
    alarmDateProvider = self->_alarmDateProvider;
  else
    alarmDateProvider = 0;
  v4 = alarmDateProvider;
  -[EDRemindMeNotificationControllerAlarmDateProvider nextDate](v4, "nextDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDRemindMeNotificationController log](EDRemindMeNotificationController, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Next alarm date from DefaultEDRemindMeNotificationControllerAlarmDateProvider: %{public}@.", (uint8_t *)&v9, 0xCu);
  }

  if (v5)
  {
    +[EDRemindMeNotificationController log](EDRemindMeNotificationController, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Reset remind me later next alarm to %{public}@.", (uint8_t *)&v9, 0xCu);
    }

    -[EDRemindMeNotificationController xpcAlarm](self, "xpcAlarm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNextFireDate:isUserVisible:", v5, 1);

  }
}

- (void)controller:(id)a3 scheduleAlarmForMessage:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  +[EDRemindMeNotificationController log](EDRemindMeNotificationController, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v11;
    v15 = 2114;
    v16 = v9;
    v17 = 2048;
    v18 = objc_msgSend(v8, "globalMessageID");
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ date:%{public}@ message.globalMessageID:%lld", (uint8_t *)&v13, 0x20u);

  }
  -[EDRemindMeNotificationController xpcAlarm](self, "xpcAlarm");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNextFireDate:isUserVisible:", v9, 1);

}

- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *alarmQueue;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v6 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  +[EDRemindMeNotificationController log](EDRemindMeNotificationController, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v13;
    v23 = 1024;
    v24 = v6;
    v25 = 2114;
    v26 = v10;
    _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ changeIsRemote:%{BOOL}d readLaterDate:%{public}@", buf, 0x1Cu);

  }
  alarmQueue = self->_alarmQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __111__EDRemindMeNotificationController_persistenceDidChangeReadLaterDate_messages_changeIsRemote_generationWindow___block_invoke;
  v17[3] = &unk_1E94A0218;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v6;
  v15 = v11;
  v16 = v10;
  dispatch_async(alarmQueue, v17);

}

void __111__EDRemindMeNotificationController_persistenceDidChangeReadLaterDate_messages_changeIsRemote_generationWindow___block_invoke(uint64_t a1)
{
  id v2;

  -[EDRemindMeNotificationController nextAlarmDate](*(id **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2 || !*(_QWORD *)(a1 + 40) || (objc_msgSend(v2, "isEqualToDate:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateAlarmUpdatedMessages:readLaterDate:startDate:changeIsRemote:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 56));

}

- (EDRemindMeNotificationControllerEventDelegate)eventDelegate
{
  return (EDRemindMeNotificationControllerEventDelegate *)objc_loadWeakRetained((id *)&self->_eventDelegate);
}

- (EFXPCAlarm)xpcAlarm
{
  return self->_xpcAlarm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcAlarm, 0);
  objc_destroyWeak((id *)&self->_eventDelegate);
  objc_storeStrong((id *)&self->_readLaterQueryCreator, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_alarmDateProvider, 0);
  objc_storeStrong((id *)&self->_alarmQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
