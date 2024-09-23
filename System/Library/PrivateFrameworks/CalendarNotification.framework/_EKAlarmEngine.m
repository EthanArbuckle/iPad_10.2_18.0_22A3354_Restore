@implementation _EKAlarmEngine

- (void)handleDarwinNotification:(id)a3
{
  void *v4;
  int v5;
  id v6;
  int v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE13D58]))
  {
    -[_EKAlarmEngine _databaseChanged](self, "_databaseChanged");
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE13EB8]))
  {
    -[_EKAlarmEngine _syncDidStart](self, "_syncDidStart");
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE13EC0]))
  {
    -[_EKAlarmEngine _syncDidEnd](self, "_syncDidEnd");
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE14080]))
  {
    -[_EKAlarmEngine _timeDidChangeSignificantly](self, "_timeDidChangeSignificantly");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC74C8], "stateChangedNotificationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "isEqualToString:", v4);

    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDC74C8]);
      v7 = objc_msgSend(v6, "dataIsAccessible");

      if (v7)
        -[_EKAlarmEngine _protectedDataDidBecomeAvailable](self, "_protectedDataDidBecomeAvailable");
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobilecal.preference.notification.calendarsExcludedFromNotifications")))
    {
      -[_EKAlarmEngine _calendarNotificationSettingChanged](self, "_calendarNotificationSettingChanged");
    }
    else if (objc_msgSend(v8, "isEqual:", CFSTR("com.apple.calendar.defaultAlarmChangedNotification")))
    {
      -[_EKAlarmEngine _globalAlarmPreferencesChanged](self, "_globalAlarmPreferencesChanged");
    }
  }

}

+ (id)requestedDarwinNotifications
{
  void *v2;
  void *v3;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC74C8], "stateChangedNotificationName", *MEMORY[0x24BE13D58], *MEMORY[0x24BE13EB8], *MEMORY[0x24BE13EC0], *MEMORY[0x24BE14080]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[4] = v2;
  v5[5] = CFSTR("com.apple.mobilecal.preference.notification.calendarsExcludedFromNotifications");
  v5[6] = CFSTR("com.apple.calendar.defaultAlarmChangedNotification");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (_EKAlarmEngine)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1)
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_17);
  return (_EKAlarmEngine *)(id)sharedInstance___shared;
}

- (_EKAlarmEngine)init
{
  _EKAlarmEngine *v2;
  EKTimedEventStorePurger *v3;
  EKTimedEventStorePurger *timedEventStorePurger;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_EKAlarmEngine;
  v2 = -[_EKAlarmEngine init](&v6, sel_init);
  if (v2)
  {
    v3 = (EKTimedEventStorePurger *)objc_alloc_init(MEMORY[0x24BDC7550]);
    timedEventStorePurger = v2->_timedEventStorePurger;
    v2->_timedEventStorePurger = v3;

    -[EKTimedEventStorePurger setTimeout:](v2->_timedEventStorePurger, "setTimeout:", 4.0);
    -[EKTimedEventStorePurger setPurgingAllowed:](v2->_timedEventStorePurger, "setPurgingAllowed:", 1);
    -[EKTimedEventStorePurger setCreationBlock:](v2->_timedEventStorePurger, "setCreationBlock:", &__block_literal_global_14);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;
  uint8_t buf[16];

  -[_EKAlarmEngine _killSyncTimer](self, "_killSyncTimer");
  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Stopping", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BE14088], 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[_EKAlarmEngine _killTimer](self, "_killTimer");

  v6.receiver = self;
  v6.super_class = (Class)_EKAlarmEngine;
  -[_EKAlarmEngine dealloc](&v6, sel_dealloc);
}

- (void)start
{
  void *v3;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *dispatchQueue;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _EKAlarmEngine *v11;

  +[EKSideTableContext sideTableContext](EKSideTableContext, "sideTableContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __23___EKAlarmEngine_start__block_invoke;
  v9[3] = &unk_24D484760;
  v10 = v3;
  v11 = self;
  v8 = v3;
  objc_msgSend(v8, "performBlockAndWait:", v9);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.calendar.notification.alarmengine", v4);
  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__timeZoneChanged_, *MEMORY[0x24BE14088], 0);

}

- (void)didRegisterForAlarms
{
  NSObject *v3;
  NSObject *dispatchQueue;
  _QWORD block[5];
  uint8_t buf[16];

  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Alarm engine handling did register for alarms message", buf, 2u);
  }

  -[_EKAlarmEngine _updateWithForceForAlarmTable:](self, "_updateWithForceForAlarmTable:", 0);
  if (-[_EKAlarmEngine _isDataProtected](self, "_isDataProtected"))
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38___EKAlarmEngine_didRegisterForAlarms__block_invoke;
    block[3] = &unk_24D484738;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)receivedAlarmNamed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *dispatchQueue;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  objc_msgSend(v4, "stringWithUTF8String:", "com.apple.calaccessd.alarmEngine.alarm.name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v8 = (void *)xpc_copy_event();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(xpc_dictionary_get_date(v8, "com.apple.calaccessd.alarmEngine.alarm.context.date") / 0x3B9ACA00uLL));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x2199F22AC](v8);
    +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = v10;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Received alarm notification. XPC Alarm context: %s. XPC Alarm context date: %@.", buf, 0x16u);
    }

    free(v10);
    dispatchQueue = self->_dispatchQueue;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __37___EKAlarmEngine_receivedAlarmNamed___block_invoke;
    v14[3] = &unk_24D484760;
    v14[4] = self;
    v15 = v9;
    v13 = v9;
    dispatch_async(dispatchQueue, v14);

  }
}

