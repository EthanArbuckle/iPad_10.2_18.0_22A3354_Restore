@implementation SAServer

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__SAServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sSAServer;
}

void __26__SAServer_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sSAServer;
  sharedInstance_sSAServer = v0;

}

- (SAServer)init
{
  SAServer *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *messageQueue;
  uint64_t v13;
  NSMutableArray *clientConnections;
  uint64_t v15;
  NSXPCListener *listener;
  SATelephonyManager *v17;
  SATelephonyManager *telephonyManager;
  uint64_t v19;
  SABundleManager *bundleManager;
  uint64_t v21;
  SALocationManager *locationManager;
  SACriticalNotification *v23;
  SACriticalNotification *criticalNotification;
  OS_dispatch_semaphore *locationAcquired;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SAServer;
  v2 = -[SAServer init](&v27, sel_init);
  if (v2)
  {
    sa_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[SAServer init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

    v11 = dispatch_queue_create("com.apple.SafetyKit.SAServer", 0);
    messageQueue = v2->_messageQueue;
    v2->_messageQueue = (OS_dispatch_queue *)v11;

    v13 = objc_opt_new();
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = (NSMutableArray *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.SafetyKit"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v15;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    v17 = -[SATelephonyManager initWithQueue:]([SATelephonyManager alloc], "initWithQueue:", v2->_messageQueue);
    telephonyManager = v2->_telephonyManager;
    v2->_telephonyManager = v17;

    -[SATelephonyManager setDelegate:](v2->_telephonyManager, "setDelegate:", v2);
    +[SABundleManager crashDetectionManager](SABundleManager, "crashDetectionManager");
    v19 = objc_claimAutoreleasedReturnValue();
    bundleManager = v2->_bundleManager;
    v2->_bundleManager = (SABundleManager *)v19;

    v21 = objc_opt_new();
    locationManager = v2->_locationManager;
    v2->_locationManager = (SALocationManager *)v21;

    -[SALocationManager setDelegate:](v2->_locationManager, "setDelegate:", v2);
    v23 = -[SACriticalNotification initWithBundleManager:]([SACriticalNotification alloc], "initWithBundleManager:", v2->_bundleManager);
    criticalNotification = v2->_criticalNotification;
    v2->_criticalNotification = v23;

    locationAcquired = v2->_locationAcquired;
    v2->_locationAcquired = 0;

    -[SAServer recoverMostRecentCrashEvent](v2, "recoverMostRecentCrashEvent");
  }
  return v2;
}

- (void)checkAndResetClientState
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (SACrashDetectionEvent)mostRecentCrashEvent
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  sa_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[SAServer mostRecentCrashEvent].cold.4(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("SAMostRecentCrashDetectionEvent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v24 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v24;
    sa_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[SAServer mostRecentCrashEvent].cold.3();
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[SAServer mostRecentCrashEvent].cold.2();
    }

  }
  else
  {
    sa_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SAServer mostRecentCrashEvent].cold.1(v13, v16, v17, v18, v19, v20, v21, v22);
    v12 = 0;
  }

  return (SACrashDetectionEvent *)v12;
}

- (void)setMostRecentCrashEvent:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v3 = a3;
  sa_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SAServer setMostRecentCrashEvent:].cold.4();

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    sa_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[SAServer setMostRecentCrashEvent:].cold.3();

      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("SAMostRecentCrashDetectionEvent"));
      objc_msgSend(v5, "synchronize");
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SAServer setMostRecentCrashEvent:].cold.2();

    }
  }
  else
  {
    sa_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[SAServer setMostRecentCrashEvent:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    objc_msgSend(v5, "removeObjectForKey:", CFSTR("SAMostRecentCrashDetectionEvent"));
  }

}

- (void)recoverMostRecentCrashEvent
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)updateMostRecentCrashDetectionEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SABundleManager *bundleManager;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  sa_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SAServer updateMostRecentCrashDetectionEvent:completion:].cold.1();

  -[SAServer setMostRecentCrashEvent:](self, "setMostRecentCrashEvent:", v6);
  if (v6)
  {
    bundleManager = self->_bundleManager;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __59__SAServer_updateMostRecentCrashDetectionEvent_completion___block_invoke;
    v10[3] = &unk_2505B3808;
    v10[4] = self;
    v11 = v7;
    -[SABundleManager wakeApprovedAppsWithReason:completion:](bundleManager, "wakeApprovedAppsWithReason:completion:", 0, v10);

  }
}

