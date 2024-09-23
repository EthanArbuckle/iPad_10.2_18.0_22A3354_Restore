@implementation ARDaemon

- (void)setLocalAnonymousListenerDaemon:(id)a3
{
  AROverrideARDaemonLocalAnonymousListenerDaemon();
}

+ (id)createAnonymousListenerDaemon
{
  return (id)objc_msgSend((id)objc_opt_class(), "createAnonymousListenerDaemonWithReplayURL:deterministic:replayDelegate:", 0, 0, 0);
}

+ (id)createAnonymousListenerDaemonWithReplayURL:(id)a3 deterministic:(BOOL)a4 replayDelegate:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "createAnonymousListenerDaemonWithReplayURL:replayEnableTelemetry:deterministic:replayDelegate:isDryRun:", v8, 0, v5, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)createAnonymousListenerDaemonWithReplayURL:(id)a3 replayEnableTelemetry:(BOOL)a4 deterministic:(BOOL)a5 replayDelegate:(id)a6 isDryRun:(BOOL)a7
{
  id v7;
  void *v8;
  void *v9;
  ARDaemon *v10;
  ARDaemon *v11;
  void *v12;
  void *v13;

  v7 = a6;
  objc_msgSend((id)objc_opt_class(), "localAnonymousListenerDaemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = [ARDaemon alloc];
    v12 = (void *)objc_opt_new();
    v13 = (void *)objc_opt_new();
    v10 = -[ARDaemon initWithConfiguration:spawnTime:watchdogMonitor:graphScheduler:replayDelegate:](v11, "initWithConfiguration:spawnTime:watchdogMonitor:graphScheduler:replayDelegate:", v12, v13, 0, 0, v7);

  }
  return v10;
}

- (ARDaemon)initWithConfiguration:(id)a3 spawnTime:(id)a4 watchdogMonitor:(id)a5
{
  return -[ARDaemon initWithConfiguration:spawnTime:watchdogMonitor:graphScheduler:replayDelegate:](self, "initWithConfiguration:spawnTime:watchdogMonitor:graphScheduler:replayDelegate:", a3, a4, a5, 0, 0);
}

