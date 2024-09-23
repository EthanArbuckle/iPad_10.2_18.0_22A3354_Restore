@implementation MTAgent

+ (id)agent
{
  if (agent_onceToken != -1)
    dispatch_once(&agent_onceToken, &__block_literal_global_39);
  return (id)agent_agent;
}

void __16__MTAgent_agent__block_invoke()
{
  MTAgent *v0;
  void *v1;

  v0 = objc_alloc_init(MTAgent);
  v1 = (void *)agent_agent;
  agent_agent = (uint64_t)v0;

}

- (MTAgent)init
{
  MTAgent *v2;
  uint64_t v3;
  NSDate *launchDate;
  uint64_t v5;
  NAScheduler *serializer;
  NSObject *v7;
  NAScheduler *v8;
  _QWORD v10[4];
  MTAgent *v11;
  objc_super v12;
  uint8_t buf[4];
  MTAgent *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)MTAgent;
  v2 = -[MTAgent init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    launchDate = v2->_launchDate;
    v2->_launchDate = (NSDate *)v3;

    v2->_isHorseman = MTIsHorseman();
    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTAgent"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v5 = objc_claimAutoreleasedReturnValue();
    serializer = v2->_serializer;
    v2->_serializer = (NAScheduler *)v5;

    MTLogForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v2;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ has launched", buf, 0xCu);
    }

    v8 = v2->_serializer;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __15__MTAgent_init__block_invoke;
    v10[3] = &unk_1E39CB858;
    v11 = v2;
    -[NAScheduler performBlock:](v8, "performBlock:", v10);

  }
  return v2;
}

uint64_t __15__MTAgent_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupNotificationCenter");
  objc_msgSend(*(id *)(a1 + 32), "_setupAlarms");
  objc_msgSend(*(id *)(a1 + 32), "_setupTimers");
  objc_msgSend(*(id *)(a1 + 32), "_setupStopwatches");
  objc_msgSend(*(id *)(a1 + 32), "_setupSessions");
  objc_msgSend(*(id *)(a1 + 32), "_setupInitialListeners");
  return objc_msgSend(*(id *)(a1 + 32), "_setupSync");
}

- (void)_setupNotificationCenter
{
  MTNotificationCenter *v3;
  MTNotificationCenter *notificationCenter;

  v3 = (MTNotificationCenter *)objc_opt_new();
  notificationCenter = self->_notificationCenter;
  self->_notificationCenter = v3;

}

- (void)_setupStopwatches
{
  MTStopwatchServer *v3;
  MTStopwatchServer *stopwatchServer;

  v3 = (MTStopwatchServer *)objc_opt_new();
  stopwatchServer = self->_stopwatchServer;
  self->_stopwatchServer = v3;

}

