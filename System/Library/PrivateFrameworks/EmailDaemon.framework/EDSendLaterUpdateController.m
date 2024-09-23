@implementation EDSendLaterUpdateController

- (EDSendLaterUpdateController)initWithHookRegistry:(id)a3 messagePersistence:(id)a4 outgoingRepository:(id)a5 alarmScheduler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EDSendLaterUpdateController *v15;
  EDSendLaterUpdateController *v16;
  EDDefaultSendLaterUpdateControllerAlarmDateProvider *v17;
  EDSendLaterUpdateControllerAlarmDateProvider *alarmDateProvider;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *alarmQueue;
  uint64_t v22;
  EFXPCAlarm *xpcAlarm;
  EFXPCAlarm *v24;
  EDQueryCreator *v25;
  uint64_t v26;
  EDQueryCreator *sendLaterQueryCreator;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  id location;
  objc_super v35;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v35.receiver = self;
  v35.super_class = (Class)EDSendLaterUpdateController;
  v15 = -[EDSendLaterUpdateController init](&v35, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_messagePersistence, a4);
    objc_storeStrong((id *)&v16->_hookResponder, a3);
    objc_storeStrong((id *)&v16->_outgoingRepository, a5);
    v17 = objc_alloc_init(EDDefaultSendLaterUpdateControllerAlarmDateProvider);
    alarmDateProvider = v16->_alarmDateProvider;
    v16->_alarmDateProvider = (EDSendLaterUpdateControllerAlarmDateProvider *)v17;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.EmailDaemon.SendLaterUpdateController.messageScheduler", v19);
    alarmQueue = v16->_alarmQueue;
    v16->_alarmQueue = (OS_dispatch_queue *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F090]), "initWithScheduler:eventName:eventHandlerQueue:", v14, CFSTR("EDSendLaterUpdateController.alarm"), v16->_alarmQueue);
    xpcAlarm = v16->_xpcAlarm;
    v16->_xpcAlarm = (EFXPCAlarm *)v22;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v16);
    v24 = v16->_xpcAlarm;
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __105__EDSendLaterUpdateController_initWithHookRegistry_messagePersistence_outgoingRepository_alarmScheduler___block_invoke;
    v32 = &unk_1E94A01A8;
    objc_copyWeak(&v33, &location);
    -[EFXPCAlarm beginReceivingEventsWithHandler:](v24, "beginReceivingEventsWithHandler:", &v29);
    v25 = [EDQueryCreator alloc];
    v26 = -[EDQueryCreator initWithQueryType:](v25, "initWithQueryType:", *MEMORY[0x1E0D1DE48], v29, v30, v31, v32);
    sendLaterQueryCreator = v16->_sendLaterQueryCreator;
    v16->_sendLaterQueryCreator = (EDQueryCreator *)v26;

    objc_msgSend(v11, "registerMessageChangeHookResponder:", v16);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v16;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__EDSendLaterUpdateController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_84 != -1)
    dispatch_once(&log_onceToken_84, block);
  return (OS_os_log *)(id)log_log_84;
}

void __34__EDSendLaterUpdateController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_84;
  log_log_84 = (uint64_t)v1;

}

void __105__EDSendLaterUpdateController_initWithHookRegistry_messagePersistence_outgoingRepository_alarmScheduler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_alarmFired");

}