- (ARDaemon)initWithConfiguration:(id)a3 spawnTime:(id)a4 watchdogMonitor:(id)a5 graphScheduler:(id)a6 replayDelegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  ARDaemon *v19;
  ARDaemon *v20;
  dispatch_source_t v21;
  OS_dispatch_source *heartbeatTimer;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  uint64_t v28;
  NSUUID *sessionUUID;
  NSArray *runningRemoteServices;
  uint64_t v31;
  ARMemoryPressureMonitor *memoryPressureMonitor;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  ARServer *v41;
  ARServer *server;
  NSObject *v43;
  objc_class *v44;
  void *v45;
  ARDaemonServiceListener *v46;
  ARDaemonServiceListener *listener;
  _QWORD handler[4];
  id v50;
  objc_super v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  ARDaemon *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  _ARLogDaemon_0();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_235C46000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ARDaemonInitialization", (const char *)&unk_235C5559A, buf, 2u);
  }

  v51.receiver = self;
  v51.super_class = (Class)ARDaemon;
  v19 = -[ARDaemon init](&v51, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_configuration, a3);
    objc_storeStrong((id *)&v20->_spawnTime, a4);
    if ((-[ARDaemonConfiguration isInProcess](v20->_configuration, "isInProcess") & 1) == 0)
    {
      v21 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, MEMORY[0x24BDAC9B8]);
      heartbeatTimer = v20->_heartbeatTimer;
      v20->_heartbeatTimer = (OS_dispatch_source *)v21;

      v23 = v20->_heartbeatTimer;
      if (v23)
      {
        dispatch_source_set_timer(v23, 0, 0x3B9ACA00uLL, 0);
        objc_initWeak((id *)buf, v20);
        v24 = v20->_heartbeatTimer;
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __90__ARDaemon_initWithConfiguration_spawnTime_watchdogMonitor_graphScheduler_replayDelegate___block_invoke_3;
        handler[3] = &unk_2507025E8;
        objc_copyWeak(&v50, (id *)buf);
        dispatch_source_set_event_handler(v24, handler);
        objc_destroyWeak(&v50);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        _ARLogDaemon_0();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v53 = v27;
          v54 = 2048;
          v55 = v20;
          _os_log_impl(&dword_235C46000, v25, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create the heartbeat timer", buf, 0x16u);

        }
      }
    }
    v28 = objc_opt_new();
    sessionUUID = v20->_sessionUUID;
    v20->_sessionUUID = (NSUUID *)v28;

    v20->_lastDaemonHeartbeatEventReportedTimestamp = -1.79769313e308;
    runningRemoteServices = v20->_runningRemoteServices;
    v20->_runningRemoteServices = (NSArray *)MEMORY[0x24BDBD1A8];

    v31 = objc_opt_new();
    memoryPressureMonitor = v20->_memoryPressureMonitor;
    v20->_memoryPressureMonitor = (ARMemoryPressureMonitor *)v31;

    -[ARMemoryPressureMonitor setDelegate:](v20->_memoryPressureMonitor, "setDelegate:", v20);
    objc_opt_class();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_sync_enter(v33);
    v35 = (void *)MEMORY[0x23B7DC4D0](v34);
    v36 = +[ARDaemon _runningDaemons](ARDaemon, "_runningDaemons");
    objc_msgSend((id)_weakDaemons, "addPointer:", v20);
    objc_autoreleasePoolPop(v35);
    objc_sync_exit(v33);

    _ARLogDaemon_0();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v39;
      v54 = 2048;
      v55 = v20;
      _os_log_impl(&dword_235C46000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Setting up server", buf, 0x16u);

    }
    v40 = (void *)objc_opt_new();
    objc_msgSend(v15, "updateStatus:", 6);
    v41 = -[ARServer initWithDaemonConfiguration:spawnTime:sessionUUID:watchdogMonitor:executionManager:]([ARServer alloc], "initWithDaemonConfiguration:spawnTime:sessionUUID:watchdogMonitor:executionManager:", v13, v20->_spawnTime, v20->_sessionUUID, v15, v40);
    server = v20->_server;
    v20->_server = v41;

    objc_msgSend(v15, "updateStatus:", 7);
    _ARLogDaemon_0();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v45;
      v54 = 2048;
      v55 = v20;
      _os_log_impl(&dword_235C46000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Setting up listeners", buf, 0x16u);

    }
    v46 = -[ARDaemonServiceListener initWithDelegate:daemonConfiguration:watchdogMonitor:]([ARDaemonServiceListener alloc], "initWithDelegate:daemonConfiguration:watchdogMonitor:", v20->_server, v20->_configuration, v15);
    listener = v20->_listener;
    v20->_listener = v46;

    if (-[ARDaemonConfiguration isInProcess](v20->_configuration, "isInProcess"))
      -[ARDaemon setLocalAnonymousListenerDaemon:](v20, "setLocalAnonymousListenerDaemon:", v20);
    v20->_state = 0;

  }
  __90__ARDaemon_initWithConfiguration_spawnTime_watchdogMonitor_graphScheduler_replayDelegate___block_invoke();

  return v20;
}

void __90__ARDaemon_initWithConfiguration_spawnTime_watchdogMonitor_graphScheduler_replayDelegate___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _ARLogDaemon_0();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_235C46000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ARDaemonInitialization", (const char *)&unk_235C5559A, v1, 2u);
  }

}

void __90__ARDaemon_initWithConfiguration_spawnTime_watchdogMonitor_graphScheduler_replayDelegate___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_heartbeat");

}