- (void)_setupAlarms
{
  MTAlarmStorage *v3;
  MTAlarmStorage *alarmStorage;
  MTSleepManager *v5;
  MTSleepManager *sleepManager;
  MTAlarmServer *v7;
  MTAlarmServer *alarmServer;
  MTAlarmScheduler *v9;
  MTAlarmScheduler *alarmScheduler;
  MTAlarmSnapshot *v11;
  MTAlarmSnapshot *alarmSnapshot;
  MTCoreDuetMonitor *v13;
  MTCoreDuetMonitor *coreDuetMonitor;
  MTWidgetProvider *v15;
  MTWidgetProvider *widgetProvider;
  MTAlarmIntentDonor *v17;
  MTAlarmIntentDonor *alarmIntentDonor;
  MTSleepCoordinator *v19;
  MTSleepCoordinator *sleepCoordinator;
  MTSleepModeMonitor *v21;
  MTSleepModeMonitor *sleepModeMonitor;
  MTTimeInBedSessionTracker *v23;
  MTSleepSessionTracker *sleepSessionTracker;
  MTSleepSessionManager *v25;
  MTSleepSessionManager *sleepSessionManager;

  v3 = (MTAlarmStorage *)objc_opt_new();
  alarmStorage = self->_alarmStorage;
  self->_alarmStorage = v3;

  if (MTShouldHandleForEucalyptus())
  {
    v5 = -[MTSleepManager initWithAlarmStorage:]([MTSleepManager alloc], "initWithAlarmStorage:", self->_alarmStorage);
    sleepManager = self->_sleepManager;
    self->_sleepManager = v5;

  }
  v7 = -[MTAlarmServer initWithStorage:]([MTAlarmServer alloc], "initWithStorage:", self->_alarmStorage);
  alarmServer = self->_alarmServer;
  self->_alarmServer = v7;

  v9 = -[MTAlarmScheduler initWithStorage:notificationCenter:]([MTAlarmScheduler alloc], "initWithStorage:notificationCenter:", self->_alarmStorage, self->_notificationCenter);
  alarmScheduler = self->_alarmScheduler;
  self->_alarmScheduler = v9;

  -[MTAlarmStorage setScheduler:](self->_alarmStorage, "setScheduler:", self->_alarmScheduler);
  v11 = -[MTAlarmSnapshot initWithStorage:]([MTAlarmSnapshot alloc], "initWithStorage:", self->_alarmStorage);
  alarmSnapshot = self->_alarmSnapshot;
  self->_alarmSnapshot = v11;

  if (!self->_isHorseman)
  {
    v13 = -[MTCoreDuetMonitor initWithAlarmStorage:]([MTCoreDuetMonitor alloc], "initWithAlarmStorage:", self->_alarmStorage);
    coreDuetMonitor = self->_coreDuetMonitor;
    self->_coreDuetMonitor = v13;

    v15 = -[MTBaseAlarmWidgetProvider initWithAlarmStorage:]([MTWidgetProvider alloc], "initWithAlarmStorage:", self->_alarmStorage);
    widgetProvider = self->_widgetProvider;
    self->_widgetProvider = v15;

    v17 = -[MTAlarmIntentDonor initWithStorage:]([MTAlarmIntentDonor alloc], "initWithStorage:", self->_alarmStorage);
    alarmIntentDonor = self->_alarmIntentDonor;
    self->_alarmIntentDonor = v17;

    if (MTShouldHandleForBedtime())
    {
      v19 = -[MTSleepCoordinator initWithAlarmStorage:]([MTSleepCoordinator alloc], "initWithAlarmStorage:", self->_alarmStorage);
      sleepCoordinator = self->_sleepCoordinator;
      self->_sleepCoordinator = v19;

      v21 = -[MTSleepModeMonitor initWithAlarmStorage:sleepCoordinator:]([MTSleepModeMonitor alloc], "initWithAlarmStorage:sleepCoordinator:", self->_alarmStorage, self->_sleepCoordinator);
      sleepModeMonitor = self->_sleepModeMonitor;
      self->_sleepModeMonitor = v21;

      -[MTSleepCoordinator setSleepModeMonitor:](self->_sleepCoordinator, "setSleepModeMonitor:", self->_sleepModeMonitor);
      v23 = -[MTSleepSessionTracker initWithAlarmStorage:]([MTTimeInBedSessionTracker alloc], "initWithAlarmStorage:", self->_alarmStorage);
      sleepSessionTracker = self->_sleepSessionTracker;
      self->_sleepSessionTracker = &v23->super;

      v25 = -[MTSleepSessionManager initWithAlarmStorage:sleepCoordinator:sleepSessionTracker:]([MTSleepSessionManager alloc], "initWithAlarmStorage:sleepCoordinator:sleepSessionTracker:", self->_alarmStorage, self->_sleepCoordinator, self->_sleepSessionTracker);
      sleepSessionManager = self->_sleepSessionManager;
      self->_sleepSessionManager = v25;

    }
  }
}

