@implementation _DKDeviceActivityLevelMonitor

- (void)updatePerformanceThrottleStatusWithLevel:(unint64_t)a3
{
  _CDLocalContext *context;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  _CDLocalContext *v18;
  void *v19;
  void *v20;
  int v21;
  _CDLocalContext *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  _DWORD v30[2];
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  context = self->_context;
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (!v10)
  {
LABEL_5:
    v17 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BE1B180], "batteryAdapterIsWirelessKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  -[_CDLocalContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", self->_keyPathForDeviceToppingOff);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  if ((unint64_t)(v15 - 5) <= 1)
  {
    v16 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30[0]) = 0;
      _os_log_impl(&dword_219056000, v16, OS_LOG_TYPE_INFO, "Device Topping Off. Reduce perf", (uint8_t *)v30, 2u);
    }
    goto LABEL_5;
  }
  v17 = v13 ^ 1;
LABEL_7:
  v18 = self->_context;
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBacklightOnStatus");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDLocalContext objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  v22 = self->_context;
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCarplayConnectedStatus");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDLocalContext objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  if (a3)
    v26 = 1;
  else
    v26 = v17;
  v27 = (v26 | v21 | v25) ^ 1u;
  v28 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
  {
    v30[0] = 67110144;
    v30[1] = a3 != 0;
    v31 = 1024;
    v32 = v17;
    v33 = 1024;
    v34 = v21;
    v35 = 1024;
    v36 = v25;
    v37 = 1024;
    v38 = v27;
    _os_log_impl(&dword_219056000, v28, OS_LOG_TYPE_INFO, "Active: %u | Plugged In : %u | Screen On: %u | CarPlay Active: %u | LIMITS IMPOSED: %u", (uint8_t *)v30, 0x20u);
  }
  if (!self->_limitsInitialized || self->_limitsImposed != (_DWORD)v27)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v29, self->_keyPathForReducedPerfStateStatus);

    self->_limitsImposed = v27;
    self->_limitsInitialized = 1;
  }

}

- (unint64_t)lastInUseStatus
{
  return self->_lastInUseStatus;
}

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  v2 = os_log_create("com.apple.duetknowledged", "deviceactivitymonitor");
  v3 = (void *)_log;
  _log = (uint64_t)v2;

}

- (void)dealloc
{
  objc_super v3;

  -[_DKDeviceActivityLevelMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKDeviceActivityLevelMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("DeviceActivityLevel");
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (id)_eventWithState:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE1AFF0], "withValue:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "deviceActivityLevelStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventWithStream:startDate:endDate:value:", v5, v6, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setLastActivityDate:(id)a3
{
  id v5;
  void *v6;
  double v7;
  NSObject *v8;
  NSDate *v9;
  void *v10;
  double v11;
  uint64_t v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  double v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  if (v7 <= 0.0)
  {
    v9 = self->_lastSetActiveDate;
    v10 = v9;
    if (!v9 || (-[NSDate timeIntervalSinceDate:](v9, "timeIntervalSinceDate:", v6), v11 > 0.0))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    objc_msgSend(v10, "timeIntervalSinceDate:", v5);
    if (v13 <= 0.0)
    {
      -[_CDLocalContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", self->_lastUseDate);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (!v15 || (objc_msgSend(v15, "timeIntervalSinceDate:", v6), v17 > 0.0))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
        v18 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v18;
      }
      objc_msgSend(v16, "timeIntervalSinceDate:", v5);
      if (v19 >= 0.01)
      {
        v20 = _log;
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEBUG))
          -[_DKDeviceActivityLevelMonitor setLastActivityDate:].cold.1((uint64_t)v5, (uint64_t)v10, v20);
      }
      else
      {
        -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v5, self->_lastUseDate);
        objc_storeStrong((id *)&self->_lastSetActiveDate, a3);
      }

    }
    else
    {
      v14 = _log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412546;
        v22 = v5;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_219056000, v14, OS_LOG_TYPE_DEFAULT, "New last-set date (%@) is earlier than the previous set date (%@). Keeping newer date.", (uint8_t *)&v21, 0x16u);
      }
    }

  }
  else
  {
    v8 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v5;
      _os_log_impl(&dword_219056000, v8, OS_LOG_TYPE_DEFAULT, "New active date (%@) is in the future. Ignoring.", (uint8_t *)&v21, 0xCu);
    }
  }

}