- (void)dealloc
{
  NSArray *runningRemoteServices;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  ARDaemon *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  runningRemoteServices = self->_runningRemoteServices;
  self->_runningRemoteServices = (NSArray *)MEMORY[0x24BDBD1A8];

  -[ARDaemon shutdown](self, "shutdown");
  _ARLogDaemon_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_235C46000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: dealloc", buf, 0x16u);

  }
  v7.receiver = self;
  v7.super_class = (Class)ARDaemon;
  -[ARDaemon dealloc](&v7, sel_dealloc);
}

- (void)printInfo
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  ARDaemon *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  _ARLogDaemon_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v5;
    v25 = 2048;
    v26 = self;
    _os_log_impl(&dword_235C46000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Initialized with frameworks:", buf, 0x16u);

  }
  ARFrameworkVersions();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        _ARLogDaemon_0();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v24 = v16;
          v25 = 2048;
          v26 = self;
          v27 = 2112;
          v28 = v13;
          v29 = 2112;
          v30 = v17;
          _os_log_impl(&dword_235C46000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ : %@", buf, 0x2Au);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v10);
  }

}

- (void)shutdown
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  ARDaemon *v6;
  ARDaemonServiceListener *listener;
  ARServer *server;
  NSObject *heartbeatTimer;
  OS_dispatch_source *v10;
  int v11;
  void *v12;
  __int16 v13;
  ARDaemon *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  _ARLogDaemon_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v5;
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_235C46000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Shutting down", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend((id)objc_opt_class(), "localAnonymousListenerDaemon");
  v6 = (ARDaemon *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
    -[ARDaemon setLocalAnonymousListenerDaemon:](self, "setLocalAnonymousListenerDaemon:", 0);
  listener = self->_listener;
  self->_listener = 0;

  -[ARServer invalidate](self->_server, "invalidate");
  server = self->_server;
  self->_server = 0;

  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer)
  {
    dispatch_source_cancel(heartbeatTimer);
    v10 = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;

  }
  self->_state = 2;
}

- (void)startup
{
  -[ARDaemon startWithServices:](self, "startWithServices:", MEMORY[0x24BDBD1A8]);
}

- (void)_heartbeat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  double v13;
  double v14;
  unint64_t v15;
  double v16;
  unint64_t v17;
  double v18;
  unint64_t v19;
  void *v20;
  double v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  ARDaemon *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  ARGetMemoryFootprint();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "timeSinceSnapshot:", self->_spawnTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARDaemonMetrics sharedDaemonMetrics](ARDaemonMetrics, "sharedDaemonMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportMemoryFootprintInBytes:", 0);

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "upTimeIncludingSleepAndDriftCorrection");
  objc_msgSend(v6, "ar_hoursMinutesSecondsWithTimeInterval:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "upTimeIncludingSleepAndDriftCorrection");
  objc_msgSend(v8, "ar_hoursMinutesSecondsWithTimeInterval:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _ARLogDaemon_0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v23 = v12;
    v24 = 2048;
    v25 = self;
    v26 = 2114;
    v27 = v7;
    v28 = 2114;
    v29 = v9;
    v30 = 2050;
    v31 = 0;
    v32 = 2050;
    v33 = 0;
    _os_log_impl(&dword_235C46000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Heartbeat - system up: {%{public}@}, daemon up: {%{public}@}, footprint: %{iec-bytes,public}llu, peak: %{iec-bytes,public}llu", buf, 0x3Eu);

  }
  if (self->_lastDaemonHeartbeatEventReportedTimestamp == -1.79769313e308
    || (objc_msgSend(v3, "upTimeIncludingSleepAndDriftCorrection"),
        v13 - self->_lastDaemonHeartbeatEventReportedTimestamp >= 60.0))
  {
    objc_msgSend(v4, "upTime", 0);
    v15 = (unint64_t)(v14 / 60.0);
    objc_msgSend(v4, "upTimeIncludingSleep");
    v17 = (unint64_t)(v16 / 60.0);
    objc_msgSend(v3, "upTimeIncludingSleepAndDriftCorrection");
    v19 = (unint64_t)(v18 / 60.0);
    +[ARDaemonMetrics sharedDaemonMetrics](ARDaemonMetrics, "sharedDaemonMetrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "reportDaemonHeartbeatForSessionUUID:daemonUpTimeExcludingSleepMinutes:daemonUpTimeIncludingSleepMinutes:systemUpTimeMinutes:memoryFootprintInBytes:", self->_sessionUUID, v15, v17, v19, 0);

    objc_msgSend(v3, "upTimeIncludingSleepAndDriftCorrection");
    self->_lastDaemonHeartbeatEventReportedTimestamp = v21;
  }

}

- (void)startWithServices:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSObject *heartbeatTimer;
  NSArray *v9;
  NSArray *runningRemoteServices;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  ARDaemon *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ARLogDaemon_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v7;
    v23 = 2048;
    v24 = self;
    _os_log_impl(&dword_235C46000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Starting up", buf, 0x16u);

  }
  -[ARDaemon printInfo](self, "printInfo");
  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer)
    dispatch_activate(heartbeatTimer);
  v9 = (NSArray *)objc_msgSend(v4, "copy");
  runningRemoteServices = self->_runningRemoteServices;
  self->_runningRemoteServices = v9;

  -[ARServer commitServices:](self->_server, "commitServices:", self->_runningRemoteServices);
  self->_state = 1;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_runningRemoteServices;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "syncServiceWithTimeout:callback:", -1, &__block_literal_global_16, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (id)listenerEndPointForServiceNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ARServer listenerEndPointForServiceNamed:](self->_server, "listenerEndPointForServiceNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[ARDaemonServiceListener listenerForServiceNamed:](self->_listener, "listenerForServiceNamed:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)_runningDaemons
{
  if (_runningDaemons_daemonsOnceToken != -1)
    dispatch_once(&_runningDaemons_daemonsOnceToken, &__block_literal_global_17);
  objc_msgSend((id)_weakDaemons, "ar_compactZeroedWeakPointers");
  return (id)objc_msgSend((id)_weakDaemons, "allObjects");
}