- (NSDate)nextAlarmDate
{
  void *v2;
  void *v3;

  -[EDSendLaterUpdateController alarmDateProvider](self, "alarmDateProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setNextAlarmDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EDSendLaterUpdateController alarmDateProvider](self, "alarmDateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNextDate:", v5);

}

- (void)_alarmFired
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  id v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_alarmQueue);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_dateWithTruncatedSeconds");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "ef_dateHoursAgo:", 12);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSendLaterUpdateController nextAlarmDate](self, "nextAlarmDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "ef_isLaterThanDate:", v30) & 1) != 0)
  {
    -[EDSendLaterUpdateController nextAlarmDate](self, "nextAlarmDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "ef_isEarlierThanDate:", v35);

    if (v6)
    {
      -[EDSendLaterUpdateController nextAlarmDate](self, "nextAlarmDate");
      v7 = objc_claimAutoreleasedReturnValue();

      +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v47 = v7;
        _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Send later alarm time has passed already, but is within the allowed delivery window. Send Later original date : %{public}@", buf, 0xCu);
      }

      v35 = (void *)v7;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ef_dateWithTruncatedSeconds");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "dateByAddingUnit:value:toDate:options:", 64, 1, v31, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v47 = (uint64_t)v35;
    v48 = 2114;
    v49 = v33;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Send later alarm fired. Send Later messages query start date: %{public}@ and end date:%{public}@", buf, 0x16u);
  }

  -[EDSendLaterUpdateController sendLaterQueryCreator](self, "sendLaterQueryCreator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queryWithStartDate:endDate:", v35, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDSendLaterUpdateController messagePersistence](self, "messagePersistence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "persistedMessagesMatchingQuery:limit:", v32, 0x7FFFFFFFFFFFFFFFLL);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v29, "count");
    *(_DWORD *)buf = 134217984;
    v47 = v14;
    _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Send later alarm fired. Preparing %lu messages", buf, 0xCu);
  }

  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v29;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v42;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v18);
        -[EDSendLaterUpdateController outgoingRepository](self, "outgoingRepository");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "outgoingMessageFromPersistedMessage:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[EDSendLaterUpdateController outgoingRepository](self, "outgoingRepository");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v17;
        v38[1] = 3221225472;
        v38[2] = __42__EDSendLaterUpdateController__alarmFired__block_invoke;
        v38[3] = &unk_1E94A19F0;
        v39 = v37;
        v40 = v19;
        objc_msgSend(v22, "deliverMessage:usingMailDrop:isCancelable:completion:", v21, 0, 0, v38);

        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v15);
  }

  -[EDSendLaterUpdateController outgoingRepository](self, "outgoingRepository");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "messageChangeManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "deleteMessages:", obj);

  objc_msgSend(v34, "dateByAddingUnit:value:toDate:options:", 64, 1, v35, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSendLaterUpdateController setNextAlarmDate:](self, "setNextAlarmDate:", v25);

  +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_msgSend(v37, "count");
    -[EDSendLaterUpdateController nextAlarmDate](self, "nextAlarmDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v47 = v27;
    v48 = 2114;
    v49 = v28;
    _os_log_impl(&dword_1D2F2C000, v26, OS_LOG_TYPE_DEFAULT, "Finished sending send later messages. %lu failed. Next alarm date: %{public}@", buf, 0x16u);

  }
  -[EDSendLaterUpdateController _updateAlarmUpdatedMessages:sendLaterDate:](self, "_updateAlarmUpdatedMessages:sendLaterDate:", 0, 0);

}

void __42__EDSendLaterUpdateController__alarmFired__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "status");
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
    +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ef_publicDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2048;
      v11 = v4;
      _os_log_error_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_ERROR, "Error sending an email from mail: %{public}@, delivery status: %ld", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully sent message", (uint8_t *)&v8, 2u);
    }
  }

}