uint64_t __59__SAServer_updateMostRecentCrashDetectionEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "sendCrashEventToClients");
}

- (void)notifyCrashDetectedAt:(id)a3 resolvedAt:(id)a4 resolvedWithResponse:(int64_t)a5
{
  -[SAServer notifyCrashDetectedAt:resolvedAt:resolvedWithResponse:completion:](self, "notifyCrashDetectedAt:resolvedAt:resolvedWithResponse:completion:", a3, a4, a5, 0);
}

- (void)notifyCrashDetectedAt:(id)a3 resolvedAt:(id)a4 resolvedWithResponse:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  SAServer *v13;
  NSObject *v14;
  NSObject *locationAcquired;
  dispatch_time_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  OS_dispatch_semaphore *v25;
  dispatch_semaphore_t v26;
  NSObject *messageQueue;
  id v28;
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  id v35[2];
  id buf[2];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[SAServer startMonitoringLocation](self, "startMonitoringLocation");
  v13 = self;
  objc_sync_enter(v13);
  if (v13->_locationAcquired)
  {
    sa_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_23457A000, v14, OS_LOG_TYPE_DEFAULT, "Reentrant notification, waiting for location on older semaphore", (uint8_t *)buf, 2u);
    }

    locationAcquired = v13->_locationAcquired;
    v16 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(locationAcquired, v16))
    {
      sa_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SAServer notifyCrashDetectedAt:resolvedAt:resolvedWithResponse:completion:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    }
    v25 = v13->_locationAcquired;
    v13->_locationAcquired = 0;
  }
  else
  {
    v26 = dispatch_semaphore_create(0);
    v25 = v13->_locationAcquired;
    v13->_locationAcquired = (OS_dispatch_semaphore *)v26;
  }

  objc_sync_exit(v13);
  objc_initWeak(buf, v13);
  messageQueue = v13->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__SAServer_notifyCrashDetectedAt_resolvedAt_resolvedWithResponse_completion___block_invoke;
  block[3] = &unk_2505B3830;
  objc_copyWeak(v35, buf);
  v32 = v10;
  v33 = v11;
  v35[1] = (id)a5;
  v34 = v12;
  v28 = v12;
  v29 = v11;
  v30 = v10;
  dispatch_async(messageQueue, block);

  objc_destroyWeak(v35);
  objc_destroyWeak(buf);
}

void __77__SAServer_notifyCrashDetectedAt_resolvedAt_resolvedWithResponse_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  intptr_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  SACrashDetectionEvent *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  SACrashDetectionEvent *v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_sync_enter(v2);
  objc_msgSend(v2, "locationAcquired");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "locationAcquired");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_time(0, 5000000000);
    v6 = dispatch_semaphore_wait(v4, v5);

    if (v6)
    {
      sa_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[SAServer notifyCrashDetectedAt:resolvedAt:resolvedWithResponse:completion:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    }
    objc_msgSend(v2, "setLocationAcquired:", 0);
  }
  objc_sync_exit(v2);

  sa_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315138;
    v23 = "-[SAServer notifyCrashDetectedAt:resolvedAt:resolvedWithResponse:completion:]_block_invoke";
    _os_log_impl(&dword_23457A000, v15, OS_LOG_TYPE_DEFAULT, "%s - Crash event resolved", (uint8_t *)&v22, 0xCu);
  }

  v16 = [SACrashDetectionEvent alloc];
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "mostRecentLocation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SACrashDetectionEvent initWithTimeOfDetection:timeOfResolution:response:location:](v16, "initWithTimeOfDetection:timeOfResolution:response:location:", v17, v18, v19, v20);

  objc_msgSend(v2, "setNumberOfVoiceCallAttempts:", 0);
  objc_msgSend(v2, "updateMostRecentCrashDetectionEvent:completion:", v21, *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "stopMonitoringLocation");

}