- (void)_setupTimers
{
  MTTimerStorage *v3;
  MTTimerStorage *timerStorage;
  MTTimerServer *v5;
  MTTimerServer *timerServer;
  MTTimerScheduler *v7;
  MTTimerScheduler *timerScheduler;
  MTTimerSnapshot *v9;
  MTTimerSnapshot *timerSnapshot;
  MTTimerIntentDonor *v11;
  MTTimerIntentDonor *timerIntentDonor;

  v3 = (MTTimerStorage *)objc_opt_new();
  timerStorage = self->_timerStorage;
  self->_timerStorage = v3;

  v5 = -[MTTimerServer initWithStorage:]([MTTimerServer alloc], "initWithStorage:", self->_timerStorage);
  timerServer = self->_timerServer;
  self->_timerServer = v5;

  v7 = -[MTTimerScheduler initWithStorage:notificationCenter:]([MTTimerScheduler alloc], "initWithStorage:notificationCenter:", self->_timerStorage, self->_notificationCenter);
  timerScheduler = self->_timerScheduler;
  self->_timerScheduler = v7;

  -[MTTimerStorage setScheduler:](self->_timerStorage, "setScheduler:", self->_timerScheduler);
  v9 = -[MTTimerSnapshot initWithStorage:]([MTTimerSnapshot alloc], "initWithStorage:", self->_timerStorage);
  timerSnapshot = self->_timerSnapshot;
  self->_timerSnapshot = v9;

  if (!self->_isHorseman)
  {
    v11 = -[MTTimerIntentDonor initWithStorage:]([MTTimerIntentDonor alloc], "initWithStorage:", self->_timerStorage);
    timerIntentDonor = self->_timerIntentDonor;
    self->_timerIntentDonor = v11;

  }
}

- (void)_setupSessions
{
  _BOOL4 v3;
  NSObject *p_super;
  _BOOL4 v5;
  MTSessionsCoordinator *v6;
  MTSessionServer *v7;
  MTSessionServer *sessionServer;
  int v9;
  MTAgent *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = +[MTSessionsCoordinator supportsSessions](MTSessionsCoordinator, "supportsSessions");
  MTLogForCategory(1);
  p_super = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 138543362;
      v10 = self;
      _os_log_impl(&dword_19AC4E000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ supports sessions, setting up coordinator", (uint8_t *)&v9, 0xCu);
    }

    v6 = -[MTSessionsCoordinator initWithStorage:alarmStorage:]([MTSessionsCoordinator alloc], "initWithStorage:alarmStorage:", self->_timerStorage, self->_alarmStorage);
    p_super = &self->_sessionsCoordinator->super;
    self->_sessionsCoordinator = v6;
  }
  else if (v5)
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl(&dword_19AC4E000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ does not support sessions", (uint8_t *)&v9, 0xCu);
  }

  v7 = -[MTSessionServer initWithCoordinator:]([MTSessionServer alloc], "initWithCoordinator:", self->_sessionsCoordinator);
  sessionServer = self->_sessionServer;
  self->_sessionServer = v7;

}

- (void)_setupSync
{
  MTMetrics *v3;
  MTMetrics *syncMetrics;
  MTAlarmSyncDataModel *v5;
  MTAlarmSyncDataModel *alarmSyncDataModel;

  v3 = (MTMetrics *)objc_opt_new();
  syncMetrics = self->_syncMetrics;
  self->_syncMetrics = v3;

  v5 = -[MTAlarmSyncDataModel initWithAlarmStorage:syncMetrics:]([MTAlarmSyncDataModel alloc], "initWithAlarmStorage:syncMetrics:", self->_alarmStorage, self->_syncMetrics);
  alarmSyncDataModel = self->_alarmSyncDataModel;
  self->_alarmSyncDataModel = v5;

}