- (void)_protectedDataDidBecomeAvailable
{
  NSObject *v3;
  NSObject *dispatchQueue;
  _QWORD block[5];
  uint8_t buf[16];

  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Protected data now available.", buf, 2u);
  }

  if (self->_pendingChanges)
  {
    self->_pendingChanges = 0;
    -[_EKAlarmEngine _updateWithForceForAlarmTable:](self, "_updateWithForceForAlarmTable:", 1);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50___EKAlarmEngine__protectedDataDidBecomeAvailable__block_invoke;
    block[3] = &unk_24D484738;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (BOOL)_isDataProtected
{
  id v2;
  char v3;

  v2 = objc_alloc_init(MEMORY[0x24BDC74C8]);
  v3 = objc_msgSend(v2, "dataIsAccessible") ^ 1;

  return v3;
}

- (id)_eventStore
{
  return (id)-[EKTimedEventStorePurger acquireCachedEventStoreOrCreate:](self->_timedEventStorePurger, "acquireCachedEventStoreOrCreate:", 1);
}

- (void)_updateWithForceForAlarmTable:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *dispatchQueue;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[16];

  v5 = (void *)os_transaction_create();
  if (-[_EKAlarmEngine _isDataProtected](self, "_isDataProtected"))
  {
    +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Data protection enabled. Waiting for unlock before updating.";
LABEL_7:
      _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else
  {
    if (!self->_syncTimer)
    {
      dispatchQueue = self->_dispatchQueue;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __48___EKAlarmEngine__updateWithForceForAlarmTable___block_invoke;
      v9[3] = &unk_24D484FA8;
      v9[4] = self;
      v10 = a3;
      dispatch_async(dispatchQueue, v9);
      goto LABEL_9;
    }
    +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Sync running. Waiting for it to finish before updating.";
      goto LABEL_7;
    }
  }

  self->_pendingChanges = 1;
  self->_shouldUpdateWithForceForAlarmTable = a3;
LABEL_9:

}

- (void)_databaseChanged
{
  NSObject *v3;
  uint8_t v4[16];

  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Database changed.", v4, 2u);
  }

  -[_EKAlarmEngine _updateWithForceForAlarmTable:](self, "_updateWithForceForAlarmTable:", 0);
}