- (int64_t)numberOfVoiceCallAttempts
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  id v25;

  sa_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[SAServer numberOfVoiceCallAttempts].cold.4(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("SANumberOfVoiceCallAttempts"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v25;
    sa_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[SAServer numberOfVoiceCallAttempts].cold.3();
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[SAServer numberOfVoiceCallAttempts].cold.2();
    }

    v23 = objc_msgSend(v12, "integerValue");
  }
  else
  {
    sa_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SAServer numberOfVoiceCallAttempts].cold.1(v13, v16, v17, v18, v19, v20, v21, v22);
    v23 = 0;
  }

  return v23;
}

- (void)setNumberOfVoiceCallAttempts:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;

  sa_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SAServer setNumberOfVoiceCallAttempts:].cold.3();

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;

  sa_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[SAServer setNumberOfVoiceCallAttempts:].cold.2();

    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("SANumberOfVoiceCallAttempts"));
    objc_msgSend(v5, "synchronize");
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SAServer setNumberOfVoiceCallAttempts:].cold.1((uint64_t)v9, a3, v11);

  }
}

- (void)updateVoiceCallStatus:(int64_t)a3
{
  NSObject *v5;
  NSObject *messageQueue;
  _QWORD v7[6];

  sa_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SAServer updateVoiceCallStatus:].cold.1();

  messageQueue = self->_messageQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__SAServer_updateVoiceCallStatus___block_invoke;
  v7[3] = &unk_2505B3878;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(messageQueue, v7);
}

uint64_t __34__SAServer_updateVoiceCallStatus___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34__SAServer_updateVoiceCallStatus___block_invoke_2;
  v3[3] = &__block_descriptor_40_e48_v24__0__NSXPCConnection_8___SAClientProtocol__16l;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "iterateClientProxies:", v3);
}

void __34__SAServer_updateVoiceCallStatus___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;

  v5 = a2;
  v6 = a3;
  v7 = +[SAAuthorization connectionAuthorizedForAnyEmergency:](SAAuthorization, "connectionAuthorizedForAnyEmergency:", v5);
  sa_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
      __34__SAServer_updateVoiceCallStatus___block_invoke_2_cold_1();

    objc_msgSend(v6, "updateVoiceCallStatus:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v9)
      __34__SAServer_updateVoiceCallStatus___block_invoke_2_cold_2();

  }
}

- (void)startMonitoringLocation
{
  -[SALocationManager startMonitoringLocation](self->_locationManager, "startMonitoringLocation");
}

- (void)stopMonitoringLocation
{
  -[SALocationManager stopMonitoringLocation](self->_locationManager, "stopMonitoringLocation");
}

+ (double)emergencyResponseVoiceCallTimeout
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("SAEmergencyResponseVoiceCallTimeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 180.0;
  }

  return v5;
}

- (void)sendCrashEventToClients
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s - not sending nil event", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __35__SAServer_sendCrashEventToClients__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__SAServer_sendCrashEventToClients__block_invoke_2;
  v4[3] = &unk_2505B38C0;
  v4[4] = WeakRetained;
  v4[5] = v3;
  objc_msgSend(v3, "iterateClientProxies:", v4);

}

void __35__SAServer_sendCrashEventToClients__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = +[SAAuthorization connectionAuthorizedForCrashDetection:](SAAuthorization, "connectionAuthorizedForCrashDetection:", v5);
  sa_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "mostRecentCrashEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[SAServer sendCrashEventToClients]_block_invoke_2";
      v14 = 2112;
      v15 = v5;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_23457A000, v9, OS_LOG_TYPE_DEFAULT, "%s - authorized, sending, connection: %@, crashEvent: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "sendNotificationWithCompletionHandler:", &__block_literal_global_2);
    objc_msgSend(*(id *)(a1 + 32), "mostRecentCrashEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateMostRecentCrashDetectionEvent:", v11);

    objc_msgSend(*(id *)(a1 + 32), "mostRecentCrashEvent");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject setIsNotified:](v9, "setIsNotified:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setMostRecentCrashEvent:", v9);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __35__SAServer_sendCrashEventToClients__block_invoke_2_cold_1((uint64_t)v5, a1, v9);
  }

}