- (void)_setupInitialListeners
{
  MTAgentNotificationManager *v3;
  MTAgentNotificationManager *notificationManager;
  MTLanguageChangeListener *v5;
  MTLanguageChangeListener *languageChangeListener;
  MTTimeListener *v7;
  MTTimeListener *timeListener;
  MTSystemStateListener *v9;
  MTSystemStateListener *systemStateListener;
  id v11;

  v3 = (MTAgentNotificationManager *)objc_opt_new();
  notificationManager = self->_notificationManager;
  self->_notificationManager = v3;

  v5 = objc_alloc_init(MTLanguageChangeListener);
  languageChangeListener = self->_languageChangeListener;
  self->_languageChangeListener = v5;

  -[MTAgentNotificationManager registerListener:](self->_notificationManager, "registerListener:", self->_languageChangeListener);
  v7 = (MTTimeListener *)objc_opt_new();
  timeListener = self->_timeListener;
  self->_timeListener = v7;

  -[MTAgentNotificationManager registerListener:](self->_notificationManager, "registerListener:", self->_timeListener);
  v9 = -[MTSystemStateListener initWithDelegate:]([MTSystemStateListener alloc], "initWithDelegate:", self);
  systemStateListener = self->_systemStateListener;
  self->_systemStateListener = v9;

  self->_systemReady = -[MTSystemStateListener checkSystemReady](self->_systemStateListener, "checkSystemReady");
  -[MTAgentNotificationManager registerListener:](self->_notificationManager, "registerListener:", self->_systemStateListener);
  if (!self->_systemReady)
  {
    -[MTAlarmServer startListening](self->_alarmServer, "startListening");
    -[MTTimerServer startListening](self->_timerServer, "startListening");
    -[MTStopwatchServer startListening](self->_stopwatchServer, "startListening");
    -[MTSessionServer startListening](self->_sessionServer, "startListening");
  }
  -[MTAlarmStorage setupListeners](self->_alarmStorage, "setupListeners");
  -[MTTimerStorage setupListeners](self->_timerStorage, "setupListeners");
  +[MTApplicationWorkspaceObserver sharedWorkspaceObserver](MTApplicationWorkspaceObserver, "sharedWorkspaceObserver");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:forBundleIdentifier:", self, CFSTR("com.apple.mobiletimer"));

}

- (void)restoreDidFinish
{
  NAScheduler *serializer;
  _QWORD v3[5];

  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__MTAgent_restoreDidFinish__block_invoke;
  v3[3] = &unk_1E39CB858;
  v3[4] = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v3);
}

uint64_t __27__MTAgent_restoreDidFinish__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  MTUserNotificationActionDispatcher *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = 138543362;
    v10 = v3;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ system is ready", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "loadAlarms");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "loadTimers");
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 8))
  {
    objc_msgSend(*(id *)(v4 + 160), "setupNotificationCenter");
    v5 = -[MTUserNotificationActionDispatcher initWithAlarmStorage:timerStorage:]([MTUserNotificationActionDispatcher alloc], "initWithAlarmStorage:timerStorage:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "registerActionHandler:", v5);

    v4 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v4 + 88), "rescheduleAlarmsWithCompletion:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "registerObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "rescheduleTimers");
  if (!MTIdiomIpad())
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "registerObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v6 + 8))
  {
    objc_msgSend(*(id *)(v6 + 240), "startSyncServices");
    if (MTShouldHandleForBedtime())
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "updateSleepState");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "registerObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "registerObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "registerObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "updateMonitorState");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "registerObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "prepare");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "saveSessionData");
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "handleSystemReady");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "handleSystemReady");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "handleSystemReady");
    v6 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v6 + 80), "handleSystemReady");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "handleSystemReady");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "handleSystemReady");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "handleSystemReady");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "prepareAlarms");
  result = objc_msgSend(*(id *)(a1 + 32), "_setupSecondaryListeners");
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v8 + 9))
  {
    objc_msgSend(*(id *)(v8 + 80), "startListening");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "startListening");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "startListening");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "startListening");
  }
  else
  {
    *(_BYTE *)(v8 + 9) = 1;
  }
  return result;
}