void __27__ARDaemon__runningDaemons__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_weakDaemons;
  _weakDaemons = v0;

}

+ (id)_fullDescription
{
  void *v2;
  void *v3;
  void *v4;

  +[ARDaemon _runningDaemons](ARDaemon, "_runningDaemons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    objc_msgSend(v2, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_fullDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16A8];
  -[ARDaemon description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARServer _fullDescription](self->_server, "_fullDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Server: %@\n"), v6);

  return v5;
}

- (void)memoryPressureMonitor:(id)a3 didUpdateProcessMemoryPressureCondition:(int64_t)a4
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  ARDaemon *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  ARGetMemoryFootprint();
  _ARLogDaemon_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromARMemoryPressureCondition(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v11 = v8;
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v9;
    v16 = 2050;
    v17 = 0;
    v18 = 2050;
    v19 = 0;
    _os_log_impl(&dword_235C46000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Process memory pressure condition: %@, footprint: %{iec-bytes,public}llu, peak: %{iec-bytes,public}llu", buf, 0x34u);

  }
}

- (void)memoryPressureMonitor:(id)a3 didUpdateSystemMemoryPressureCondition:(int64_t)a4
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  ARDaemon *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  ARGetMemoryFootprint();
  _ARLogDaemon_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromARMemoryPressureCondition(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v11 = v8;
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v9;
    v16 = 2050;
    v17 = 0;
    v18 = 2050;
    v19 = 0;
    _os_log_impl(&dword_235C46000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: System memory pressure condition: %@, footprint: %{iec-bytes,public}llu, peak: %{iec-bytes,public}llu", buf, 0x34u);

  }
}

- (ARDaemonServiceListener)listener
{
  return self->_listener;
}

- (unint64_t)state
{
  return self->_state;
}

- (ARServer)server
{
  return self->_server;
}

- (NSArray)runningRemoteServices
{
  return self->_runningRemoteServices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningRemoteServices, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_spawnTime, 0);
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