- (void)start
{
  _CDContextualKeyPath *v3;
  _CDContextualKeyPath *lastUseDate;
  _CDContextualKeyPath *v5;
  _CDContextualKeyPath *inUseStatus;
  _CDLocalContext *v7;
  _CDLocalContext *context;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  _CDContextualKeyPath *v14;
  _CDContextualKeyPath *keyPathForDeviceToppingOff;
  _CDContextualKeyPath *v16;
  _CDContextualKeyPath *keyPathForReducedPerfStateStatus;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _CDContextualKeyPath *v22;
  void *v23;
  void *v24;
  _CDLocalContext *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  OS_dispatch_source *v30;
  OS_dispatch_source *debounceTimer;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BMSource *v39;
  BMSource *bmSource;
  _QWORD v41[5];
  _QWORD handler[5];
  _QWORD block[7];
  uint64_t v44;
  _QWORD v45[5];
  objc_super v46;
  _QWORD v47[5];

  v47[4] = *MEMORY[0x24BDAC8D0];
  v46.receiver = self;
  v46.super_class = (Class)_DKDeviceActivityLevelMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v46, sel_instantMonitorNeedsActivation))
  {
    self->_enabled = 1;
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForLastUseDate");
    v3 = (_CDContextualKeyPath *)objc_claimAutoreleasedReturnValue();
    lastUseDate = self->_lastUseDate;
    self->_lastUseDate = v3;

    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForInUseStatus");
    v5 = (_CDContextualKeyPath *)objc_claimAutoreleasedReturnValue();
    inUseStatus = self->_inUseStatus;
    self->_inUseStatus = v5;

    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v7 = (_CDLocalContext *)objc_claimAutoreleasedReturnValue();
    context = self->_context;
    self->_context = v7;

    -[_CDLocalContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", self->_lastUseDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&self->_lastSetActiveDate, v10);
    if (!v9)

    -[_CDLocalContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", self->_inUseStatus);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");
    if (v12 <= 1)
      v13 = 1;
    else
      v13 = v12;
    self->_lastInUseStatus = v13;

    self->_currentInUseStatus = self->_lastInUseStatus;
    objc_msgSend(MEMORY[0x24BE1B198], "keyPathWithKey:", CFSTR("/charging/topOffCheckpoint"));
    v14 = (_CDContextualKeyPath *)objc_claimAutoreleasedReturnValue();
    keyPathForDeviceToppingOff = self->_keyPathForDeviceToppingOff;
    self->_keyPathForDeviceToppingOff = v14;

    objc_msgSend(MEMORY[0x24BE1B198], "keyPathWithKey:", CFSTR("/system/powerLimitsImposed"));
    v16 = (_CDContextualKeyPath *)objc_claimAutoreleasedReturnValue();
    keyPathForReducedPerfStateStatus = self->_keyPathForReducedPerfStateStatus;
    self->_keyPathForReducedPerfStateStatus = v16;

    v18 = (void *)MEMORY[0x24BE1B1A0];
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBacklightOnStatus");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v19;
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v20;
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCarplayConnectedStatus");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = self->_keyPathForDeviceToppingOff;
    v47[2] = v21;
    v47[3] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicateForChangeAtKeyPaths:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = self->_context;
    v26 = MEMORY[0x24BDAC760];
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __38___DKDeviceActivityLevelMonitor_start__block_invoke;
    v45[3] = &unk_24DA67638;
    v45[4] = self;
    objc_msgSend(MEMORY[0x24BE1B190], "localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.dkc.reducedPerf"), v24, v45);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDLocalContext registerCallback:](v25, "registerCallback:", v27);

    block[6] = 0;
    v44 = 0;
    if (!IOPMGetUserActivityLevel())
    {
      -[_DKMonitor queue](self, "queue");
      v28 = objc_claimAutoreleasedReturnValue();
      block[0] = v26;
      block[1] = 3221225472;
      block[2] = __38___DKDeviceActivityLevelMonitor_start__block_invoke_3;
      block[3] = &unk_24DA672C8;
      block[4] = self;
      block[5] = v44;
      dispatch_sync(v28, block);

    }
    -[_DKMonitor queue](self, "queue");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v29);
    debounceTimer = self->_debounceTimer;
    self->_debounceTimer = v30;

    dispatch_source_set_timer((dispatch_source_t)self->_debounceTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v32 = self->_debounceTimer;
    handler[0] = v26;
    handler[1] = 3221225472;
    handler[2] = __38___DKDeviceActivityLevelMonitor_start__block_invoke_4;
    handler[3] = &unk_24DA66D10;
    handler[4] = self;
    dispatch_source_set_event_handler(v32, handler);
    dispatch_resume((dispatch_object_t)self->_debounceTimer);
    v33 = (const char *)objc_msgSend(CFSTR("com.apple.coreaudio.borealisTrigger"), "UTF8String");
    -[_DKMonitor queue](self, "queue");
    v34 = objc_claimAutoreleasedReturnValue();
    v41[0] = v26;
    v41[1] = 3221225472;
    v41[2] = __38___DKDeviceActivityLevelMonitor_start__block_invoke_5;
    v41[3] = &unk_24DA670E8;
    v41[4] = self;
    notify_register_dispatch(v33, &self->_siriToken, v34, v41);

    -[_DKMonitor queue](self, "queue");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    self->_userActivityNotificationHandle = IOPMScheduleUserActivityLevelNotificationWithTimeout();

    BiomeLibrary();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "Activity");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "Level");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "source");
    v39 = (BMSource *)objc_claimAutoreleasedReturnValue();
    bmSource = self->_bmSource;
    self->_bmSource = v39;

  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKDeviceActivityLevelMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKDeviceActivityLevelMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  int siriToken;

  if (self->_userActivityNotificationHandle)
  {
    IOPMUnregisterNotification();
    self->_userActivityNotificationHandle = 0;
  }
  siriToken = self->_siriToken;
  if (siriToken)
  {
    notify_cancel(siriToken);
    self->_siriToken = 0;
  }
  self->_enabled = 0;
  self->_initialized = 0;
}