void __35__SAServer_sendCrashEventToClients__block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  sa_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
      __35__SAServer_sendCrashEventToClients__block_invoke_22_cold_2((uint64_t)v2, v3, v5, v6, v7, v8, v9, v10);
  }
  else if (v4)
  {
    __35__SAServer_sendCrashEventToClients__block_invoke_22_cold_1(v3);
  }

}

- (void)iterateClientProxies:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *clientConnections;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self->_clientConnections;
  objc_sync_enter(v5);
  clientConnections = self->_clientConnections;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__SAServer_iterateClientProxies___block_invoke;
  v8[3] = &unk_2505B3930;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  -[NSMutableArray enumerateObjectsUsingBlock:](clientConnections, "enumerateObjectsUsingBlock:", v8);

  objc_sync_exit(v5);
}

void __33__SAServer_iterateClientProxies___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  id v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v4 = a2;
  dispatch_assert_queue_V2(v3);
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_25);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __33__SAServer_iterateClientProxies___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sa_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __33__SAServer_iterateClientProxies___block_invoke_2_cold_1();

}

- (void)requestMostRecentCrashDetectionEvent
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)requestCrashDetectionAuthorization:(id)a3
{
  void (**v4)(id, int64_t, void *);
  SAServer *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, int64_t, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  sa_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SAServer requestCrashDetectionAuthorization:].cold.3(v6, v7, v8, v9, v10, v11, v12, v13);

  v14 = +[SAAuthorization authorizationStatusForCurrentConnection](SAAuthorization, "authorizationStatusForCurrentConnection");
  if (v14 != 2)
  {
    if (+[SAAuthorization isInFlight](SAAuthorization, "isInFlight"))
    {
      sa_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SAServer requestCrashDetectionAuthorization:].cold.1(v16);

      +[SAError errorWithCode:](SAError, "errorWithCode:", 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v14, v17);
      goto LABEL_18;
    }
    +[SABundleManager bundleURLForCurrentConnection](SABundleManager, "bundleURLForCurrentConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (+[SAAuthorization startAuthorizationForBundleURL:preflightAuthorizationStatus:completionHandler:](SAAuthorization, "startAuthorizationForBundleURL:preflightAuthorizationStatus:completionHandler:", v17, v14, v4))
      {
LABEL_18:

        goto LABEL_19;
      }
      sa_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SAServer requestCrashDetectionAuthorization:].cold.2();

      +[SAError errorWithCode:](SAError, "errorWithCode:", 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v14, v19);
    }
    else
    {
      +[SAError errorWithCode:](SAError, "errorWithCode:", 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v14, v19);
    }

    goto LABEL_18;
  }
  sa_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315138;
    v21 = "-[SAServer requestCrashDetectionAuthorization:]";
    _os_log_impl(&dword_23457A000, v15, OS_LOG_TYPE_DEFAULT, "%s - app requesting authorization has already been authorized", (uint8_t *)&v20, 0xCu);
  }

  v4[2](v4, 2, 0);
LABEL_19:
  objc_sync_exit(v5);

}