- (void)_updateAlarmUpdatedMessages:(id)a3 sendLaterDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 134218242;
    v30 = objc_msgSend(v6, "count");
    v31 = 2114;
    v32 = v7;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Schedule %lu messages for %{public}@", (uint8_t *)&v29, 0x16u);
  }

  -[EDSendLaterUpdateController nextAlarmDate](self, "nextAlarmDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 138543362;
    v30 = (uint64_t)v12;
    _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Updated start date: %{public}@", (uint8_t *)&v29, 0xCu);
  }

  -[EDSendLaterUpdateController sendLaterQueryCreator](self, "sendLaterQueryCreator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "queryWithStartDate:endDate:", v12, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDSendLaterUpdateController messagePersistence](self, "messagePersistence");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "persistedMessagesMatchingQuery:limit:", v15, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(v17, "count");
    v29 = 134217984;
    v30 = v19;
    _os_log_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_DEFAULT, "Queried messages count: %lu", (uint8_t *)&v29, 0xCu);
  }

  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v17, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendLaterDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }
  +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 138543362;
    v30 = (uint64_t)v21;
    _os_log_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEFAULT, "Earliest message send later date: %{public}@", (uint8_t *)&v29, 0xCu);
  }

  v23 = objc_msgSend(v6, "count");
  if (v7 && v23)
  {
    +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138543618;
      v30 = (uint64_t)v21;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_1D2F2C000, v24, OS_LOG_TYPE_DEFAULT, "Current earliest message send later date:%{public}@ and send later date:%{public}@", (uint8_t *)&v29, 0x16u);
    }

    if (!v21 || objc_msgSend(v7, "ef_isEarlierThanDate:", v21))
    {
      v25 = v6;

      v26 = v7;
      v17 = v25;
      v21 = v26;
    }
  }
  -[EDSendLaterUpdateController xpcAlarm](self, "xpcAlarm");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNextFireDate:isUserVisible:", v21, 1);

  +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 138543362;
    v30 = (uint64_t)v21;
    _os_log_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_DEFAULT, "After scheduling xpc alarm at: %{public}@", (uint8_t *)&v29, 0xCu);
  }

  -[EDSendLaterUpdateController setNextAlarmDate:](self, "setNextAlarmDate:", v21);
}

- (void)resetSendLaterAlarmIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[EDSendLaterUpdateController alarmDateProvider](self, "alarmDateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Next alarm date from EDDefaultSendLaterUpdateControllerAlarmDateProvider: %{public}@.", (uint8_t *)&v8, 0xCu);
  }

  if (v4)
  {
    +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Reset send later next alarm to %{public}@.", (uint8_t *)&v8, 0xCu);
    }

    -[EDSendLaterUpdateController xpcAlarm](self, "xpcAlarm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNextFireDate:isUserVisible:", v4, 1);

  }
}

- (void)persistenceDidUpdateSendLaterDate:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v7;
  id v8;
  NSObject *alarmQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  alarmQueue = self->_alarmQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__EDSendLaterUpdateController_persistenceDidUpdateSendLaterDate_messages_generationWindow___block_invoke;
  block[3] = &unk_1E949B390;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(alarmQueue, block);

}

void __91__EDSendLaterUpdateController_persistenceDidUpdateSendLaterDate_messages_generationWindow___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "nextAlarmDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (uint64_t)v2;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "After persistence updated. Current next alarm date: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  if (!v2 || !*(_QWORD *)(a1 + 40) || (objc_msgSend(v2, "isEqualToDate:") & 1) == 0)
  {
    +[EDSendLaterUpdateController log](EDSendLaterUpdateController, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 48), "count");
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 134218242;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Send later alarm needs update for %lu messages. New date:%{public}@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_updateAlarmUpdatedMessages:sendLaterDate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }

}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDOutgoingMessageRepository)outgoingRepository
{
  return self->_outgoingRepository;
}

- (EDMessageChangeHookResponder)hookResponder
{
  return self->_hookResponder;
}

- (EDQueryCreator)sendLaterQueryCreator
{
  return self->_sendLaterQueryCreator;
}

- (void)setSendLaterQueryCreator:(id)a3
{
  objc_storeStrong((id *)&self->_sendLaterQueryCreator, a3);
}

- (EDSendLaterUpdateControllerAlarmDateProvider)alarmDateProvider
{
  return self->_alarmDateProvider;
}

- (EFXPCAlarm)xpcAlarm
{
  return self->_xpcAlarm;
}

- (void)setXpcAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_xpcAlarm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcAlarm, 0);
  objc_storeStrong((id *)&self->_alarmDateProvider, 0);
  objc_storeStrong((id *)&self->_sendLaterQueryCreator, 0);
  objc_storeStrong((id *)&self->_hookResponder, 0);
  objc_storeStrong((id *)&self->_outgoingRepository, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_alarmQueue, 0);
}

@end