- (BOOL)_haveAlarmsChanged:(id)a3
{
  id v4;
  CADSequenceToken *lastDBSequenceToken;
  NSObject *v6;
  const char *v7;
  BOOL v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lastDBSequenceToken = self->_lastDBSequenceToken;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37___EKAlarmEngine__haveAlarmsChanged___block_invoke;
  v10[3] = &unk_24D485098;
  v10[4] = &v11;
  objc_msgSend(v4, "changesSinceSequenceToken:completion:", lastDBSequenceToken, v10);
  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v12 + 24))
      v7 = "YES";
    else
      v7 = "NO";
    *(_DWORD *)buf = 136315138;
    v16 = v7;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Alarms may have changed: %s", buf, 0xCu);
  }

  v8 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)_timeZoneChanged:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Time zone changed.", v5, 2u);
  }

  -[_EKAlarmEngine _updateWithForceForAlarmTable:](self, "_updateWithForceForAlarmTable:", 1);
}

- (void)_simulatedOffsetChanged:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Simulated offset changed.", v5, 2u);
  }

  -[_EKAlarmEngine _updateWithForceForAlarmTable:](self, "_updateWithForceForAlarmTable:", 1);
}

- (void)_storeAlarms:(id)a3 nextScheduleLimit:(id)a4 eventStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _EKAlarmEngine *v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[EKSideTableContext sideTableContext](EKSideTableContext, "sideTableContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __60___EKAlarmEngine__storeAlarms_nextScheduleLimit_eventStore___block_invoke;
    v20[3] = &unk_24D4850C0;
    v21 = v8;
    v22 = v11;
    v23 = self;
    v24 = v10;
    v25 = v9;
    objc_msgSend(v22, "performBlockAndWait:", v20);

  }
  else
  {
    +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_EKAlarmEngine _storeAlarms:nextScheduleLimit:eventStore:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
}

- (BOOL)_populateAlarmTable:(id)a3
{
  id v4;
  _BOOL4 populating;
  NSDate *v6;
  NSDate *populateStart;
  NSObject *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  int v19;
  void *v20;
  id v21;
  const void *v22;
  const void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  id v28;
  id *p_lastCheckpoint;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CFPropertyListRef v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  _BOOL4 v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  const __CFString *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  populating = self->_populating;
  if (!self->_populating)
  {
    self->_populating = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    populateStart = self->_populateStart;
    self->_populateStart = v6;

    +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Populating alarm table", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronize");

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (const __CFString *)*MEMORY[0x24BE141C0];
    objc_msgSend(v10, "persistentDomainForName:", *MEMORY[0x24BE141C0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = v12;
    if (v12)
    {
      v13 = *MEMORY[0x24BE14090];
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BE14090]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v69 = v20;
          v21 = v20;
          _os_log_impl(&dword_215D9B000, v17, OS_LOG_TYPE_DEFAULT, "Time Zone Support pref is suspect (%@)", buf, 0xCu);

        }
      }
      else
      {
        v60 = v11;
        v15 = populating;
        objc_msgSend(v12, "objectForKey:", v13);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = v4;
        if (v16)
          v19 = -[NSObject BOOLValue](v16, "BOOLValue");
        else
          v19 = 1;
        v22 = (const void *)CalCopyTimeZone();
        v23 = (const void *)CalCopySystemTimeZone();
        +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = (void *)MEMORY[0x2199F1D90](v22);
          v58 = v25;
          v26 = (void *)MEMORY[0x2199F1D90](v23);
          v27 = CFSTR("OFF");
          *(_DWORD *)buf = 138412802;
          v69 = v25;
          v70 = 2112;
          if (!v19)
            v27 = CFSTR("ON");
          v71 = v26;
          v72 = 2112;
          v73 = v27;
          v28 = v26;
          _os_log_impl(&dword_215D9B000, v24, OS_LOG_TYPE_DEFAULT, "Calendar TZ = %@; System TZ = %@; Time Zone Support = %@",
            buf,
            0x20u);

        }
        CFRelease(v22);
        CFRelease(v23);
        v4 = v18;
        populating = v15;
        v11 = v60;
        v12 = v62;
      }

    }
    p_lastCheckpoint = (id *)&self->_lastCheckpoint;
    if (!self->_lastCheckpoint)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = *p_lastCheckpoint;
      *p_lastCheckpoint = (id)v30;

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*p_lastCheckpoint, "CalIsAfterDate:", v32))
      objc_storeStrong((id *)&self->_lastCheckpoint, v32);
    objc_msgSend(v32, "dateByAddingTimeInterval:", -259200.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "CalIsAfterDate:", *p_lastCheckpoint))
      objc_storeStrong((id *)&self->_lastCheckpoint, v33);
    objc_msgSend(v32, "dateByAddingTimeInterval:", 1296000.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*p_lastCheckpoint, "CalIsBeforeDate:", v34))
    {
      v57 = v32;
      v59 = populating;
      +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        -[_EKAlarmEngine _dateFormatter](self, "_dateFormatter");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringFromDate:", self->_lastCheckpoint);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[_EKAlarmEngine _dateFormatter](self, "_dateFormatter");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringFromDate:", v34);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v69 = v37;
        v70 = 2112;
        v71 = v39;
        _os_log_impl(&dword_215D9B000, v35, OS_LOG_TYPE_DEFAULT, "Searching for alarms between [%@] and [%@]", buf, 0x16u);

      }
      v56 = v33;

      CFPreferencesAppSynchronize(v11);
      v40 = CFPreferencesCopyAppValue(CFSTR("CalendarsExcludedFromNotifications"), v11);
      if (v40)
      {
        v41 = (void *)v40;
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v42 = 0;
      }
      v61 = v4;
      objc_msgSend(v4, "calendarsForEntityType:", 0, v34);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v43, "count"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v45 = v43;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v64 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
            objc_msgSend(v50, "calendarIdentifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v42, "containsObject:", v51);

            if ((v52 & 1) == 0)
              objc_msgSend(v44, "addObject:", v50);
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
        }
        while (v47);
      }

      v4 = v61;
      objc_msgSend(v61, "alarmOccurrencesFromAlarmCache");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v55;
      -[_EKAlarmEngine _storeAlarms:nextScheduleLimit:eventStore:](self, "_storeAlarms:nextScheduleLimit:eventStore:", v53, v55, v61);
      -[_EKAlarmEngine _populateFinished](self, "_populateFinished");

      populating = v59;
      v12 = v62;
      v33 = v56;
      v32 = v57;
    }
    else
    {
      -[_EKAlarmEngine _populateFinished](self, "_populateFinished");
    }

  }
  return !populating;
}