- (void)dialVoiceCallToPhoneNumber:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  SATelephonyManager *telephonyManager;
  _QWORD v33[4];
  void (**v34)(id, _QWORD, void *);
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int64_t v38;
  __int16 v39;
  int64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  sa_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SAServer dialVoiceCallToPhoneNumber:completionHandler:].cold.2();

  if (!+[SAAuthorization currentConnectionAuthorizedForAnyEmergency](SAAuthorization, "currentConnectionAuthorizedForAnyEmergency"))
  {
    sa_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SAServer dialVoiceCallToPhoneNumber:completionHandler:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v20 = 1;
    goto LABEL_22;
  }
  -[SAServer checkAndResetClientState](self, "checkAndResetClientState");
  if (!-[SAServer numberOfVoiceCallAttempts](self, "numberOfVoiceCallAttempts"))
  {
    -[SAServer mostRecentCrashEvent](self, "mostRecentCrashEvent");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_18;
    v22 = (void *)v21;
    -[SAServer mostRecentCrashEvent](self, "mostRecentCrashEvent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeOfResolution");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceNow");
    v26 = -v25;
    objc_msgSend((id)objc_opt_class(), "emergencyResponseVoiceCallTimeout");
    v28 = v27;

    if (v28 <= v26)
    {
LABEL_18:
      sa_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[SAServer dialVoiceCallToPhoneNumber:completionHandler:]";
        _os_log_impl(&dword_23457A000, v29, OS_LOG_TYPE_DEFAULT, "%s - not placing voice call because request was not made around an emergency event.", buf, 0xCu);
      }

LABEL_21:
      v20 = 2;
LABEL_22:
      +[SAError errorWithCode:](SAError, "errorWithCode:", v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v30);
      goto LABEL_23;
    }
  }
  if (-[SAServer numberOfVoiceCallAttempts](self, "numberOfVoiceCallAttempts") > 0
    || ((v9 = -[SAServer numberOfVoiceCallAttempts](self, "numberOfVoiceCallAttempts"), v9 >= 0)
      ? (v10 = v9)
      : (v10 = -v9),
        v10 >= 3))
  {
    sa_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[SAServer dialVoiceCallToPhoneNumber:completionHandler:]";
      v37 = 2048;
      v38 = -[SAServer numberOfVoiceCallAttempts](self, "numberOfVoiceCallAttempts");
      _os_log_impl(&dword_23457A000, v11, OS_LOG_TYPE_DEFAULT, "%s - not placing voice call because number of call attempts have exceeded, attempts, %ld", buf, 0x16u);
    }

    goto LABEL_21;
  }
  sa_default_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v36 = "-[SAServer dialVoiceCallToPhoneNumber:completionHandler:]";
    v37 = 2112;
    v38 = (int64_t)v6;
    v39 = 2048;
    v40 = -[SAServer numberOfVoiceCallAttempts](self, "numberOfVoiceCallAttempts");
    _os_log_impl(&dword_23457A000, v31, OS_LOG_TYPE_DEFAULT, "%s - attempting to place voice call, phoneNumber: %@, callAttempts: %ld", buf, 0x20u);
  }

  telephonyManager = self->_telephonyManager;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __57__SAServer_dialVoiceCallToPhoneNumber_completionHandler___block_invoke;
  v33[3] = &unk_2505B3958;
  v34 = v7;
  -[SATelephonyManager placeVoiceCall:completionHandler:](telephonyManager, "placeVoiceCall:completionHandler:", v6, v33);
  v30 = v34;
LABEL_23:

}

void __57__SAServer_dialVoiceCallToPhoneNumber_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  sa_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v8 = 136315138;
      v9 = "-[SAServer dialVoiceCallToPhoneNumber:completionHandler:]_block_invoke";
      _os_log_impl(&dword_23457A000, v6, OS_LOG_TYPE_DEFAULT, "%s - voice call accepted", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v7)
  {
    v8 = 136315394;
    v9 = "-[SAServer dialVoiceCallToPhoneNumber:completionHandler:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_23457A000, v6, OS_LOG_TYPE_DEFAULT, "%s - voice call not accepted, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *messageQueue;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  int location;
  _BYTE location_4[18];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  sa_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SAServer listener:shouldAcceptNewConnection:].cold.1();

  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.developer.severe-vehicular-crash-event"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    objc_initWeak((id *)&location, self);
    messageQueue = self->_messageQueue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47__SAServer_listener_shouldAcceptNewConnection___block_invoke;
    v13[3] = &unk_2505B38E8;
    objc_copyWeak(&v15, (id *)&location);
    v14 = v5;
    dispatch_async(messageQueue, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)&location);
  }
  else
  {
    sa_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      location = 138412546;
      *(_QWORD *)location_4 = v5;
      *(_WORD *)&location_4[8] = 2112;
      *(_QWORD *)&location_4[10] = CFSTR("com.apple.developer.severe-vehicular-crash-event");
      _os_log_impl(&dword_23457A000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] New connection %@ missing entitlement: %@", (uint8_t *)&location, 0x16u);
    }

  }
  sa_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    location = 67109378;
    *(_DWORD *)location_4 = v8;
    *(_WORD *)&location_4[4] = 2112;
    *(_QWORD *)&location_4[6] = v5;
    _os_log_impl(&dword_23457A000, v11, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection: %d for connection: %@", (uint8_t *)&location, 0x12u);
  }

  return v8;
}