- (void)_setupSecondaryListeners
{
  MTAgentNotificationManager *notificationManager;
  void *v4;
  MTAgentDiagnosticListener *v5;
  MTAgentDiagnosticListener *diagnostics;
  MTAgentNotificationManager *v7;
  void *v8;
  id v9;

  notificationManager = self->_notificationManager;
  +[MTDeviceListener sharedDeviceListener](MTDeviceListener, "sharedDeviceListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAgentNotificationManager registerListener:](notificationManager, "registerListener:", v4);

  -[MTAgentNotificationManager registerListener:](self->_notificationManager, "registerListener:", self->_alarmScheduler);
  -[MTAgentNotificationManager registerListener:](self->_notificationManager, "registerListener:", self->_timerScheduler);
  -[MTAgentNotificationManager registerListener:](self->_notificationManager, "registerListener:", self->_alarmStorage);
  if (MTShouldHandleForBedtime())
  {
    if (self->_sleepCoordinator)
      -[MTAgentNotificationManager registerListener:](self->_notificationManager, "registerListener:");
    if (self->_sleepSessionTracker)
      -[MTAgentNotificationManager registerListener:](self->_notificationManager, "registerListener:");
  }
  v5 = -[MTAgentDiagnosticListener initWithDelegate:]([MTAgentDiagnosticListener alloc], "initWithDelegate:", self);
  diagnostics = self->_diagnostics;
  self->_diagnostics = v5;

  -[MTAgentNotificationManager registerListener:](self->_notificationManager, "registerListener:", self->_diagnostics);
  v7 = self->_notificationManager;
  +[MTPairedDeviceListener sharedListener](MTPairedDeviceListener, "sharedListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAgentNotificationManager registerListener:](v7, "registerListener:", v8);

  -[MTAgentNotificationManager beginListening](self->_notificationManager, "beginListening");
  v9 = +[MTSensitiveUIMonitor sharedMonitor](MTSensitiveUIMonitor, "sharedMonitor");
}

- (void)handleF5Reset
{
  NAScheduler *serializer;
  _QWORD v3[5];

  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __24__MTAgent_handleF5Reset__block_invoke;
  v3[3] = &unk_1E39CB858;
  v3[4] = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v3);
}

uint64_t __24__MTAgent_handleF5Reset__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "handleF5Reset");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "handleF5Reset");
}

- (void)handleMigrationFinish
{
  NSObject *v3;
  NAScheduler *serializer;
  _QWORD v5[5];
  uint8_t buf[4];
  MTAgent *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ migration finished", buf, 0xCu);
  }

  serializer = self->_serializer;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__MTAgent_handleMigrationFinish__block_invoke;
  v5[3] = &unk_1E39CB858;
  v5[4] = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v5);
}

uint64_t __32__MTAgent_handleMigrationFinish__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "handleMigrationFinish");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "handleMigrationFinish");
}

- (id)_diagnosticProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = (void *)objc_opt_new();
  -[MTAgent systemStateListener](self, "systemStateListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MTAgent systemStateListener](self, "systemStateListener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[MTAgent alarmServer](self, "alarmServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MTAgent alarmServer](self, "alarmServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[MTAgent alarmStorage](self, "alarmStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MTAgent alarmStorage](self, "alarmStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[MTAgent alarmScheduler](self, "alarmScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MTAgent alarmScheduler](self, "alarmScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[MTAgent timerServer](self, "timerServer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MTAgent timerServer](self, "timerServer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  -[MTAgent sessionServer](self, "sessionServer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MTAgent sessionServer](self, "sessionServer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  -[MTAgent timerStorage](self, "timerStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MTAgent timerStorage](self, "timerStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  -[MTAgent timerScheduler](self, "timerScheduler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MTAgent timerScheduler](self, "timerScheduler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  +[MTDeviceListener sharedDeviceListener](MTDeviceListener, "sharedDeviceListener");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  if (self->_alarmSyncDataModel)
    objc_msgSend(v3, "addObject:");
  +[MTPairedDeviceListener sharedListener](MTPairedDeviceListener, "sharedListener");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  if (MTShouldHandleForBedtime())
  {
    -[MTAgent sleepCoordinator](self, "sleepCoordinator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[MTAgent sleepCoordinator](self, "sleepCoordinator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v23);

    }
  }
  return v3;
}

- (void)printDiagnostics
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  MTLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  MTLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  MTLogForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v27 = v8;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "-----%{public}@-----", buf, 0xCu);
  }

  MTLogForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAgent launchDate](self, "launchDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = (uint64_t)v10;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "Launched: %{public}@", buf, 0xCu);

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[MTAgent _diagnosticProviders](self, "_diagnosticProviders", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15++), "printDiagnostics");
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  MTLogForCategory(1);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, "------------------------", buf, 2u);
  }

  MTLogForCategory(1);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  MTLogForCategory(1);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  MTLogForCategory(1);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  MTLogForCategory(1);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v20, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

}