- (void)_populateFinished
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *dispatchQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  self->_populating = 0;
  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", self->_populateStart);
    *(_DWORD *)buf = 134217984;
    v10 = v5;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Alarm Table populated in %f", buf, 0xCu);

  }
  if (self->_needsAlarmTablePopulation)
  {
    self->_needsAlarmTablePopulation = 0;
    +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Retrying alarm table population due to previous request to do so.", buf, 2u);
    }

    -[_EKAlarmEngine _updateWithForceForAlarmTable:](self, "_updateWithForceForAlarmTable:", 1);
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35___EKAlarmEngine__populateFinished__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_killTimer
{
  NSDate *nextFireDate;

  nextFireDate = self->_nextFireDate;
  self->_nextFireDate = 0;

}

- (id)_dateFormatter
{
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    -[NSDateFormatter setDateStyle:](self->_dateFormatter, "setDateStyle:", 3);
    -[NSDateFormatter setTimeStyle:](self->_dateFormatter, "setTimeStyle:", 3);
    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (void)_rescheduleTimer
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSDate *v7;
  NSDate *nextFireDate;
  NSObject *v9;
  NSDate *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  _QWORD v14[4];
  NSObject *v15;
  _EKAlarmEngine *v16;
  uint8_t *v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t v24[4];
  const char *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Rescheduling timer", buf, 2u);
  }

  -[_EKAlarmEngine _killTimer](self, "_killTimer");
  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  +[EKSideTableContext sideTableContext](EKSideTableContext, "sideTableContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __34___EKAlarmEngine__rescheduleTimer__block_invoke;
  v14[3] = &unk_24D4847B0;
  v17 = buf;
  v5 = v4;
  v15 = v5;
  v16 = self;
  -[NSObject performBlockAndWait:](v5, "performBlockAndWait:", v14);
  v6 = (void *)*((_QWORD *)v19 + 5);
  if (v6)
  {
    v7 = (NSDate *)objc_msgSend(v6, "copy");
    nextFireDate = self->_nextFireDate;
    self->_nextFireDate = v7;

    +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_nextFireDate;
      *(_DWORD *)v24 = 138412290;
      v25 = (const char *)v10;
      _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Set _nextFireDate to [%@]", v24, 0xCu);
    }

    objc_msgSend(*((id *)v19 + 5), "dateBySubtractingCalSimulatedOffset");
    v11 = objc_claimAutoreleasedReturnValue();
    +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (const char *)*((_QWORD *)v19 + 5);
      *(_DWORD *)v24 = 138412546;
      v25 = v13;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_215D9B000, v12, OS_LOG_TYPE_DEFAULT, "Adjusted fire date from [%@] to [%@]", v24, 0x16u);
    }

    -[_EKAlarmEngine _installTimerWithFireDate:](self, "_installTimerWithFireDate:", v11);
  }
  else
  {
    +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 136315394;
      v25 = "-[_EKAlarmEngine _rescheduleTimer]";
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "%s - refire date was nil and a new timer won't be scheduled, context was %@", v24, 0x16u);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)_installTimerWithFireDate:(id)a3
{
  id v3;
  NSObject *v4;
  double v5;
  unint64_t v6;
  xpc_object_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v3;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Installing timer with fire date: [%@]", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(v3, "timeIntervalSinceNow");
  v6 = (unint64_t)((ceil(v5) + (double)time(0)) * 1000000000.0);
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_date(v7, (const char *)*MEMORY[0x24BE14018], v6);
  xpc_dictionary_set_date(v7, "com.apple.calaccessd.alarmEngine.alarm.context.date", v6);
  xpc_set_event();
  if (_installTimerWithFireDate__onceToken != -1)
    dispatch_once(&_installTimerWithFireDate__onceToken, &__block_literal_global_48);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(v6 / 0x3B9ACA00));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_installTimerWithFireDate__dateFormatter, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Formatted scheduled alarm trigger date: %@.", (uint8_t *)&v13, 0xCu);
  }

  v11 = (void *)MEMORY[0x2199F22AC](v7);
  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = v11;
    _os_log_impl(&dword_215D9B000, v12, OS_LOG_TYPE_DEFAULT, "Scheduled XPC alarm event: %s.", (uint8_t *)&v13, 0xCu);
  }

  free(v11);
}