void __47__SAServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained[6];
  objc_sync_enter(v4);
  objc_msgSend(WeakRetained[6], "addObject:", *(_QWORD *)(a1 + 32));
  objc_sync_exit(v4);

  SAClientInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectInterface:", v5);

  SAServerInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setExportedInterface:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setExportedObject:", WeakRetained);
  objc_msgSend(*(id *)(a1 + 32), "setInterruptionHandler:", &__block_literal_global_28);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__SAServer_listener_shouldAcceptNewConnection___block_invoke_29;
  v7[3] = &unk_2505B39A0;
  objc_copyWeak(&v8, v2);
  objc_copyWeak(&v9, &location);
  objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", v7);
  objc_msgSend(*(id *)(a1 + 32), "resume");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __47__SAServer_listener_shouldAcceptNewConnection___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  sa_default_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23457A000, v0, OS_LOG_TYPE_DEFAULT, "SA client connection interrupted", v1, 2u);
  }

}

void __47__SAServer_listener_shouldAcceptNewConnection___block_invoke_29(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    v4 = WeakRetained[6];
    objc_sync_enter(v4);
    objc_msgSend(WeakRetained[6], "removeObject:", v3);
    objc_sync_exit(v4);

  }
  sa_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_23457A000, v5, OS_LOG_TYPE_DEFAULT, "SA client connection invalidated", v6, 2u);
  }

}

- (void)telephonyManager:(id)a3 didUpdateVoiceCallStatus:(int64_t)a4
{
  NSObject *messageQueue;
  _QWORD block[4];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SAServer_telephonyManager_didUpdateVoiceCallStatus___block_invoke;
  block[3] = &unk_2505B39C8;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a4;
  dispatch_async(messageQueue, block);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __54__SAServer_telephonyManager_didUpdateVoiceCallStatus___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  v4 = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(v4 - 1) < 2)
  {
    objc_msgSend(WeakRetained, "setNumberOfVoiceCallAttempts:", 1);
    sa_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      v6 = "Updating voice call attempts due to active call: 1";
      v7 = v5;
      v8 = 2;
LABEL_7:
      _os_log_impl(&dword_23457A000, v7, OS_LOG_TYPE_DEFAULT, v6, v9, v8);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v4 == 3)
  {
    objc_msgSend(WeakRetained, "setNumberOfVoiceCallAttempts:", objc_msgSend(WeakRetained, "numberOfVoiceCallAttempts") - 1);
    sa_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v9 = 134217984;
      *(_QWORD *)&v9[4] = objc_msgSend(v3, "numberOfVoiceCallAttempts");
      v6 = "Updating voice call attempts due to failure: %ld";
      v7 = v5;
      v8 = 12;
      goto LABEL_7;
    }
LABEL_8:

  }
  objc_msgSend(v3[2], "wakeApprovedAppsWithReason:completion:", 1, 0, *(_OWORD *)v9);
  objc_msgSend(v3, "updateVoiceCallStatus:", *(_QWORD *)(a1 + 40));

}

- (void)locationManager:(id)a3 didUpdateLocation:(id)a4
{
  SAServer *v5;
  NSObject *locationAcquired;
  id v7;

  v5 = self;
  v7 = a4;
  objc_sync_enter(v5);
  locationAcquired = v5->_locationAcquired;
  if (locationAcquired)
    dispatch_semaphore_signal(locationAcquired);
  objc_sync_exit(v5);

  -[SAServer setMostRecentLocation:](v5, "setMostRecentLocation:", v7);
}

- (CLLocation)mostRecentLocation
{
  return self->_mostRecentLocation;
}