- (id)gatherDiagnostics
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[MTAgent launchDate](self, "launchDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Launched"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MTAgent _diagnosticProviders](self, "_diagnosticProviders", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "gatherDiagnostics");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addEntriesFromDictionary:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)_removeUserDefaultsDataIfNecessary:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v9[5];
  uint8_t buf[4];
  MTAgent *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.mobiletimer")) & 1) != 0
    || !a3
    && (+[MTApplicationWorkspaceObserver sharedWorkspaceObserver](MTApplicationWorkspaceObserver, "sharedWorkspaceObserver"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "isApplicationInstalledForBundleIdentifier:", CFSTR("com.apple.mobiletimer")), v7, (v8 & 1) == 0))
  {
    MTLogForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = self;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removing user defaults", buf, 0xCu);
    }

    -[MTAgent serializer](self, "serializer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__MTAgent__removeUserDefaultsDataIfNecessary___block_invoke;
    v9[3] = &unk_1E39CB858;
    v9[4] = self;
    objc_msgSend(v6, "performBlock:", v9);

  }
}

uint64_t __46__MTAgent__removeUserDefaultsDataIfNecessary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeUserDefaultsData");
}

- (void)_removeUserDefaultsData
{
  MTUserDefaults *v2;
  void *v3;
  MTUserDefaults *v4;

  v2 = [MTUserDefaults alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobiletimer"));
  v4 = -[MTUserDefaults initWithUserDefaults:](v2, "initWithUserDefaults:", v3);

  -[MTUserDefaults removeAllObjects](v4, "removeAllObjects");
}

- (MTSleepManager)sleepManager
{
  return self->_sleepManager;
}

- (NSDate)launchDate
{
  return self->_launchDate;
}

- (void)setLaunchDate:(id)a3
{
  objc_storeStrong((id *)&self->_launchDate, a3);
}

- (BOOL)isHorseman
{
  return self->_isHorseman;
}

- (void)setIsHorseman:(BOOL)a3
{
  self->_isHorseman = a3;
}

- (BOOL)systemReady
{
  return self->_systemReady;
}

- (void)setSystemReady:(BOOL)a3
{
  self->_systemReady = a3;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (MTAgentNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void)setNotificationManager:(id)a3
{
  objc_storeStrong((id *)&self->_notificationManager, a3);
}

- (MTSystemStateListener)systemStateListener
{
  return self->_systemStateListener;
}

- (void)setSystemStateListener:(id)a3
{
  objc_storeStrong((id *)&self->_systemStateListener, a3);
}

- (MTLanguageChangeListener)languageChangeListener
{
  return self->_languageChangeListener;
}

- (void)setLanguageChangeListener:(id)a3
{
  objc_storeStrong((id *)&self->_languageChangeListener, a3);
}

- (MTAgentDiagnosticListener)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
  objc_storeStrong((id *)&self->_diagnostics, a3);
}

- (MTTimeListener)timeListener
{
  return self->_timeListener;
}

- (void)setTimeListener:(id)a3
{
  objc_storeStrong((id *)&self->_timeListener, a3);
}

- (MTAlarmServer)alarmServer
{
  return self->_alarmServer;
}

- (void)setAlarmServer:(id)a3
{
  objc_storeStrong((id *)&self->_alarmServer, a3);
}

- (MTAlarmScheduler)alarmScheduler
{
  return self->_alarmScheduler;
}

- (void)setAlarmScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_alarmScheduler, a3);
}

- (MTAlarmSnapshot)alarmSnapshot
{
  return self->_alarmSnapshot;
}

- (void)setAlarmSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_alarmSnapshot, a3);
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
  objc_storeStrong((id *)&self->_alarmStorage, a3);
}

- (MTTimerServer)timerServer
{
  return self->_timerServer;
}

- (void)setTimerServer:(id)a3
{
  objc_storeStrong((id *)&self->_timerServer, a3);
}

- (MTTimerScheduler)timerScheduler
{
  return self->_timerScheduler;
}

- (void)setTimerScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_timerScheduler, a3);
}

- (MTTimerSnapshot)timerSnapshot
{
  return self->_timerSnapshot;
}

- (void)setTimerSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_timerSnapshot, a3);
}

- (MTTimerStorage)timerStorage
{
  return self->_timerStorage;
}

- (void)setTimerStorage:(id)a3
{
  objc_storeStrong((id *)&self->_timerStorage, a3);
}

- (MTStopwatchServer)stopwatchServer
{
  return self->_stopwatchServer;
}