- (void)handleUserActivity:(int)a3
{
  void *v4;
  uint64_t state64;

  state64 = 0;
  if (!notify_get_state(a3, &state64))
  {
    -[_DKDeviceActivityLevelMonitor updateActivityInUseState:](self, "updateActivityInUseState:", state64 == 0);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKDeviceActivityLevelMonitor setLastActivityDate:](self, "setLastActivityDate:", v4);

  }
}

- (void)updateActivityInUseState:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if (self->_enabled && (!self->_initialized || self->_lastInUseStatus != a3))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v5, self->_inUseStatus);

    self->_lastInUseStatus = a3;
    self->_initialized = 1;
    +[_DKDeviceActivityLevelMonitor _eventWithState:](_DKDeviceActivityLevelMonitor, "_eventWithState:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v6, 1);

    v7 = objc_alloc(MEMORY[0x24BE0C268]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "initWithInUseStatus:", v8);

    -[BMSource sendEvent:](self->_bmSource, "sendEvent:", v9);
  }
}

- (void)updateActivityDateAndInUseState:(unint64_t)a3
{
  char v3;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v3 = a3;
  -[_DKDeviceActivityLevelMonitor updateActivityInUseState:](self, "updateActivityInUseState:");
  -[_DKDeviceActivityLevelMonitor updatePerformanceThrottleStatusWithLevel:](self, "updatePerformanceThrottleStatusWithLevel:", self->_lastInUseStatus);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v5;
  if ((v3 & 0xC) != 0)
  {
    -[_DKDeviceActivityLevelMonitor setLastActivityDate:](self, "setLastActivityDate:", v5);
  }
  else
  {
    v6 = CACurrentMediaTime();
    BKSHIDServicesLastUserEventTime();
    objc_msgSend(v9, "dateByAddingTimeInterval:", -(v6 - v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKDeviceActivityLevelMonitor setLastActivityDate:](self, "setLastActivityDate:", v8);

  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void)setLastInUseStatus:(unint64_t)a3
{
  self->_lastInUseStatus = a3;
}

- (unint64_t)currentInUseStatus
{
  return self->_currentInUseStatus;
}

- (void)setCurrentInUseStatus:(unint64_t)a3
{
  self->_currentInUseStatus = a3;
}

- (NSDate)lastSetActiveDate
{
  return self->_lastSetActiveDate;
}

- (void)setLastSetActiveDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSetActiveDate, a3);
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (_CDContextualKeyPath)lastUseDate
{
  return self->_lastUseDate;
}

- (void)setLastUseDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUseDate, a3);
}

- (_CDContextualKeyPath)inUseStatus
{
  return self->_inUseStatus;
}

- (void)setInUseStatus:(id)a3
{
  objc_storeStrong((id *)&self->_inUseStatus, a3);
}

- (OS_dispatch_source)debounceTimer
{
  return self->_debounceTimer;
}

- (void)setDebounceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_debounceTimer, a3);
}

- (unint64_t)userActivityNotificationHandle
{
  return self->_userActivityNotificationHandle;
}

- (void)setUserActivityNotificationHandle:(unint64_t)a3
{
  self->_userActivityNotificationHandle = a3;
}

- (int)siriToken
{
  return self->_siriToken;
}

- (void)setSiriToken:(int)a3
{
  self->_siriToken = a3;
}

- (BOOL)limitsImposed
{
  return self->_limitsImposed;
}

- (void)setLimitsImposed:(BOOL)a3
{
  self->_limitsImposed = a3;
}

- (BOOL)limitsInitialized
{
  return self->_limitsInitialized;
}

- (void)setLimitsInitialized:(BOOL)a3
{
  self->_limitsInitialized = a3;
}

- (_CDContextualKeyPath)keyPathForReducedPerfStateStatus
{
  return self->_keyPathForReducedPerfStateStatus;
}

- (void)setKeyPathForReducedPerfStateStatus:(id)a3
{
  objc_storeStrong((id *)&self->_keyPathForReducedPerfStateStatus, a3);
}

- (_CDContextualKeyPath)keyPathForDeviceToppingOff
{
  return self->_keyPathForDeviceToppingOff;
}

- (void)setKeyPathForDeviceToppingOff:(id)a3
{
  objc_storeStrong((id *)&self->_keyPathForDeviceToppingOff, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPathForDeviceToppingOff, 0);
  objc_storeStrong((id *)&self->_keyPathForReducedPerfStateStatus, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_inUseStatus, 0);
  objc_storeStrong((id *)&self->_lastUseDate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lastSetActiveDate, 0);
  objc_storeStrong((id *)&self->_bmSource, 0);
}

- (void)setLastActivityDate:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_219056000, log, OS_LOG_TYPE_DEBUG, "New active date (%@) is not sufficiently newer than the previous date (%@).", (uint8_t *)&v3, 0x16u);
}

@end