- (void)_notifyAlarmsFired:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  _EKAlarmEngine *v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __37___EKAlarmEngine__notifyAlarmsFired___block_invoke;
    v5[3] = &unk_24D484760;
    v6 = v4;
    v7 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

- (void)_timerFired
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSDate *nextFireDate;
  void *v12;
  id v13;
  id v14;
  NSDate *v15;
  _QWORD v16[4];
  id v17;
  _EKAlarmEngine *v18;
  id v19;
  uint8_t buf[4];
  NSDate *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)os_transaction_create();
  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Timer Fired.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", 30.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -60.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "CalIsAfterDate:", self->_nextFireDate))
  {
    objc_storeStrong((id *)&self->_nextFireDate, v8);
    +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Fire date suspiciously old. Resetting to one minute before now.", buf, 2u);
    }

  }
  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    nextFireDate = self->_nextFireDate;
    *(_DWORD *)buf = 138412546;
    v21 = nextFireDate;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Looking for alarms between %@ and %@", buf, 0x16u);
  }

  +[EKSideTableContext sideTableContext](EKSideTableContext, "sideTableContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __29___EKAlarmEngine__timerFired__block_invoke;
  v16[3] = &unk_24D484800;
  v17 = v12;
  v18 = self;
  v19 = v6;
  v13 = v6;
  v14 = v12;
  objc_msgSend(v14, "performBlockAndWait:", v16);
  v15 = self->_nextFireDate;
  self->_nextFireDate = 0;

  -[_EKAlarmEngine _rescheduleTimer](self, "_rescheduleTimer");
}