- (void)setStopwatchServer:(id)a3
{
  objc_storeStrong((id *)&self->_stopwatchServer, a3);
}

- (MTSessionServer)sessionServer
{
  return self->_sessionServer;
}

- (void)setSessionServer:(id)a3
{
  objc_storeStrong((id *)&self->_sessionServer, a3);
}

- (MTNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (MTAlarmIntentDonor)alarmIntentDonor
{
  return self->_alarmIntentDonor;
}

- (void)setAlarmIntentDonor:(id)a3
{
  objc_storeStrong((id *)&self->_alarmIntentDonor, a3);
}

- (MTTimerIntentDonor)timerIntentDonor
{
  return self->_timerIntentDonor;
}

- (void)setTimerIntentDonor:(id)a3
{
  objc_storeStrong((id *)&self->_timerIntentDonor, a3);
}

- (MTCoreDuetMonitor)coreDuetMonitor
{
  return self->_coreDuetMonitor;
}

- (void)setCoreDuetMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_coreDuetMonitor, a3);
}

- (MTSessionsCoordinator)sessionsCoordinator
{
  return self->_sessionsCoordinator;
}

- (void)setSessionsCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_sessionsCoordinator, a3);
}

- (MTWidgetProvider)widgetProvider
{
  return self->_widgetProvider;
}

- (void)setWidgetProvider:(id)a3
{
  objc_storeStrong((id *)&self->_widgetProvider, a3);
}

- (MTSleepCoordinator)sleepCoordinator
{
  return self->_sleepCoordinator;
}

- (void)setSleepCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_sleepCoordinator, a3);
}

- (MTSleepModeMonitor)sleepModeMonitor
{
  return self->_sleepModeMonitor;
}

- (void)setSleepModeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_sleepModeMonitor, a3);
}

- (MTSleepSessionManager)sleepSessionManager
{
  return self->_sleepSessionManager;
}

- (void)setSleepSessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_sleepSessionManager, a3);
}

- (MTSleepSessionTracker)sleepSessionTracker
{
  return self->_sleepSessionTracker;
}

- (void)setSleepSessionTracker:(id)a3
{
  objc_storeStrong((id *)&self->_sleepSessionTracker, a3);
}

- (MTAlarmSyncDataModel)alarmSyncDataModel
{
  return self->_alarmSyncDataModel;
}

- (void)setAlarmSyncDataModel:(id)a3
{
  objc_storeStrong((id *)&self->_alarmSyncDataModel, a3);
}

- (MTMetrics)syncMetrics
{
  return self->_syncMetrics;
}

- (void)setSyncMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_syncMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncMetrics, 0);
  objc_storeStrong((id *)&self->_alarmSyncDataModel, 0);
  objc_storeStrong((id *)&self->_sleepSessionTracker, 0);
  objc_storeStrong((id *)&self->_sleepSessionManager, 0);
  objc_storeStrong((id *)&self->_sleepModeMonitor, 0);
  objc_storeStrong((id *)&self->_sleepCoordinator, 0);
  objc_storeStrong((id *)&self->_widgetProvider, 0);
  objc_storeStrong((id *)&self->_sessionsCoordinator, 0);
  objc_storeStrong((id *)&self->_coreDuetMonitor, 0);
  objc_storeStrong((id *)&self->_timerIntentDonor, 0);
  objc_storeStrong((id *)&self->_alarmIntentDonor, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_sessionServer, 0);
  objc_storeStrong((id *)&self->_stopwatchServer, 0);
  objc_storeStrong((id *)&self->_timerStorage, 0);
  objc_storeStrong((id *)&self->_timerSnapshot, 0);
  objc_storeStrong((id *)&self->_timerScheduler, 0);
  objc_storeStrong((id *)&self->_timerServer, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_alarmSnapshot, 0);
  objc_storeStrong((id *)&self->_alarmScheduler, 0);
  objc_storeStrong((id *)&self->_alarmServer, 0);
  objc_storeStrong((id *)&self->_timeListener, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_languageChangeListener, 0);
  objc_storeStrong((id *)&self->_systemStateListener, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_launchDate, 0);
  objc_storeStrong((id *)&self->_sleepManager, 0);
}

@end