- (void)setMostRecentLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (OS_dispatch_semaphore)locationAcquired
{
  return self->_locationAcquired;
}

- (void)setLocationAcquired:(id)a3
{
  objc_storeStrong((id *)&self->_locationAcquired, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAcquired, 0);
  objc_storeStrong((id *)&self->_mostRecentLocation, 0);
  objc_storeStrong((id *)&self->_criticalNotification, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_bundleManager, 0);
  objc_storeStrong((id *)&self->_telephonyManager, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)mostRecentCrashEvent
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setMostRecentCrashEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s - mostRecentCrashEvent nil, removing from NSUserDefaults", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setMostRecentCrashEvent:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_23457A000, v0, v1, "%s - Unable to save mostRecentCrashEvent in NSUserDefaults, mostRecentCrashEvent: %@, error: %@", v2);
  OUTLINED_FUNCTION_10();
}

- (void)setMostRecentCrashEvent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s - saving crash event in NSUserDefaults, mostRecentCrashEvent: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setMostRecentCrashEvent:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s, mostRecentCrashEvent: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)updateMostRecentCrashDetectionEvent:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s, crashEvent: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)notifyCrashDetectedAt:(uint64_t)a3 resolvedAt:(uint64_t)a4 resolvedWithResponse:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_23457A000, a1, a3, "Timeout getting location", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_11();
}

- (void)numberOfVoiceCallAttempts
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setNumberOfVoiceCallAttempts:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[SAServer setNumberOfVoiceCallAttempts:]";
  *(_WORD *)&v3[12] = 2048;
  *(_QWORD *)&v3[14] = a2;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_8(&dword_23457A000, a2, a3, "%s - Unable to save numberOfVoiceCallAttempts in NSUserDefaults, numberOfVoiceCallAttempts: %ld, error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], a1);
  OUTLINED_FUNCTION_10();
}

- (void)setNumberOfVoiceCallAttempts:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s - saving call attempts in NSUserDefaults, numberOfVoiceCallAttempts: %ld", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setNumberOfVoiceCallAttempts:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s, numberOfCallAttempts: %ld", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)updateVoiceCallStatus:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s, status: %ld", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __34__SAServer_updateVoiceCallStatus___block_invoke_2_cold_1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_23457A000, v0, (uint64_t)v0, "%s - authorized, sending, connection: %@, status: %ld", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

void __34__SAServer_updateVoiceCallStatus___block_invoke_2_cold_2()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_23457A000, v0, (uint64_t)v0, "%s - unauthorized, not sending, connection: %@, status: %ld", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

void __35__SAServer_sendCrashEventToClients__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  int v8[5];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a2 + 32), "mostRecentCrashEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136315650;
  OUTLINED_FUNCTION_12();
  v9 = v5;
  v10 = v6;
  OUTLINED_FUNCTION_5(&dword_23457A000, a3, v7, "%s - unauthorized, not sending, connection: %@, crashEvent: %@", (uint8_t *)v8);

}

void __35__SAServer_sendCrashEventToClients__block_invoke_22_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23457A000, log, OS_LOG_TYPE_DEBUG, "Critical notification scheduled", v1, 2u);
  OUTLINED_FUNCTION_11();
}

void __35__SAServer_sendCrashEventToClients__block_invoke_22_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a2, a3, "Error scheduling critical notification: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __33__SAServer_iterateClientProxies___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_23457A000, v0, v1, "%s - Error from remoteObjectProxyWithErrorHandler: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)requestCrashDetectionAuthorization:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SAServer requestCrashDetectionAuthorization:]";
  _os_log_error_impl(&dword_23457A000, log, OS_LOG_TYPE_ERROR, "%s - app requesting authorization but we are already prompting user for authorization.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)requestCrashDetectionAuthorization:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_23457A000, v0, v1, "%s - unable to start authorization for bundleURL, bundleURL: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)requestCrashDetectionAuthorization:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)dialVoiceCallToPhoneNumber:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s - not authorized,", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)dialVoiceCallToPhoneNumber:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s, phoneNumber: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s, newConnection: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