- (id)_alertInfoAlarmIDFromSideAlarm:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "externalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "externalID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "alarmID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v7, "intValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v7;
  }

  return v5;
}

- (id)_alertInfoAlarmIDFromEKAlarm:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "externalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "externalID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v7, "rowID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v7;
  }

  return v5;
}

- (BOOL)_isAlarmAcknowledgedWithAcknowledgedDate:(id)a3 fireDate:(id)a4
{
  id v5;
  id v6;
  double v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (v5)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:", v6);
      if (v7 < 0.0)
        v7 = -v7;
      v8 = v7 < 300.0;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = v5 != 0;
  }

  return v8;
}

- (void)_resetSyncTimer
{
  NSTimer *syncTimer;
  id v4;
  void *v5;
  NSTimer *v6;
  NSTimer *v7;
  id v8;

  syncTimer = self->_syncTimer;
  if (syncTimer)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 240.0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSTimer setFireDate:](syncTimer, "setFireDate:");
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BDBCF40]);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 240.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSTimer *)objc_msgSend(v4, "initWithFireDate:interval:target:selector:userInfo:repeats:", v5, self, sel__syncTimerFired_, 0, 0, 0.0);
    v7 = self->_syncTimer;
    self->_syncTimer = v6;

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTimer:forMode:", self->_syncTimer, *MEMORY[0x24BDBCB80]);
  }

}

- (void)_killSyncTimer
{
  NSTimer *syncTimer;

  -[NSTimer invalidate](self->_syncTimer, "invalidate");
  syncTimer = self->_syncTimer;
  self->_syncTimer = 0;

}

- (void)_syncTimerFired:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Sync timer fired.", v5, 2u);
  }

  -[_EKAlarmEngine _syncDidEnd](self, "_syncDidEnd");
}

- (void)_syncDidStart
{
  NSObject *v3;
  uint8_t v4[16];

  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Sync started. Suppressing updates while it runs.", v4, 2u);
  }

  -[_EKAlarmEngine _resetSyncTimer](self, "_resetSyncTimer");
}

- (void)_syncDidEnd
{
  NSObject *v3;
  uint8_t v4[16];

  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Sync done.", v4, 2u);
  }

  -[_EKAlarmEngine _killSyncTimer](self, "_killSyncTimer");
  if (self->_pendingChanges)
  {
    self->_pendingChanges = 0;
    -[_EKAlarmEngine _updateWithForceForAlarmTable:](self, "_updateWithForceForAlarmTable:", self->_shouldUpdateWithForceForAlarmTable);
  }
}

- (void)_timeDidChangeSignificantly
{
  NSObject *v3;
  NSObject *dispatchQueue;
  _QWORD block[5];
  uint8_t buf[16];

  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Significant time change.", buf, 2u);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45___EKAlarmEngine__timeDidChangeSignificantly__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
  -[_EKAlarmEngine _updateWithForceForAlarmTable:](self, "_updateWithForceForAlarmTable:", 0);
}

- (void)_calendarNotificationSettingChanged
{
  NSObject *v3;
  uint8_t v4[16];

  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Per-calendar notification suppression setting changed.", v4, 2u);
  }

  -[_EKAlarmEngine _updateWithForceForAlarmTable:](self, "_updateWithForceForAlarmTable:", 1);
}

- (void)_globalAlarmPreferencesChanged
{
  NSObject *v3;
  uint8_t v4[16];

  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "_globalAlarmPreferencesChanged called", v4, 2u);
  }

  -[_EKAlarmEngine _updateWithForceForAlarmTable:](self, "_updateWithForceForAlarmTable:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedEventStorePurger, 0);
  objc_storeStrong((id *)&self->_tomorrow, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_syncTimer, 0);
  objc_storeStrong((id *)&self->_populateStart, 0);
  objc_storeStrong((id *)&self->_lastCheckpoint, 0);
  objc_storeStrong((id *)&self->_nextFireDate, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_lastDBSequenceToken, 0);
}

- (void)_storeAlarms:(uint64_t)a3 nextScheduleLimit:(uint64_t)a4 eventStore:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a1, a3, "%s - EKSideTableContext failed to be created, nothing will be stored", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
