@implementation ENDaemon

uint64_t __33__ENDaemon__xpcConnectionAccept___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "xpcConnectionEvent:", a2);
}

uint64_t __27__ENDaemon__scheduleUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

uint64_t __21__ENDaemon__activate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcListenerEvent:", a2);
}

- (void)xpcConnectionInvalidated:(id)a3
{
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", a3);
  -[ENDaemon _scheduleUpdate](self, "_scheduleUpdate");
}

- (unsigned)usageManagerActivate
{
  return self->_usageManagerActivate;
}

- (void)setUsageManagerActivate:(unsigned int)a3
{
  self->_usageManagerActivate = a3;
}

- (BOOL)prefSkipFileSigning
{
  return self->_prefSkipFileSigning;
}

- (BOOL)prefPaused
{
  return self->_prefPaused;
}

- (BOOL)prefEnabled
{
  return self->_prefEnabled;
}

- (int64_t)prefDifferentialPrivacyConsent
{
  return self->_prefDifferentialPrivacyConsent;
}

- (ENRegion)onboardingRegionTrigger
{
  return self->_onboardingRegionTrigger;
}

- (int64_t)getOverallStatus
{
  id WeakRetained;
  int v4;

  if (self->_prefServerForceDisable || self->_prefStoreDemoMode)
    return 4;
  if (!self->_prefEnabled)
    return 2;
  if (self->_prefPaused)
    return 5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "isBluetoothPoweredOn");

  if (v4)
    return 1;
  else
    return 3;
}

- (unsigned)appDequeueActivityFlagsWithBundleID:(id)a3
{
  NSMutableDictionary *appActivities;
  id v5;
  void *v6;
  unsigned int v7;

  appActivities = self->_appActivities;
  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](appActivities, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appActivities, "setObject:forKeyedSubscript:", 0, v5);
  return v7;
}

- (ENActiveEntity)activeEntity
{
  return self->_activeEntity;
}

- (void)_xpcListenerEvent:(id)a3
{
  void *v4;
  int v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  if (MEMORY[0x1D17A8408]() == MEMORY[0x1E0C812E0])
  {
    -[ENDaemon _xpcConnectionAccept:](self, "_xpcConnectionAccept:", v8);
    goto LABEL_7;
  }
  v4 = v8;
  if (v8 == (id)MEMORY[0x1E0C81260])
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon != -1 || (v6 = _LogCategory_Initialize(), v4 = v8, v6))
      {
        LogPrintF_safe();
        goto LABEL_7;
      }
    }
  }
  else if (gLogCategory__ENDaemon <= 90)
  {
    if (gLogCategory__ENDaemon != -1 || (v5 = _LogCategory_Initialize(), v4 = v8, v5))
    {
      CUPrintXPC();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

LABEL_7:
      v4 = v8;
    }
  }

}

- (void)_xpcConnectionAccept:(id)a3
{
  _xpc_connection_s *v4;
  uint64_t pid;
  void *v6;
  id WeakRetained;
  void *v8;
  char *v9;
  ENXPCConnection *v10;
  _BOOL4 v11;
  const char *v12;
  NSMutableSet *xpcConnections;
  NSMutableSet *v14;
  NSMutableSet *v15;
  const char *v16;
  void *v17;
  _QWORD handler[5];
  _OWORD v19[4];

  v4 = (_xpc_connection_s *)a3;
  pid = xpc_connection_get_pid(v4);
  xpc_connection_get_audit_token();
  memset(v19, 0, sizeof(v19));
  +[ENXPCClient clientWithAuditToken:pid:](ENXPCClient, "clientWithAuditToken:pid:", v19, pid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "entitledForLogging"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "setENAppHasLoggingEntitlement:", 1);

    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLoggingEntitledApp:", 1);

  }
  if (gLogCategory_ENDaemon <= 20 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintPID();
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "signingIdentity");
    v16 = v9;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  v10 = objc_alloc_init(ENXPCConnection);
  -[ENXPCConnection setClient:](v10, "setClient:", v6);
  -[ENXPCConnection setDaemon:](v10, "setDaemon:", self);
  -[ENXPCConnection setDispatchQueue:](v10, "setDispatchQueue:", self->_dispatchQueue);
  -[ENXPCConnection setXpcCnx:](v10, "setXpcCnx:", v4);
  if ((objc_msgSend(v6, "entitledToSkipFileSigningVerification") & 1) != 0
    || -[ENDaemon prefSkipFileSigning](self, "prefSkipFileSigning"))
  {
    -[ENXPCConnection setSkipFileSigningVerification:](v10, "setSkipFileSigningVerification:", 1, v16, v17);
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v11 = -[ENDaemon prefSkipFileSigning](self, "prefSkipFileSigning");
      v12 = "entitlement";
      if (v11)
        v12 = "development mode pref";
      v16 = v12;
      LogPrintF_safe();
    }
  }
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __33__ENDaemon__xpcConnectionAccept___block_invoke;
  handler[3] = &unk_1E87D9D60;
  handler[4] = v10;
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_dispatchQueue);
  xpc_connection_activate(v4);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E28]);
    v15 = self->_xpcConnections;
    self->_xpcConnections = v14;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v10, v16);
  -[ENXPCConnection activate](v10, "activate");

}

- (void)_update
{
  NSString *prefRegionIdentifierOverride;
  void *v4;
  void *v5;

  self->_updatePending = 0;
  if (-[ENDaemon _bluetoothMonitorShouldRun](self, "_bluetoothMonitorShouldRun"))
    -[ENDaemon _bluetoothMonitorEnsureStarted](self, "_bluetoothMonitorEnsureStarted");
  else
    -[ENDaemon _bluetoothMonitorEnsureStopped](self, "_bluetoothMonitorEnsureStopped");
  if (self->_prefEnabled
    && !self->_prefPaused
    && -[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked"))
  {
    -[ENDaemon _bluetoothTracingEnsureStarted](self, "_bluetoothTracingEnsureStarted");
  }
  else
  {
    -[ENDaemon _bluetoothTracingEnsureStopped](self, "_bluetoothTracingEnsureStopped");
  }
  if (self->_prefEnabled)
    -[ENDaemon _databasesEnsureOpened](self, "_databasesEnsureOpened");
  else
    -[ENDaemon _databasesEnsureClosed](self, "_databasesEnsureClosed");
  if (self->_prefEnabled)
    -[ENDaemon _exposureManagersEnsureStarted](self, "_exposureManagersEnsureStarted");
  else
    -[ENDaemon _exposureManagersEnsureStopped](self, "_exposureManagersEnsureStopped");
  if (self->_prefConfigurationManagerEnabled)
    -[ENDaemon _configurationManagerEnsureStarted](self, "_configurationManagerEnsureStarted");
  else
    -[ENDaemon _configurationManagerEnsureStopped](self, "_configurationManagerEnsureStopped");
  if (self->_prefEnabled || !self->_availabilityAlertDisabled)
  {
    -[ENRegionMonitor enableRegionMonitor](self->_regionMonitor, "enableRegionMonitor");
    -[ENRegionMonitor updateRegionHistoryFileStatus](self->_regionMonitor, "updateRegionHistoryFileStatus");
  }
  else
  {
    -[ENRegionMonitor disableRegionMonitor](self->_regionMonitor, "disableRegionMonitor");
  }
  if (self->_prefDifferentialPrivacyConsent == 2)
    -[ENDaemon _differentialPrivacyEnsureStarted](self, "_differentialPrivacyEnsureStarted");
  else
    -[ENDaemon _differentialPrivacyEnsureStopped](self, "_differentialPrivacyEnsureStopped");
  if (!self->_prefDeveloperServerConfiguration)
  {
    prefRegionIdentifierOverride = self->_prefRegionIdentifierOverride;
    if (!prefRegionIdentifierOverride || !-[NSString length](prefRegionIdentifierOverride, "length"))
    {
      -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clearTemporaryServerConfigurations");

      -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clearTemporaryCountrySubdivisionList");

    }
  }
  -[ENDaemon _schedulePeriodicPersistencePurge](self, "_schedulePeriodicPersistencePurge");
  -[ENDaemon _updateOverallStatus](self, "_updateOverallStatus");
}

- (void)_updateOverallStatus
{
  unint64_t overallStatus;
  int64_t v4;
  unint64_t v5;
  const char *v6;
  const char *v7;
  ENDaemon *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 wasInRestrictedStatus;
  dispatch_time_t v13;
  NSObject *dispatchQueue;
  const char *v15;
  _BOOL8 wasInDifferentActiveRegion;
  _QWORD block[6];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  overallStatus = self->_overallStatus;
  v4 = -[ENDaemon getOverallStatus](self, "getOverallStatus");
  if (v4 != overallStatus)
  {
    v5 = v4;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      if (overallStatus > 6)
        v6 = "?";
      else
        v6 = off_1E87DAE18[overallStatus];
      if (v5 > 6)
        v7 = "?";
      else
        v7 = off_1E87DAE18[v5];
      v15 = v6;
      wasInDifferentActiveRegion = (_BOOL8)v7;
      LogPrintF_safe();
    }
    self->_overallStatus = v5;
    if (overallStatus - 1 < 2)
    {
      if (overallStatus == 1 && v5 == 4)
      {
        -[ENDaemon notifyUserWithStatus:](self, "notifyUserWithStatus:", 4);
      }
      else if (v5 == 1)
      {
        -[ENDaemon userNotificationCenter](self, "userNotificationCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = CFSTR("com.apple.ExposureNotification.UserNotification.off");
        objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v18, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeDeliveredNotificationsWithIdentifiers:", v11);

      }
      *(_WORD *)&self->_wasInRestrictedStatus = 0;
      CFPrefs_RemoveValue();
      goto LABEL_29;
    }
    if (overallStatus != 3)
    {
      if (overallStatus != 4)
        goto LABEL_30;
      if (v5 != 3)
      {
        if (v5 == 1)
        {
          v8 = self;
          v9 = 1;
LABEL_25:
          -[ENDaemon notifyUserWithStatus:](v8, "notifyUserWithStatus:", v9, v15, wasInDifferentActiveRegion);
          goto LABEL_30;
        }
        goto LABEL_30;
      }
      self->_wasInRestrictedStatus = 1;
LABEL_29:
      CFPrefs_RemoveValue();
      goto LABEL_30;
    }
    if (v5 != 1)
    {
      if (v5 == 4)
      {
        v8 = self;
        v9 = 4;
        goto LABEL_25;
      }
LABEL_30:
      -[ENDaemon monthlyTriggerActivateWithIntervalOverride:](self, "monthlyTriggerActivateWithIntervalOverride:", 0, v15, wasInDifferentActiveRegion);
      -[ENDaemon xpcReportStatus](self, "xpcReportStatus");
      return;
    }
    wasInRestrictedStatus = self->_wasInRestrictedStatus;
    if (!self->_wasInRestrictedStatus && !self->_wasInDifferentActiveRegion)
      goto LABEL_30;
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_39;
        wasInRestrictedStatus = self->_wasInRestrictedStatus;
      }
      v15 = (const char *)wasInRestrictedStatus;
      wasInDifferentActiveRegion = self->_wasInDifferentActiveRegion;
      LogPrintF_safe();
    }
LABEL_39:
    *(_WORD *)&self->_wasInRestrictedStatus = 0;
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    v13 = dispatch_time(0, 5000000000);
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__ENDaemon__updateOverallStatus__block_invoke;
    block[3] = &unk_1E87D9E80;
    block[4] = self;
    block[5] = 1;
    dispatch_after(v13, dispatchQueue, block);
    goto LABEL_30;
  }
}

- (void)_scheduleUpdate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (!self->_updatePending)
  {
    self->_updatePending = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__ENDaemon__scheduleUpdate__block_invoke;
    block[3] = &unk_1E87D9C28;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_schedulePeriodicPersistencePurge
{
  NSBackgroundActivityScheduler *v3;
  NSBackgroundActivityScheduler *persistencePurgeScheduler;
  double prefDatabasePurgeInterval;
  double v6;
  OS_dispatch_queue *dispatchQueue;
  NSBackgroundActivityScheduler *v8;
  OS_dispatch_queue *v9;
  void *v10;
  double v11;
  _QWORD v12[6];

  if (!self->_persistencePurgeScheduler)
  {
    v3 = (NSBackgroundActivityScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B8]), "initWithIdentifier:", CFSTR("com.apple.bluetooth.exposurenotification.databasepurge"));
    persistencePurgeScheduler = self->_persistencePurgeScheduler;
    self->_persistencePurgeScheduler = v3;

    -[NSBackgroundActivityScheduler setQualityOfService:](self->_persistencePurgeScheduler, "setQualityOfService:", 17);
  }
  prefDatabasePurgeInterval = 86400.0;
  if (self->_prefDatabasePurgeInterval > 0.0 && IsAppleInternalBuild())
    prefDatabasePurgeInterval = self->_prefDatabasePurgeInterval;
  -[NSBackgroundActivityScheduler interval](self->_persistencePurgeScheduler, "interval");
  if (v6 != prefDatabasePurgeInterval)
  {
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      -[NSBackgroundActivityScheduler identifier](self->_persistencePurgeScheduler, "identifier");
      v11 = prefDatabasePurgeInterval;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    -[NSBackgroundActivityScheduler setInterval:](self->_persistencePurgeScheduler, "setInterval:", prefDatabasePurgeInterval, v10, *(_QWORD *)&v11);
    -[NSBackgroundActivityScheduler setRepeats:](self->_persistencePurgeScheduler, "setRepeats:", 1);
    dispatchQueue = self->_dispatchQueue;
    v8 = self->_persistencePurgeScheduler;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__ENDaemon__schedulePeriodicPersistencePurge__block_invoke;
    v12[3] = &unk_1E87DA520;
    v12[4] = dispatchQueue;
    v12[5] = self;
    v9 = dispatchQueue;
    -[NSBackgroundActivityScheduler scheduleWithBlock:](v8, "scheduleWithBlock:", v12);

  }
}

- (void)_exposureManagersEnsureStopped
{
  ENDownloadManager *downloadManager;
  ENDownloadManager *v4;
  ENExposureDetectionManager *exposureDetectionManager;
  ENTestResultManager *testResultManager;
  ENTextMessageManager *textMessageManager;

  downloadManager = self->_downloadManager;
  if (downloadManager || self->_exposureDetectionManager || self->_testResultManager || self->_textMessageManager)
  {
    -[ENDownloadManager invalidate](downloadManager, "invalidate");
    v4 = self->_downloadManager;
    self->_downloadManager = 0;

    -[ENExposureDetectionManager invalidate](self->_exposureDetectionManager, "invalidate");
    exposureDetectionManager = self->_exposureDetectionManager;
    self->_exposureDetectionManager = 0;

    -[ENTestResultManager invalidate](self->_testResultManager, "invalidate");
    testResultManager = self->_testResultManager;
    self->_testResultManager = 0;

    -[ENTextMessageManager invalidate](self->_textMessageManager, "invalidate");
    textMessageManager = self->_textMessageManager;
    self->_textMessageManager = 0;

  }
}

- (void)_differentialPrivacyEnsureStopped
{
  ENDifferentialPrivacyManager *differentialPrivacyManager;

  if (self->_differentialPrivacyManager)
  {
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    differentialPrivacyManager = self->_differentialPrivacyManager;
    self->_differentialPrivacyManager = 0;

  }
}

- (void)_databasesEnsureClosed
{
  ENExposureDatabase *exposureDatabase;

  -[ENExposureDatabase close](self->_exposureDatabase, "close");
  exposureDatabase = self->_exposureDatabase;
  self->_exposureDatabase = 0;

}

- (void)_configurationManagerEnsureStarted
{
  ENConfigurationManager *v3;
  ENConfigurationManager *configurationManager;
  ENConfigurationManager *v5;

  if (!self->_configurationManager)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v3 = -[ENConfigurationManager initWithDelegate:activeEntity:]([ENConfigurationManager alloc], "initWithDelegate:activeEntity:", self, self->_activeEntity);
    -[ENConfigurationManager setRegionMonitor:](v3, "setRegionMonitor:", self->_regionMonitor);
    configurationManager = self->_configurationManager;
    self->_configurationManager = v3;
    v5 = v3;

    -[ENConfigurationManager activate](self->_configurationManager, "activate");
  }
}

- (void)_bluetoothTracingEnsureStopped
{
  NSString *btTracingAppID;

  if (self->_btTracingAppID)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    -[ENDaemon _bluetoothTracingStop](self, "_bluetoothTracingStop");
    btTracingAppID = self->_btTracingAppID;
    self->_btTracingAppID = 0;

  }
}

- (BOOL)_bluetoothMonitorShouldRun
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_xpcConnections;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "manager", (_QWORD)v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_bluetoothMonitorEnsureStarted
{
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id location;

  if (!self->_btMonitorStarted)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    location = 0;
    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __42__ENDaemon__bluetoothMonitorEnsureStarted__block_invoke;
    v4[3] = &unk_1E87DA430;
    objc_copyWeak(&v5, &location);
    objc_msgSend(WeakRetained, "startPowerMonitoringWithStateChangeHandler:", v4);

    self->_btMonitorStarted = 1;
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (ENDaemon)init
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *dispatchExposureDetectionManagingQueue;
  NSObject *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *dispatchDownloadManagingQueue;
  NSObject *v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *dispatchTestResultManagingQueue;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  id v19;
  ENDaemon *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *remoteUISessions;
  ENOnboardingManager *v26;
  ENOnboardingManager *onboardingManager;
  void *v29;
  id v30;
  objc_super v31;

  if (objc_opt_class()
    && (v31.receiver = self,
        v31.super_class = (Class)ENDaemon,
        (self = -[ENDaemon init](&v31, sel_init)) != 0))
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_dispatch_queue *)dispatch_queue_create("ENDaemon", v3);
    dispatchQueue = self->_dispatchQueue;
    self->_dispatchQueue = v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (OS_dispatch_queue *)dispatch_queue_create("ENDetection", v6);
    dispatchExposureDetectionManagingQueue = self->_dispatchExposureDetectionManagingQueue;
    self->_dispatchExposureDetectionManagingQueue = v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (OS_dispatch_queue *)dispatch_queue_create("ENDownload", v9);
    dispatchDownloadManagingQueue = self->_dispatchDownloadManagingQueue;
    self->_dispatchDownloadManagingQueue = v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (OS_dispatch_queue *)dispatch_queue_create("ENTestResult", v12);
    dispatchTestResultManagingQueue = self->_dispatchTestResultManagingQueue;
    self->_dispatchTestResultManagingQueue = v13;

    self->_tccChangedNotifyToken = -1;
    *(_QWORD *)&self->_prefsChangedNotifyToken = -1;
    *(_QWORD *)&self->_proxyStatusChangedNotifyToken = -1;
    self->_screenLockNotifyToken = -1;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E18]), "initWithCapacity:", 5);
    -[ENDaemon setPreviouslyTrackedApps:](self, "setPreviouslyTrackedApps:", v15);

    _CFPreferencesSetBackupDisabled();
    ENDataVaultURL();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0C999E0];
    v30 = 0;
    v18 = objc_msgSend(v16, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AA98], v17, &v30);
    v19 = v30;

    if ((v18 & 1) == 0
      && gLogCategory_ENDaemon <= 90
      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      ENDataVaultURL();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC798]), "initWithBundleIdentifier:queue:", CFSTR("com.apple.ExposureNotification.UserNotification"), self->_dispatchQueue);
    -[ENDaemon setUserNotificationCenter:](self, "setUserNotificationCenter:", v21);

    -[ENDaemon userNotificationCenter](self, "userNotificationCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegate:", self);

    -[ENDaemon userNotificationCenter](self, "userNotificationCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWantsNotificationResponsesDelivered");

    -[ENTemporaryExposureKeyManager resetClientState](self->_temporaryExposureKeyManager, "resetClientState");
    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E00]);
    remoteUISessions = self->_remoteUISessions;
    self->_remoteUISessions = v24;

    v26 = objc_alloc_init(ENOnboardingManager);
    onboardingManager = self->_onboardingManager;
    self->_onboardingManager = v26;

    -[ENOnboardingManager setDelegate:](self->_onboardingManager, "setDelegate:", self);
    self = self;

    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSString)description
{
  return (NSString *)-[ENDaemon descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id *v3;
  uint64_t v4;
  unint64_t v5;
  const char *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  int v14;
  uint64_t v15;
  const char *v16;
  id *v17;
  unint64_t v18;
  const char *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  void *v26;
  id *v27;
  const char *v28;
  id *v29;
  id *v30;
  id *v31;
  const char *v32;
  id *v33;
  id *v34;
  id *v35;
  id *v36;
  id *v37;
  const char *v38;
  id *v39;
  uint64_t Int64;
  id *v41;
  const char *v42;
  id *v43;
  void *v44;
  unsigned int v45;
  id *v46;
  id *v47;
  id *v48;
  const char *v49;
  id *v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  void *v54;
  void *v55;
  id *v56;
  id *v57;
  id *v58;
  uint64_t v59;
  BOOL v60;
  id *v61;
  id *v62;
  NSMutableSet *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  id *v67;
  id *v68;
  void *v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t j;
  id *v74;
  void *v75;
  id *v76;
  uint64_t *v77;
  id v78;
  id *v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  id *v83;
  id v84;
  ENActiveEntity *activeEntity;
  void *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  void *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t usageUserEnabled;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  NSString *btTracingAppID;
  const char *v103;
  uint64_t usageUserDisabled;
  void *v105;
  const char *v106;
  uint64_t usageUserPaused;
  uint64_t usageUserUnpaused;
  uint64_t usageUserAlertShare;
  uint64_t usageUserAlertDontShare;
  uint64_t usageUserAlertReset;
  uint64_t usageUserAlertDontReset;
  uint64_t usageManagerActivate;
  uint64_t usageGetDiagnosisKeys;
  uint64_t usageResetAllData;
  uint64_t usageExposureDetectFileActivate;
  uint64_t usageExposureDetectFileAddKeys;
  uint64_t usageExposureDetectFileFinish;
  uint64_t usageExposureDetectFileGetExposures;
  uint64_t usageExposureDetectFileGetExposureWindows;
  unsigned int v121;
  ENConfigurationManager *v122;
  void *v123;
  id v125;
  _QWORD v126[6];
  _QWORD v127[5];
  id v128;
  uint64_t *v129;
  id v130;
  id v131;
  id v132;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  id v138;
  id v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id obj;
  uint64_t v172;
  uint64_t *v173;
  uint64_t v174;
  uint64_t (*v175)(uint64_t, uint64_t);
  void (*v176)(uint64_t);
  id v177;
  _BYTE v178[128];
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x1E0C80C00];
  v121 = a3;
  v172 = 0;
  v173 = &v172;
  v175 = __Block_byref_object_copy__3;
  v176 = __Block_byref_object_dispose__3;
  v174 = 0x3032000000;
  v177 = 0;
  obj = 0;
  NSAppendPrintF_safe();
  objc_storeStrong(&v177, 0);
  v3 = (id *)(v173 + 5);
  v170 = (id)v173[5];
  mach_continuous_time();
  UpTicksToSeconds();
  mach_absolute_time();
  v4 = UpTicksToSeconds();
  v5 = -[ENDaemon getOverallStatus](self, "getOverallStatus");
  if (v5 > 6)
    v6 = "?";
  else
    v6 = off_1E87DAE18[v5];
  v106 = v6;
  NSAppendPrintF();
  objc_storeStrong(v3, v170);
  v7 = (id *)(v173 + 5);
  v169 = (id)v173[5];
  activeEntity = self->_activeEntity;
  NSAppendPrintF_safe();
  objc_storeStrong(v7, v169);
  v122 = self->_configurationManager;
  -[ENConfigurationManager configurationStore](v122, "configurationStore", activeEntity, v4, v106);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENActiveEntity entity](self->_activeEntity, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v123, "configurationForRegion:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "serverConfigurationForRegion:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userConsent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id *)(v173 + 5);
    v168 = (id)v173[5];
    v14 = objc_msgSend(v11, "enEnabled");
    v15 = objc_msgSend(v10, "enVersion");
    v16 = "enabled";
    if (!v14)
      v16 = "disabled";
    v88 = v16;
    v101 = v15;
    NSAppendPrintF_safe();
    objc_storeStrong(v13, v168);
    v17 = (id *)(v173 + 5);
    v167 = (id)v173[5];
    objc_msgSend(v12, "consent", v88, v101);
    v18 = objc_msgSend(v12, "differentialPrivacyConsent");
    if (v18 > 4)
      v19 = "?";
    else
      v19 = off_1E87DADC8[v18];
    v100 = v19;
    NSAppendPrintF_safe();
    objc_storeStrong(v17, v167);
    v20 = (id *)(v173 + 5);
    v166 = (id)v173[5];
    v87 = v11;
    NSAppendPrintF_safe();
    objc_storeStrong(v20, v166);

  }
  -[ENActiveEntity entity](self->_activeEntity, "entity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CA5858], "applicationProxyForIdentifier:placeholder:", v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id *)(v173 + 5);
    v165 = (id)v173[5];
    objc_msgSend(v23, "appState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "isInstalled");
    objc_msgSend(v23, "appState", v87, v100);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "isPlaceholder");
    -[ENDaemon tccAccessForBundleID:](self, "tccAccessForBundleID:", v22);
    NSAppendPrintF_safe();
    objc_storeStrong(v24, v165);

  }
  v27 = (id *)(v173 + 5);
  v164 = (id)v173[5];
  if (-[ENConfigurationManager isInGracePeriodTransition](v122, "isInGracePeriodTransition"))
    v28 = "yes";
  else
    v28 = "no";
  v89 = v28;
  NSAppendPrintF_safe();
  objc_storeStrong(v27, v164);
  if (-[NSMutableDictionary count](self->_appActivities, "count", v89))
  {
    v29 = (id *)(v173 + 5);
    v163 = (id)v173[5];
    NSAppendPrintF();
    objc_storeStrong(v29, v163);
  }
  v30 = (id *)(v173 + 5);
  v162 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v30, v162);
  v31 = (id *)(v173 + 5);
  v161 = (id)v173[5];
  v32 = "enabled";
  if (self->_availabilityAlertDisabled)
    v32 = "disabled";
  v90 = v32;
  NSAppendPrintF_safe();
  objc_storeStrong(v31, v161);
  -[ENDaemon _getAvailabilityAlertCountIncrement:reset:](self, "_getAvailabilityAlertCountIncrement:reset:", 0, 0, v90);
  v33 = (id *)(v173 + 5);
  v160 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v33, v160);
  v34 = (id *)(v173 + 5);
  v159 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v34, v159);
  v35 = (id *)(v173 + 5);
  v158 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v35, v158);
  v36 = (id *)(v173 + 5);
  v157 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v36, v157);
  v37 = (id *)(v173 + 5);
  v156 = (id)v173[5];
  if (self->_prefStoreDemoMode)
    v38 = "yes";
  else
    v38 = "no";
  v91 = v38;
  NSAppendPrintF_safe();
  objc_storeStrong(v37, v156);
  if (-[NSMutableOrderedSet count](self->_previouslyTrackedApps, "count", v91))
  {
    v39 = (id *)(v173 + 5);
    v155 = (id)v173[5];
    NSAppendPrintF();
    objc_storeStrong(v39, v155);
  }
  Int64 = CFPrefs_GetInt64();
  v41 = (id *)(v173 + 5);
  v154 = (id)v173[5];
  if (Int64)
    v42 = "yes";
  else
    v42 = "no";
  v92 = v42;
  NSAppendPrintF_safe();
  objc_storeStrong(v41, v154);
  v43 = (id *)(v173 + 5);
  v153 = (id)v173[5];
  -[ENActiveEntity entity](self->_activeEntity, "entity", v92);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bundleIdentifier");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  btTracingAppID = self->_btTracingAppID;
  NSAppendPrintF_safe();
  objc_storeStrong(v43, v153);

  v45 = -[ENDaemon _getLegalConsentPageCount](self, "_getLegalConsentPageCount", v93, btTracingAppID);
  v46 = (id *)(v173 + 5);
  v152 = (id)v173[5];
  v94 = v45;
  NSAppendPrintF_safe();
  objc_storeStrong(v46, v152);
  -[ENDaemon _getExposureMatchAttemptBool](self, "_getExposureMatchAttemptBool", v94);
  v47 = (id *)(v173 + 5);
  v151 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v47, v151);
  v48 = (id *)(v173 + 5);
  v150 = (id)v173[5];
  if (self->_monthlySummaryDisabled)
    v49 = "yes";
  else
    v49 = "no";
  v95 = v49;
  NSAppendPrintF_safe();
  objc_storeStrong(v48, v150);
  v50 = (id *)(v173 + 5);
  v149 = (id)v173[5];
  v51 = -[PrivacyProxyServiceStatus serviceStatus](self->_networkProxyStatus, "serviceStatus", v95);
  if ((self->_networkProxyTraffic & 0x800) != 0)
    v52 = "yes";
  else
    v52 = "no";
  v96 = v51;
  v103 = v52;
  NSAppendPrintF_safe();
  objc_storeStrong(v50, v149);
  -[ENActiveEntity entity](self->_activeEntity, "entity", v96, v103);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "region");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "serverConfigurationForRegion:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    v56 = (id *)(v173 + 5);
    v148 = (id)v173[5];
    objc_msgSend(v55, "isChaffingEnabled");
    if (self->_prefNetworkProxyEnabled)
      objc_msgSend(v55, "chaffingSelectionPercentageAlternative");
    else
      objc_msgSend(v55, "chaffingSelectionPercentage");
    NSAppendPrintF_safe();
    objc_storeStrong(v56, v148);
  }

  v57 = (id *)(v173 + 5);
  v147 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v57, v147);
  v58 = (id *)(v173 + 5);
  v146 = (id)v173[5];
  usageExposureDetectFileGetExposures = self->_usageExposureDetectFileGetExposures;
  usageExposureDetectFileGetExposureWindows = self->_usageExposureDetectFileGetExposureWindows;
  usageExposureDetectFileAddKeys = self->_usageExposureDetectFileAddKeys;
  usageExposureDetectFileFinish = self->_usageExposureDetectFileFinish;
  usageResetAllData = self->_usageResetAllData;
  usageExposureDetectFileActivate = self->_usageExposureDetectFileActivate;
  usageManagerActivate = self->_usageManagerActivate;
  usageGetDiagnosisKeys = self->_usageGetDiagnosisKeys;
  usageUserAlertReset = self->_usageUserAlertReset;
  usageUserAlertDontReset = self->_usageUserAlertDontReset;
  usageUserAlertShare = self->_usageUserAlertShare;
  usageUserAlertDontShare = self->_usageUserAlertDontShare;
  usageUserPaused = self->_usageUserPaused;
  usageUserUnpaused = self->_usageUserUnpaused;
  usageUserEnabled = self->_usageUserEnabled;
  usageUserDisabled = self->_usageUserDisabled;
  NSAppendPrintF_safe();
  objc_storeStrong(v58, v146);
  v59 = -[NSMutableSet count](self->_xpcConnections, "count", usageUserEnabled, usageUserDisabled, usageUserPaused, usageUserUnpaused, usageUserAlertShare, usageUserAlertDontShare, usageUserAlertReset, usageUserAlertDontReset, usageManagerActivate, usageGetDiagnosisKeys, usageResetAllData, usageExposureDetectFileActivate, usageExposureDetectFileAddKeys, usageExposureDetectFileFinish, usageExposureDetectFileGetExposures, usageExposureDetectFileGetExposureWindows);
  v60 = v59 != 0;
  if (v59)
  {
    v61 = (id *)(v173 + 5);
    v145 = (id)v173[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v61, v145);
    v62 = (id *)(v173 + 5);
    v144 = (id)v173[5];
    v98 = v59;
    NSAppendPrintF_safe();
    objc_storeStrong(v62, v144);
    v142 = 0u;
    v143 = 0u;
    v140 = 0u;
    v141 = 0u;
    v63 = self->_xpcConnections;
    v64 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v140, v179, 16, v98);
    if (v64)
    {
      v65 = *(_QWORD *)v141;
      do
      {
        for (i = 0; i != v64; ++i)
        {
          if (*(_QWORD *)v141 != v65)
            objc_enumerationMutation(v63);
          v67 = (id *)(v173 + 5);
          v139 = (id)v173[5];
          CUDescriptionWithLevel();
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF_safe();
          objc_storeStrong(v67, v139);

        }
        v64 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v140, v179, 16, v99);
      }
      while (v64);
    }

    v68 = (id *)(v173 + 5);
    v138 = (id)v173[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v68, v138);
  }
  if (v121 <= 0x13)
  {
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v69 = (void *)CFPrefs_CopyKeys();
    v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v134, v178, 16);
    if (!v70)
    {
LABEL_62:

      goto LABEL_63;
    }
    v71 = 0;
    v72 = *(_QWORD *)v135;
    do
    {
      for (j = 0; j != v70; ++j)
      {
        if (*(_QWORD *)v135 != v72)
          objc_enumerationMutation(v69);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v60)
          {
            v74 = (id *)(v173 + 5);
            v133 = (id)v173[5];
            NSAppendPrintF_safe();
            objc_storeStrong(v74, v133);
          }
          v75 = (void *)CFPrefs_CopyTypedValue();
          v76 = (id *)(v173 + 5);
          v132 = (id)v173[5];
          CUPrintNSObjectOneLine();
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF();
          objc_storeStrong(v76, v132);

          ++v71;
          v60 = 1;
        }
      }
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v134, v178, 16);
    }
    while (v70);

    if (v71 >= 1)
    {
      v77 = v173;
      v131 = (id)v173[5];
      NSAppendPrintF_safe();
      v78 = v131;
      v69 = (void *)v77[5];
      v77[5] = (uint64_t)v78;
      goto LABEL_62;
    }
  }
LABEL_63:
  v79 = (id *)(v173 + 5);
  v130 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v79, v130);
  -[ENDaemon _readPreferenceRegionPendingOnboarding](self, "_readPreferenceRegionPendingOnboarding");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "allRegionServerConfigurations");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (unint64_t)objc_msgSend(v81, "count") > 0xA;

  if (v82)
  {
    v127[0] = MEMORY[0x1E0C809B0];
    v127[1] = 3221225472;
    v127[2] = __33__ENDaemon_descriptionWithLevel___block_invoke;
    v127[3] = &unk_1E87DA138;
    v127[4] = v123;
    v128 = v80;
    v129 = &v172;
    objc_msgSend(v123, "enumerateCachedRegionServerConfigurationsWithHandler:", v127);

  }
  else
  {
    v126[0] = MEMORY[0x1E0C809B0];
    v126[1] = 3221225472;
    v126[2] = __33__ENDaemon_descriptionWithLevel___block_invoke_2;
    v126[3] = &unk_1E87DA160;
    v126[4] = v123;
    v126[5] = &v172;
    objc_msgSend(v123, "enumerateCachedRegionServerConfigurationsWithHandler:", v126);
  }
  v83 = (id *)(v173 + 5);
  v125 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v83, v125);
  v84 = (id)v173[5];

  _Block_object_dispose(&v172, 8);
  return v84;
}

void __33__ENDaemon_descriptionWithLevel___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id obj;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v3, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationForRegion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userConsent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "consent") || objc_msgSend(v6, "everStartedOnboarding"))
  {

  }
  else
  {
    v11 = (void *)a1[5];
    objc_msgSend(v6, "region");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v11, "isEqual:", v12);

    if (!(_DWORD)v11)
      goto LABEL_5;
  }
  v8 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v8 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v8 + 40), obj);
  v9 = *(_QWORD *)(a1[6] + 8);
  v14 = *(id *)(v9 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v9 + 40), v14);
  v10 = *(_QWORD *)(a1[6] + 8);
  v13 = *(id *)(v10 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v10 + 40), v13);
LABEL_5:

}

void __33__ENDaemon_descriptionWithLevel___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id obj;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  v5 = a2;
  objc_msgSend(v5, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationForRegion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v4 + 40), obj);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(id *)(v8 + 40);
  NSAppendPrintF_safe();

  objc_storeStrong((id *)(v8 + 40), v11);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(id *)(v9 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v9 + 40), v10);
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (GestaltGetDeviceClass() == 1)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __20__ENDaemon_activate__block_invoke;
    block[3] = &unk_1E87D9C28;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
  else if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

uint64_t __20__ENDaemon_activate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    v2 = result;
    *(_BYTE *)(v1 + 16) = 1;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    return objc_msgSend(*(id *)(v2 + 32), "_activate");
  }
  return result;
}

- (id)_readPreferenceActiveEntity
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v8;
  int v9;
  id v10;

  CFDataGetTypeID();
  v2 = (void *)CFPrefs_CopyTypedValue();
  if (!objc_msgSend(v2, "length"))
  {
    v3 = 0;
    goto LABEL_7;
  }
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB3708], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (!v4)
  {
LABEL_7:
    v6 = v3;
    v3 = v6;
    goto LABEL_8;
  }
  if (gLogCategory__ENDaemon <= 90)
  {
    if (gLogCategory__ENDaemon != -1 || (v8 = v4, v9 = _LogCategory_Initialize(), v4 = v8, v9))
    {
      v5 = v4;
      LogPrintF_safe();
      v4 = v5;
    }
  }

  v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)_writePreferenceActiveEntity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v16;

  v4 = a3;
  if (v4)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v16;
    if (v6)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
    }
    else if (v5)
    {
      CFPrefs_SetValue();
      -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "region");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serverConfigurationForRegion:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0CB3700];
        objc_msgSend(v4, "entity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          CFPrefs_SetValue();

      }
      v14 = 1;
      goto LABEL_19;
    }
    v14 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v14 = 0;
LABEL_20:

  return v14;
}

- (id)_readPreferenceRegionPendingOnboarding
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v8;
  int v9;
  id v10;

  CFDataGetTypeID();
  v2 = (void *)CFPrefs_CopyTypedValue();
  if (!objc_msgSend(v2, "length"))
  {
    v3 = 0;
    goto LABEL_7;
  }
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB3708], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (!v4)
  {
LABEL_7:
    v6 = v3;
    v3 = v6;
    goto LABEL_8;
  }
  if (gLogCategory__ENDaemon <= 90)
  {
    if (gLogCategory__ENDaemon != -1 || (v8 = v4, v9 = _LogCategory_Initialize(), v4 = v8, v9))
    {
      v5 = v4;
      LogPrintF_safe();
      v4 = v5;
    }
  }

  v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)_writePreferenceRegionPendingOnboarding:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  id v8;

  v3 = a3;
  if (v3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v5)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
    }
    else if (v4)
    {
      CFPrefs_SetValue();
      v6 = 1;
LABEL_15:

      goto LABEL_16;
    }
    v6 = 0;
    goto LABEL_15;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v6 = 0;
LABEL_16:

  return v6;
}

- (BOOL)_isNKDActive
{
  void *v3;
  BOOL v4;

  -[ENDaemon activeEntity](self, "activeEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activeStatus") == 3 && self->_prefEnableNKD;

  return v4;
}

- (void)_activate
{
  NSMutableDictionary *v3;
  NSMutableDictionary *screenUnlockPendingActions;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  ENActiveEntity *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  ENActiveEntity *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ENActiveEntity **p_activeEntity;
  uint64_t Int64;
  _BOOL8 v22;
  void *v23;
  _xpc_connection_s *mach_service;
  OS_xpc_object *xpcListener;
  _xpc_connection_s *v26;
  const char *v27;
  NSObject *dispatchQueue;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  CUSystemMonitor *v35;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v37;
  NSObject *v38;
  ENTemporaryExposureKeyManager *v39;
  ENTemporaryExposureKeyManager *temporaryExposureKeyManager;
  id WeakRetained;
  uint64_t v42;
  ENActiveEntity *v43;
  ApplicationObserver *v44;
  ApplicationObserver *applicationObserver;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  ENActiveEntity *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  id v55;
  id location[6];
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[5];
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[5];
  _QWORD handler[5];
  int v67;

  objc_msgSend(MEMORY[0x1E0C99E00], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  screenUnlockPendingActions = self->_screenUnlockPendingActions;
  self->_screenUnlockPendingActions = v3;

  self->_startTicks = mach_absolute_time();
  self->_startTicksFull = mach_continuous_time();
  CFStringGetTypeID();
  v5 = (void *)CFPrefs_CopyTypedValue();
  objc_msgSend(MEMORY[0x1E0CA5858], "applicationProxyForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFStringGetTypeID();
  v7 = CFPrefs_CopyTypedValue();
  v53 = (void *)v7;
  if (v6)
  {
    objc_msgSend(v6, "appState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isInstalled");

    if (v9)
    {
      if (v7)
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          v50 = (ENActiveEntity *)v7;
          v51 = v5;
          LogPrintF_safe();
        }
        +[ENConfigurationManager staticRegionForBundleID:](ENConfigurationManager, "staticRegionForBundleID:", v5, v50, v51);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CAA378], "regionWithCode:", v13);
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[ENCoreTelephonyUtility countryCodeISOForMobileCountryCode:](ENCoreTelephonyUtility, "countryCodeISOForMobileCountryCode:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAA378]), "initWithCountryCode:", v14);
          }
          else
          {
            if (gLogCategory__ENDaemon <= 90
              && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            {
              v50 = (ENActiveEntity *)v7;
              v51 = v5;
              LogPrintF_safe();
            }
            v11 = 0;
          }

        }
        v15 = [ENActiveEntity alloc];
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA2F8]), "initWithBundleID:region:", v5, v11);
        v10 = -[ENActiveEntity initWithEntity:activeStatus:](v15, "initWithEntity:activeStatus:", v16, 2);

        -[ENDaemon _writePreferenceActiveEntity:](self, "_writePreferenceActiveEntity:", v10);
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          v50 = v10;
          LogPrintF_safe();
        }

        goto LABEL_25;
      }
    }
  }
  -[ENDaemon _readPreferenceActiveEntity](self, "_readPreferenceActiveEntity");
  v10 = (ENActiveEntity *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  if (v7)
  {
LABEL_25:
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    v12 = (void *)v11;
  }
  v52 = v12;
  if (v5)
  {
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    CFPrefs_RemoveValue();
    v17 = (void *)TCCAccessCopyInformation();
    objc_msgSend(MEMORY[0x1E0CB3878], "predicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DB10B0], *MEMORY[0x1E0C9AE58], v52, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "filteredArrayUsingPredicate:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
      -[ENDaemon _disableAvailabilityAlertIfNeeded](self, "_disableAvailabilityAlertIfNeeded");

  }
  v67 = 0;
  p_activeEntity = &self->_activeEntity;
  objc_storeStrong((id *)&self->_activeEntity, v10);
  self->_prefTCCAllowWithoutApps = CFPrefs_GetInt64() != 0;
  self->_wasInRestrictedStatus = CFPrefs_GetInt64() != 0;
  self->_wasInDifferentActiveRegion = CFPrefs_GetInt64() != 0;
  Int64 = CFPrefs_GetInt64();
  if (v67)
  {
    v22 = CFPrefs_GetInt64() != 0;
  }
  else
  {
    v22 = Int64 == 0;
    CFPrefs_RemoveValue();
  }
  -[ENDaemon setMonthlySummaryDisabled:](self, "setMonthlySummaryDisabled:", v22, v50, v51);
  LogSetAppID();
  LogControl();
  v23 = (void *)MEMORY[0x1E0C809B0];
  if (!self->_xpcListener)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.ExposureNotification", (dispatch_queue_t)self->_dispatchQueue, 1uLL);
    handler[0] = v23;
    handler[1] = 3221225472;
    handler[2] = __21__ENDaemon__activate__block_invoke;
    handler[3] = &unk_1E87D9D60;
    handler[4] = self;
    xpc_connection_set_event_handler(mach_service, handler);
    xpcListener = self->_xpcListener;
    self->_xpcListener = mach_service;
    v26 = mach_service;

    xpc_connection_activate(v26);
  }
  if (self->_screenLockNotifyToken == -1)
  {
    v27 = (const char *)*MEMORY[0x1E0DAC068];
    dispatchQueue = self->_dispatchQueue;
    v65[0] = v23;
    v65[1] = 3221225472;
    v65[2] = __21__ENDaemon__activate__block_invoke_2;
    v65[3] = &unk_1E87DA1D8;
    v65[4] = self;
    notify_register_dispatch(v27, &self->_screenLockNotifyToken, dispatchQueue, v65);
  }
  if (self->_prefsChangedNotifyToken == -1)
  {
    v29 = self->_dispatchQueue;
    v64[0] = v23;
    v64[1] = 3221225472;
    v64[2] = __21__ENDaemon__activate__block_invoke_5;
    v64[3] = &unk_1E87DA1D8;
    v64[4] = self;
    notify_register_dispatch("com.apple.ExposureNotification.prefsChanged", &self->_prefsChangedNotifyToken, v29, v64);
  }
  if (self->_profileChangedNotifyToken == -1)
  {
    v30 = self->_dispatchQueue;
    v63[0] = v23;
    v63[1] = 3221225472;
    v63[2] = __21__ENDaemon__activate__block_invoke_6;
    v63[3] = &unk_1E87DA1D8;
    v63[4] = self;
    notify_register_dispatch("com.apple.MCX._managementStatusChangedForDomains", &self->_profileChangedNotifyToken, v30, v63);
  }
  if (self->_proxyConfigChangedNotifyToken == -1)
  {
    v31 = (const char *)objc_msgSend(CFSTR("com.apple.networkserviceproxy.privacy-proxy-configuration-changed"), "utf8ValueSafe");
    v32 = self->_dispatchQueue;
    v62[0] = v23;
    v62[1] = 3221225472;
    v62[2] = __21__ENDaemon__activate__block_invoke_7;
    v62[3] = &unk_1E87DA1D8;
    v62[4] = self;
    notify_register_dispatch(v31, &self->_proxyConfigChangedNotifyToken, v32, v62);
  }
  if (self->_proxyStatusChangedNotifyToken == -1)
  {
    v33 = (const char *)objc_msgSend(CFSTR("com.apple.networkserviceproxy.privacy-proxy-service-status-changed"), "utf8ValueSafe");
    v34 = self->_dispatchQueue;
    v61[0] = v23;
    v61[1] = 3221225472;
    v61[2] = __21__ENDaemon__activate__block_invoke_8;
    v61[3] = &unk_1E87DA1D8;
    v61[4] = self;
    notify_register_dispatch(v33, &self->_proxyStatusChangedNotifyToken, v34, v61);
  }
  if (!self->_systemMonitor)
  {
    v35 = (CUSystemMonitor *)objc_alloc_init(MEMORY[0x1E0D1B450]);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v35;
    v37 = v35;

    -[CUSystemMonitor setDispatchQueue:](v37, "setDispatchQueue:", self->_dispatchQueue);
    v60[0] = v23;
    v60[1] = 3221225472;
    v60[2] = __21__ENDaemon__activate__block_invoke_9;
    v60[3] = &unk_1E87D9C28;
    v60[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](v37, "setFirstUnlockHandler:", v60);
    v59[0] = v23;
    v59[1] = 3221225472;
    v59[2] = __21__ENDaemon__activate__block_invoke_10;
    v59[3] = &unk_1E87D9C28;
    v59[4] = self;
    -[CUSystemMonitor setSystemLockStateChangedHandler:](v37, "setSystemLockStateChangedHandler:", v59);
    v58[0] = v23;
    v58[1] = 3221225472;
    v58[2] = __21__ENDaemon__activate__block_invoke_11;
    v58[3] = &unk_1E87D9C28;
    v58[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v37, "activateWithCompletion:", v58);

  }
  if (self->_tccChangedNotifyToken == -1)
  {
    v38 = self->_dispatchQueue;
    v57[0] = v23;
    v57[1] = 3221225472;
    v57[2] = __21__ENDaemon__activate__block_invoke_12;
    v57[3] = &unk_1E87DA1D8;
    v57[4] = self;
    notify_register_dispatch("com.apple.tcc.access.changed", &self->_tccChangedNotifyToken, v38, v57);
  }
  if (!self->_stateHandler)
  {
    location[1] = v23;
    location[2] = (id)3221225472;
    location[3] = __21__ENDaemon__activate__block_invoke_13;
    location[4] = &unk_1E87DA200;
    location[5] = self;
    self->_stateHandler = os_state_add_handler();
  }
  if (!self->_temporaryExposureKeyManager)
  {
    v39 = -[ENTemporaryExposureKeyManager initWithQueue:]([ENTemporaryExposureKeyManager alloc], "initWithQueue:", self->_dispatchQueue);
    temporaryExposureKeyManager = self->_temporaryExposureKeyManager;
    self->_temporaryExposureKeyManager = v39;

    -[ENTemporaryExposureKeyManager setDelegate:](self->_temporaryExposureKeyManager, "setDelegate:", self);
  }
  location[0] = 0;
  objc_initWeak(location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v54[0] = v23;
  v54[1] = 3221225472;
  v54[2] = __21__ENDaemon__activate__block_invoke_14;
  v54[3] = &unk_1E87DA228;
  v54[4] = self;
  objc_copyWeak(&v55, location);
  objc_msgSend(WeakRetained, "registerStateMetricPullCallback:", v54);

  -[ENDaemon _regionMonitorEnsureStarted](self, "_regionMonitorEnsureStarted");
  -[ENDaemon _configurationManagerEnsureStarted](self, "_configurationManagerEnsureStarted");
  -[ENDaemon _readPreferenceActiveEntity](self, "_readPreferenceActiveEntity");
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = *p_activeEntity;
  *p_activeEntity = (ENActiveEntity *)v42;

  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v44 = (ApplicationObserver *)objc_opt_new();
  applicationObserver = self->_applicationObserver;
  self->_applicationObserver = v44;

  -[ApplicationObserver setDelegate:](self->_applicationObserver, "setDelegate:", self);
  -[ENDaemon _readPreferenceRegionPendingOnboarding](self, "_readPreferenceRegionPendingOnboarding");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    -[ENDaemon configurationManager](self, "configurationManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "configurationStore");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "serverConfigurationForRegion:", v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v49)
      -[ENDaemon onboardingTriggerDeactivate](self, "onboardingTriggerDeactivate");
  }

  -[ENDaemon onboardingTriggerResumeIfNeeded](self, "onboardingTriggerResumeIfNeeded");
  -[ENDaemon _tccChanged](self, "_tccChanged");
  -[ENDaemon pauseUpdate](self, "pauseUpdate");
  -[ENDaemon prefsChanged](self, "prefsChanged");
  -[ENDaemon _networkProxyStatusCheck](self, "_networkProxyStatusCheck");
  objc_destroyWeak(&v55);
  objc_destroyWeak(location);

}

void __21__ENDaemon__activate__block_invoke_2(uint64_t a1)
{
  int v2;
  const char *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "isDeviceUnlocked");
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    if (v2)
      v3 = "yes";
    else
      v3 = "no";
    objc_msgSend(*(id *)(a1 + 32), "screenUnlockPendingActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v3;
    v9 = objc_msgSend(v4, "count");
    LogPrintF_safe();

  }
  objc_msgSend(*(id *)(a1 + 32), "screenUnlockPendingActions", v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    v2 = 0;

  if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "screenUnlockPendingActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __21__ENDaemon__activate__block_invoke_3;
    v10[3] = &unk_1E87DA1B0;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

    objc_msgSend(*(id *)(a1 + 32), "screenUnlockPendingActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

  }
}

void __21__ENDaemon__activate__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = dispatch_time(0, 2500000000);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 224);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __21__ENDaemon__activate__block_invoke_4;
  v11[3] = &unk_1E87DA188;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_after(v7, v8, v11);

}

uint64_t __21__ENDaemon__activate__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __21__ENDaemon__activate__block_invoke_5(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  return objc_msgSend(*(id *)(a1 + 32), "prefsChanged");
}

uint64_t __21__ENDaemon__activate__block_invoke_6(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  return objc_msgSend(*(id *)(a1 + 32), "prefsChanged");
}

uint64_t __21__ENDaemon__activate__block_invoke_7(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  return objc_msgSend(*(id *)(a1 + 32), "_networkProxyStatusCheck");
}

uint64_t __21__ENDaemon__activate__block_invoke_8(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  return objc_msgSend(*(id *)(a1 + 32), "_networkProxyStatusCheck");
}

uint64_t __21__ENDaemon__activate__block_invoke_9(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_tccChanged");
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

uint64_t __21__ENDaemon__activate__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

uint64_t __21__ENDaemon__activate__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

uint64_t __21__ENDaemon__activate__block_invoke_12(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  return objc_msgSend(*(id *)(a1 + 32), "_tccChanged");
}

uint64_t __21__ENDaemon__activate__block_invoke_13()
{
  return CUStateDumpWithObject();
}

void __21__ENDaemon__activate__block_invoke_14(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[5];
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 224);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __21__ENDaemon__activate__block_invoke_15;
  v3[3] = &unk_1E87DA228;
  v3[4] = v1;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
}

void __21__ENDaemon__activate__block_invoke_15(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  id WeakRetained;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v23 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "getCurrentRegionVisitWithError:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "region");
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v23, "validSubdivisionCode"))
  {
    objc_msgSend(v23, "subdivisionCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("-"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("US"));

    if (v9)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "utf8ValueSafe");

    }
  }
  v11 = objc_msgSend(*(id *)(a1 + 32), "_getAvailabilityAlertCountIncrement:reset:", 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configurationStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationForRegion:", v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "diagnosisKeysPreAuthorization");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userAuthorization");

  if (v16 == 1)
    v17 = v11 | 0x80;
  else
    v17 = v11;
  v18 = objc_msgSend(*(id *)(a1 + 32), "_getLegalConsentPageCount");
  CFPrefs_RemoveValue();
  if (objc_msgSend(*(id *)(a1 + 32), "_getExposureMatchAttemptBool"))
  {
    v18 |= 0x40u;
    CFPrefs_SetValue();
  }
  if (CFPrefs_GetInt64())
  {
    v18 |= 0x80u;
    CFPrefs_RemoveValue();
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  v20 = objc_loadWeakRetained((id *)(a1 + 40));
  v21 = objc_msgSend(v20, "stateMetricVersion");
  if ((objc_msgSend(v23, "validSubdivisionCode") & 1) != 0)
  {
    objc_msgSend(v23, "subdivisionCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sendStateMetricWithVersion:subdivisionCode:availabilityAlertCount:legalConsentPageCount:", v21, v22, v17, v18);

  }
  else
  {
    objc_msgSend(WeakRetained, "sendStateMetricWithVersion:subdivisionCode:availabilityAlertCount:legalConsentPageCount:", v21, CFSTR("Unknown"), v17, v18);
  }

}

- (void)_disableAvailabilityAlertIfNeeded
{
  CFPrefs_GetInt64();
}

- (unsigned)_getAvailabilityAlertCountIncrement:(BOOL)a3 reset:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  unsigned __int8 Int64;

  v4 = a4;
  v5 = a3;
  Int64 = CFPrefs_GetInt64();
  if (v4)
  {
    CFPrefs_RemoveValue();
  }
  else if (v5)
  {
    ++Int64;
    CFPrefs_SetInt64();
  }
  return Int64;
}

- (id)_getBundleIDFromBundle:(__CFBundle *)a3
{
  CFURLRef v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = CFBundleCopyBundleURL(a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D8], "bundleWithURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      v6 = 0;
    }

  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v6 = 0;
  }

  return v6;
}

- (BOOL)_getExposureMatchAttemptBool
{
  return CFPrefs_GetInt64() != 0;
}

- (id)_getInfoDictFromBundle:(__CFBundle *)a3
{
  CFURLRef v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = CFBundleCopyBundleURL(a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D8], "bundleWithURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "infoDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      v6 = 0;
    }

  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v6 = 0;
  }

  return v6;
}

- (id)_getInfoDictFromAppProxy:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D8], "bundleWithURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "infoDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      v6 = 0;
    }

  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v6 = 0;
  }

  return v6;
}

- (unsigned)_getLegalConsentPageCount
{
  return CFPrefs_GetInt64();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__ENDaemon_invalidate__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __22__ENDaemon_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSMutableSet *v3;
  NSMutableSet *xpcConnections;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSBackgroundActivityScheduler *persistencePurgeScheduler;
  OS_dispatch_source *pauseTimer;
  NSObject *v12;
  OS_dispatch_source *v13;
  int prefsChangedNotifyToken;
  int profileChangedNotifyToken;
  int proxyStatusChangedNotifyToken;
  int proxyConfigChangedNotifyToken;
  int screenLockNotifyToken;
  int tccChangedNotifyToken;
  OS_xpc_object *xpcListener;
  _xpc_connection_s *v21;
  OS_xpc_object *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = self->_xpcConnections;
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "invalidate", (_QWORD)v23);
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  -[NSMutableSet removeAllObjects](v5, "removeAllObjects");
  -[NSBackgroundActivityScheduler invalidate](self->_persistencePurgeScheduler, "invalidate");
  persistencePurgeScheduler = self->_persistencePurgeScheduler;
  self->_persistencePurgeScheduler = 0;

  -[ENDaemon _bluetoothMonitorEnsureStopped](self, "_bluetoothMonitorEnsureStopped");
  -[ENDaemon _bluetoothTracingEnsureStopped](self, "_bluetoothTracingEnsureStopped");
  -[ENDaemon _configurationManagerEnsureStopped](self, "_configurationManagerEnsureStopped");
  -[ENDaemon _databasesEnsureClosed](self, "_databasesEnsureClosed");
  -[ENDaemon _exposureManagersEnsureStopped](self, "_exposureManagersEnsureStopped");
  -[ENDaemon _regionMonitorEnsureStopped](self, "_regionMonitorEnsureStopped");
  -[ENDaemon setUserNotificationCenter:](self, "setUserNotificationCenter:", 0);
  -[ENDaemon setMonthlySummaryDisabled:](self, "setMonthlySummaryDisabled:", 1);
  pauseTimer = self->_pauseTimer;
  if (pauseTimer)
  {
    v12 = pauseTimer;
    dispatch_source_cancel(v12);
    v13 = self->_pauseTimer;
    self->_pauseTimer = 0;

  }
  prefsChangedNotifyToken = self->_prefsChangedNotifyToken;
  if (prefsChangedNotifyToken != -1)
  {
    notify_cancel(prefsChangedNotifyToken);
    self->_prefsChangedNotifyToken = -1;
  }
  profileChangedNotifyToken = self->_profileChangedNotifyToken;
  if (profileChangedNotifyToken != -1)
  {
    notify_cancel(profileChangedNotifyToken);
    self->_profileChangedNotifyToken = -1;
  }
  proxyStatusChangedNotifyToken = self->_proxyStatusChangedNotifyToken;
  if (proxyStatusChangedNotifyToken != -1)
  {
    notify_cancel(proxyStatusChangedNotifyToken);
    self->_proxyStatusChangedNotifyToken = -1;
  }
  proxyConfigChangedNotifyToken = self->_proxyConfigChangedNotifyToken;
  if (proxyConfigChangedNotifyToken != -1)
  {
    notify_cancel(proxyConfigChangedNotifyToken);
    self->_proxyConfigChangedNotifyToken = -1;
  }
  screenLockNotifyToken = self->_screenLockNotifyToken;
  if (screenLockNotifyToken != -1)
  {
    notify_cancel(screenLockNotifyToken);
    self->_screenLockNotifyToken = -1;
  }
  tccChangedNotifyToken = self->_tccChangedNotifyToken;
  if (tccChangedNotifyToken != -1)
  {
    notify_cancel(tccChangedNotifyToken);
    self->_tccChangedNotifyToken = -1;
  }
  if (self->_stateHandler)
  {
    os_state_remove_handler();
    self->_stateHandler = 0;
  }
  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate", (_QWORD)v23);
  xpcListener = self->_xpcListener;
  if (xpcListener)
  {
    v21 = xpcListener;
    xpc_connection_cancel(v21);
    v22 = self->_xpcListener;
    self->_xpcListener = 0;

  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();

}

- (id)_getDelegateAndReturnError:(id *)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
  }
  else if (a3)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __32__ENDaemon__updateOverallStatus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyUserWithStatus:", *(_QWORD *)(a1 + 40));
}

- (void)notifyUserWithStatus:(int64_t)a3
{
  if (a3 == 4)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      -[ENDaemon overallStatus](self, "overallStatus");
      LogPrintF_safe();
    }
    -[ENDaemon postENOffNotification](self, "postENOffNotification");
  }
}

- (void)pauseUpdate
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  OS_dispatch_source *pauseTimer;
  NSObject *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *v12;
  NSObject *v13;
  OS_dispatch_source *v14;
  OS_dispatch_source *v15;
  void *v16;
  _QWORD handler[7];
  int v18;

  v18 = 0;
  CFPrefs_GetDouble();
  v4 = v3;
  if (v3 - CFAbsoluteTimeGetCurrent() + -10.0 > 0.0)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintDateCF();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintDurationDouble();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    pauseTimer = self->_pauseTimer;
    if (pauseTimer)
    {
      v9 = pauseTimer;
      dispatch_source_cancel(v9);
      v10 = self->_pauseTimer;
      self->_pauseTimer = 0;

    }
    v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v12 = self->_pauseTimer;
    self->_pauseTimer = v11;
    v13 = v11;

    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __23__ENDaemon_pauseUpdate__block_invoke;
    handler[3] = &unk_1E87DA250;
    handler[4] = v13;
    handler[5] = self;
    *(double *)&handler[6] = v4;
    dispatch_source_set_event_handler(v13, handler);
    CUDispatchTimerSet();
    dispatch_activate(v13);
    goto LABEL_15;
  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintDateCF();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintDurationDouble();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  CFPrefs_SetValue();
  CFPrefs_RemoveValue();
  v14 = self->_pauseTimer;
  if (v14)
  {
    v13 = v14;
    dispatch_source_cancel(v13);
    v15 = self->_pauseTimer;
    self->_pauseTimer = 0;

LABEL_15:
  }
}

uint64_t __23__ENDaemon_pauseUpdate__block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v1 = *(void **)(result + 32);
  if (v1 == *(void **)(*(_QWORD *)(result + 40) + 32))
  {
    v2 = result;
    if (v1)
    {
      v3 = v1;
      dispatch_source_cancel(v3);
      v4 = *(_QWORD *)(v2 + 40);
      v5 = *(void **)(v4 + 32);
      *(_QWORD *)(v4 + 32) = 0;

    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintDateCF();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    CFPrefs_SetValue();
    CFPrefs_RemoveValue();
    return objc_msgSend(*(id *)(v2 + 40), "prefsChanged");
  }
  return result;
}

- (void)prefsChanged
{
  id WeakRetained;
  uint64_t Int64;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  void *v14;
  ENActiveEntity *activeEntity;
  ENActiveEntity *v16;
  ENActiveEntity *v17;
  ENActiveEntity *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *prefRegionIdentifierOverride;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  char v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  char v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  void *v60;
  ENActiveEntity **p_activeEntity;
  const char *v62;
  const char *v63;
  uint64_t v64;
  _BOOL4 v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  _BOOL4 v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  _BOOL4 v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  void *v79;
  unint64_t v80;
  void *v81;
  void *v82;
  id v83;
  _QWORD *v84;
  unint64_t travelStatus;
  const char *v86;
  const char *v87;
  uint64_t v88;
  BOOL v89;
  _BOOL4 v90;
  const char *v91;
  const char *v92;
  double v93;
  double v94;
  double prefDatabasePurgeInterval;
  uint64_t v96;
  _BOOL4 v97;
  uint64_t v98;
  const char *v99;
  const char *v100;
  void *v101;
  uint64_t v102;
  unint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  unint64_t prefDifferentialPrivacyConsent;
  const char *v110;
  const char *v111;
  uint64_t v112;
  BOOL v113;
  _BOOL4 v114;
  const char *v115;
  const char *v116;
  _BOOL4 v117;
  void *v118;
  uint64_t v119;
  void *v120;
  int v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  char v126;
  void *v127;
  uint64_t v128;
  int v129;
  int v130;
  int prefEnabled;
  const char *v132;
  const char *v133;
  uint64_t v134;
  int v135;
  int prefLoggingRPI;
  uint64_t v137;
  const char *v138;
  const char *v139;
  uint64_t v140;
  _BOOL4 v141;
  void *v142;
  uint64_t v143;
  const char *v144;
  const char *v145;
  void *v146;
  uint64_t v147;
  _BOOL4 v148;
  uint64_t v149;
  const char *v150;
  const char *v151;
  _BOOL4 v152;
  PrivacyProxyServiceStatus *networkProxyStatus;
  const char *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  unsigned int v158;
  const char *prefRateLimitMaxAPICount;
  uint64_t v160;
  uint64_t v161;
  unsigned int v162;
  const char *prefRateLimitMaxAPICountV2;
  uint64_t v164;
  _BOOL4 v165;
  uint64_t v166;
  const char *v167;
  const char *v168;
  uint64_t v169;
  _BOOL4 v170;
  uint64_t v171;
  const char *v172;
  const char *v173;
  uint64_t v174;
  _BOOL4 v175;
  uint64_t v176;
  const char *v177;
  const char *v178;
  uint64_t v179;
  const char *v180;
  const char *v181;
  const char *v182;
  id v183;
  NSString *v184;
  uint64_t v185;
  double v186;
  const char *v187;
  uint64_t v188;
  const char *v189;
  const char *v190;
  ENActiveEntity *v191;
  NSString *v192;
  const char *v193;
  double v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  const char *v198;
  void *v199;
  NSString *v200;
  ENActiveEntity *v201;
  id v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  id *location;
  _QWORD v213[5];
  id v214;
  int v215;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v215 = 0;
  if (!CFPrefs_GetInt64())
    -[ENDaemon _resetDeveloperSettings](self, "_resetDeveloperSettings");
  Int64 = CFPrefs_GetInt64();
  v5 = Int64 != 0;
  if (self->_prefStoreDemoMode != v5)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      v6 = Int64;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v7 = "yes";
        if (v6)
          v8 = "no";
        else
          v8 = "yes";
        if (!v6)
          v7 = "no";
        v182 = v8;
        v190 = v7;
        LogPrintF_safe();
      }
    }
    self->_prefStoreDemoMode = v5;
  }
  v9 = CFPrefs_GetInt64();
  v10 = v9 != 0;
  if (self->_prefRegionMonitorTestMode != v10)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      v11 = v9;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v12 = "yes";
        if (v11)
          v13 = "no";
        else
          v13 = "yes";
        if (!v11)
          v12 = "no";
        v182 = v13;
        v190 = v12;
        LogPrintF_safe();
      }
    }
    self->_prefRegionMonitorTestMode = v10;
  }
  -[ENDaemon _readPreferenceActiveEntity](self, "_readPreferenceActiveEntity", v182, v190);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  activeEntity = self->_activeEntity;
  location = (id *)&self->_activeEntity;
  v16 = v14;
  v17 = activeEntity;
  if (v16 == v17)
  {

    v20 = v16;
LABEL_36:

    goto LABEL_37;
  }
  v18 = v17;
  if ((v16 == 0) == (v17 != 0))
  {

LABEL_31:
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v183 = *location;
      v191 = v16;
      LogPrintF_safe();
    }
    objc_storeStrong(location, v14);
    -[ENConfigurationManager setActiveEntity:](self->_configurationManager, "setActiveEntity:", self->_activeEntity);
    -[ENTemporaryExposureKeyManager resetClientState](self->_temporaryExposureKeyManager, "resetClientState");
    notify_post("com.apple.ExposureNotification.trackedAppChanged");
    CFPrefs_RemoveValue();
    -[ENDaemon screenUnlockPendingActions](self, "screenUnlockPendingActions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeAllObjects");
    goto LABEL_36;
  }
  v19 = -[ENActiveEntity isEqual:](v16, "isEqual:", v17);

  if (!v19)
    goto LABEL_31;
LABEL_37:
  v201 = v16;
  v202 = WeakRetained;
  -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore", v183, v191);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENActiveEntity entity](self->_activeEntity, "entity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "region");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v211 = v21;
  objc_msgSend(v21, "serverConfigurationForRegion:", v23);
  v204 = (void *)objc_claimAutoreleasedReturnValue();

  CFStringGetTypeID();
  v24 = (void *)CFPrefs_CopyTypedValue();
  prefRegionIdentifierOverride = self->_prefRegionIdentifierOverride;
  v26 = v24;
  v27 = prefRegionIdentifierOverride;
  if (v26 == v27)
  {

    v30 = v26;
LABEL_48:

    goto LABEL_49;
  }
  v28 = v27;
  if ((v26 == 0) == (v27 != 0))
  {

LABEL_43:
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v184 = self->_prefRegionIdentifierOverride;
      v192 = v26;
      LogPrintF_safe();
    }
    v30 = self->_prefRegionIdentifierOverride;
    objc_storeStrong((id *)&self->_prefRegionIdentifierOverride, v24);
    -[ENDaemon _fetchPrefRegionConfig:oldCustomCountryCode:](self, "_fetchPrefRegionConfig:oldCustomCountryCode:", self->_prefRegionIdentifierOverride, v30);
    goto LABEL_48;
  }
  v29 = -[NSString isEqual:](v26, "isEqual:", v27);

  if ((v29 & 1) == 0)
    goto LABEL_43;
LABEL_49:
  v200 = v26;
  -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore", v184, v192);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENActiveEntity entity](self->_activeEntity, "entity");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "region");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "agencyConfigurationForRegion:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "agencyColor");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "agencyHeaderStyle");
  objc_msgSend(v34, "agencyHeaderTextColor");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "agencyDisplayName");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedConfiguration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "regionName");
  v207 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "localizedConfiguration");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "agencyTurndownMessage");
  v206 = (void *)objc_claimAutoreleasedReturnValue();

  v199 = v34;
  objc_msgSend(v34, "agencyImageURL");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENActiveEntity entity](self->_activeEntity, "entity");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
    goto LABEL_60;
  v39 = objc_alloc(MEMORY[0x1E0CAA2F8]);
  objc_msgSend(v38, "bundleIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInteger:", v35);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "region");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v39, "initWithBundleID:agencyColor:agencyHeaderStyle:agencyHeaderTextColor:localizedAgencyName:localizedAgencyImageURL:localizedAgencyTurndownMessage:localizedRegionName:region:", v40, v210, v41, v209, v208, v205, v206, v207, v42);

  if (v204)
  {
    CFDataGetTypeID();
    v44 = CFPrefs_CopyTypedValue();
    if (!v44)
    {
LABEL_58:
      v50 = objc_alloc(MEMORY[0x1E0CAA2F8]);
      objc_msgSend(v38, "bundleIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInteger:", v35);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "region");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)objc_msgSend(v50, "initWithBundleID:agencyColor:agencyHeaderStyle:agencyHeaderTextColor:localizedAgencyName:localizedAgencyImageURL:localizedAgencyTurndownMessage:localizedRegionName:region:", v51, v210, v52, v209, v208, v205, v206, v207, v53);
      -[ENActiveEntity setEntity:](self->_activeEntity, "setEntity:", v54);

      -[ENDaemon _writePreferenceActiveEntity:](self, "_writePreferenceActiveEntity:", self->_activeEntity);
      goto LABEL_59;
    }
    v45 = (void *)v44;
    v46 = v43;
    v47 = v38;
    v48 = v47;
    if (v46 != v47)
    {
      if (v46)
      {
        v49 = objc_msgSend(v46, "isEqual:", v47);

        if ((v49 & 1) != 0)
          goto LABEL_59;
      }
      else
      {

      }
      goto LABEL_58;
    }

  }
LABEL_59:

LABEL_60:
  -[ENRegionMonitor getCurrentRegionVisitWithError:](self->_regionMonitor, "getCurrentRegionVisitWithError:", 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "region");
  v56 = objc_claimAutoreleasedReturnValue();

  v57 = CFPrefs_GetInt64() != 0;
  if (v215)
  {
    objc_msgSend(v211, "serverConfigurationForRegion:", v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v58;
    v60 = v202;
    p_activeEntity = &self->_activeEntity;
    if (!v58
      || (objc_msgSend(v58, "enEnabled") & 1) != 0
      || -[ENConfigurationManager isInGracePeriodTransition](self->_configurationManager, "isInGracePeriodTransition"))
    {
      v57 = 0;
    }
    else
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        v185 = v56;
        LogPrintF_safe();
      }
      v57 = 1;
    }

  }
  else
  {
    v60 = v202;
    p_activeEntity = &self->_activeEntity;
  }
  if (self->_prefServerForceDisable != v57)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v62 = "yes";
      if (v57)
        v63 = "no";
      else
        v63 = "yes";
      if (!v57)
        v62 = "no";
      v193 = v63;
      v198 = v62;
      v185 = v56;
      LogPrintF_safe();
    }
    self->_prefServerForceDisable = v57;
  }
  v203 = (void *)v56;
  v64 = CFPrefs_GetInt64();
  v65 = v64 != 0;
  if (self->_prefAggressiveScanning != v65)
  {
    v66 = v64;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v67 = "yes";
      if (v66)
        v68 = "no";
      else
        v68 = "yes";
      if (!v66)
        v67 = "no";
      v185 = (uint64_t)v68;
      v193 = v67;
      LogPrintF_safe();
    }
    self->_prefAggressiveScanning = v65;
    objc_msgSend(v60, "setAggressiveScanningEnabled:", v66 != 0, v185, v193, v198);
  }
  v69 = CFPrefs_GetInt64();
  v70 = v69 != 0;
  if (self->_automaticRegionSwitchEnabled != v70)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      v71 = v69;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v72 = "yes";
        if (v71)
          v73 = "no";
        else
          v73 = "yes";
        if (!v71)
          v72 = "no";
        v185 = (uint64_t)v73;
        v193 = v72;
        LogPrintF_safe();
      }
    }
    self->_automaticRegionSwitchEnabled = v70;
  }
  v74 = CFPrefs_GetInt64();
  v75 = v74 != 0;
  if (self->_availabilityAlertDisabled != v75)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      v76 = v74;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v77 = "yes";
        if (v76)
          v78 = "no";
        else
          v78 = "yes";
        if (!v76)
          v77 = "no";
        v185 = (uint64_t)v78;
        v193 = v77;
        LogPrintF_safe();
      }
    }
    self->_availabilityAlertDisabled = v75;
  }
  -[ENActiveEntity entity](*p_activeEntity, "entity", v185, v193);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "region");
  v80 = objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "configurationForRegion:", v80);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    v213[0] = MEMORY[0x1E0C809B0];
    v213[1] = 3221225472;
    v213[2] = __24__ENDaemon_prefsChanged__block_invoke;
    v213[3] = &unk_1E87D9DD8;
    v213[4] = v211;
    v83 = v82;
    v214 = v83;
    v84 = v213;
    if (prefsChanged_onceToken != -1)
      dispatch_once(&prefsChanged_onceToken, v84);

    if (v83)
      v80 = objc_msgSend(v83, "travelerModeEnabled");
    else
      v80 = 0;
  }
  else
  {

    v83 = 0;
  }
  travelStatus = self->_travelStatus;
  if (v80 != travelStatus)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon != -1)
      {
LABEL_124:
        if (travelStatus > 2)
          v86 = "?";
        else
          v86 = off_1E87DAF70[travelStatus];
        if (v80 > 2)
          v87 = "?";
        else
          v87 = off_1E87DAF70[v80];
        v186 = *(double *)&v86;
        v194 = *(double *)&v87;
        LogPrintF_safe();
        goto LABEL_133;
      }
      if (_LogCategory_Initialize())
      {
        travelStatus = self->_travelStatus;
        goto LABEL_124;
      }
    }
LABEL_133:
    self->_travelStatus = v80;
  }
  v88 = CFPrefs_GetInt64();
  if (v215)
    v89 = 0;
  else
    v89 = v88 == 0;
  v90 = !v89;
  if (self->_prefConfigurationManagerEnabled != v90)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v91 = "yes";
      if (v90)
        v92 = "no";
      else
        v92 = "yes";
      if (!v90)
        v91 = "no";
      v186 = *(double *)&v92;
      v194 = *(double *)&v91;
      LogPrintF_safe();
    }
    self->_prefConfigurationManagerEnabled = v90;
  }
  CFPrefs_GetDouble();
  if (v215)
    v94 = 0.0;
  else
    v94 = v93;
  prefDatabasePurgeInterval = self->_prefDatabasePurgeInterval;
  if (v94 != prefDatabasePurgeInterval)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_159;
        prefDatabasePurgeInterval = self->_prefDatabasePurgeInterval;
      }
      v186 = prefDatabasePurgeInterval;
      v194 = v94;
      LogPrintF_safe();
    }
LABEL_159:
    self->_prefDatabasePurgeInterval = v94;
  }
  v96 = CFPrefs_GetInt64();
  v97 = v96 != 0;
  if (self->_prefDeveloperServerConfiguration != v97)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      v98 = v96;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v99 = "yes";
        if (v98)
          v100 = "no";
        else
          v100 = "yes";
        if (!v98)
          v99 = "no";
        v186 = *(double *)&v100;
        v194 = *(double *)&v99;
        LogPrintF_safe();
      }
    }
    self->_prefDeveloperServerConfiguration = v97;
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore", *(_QWORD *)&v186, *(_QWORD *)&v194);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "prefsChanged");

  }
  v102 = CFPrefs_GetInt64();
  if (v215 || (v103 = v102, v102 < 0) || v102 >= 5)
  {
    -[ENActiveEntity entity](self->_activeEntity, "entity", *(_QWORD *)&v186);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "region");
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "configurationForRegion:", v105);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "userConsent");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v108, "differentialPrivacyConsent");

    p_activeEntity = &self->_activeEntity;
  }
  prefDifferentialPrivacyConsent = self->_prefDifferentialPrivacyConsent;
  if (v103 != prefDifferentialPrivacyConsent)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon != -1)
      {
LABEL_178:
        if (prefDifferentialPrivacyConsent > 4)
          v110 = "?";
        else
          v110 = off_1E87DADC8[prefDifferentialPrivacyConsent];
        if (v103 > 4)
          v111 = "?";
        else
          v111 = off_1E87DADC8[v103];
        v186 = *(double *)&v110;
        v194 = *(double *)&v111;
        LogPrintF_safe();
        goto LABEL_187;
      }
      if (_LogCategory_Initialize())
      {
        prefDifferentialPrivacyConsent = self->_prefDifferentialPrivacyConsent;
        goto LABEL_178;
      }
    }
LABEL_187:
    self->_prefDifferentialPrivacyConsent = v103;
  }
  v112 = CFPrefs_GetInt64();
  if (v215)
    v113 = 0;
  else
    v113 = v112 == 0;
  v114 = !v113;
  if (self->_prefEnableNKD != v114)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v115 = "yes";
      if (v114)
        v116 = "no";
      else
        v116 = "yes";
      if (!v114)
        v115 = "no";
      v186 = *(double *)&v116;
      v194 = *(double *)&v115;
      LogPrintF_safe();
    }
    self->_prefEnableNKD = v114;
  }
  v117 = !self->_prefServerForceDisable && !self->_prefStoreDemoMode && CFPrefs_GetInt64() != 0;
  -[ENActiveEntity entity](*p_activeEntity, "entity", *(_QWORD *)&v186, *(_QWORD *)&v194);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "bundleIdentifier");
  v119 = objc_claimAutoreleasedReturnValue();
  if (!v119)
  {
    v129 = 0;
    goto LABEL_228;
  }
  v120 = (void *)v119;
  v121 = -[ENActiveEntity activeStatus](*p_activeEntity, "activeStatus");

  if (v121 == 2)
  {
    -[ENActiveEntity entity](*p_activeEntity, "entity");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "bundleIdentifier");
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CA5858], "applicationProxyForIdentifier:placeholder:", v118, 0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "appState");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v124, "isInstalled") & 1) != 0)
    {
      objc_msgSend(v123, "appState");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = objc_msgSend(v125, "isPlaceholder");

      if ((v126 & 1) == 0 && -[ENDaemon tccAccessForBundleID:](self, "tccAccessForBundleID:", v118) == 1)
      {
        objc_msgSend(v204, "appBundleID");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = objc_msgSend(v127, "length");

        if (v128)
        {
          v129 = 0;
          goto LABEL_223;
        }
      }
    }
    else
    {

    }
    if (gLogCategory_ENDaemon <= 30)
    {
      p_activeEntity = &self->_activeEntity;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v187 = (const char *)v118;
        LogPrintF_safe();
      }
      v129 = 1;
      goto LABEL_227;
    }
    v129 = 1;
LABEL_223:
    p_activeEntity = &self->_activeEntity;
LABEL_227:

LABEL_228:
    if (v117)
      goto LABEL_229;
LABEL_217:
    v130 = 0;
    goto LABEL_233;
  }
  v129 = 0;
  if (!v117)
    goto LABEL_217;
LABEL_229:
  v130 = *p_activeEntity && ((-[ENActiveEntity activeStatus](*p_activeEntity, "activeStatus") > 1) & ~v129) != 0
      || self->_prefTCCAllowWithoutApps;
LABEL_233:
  prefEnabled = self->_prefEnabled;
  if (prefEnabled != v130)
  {
    prefEnabled = v130;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v132 = "yes";
      if (v130)
        v133 = "no";
      else
        v133 = "yes";
      if (!v130)
        v132 = "no";
      v187 = v133;
      v195 = (uint64_t)v132;
      LogPrintF_safe();
    }
    self->_prefEnabled = v130;
  }
  if (prefEnabled)
    CFPrefs_RemoveValue();
  v134 = CFPrefs_GetInt64();
  v135 = v134 != 0;
  prefLoggingRPI = self->_prefLoggingRPI;
  if (prefLoggingRPI != v135)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      v137 = v134;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v138 = "yes";
        if (v137)
          v139 = "no";
        else
          v139 = "yes";
        if (!v137)
          v138 = "no";
        v187 = v139;
        v195 = (uint64_t)v138;
        LogPrintF_safe();
      }
    }
    self->_prefLoggingRPI = v135;
  }
  v140 = CFPrefs_GetInt64();
  v141 = v140 != 0;
  if (self->_prefLoggingSensitive != v141)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      v143 = v140;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v144 = "yes";
        if (v143)
          v145 = "no";
        else
          v145 = "yes";
        if (!v143)
          v144 = "no";
        v187 = v145;
        v195 = (uint64_t)v144;
        LogPrintF_safe();
      }
    }
    self->_prefLoggingSensitive = v141;
    v142 = v204;
    goto LABEL_271;
  }
  v89 = prefLoggingRPI == v135;
  v142 = v204;
  if (!v89)
  {
LABEL_271:
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v187, v195);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "loadLoggingPrefs");

    objc_msgSend(v60, "setLoggingParams:loggingSensitive:", self->_prefLoggingRPI, self->_prefLoggingSensitive);
  }
  v147 = CFPrefs_GetInt64();
  v148 = v147 != 0;
  if (self->_prefPaused != v148)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      v149 = v147;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v150 = "yes";
        if (v149)
          v151 = "no";
        else
          v151 = "yes";
        if (!v149)
          v150 = "no";
        v187 = v151;
        v195 = (uint64_t)v150;
        LogPrintF_safe();
      }
    }
    self->_prefPaused = v148;
  }
  v152 = CFPrefs_GetInt64() != 0;
  if (v215)
  {
    if ((objc_msgSend(v142, "supportsFeatures:", 32) & 1) == 0
      && (networkProxyStatus = self->_networkProxyStatus) != 0
      && -[PrivacyProxyServiceStatus serviceStatus](networkProxyStatus, "serviceStatus") == 1)
    {
      v152 = (BYTE1(self->_networkProxyTraffic) >> 3) & 1;
    }
    else
    {
      v152 = 0;
    }
  }
  if (self->_prefNetworkProxyEnabled != v152)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v154 = "yes";
      if (v152)
        v155 = "no";
      else
        v155 = "yes";
      if (!v152)
        v154 = "no";
      v187 = v155;
      v195 = (uint64_t)v154;
      LogPrintF_safe();
    }
    self->_prefNetworkProxyEnabled = v152;
  }
  v156 = CFPrefs_GetInt64();
  if (v215 || (v157 = v156, v156 < 0) || v156 >= 1001)
  {
    v158 = objc_msgSend(v142, "dailyDetectExposureLimit", v187, v195);
    if (v158 - 1001 >= 0xFFFFFC18)
      v157 = v158;
    else
      v157 = 15;
  }
  prefRateLimitMaxAPICount = (const char *)self->_prefRateLimitMaxAPICount;
  if ((const char *)v157 != prefRateLimitMaxAPICount)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_311;
        prefRateLimitMaxAPICount = (const char *)self->_prefRateLimitMaxAPICount;
      }
      v187 = prefRateLimitMaxAPICount;
      v195 = v157;
      LogPrintF_safe();
    }
LABEL_311:
    self->_prefRateLimitMaxAPICount = v157;
  }
  v160 = CFPrefs_GetInt64();
  if (v215 || (v161 = v160, v160 < 0) || v160 >= 1001)
  {
    v162 = objc_msgSend(v142, "detectExposureNKDLimit", v187, v195);
    if (v162 - 1001 >= 0xFFFFFC18)
      v161 = v162;
    else
      v161 = 6;
  }
  prefRateLimitMaxAPICountV2 = (const char *)self->_prefRateLimitMaxAPICountV2;
  if ((const char *)v161 != prefRateLimitMaxAPICountV2)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_323;
        prefRateLimitMaxAPICountV2 = (const char *)self->_prefRateLimitMaxAPICountV2;
      }
      v187 = prefRateLimitMaxAPICountV2;
      v195 = v161;
      LogPrintF_safe();
    }
LABEL_323:
    self->_prefRateLimitMaxAPICountV2 = v161;
  }
  v164 = CFPrefs_GetInt64();
  v165 = v164 != 0;
  if (self->_prefSkipExposureWindowShuffling != v165)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      v166 = v164;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v167 = "yes";
        if (v166)
          v168 = "no";
        else
          v168 = "yes";
        if (!v166)
          v167 = "no";
        v187 = v168;
        v195 = (uint64_t)v167;
        LogPrintF_safe();
      }
    }
    self->_prefSkipExposureWindowShuffling = v165;
  }
  v169 = CFPrefs_GetInt64();
  v170 = v169 != 0;
  if (self->_prefSkipFileSigning != v170)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      v171 = v169;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v172 = "yes";
        if (v171)
          v173 = "no";
        else
          v173 = "yes";
        if (!v171)
          v172 = "no";
        v187 = v173;
        v195 = (uint64_t)v172;
        LogPrintF_safe();
      }
    }
    self->_prefSkipFileSigning = v170;
  }
  v174 = CFPrefs_GetInt64();
  v175 = v174 != 0;
  if (self->_prefTCCAllowWithoutApps != v175)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      v176 = v174;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v177 = "yes";
        if (v176)
          v178 = "no";
        else
          v178 = "yes";
        if (!v176)
          v177 = "no";
        v187 = v178;
        v195 = (uint64_t)v177;
        LogPrintF_safe();
      }
    }
    self->_prefTCCAllowWithoutApps = v175;
  }
  v179 = CFPrefs_GetInt64();
  if ((v179 != 0) != -[ENDaemon monthlySummaryDisabled](self, "monthlySummaryDisabled", v187, v195))
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v180 = "yes";
      if (v179)
        v181 = "no";
      else
        v181 = "yes";
      if (!v179)
        v180 = "no";
      v189 = v181;
      v197 = v180;
      LogPrintF_safe();
      -[ENDaemon setMonthlySummaryDisabled:](self, "setMonthlySummaryDisabled:", v179 != 0, v189, v197);
    }
    else
    {
      -[ENDaemon setMonthlySummaryDisabled:](self, "setMonthlySummaryDisabled:", v179 != 0, v188, v196);
    }
  }
  -[ENConfigurationManager prefsChanged](self->_configurationManager, "prefsChanged");
  -[ENDaemon _scheduleUpdate](self, "_scheduleUpdate");

}

uint64_t __24__ENDaemon_prefsChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveRegionConfiguration:error:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_resetDeveloperSettings
{
  id v3;

  if (!IsAppleInternalBuild())
  {
    CFPrefs_RemoveValue();
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearTemporaryCountrySubdivisionList");
    objc_msgSend(v3, "clearTemporaryServerConfigurations");
    CFPrefs_RemoveValue();

  }
}

- (void)_resetDataWithFlags:(unsigned int)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;

  -[ENDaemon delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((~a3 & 0xFFF) != 0)
  {
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintFlags32();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else
  {
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    -[ENDaemon setUsageResetAllData:](self, "setUsageResetAllData:", -[ENDaemon usageResetAllData](self, "usageResetAllData") + 1);
  }
  v24 = 0;
  -[ENDaemon getExposureDatabaseAndReturnError:](self, "getExposureDatabaseAndReturnError:", &v24, v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v24;
  if ((a3 & 0x40) == 0)
  {
    if ((a3 & 1) == 0)
      goto LABEL_12;
LABEL_21:
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    objc_msgSend(v5, "purgeAdvertisementDatabase");
    if ((a3 & 4) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  objc_msgSend(v5, "resetTEKHistory");
  -[ENDaemon temporaryExposureKeyManager](self, "temporaryExposureKeyManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetClientState");

  if ((a3 & 1) != 0)
    goto LABEL_21;
LABEL_12:
  if ((a3 & 4) == 0)
  {
LABEL_13:
    v8 = v7;
    goto LABEL_35;
  }
LABEL_26:
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v23 = v7;
  v10 = objc_msgSend(v6, "deleteExposureDetectionHistoryWithError:", &v23);
  v8 = v23;

  if ((v10 & 1) == 0
    && gLogCategory__ENDaemon <= 90
    && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v20 = v8;
    LogPrintF_safe();
  }
LABEL_35:
  if ((a3 & 8) != 0)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    -[ENDaemon downloadManager](self, "downloadManager", v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "purgeAllDownloads");

    if ((a3 & 0x10) == 0)
    {
LABEL_37:
      if ((a3 & 0x20) == 0)
        goto LABEL_38;
      goto LABEL_50;
    }
  }
  else if ((a3 & 0x10) == 0)
  {
    goto LABEL_37;
  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  objc_msgSend(v6, "purgeAllAndCloseWithReason:", CFSTR("ResetData"), v20);
  if ((a3 & 0x20) == 0)
  {
LABEL_38:
    v11 = v8;
    if ((a3 & 0x80) == 0)
      goto LABEL_65;
    goto LABEL_60;
  }
LABEL_50:
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  -[ENDaemon configurationManager](self, "configurationManager", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resetConfigurationCache");

  -[ENDaemon regionMonitor](self, "regionMonitor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v8;
  v15 = objc_msgSend(v14, "purgeAllRegionHistoryWithError:", &v22);
  v11 = v22;

  if ((v15 & 1) == 0
    && gLogCategory__ENDaemon <= 90
    && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  -[ENDaemon regionMonitor](self, "regionMonitor", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resetRegionMonitor");

  if ((a3 & 0x80) != 0)
  {
LABEL_60:
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    -[ENDaemon textMessageManager](self, "textMessageManager", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "purgeAllHashes");

  }
LABEL_65:
  if ((a3 & 2) != 0)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_SetValue();
    -[ENDaemon userNotificationCenter](self, "userNotificationCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeAllDeliveredNotifications");

    -[ENDaemon onboardingTriggerDeactivate](self, "onboardingTriggerDeactivate");
    TCCAccessReset();
    TCCAccessReset();
    if ((a3 & 0x100) != 0)
      goto LABEL_67;
  }
  else if ((a3 & 0x100) != 0)
  {
LABEL_67:
    CFPrefs_RemoveValue();
  }
  -[ENDaemon setOnboardingTrigger:](self, "setOnboardingTrigger:", 0, v20);
  -[ENDaemon setOnboardingRegionTrigger:](self, "setOnboardingRegionTrigger:", 0);
  -[ENDaemon setOnboardingFirstTime:](self, "setOnboardingFirstTime:", 0);
  -[ENDaemon setOnboardingLegalConsentLastViewCount:](self, "setOnboardingLegalConsentLastViewCount:", 0);
  -[ENDaemon prefsChanged](self, "prefsChanged");

}

- (void)_fetchPrefRegionConfig:(id)a3 oldCustomCountryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  ENConfigurationManager *configurationManager;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *dispatchQueue;
  _QWORD v19[4];
  _QWORD v20[2];
  _QWORD v21[4];
  _QWORD v22[2];

  v6 = a3;
  v7 = a4;
  -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prefsChanged");

  v9 = v6;
  v10 = v9;
  if (v9 && objc_msgSend(v9, "length"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA378]), "initWithCountryCode:", v10);
    configurationManager = self->_configurationManager;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __56__ENDaemon__fetchPrefRegionConfig_oldCustomCountryCode___block_invoke;
    v21[3] = &unk_1E87D9EA8;
    v13 = (id *)v22;
    v22[0] = v10;
    v22[1] = self;
    -[ENConfigurationManager fetchServerConfigurationsForRegion:userInitiated:withCompletion:](configurationManager, "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v11, 0, v21);
LABEL_11:

    goto LABEL_12;
  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clearTemporaryServerConfigurations");

  -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clearTemporaryCountrySubdivisionList");

  -[ENActiveEntity entity](self->_activeEntity, "entity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "region");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "countryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v7, "isEqualToString:", v11))
  {
    dispatchQueue = self->_dispatchQueue;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __56__ENDaemon__fetchPrefRegionConfig_oldCustomCountryCode___block_invoke_3;
    v19[3] = &unk_1E87D9DD8;
    v13 = (id *)v20;
    v20[0] = v7;
    v20[1] = self;
    dispatch_async(dispatchQueue, v19);
    goto LABEL_11;
  }
LABEL_12:

}

void __56__ENDaemon__fetchPrefRegionConfig_oldCustomCountryCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
LABEL_22:
    v8 = 0;
    goto LABEL_23;
  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v5;
    LogPrintF_safe();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "configurationStore", v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v7, "saveTemporaryServerConfigurations:error:", v5, &v16);
  v8 = v16;

  if (!v8)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(NSObject **)(v9 + 224);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__ENDaemon__fetchPrefRegionConfig_oldCustomCountryCode___block_invoke_2;
    block[3] = &unk_1E87D9C28;
    block[4] = v9;
    dispatch_async(v10, block);
    goto LABEL_22;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
LABEL_23:

}

uint64_t __56__ENDaemon__fetchPrefRegionConfig_oldCustomCountryCode___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prefsChanged");
}

uint64_t __56__ENDaemon__fetchPrefRegionConfig_oldCustomCountryCode___block_invoke_3(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  return objc_msgSend(*(id *)(a1 + 40), "_turnOffEN");
}

- (void)_tccChanged
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t k;
  uint64_t v50;
  uint64_t v51;
  int v52;
  void *v53;
  const char *v54;
  NSObject *dispatchQueue;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  const char *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD block[6];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  int v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  char v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) == 0)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    return;
  }
  v81 = 0;
  TCCAccessGetOverride();
  v3 = (void *)TCCAccessCopyInformation();
  v4 = (_QWORD *)MEMORY[0x1E0DB10B0];
  objc_msgSend(MEMORY[0x1E0CB3878], "predicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DB10B0], *MEMORY[0x1E0C9AE48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3878], "predicateWithFormat:", CFSTR("%K == %@"), *v4, *MEMORY[0x1E0C9AE58]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v7);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENActiveEntity entity](self->_activeEntity, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v78;
    v13 = (_QWORD *)MEMORY[0x1E0DB10A0];
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v78 != v12)
          objc_enumerationMutation(v9);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "objectForKey:", *v13);
        if (v15)
        {
          -[ENDaemon _getBundleIDFromBundle:](self, "_getBundleIDFromBundle:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16 && objc_msgSend(v16, "isEqualToString:", v66))
          {
            if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              v56 = (uint64_t)v17;
              LogPrintF_safe();
            }
            -[ENDaemon _turnOffEN](self, "_turnOffEN", v56);

            v43 = v65;
            goto LABEL_87;
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
      if (v11)
        continue;
      break;
    }
  }
  v64 = v7;

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v18 = v3;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v74;
    v22 = (_QWORD *)MEMORY[0x1E0DB10A0];
    while (2)
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v74 != v21)
          objc_enumerationMutation(v18);
        v24 = objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * j), "objectForKey:", *v22);
        if (v24)
        {
          -[ENDaemon _getBundleIDFromBundle:](self, "_getBundleIDFromBundle:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25 && (objc_msgSend(v25, "isEqualToString:", v66) & 1) != 0)
          {

            v27 = 1;
            goto LABEL_29;
          }

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
      if (v20)
        continue;
      break;
    }
  }
  v27 = 0;
LABEL_29:

  v72 = 0;
  CFPrefs_GetInt64();
  -[ENActiveEntity entity](self->_activeEntity, "entity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "region");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ENActiveEntity activeStatus](self->_activeEntity, "activeStatus") == 2)
  {
    v63 = v29;
    v30 = v5;
    objc_msgSend(MEMORY[0x1E0CA5858], "applicationProxyForIdentifier:", v66);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "appState");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isPlaceholder");

    objc_msgSend(v31, "appState");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isInstalled");

    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v36 = "no";
      if (v33)
        v37 = "yes";
      else
        v37 = "no";
      if (v35)
        v36 = "yes";
      v59 = v37;
      v60 = v36;
      v56 = (uint64_t)v66;
      LogPrintF_safe();
    }
    -[ENDaemon updateExistingConsentForPhase1ActiveRegion:](self, "updateExistingConsentForPhase1ActiveRegion:", 4, v56, v59, v60);
    v7 = v64;
    if (((v33 | v35) & 1) != 0)
    {
      v43 = v65;
      if (((v27 | v33 & (v35 ^ 1)) & 1) == 0)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          v57 = v66;
          LogPrintF_safe();
        }
        -[ENDaemon updateExistingConsentForPhase1ActiveRegion:](self, "updateExistingConsentForPhase1ActiveRegion:", 0, v57);
        -[ENDaemon _turnOffEN](self, "_turnOffEN");
        -[ENDaemon postENOffNotification](self, "postENOffNotification");
      }
    }
    else
    {
      v43 = v65;
      if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
    }

    v5 = v30;
LABEL_65:
    v29 = v63;
    goto LABEL_86;
  }
  if (v29 && -[ENActiveEntity activeStatus](self->_activeEntity, "activeStatus") == 3)
  {
    -[ENDaemon configurationManager](self, "configurationManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "configurationStore");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "configurationForRegion:", v29);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "userConsent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "consent");

    v7 = v64;
    if (!v42)
    {
      if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        v56 = (uint64_t)v29;
        LogPrintF_safe();
      }
      -[ENDaemon _turnOffEN](self, "_turnOffEN", v56);
      CFPrefs_RemoveValue();
      -[ENDaemon postENOffNotification](self, "postENOffNotification");
    }

    v43 = v65;
  }
  else
  {
    v7 = v64;
    v43 = v65;
    if (!v66 && objc_msgSend(v65, "count"))
    {
      v62 = v3;
      v63 = v29;
      v61 = v5;
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        v56 = objc_msgSend(v65, "count");
        LogPrintF_safe();
      }
      -[ENDaemon _turnOffEN](self, "_turnOffEN", v56);
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v44 = v65;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
      if (v45)
      {
        v46 = v45;
        v47 = (_QWORD *)MEMORY[0x1E0DB10A0];
        v48 = *(_QWORD *)v69;
        do
        {
          for (k = 0; k != v46; ++k)
          {
            if (*(_QWORD *)v69 != v48)
              objc_enumerationMutation(v44);
            v50 = objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * k), "objectForKey:", *v47, v58, v59);
            if (v50)
            {
              v51 = v50;
              v52 = TCCAccessResetForBundle();
              -[ENDaemon _getBundleIDFromBundle:](self, "_getBundleIDFromBundle:", v51);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              if (gLogCategory_ENDaemon <= 50
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                v54 = "yes";
                if (!v52)
                  v54 = "no";
                v58 = v53;
                v59 = v54;
                LogPrintF_safe();
              }

            }
          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
        }
        while (v46);
      }

      -[ENDaemon postENOffNotification](self, "postENOffNotification");
      v5 = v61;
      v3 = v62;
      v7 = v64;
      v43 = v65;
      goto LABEL_65;
    }
  }
LABEL_86:
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__ENDaemon__tccChanged__block_invoke;
  block[3] = &unk_1E87D9DD8;
  block[4] = v29;
  block[5] = self;
  dispatch_async(dispatchQueue, block);

LABEL_87:
}

uint64_t __23__ENDaemon__tccChanged__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "startServerConfigurationFetchForRegion:");
  return result;
}

- (void)_turnOffEN
{
  void *v3;

  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  TCCAccessReset();
  self->_monthlySummaryDisabled = 0;
  -[ENDaemon monthlyTriggerDeactivate](self, "monthlyTriggerDeactivate");
  -[ENDaemon onboardingTriggerDeactivate](self, "onboardingTriggerDeactivate");
  if (!self->_prefTCCAllowWithoutApps)
    CFPrefs_SetValue();
  objc_msgSend(MEMORY[0x1E0C99D60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  CFPrefs_SetDouble();

  -[ENDaemon prefsChanged](self, "prefsChanged");
}

- (BOOL)_shouldDisableMonthlySummary
{
  return self->_monthlySummaryDisabled || -[ENDaemon overallStatus](self, "overallStatus") != 1;
}

- (void)setMonthlySummaryDisabled:(BOOL)a3
{
  self->_monthlySummaryDisabled = a3;
  if (a3)
  {
    -[ENDaemon monthlyTriggerDeactivate](self, "monthlyTriggerDeactivate");
  }
  else
  {
    CFPrefs_RemoveValue();
    -[ENDaemon monthlyTriggerActivateWithIntervalOverride:](self, "monthlyTriggerActivateWithIntervalOverride:", 0);
  }
}

- (void)monthlyTriggerActivateWithIntervalOverride:(unsigned int)a3
{
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  unint64_t v16;
  _BOOL4 v17;
  uint64_t Int64;
  _BOOL4 v19;
  BOOL v20;
  double v21;
  double v22;
  uint64_t v23;
  ENXPCTimer *v24;
  ENXPCTimer *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  int v31;

  if (-[ENDaemon _shouldDisableMonthlySummary](self, "_shouldDisableMonthlySummary"))
  {
LABEL_2:
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      NSStringFromSelector(a2);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      CUPrintDuration32();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENDaemon monthlyNotificationTimer](self, "monthlyNotificationTimer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return;
  }
  if (a3)
  {
    v31 = 0;
    v6 = (double)a3;
  }
  else
  {
    -[ENDaemon monthlyNotificationTimer](self, "monthlyNotificationTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_2;
    v31 = 0;
    CFPrefs_GetDouble();
    v6 = v13;
  }
  if (v6 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D40], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextDateAfterDate:matchingUnit:value:options:", v7, 16, objc_msgSend(v8, "component:fromDate:", 16, v7), 1024);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateBySettingUnit:value:ofDate:options:", 32, 10, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v7);
    v6 = v11;
    CFPrefs_SetDouble();

  }
  if (gLogCategory_ENDaemon <= 30)
  {
    if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      LogPrintF_safe();
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintDuration32();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  v16 = 2592000;
  if (IsAppleInternalBuild())
  {
    v17 = a3 != 0;
    Int64 = CFPrefs_GetInt64();
    v19 = v31 != 0;
    v20 = !v17 || !v19;
    v21 = 7200.0;
    v22 = 10.0;
    if (v17 && v19)
      v21 = 10.0;
    v23 = 60;
    if (v20)
      v23 = 2592000;
    if ((unint64_t)(Int64 - 60) >= 0x278CC5)
    {
      v22 = v21;
      v16 = v23;
    }
    else
    {
      v16 = (unint64_t)(double)(unint64_t)Int64;
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        CUPrintDurationDouble();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
    }
  }
  else
  {
    v22 = 7200.0;
  }
  v24 = [ENXPCTimer alloc];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __55__ENDaemon_monthlyTriggerActivateWithIntervalOverride___block_invoke;
  v30[3] = &unk_1E87DA278;
  v30[4] = self;
  v25 = -[ENXPCTimer initWithName:delay:gracePeriod:cadence:priority:options:block:](v24, "initWithName:delay:gracePeriod:cadence:priority:options:block:", CFSTR("com.apple.exposurenotification.weeklynotification"), v16, 1, 8739, v30, v6, v22);
  -[ENDaemon setMonthlyNotificationTimer:](self, "setMonthlyNotificationTimer:", v25);

}

void __55__ENDaemon_monthlyTriggerActivateWithIntervalOverride___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldDisableMonthlySummary"))
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    objc_msgSend(*(id *)(a1 + 32), "monthlyTriggerDeactivate");
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "entity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "entity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

    objc_msgSend(*(id *)(a1 + 32), "postMonthlySummaryNotificationForAppBundleIdentifier:", v6);
  }

}

- (void)monthlyTriggerDeactivate
{
  void *v3;

  -[ENDaemon monthlyNotificationTimer](self, "monthlyNotificationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[ENDaemon setMonthlyNotificationTimer:](self, "setMonthlyNotificationTimer:", 0);
  CFPrefs_SetValue();
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
}

- (void)_setActiveRegionForApp:(id)a3 infoDict:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ENDaemon *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v12 = v6;
    LogPrintF_safe();
  }
  -[ENDaemon configurationManager](self, "configurationManager", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__ENDaemon__setActiveRegionForApp_infoDict___block_invoke;
  v13[3] = &unk_1E87DA2A0;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "allRegionServerConfigurationsWithCompletion:", v13);

}

void __44__ENDaemon__setActiveRegionForApp_infoDict___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  ENActiveEntity *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  ENActiveEntity *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
      objc_msgSend(v8, "appBundleID", (_QWORD)v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

      if (v10)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v11 = v8;

    if (v11)
    {
      v12 = [ENActiveEntity alloc];
      v13 = objc_alloc(MEMORY[0x1E0CAA2F8]);
      v14 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v11, "region");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v13, "initWithBundleID:region:", v14, v15);
      v17 = -[ENActiveEntity initWithEntity:activeStatus:](v12, "initWithEntity:activeStatus:", v16, 2);

      objc_msgSend(*(id *)(a1 + 40), "_writePreferenceActiveEntity:", v17);
      goto LABEL_17;
    }
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(*(id *)(a1 + 40), "fetchServerConfigurationForAppBundleIdentifier:infoDictionary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), (_QWORD)v18);
LABEL_17:

}

- (void)updateExistingConsentForPhase1ActiveRegion:(int64_t)a3
{
  ENActiveEntity *activeEntity;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  ENActiveEntity *v19;
  const char *v20;
  id v21;

  activeEntity = self->_activeEntity;
  if (activeEntity && -[ENActiveEntity activeStatus](activeEntity, "activeStatus") == 2)
  {
    -[ENActiveEntity entity](self->_activeEntity, "entity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "region");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ENDaemon configurationManager](self, "configurationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "configurationStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configurationForRegion:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "userConsent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "consent");

      if (v12)
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          if ((unint64_t)a3 > 4)
            v13 = "?";
          else
            v13 = off_1E87DADC8[a3];
          v19 = self->_activeEntity;
          v20 = v13;
          LogPrintF_safe();
        }
        objc_msgSend(v10, "userConsent", v19, v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setConsent:", a3);

        -[ENDaemon configurationManager](self, "configurationManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "configurationStore");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v17 = objc_msgSend(v16, "saveRegionConfiguration:error:", v10, &v21);
        v18 = v21;

        if ((v17 & 1) == 0
          && gLogCategory__ENDaemon <= 90
          && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }

      }
    }

  }
  else if (gLogCategory_ENDaemon <= 10 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (id)xpcConnectionForBundleID:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_xpcConnections;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "client", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "signingIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)appLaunchWithBundleID:(id)a3 activity:(unsigned int)a4 shouldEnterForeground:(BOOL)a5 requiredRuntimeInSeconds:(int)a6
{
  uint64_t v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *appActivities;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  unsigned int v25;
  int v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  ENDaemon *v38;
  void *v39;
  unsigned int v40;
  int v41;
  BOOL v42;
  _QWORD v43[5];
  id v44;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v10 = a3;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSensitiveLoggingAllowed");

  if (v12 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintFlags32();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = "no";
    if (v7)
      v15 = "yes";
    v33 = v15;
    v34 = v6;
    v31 = v10;
    v32 = v13;
    LogPrintF_safe();

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appActivities, "objectForKeyedSubscript:", v10, v31, v32, v33, v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_appActivities)
  {
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E00]);
    appActivities = self->_appActivities;
    self->_appActivities = v17;

  }
  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInt:", objc_msgSend(v16, "unsignedIntValue") | a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appActivities, "setObject:forKeyedSubscript:", v19, v10);

  v20 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __90__ENDaemon_appLaunchWithBundleID_activity_shouldEnterForeground_requiredRuntimeInSeconds___block_invoke;
  v43[3] = &unk_1E87D9DD8;
  v43[4] = self;
  v21 = v10;
  v44 = v21;
  v22 = (void *)MEMORY[0x1D17A7E5C](v43);
  v23 = objc_alloc_init(MEMORY[0x1E0C99E00]);
  v24 = v23;
  v35 = v16;
  v25 = a4;
  v26 = v6;
  if (v7)
  {
    objc_msgSend(v23, "setObject:forKeyedSubscript:", &unk_1E87EE0A8, *MEMORY[0x1E0D22D90]);
    v27 = (_QWORD *)MEMORY[0x1E0D22DA0];
  }
  else
  {
    v27 = (_QWORD *)MEMORY[0x1E0D22CF8];
  }
  objc_msgSend(v24, "setObject:forKeyedSubscript:", &unk_1E87EE0A8, *v27);
  objc_msgSend(MEMORY[0x1E0D23160], "optionsWithDictionary:", v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D23168], "serviceWithDefaultShellEndpoint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v20;
  v36[1] = 3221225472;
  v36[2] = __90__ENDaemon_appLaunchWithBundleID_activity_shouldEnterForeground_requiredRuntimeInSeconds___block_invoke_457;
  v36[3] = &unk_1E87DA2C8;
  v42 = v7;
  v38 = self;
  v39 = v22;
  v40 = v25;
  v41 = v26;
  v37 = v21;
  v30 = v21;
  objc_msgSend(v29, "openApplication:withOptions:completion:", v30, v28, v36);

}

void __90__ENDaemon_appLaunchWithBundleID_activity_shouldEnterForeground_requiredRuntimeInSeconds___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForBundleID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = objc_msgSend(*(id *)(a1 + 32), "appDequeueActivityFlagsWithBundleID:", *(_QWORD *)(a1 + 40));
    v2 = v4;
    if (v3)
    {
      objc_msgSend(v4, "xpcReportActivityFlags:");
      v2 = v4;
    }
  }

}

void __90__ENDaemon_appLaunchWithBundleID_activity_shouldEnterForeground_requiredRuntimeInSeconds___block_invoke_457(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  dispatch_time_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD block[4];
  id v33;
  void *v34;
  int v35;
  int v36;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isSensitiveLoggingAllowed");

    if (v15 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintFlags32();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintNSError();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else
  {
    v8 = objc_msgSend(v5, "pid");
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSensitiveLoggingAllowed");

    if (v10 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v13 = *(_QWORD *)(a1 + 32);
      CUPrintFlags32();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v8;
      v27 = v13;
      LogPrintF_safe();

    }
    if (*(_BYTE *)(a1 + 64))
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v11, v12);
    }
    else
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE300]), "initWithPID:flags:reason:name:", v8, 1, 5, *(_QWORD *)(a1 + 32));
      if ((objc_msgSend(v17, "acquire") & 1) != 0)
      {
        (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v18, v19);
        v20 = dispatch_time(0, 1000000000 * *(int *)(a1 + 60));
        v21 = *(void **)(a1 + 32);
        v22 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 224);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __90__ENDaemon_appLaunchWithBundleID_activity_shouldEnterForeground_requiredRuntimeInSeconds___block_invoke_2;
        block[3] = &unk_1E87DA250;
        v23 = v21;
        v35 = *(_DWORD *)(a1 + 56);
        v36 = v8;
        v33 = v23;
        v34 = v17;
        dispatch_after(v20, v22, block);

      }
      else
      {
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isSensitiveLoggingAllowed");

        if (v25
          && gLogCategory_ENDaemon <= 90
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          v26 = *(_QWORD *)(a1 + 32);
          CUPrintFlags32();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

          objc_msgSend(v17, "invalidate", v26, v29, v8);
        }
        else
        {
          objc_msgSend(v17, "invalidate", v27, v28, v30);
        }
      }

    }
  }

}

uint64_t __90__ENDaemon_appLaunchWithBundleID_activity_shouldEnterForeground_requiredRuntimeInSeconds___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v5;

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSensitiveLoggingAllowed");

  if (v3 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintFlags32();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)postAnalyticsOptInNotificationForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  if (v4)
  {
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverConfigurationForRegion:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if ((objc_msgSend(v6, "telemetryAuthorization") & 1) != 0)
      {
        if ((unint64_t)objc_msgSend(v6, "enVersion") > 1)
        {
          -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "agencyConfigurationForRegion:", v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "agencyDisplayName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "localizedConfiguration");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "regionName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = (void *)MEMORY[0x1E0CB3938];
          objc_msgSend(v4, "regionCode");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("prefs:root=EXPOSURE_NOTIFICATION&path=ANALYTICS-CONSENT/%@"), v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = objc_alloc_init(MEMORY[0x1E0CEC6D8]);
          objc_msgSend(v14, "setTitle:", v10);
          v15 = (void *)MEMORY[0x1E0CB3938];
          v27[0] = v24;
          objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v27, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_ANALYTICS_CONSENT_SUBTITLE"), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setSubtitle:", v17);

          objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_ANALYTICS_CONSENT_BODY"), 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setBody:", v18);

          objc_msgSend(MEMORY[0x1E0CEC768], "defaultSound");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setSound:", v19);

          objc_msgSend(v14, "setThreadIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.endaemon"));
          objc_msgSend(v14, "setCategoryIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.analyticsConsent"));
          objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setDefaultActionURL:", v20);

          v25 = CFSTR("regionCode");
          objc_msgSend(v4, "regionCode");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v21;
          objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setUserInfo:", v22);

          objc_msgSend(v14, "setShouldBackgroundDefaultAction:", 1);
          objc_msgSend(v14, "setShouldAuthenticateDefaultAction:", 1);
          objc_msgSend(MEMORY[0x1E0CEC748], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.ExposureNotification.UserNotification"), v14, 0, 7);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENDaemon _postUserNotificationWithRequest:authorizationFailureHandler:](self, "_postUserNotificationWithRequest:authorizationFailureHandler:", v23, 0);

LABEL_10:
          goto LABEL_11;
        }
        if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
          goto LABEL_10;
      }
      else if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_10;
      }
    }
    else if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_10;
    }
    LogPrintF_safe();
    goto LABEL_10;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_11:

}

- (void)postExposureSummaryAccessNotificationWithAppBundleIdentifier:(id)a3 string:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CA5858], "applicationProxyForIdentifier:placeholder:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc_init(MEMORY[0x1E0CEC6D8]);
    objc_msgSend(v10, "setTitle:", v9);
    v11 = objc_msgSend(v7, "length");
    v12 = (void *)MEMORY[0x1E0CB3938];
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_COBRANDED_SUBTITLE"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSubtitle:", v13);

      v12 = (void *)MEMORY[0x1E0CB3938];
      v27[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v27, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("EN_COBRANDED_BODY");
    }
    else
    {
      v26 = v7;
      objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", &v26, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("EN_COBRANDED_BODY_STANDALONE");
    }
    objc_msgSend(v12, "localizedUserNotificationStringForKey:arguments:", v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBody:", v16);

    objc_msgSend(MEMORY[0x1E0CEC730], "iconForApplicationIdentifier:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIcon:", v17);

    objc_msgSend(MEMORY[0x1E0CEC768], "defaultSound");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSound:", v18);

    objc_msgSend(v10, "setThreadIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.cobranded"));
    objc_msgSend(v10, "setCategoryIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.summary"));
    objc_msgSend(v10, "setShouldBackgroundDefaultAction:", 1);
    -[ENActiveEntity entity](self->_activeEntity, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "region");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "regionCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v24 = CFSTR("regionCode");
      v25 = v21;
      objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setUserInfo:", v22);

    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    objc_msgSend(MEMORY[0x1E0CEC748], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.ExposureNotification.summary"), v10, 0, 7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENDaemon _postUserNotificationWithRequest:authorizationFailureHandler:](self, "_postUserNotificationWithRequest:authorizationFailureHandler:", v23, 0);

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)postGeneralNotificationWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  if (v12 && v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CEC6D8]);
    objc_msgSend(v7, "setTitle:", &stru_1E87DD6B8);
    objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", v12, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubtitle:", v8);

    objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBody:", v9);

    objc_msgSend(MEMORY[0x1E0CEC768], "defaultSound");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSound:", v10);

    objc_msgSend(v7, "setThreadIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.endaemon"));
    objc_msgSend(v7, "setCategoryIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.preArm"));
    objc_msgSend(v7, "setShouldBackgroundDefaultAction:", 1);
    objc_msgSend(v7, "setShouldAuthenticateDefaultAction:", 1);
    objc_msgSend(MEMORY[0x1E0CEC748], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.ExposureNotification.preArm"), v7, 0, 7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENDaemon _postUserNotificationWithRequest:authorizationFailureHandler:](self, "_postUserNotificationWithRequest:authorizationFailureHandler:", v11, 0);

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)postMonthlySummaryNotificationForAppBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v7 = objc_alloc_init(MEMORY[0x1E0CEC6D8]);
    objc_msgSend(MEMORY[0x1E0CEC730], "iconForApplicationIdentifier:", CFSTR("com.apple.Preferences"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIcon:", v8);

    objc_msgSend(v7, "setTitle:", &stru_1E87DD6B8);
    objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_MONTHLY_SUBTITLE"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubtitle:", v9);

    objc_msgSend(MEMORY[0x1E0CEC768], "defaultSound");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSound:", v10);

    objc_msgSend(v7, "setThreadIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.weeklyupdatenotification"));
    objc_msgSend(v7, "setCategoryIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.weekly"));
    objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", CFSTR("prefs:root=EXPOSURE_NOTIFICATION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultActionURL:", v11);

    objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_MONTHLY_ZERO_COUNT_BODY"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBody:", v12);

    objc_msgSend(MEMORY[0x1E0CEC748], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.ExposureNotification.weekly"), v7, 0, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__ENDaemon_postMonthlySummaryNotificationForAppBundleIdentifier___block_invoke;
    v14[3] = &unk_1E87D9C28;
    v14[4] = self;
    -[ENDaemon _postUserNotificationWithRequest:authorizationFailureHandler:](self, "_postUserNotificationWithRequest:authorizationFailureHandler:", v13, v14);

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

uint64_t __65__ENDaemon_postMonthlySummaryNotificationForAppBundleIdentifier___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 117) = 1;
  return result;
}

- (void)postOnboardingNotificationForRegion:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  if (v4)
  {
    v5 = -[ENDaemon _getAvailabilityAlertCountIncrement:reset:](self, "_getAvailabilityAlertCountIncrement:reset:", 1, 0);
    if (gLogCategory_ENDaemon <= 30)
    {
      v6 = v5;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v22 = v6;
        LogPrintF_safe();
      }
    }
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore", v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "agencyConfigurationForRegion:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "agencyDisplayName");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "serverConfigurationForRegion:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v12, "enVersion") <= 1)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
      }
      else
      {
        v13 = objc_alloc_init(MEMORY[0x1E0CEC6D8]);
        objc_msgSend(v13, "setTitle:", &stru_1E87DD6B8);
        objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_AVAILABLE_SUBTITLE"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSubtitle:", v14);

        v15 = (void *)MEMORY[0x1E0CB3938];
        v25[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v25, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_AVAILABLE_BODY_PHA"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBody:", v17);

        objc_msgSend(MEMORY[0x1E0CEC768], "defaultSound");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSound:", v18);

        objc_msgSend(v13, "setThreadIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.endaemon"));
        objc_msgSend(v13, "setCategoryIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.onboarding"));
        v23 = CFSTR("regionCode");
        objc_msgSend(v4, "regionCode");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v19;
        objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setUserInfo:", v20);

        objc_msgSend(v13, "setShouldBackgroundDefaultAction:", 1);
        objc_msgSend(v13, "setShouldAuthenticateDefaultAction:", 1);
        objc_msgSend(MEMORY[0x1E0CEC748], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.ExposureNotification.onboarding"), v13, 0, 7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENDaemon _postUserNotificationWithRequest:authorizationFailureHandler:](self, "_postUserNotificationWithRequest:authorizationFailureHandler:", v21, 0);

      }
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)postPreAuthorizationNotificationForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  if (v4)
  {
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "agencyConfigurationForRegion:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "agencyDisplayName");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (!v6 || !v7)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      goto LABEL_23;
    }
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serverConfigurationForRegion:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[ENDaemon _isNKDActive](self, "_isNKDActive"))
    {
      if (!v10)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(v10, "appBundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v10 || !v11 || !objc_msgSend(v11, "length"))
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        goto LABEL_21;
      }

    }
    v12 = objc_alloc_init(MEMORY[0x1E0CEC6D8]);
    objc_msgSend(v12, "setTitle:", v8);
    if (-[ENDaemon _isNKDActive](self, "_isNKDActive"))
    {
      objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_PREARM_SUBTITLE_ENX"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSubtitle:", v13);

      v14 = (void *)MEMORY[0x1E0CB3938];
      v26[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v26, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("EN_PREARM_BODY_ENX");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_PREARM_SUBTITLE"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSubtitle:", v17);

      v14 = (void *)MEMORY[0x1E0CB3938];
      v25 = v8;
      objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", &v25, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("EN_PREARM_BODY");
    }
    objc_msgSend(v14, "localizedUserNotificationStringForKey:arguments:", v16, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBody:", v18);

    objc_msgSend(MEMORY[0x1E0CEC768], "defaultSound");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSound:", v19);

    objc_msgSend(v12, "setThreadIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.endaemon"));
    objc_msgSend(v12, "setCategoryIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.preArm"));
    v23[0] = CFSTR("regionCode");
    objc_msgSend(v4, "regionCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = CFSTR("isKeyReleased");
    v24[0] = v20;
    v24[1] = MEMORY[0x1E0C9AAA8];
    objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUserInfo:", v21);

    objc_msgSend(v12, "setShouldBackgroundDefaultAction:", 1);
    objc_msgSend(v12, "setShouldAuthenticateDefaultAction:", 1);
    objc_msgSend(v12, "setInterruptionLevel:", 2);
    objc_msgSend(MEMORY[0x1E0CEC748], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.ExposureNotification.preArm"), v12, 0, 5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENDaemon _postUserNotificationWithRequest:authorizationFailureHandler:](self, "_postUserNotificationWithRequest:authorizationFailureHandler:", v22, 0);

LABEL_21:
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_24:

}

- (void)postTestVerificationReceivedNotification:(id)a3 region:(id)a4 reportType:(unsigned int)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  ENDaemon *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  ENDaemon *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v8 = a4;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  if (v46)
  {
    if (v8)
    {
      objc_msgSend(v46, "ensTestVerificationURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteString");
      v10 = objc_claimAutoreleasedReturnValue();

      v45 = (void *)v10;
      if (!v10)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB3798], "stringWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "agencyConfigurationForRegion:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "agencyDisplayName");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (!v13 || !v14)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        goto LABEL_23;
      }
      if (a5 == 3)
      {
        if (!-[ENConfigurationManager regionSupportsFeatures:featureFlags:](self->_configurationManager, "regionSupportsFeatures:featureFlags:", v8, 2))
        {
          if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          v22 = 0;
          goto LABEL_22;
        }
        v43 = v11;
        objc_msgSend(v13, "localizedConfiguration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "selfReportNotificationBody");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v17, "length"))
        {
          if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();

          v22 = 0;
          v11 = v43;
          goto LABEL_22;
        }
        v18 = (void *)MEMORY[0x1E0CB3938];
        v49[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v49, 1);
        v19 = v13;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_SELF_REPORT_BODY_%@"), v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v13 = v19;
        v22 = (void *)v21;
        objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_SELF_REPORT_SUBTITLE"), 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v43;
      }
      else
      {
        objc_msgSend(v13, "localizedConfiguration");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "testVerificationNotificationBody");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v22, "length"))
        {
          if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          goto LABEL_22;
        }
        objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_SMS_SUBTITLE_TOUCH_ID"), 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[ENDaemon deviceSupportsFaceID](ENDaemon, "deviceSupportsFaceID"))
        {
          objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_SMS_SUBTITLE_FACE_ID"), 0);
          v25 = objc_claimAutoreleasedReturnValue();

          v23 = (void *)v25;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("&t=%lu"), a5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendString:", v26);
      -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "serverConfigurationForRegion:", v8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        if ((unint64_t)objc_msgSend(v28, "enVersion") <= 1)
        {
          if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
            goto LABEL_21;
        }
        else
        {
          if (-[ENDaemon _isNKDActive](self, "_isNKDActive"))
          {
            v29 = objc_alloc_init(MEMORY[0x1E0CEC6D8]);
            objc_msgSend(v29, "setTitle:", v15);
            objc_msgSend(v29, "setSubtitle:", v23);
            objc_msgSend(v29, "setBody:", v22);
            objc_msgSend(MEMORY[0x1E0CEC768], "defaultSound");
            v42 = v28;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setSound:", v30);

            objc_msgSend(v29, "setThreadIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.endaemon"));
            objc_msgSend(v29, "setCategoryIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.exposure"));
            objc_msgSend(v29, "setInterruptionLevel:", 2);
            v47[0] = CFSTR("regionCode");
            objc_msgSend(v8, "regionCode");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v47[1] = CFSTR("isTextMessageVerificationURL");
            v48[0] = v31;
            v48[1] = v11;
            objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
            v44 = v26;
            v32 = self;
            v33 = v23;
            v34 = v15;
            v35 = v13;
            v36 = v11;
            v37 = v8;
            v38 = v22;
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setUserInfo:", v39);

            v22 = v38;
            v8 = v37;
            v11 = v36;
            v13 = v35;
            v15 = v34;
            v23 = v33;

            objc_msgSend(v29, "setShouldBackgroundDefaultAction:", 1);
            objc_msgSend(v29, "setShouldAuthenticateDefaultAction:", 1);
            objc_msgSend(MEMORY[0x1E0CEC748], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.ExposureNotification.textMessage"), v29, 0, 7);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v32;
            v26 = v44;
            -[ENDaemon _postUserNotificationWithRequest:authorizationFailureHandler:](v41, "_postUserNotificationWithRequest:authorizationFailureHandler:", v40, 0);

            v28 = v42;
LABEL_21:

LABEL_22:
LABEL_23:

LABEL_24:
            goto LABEL_25;
          }
          if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
            goto LABEL_21;
        }
      }
      else if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_21;
      }
      LogPrintF_safe();
      goto LABEL_21;
    }
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
LABEL_31:
      LogPrintF_safe();
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_31;
  }
LABEL_25:

}

- (void)presentBuddyForRegion:(id)a3 errorHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  void (**v14)(id, void *);
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  void (**v22)(id, void *);
  void *v23;
  _QWORD v24[5];
  id v25;
  void (**v26)(id, void *);
  id v27;

  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  v10 = a5;
  -[ENDaemon buddyAlertHandle](self, "buddyAlertHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isValid");

  if (v12)
  {
    if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    ENErrorF();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v9[2](v9, v20);

  }
  else
  {
    v13 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __65__ENDaemon_presentBuddyForRegion_errorHandler_completionHandler___block_invoke;
    v24[3] = &unk_1E87DA2F0;
    v24[4] = self;
    v14 = v9;
    v26 = v14;
    v25 = v8;
    v27 = v10;
    v15 = (void *)MEMORY[0x1D17A7E5C](v24);
    -[ENDaemon sharingClient](self, "sharingClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[ENDaemon sharingClient](self, "sharingClient");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "invalidate");

      -[ENDaemon setSharingClient:](self, "setSharingClient:", 0);
    }
    v18 = objc_alloc_init(MEMORY[0x1E0D973F0]);
    -[ENDaemon setSharingClient:](self, "setSharingClient:", v18);

    -[ENDaemon sharingClient](self, "sharingClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __65__ENDaemon_presentBuddyForRegion_errorHandler_completionHandler___block_invoke_2;
    v21[3] = &unk_1E87DA340;
    v21[4] = self;
    v22 = v14;
    v23 = v15;
    objc_msgSend(v19, "startProxCardTransactionWithOptions:completion:", 0, v21);

  }
}

void __65__ENDaemon_presentBuddyForRegion_errorHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "buddyAlertHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValid");

  if (v3)
  {
    if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    ENErrorF();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
    {
      v17 = v13;
      (*(void (**)(void))(v14 + 16))();
      v13 = v17;
    }

  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF80]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.HealthENBuddy"), CFSTR("HealthENBuddy.HealthENBuddyContainer"));
    v5 = objc_alloc_init(MEMORY[0x1E0DAAF68]);
    v18 = CFSTR("regionCountryCode");
    objc_msgSend(*(id *)(a1 + 40), "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 40), "subdivisionCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "subdivisionCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("regionSubdivisionCode"));

    }
    objc_msgSend(v5, "setUserInfo:", v8);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0DAAF90], "newHandleWithDefinition:configurationContext:", v4, v5);
    objc_msgSend(*(id *)(a1 + 32), "setBuddyAlertHandle:", v11);

    v12 = *(_QWORD *)(a1 + 56);
    if (v12 && ((*(uint64_t (**)(void))(v12 + 16))() & 1) == 0)
    {
      if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      objc_msgSend(*(id *)(a1 + 32), "tearDownAlertHandle");
    }
    else
    {
      if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      objc_msgSend(*(id *)(a1 + 32), "buddyAlertHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObserver:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 32), "buddyAlertHandle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activateWithContext:", 0);

    }
  }
}

void __65__ENDaemon_presentBuddyForRegion_errorHandler_completionHandler___block_invoke_2(_QWORD *a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    objc_msgSend(MEMORY[0x1E0D23168], "serviceWithDefaultShellEndpoint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0D23160];
    v16 = *MEMORY[0x1E0D22CF8];
    v17[0] = MEMORY[0x1E0C9AAA8];
    objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "optionsWithDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__ENDaemon_presentBuddyForRegion_errorHandler_completionHandler___block_invoke_3;
    v13[3] = &unk_1E87DA318;
    v7 = (void *)a1[5];
    v13[4] = a1[4];
    v8 = v7;
    v9 = a1[6];
    v14 = v8;
    v15 = v9;
    objc_msgSend(v3, "openApplication:withOptions:completion:", CFSTR("com.apple.HealthENBuddy"), v6, v13);

  }
  else
  {
    if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    ENErrorF();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a1[5];
    if (v11)
    {
      v12 = v10;
      (*(void (**)(void))(v11 + 16))();
      v10 = v12;
    }

  }
}

void __65__ENDaemon_presentBuddyForRegion_errorHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v7 = v5;
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(a1 + 32), "tearDownAlertHandle", v7, v8);
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
  else
  {
    if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)tearDownAlertHandle
{
  void *v3;
  void *v4;
  void *v5;

  -[ENDaemon buddyAlertHandle](self, "buddyAlertHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[ENDaemon buddyAlertHandle](self, "buddyAlertHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[ENDaemon setBuddyAlertHandle:](self, "setBuddyAlertHandle:", 0);
  -[ENDaemon sharingClient](self, "sharingClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[ENDaemon setSharingClient:](self, "setSharingClient:", 0);
}

- (void)postENOffNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v8 = objc_alloc_init(MEMORY[0x1E0CEC6D8]);
  objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_OFF_TITLE"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0CB3938], "localizedUserNotificationStringForKey:arguments:", CFSTR("EN_OFF_BODY"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBody:", v4);

  objc_msgSend(MEMORY[0x1E0CEC768], "defaultSound");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSound:", v5);

  objc_msgSend(v8, "setThreadIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.endaemon"));
  objc_msgSend(v8, "setCategoryIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.off"));
  objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", CFSTR("prefs:root=EXPOSURE_NOTIFICATION"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDefaultActionURL:", v6);

  objc_msgSend(MEMORY[0x1E0CEC748], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.ExposureNotification.off"), v8, 0, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENDaemon _postUserNotificationWithRequest:authorizationFailureHandler:](self, "_postUserNotificationWithRequest:authorizationFailureHandler:", v7, 0);

}

- (void)postExposureNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "agencyConfigurationForRegion:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "agencyDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3938];
    objc_msgSend(v5, "regionCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("prefs:root=EXPOSURE_NOTIFICATION&path=EXPOSURE/LATEST/%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x1E0CEC6D8]);
    objc_msgSend(v4, "classification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v22 = CFSTR("classificationIndex");
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedChar:", objc_msgSend(v13, "index"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUserInfo:", v16);

    }
    objc_msgSend(v12, "setTitle:", v8);
    objc_msgSend(v4, "localizedSubjectText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSubtitle:", v17);

    objc_msgSend(v4, "localizedBodyText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBody:", v18);

    objc_msgSend(MEMORY[0x1E0CEC768], "defaultSound");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSound:", v19);

    objc_msgSend(v12, "setThreadIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.cobranded"));
    objc_msgSend(v12, "setCategoryIdentifier:", CFSTR("com.apple.ExposureNotification.UserNotification.exposure"));
    objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDefaultActionURL:", v20);

    objc_msgSend(v12, "setShouldBackgroundDefaultAction:", 1);
    objc_msgSend(v12, "setInterruptionLevel:", 2);
    objc_msgSend(MEMORY[0x1E0CEC748], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.ExposureNotification.exposure"), v12, 0, 7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENDaemon _postUserNotificationWithRequest:authorizationFailureHandler:](self, "_postUserNotificationWithRequest:authorizationFailureHandler:", v21, 0);

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)_postUserNotificationWithRequest:(id)a3 authorizationFailureHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  const __CFString *v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  char v24;
  char v25;
  id v26;
  id v27;
  id v28;
  id v29;
  ENDaemon *v30;
  void *v31;
  void *v32;
  char v33;
  _QWORD v34[6];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  const __CFString *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ENDaemon userNotificationCenter](self, "userNotificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "categoryIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v8, "deliveredNotifications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (!v11)
    goto LABEL_12;
  v12 = v11;
  v28 = v7;
  v29 = v6;
  v30 = self;
  v31 = v8;
  v33 = 0;
  v13 = *(_QWORD *)v38;
  v14 = 1;
  v15 = CFSTR("com.apple.ExposureNotification.UserNotification");
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v38 != v13)
        objc_enumerationMutation(v10);
      objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "request", v28, v29, v30, v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", v15);

      if (v19)
      {
        objc_msgSend(v17, "content");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "categoryIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v15;
        v23 = v10;
        v24 = objc_msgSend(v21, "isEqualToString:", v32);

        v14 &= v24;
        v33 |= v24;
        v10 = v23;
        v15 = v22;
      }

    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  }
  while (v12);

  v25 = v33 & v14;
  self = v30;
  v8 = v31;
  v7 = v28;
  v6 = v29;
  if ((v25 & 1) != 0)
  {
    v41 = v15;
    objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", &v41, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removeDeliveredNotificationsWithIdentifiers:", v10);
LABEL_12:

  }
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __73__ENDaemon__postUserNotificationWithRequest_authorizationFailureHandler___block_invoke;
  v34[3] = &unk_1E87DA3B8;
  v34[4] = self;
  v34[5] = v8;
  v35 = v6;
  v36 = v7;
  v26 = v6;
  v27 = v7;
  objc_msgSend(v8, "requestAuthorizationWithOptions:completionHandler:", 18, v34);

}

void __73__ENDaemon__postUserNotificationWithRequest_authorizationFailureHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  char v16;

  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 224);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ENDaemon__postUserNotificationWithRequest_authorizationFailureHandler___block_invoke_2;
  block[3] = &unk_1E87DA390;
  v16 = a2;
  v12 = v5;
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v15 = v7;
  v13 = v8;
  v14 = v9;
  v10 = v5;
  dispatch_async(v6, block);

}

void __73__ENDaemon__postUserNotificationWithRequest_authorizationFailureHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  if (*(_BYTE *)(a1 + 64))
  {
    v3 = *(void **)(a1 + 40);
    v2 = *(void **)(a1 + 48);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __73__ENDaemon__postUserNotificationWithRequest_authorizationFailureHandler___block_invoke_3;
    v5[3] = &unk_1E87DA368;
    v6 = v2;
    objc_msgSend(v3, "addNotificationRequest:withCompletionHandler:", v6, v5);

  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
  }
}

void __73__ENDaemon__postUserNotificationWithRequest_authorizationFailureHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      v8 = v3;
      if (gLogCategory__ENDaemon != -1 || (v6 = _LogCategory_Initialize(), v4 = v8, v6))
      {
        objc_msgSend(*(id *)(a1 + 32), "content");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "threadIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v4 = v8;
      }
    }
  }

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  ENActiveEntity *activeEntity;
  void *v23;
  uint64_t Int64;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  BOOL v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66[6];
  _QWORD v67[4];
  id v68;
  _QWORD v69[2];
  _QWORD v70[4];

  v70[2] = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C809B0];
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __88__ENDaemon_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  v67[3] = &unk_1E87DA3E0;
  v61 = v9;
  v68 = v61;
  v11 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v67);
  objc_msgSend(v8, "notification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "content");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "categoryIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "notification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "request");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "content");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "userInfo");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "actionIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CEC800]);

  objc_msgSend(MEMORY[0x1E0CA5880], "defaultWorkspace");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0D22DA0];
  v69[0] = *MEMORY[0x1E0D22D90];
  v69[1] = v21;
  v70[0] = MEMORY[0x1E0C9AAA8];
  v70[1] = MEMORY[0x1E0C9AAA8];
  objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.ExposureNotification.UserNotification.summary")))
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    activeEntity = self->_activeEntity;
    if (activeEntity)
    {
      -[ENActiveEntity entity](activeEntity, "entity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bundleIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      Int64 = CFDictionaryGetInt64();
      -[ENActiveEntity entity](self->_activeEntity, "entity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "region");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "regionCode");
      v27 = (id)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v64, "isEqualToString:", v27) & 1) != 0)
      {
        if (!Int64)
        {
          v33 = objc_alloc_init(MEMORY[0x1E0CA5930]);
          objc_msgSend(v33, "setFrontBoardOptions:", v62);
          v66[1] = v10;
          v66[2] = (id)3221225472;
          v66[3] = __88__ENDaemon_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2;
          v66[4] = &unk_1E87DA408;
          v66[5] = v59;
          objc_msgSend(v63, "openApplicationWithBundleIdentifier:configuration:completionHandler:");
          goto LABEL_100;
        }
        if ((_DWORD)v20)
        {
          if (v59 && objc_msgSend(v59, "length"))
          {
            -[ENDaemon appLaunchWithBundleID:activity:shouldEnterForeground:requiredRuntimeInSeconds:](self, "appLaunchWithBundleID:activity:shouldEnterForeground:requiredRuntimeInSeconds:", v59, 8, 1, 0);
            goto LABEL_101;
          }
          objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("prefs:root=EXPOSURE_NOTIFICATION&path=KEY-RELEASED"));
          v33 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "isSensitiveLoggingAllowed");

            if (v39
              && gLogCategory_ENDaemon <= 30
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
              objc_msgSend(v63, "openSensitiveURL:withOptions:", v37, v62, v33);
            }
            else
            {
              objc_msgSend(v63, "openSensitiveURL:withOptions:", v37, v62, v57);
            }
          }
          else if (gLogCategory__ENDaemon <= 90
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }

LABEL_100:
        }
LABEL_101:

        goto LABEL_102;
      }
      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
        goto LABEL_101;
LABEL_25:
      LogPrintF_safe();
      goto LABEL_101;
    }
    if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
      goto LABEL_103;
    goto LABEL_107;
  }
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.ExposureNotification.UserNotification.preArm")))
  {
    if ((_DWORD)v20)
    {
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->_activeEntity)
      {
        if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
          goto LABEL_103;
        goto LABEL_107;
      }
      v28 = CFDictionaryGetInt64();
      -[ENActiveEntity entity](self->_activeEntity, "entity");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bundleIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59 && objc_msgSend(v59, "length"))
      {
        -[ENDaemon appLaunchWithBundleID:activity:shouldEnterForeground:requiredRuntimeInSeconds:](self, "appLaunchWithBundleID:activity:shouldEnterForeground:requiredRuntimeInSeconds:", v59, 8, 1, 0);
        goto LABEL_102;
      }
      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("prefs:root=EXPOSURE_NOTIFICATION&path=KEY-RELEASED"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", v27);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "isSensitiveLoggingAllowed");

          if (v35
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
            objc_msgSend(v63, "openSensitiveURL:withOptions:", v33, v62, v27);
            goto LABEL_100;
          }
LABEL_99:
          objc_msgSend(v63, "openSensitiveURL:withOptions:", v33, v62, v57);
          goto LABEL_100;
        }
        if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
          goto LABEL_100;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("prefs:root=EXPOSURE_NOTIFICATION"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", v27);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "isSensitiveLoggingAllowed");

          if (v41
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
            objc_msgSend(v63, "openSensitiveURL:withOptions:", v33, v62, v33);
            goto LABEL_100;
          }
          goto LABEL_99;
        }
        if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
          goto LABEL_100;
      }
      LogPrintF_safe();
      goto LABEL_100;
    }
  }
  else if (objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.ExposureNotification.UserNotification.onboarding")))
  {
    if ((_DWORD)v20)
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (v64)
      {
        -[ENDaemon onboardingManager](self, "onboardingManager");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setPendingBuddyOnboarding:", 0);

        objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("prefs:root=EXPOSURE_NOTIFICATION&path=ONBOARDING/%@"), v64);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:");
        v27 = (id)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "isSensitiveLoggingAllowed");

          if (v44
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            v58 = v59;
            LogPrintF_safe();
          }
          objc_msgSend(v63, "openSensitiveURL:withOptions:", v27, v62, v58);
          CFPrefs_SetValue();
          goto LABEL_101;
        }
        if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
          goto LABEL_101;
        goto LABEL_25;
      }
      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
        goto LABEL_103;
LABEL_107:
      LogPrintF_safe();
      goto LABEL_103;
    }
    -[ENDaemon _readPreferenceRegionPendingOnboarding](self, "_readPreferenceRegionPendingOnboarding");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      -[ENDaemon _readPreferenceRegionPendingOnboarding](self, "_readPreferenceRegionPendingOnboarding");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v64)
        goto LABEL_103;
      -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "configurationForRegion:", v64);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v59)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        goto LABEL_102;
      }
      objc_msgSend(v59, "userConsent");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "consent") == 2;

      if (!v47)
      {
        objc_msgSend(v59, "userConsent");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setConsent:", 3);

        -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = 0;
        v50 = objc_msgSend(v49, "saveRegionConfiguration:error:", v59, v66);
        v27 = v66[0];

        if ((v50 & 1) != 0)
        {
          -[ENDaemon activeEntity](self, "activeEntity");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "entity");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "region");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v64, "isEqual:", v53);

          if (v54)
          {
            if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              LogPrintF_safe();
            -[ENDaemon _turnOffEN](self, "_turnOffEN");
          }
          -[ENDaemon onboardingTriggerDeactivate](self, "onboardingTriggerDeactivate");
        }
        else if (gLogCategory__ENDaemon <= 90
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        goto LABEL_101;
      }
LABEL_102:

      goto LABEL_103;
    }
  }
  else
  {
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.ExposureNotification.UserNotification.exposure")))
    {
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v30 = objc_claimAutoreleasedReturnValue();
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isSensitiveLoggingAllowed");
      v64 = (void *)v30;

      if (v32
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      if (!v30)
      {
        NSDictionaryGetNSNumber();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v56;
        if (v56)
          -[ENDifferentialPrivacyManager reportUserExposureNotificationTapped:classificationIndex:](self->_differentialPrivacyManager, "reportUserExposureNotificationTapped:classificationIndex:", v20, objc_msgSend(v56, "unsignedCharValue"));
        goto LABEL_102;
      }
      if (!(_DWORD)v20)
      {
LABEL_103:

        goto LABEL_104;
      }
      objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", CFSTR("prefs:root=EXPOSURE_NOTIFICATION"));
      v55 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "openSensitiveURL:withOptions:", v55, v62);
      v59 = (void *)v55;
      objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", v30);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "openURL:withOptions:", v27, v62);
      goto LABEL_101;
    }
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
  }
LABEL_104:

  v11[2](v11);
}

uint64_t __88__ENDaemon_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__ENDaemon_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_ENDaemon <= 30
    && ((v6 = v3, gLogCategory_ENDaemon != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF_safe();

  }
  else
  {

  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_ENDaemon <= 40
    && ((v6 = v3, gLogCategory_ENDaemon != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF_safe();

  }
  else
  {

  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;

  v4 = a3;
  if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  -[ENDaemon _deferConsentForPendingRegion](self, "_deferConsentForPendingRegion");
  -[ENDaemon tearDownAlertHandle](self, "tearDownAlertHandle");

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  void *v5;
  int v6;
  uint64_t v7;
  int v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DAB938]);

  if (v6)
  {
    v7 = objc_msgSend(v10, "code");
    v8 = gLogCategory_ENDaemon;
    if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithInteger:", objc_msgSend(v10, "code"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      goto LABEL_13;
    }
  }
  else
  {
    v8 = gLogCategory_ENDaemon;
  }
  if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
  {
    v9 = v10;
    LogPrintF_safe();
  }
LABEL_13:
  -[ENDaemon _deferConsentForPendingRegion](self, "_deferConsentForPendingRegion", v9);
  -[ENDaemon tearDownAlertHandle](self, "tearDownAlertHandle");

}

- (void)_deferConsentForPendingRegion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[ENDaemon _readPreferenceRegionPendingOnboarding](self, "_readPreferenceRegionPendingOnboarding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationForRegion:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "userConsent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "consent");

      if (!v7)
      {
        if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        objc_msgSend(v5, "userConsent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setConsent:", 3);

        -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v10 = objc_msgSend(v9, "saveRegionConfiguration:error:", v5, &v20);
        v11 = v20;

        if ((v10 & 1) != 0)
        {
          -[ENDaemon activeEntity](self, "activeEntity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "entity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "region");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v3, "isEqual:", v14);

          if (v15)
          {
            if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              LogPrintF_safe();
            -[ENDaemon _turnOffEN](self, "_turnOffEN");
          }
          -[ENDaemon userNotificationCenter](self, "userNotificationCenter");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = CFSTR("com.apple.ExposureNotification.onboarding");
          objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v21, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeDeliveredNotificationsWithIdentifiers:", v17);

          -[ENDaemon onboardingManager](self, "onboardingManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setShouldObserveDeviceUnlocks:", 0);

          -[ENDaemon onboardingManager](self, "onboardingManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setPendingBuddyOnboarding:", 0);

        }
        else if (gLogCategory__ENDaemon <= 90
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }

      }
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
}

- (void)_enApplicationDidInstall:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v10 = v4;
      LogPrintF_safe();
    }
    objc_msgSend(v11, "bundleURL", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D8], "bundleWithURL:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6
        && (objc_msgSend(v6, "infoDictionary"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
      {
        objc_msgSend(v7, "infoDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENDaemon fetchServerConfigurationForAppBundleIdentifier:infoDictionary:](self, "fetchServerConfigurationForAppBundleIdentifier:infoDictionary:", v4, v9);

      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ENDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__ENDaemon_applicationsDidInstall___block_invoke;
  v7[3] = &unk_1E87D9DD8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __35__ENDaemon_applicationsDidInstall___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "appState", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isPlaceholder");

        if ((v9 & 1) == 0)
        {
          objc_msgSend(v7, "entitlementValueForKey:ofClass:", CFSTR("com.apple.developer.exposure-notification"), objc_opt_class());
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "BOOLValueSafe");

          if (v11)
            objc_msgSend(*(id *)(a1 + 40), "_enApplicationDidInstall:", v7);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

- (void)_enApplicationDidUninstall:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v9 = v4;
      LogPrintF_safe();
    }
    -[ENActiveEntity entity](self->_activeEntity, "entity", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      -[ENActiveEntity entity](self->_activeEntity, "entity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

    if (objc_msgSend(v8, "length")
      && objc_msgSend(v4, "length")
      && objc_msgSend(v4, "isEqualToString:", v8))
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      -[ENDaemon updateExistingConsentForPhase1ActiveRegion:](self, "updateExistingConsentForPhase1ActiveRegion:", 0);
      -[ENDaemon _turnOffEN](self, "_turnOffEN");
      -[ENDaemon postENOffNotification](self, "postENOffNotification");
    }

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ENDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__ENDaemon_applicationsDidUninstall___block_invoke;
  v7[3] = &unk_1E87D9DD8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __37__ENDaemon_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(v7, "entitlementValueForKey:ofClass:", CFSTR("com.apple.developer.exposure-notification"), objc_opt_class(), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "BOOLValueSafe");

        if (v9)
          objc_msgSend(*(id *)(a1 + 40), "_enApplicationDidUninstall:", v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __42__ENDaemon__bluetoothMonitorEnsureStarted__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "bluetoothPowerStateChanged");

}

- (void)_bluetoothMonitorEnsureStopped
{
  id WeakRetained;

  if (self->_btMonitorStarted)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "stopPowerMonitoring");

    self->_btMonitorStarted = 0;
  }
}

- (void)bluetoothPowerStateChanged
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "isBluetoothPoweredOn");

  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  -[ENDaemon _scheduleUpdate](self, "_scheduleUpdate");
}

- (void)_bluetoothTracingEnsureStarted
{
  void *v3;
  __CFString *v4;
  NSString *WeakRetained;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  NSString *p_isa;

  -[ENActiveEntity entity](self->_activeEntity, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  WeakRetained = self->_btTracingAppID;
  if (v4)
    v6 = v4;
  else
    v6 = CFSTR("com.apple.ENDaemon");
  v7 = v6;

  v8 = v7;
  p_isa = &v8->isa;
  if (!WeakRetained)
  {
LABEL_13:
    WeakRetained = (NSString *)objc_loadWeakRetained((id *)&self->_delegate);
    -[ENActiveEntity entity](self->_activeEntity, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "region");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serverConfigurationForRegion:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      -[NSString setRegionServerConfiguration:](WeakRetained, "setRegionServerConfiguration:", v16);
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v17 = p_isa;
      LogPrintF_safe();
    }
    if (-[NSString startTracingWithAppBundleIdentifier:](WeakRetained, "startTracingWithAppBundleIdentifier:", p_isa, v17))
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
    }
    else
    {
      objc_storeStrong((id *)&self->_btTracingAppID, v6);
    }

    v12 = 0;
    goto LABEL_26;
  }
  v9 = v8;
  if (v9 == WeakRetained)
  {
    v12 = WeakRetained;
LABEL_26:

    WeakRetained = v12;
    goto LABEL_27;
  }
  v10 = v9;
  v11 = -[NSString isEqual:](v9, "isEqual:", WeakRetained);

  if ((v11 & 1) == 0)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v17 = WeakRetained;
      v18 = v10;
      LogPrintF_safe();
    }
    -[ENDaemon _bluetoothTracingStop](self, "_bluetoothTracingStop", v17, v18);

    goto LABEL_13;
  }
LABEL_27:

}

- (void)_bluetoothTracingStop
{
  id WeakRetained;
  int v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_msgSend(WeakRetained, "stopTracing");

  if (v3 && gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
}

- (id)regionForBundleInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("ENDeveloperRegion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)*MEMORY[0x1E0C9AE80];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE80]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[ENConfigurationManager staticRegionForBundleID:](ENConfigurationManager, "staticRegionForBundleID:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();

    if (!v4)
      goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CAA378], "regionWithCode:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_18:
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v7 = 0;
  }

  return v7;
}

- (void)fetchServerConfigurationForAppBundleIdentifier:(id)a3 infoDictionary:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v8 = v9;
    LogPrintF_safe();
  }
  -[ENDaemon regionForBundleInfo:](self, "regionForBundleInfo:", v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ENDaemon startServerConfigurationFetchForRegion:](self, "startServerConfigurationFetchForRegion:", v7);
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)startServerConfigurationFetchForRegion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__ENDaemon_startServerConfigurationFetchForRegion___block_invoke;
  v6[3] = &unk_1E87DA458;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ENDaemon fetchServerConfigurationForRegion:completion:](self, "fetchServerConfigurationForRegion:completion:", v5, v6);

}

void __51__ENDaemon_startServerConfigurationFetchForRegion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationForRegion:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v8 = *(_QWORD *)(a1 + 40);
      LogPrintF_safe();
      objc_msgSend(*(id *)(a1 + 32), "_exposureNotificationRegionConfigurationChanged:", v6, v8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_exposureNotificationRegionConfigurationChanged:", v6, v7);
    }
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)fetchServerConfigurationForRegion:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  ENConfigurationManager *configurationManager;
  _QWORD v13[5];
  id v14;
  void (**v15)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverConfigurationForRegion:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSensitiveLoggingAllowed");

    if (v11 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v9, "enVersion");
      objc_msgSend(v9, "enEnabled");
      LogPrintF_safe();
    }
    v7[2](v7, v9, 0);
  }
  else
  {
    configurationManager = self->_configurationManager;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__ENDaemon_fetchServerConfigurationForRegion_completion___block_invoke;
    v13[3] = &unk_1E87DA4A8;
    v13[4] = self;
    v14 = v6;
    v15 = v7;
    -[ENConfigurationManager fetchServerConfigurationsForRegion:userInitiated:withCompletion:](configurationManager, "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v14, 0, v13);

  }
}

void __57__ENDaemon_fetchServerConfigurationForRegion_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __57__ENDaemon_fetchServerConfigurationForRegion_completion___block_invoke_2;
  v9[3] = &unk_1E87DA480;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 224);
  v9[1] = 3221225472;
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 48);
  v8 = v4;
  dispatch_async(v7, v9);

}

void __57__ENDaemon_fetchServerConfigurationForRegion_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;

  v7 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "configurationStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverConfigurationForRegion:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSensitiveLoggingAllowed");

    if (v5 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v3, "enVersion");
      objc_msgSend(v3, "enEnabled");
LABEL_9:
      LogPrintF_safe();
    }
  }
  else if (*(_QWORD *)(a1 + 32))
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      goto LABEL_9;
  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    NSErrorF();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v6;
  }
  (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v3, v7);

}

- (void)configurationManager:(id)a3 exposureNotificationRegionConfigurationChanged:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__ENDaemon_configurationManager_exposureNotificationRegionConfigurationChanged___block_invoke;
  v8[3] = &unk_1E87D9DD8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

uint64_t __80__ENDaemon_configurationManager_exposureNotificationRegionConfigurationChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exposureNotificationRegionConfigurationChanged:", *(_QWORD *)(a1 + 40));
}

- (void)configurationManager:(id)a3 errorDetected:(unsigned int)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[5];
  unsigned int v6;

  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__ENDaemon_configurationManager_errorDetected___block_invoke;
  v5[3] = &unk_1E87DA4D0;
  v5[4] = self;
  v6 = a4;
  dispatch_async(dispatchQueue, v5);
}

void __47__ENDaemon_configurationManager_errorDetected___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  objc_msgSend(WeakRetained, "sendErrorMetricWithType:", *(unsigned int *)(a1 + 40));

}

- (void)_exposureNotificationRegionConfigurationChanged:(id)a3
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  int v17;
  const char *v18;
  ENActiveEntity *v19;
  id v20;
  void *v21;
  void *v22;
  ENActiveEntity *v23;
  const char *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  int v37;
  ENRegionMonitor *regionMonitor;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  char v49;
  id v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  char v73;
  int v74;
  int v75;
  const char *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  char *v94;
  id v95;
  id v96;
  _QWORD v97[6];

  v5 = a3;
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = __60__ENDaemon__exposureNotificationRegionConfigurationChanged___block_invoke;
  v97[3] = &unk_1E87D9C28;
  v97[4] = self;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v97);
  -[ENDaemon activeEntity](self, "activeEntity");
  v94 = (char *)objc_claimAutoreleasedReturnValue();
  -[ENDaemon configurationManager](self, "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverConfigurationForRegion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = v10;
  v11 = objc_msgSend(v10, "enEnabled");
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    NSStringFromSelector(a2);
    v82 = v11;
    v83 = v5;
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v94;
    LogPrintF_safe();

  }
  if ((v11 & 1) != 0)
  {
    objc_msgSend(v5, "region");
    v92 = objc_claimAutoreleasedReturnValue();
    -[ENDaemon _updatePhase1ConfigurationIfNeeded:](self, "_updatePhase1ConfigurationIfNeeded:", v5);
    if (objc_msgSend(v5, "enVersion") != 2)
    {
LABEL_108:
      v23 = (ENActiveEntity *)v92;
      goto LABEL_109;
    }
    objc_msgSend(v5, "userConsent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "consent");

    objc_msgSend(v5, "userConsent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "differentialPrivacyConsent");

    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isSensitiveLoggingAllowed");

    if (v17 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      if (v13 > 4)
        v18 = "?";
      else
        v18 = off_1E87DADC8[v13];
      if (v15 > 4)
        v24 = "?";
      else
        v24 = off_1E87DADC8[v15];
      v79 = (void *)v18;
      v81 = v24;
      LogPrintF_safe();
    }
    if (v13 == 2)
    {
      v25 = (void *)MEMORY[0x1E0C99D60];
      objc_msgSend(v5, "creationDateTimeInterval");
      objc_msgSend(v25, "dateWithTimeIntervalSince1970:");
      v89 = (id)objc_claimAutoreleasedReturnValue();
      CFPrefs_GetDouble();
      if (v26 <= 0.0)
        v27 = 2592000.0;
      else
        v27 = v26;
      objc_msgSend(v5, "userConsent", v79, v81, v82, v83);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "differentialPrivacyConsent");

      if (objc_msgSend(v93, "telemetryAuthorization"))
      {
        objc_msgSend(v94, "entity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "region");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqual:", v92);

        if ((v32 & 1) == 0)
          goto LABEL_107;
        objc_msgSend(MEMORY[0x1E0C99D60], "date");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "timeIntervalSinceDate:", v89);
        v35 = v34;

        if (v35 <= v27 || (v29 & 0xFFFFFFFFFFFFFFFBLL) != 0)
          goto LABEL_107;
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isSensitiveLoggingAllowed");

        if (v37
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        objc_msgSend(v5, "userConsent");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setDifferentialPrivacyConsent:", 3);

        if (objc_msgSend(v8, "saveRegionConfiguration:error:", v5, 0))
          -[ENDaemon postAnalyticsOptInNotificationForRegion:](self, "postAnalyticsOptInNotificationForRegion:", v92);
      }
      else
      {
        objc_msgSend(v5, "userConsent");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setDifferentialPrivacyConsent:", 4);

        v96 = 0;
        v49 = objc_msgSend(v8, "saveRegionConfiguration:error:", v5, &v96);
        v50 = v96;
        if ((v49 & 1) == 0
          && gLogCategory__ENDaemon <= 90
          && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }

      }
      if (!v94)
      {
LABEL_107:

        goto LABEL_108;
      }
      objc_msgSend(v94, "entity");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "region");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "agencyConfigurationForRegion:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v57, "agencyColor");
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v57, "agencyHeaderStyle");
      objc_msgSend(v57, "agencyHeaderTextColor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "agencyDisplayName");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "agencyImageURL");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = v57;
      objc_msgSend(v57, "localizedConfiguration");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "regionName");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = (void *)v58;

      objc_msgSend(v57, "localizedConfiguration");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "agencyTurndownMessage");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = objc_alloc(MEMORY[0x1E0CAA2F8]);
      objc_msgSend(v94, "entity");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "bundleIdentifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInteger:", v59);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "entity");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "region");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)objc_msgSend(v62, "initWithBundleID:agencyColor:agencyHeaderStyle:agencyHeaderTextColor:localizedAgencyName:localizedAgencyImageURL:localizedAgencyTurndownMessage:localizedRegionName:region:", v64, v85, v65, v90, v88, v87, v84, v86, v67);

      objc_msgSend(v94, "entity");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v68;
      v71 = v69;
      if (v70 == v71)
      {

      }
      else
      {
        v72 = v71;
        if ((v70 == 0) != (v71 != 0))
        {
          v73 = objc_msgSend(v70, "isEqual:", v71);

          if ((v73 & 1) != 0)
            goto LABEL_67;
        }
        else
        {

        }
        -[ENActiveEntity setEntity:](self->_activeEntity, "setEntity:", v70);
        -[ENDaemon _writePreferenceActiveEntity:](self, "_writePreferenceActiveEntity:", self->_activeEntity);
      }
LABEL_67:

      v41 = v85;
LABEL_68:

      goto LABEL_104;
    }
    regionMonitor = self->_regionMonitor;
    v95 = 0;
    -[ENRegionMonitor getCurrentRegionVisitWithError:](regionMonitor, "getCurrentRegionVisitWithError:", &v95);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v95;
    objc_msgSend(v39, "region");
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    if (v91)
    {
      if ((objc_msgSend(v91, "isEqual:", v92) & 1) != 0)
      {
        objc_msgSend(v8, "serverConfigurationForRegion:", v92);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "appBundleID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41 && objc_msgSend(v41, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CA5858], "applicationProxyForIdentifier:placeholder:", v41, 0);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "appState");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v42, "isInstalled"))
          {

            goto LABEL_38;
          }
          objc_msgSend(v90, "appState");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "isPlaceholder");

          if (v44)
          {
LABEL_38:
            if (gLogCategory__ENDaemon <= 90
              && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
            goto LABEL_104;
          }
          if (-[ENActiveEntity activeStatus](self->_activeEntity, "activeStatus") == 2)
          {
            -[ENActiveEntity entity](self->_activeEntity, "entity");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "region");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v91, "isEqual:", v52);

            if (v53)
            {
              if (gLogCategory__ENDaemon > 90
                || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
              {
                goto LABEL_104;
              }
              -[ENActiveEntity entity](self->_activeEntity, "entity", v79, v81, v82, v83);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "bundleIdentifier");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF_safe();
              goto LABEL_68;
            }
          }

        }
        else if (-[ENActiveEntity activeStatus](self->_activeEntity, "activeStatus", v79, v81, v82, v83) >= 1
               && -[ENActiveEntity activeStatus](self->_activeEntity, "activeStatus") <= 2)
        {
          -[ENActiveEntity entity](self->_activeEntity, "entity");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "region");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "isEqual:", v91);

          if (v47)
          {
            -[ENDaemon updateExistingConsentForPhase1ActiveRegion:](self, "updateExistingConsentForPhase1ActiveRegion:", 0);
            CFPrefs_RemoveValue();
            self->_availabilityAlertDisabled = 0;
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              LogPrintF_safe();
            v13 = 0;
          }
        }
        if (self->_availabilityAlertDisabled)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          goto LABEL_105;
        }
        -[ENDaemon _readPreferenceRegionPendingOnboarding](self, "_readPreferenceRegionPendingOnboarding");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v90, "isEqual:", v92);
        if (v13 == 1)
          v75 = 1;
        else
          v75 = v74;
        if (v75 == 1)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            if (v13 > 4)
              v76 = "?";
            else
              v76 = off_1E87DADF0[v13];
            v81 = v76;
            v79 = (void *)v92;
            LogPrintF_safe();
          }
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v79, v81);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v77, "isSensitiveLoggingAllowed");

          if (v78
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            v80 = v91;
            LogPrintF_safe();
          }
          -[ENDaemon _writePreferenceRegionPendingOnboarding:](self, "_writePreferenceRegionPendingOnboarding:", v91, v80);
          -[ENDaemon onboardingTriggerRetry:](self, "onboardingTriggerRetry:", 0);
        }
        else if (v13 == 3)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
            -[ENDaemon _writePreferenceRegionPendingOnboarding:](self, "_writePreferenceRegionPendingOnboarding:", v91, v92);
          }
          else
          {
            -[ENDaemon _writePreferenceRegionPendingOnboarding:](self, "_writePreferenceRegionPendingOnboarding:", v91, v79);
          }
        }
        else if (!v13)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            v79 = (void *)v92;
            LogPrintF_safe();
          }
          -[ENDaemon startAvailabilityAlertCycleWithBuddy:](self, "startAvailabilityAlertCycleWithBuddy:", 1, v79);
        }
LABEL_104:

LABEL_105:
LABEL_106:

        goto LABEL_107;
      }
      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
        goto LABEL_106;
    }
    else if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_106;
    }
    LogPrintF_safe();
    goto LABEL_106;
  }
  v19 = [ENActiveEntity alloc];
  v20 = objc_alloc(MEMORY[0x1E0CAA2F8]);
  objc_msgSend(v5, "region");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithBundleID:region:", 0, v21);
  v23 = -[ENActiveEntity initWithEntity:activeStatus:](v19, "initWithEntity:activeStatus:", v22, 1);

  -[ENDaemon _writePreferenceActiveEntity:](self, "_writePreferenceActiveEntity:", v23);
LABEL_109:

  v6[2](v6);
}

uint64_t __60__ENDaemon__exposureNotificationRegionConfigurationChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prefsChanged");
}

- (void)_updatePhase1ConfigurationIfNeeded:(id)a3
{
  ENActiveEntity *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  int v27;
  ENActiveEntity *v28;
  void *v29;
  ENActiveEntity *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;

  v5 = self->_activeEntity;
  v6 = a3;
  -[ENDaemon configurationManager](self, "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverConfigurationForRegion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v6, "enVersion");
  if ((v12 == 1 || -[ENActiveEntity activeStatus](v5, "activeStatus") == 2) && objc_msgSend(v11, "length"))
  {
    -[ENActiveEntity entity](self->_activeEntity, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v14, "length") || !objc_msgSend(v14, "isEqualToString:", v11))
      goto LABEL_27;
    -[ENActiveEntity entity](self->_activeEntity, "entity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "region");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqual:", v9) & 1) != 0)
    {
      v17 = -[ENActiveEntity activeStatus](self->_activeEntity, "activeStatus");

      if (v17 != 1)
        goto LABEL_27;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CA5858], "applicationProxyForIdentifier:placeholder:", v11, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      goto LABEL_27;
    }
    v19 = v18;
    objc_msgSend(v18, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (-[ENDaemon tccAccessForBundleID:](self, "tccAccessForBundleID:", v20) == 1)
      {
        -[ENDaemon _getInfoDictFromAppProxy:](self, "_getInfoDictFromAppProxy:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          CFStringGetTypeID();
          CFDictionaryGetTypedValue();
          v34 = v20;
          if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            -[ENActiveEntity entity](self->_activeEntity, "entity");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "region");
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v23;
            v25 = CFSTR("<>");
            if (v23)
              v25 = (const __CFString *)v23;
            v32 = v9;
            v33 = v25;
            v31 = v14;
            LogPrintF_safe();

          }
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v31, v32, v33);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isSensitiveLoggingAllowed");

          if (v27
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          v28 = [ENActiveEntity alloc];
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA2F8]), "initWithBundleID:region:", v11, v9);
          v30 = -[ENActiveEntity initWithEntity:activeStatus:](v28, "initWithEntity:activeStatus:", v29, 2);

          -[ENDaemon _writePreferenceActiveEntity:](self, "_writePreferenceActiveEntity:", v30);
          goto LABEL_26;
        }
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();

LABEL_49:
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
        goto LABEL_49;
    }
    else if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_49;
    }
    LogPrintF_safe();
    goto LABEL_49;
  }
LABEL_28:

}

- (int64_t)tccAccessForBundleID:(id)a3
{
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const void **v8;
  CFTypeRef *v9;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  int64_t v12;
  const __CFBoolean *v13;

  v3 = (const __CFArray *)TCCAccessCopyInformationForBundleId();
  if (!v3)
    return 0;
  v4 = v3;
  Count = CFArrayGetCount(v3);
  if (Count < 1)
    goto LABEL_12;
  v6 = Count;
  v7 = 0;
  v8 = (const void **)MEMORY[0x1E0DB10C0];
  v9 = (CFTypeRef *)MEMORY[0x1E0DB1110];
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v7);
    Value = CFDictionaryGetValue(ValueAtIndex, *v8);
    if (CFEqual(Value, *v9))
      break;
    if (v6 == ++v7)
      goto LABEL_12;
  }
  v13 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E0DB10B0]);
  if (v13)
  {
    if (CFBooleanGetValue(v13))
      v12 = 1;
    else
      v12 = 2;
  }
  else
  {
LABEL_12:
    v12 = 0;
  }
  CFRelease(v4);
  return v12;
}

- (void)configurationManager:(id)a3 exposureNotificationRegionConfigurationRemovedForRegion:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__ENDaemon_configurationManager_exposureNotificationRegionConfigurationRemovedForRegion___block_invoke;
  v8[3] = &unk_1E87D9DD8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

uint64_t __89__ENDaemon_configurationManager_exposureNotificationRegionConfigurationRemovedForRegion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exposureNotificationRegionConfigurationRemoved:", *(_QWORD *)(a1 + 40));
}

- (void)_exposureNotificationRegionConfigurationRemoved:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t overallStatus;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  int v35;
  uint64_t v36;
  ENActiveEntity *activeEntity;
  const char *v38;
  void *v39;
  id v40;
  const char *v41;
  const char *v42;
  const char *v43;
  int v44;
  int v45;
  id v46;

  v46 = a3;
  -[ENDaemon activeEntity](self, "activeEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ENDaemon configurationManager](self, "configurationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    overallStatus = self->_overallStatus;
    objc_msgSend(v5, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "region");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v46);

    objc_msgSend(v7, "configurationForRegion:", v46);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = overallStatus != 4 && v12 == 0;
    if (v14)
      v15 = v11;
    else
      v15 = 0;
    v45 = v15;
    objc_msgSend(v5, "entity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      v44 = v11;
      v19 = a2;
      v20 = v7;
      objc_msgSend(v5, "entity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CA5858], "applicationProxyForIdentifier:placeholder:", v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "entitlementValueForKey:ofClass:", CFSTR("com.apple.developer.exposure-notification-test"), objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "BOOLValueSafe");

      v14 = overallStatus == 4;
      v26 = overallStatus == 4;
      if (v14 && v13)
      {
        objc_msgSend(v13, "userConsent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v27, "consent") == 2;

      }
      v7 = v20;
      a2 = v19;
      v11 = v44;
    }
    else
    {
      if (!v13)
      {
        v25 = 0;
        v26 = v11;
        goto LABEL_19;
      }
      objc_msgSend(v13, "userConsent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      if (objc_msgSend(v22, "consent") == 2)
        v26 = v11;
      else
        v26 = 0;
    }

LABEL_19:
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      NSStringFromSelector(a2);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      v30 = self->_overallStatus;
      if (v30 > 6)
        v31 = "?";
      else
        v31 = off_1E87DAE18[v30];
      v32 = "no";
      if (v26)
        v33 = "yes";
      else
        v33 = "no";
      if (v45)
        v34 = "yes";
      else
        v34 = "no";
      if (v25)
        v32 = "yes";
      v38 = v31;
      v39 = v13;
      v36 = v28;
      activeEntity = self->_activeEntity;
      v42 = v34;
      v43 = v32;
      v40 = v46;
      v41 = v33;
      LogPrintF_safe();

      if (v26)
        goto LABEL_25;
    }
    else if (v26)
    {
LABEL_25:
      -[ENDaemon updateExistingConsentForPhase1ActiveRegion:](self, "updateExistingConsentForPhase1ActiveRegion:", 0, v36, activeEntity, v38, v39, v40, v41, v42, v43);
      -[ENDaemon _turnOffEN](self, "_turnOffEN");
LABEL_26:
      -[ENDaemon postENOffNotification](self, "postENOffNotification", v36);
LABEL_27:

      goto LABEL_28;
    }
    if (((v45 ^ 1 | v25) & 1) != 0)
      goto LABEL_27;
    if (((v11 ^ 1) & 1) != 0)
      goto LABEL_27;
    CFPrefs_RemoveValue();
    v35 = objc_msgSend(v5, "activeStatus");
    objc_msgSend(v5, "setActiveStatus:", 1);
    -[ENDaemon _writePreferenceActiveEntity:](self, "_writePreferenceActiveEntity:", v5);
    -[ENDaemon prefsChanged](self, "prefsChanged");
    if (v35 < 2)
      goto LABEL_27;
    goto LABEL_26;
  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_28:

}

- (void)configurationManager:(id)a3 didResolveCurrentRegion:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v7 = v6;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    -[ENDaemon onboardingTriggerRetry:](self, "onboardingTriggerRetry:", 0);
    v6 = v7;
  }

}

- (void)_configurationManagerEnsureStopped
{
  ENConfigurationManager *configurationManager;

  if (self->_configurationManager)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    configurationManager = self->_configurationManager;
    self->_configurationManager = 0;

  }
}

- (void)_databasesEnsureOpened
{
  void *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v7 = 0;
  -[ENDaemon getExposureDatabaseAndReturnError:](self, "getExposureDatabaseAndReturnError:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (!v3 && gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  if (-[CUSystemMonitor systemLockState](self->_systemMonitor, "systemLockState", v6) != 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "switchToCentralAdvertisementStoreAsync");

  }
}

- (id)getExposureDatabaseAndReturnError:(id *)a3
{
  ENExposureDatabase *exposureDatabase;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  ENExposureDatabase *v10;
  void *v11;
  ENExposureDatabase *v12;
  ENExposureDatabase *v13;
  ENExposureDatabase *v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v19;
  id v20;
  _QWORD v21[5];

  exposureDatabase = self->_exposureDatabase;
  if (!exposureDatabase)
  {
    CFStringGetTypeID();
    v6 = (void *)CFPrefs_CopyTypedValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      ENDataVaultPath();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("Exposure"));
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = [ENExposureDatabase alloc];
    objc_msgSend(MEMORY[0x1E0C99E90], "fileURLWithPath:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ENExposureDatabase initWithDirectoryURL:](v10, "initWithDirectoryURL:", v11);
    v13 = self->_exposureDatabase;
    self->_exposureDatabase = v12;

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __46__ENDaemon_getExposureDatabaseAndReturnError___block_invoke;
    v21[3] = &unk_1E87DA4F8;
    v21[4] = self;
    -[ENExposureDatabase setErrorMetricReporter:](self->_exposureDatabase, "setErrorMetricReporter:", v21);

    exposureDatabase = self->_exposureDatabase;
  }
  if (-[ENExposureDatabase isOpen](exposureDatabase, "isOpen"))
    return self->_exposureDatabase;
  v14 = self->_exposureDatabase;
  v20 = 0;
  v15 = -[ENExposureDatabase openWithError:](v14, "openWithError:", &v20);
  v16 = v20;
  v17 = v16;
  if (v15)
  {

    return self->_exposureDatabase;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  if (a3)
    *a3 = objc_retainAutorelease(v17);

  return 0;
}

void __46__ENDaemon_getExposureDatabaseAndReturnError___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  objc_msgSend(WeakRetained, "sendErrorMetricWithType:", a2);

}

- (void)_periodicPersistencePurge
{
  double v3;
  double v4;
  int v5;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  ENRegionMonitor *regionMonitor;
  BOOL v18;
  id v19;
  ENActiveEntity *activeEntity;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;

  if (self->_persistencePurgeScheduler)
  {
    -[ENDaemon _databasesEnsureOpened](self, "_databasesEnsureOpened");
    CFPrefs_GetDouble();
    v4 = v3;
    v5 = IsAppleInternalBuild();
    if (v4 <= 0.0 || v5 == 0)
      v4 = 1209600.0;
    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", -v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFPrefs_GetDouble();
    v10 = v9;
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      -[NSBackgroundActivityScheduler identifier](self->_persistencePurgeScheduler, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v8;
      LogPrintF_safe();

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "performPeriodicAdvertisementDatabasePurgeWithDate:", v8);

    v29 = 0;
    -[ENDaemon getExposureDatabaseAndReturnError:](self, "getExposureDatabaseAndReturnError:", &v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v29;
    v14 = v13;
    if (!v12
      || (v28 = v13,
          v15 = objc_msgSend(v12, "purgeRecordsWithInterval:nowDate:error:", v7, &v28, v4),
          v16 = v28,
          v14,
          v14 = v16,
          (v15 & 1) == 0))
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
    }
    regionMonitor = self->_regionMonitor;
    v27 = v14;
    v18 = -[ENRegionMonitor purgeRegionsOlderThanDate:error:](regionMonitor, "purgeRegionsOlderThanDate:error:", v8, &v27, v24, v26);
    v19 = v27;

    if (!v18
      && gLogCategory__ENDaemon <= 90
      && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    -[ENDownloadManager purgeExpiredDownloadsWithDate:](self->_downloadManager, "purgeExpiredDownloadsWithDate:", v8, v25);
    -[ENTextMessageManager purgeOldHashes](self->_textMessageManager, "purgeOldHashes");
    activeEntity = self->_activeEntity;
    if ((!activeEntity || -[ENActiveEntity activeStatus](activeEntity, "activeStatus") == 1) && v10 > 0.0)
    {
      objc_msgSend(v7, "timeIntervalSince1970");
      if (v21 - v10 > v4)
      {
        if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        CFDataGetTypeID();
        v22 = (void *)CFPrefs_CopyTypedValue();
        if (v22)
          v23 = 3839;
        else
          v23 = 4095;
        -[ENDaemon _resetDataWithFlags:](self, "_resetDataWithFlags:", v23);

      }
    }
    -[ENDaemon _scheduleUpdate](self, "_scheduleUpdate");

  }
}

void __45__ENDaemon__schedulePeriodicPersistencePurge__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v2;
  void (**v3)(id, uint64_t);
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ENDaemon__schedulePeriodicPersistencePurge__block_invoke_2;
  block[3] = &unk_1E87D9C28;
  v2 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v3 = a2;
  dispatch_sync(v2, block);
  v3[2](v3, 1);

}

uint64_t __45__ENDaemon__schedulePeriodicPersistencePurge__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_periodicPersistencePurge");
}

- (id)advertisementDatabaseQuerySessionWithAttenuationThreshold:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v16;

  v5 = a3;
  -[ENDaemon _getDelegateAndReturnError:](self, "_getDelegateAndReturnError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v8 = 0;
    goto LABEL_11;
  }
  v16 = 0;
  objc_msgSend(v6, "createAdvertisementQuerySessionWithThreshold:error:", v5, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  v10 = v9;
  if (a4 && !v8)
  {
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ENAdvertisementStoreErrorDomain")) & 1) != 0)
    {
      v12 = objc_msgSend(v10, "code");

      if (v12 == 6)
      {
        ENErrorF();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v14 = objc_retainAutorelease(v13);
        *a4 = v14;

        goto LABEL_10;
      }
    }
    else
    {

    }
    ENNestedErrorF();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:

LABEL_11:
  return v8;
}

- (void)_differentialPrivacyEnsureStarted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ENDifferentialPrivacyManager *differentialPrivacyManager;
  ENDifferentialPrivacyManager *v10;
  ENDifferentialPrivacyManager *v11;
  int v12;
  uint64_t v13;

  -[ENActiveEntity entity](self->_activeEntity, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "region");
  v13 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v13;
  if (v13)
  {
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverConfigurationForRegion:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serverExposureConfigurationForRegion:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        differentialPrivacyManager = self->_differentialPrivacyManager;
        if (differentialPrivacyManager)
        {
          -[ENDifferentialPrivacyManager updatedServerConfiguration:serverExposureConfiguration:](differentialPrivacyManager, "updatedServerConfiguration:serverExposureConfiguration:", v6, v8);
        }
        else
        {
          if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          v10 = -[ENDifferentialPrivacyManager initWithServerConfiguration:serverExposureConfiguration:]([ENDifferentialPrivacyManager alloc], "initWithServerConfiguration:serverExposureConfiguration:", v6, v8);
          v11 = self->_differentialPrivacyManager;
          self->_differentialPrivacyManager = v10;

        }
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    goto LABEL_13;
  }
  if (gLogCategory__ENDaemon <= 90)
  {
    if (gLogCategory__ENDaemon != -1 || (v12 = _LogCategory_Initialize(), v4 = 0, v12))
    {
      LogPrintF_safe();
LABEL_13:
      v4 = (void *)v13;
    }
  }

}

- (unsigned)_getLatestExposureForDifferentialPrivacy
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  unsigned __int8 v16;
  id v18;
  id v19;
  id v20;
  id v21;

  v21 = 0;
  -[ENDaemon getExposureDatabaseAndReturnError:](self, "getExposureDatabaseAndReturnError:", &v21);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v21;
  v4 = v3;
  if (v2)
  {
    v20 = 0;
    v19 = v3;
    v5 = objc_msgSend(v2, "getValue:forKey:ofClass:error:", &v20, CFSTR("LastExposureNotification"), objc_opt_class(), &v19);
    v6 = v20;
    v7 = v19;

    if ((v5 & 1) != 0)
    {
      if (v6)
      {
        objc_msgSend(v6, "classification");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "index");

        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isSensitiveLoggingAllowed");

        if (v11
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        v16 = v9 + 1;
      }
      else
      {
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isSensitiveLoggingAllowed");

        if (v13
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        v6 = 0;
        v16 = 1;
      }
      goto LABEL_27;
    }
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v18 = v7;
      LogPrintF_safe();
    }
  }
  else
  {
    v6 = 0;
    v7 = v3;
  }
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isSensitiveLoggingAllowed");

  if (v15 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v16 = 0;
LABEL_27:

  return v16;
}

- (id)_getDiagnosedVaccineStatusForDifferentialPrivacyWithUserVaccinationStatus:(id)a3
{
  int v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE *v17;
  uint64_t v18;
  void *v19;
  id v21;
  id v22;
  id v23;
  id v24;

  v5 = objc_msgSend(a3, "BOOLValue");
  v24 = 0;
  -[ENDaemon getExposureDatabaseAndReturnError:](self, "getExposureDatabaseAndReturnError:", &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v24;
  v8 = v7;
  if (v6)
  {
    v23 = 0;
    v22 = v7;
    v9 = objc_msgSend(v6, "getValue:forKey:ofClass:error:", &v23, CFSTR("LastExposureNotification"), objc_opt_class(), &v22);
    v10 = v23;
    v11 = v22;

    if ((v9 & 1) == 0
      && gLogCategory__ENDaemon <= 90
      && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v21 = v11;
      LogPrintF_safe();
    }
    if (v10)
    {
      objc_msgSend(v10, "classification");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ENDefaultExpirationDate();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D60], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v16, "compare:", v15) == -1;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
    v11 = v7;
  }
  v17 = malloc_type_calloc(0xFuLL, 1uLL, 0x100004077774924uLL);
  if (v17)
  {
    *v17 = 1;
    if (a3)
    {
      if (v5)
      {
        v17[1] = 1;
        if (v12)
        {
          v17[6] = 1;
          v18 = 7;
        }
        else
        {
          v17[3] = 1;
          v18 = 4;
        }
      }
      else
      {
        v17[2] = 1;
        if (v12)
        {
          v17[6] = 1;
          v18 = 8;
        }
        else
        {
          v17[3] = 1;
          v18 = 5;
        }
      }
    }
    else
    {
      v18 = 3;
      if (v12)
        v18 = 6;
    }
    v17[v18] = 1;
    objc_msgSend(MEMORY[0x1E0C99D58], "dataWithBytesNoCopy:length:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v19 = 0;
  }

  return v19;
}

- (unsigned)stateMetricVersion
{
  ENActiveEntity *v3;
  _BOOL4 prefEnabled;
  _BOOL4 prefServerForceDisable;
  const char *v6;
  const char *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int Int64Ranged;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *j;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  ENActiveEntity *v45;
  const char *v46;
  const char *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = self->_activeEntity;
  prefEnabled = self->_prefEnabled;
  prefServerForceDisable = self->_prefServerForceDisable;
  if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v6 = "no";
    if (prefEnabled)
      v7 = "yes";
    else
      v7 = "no";
    if (prefServerForceDisable)
      v6 = "yes";
    v46 = v7;
    v47 = v6;
    v45 = v3;
    LogPrintF_safe();
  }
  if (prefServerForceDisable)
  {
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allRegionServerConfigurations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v53;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v53 != v13)
              objc_enumerationMutation(v10);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "enEnabled", v45, v46, v47) & 1) == 0)
            {
              if (gLogCategory_ENDaemon <= 50
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }

              goto LABEL_28;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
          if (v12)
            continue;
          break;
        }
      }

      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
        goto LABEL_68;
    }
    else if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_68;
    }
    LogPrintF_safe();
LABEL_68:

    v32 = 6;
    goto LABEL_78;
  }
LABEL_28:
  if (!prefEnabled || prefServerForceDisable || !v3)
  {
    -[ENRegionMonitor getCurrentRegionVisitWithError:](self->_regionMonitor, "getCurrentRegionVisitWithError:", 0, v45, v46);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "region");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "configurationForRegion:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "userConsent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "consent");

      if (v30)
      {
        objc_msgSend(v28, "userConsent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
          goto LABEL_59;
        goto LABEL_48;
      }

    }
LABEL_48:
    v33 = (void *)MEMORY[0x1D17A7CB8]();
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "allRegionConfigurations");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v36 = v35;
    v31 = (void *)objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v31)
    {
      v37 = *(_QWORD *)v49;
      while (2)
      {
        for (j = 0; j != v31; j = (char *)j + 1)
        {
          if (*(_QWORD *)v49 != v37)
            objc_enumerationMutation(v36);
          v39 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v39, "userConsent");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "consent");

          if (v41)
          {
            objc_msgSend(v39, "userConsent");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_58;
          }
        }
        v31 = (void *)objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v31)
          continue;
        break;
      }
    }
LABEL_58:

    objc_autoreleasePoolPop(v33);
    if (!v31)
      goto LABEL_66;
LABEL_59:
    v42 = objc_msgSend(v31, "consent");
    if (v42 == 3)
      v43 = 7;
    else
      v43 = 1;
    if (v42 == 1)
      v32 = 8;
    else
      v32 = v43;

    goto LABEL_78;
  }
  v15 = -[ENActiveEntity activeStatus](v3, "activeStatus");
  if (v15 == 3)
  {
    v32 = 4;
    goto LABEL_78;
  }
  if (v15 != 2)
  {
LABEL_66:
    v32 = 1;
    goto LABEL_78;
  }
  -[ENActiveEntity entity](v3, "entity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CA5858], "applicationProxyForIdentifier:placeholder:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "bundleURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB34D8], "bundleWithURL:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          objc_msgSend(v21, "infoDictionary");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            Int64Ranged = CFDictionaryGetInt64Ranged();
            if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              LogPrintF_safe();
            if (Int64Ranged < 2)
              v32 = 2;
            else
              v32 = 3;
          }
          else
          {
            if (gLogCategory__ENDaemon <= 90
              && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
            v32 = 0;
          }

        }
        else
        {
          if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          v32 = 0;
        }

      }
      else
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        v32 = 0;
      }

    }
    else
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      v32 = 0;
    }

  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v32 = 0;
  }

LABEL_78:
  return v32;
}

- (void)_exposureManagersEnsureStarted
{
  _BOOL8 v3;
  ENDownloadManager *v4;
  ENDownloadManager *downloadManager;
  void *v6;
  id v7;
  void *v8;
  ENDownloadManager *v9;
  ENExposureDatabase *v10;
  ENExposureDatabase *v11;
  ENExposureDetectionManager *exposureDetectionManager;
  ENExposureDetectionManager *v13;
  ENExposureDetectionManager *v14;
  ENTestResultManager *v15;
  ENTestResultManager *testResultManager;
  void *v17;
  void *v18;
  ENTextMessageManager *textMessageManager;
  void *v20;
  void *v21;
  void *v22;
  ENTextMessageManager *v23;
  ENTextMessageManager *v24;
  void *v25;
  id v26;
  _QWORD v27[5];

  v3 = -[ENDaemon _isNKDActive](self, "_isNKDActive");
  if (!self->_downloadManager)
  {
    v4 = -[ENDownloadManager initWithQueue:]([ENDownloadManager alloc], "initWithQueue:", self->_dispatchDownloadManagingQueue);
    downloadManager = self->_downloadManager;
    self->_downloadManager = v4;

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __42__ENDaemon__exposureManagersEnsureStarted__block_invoke;
    v27[3] = &unk_1E87DA4F8;
    v27[4] = self;
    -[ENDownloadManager setErrorMetricReporter:](self->_downloadManager, "setErrorMetricReporter:", v27);
    -[ENDownloadManager activate](self->_downloadManager, "activate");
  }
  v26 = 0;
  -[ENDaemon _getDownloadEndpointsAndReturnError:](self, "_getDownloadEndpointsAndReturnError:", &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  if (v6)
  {
    -[ENDownloadManager setDownloadEndpoints:](self->_downloadManager, "setDownloadEndpoints:", v6);
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  -[ENDownloadManager update](self->_downloadManager, "update", v25);
  -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_downloadManager;
  v10 = self->_exposureDatabase;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    exposureDetectionManager = self->_exposureDetectionManager;
    if (!exposureDetectionManager)
    {
      v13 = -[ENExposureDetectionManager initWithConfigurationStore:downloadManager:exposureDatabase:queue:]([ENExposureDetectionManager alloc], "initWithConfigurationStore:downloadManager:exposureDatabase:queue:", v8, v9, v11, self->_dispatchExposureDetectionManagingQueue);
      v14 = self->_exposureDetectionManager;
      self->_exposureDetectionManager = v13;

      -[ENExposureDetectionManager setDelegate:](self->_exposureDetectionManager, "setDelegate:", self);
      -[ENExposureDetectionManager activate](self->_exposureDetectionManager, "activate");
      exposureDetectionManager = self->_exposureDetectionManager;
    }
    -[ENExposureDetectionManager setEnableNativeExposureDetection:](exposureDetectionManager, "setEnableNativeExposureDetection:", v3);
    -[ENExposureDetectionManager scheduleNativeExposureDetectionForced:](self->_exposureDetectionManager, "scheduleNativeExposureDetectionForced:", 0);
    if (!self->_testResultManager)
    {
      v15 = -[ENTestResultManager initWithConfigurationStore:exposureDatabase:temporaryExposureKeyManager:queue:]([ENTestResultManager alloc], "initWithConfigurationStore:exposureDatabase:temporaryExposureKeyManager:queue:", v8, v11, self->_temporaryExposureKeyManager, self->_dispatchTestResultManagingQueue);
      testResultManager = self->_testResultManager;
      self->_testResultManager = v15;

      -[ENTestResultManager setDelegate:](self->_testResultManager, "setDelegate:", self);
    }
    -[ENActiveEntity entity](self->_activeEntity, "entity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "region");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && -[ENDaemon _isNKDActive](self, "_isNKDActive"))
      -[ENTestResultManager activateAutomatedChaffingWithRegion:](self->_testResultManager, "activateAutomatedChaffingWithRegion:", v18);
    else
      -[ENTestResultManager deactivateAutomatedChaffing](self->_testResultManager, "deactivateAutomatedChaffing");
    textMessageManager = self->_textMessageManager;
    if (!textMessageManager)
    {
      ENDataVaultPath();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("VerificationHash"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E90], "fileURLWithPath:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[ENTextMessageManager initWithDirectoryURL:]([ENTextMessageManager alloc], "initWithDirectoryURL:", v22);
      v24 = self->_textMessageManager;
      self->_textMessageManager = v23;

      -[ENTextMessageManager setDelegate:](self->_textMessageManager, "setDelegate:", self);
      textMessageManager = self->_textMessageManager;
    }
    -[ENTextMessageManager activateIfNeeded](textMessageManager, "activateIfNeeded");
    -[ENDaemon enqueuePreauthorizedTestVerificationUnlockAction](self, "enqueuePreauthorizedTestVerificationUnlockAction");

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

void __42__ENDaemon__exposureManagersEnsureStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  objc_msgSend(WeakRetained, "sendErrorMetricWithType:", a2);

}

- (id)_getDownloadEndpointsAndReturnError:(id *)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  const __CFString *v9;
  const char *v10;
  _BOOL4 v11;
  ENRegionMonitor *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  ENRegionMonitor *regionMonitor;
  uint64_t v24;
  id v25;
  id v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  _BOOL4 v45;
  id v46;
  id v47;
  const __CFString *v49;
  const char *v50;
  void *v51;
  void *v52;
  ENRegionMonitor *v53;
  __CFString *v54;
  _QWORD v55[5];
  id v56;
  __CFString *v57;
  _BOOL4 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  -[ENActiveEntity entity](self->_activeEntity, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "region");
  v54 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = -[ENDaemon _isNKDActive](self, "_isNKDActive");
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSensitiveLoggingAllowed");

  if (v8 && gLogCategory_ENDaemon <= 10 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v9 = CFSTR("<>");
    if (v54)
      v9 = v54;
    v10 = "no";
    if (v6)
      v10 = "yes";
    v49 = v9;
    v50 = v10;
    LogPrintF_safe();
  }
  if (v54)
    v11 = v6;
  else
    v11 = 0;
  if (!v11)
  {
    v30 = (void *)MEMORY[0x1E0C9AA58];
    goto LABEL_67;
  }
  v12 = self->_regionMonitor;
  if (!v12)
  {
    if (a3)
    {
      ENErrorF();
      v30 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    goto LABEL_66;
  }
  -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    if (a3)
    {
      ENErrorF();
      v30 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    goto LABEL_65;
  }
  v53 = v12;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v13, "allCachedRegions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (!v16)
  {

LABEL_31:
    if (gLogCategory_ENDaemon <= 10)
    {
      v12 = v53;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
        LogPrintF_safe();
      v30 = (void *)MEMORY[0x1E0C9AA58];
      goto LABEL_65;
    }
    v30 = (void *)MEMORY[0x1E0C9AA58];
    goto LABEL_64;
  }
  v17 = v16;
  v18 = 0;
  v19 = *(_QWORD *)v65;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v65 != v19)
        objc_enumerationMutation(v15);
      objc_msgSend(v14, "configurationForRegion:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i), v49, v50);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userConsent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 |= objc_msgSend(v22, "consent") == 2;

    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  }
  while (v17);

  if ((v18 & 1) == 0)
    goto LABEL_31;
  regionMonitor = self->_regionMonitor;
  v63 = 0;
  -[ENRegionMonitor getAllRegionsWithError:](regionMonitor, "getAllRegionsWithError:", &v63);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v63;
  v26 = v25;
  if (!v24)
  {
    v27 = (__CFString *)v25;
    -[__CFString domain](v27, "domain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0CAA290]) & 1) != 0)
    {
      v29 = -[__CFString code](v27, "code");

      if (v29 == 4)
      {
        if (gLogCategory_ENDaemon > 10 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
          goto LABEL_45;
        goto LABEL_39;
      }
    }
    else
    {

    }
    if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
      goto LABEL_45;
    v49 = v27;
LABEL_39:
    LogPrintF_safe();
LABEL_45:
    objc_msgSend(MEMORY[0x1E0C99E68], "set", v49);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v52 = v26;
  v51 = (void *)v24;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E28]), "initWithSet:", v24);
  objc_msgSend(v31, "addObject:", v54);
  v32 = objc_alloc_init(MEMORY[0x1E0C99E00]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v33 = v31;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v60 != v36)
          objc_enumerationMutation(v33);
        v38 = *(__CFString **)(*((_QWORD *)&v59 + 1) + 8 * j);
        objc_msgSend(v14, "downloadConfigurationForRegion:", v38, v49);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v39)
        {
          objc_msgSend(v39, "tekLocalDownloadBaseURL");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v42 || -[__CFString isEqual:](v38, "isEqual:", v54))
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v40, v41);

        }
        else
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "isSensitiveLoggingAllowed");

          if (v44
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            v49 = v38;
            LogPrintF_safe();
          }
        }

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    }
    while (v35);
  }

  v45 = (unint64_t)objc_msgSend(v32, "count") > 1;
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __48__ENDaemon__getDownloadEndpointsAndReturnError___block_invoke;
  v55[3] = &unk_1E87DA548;
  v55[4] = v14;
  v56 = v46;
  v57 = v54;
  v58 = v45;
  v47 = v46;
  objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v55);
  v30 = (void *)objc_msgSend(v47, "copy");

LABEL_64:
  v12 = v53;
LABEL_65:

LABEL_66:
LABEL_67:

  return v30;
}

void __48__ENDaemon__getDownloadEndpointsAndReturnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  ENDownloadEndpoint *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  ENDownloadEndpoint *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  ENDownloadEndpoint *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  ENDownloadEndpoint *v32;
  const char *v33;
  uint64_t v34;
  ENDownloadEndpoint *v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configurationForRegion:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "enVersion") >= 2)
  {
    v9 = [ENDownloadEndpoint alloc];
    objc_msgSend(v6, "tekLocalDownloadIndexURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tekPublishInterval");
    v12 = v11;
    objc_msgSend(v6, "region");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ENDownloadEndpoint initWithBaseURL:indexURL:interval:enabled:region:](v9, "initWithBaseURL:indexURL:interval:enabled:region:", v5, v10, 1, v13, v12);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
    objc_msgSend(v6, "region");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v15, "isEqual:", *(_QWORD *)(a1 + 48));

    if ((_DWORD)v13)
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        if (*(_DWORD *)(a1 + 56))
          v16 = "yes";
        else
          v16 = "no";
        objc_msgSend(v6, "travelerDownloadConfigurations");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v16;
        v34 = objc_msgSend(v17, "count");
        LogPrintF_safe();

      }
      objc_msgSend(v6, "travelerDownloadConfigurations", v33, v34);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19 && *(_DWORD *)(a1 + 56))
      {
        v35 = v14;
        v36 = v8;
        v37 = v7;
        v38 = v5;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v6, "travelerDownloadConfigurations");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v40 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              v26 = [ENDownloadEndpoint alloc];
              objc_msgSend(v25, "tekTravelerDownloadBaseURL");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "tekTravelerDownloadIndexURL");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "tekPublishInterval");
              v30 = v29;
              objc_msgSend(v6, "region");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = -[ENDownloadEndpoint initWithBaseURL:indexURL:interval:enabled:region:](v26, "initWithBaseURL:indexURL:interval:enabled:region:", v27, v28, 1, v31, v30);

              objc_msgSend(*(id *)(a1 + 40), "addObject:", v32);
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          }
          while (v22);
        }

        v7 = v37;
        v5 = v38;
        v14 = v35;
        v8 = v36;
      }
    }

  }
}

- (id)exposureDetectionManager:(id)a3 advertisementDatabaseQuerySessionWithAttenuationThreshold:(unsigned __int8)a4 error:(id *)a5
{
  return -[ENDaemon advertisementDatabaseQuerySessionWithAttenuationThreshold:error:](self, "advertisementDatabaseQuerySessionWithAttenuationThreshold:error:", a4, a5);
}

- (void)exposureDetectionManager:(id)a3 errorDetected:(unsigned int)a4
{
  uint64_t v4;
  id WeakRetained;

  v4 = *(_QWORD *)&a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sendErrorMetricWithType:", v4);

}

- (void)exposureDetectionManager:(id)a3 finishedSessionWithResult:(id)a4
{
  ENDifferentialPrivacyManager *differentialPrivacyManager;
  void *v6;
  ENDifferentialPrivacyManager *v7;
  void *v8;
  ENDifferentialPrivacyManager *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;

  v19 = a4;
  differentialPrivacyManager = self->_differentialPrivacyManager;
  objc_msgSend(v19, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENDifferentialPrivacyManager reportUserRiskScoreWithSummary:](differentialPrivacyManager, "reportUserRiskScoreWithSummary:", v6);

  v7 = self->_differentialPrivacyManager;
  objc_msgSend(v19, "differentialPrivacyRiskParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENDifferentialPrivacyManager reportUserRiskParameters:](v7, "reportUserRiskParameters:", v8);

  v9 = self->_differentialPrivacyManager;
  objc_msgSend(v19, "differentialPrivacyBeaconCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENDifferentialPrivacyManager reportUserBeaconCount:](v9, "reportUserBeaconCount:", v10);

  v11 = objc_msgSend(v19, "exposureClassificationStatus");
  objc_msgSend(v19, "exposureClassification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSensitiveLoggingAllowed");

  if (v14 && gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v12, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  if (v11 >= 2)
  {
    objc_msgSend(v19, "region");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[ENDaemon _postExposureNotificationForClassification:status:region:](self, "_postExposureNotificationForClassification:status:region:", v12, v11, v16);
    }
    else
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isSensitiveLoggingAllowed");

      if (v18
        && gLogCategory_ENDaemon <= 90
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }

  }
}

- (id)activeRegionForExposureDetectionManager:(id)a3
{
  void *v3;
  void *v4;

  -[ENActiveEntity entity](self->_activeEntity, "entity", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "region");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_postExposureNotificationForClassification:(id)a3 status:(int64_t)a4 region:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  char v43;
  id v44;
  BOOL v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  void *v53;
  int v54;
  const __CFString *v55;
  double v56;
  void *v57;
  void *v58;
  int64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;

  v8 = a3;
  v9 = a5;
  -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configurationForRegion:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "enVersion") > 1)
  {
    objc_msgSend(v10, "agencyConfigurationForRegion:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      v45 = 0;
      goto LABEL_55;
    }
    v63 = v11;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isSensitiveLoggingAllowed");

    if (v14 && gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v8, "name");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("<none>");
      if (v15)
        v17 = (const __CFString *)v15;
      v59 = a4;
      v61 = v9;
      v55 = v17;
      LogPrintF_safe();

    }
    v64 = v12;
    objc_msgSend(v12, "localizedConfiguration", v55, v59, v61);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0CAA348]);
    objc_msgSend(v18, "setClassification:", v8);
    objc_msgSend(MEMORY[0x1E0CB3A30], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIdentifier:", v19);

    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNotificationDate:", v20);

    objc_msgSend(v18, "setRegion:", v9);
    objc_msgSend(v8, "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceNow");
    v23 = v22;

    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isSensitiveLoggingAllowed");

    if (v25 && gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v56 = -v23;
      v60 = (int)(v23 / -86400.0);
      LogPrintF_safe();
    }
    -[ENDifferentialPrivacyManager reportUserExposureNotificationWithClassificationIndex:daysDelay:](self->_differentialPrivacyManager, "reportUserExposureNotificationWithClassificationIndex:daysDelay:", objc_msgSend(v8, "index", *(_QWORD *)&v56, v60), (int)(v23 / -86400.0));
    if (a4 == 3)
    {
      v26 = v65;
      objc_msgSend(v65, "revokedNotificationBody");
      v36 = objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v28 = (void *)v36;
        objc_msgSend(v65, "revokedNotificationSubject");
        v37 = objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v30 = (void *)v37;
          v62 = v9;
          v31 = v10;
          objc_msgSend(v64, "revokedClassificationURL");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setLearnMoreURL:", v38);

          objc_msgSend(v18, "setLocalizedBodyText:", v28);
          objc_msgSend(v18, "setLocalizedSubjectText:", v30);
          objc_msgSend(v18, "setRevoked:", 1);
LABEL_23:

          v67 = 0;
          -[ENDaemon getExposureDatabaseAndReturnError:](self, "getExposureDatabaseAndReturnError:", &v67);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v67;
          objc_msgSend(v18, "notificationDate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          ENDefaultExpirationDate();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v40;
          v43 = objc_msgSend(v39, "setValue:forKey:expiryDate:error:", v18, CFSTR("LastExposureNotification"), v42, &v66);
          v44 = v66;

          if ((v43 & 1) == 0
            && gLogCategory__ENDaemon <= 90
            && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            CUPrintNSError();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

          }
          -[ENDaemon postExposureNotification:](self, "postExposureNotification:", v18, v57);

          v45 = 1;
          v10 = v31;
          v9 = v62;
          goto LABEL_34;
        }
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "isSensitiveLoggingAllowed");

        if (v54
          && gLogCategory_ENDaemon <= 90
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        goto LABEL_72;
      }
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "isSensitiveLoggingAllowed");

      if (v51 && gLogCategory_ENDaemon <= 90)
      {
        if (gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
          goto LABEL_73;
LABEL_52:
        LogPrintF_safe();
LABEL_73:
        v45 = 0;
LABEL_34:
        v11 = v63;
        v12 = v64;
        v26 = v65;
LABEL_54:

LABEL_55:
        goto LABEL_56;
      }
    }
    else
    {
      v26 = v65;
      if (a4 == 2)
      {
        objc_msgSend(v8, "name");
        v27 = objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = (void *)v27;
          objc_msgSend(v65, "notificationConfigurationForName:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v30 = v29;
            v62 = v9;
            v31 = v10;
            objc_msgSend(v29, "classificationURL");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setLearnMoreURL:", v32);

            objc_msgSend(v30, "localizedNotificationBody");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setLocalizedBodyText:", v33);

            objc_msgSend(v30, "localizedNotificationSubject");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setLocalizedSubjectText:", v34);

            objc_msgSend(v30, "localizedExposureDetailBody");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setLocalizedDetailBodyText:", v35);

            goto LABEL_23;
          }
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "isSensitiveLoggingAllowed");

          if (v49
            && gLogCategory_ENDaemon <= 90
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            objc_msgSend(v8, "name");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

          }
LABEL_72:

          goto LABEL_73;
        }
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "isSensitiveLoggingAllowed");

        if (v47 && gLogCategory_ENDaemon <= 90)
        {
          if (gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
            goto LABEL_73;
          goto LABEL_52;
        }
      }
      else if (gLogCategory__ENDaemon <= 90)
      {
        v12 = v64;
        if (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())
          LogPrintF_safe();
        v45 = 0;
        goto LABEL_54;
      }
    }
    v45 = 0;
    v12 = v64;
    goto LABEL_54;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v11, "enVersion");
    LogPrintF_safe();
  }
  v45 = 0;
LABEL_56:

  return v45;
}

- (void)onboardingManagerDidObserveDeviceUnlock:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  const char *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  const char *v13;
  _QWORD v14[5];

  -[ENDaemon _readPreferenceRegionPendingOnboarding](self, "_readPreferenceRegionPendingOnboarding", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    -[ENDaemon onboardingManager](self, "onboardingManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "pendingBuddyOnboarding");
    v7 = "no";
    if (v6)
      v8 = "yes";
    else
      v8 = "no";
    if (v4)
      v7 = "yes";
    v12 = v8;
    v13 = v7;
    LogPrintF_safe();

  }
  -[ENDaemon onboardingManager](self, "onboardingManager", v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isDeviceUnlocked") && v4)
  {
    -[ENDaemon onboardingManager](self, "onboardingManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "pendingBuddyOnboarding");

    if (v11)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __52__ENDaemon_onboardingManagerDidObserveDeviceUnlock___block_invoke_2;
      v14[3] = &unk_1E87DA5B0;
      v14[4] = self;
      -[ENDaemon presentBuddyForRegion:errorHandler:completionHandler:](self, "presentBuddyForRegion:errorHandler:completionHandler:", v4, &__block_literal_global_3, v14);
    }
  }
  else
  {

  }
}

uint64_t __52__ENDaemon_onboardingManagerDidObserveDeviceUnlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "onboardingManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isIdealTimeForBuddy");

  objc_msgSend(*(id *)(a1 + 32), "onboardingManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldObserveDeviceUnlocks:", v3 ^ 1);

  objc_msgSend(*(id *)(a1 + 32), "onboardingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPendingBuddyOnboarding:", v3 ^ 1);

  return v3;
}

- (void)textMessageManager:(id)a3 errorDetected:(unsigned int)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[5];
  unsigned int v6;

  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ENDaemon_textMessageManager_errorDetected___block_invoke;
  v5[3] = &unk_1E87DA4D0;
  v5[4] = self;
  v6 = a4;
  dispatch_async(dispatchQueue, v5);
}

void __45__ENDaemon_textMessageManager_errorDetected___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  objc_msgSend(WeakRetained, "sendErrorMetricWithType:", *(unsigned int *)(a1 + 40));

}

- (id)legacyHistoryPath
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "bluetoothSystemContainerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Library/ExposureNotification"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("DetectionHistory.plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v6 = 0;
  }

  return v6;
}

- (id)loadLegacyHistorySinceTime:(double)a3
{
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  off_t st_size;
  id v12;
  char *v13;
  char *v14;
  ssize_t v15;
  id *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  double v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id obj;
  stat v41;
  _QWORD v42[5];
  uint64_t v43;
  id *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v43 = 0;
  v44 = (id *)&v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__3;
  v47 = __Block_byref_object_dispose__3;
  v48 = 0;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __39__ENDaemon_loadLegacyHistorySinceTime___block_invoke;
  v42[3] = &unk_1E87D9DB0;
  v42[4] = &v43;
  v5 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v42, a2);
  -[ENDaemon legacyHistoryPath](self, "legacyHistoryPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v6;
  if (!v6)
    goto LABEL_64;
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if (!v8)
  {
LABEL_63:
    v6 = 0;
    goto LABEL_64;
  }
  v9 = open_dprotected_np((const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), 0, 2, 0, 384);
  v10 = v9;
  if (v9 < 0)
  {
    if (!*__error() || *__error())
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        CUPrintErrorCode();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      goto LABEL_63;
    }
    ENErrorF();
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (lseek(v9, 0, 0))
  {
    __error();
    ENErrorF();
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_20:
    v18 = v44[5];
    v44[5] = (id)v17;

    goto LABEL_63;
  }
  memset(&v41, 0, sizeof(v41));
  if (fstat(v10, &v41))
  {
    __error();
    ENErrorF();
    v31 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    st_size = v41.st_size;
    if (v41.st_size <= 0x8000)
    {
      if (v41.st_size >= 1)
      {
        v12 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF8]), "initWithLength:", v41.st_size));
        v13 = (char *)objc_msgSend(v12, "mutableBytes");
        v14 = &v13[st_size];
        do
        {
          v15 = read(v10, v13, v14 - v13);
          if (!v15)
            break;
          if (v15 <= 0)
          {
            __error();
            ENErrorF();
            v30 = objc_claimAutoreleasedReturnValue();
            v6 = 0;
            v39 = v44[5];
            v44[5] = (id)v30;

            goto LABEL_61;
          }
          v13 += v15;
        }
        while (v13 < v14);
        v16 = v44;
        obj = 0;
        objc_msgSend(MEMORY[0x1E0CB38B8], "propertyListWithData:options:format:error:", v12, 0, 0, &obj);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v16 + 5, obj);
        v36 = v12;
        if (v38)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (gLogCategory_ENDaemon <= 30)
            {
              if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
              {
                v33 = COERCE_DOUBLE(objc_msgSend(v38, "count"));
                LogPrintF_safe();
              }
              if (gLogCategory_ENDaemon <= 30
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                v33 = a3;
                LogPrintF_safe();
              }
            }
            v19 = (void *)objc_msgSend(v38, "mutableCopy", *(_QWORD *)&v33);
            v20 = v19;
            if (v19)
              v21 = v19;
            else
              v21 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
            v6 = v21;

            v22 = objc_msgSend(v6, "count");
            v23 = v22;
            if (v22 < 0x65)
            {
              if (!v22)
              {
LABEL_50:
                if (gLogCategory_ENDaemon < 31
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  objc_msgSend(v6, "count");
                  LogPrintF_safe();
                }
                if (!close(v10)
                  || gLogCategory__ENDaemon > 90
                  || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
                {
                  goto LABEL_60;
                }
                __error();
                CUPrintErrorCode();
                v28 = (id)objc_claimAutoreleasedReturnValue();
                LogPrintF_safe();
LABEL_58:

LABEL_60:
                v12 = v36;

                goto LABEL_61;
              }
            }
            else
            {
              do
              {
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  CUPrintNSObjectOneLine();
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  LogPrintF_safe();

                }
                objc_msgSend(v6, "removeObjectAtIndex:", 0, v35);
                --v23;
              }
              while (v23 > 0x64);
              v23 = 100;
            }
            v25 = 0;
            do
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && (CFDictionaryGetDouble(), v27 >= a3))
              {
                ++v25;
              }
              else
              {
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  CUPrintNSObjectOneLine();
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  LogPrintF_safe();

                }
                objc_msgSend(v6, "removeObjectAtIndex:", v25, v35);
                --v23;
              }

            }
            while (v25 < v23);
            goto LABEL_50;
          }
          ENErrorF();
          v32 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          ENNestedErrorF();
          v32 = objc_claimAutoreleasedReturnValue();
        }
        v6 = 0;
        v28 = v44[5];
        v44[5] = (id)v32;
        goto LABEL_58;
      }
      goto LABEL_63;
    }
    ENErrorF();
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v6 = 0;
  v12 = v44[5];
  v44[5] = (id)v31;
LABEL_61:

LABEL_64:
  v5[2](v5);

  _Block_object_dispose(&v43, 8);
  return v6;
}

void __39__ENDaemon_loadLegacyHistorySinceTime___block_invoke(uint64_t a1)
{
  id v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)
    && gLogCategory__ENDaemon <= 90
    && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v1 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
}

- (void)_migrateLegacyHistoryIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  char v6;
  id v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  uint64_t v16;
  id v17;
  char v18;
  id v19;
  id v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  uint64_t v26;
  ENDaemon *v27;
  id v28;
  void *v29;
  void *v30;
  id obj;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[ENDaemon loadLegacyHistorySinceTime:](self, "loadLegacyHistorySinceTime:", 1209600.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v26 = objc_msgSend(v3, "count");
      LogPrintF_safe();
    }
    v45 = 0;
    -[ENDaemon getExposureDatabaseAndReturnError:](self, "getExposureDatabaseAndReturnError:", &v45, v26);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v45;
    v30 = v4;
    if (v4)
    {
      v44 = 0;
      v6 = objc_msgSend(v4, "openWithError:", &v44);
      v7 = v44;
      if ((v6 & 1) != 0)
      {
        v27 = self;
        v28 = v5;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v29 = v3;
        obj = v3;
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        if (!v35)
          goto LABEL_40;
        v34 = *(_QWORD *)v41;
        v8 = v30;
        while (1)
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v41 != v34)
              objc_enumerationMutation(obj);
            CFStringGetTypeID();
            CFDictionaryGetTypedValue();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            NSDictionaryGetNSNumber();
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            CFDataGetTypeID();
            CFDictionaryGetTypedValue();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            NSDictionaryGetNSNumber();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            NSDictionaryGetNSNumber();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
              v14 = v12 == 0;
            else
              v14 = 1;
            if (!v14)
            {
              v15 = objc_alloc(MEMORY[0x1E0C99D60]);
              v32 = v11;
              objc_msgSend(v11, "doubleValue");
              v16 = objc_msgSend(v15, "initWithTimeIntervalSinceReferenceDate:");
              v17 = objc_alloc_init(MEMORY[0x1E0CAA328]);
              objc_msgSend(v17, "setAppBundleIdentifier:", v10);
              objc_msgSend(v17, "setDate:", v16);
              objc_msgSend(v17, "setFileCount:", 1);
              objc_msgSend(v17, "setMatchCount:", objc_msgSend(v13, "unsignedLongLongValue"));
              v39 = v7;
              v18 = objc_msgSend(v8, "upsertExposureDetectionHistorySession:error:", v17, &v39);
              v19 = v39;

              v33 = (void *)v16;
              if ((v18 & 1) != 0)
              {
                v20 = objc_alloc_init(MEMORY[0x1E0CAA320]);
                objc_msgSend(v20, "setFileHash:", v12);
                objc_msgSend(v20, "setProcessDate:", v16);
                objc_msgSend(v20, "setKeyCount:", v36);
                objc_msgSend(v20, "setMatchCount:", v13);
                objc_msgSend(v20, "setSourceAppBundleIdentifier:", v10);
                v38 = v19;
                v21 = objc_msgSend(v8, "insertExposureDetectionFile:session:error:", v20, v17, &v38);
                v7 = v38;

                if ((v21 & 1) == 0
                  && gLogCategory__ENDaemon <= 90
                  && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }

                v8 = v30;
LABEL_36:
                v11 = v32;
              }
              else
              {
                if (gLogCategory__ENDaemon > 90)
                {
                  v7 = v19;
                  goto LABEL_36;
                }
                v11 = v32;
                if (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())
                  LogPrintF_safe();
                v7 = v19;
              }

              goto LABEL_38;
            }
            if (gLogCategory__ENDaemon <= 90
              && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
LABEL_38:

          }
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
          if (!v35)
          {
LABEL_40:

            -[ENDaemon legacyHistoryPath](v27, "legacyHistoryPath");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = 0;
              v24 = objc_msgSend(v23, "removeItemAtPath:error:", v22, &v37);
              v25 = v37;

              if ((v24 & 1) == 0
                && gLogCategory__ENDaemon <= 90
                && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }

            }
            v5 = v28;
            v3 = v29;
            goto LABEL_48;
          }
        }
      }
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
LABEL_48:

    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
}

- (id)loadHistorySinceTime:(double)a3
{
  uint64_t v5;
  void (**v6)(_QWORD);
  id *v7;
  void *v8;
  id v9;
  id *v10;
  id v11;
  _QWORD v13[8];
  id v14;
  id obj;
  _QWORD v16[5];
  uint64_t v17;
  id *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = (id *)&v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v5 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __33__ENDaemon_loadHistorySinceTime___block_invoke;
  v16[3] = &unk_1E87D9DB0;
  v16[4] = &v17;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v16, a2);
  v7 = v18;
  obj = v18[5];
  -[ENDaemon getExposureDatabaseAndReturnError:](self, "getExposureDatabaseAndReturnError:", &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7 + 5, obj);
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
    v10 = v18;
    v14 = v18[5];
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __33__ENDaemon_loadHistorySinceTime___block_invoke_2;
    v13[3] = &unk_1E87DA600;
    *(double *)&v13[7] = a3;
    v13[5] = v9;
    v13[6] = &v17;
    v13[4] = v8;
    objc_msgSend(v8, "enumerateExposureDetectionHistorySessionsWithError:handler:", &v14, v13);
    objc_storeStrong(v10 + 5, v14);
    v11 = v9;

  }
  else
  {
    v11 = 0;
  }

  v6[2](v6);
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __33__ENDaemon_loadHistorySinceTime___block_invoke(uint64_t a1)
{
  id v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)
    && gLogCategory__ENDaemon <= 90
    && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v1 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
}

void __33__ENDaemon_loadHistorySinceTime___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id obj;

  v5 = a2;
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;
  v9 = *(double *)(a1 + 56);

  if (v8 >= v9)
  {
    objc_msgSend(v5, "appBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v5, "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      v16[4] = v13;
      obj = v15;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __33__ENDaemon_loadHistorySinceTime___block_invoke_3;
      v16[3] = &unk_1E87DA5D8;
      objc_msgSend(v11, "enumerateExposureDetectionHistoryFilesForSessionUUID:error:handler:", v12, &obj, v16);
      objc_storeStrong((id *)(v14 + 40), obj);

    }
  }
  else
  {
    *a3 = 1;
  }

}

void __33__ENDaemon_loadHistorySinceTime___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (objc_class *)MEMORY[0x1E0C99E00];
  v4 = a2;
  v14 = objc_alloc_init(v3);
  objc_msgSend(v4, "sourceAppBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, CFSTR("bundleID"));

  objc_msgSend(v4, "fileHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, CFSTR("hash"));

  objc_msgSend(v4, "keyCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("keyCount"));

  objc_msgSend(v4, "matchCount");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = &unk_1E87EE0C0;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("matchCount"));

  v11 = (void *)MEMORY[0x1E0CB37E0];
  objc_msgSend(v4, "processDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("time"));

  objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v14, 0);
}

- (void)startAvailabilityAlertCycleWithBuddy:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t Int64;
  ENActiveEntity *activeEntity;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  const char *v19;
  id v20;

  v3 = a3;
  -[ENDaemon onboardingTriggerDeactivate](self, "onboardingTriggerDeactivate");
  -[ENDaemon regionMonitor](self, "regionMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v5, "getCurrentRegionVisitWithError:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  objc_msgSend(v6, "region");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSensitiveLoggingAllowed");

    if (v10 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v11 = "no";
      if (v3)
        v11 = "yes";
      v18 = v8;
      v19 = v11;
      LogPrintF_safe();
    }
    -[ENDaemon _writePreferenceRegionPendingOnboarding:](self, "_writePreferenceRegionPendingOnboarding:", v8, v18, v19);
    -[ENDaemon postOnboardingNotificationForRegion:](self, "postOnboardingNotificationForRegion:", v8);
    Int64 = CFPrefs_GetInt64();
    if (v3 && !Int64)
    {
      activeEntity = self->_activeEntity;
      if (!activeEntity || -[ENActiveEntity activeStatus](activeEntity, "activeStatus") <= 2)
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        -[ENDaemon onboardingManager](self, "onboardingManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setShouldObserveDeviceUnlocks:", 1);

        -[ENDaemon onboardingManager](self, "onboardingManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isDeviceUnlocked");

        if ((v16 & 1) == 0)
        {
          -[ENDaemon onboardingManager](self, "onboardingManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPendingBuddyOnboarding:", 1);

        }
      }
    }
    if (!CFPrefs_GetInt64())
      -[ENDaemon onboardingTriggerRetry:](self, "onboardingTriggerRetry:", 2);
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)onboardingTriggerRetry:(unsigned int)a3
{
  double v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  ENXPCTimer *v19;
  ENXPCTimer *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;

  if (a3)
  {
    CFPrefs_GetDouble();
    if (v5 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D60], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D40], "currentCalendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc_init(MEMORY[0x1E0C99D70]);
      objc_msgSend(v8, "setDay:", a3);
      objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v8, v6, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateBySettingUnit:value:ofDate:options:", 32, 10, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSince1970:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[ENDaemon onboardingTimer](self, "onboardingTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    -[ENDaemon setOnboardingTimer:](self, "setOnboardingTimer:", 0);
LABEL_8:
    if (-[ENDaemon isOnboardingNeeded](self, "isOnboardingNeeded"))
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      if (a3 == 2 || a3 == 5)
      {
        CFPrefs_SetInt64();
        objc_msgSend(v10, "timeIntervalSince1970");
        CFPrefs_SetDouble();
      }
      if (gLogCategory_ENDaemon <= 30)
      {
        if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
        {
          objc_msgSend(MEMORY[0x1E0C99D60], "date");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          v25 = v10;
          LogPrintF_safe();
        }
      }
      objc_msgSend(v10, "timeIntervalSinceNow", v25);
      v15 = v14;
      v16 = 7200.0;
      if (IsAppleInternalBuild())
      {
        CFPrefs_GetDouble();
        if (a3)
        {
          if (v17 > 0.0)
          {
            CFPrefs_GetDouble();
            v15 = v18;
            v16 = 30.0;
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              LogPrintF_safe();
          }
        }
      }
      v19 = [ENXPCTimer alloc];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __35__ENDaemon_onboardingTriggerRetry___block_invoke;
      v26[3] = &unk_1E87DA278;
      v26[4] = self;
      v20 = -[ENXPCTimer initWithName:delay:gracePeriod:priority:options:block:](v19, "initWithName:delay:gracePeriod:priority:options:block:", CFSTR("com.apple.exposurenotification.onboarding.retry"), 1, 577, v26, v15, v16);
      -[ENDaemon setOnboardingTimer:](self, "setOnboardingTimer:", v20);

    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    goto LABEL_35;
  }
  -[ENDaemon timeForAvailabilityAlertCycleReset](self, "timeForAvailabilityAlertCycleReset");
  if (v11 == 0.0)
  {
    CFPrefs_RemoveValue();
    v10 = 0;
    goto LABEL_35;
  }
  v13 = v11;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSince1970:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSince1970:", v13, v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENDaemon onboardingTriggerDeactivate](self, "onboardingTriggerDeactivate");
  -[ENDaemon regionMonitor](self, "regionMonitor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v21, "getCurrentRegionVisitWithError:", &v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v27;
  objc_msgSend(v22, "region");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[ENDaemon _writePreferenceRegionPendingOnboarding:](self, "_writePreferenceRegionPendingOnboarding:", v24);

    goto LABEL_8;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();

LABEL_35:
}

void __35__ENDaemon_onboardingTriggerRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t Int64;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  objc_msgSend(*(id *)(a1 + 32), "onboardingManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldObserveDeviceUnlocks:", 0);

  objc_msgSend(*(id *)(a1 + 32), "onboardingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPendingBuddyOnboarding:", 0);

  objc_msgSend(*(id *)(a1 + 32), "regionMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCurrentRegionVisitWithError:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "region");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_readPreferenceRegionPendingOnboarding");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v8) & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isOnboardingNeeded") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "userNotificationCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = CFSTR("com.apple.ExposureNotification.onboarding");
      objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeDeliveredNotificationsWithIdentifiers:", v11);

      objc_msgSend(*(id *)(a1 + 32), "postOnboardingNotificationForRegion:", v9);
      Int64 = CFPrefs_GetInt64();
      v13 = CFPrefs_GetInt64();
      CFPrefs_RemoveValue();
      CFPrefs_RemoveValue();
      if (v13 == 2)
      {
        if (gLogCategory_ENDaemon > 50 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
          goto LABEL_23;
      }
      else
      {
        if (v13 != 1)
        {
          if (!v13)
          {
            if (!Int64)
              objc_msgSend(*(id *)(a1 + 32), "onboardingTriggerRetry:", 2);
            CFPrefs_RemoveValue();
          }
          goto LABEL_24;
        }
        if (Int64)
          goto LABEL_24;
        objc_msgSend(*(id *)(a1 + 32), "onboardingTriggerRetry:", 5);
        if (gLogCategory_ENDaemon > 50 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
        {
LABEL_23:
          CFPrefs_SetValue();
          goto LABEL_24;
        }
      }
      LogPrintF_safe();
      goto LABEL_23;
    }
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    objc_msgSend(*(id *)(a1 + 32), "onboardingTriggerDeactivate");
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_24:

}

- (void)onboardingTriggerResumeIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t Int64;
  ENDaemon *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0C99D60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  CFPrefs_GetDouble();
  if (v6 == 0.0)
    return;
  v7 = v6;
  Int64 = CFPrefs_GetInt64();
  if (Int64 == 2)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSince1970:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (v7 > v5)
    {
      v9 = self;
      v10 = 5;
      goto LABEL_20;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
  }
  else
  {
    if (Int64 != 1)
      return;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSince1970:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (v7 > v5)
    {
      v9 = self;
      v10 = 2;
LABEL_20:
      -[ENDaemon onboardingTriggerRetry:](v9, "onboardingTriggerRetry:", v10);
      return;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSince1970:", v7, v16);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D40], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99D70]);
    objc_msgSend(v12, "setDay:", 5);
    objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v12, v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateBySettingUnit:value:ofDate:options:", 32, 10, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    if (v15 <= v5)
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      CFPrefs_RemoveValue();
      CFPrefs_RemoveValue();
    }
    else
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      CFPrefs_SetInt64();
      objc_msgSend(v14, "timeIntervalSince1970");
      CFPrefs_SetDouble();
      -[ENDaemon onboardingTriggerRetry:](self, "onboardingTriggerRetry:", 5);
    }

  }
}

- (void)onboardingTriggerDeactivate
{
  void *v3;
  void *v4;
  void *v5;

  if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  -[ENDaemon onboardingManager](self, "onboardingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldObserveDeviceUnlocks:", 0);

  -[ENDaemon onboardingManager](self, "onboardingManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPendingBuddyOnboarding:", 0);

  -[ENDaemon onboardingTimer](self, "onboardingTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[ENDaemon setOnboardingTimer:](self, "setOnboardingTimer:", 0);
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
}

- (double)timeForAvailabilityAlertCycleReset
{
  ENRegionMonitor *regionMonitor;
  void *v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t Int64;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v30;
  double v31;
  void *v32;
  id v33;

  if (-[ENDaemon isOnboardingNeeded](self, "isOnboardingNeeded"))
  {
    regionMonitor = self->_regionMonitor;
    v33 = 0;
    -[ENRegionMonitor getCurrentRegionVisitWithError:](regionMonitor, "getCurrentRegionVisitWithError:", &v33);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v33;
    objc_msgSend(v4, "region");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = 0.0;
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      goto LABEL_32;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v30 = v6;
      LogPrintF_safe();
    }
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore", v30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationForRegion:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v9, "enVersion") <= 1)
    {
      v7 = 0.0;
      if (gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
        goto LABEL_31;
      objc_msgSend(v9, "enVersion");
    }
    else
    {
      objc_msgSend(v9, "userConsent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "consent");

      if (v11 != 2)
      {
        -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serverConfigurationForRegion:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v7 = 0.0;
          if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          goto LABEL_30;
        }
        objc_msgSend(v13, "timeToResetAvailabilityAlert");
        v15 = v14;
        objc_msgSend(MEMORY[0x1E0C99D60], "now");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSince1970");
        v18 = v17;

        CFPrefs_GetDouble();
        if (v19 > 0.0)
        {
          v20 = v19;
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            v31 = v20;
            LogPrintF_safe();
          }
          v15 = v18 + v20;
        }
        if (v15 <= v18)
        {
          v7 = 0.0;
          if (gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
            goto LABEL_30;
        }
        else
        {
          -[ENDaemon onboardingTimer](self, "onboardingTimer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
            goto LABEL_29;
          Int64 = CFPrefs_GetInt64();
          -[ENDaemon onboardingTimer](self, "onboardingTimer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "date");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "timeIntervalSince1970");
          v26 = v25;

          if (Int64 >= 1)
          {
            if (v26 < v15)
            {
              v7 = 0.0;
              if (gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
                goto LABEL_30;
              -[ENDaemon onboardingTimer](self, "onboardingTimer", *(_QWORD *)&v31);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "date");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSince1970:", v15);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF_safe();

              goto LABEL_28;
            }
LABEL_29:
            v7 = v15;
            goto LABEL_30;
          }
          if (v26 != v15)
            goto LABEL_29;
          v7 = 0.0;
          if (gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
            goto LABEL_30;
        }
        objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSince1970:", v15, *(_QWORD *)&v31);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();
LABEL_28:

LABEL_30:
LABEL_31:

LABEL_32:
        return v7;
      }
      v7 = 0.0;
      if (gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
        goto LABEL_31;
    }
    LogPrintF_safe();
    goto LABEL_31;
  }
  -[ENDaemon onboardingTriggerDeactivate](self, "onboardingTriggerDeactivate");
  CFPrefs_RemoveValue();
  return 0.0;
}

- (BOOL)isOnboardingNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  int v15;
  const char *v16;
  void *v18;
  const char *v19;

  if (self->_availabilityAlertDisabled)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    return 0;
  }
  else
  {
    -[ENDaemon _readPreferenceRegionPendingOnboarding](self, "_readPreferenceRegionPendingOnboarding");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[ENDaemon configurationManager](self, "configurationManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "configurationStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "configurationForRegion:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[ENDaemon configurationManager](self, "configurationManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "configurationStore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "serverConfigurationForRegion:", v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "resetAvailabilityAlertForDeclinedUsers");
        objc_msgSend(v6, "userConsent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "consent");

        if (v12 == 2 || v12 == 1 && (v10 & 1) == 0)
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isSensitiveLoggingAllowed");

          if (v15
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            v16 = "?";
            if (v12 == 1)
              v16 = "NotAuthorized";
            if (v12 == 2)
              v16 = "Authorized";
            v18 = v3;
            v19 = v16;
            LogPrintF_safe();
          }
          -[ENDaemon onboardingTriggerDeactivate](self, "onboardingTriggerDeactivate", v18, v19);
          v13 = 0;
        }
        else
        {
          v13 = 1;
        }

      }
      else
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        v13 = 0;
      }

    }
    else
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      v13 = 0;
    }

  }
  return v13;
}

- (void)_regionMonitorEnsureStarted
{
  ENRegionMonitor **p_regionMonitor;
  void *v4;
  int v5;
  void *v6;
  ENRegionMonitor *v7;

  if (!self->_regionMonitor)
  {
    p_regionMonitor = &self->_regionMonitor;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v7 = objc_alloc_init(ENRegionMonitor);
    objc_storeStrong((id *)p_regionMonitor, v7);
    -[ENConfigurationManager setRegionMonitor:](self->_configurationManager, "setRegionMonitor:", v7);
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSensitiveLoggingAllowed");

    if (v5 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      -[ENRegionMonitor getCurrentRegionVisitWithError:](*p_regionMonitor, "getCurrentRegionVisitWithError:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
}

- (void)_regionMonitorEnsureStopped
{
  ENRegionMonitor *regionMonitor;

  if (self->_regionMonitor)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    regionMonitor = self->_regionMonitor;
    self->_regionMonitor = 0;

  }
}

- (void)_networkProxyStatusCheck
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD v3[5];

  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__ENDaemon__networkProxyStatusCheck__block_invoke;
  v3[3] = &unk_1E87DA650;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D51AB8], "getServiceStatus:completionHandler:", dispatchQueue, v3);
}

void __36__ENDaemon__networkProxyStatusCheck__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else
  {
    if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 504), a2);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v8 + 224);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __36__ENDaemon__networkProxyStatusCheck__block_invoke_2;
    v11[3] = &unk_1E87DA628;
    v11[4] = v8;
    objc_msgSend(MEMORY[0x1E0D51AB8], "getTrafficState:completionandler:", v9, v11);
  }

}

void __36__ENDaemon__networkProxyStatusCheck__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v10 = 0;
    if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v8 = a2;
      LogPrintF_safe();
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512) = a2;
    if ((a2 & 0x800) != 0)
    {
      if (gLogCategory_ENDaemon > 40 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
        goto LABEL_21;
    }
    else if (gLogCategory_ENDaemon > 40 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_21;
    }
    LogPrintF_safe();
LABEL_21:
    objc_msgSend(*(id *)(a1 + 32), "prefsChanged", v8);
    goto LABEL_22;
  }
  if (gLogCategory__ENDaemon <= 90)
  {
    v10 = v5;
    if (gLogCategory__ENDaemon != -1 || (v7 = _LogCategory_Initialize(), v6 = v10, v7))
    {
      CUPrintNSError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

LABEL_22:
      v6 = v10;
    }
  }

}

- (id)temporaryExposureKeyManager:(id)a3 retrieveTEKHistoryIncludingActive:(BOOL)a4 generateNewTEK:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id WeakRetained;
  void *v8;

  v5 = a5;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "retrieveTEKHistoryIncludingActive:generateNewTEK:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isProxyEnabledForTestResultManager:(id)a3
{
  return self->_networkProxyStatus && self->_prefNetworkProxyEnabled;
}

- (void)enqueuePreauthorizedTestVerificationUnlockAction
{
  uint64_t v3;
  void (**v4)(_QWORD);
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
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  _QWORD v29[5];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v3 = MEMORY[0x1E0C809B0];
  v36 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __60__ENDaemon_enqueuePreauthorizedTestVerificationUnlockAction__block_invoke;
  v30[3] = &unk_1E87D9DB0;
  v30[4] = &v31;
  v4 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v30, a2);
  -[ENDaemon screenUnlockPendingActions](self, "screenUnlockPendingActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("PreArmUnlockActionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isSensitiveLoggingAllowed");

    if (v22 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
  }
  else if (-[ENDaemon getOverallStatus](self, "getOverallStatus") == 1
         && -[ENDaemon _isNKDActive](self, "_isNKDActive"))
  {
    -[ENDaemon activeEntity](self, "activeEntity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "region");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      ENErrorF();
      v23 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v32[5];
      v32[5] = v23;
      goto LABEL_17;
    }
    -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationForRegion:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "diagnosisKeysPreAuthorization");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      objc_msgSend(v12, "diagnosisKeysPreAuthorization");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "verificationCode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isSensitiveLoggingAllowed");

        if (!v26
          || gLogCategory_ENDaemon > 30
          || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_15;
        }
        goto LABEL_28;
      }
      objc_msgSend(v12, "diagnosisKeysPreAuthorization");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "reportType");

      if (v17 != 3)
      {
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isSensitiveLoggingAllowed");

        if (v19
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        v29[0] = v3;
        v29[1] = 3221225472;
        v29[2] = __60__ENDaemon_enqueuePreauthorizedTestVerificationUnlockAction__block_invoke_2;
        v29[3] = &unk_1E87D9C28;
        v29[4] = self;
        v20 = (void *)MEMORY[0x1D17A7E5C](v29);
        -[ENDaemon _enqueueScreenUnlockAction:withIdentifier:](self, "_enqueueScreenUnlockAction:withIdentifier:", v20, CFSTR("PreArmUnlockActionIdentifier"));

        goto LABEL_15;
      }
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isSensitiveLoggingAllowed");

      if (v28
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
LABEL_28:
        LogPrintF_safe();
      }
    }
    else
    {
      ENErrorF();
      v24 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v32[5];
      v32[5] = v24;
    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_18:
  v4[2](v4);

  _Block_object_dispose(&v31, 8);
}

void __60__ENDaemon_enqueuePreauthorizedTestVerificationUnlockAction__block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  id v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "isSensitiveLoggingAllowed");

    if (v2)
    {
      if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v3 = (id)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
    }
  }
}

uint64_t __60__ENDaemon_enqueuePreauthorizedTestVerificationUnlockAction__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startPreauthorizedTestVerificationAction");
}

- (id)_getReportTypeForSession:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  ENTestResultManager *v6;
  id *v7;
  void *v8;
  void *v9;
  id obj;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__ENDaemon__getReportTypeForSession___block_invoke;
  v12[3] = &unk_1E87D9DB0;
  v12[4] = &v13;
  v5 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v12);
  v6 = self->_testResultManager;
  v7 = (id *)(v14 + 5);
  obj = (id)v14[5];
  -[ENTestResultManager metadataForSessionWithUUID:error:](v6, "metadataForSessionWithUUID:error:", v4, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7, obj);
  -[ENDaemon _getReportTypeFromMetadata:](self, "_getReportTypeFromMetadata:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5);
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __37__ENDaemon__getReportTypeForSession___block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  id v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "isSensitiveLoggingAllowed");

    if (v2)
    {
      if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v3 = (id)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
    }
  }
}

- (id)_getReportTypeFromMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isSensitiveLoggingAllowed");

    if (!v9 || gLogCategory_ENDaemon > 90 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
      goto LABEL_20;
LABEL_14:
    LogPrintF_safe();
LABEL_20:
    v5 = &unk_1E87EE0D8;
    goto LABEL_21;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CAA268]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSensitiveLoggingAllowed");

  if (!v5)
  {
    if (!v7 || gLogCategory_ENDaemon > 90 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
      goto LABEL_20;
    goto LABEL_14;
  }
  if (v7 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_21:

  return v5;
}

- (void)_startPreauthorizedTestVerificationAction
{
  void *v3;
  int v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  ENTestResultManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 prefNetworkProxyEnabled;
  void *v18;
  id *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  id obj;
  _QWORD v29[10];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSensitiveLoggingAllowed");

  if (v4 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v5 = MEMORY[0x1E0C809B0];
  v36 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke;
  v30[3] = &unk_1E87D9DB0;
  v30[4] = &v31;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v30);
  if (-[ENDaemon getOverallStatus](self, "getOverallStatus") != 1 || !-[ENDaemon _isNKDActive](self, "_isNKDActive"))
  {
    ENErrorF();
    v20 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v32[5];
    v32[5] = v20;
    goto LABEL_18;
  }
  -[ENDaemon activeEntity](self, "activeEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    ENErrorF();
    v21 = objc_claimAutoreleasedReturnValue();
    v10 = (ENTestResultManager *)v32[5];
    v32[5] = v21;
    goto LABEL_17;
  }
  v10 = self->_testResultManager;
  if (!v10)
  {
    ENErrorF();
    v22 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v32[5];
    v32[5] = v22;
    goto LABEL_16;
  }
  -[ENConfigurationManager configurationStore](self->_configurationManager, "configurationStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configurationForRegion:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "diagnosisKeysPreAuthorization");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isSensitiveLoggingAllowed");

      if (v25
        && gLogCategory_ENDaemon <= 90
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      goto LABEL_15;
    }
    objc_msgSend(v13, "diagnosisKeysPreAuthorization");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "verificationCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      prefNetworkProxyEnabled = self->_prefNetworkProxyEnabled;
      v29[0] = v5;
      v29[1] = 3221225472;
      v29[2] = __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke_2;
      v29[3] = &unk_1E87DA6C8;
      v29[4] = self;
      v29[5] = v13;
      v29[6] = v9;
      v29[7] = v10;
      v29[8] = v11;
      v29[9] = &v31;
      -[ENTestResultManager startTestVerficationSessionWithCode:proxyEnabled:region:completionHandler:](v10, "startTestVerficationSessionWithCode:proxyEnabled:region:completionHandler:", v16, prefNetworkProxyEnabled, v9, v29);
      objc_msgSend(v13, "diagnosisKeysPreAuthorization");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setVerificationCode:", 0);

      v19 = (id *)(v32 + 5);
      obj = (id)v32[5];
      objc_msgSend(v11, "saveRegionConfiguration:error:", v13, &obj);
      objc_storeStrong(v19, obj);
    }
    else
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isSensitiveLoggingAllowed");

      if (v27
        && gLogCategory_ENDaemon <= 90
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
  else
  {
    ENErrorF();
    v23 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v32[5];
    v32[5] = v23;
  }

LABEL_15:
LABEL_16:

LABEL_17:
LABEL_18:

  v6[2](v6);
  _Block_object_dispose(&v31, 8);

}

void __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  id v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "isSensitiveLoggingAllowed");

    if (v2)
    {
      if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v3 = (id)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
    }
  }
}

void __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __int128 v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  v13[1] = 3221225472;
  v7 = *(_OWORD *)(a1 + 48);
  v15 = *(_OWORD *)(a1 + 32);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 224);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke_3;
  v13[3] = &unk_1E87DA6A0;
  v14 = v5;
  v16 = v7;
  v10 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v18 = v6;
  v19 = v9;
  v17 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, v13);

}

void __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  id v32;
  _QWORD v33[6];
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL4 v39;

  v2 = *(id *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_getReportTypeForSession:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "differentialPrivacyManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(*(id *)(a1 + 40), "_getLatestExposureForDifferentialPrivacy");
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isSensitiveLoggingAllowed");

      if (v7 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        v30 = v5;
        v31 = v3;
        LogPrintF_safe();
      }
      objc_msgSend(*(id *)(a1 + 40), "differentialPrivacyManager", v30, v31);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reportUserCodeVerified:reportType:", v5, objc_msgSend(v3, "unsignedIntValue"));

    }
    objc_msgSend(*(id *)(a1 + 48), "diagnosisKeysPreAuthorization");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "expirationStatus");
      objc_msgSend(MEMORY[0x1E0C99E00], "dictionaryWithCapacity:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "symptomOnsetDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v14, "setObject:forKey:", v15, *MEMORY[0x1E0CAA280]);

      objc_msgSend(v12, "didUserTravel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        objc_msgSend(v14, "setObject:forKey:", v16, *MEMORY[0x1E0CAA288]);

      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "regionSupportsFeatures:featureFlags:", *(_QWORD *)(a1 + 56), 1))
      {
        objc_msgSend(v12, "isUserVaccinated");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v14, "setObject:forKey:", v17, *MEMORY[0x1E0CAA278]);

      }
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isSensitiveLoggingAllowed");

      if (v19
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke_4;
      v33[3] = &unk_1E87DA678;
      v20 = *(_QWORD *)(a1 + 40);
      v38 = *(_QWORD *)(a1 + 88);
      v21 = *(_QWORD *)(a1 + 56);
      v22 = *(void **)(a1 + 64);
      v33[4] = v20;
      v33[5] = v21;
      v39 = v13 == 2;
      v34 = v3;
      v35 = v12;
      v23 = *(_QWORD *)(a1 + 72);
      v36 = *(_QWORD *)(a1 + 48);
      v37 = v23;
      objc_msgSend(v22, "finishSessionWithUUID:userDidConsent:metadata:completionHandler:", v2, v13 == 2, v14, v33);

    }
    else
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isSensitiveLoggingAllowed");

      if (v29
        && gLogCategory_ENDaemon <= 90
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }

  }
  else
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isSensitiveLoggingAllowed");

    if (v9 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v30 = *(_QWORD *)(a1 + 80);
      LogPrintF_safe();
    }
    if (*(_QWORD *)(a1 + 80))
      objc_msgSend(*(id *)(a1 + 40), "_handleTestVerificationErrors:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 48), "setDiagnosisKeysPreAuthorization:", 0, v30);
    v24 = *(void **)(a1 + 72);
    v25 = *(_QWORD *)(a1 + 48);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v32 = *(id *)(v26 + 40);
    objc_msgSend(v24, "saveRegionConfiguration:error:", v25, &v32);
    v27 = v32;
    v3 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v27;
  }

}

void __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id obj;

  v5 = a3;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSensitiveLoggingAllowed");

  if ((a2 & 1) != 0)
  {
    if (v7 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    objc_msgSend(*(id *)(a1 + 32), "postPreAuthorizationNotificationForRegion:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "differentialPrivacyManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(_DWORD *)(a1 + 88);

      if (v9)
      {
        v10 = objc_msgSend(*(id *)(a1 + 32), "_getLatestExposureForDifferentialPrivacy");
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isSensitiveLoggingAllowed");

        if (v12
          && gLogCategory_ENDaemon <= 90
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          v22 = v10;
          v23 = *(_QWORD *)(a1 + 48);
          LogPrintF_safe();
        }
        objc_msgSend(*(id *)(a1 + 32), "differentialPrivacyManager", v22, v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "reportUserKeysUploaded:reportType:", v10, objc_msgSend(*(id *)(a1 + 48), "unsignedIntValue"));

        objc_msgSend(*(id *)(a1 + 56), "isUserVaccinated");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_getDiagnosedVaccineStatusForDifferentialPrivacyWithUserVaccinationStatus:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 32), "differentialPrivacyManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "reportUserDiagnosedVaccineStatus:", v15);

        }
        else
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isSensitiveLoggingAllowed");

          if (v18
            && gLogCategory_ENDaemon <= 90
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
        }

      }
    }
  }
  else
  {
    if (v7 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v22 = (unint64_t)v5;
      LogPrintF_safe();
    }
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "_handleTestVerificationErrors:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  }
  objc_msgSend(*(id *)(a1 + 64), "setDiagnosisKeysPreAuthorization:", 0, v22);
  v20 = *(_QWORD *)(a1 + 64);
  v19 = *(void **)(a1 + 72);
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  obj = *(id *)(v21 + 40);
  objc_msgSend(v19, "saveRegionConfiguration:error:", v20, &obj);
  objc_storeStrong((id *)(v21 + 40), obj);

}

- (void)_handleTestVerificationErrors:(id)a3
{
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;

  v4 = objc_msgSend(a3, "code") - 2;
  if (v4 > 0xB)
  {
    v6 = CFSTR("VERIFICATION_FAILED_GENERIC_ERROR_MESSAGE");
    v5 = CFSTR("VERIFICATION_FAILED_GENERIC_ERROR_TITLE");
  }
  else
  {
    v5 = (const __CFString *)*((_QWORD *)&off_1E87DAE50 + v4);
    v6 = (const __CFString *)*((_QWORD *)&off_1E87DAEB0 + v4);
  }
  -[ENDaemon postGeneralNotificationWithTitle:message:](self, "postGeneralNotificationWithTitle:message:", v5, v6);
}

+ (BOOL)deviceSupportsFaceID
{
  return MGGetBoolAnswer();
}

- (BOOL)isDeviceUnlocked
{
  int v2;
  int v3;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = SBSGetScreenLockStatus();
  v7 = CFSTR("ExtendedDeviceLockState");
  v8[0] = MEMORY[0x1E0C9AAA8];
  objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = MKBGetDeviceLockState();
  return v3 != 6 && (v3 - 3) < 0xFFFFFFFE && v2 == 0;
}

- (void)enqueueScreenUnlockAction:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__ENDaemon_enqueueScreenUnlockAction_withIdentifier___block_invoke;
    block[3] = &unk_1E87DA6F0;
    block[4] = self;
    v11 = v6;
    v10 = v7;
    dispatch_async(dispatchQueue, block);

  }
  else if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

uint64_t __53__ENDaemon_enqueueScreenUnlockAction_withIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueScreenUnlockAction:withIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_enqueueScreenUnlockAction:(id)a3 withIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void (**v10)(void);

  v10 = (void (**)(void))a3;
  v6 = a4;
  if (-[ENDaemon isDeviceUnlocked](self, "isDeviceUnlocked"))
  {
    v10[2]();
  }
  else
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v9 = v6;
      LogPrintF_safe();
    }
    -[ENDaemon screenUnlockPendingActions](self, "screenUnlockPendingActions", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1D17A7E5C](v10);
    objc_msgSend(v7, "setObject:forKey:", v8, v6);

  }
}

- (void)xpcPreAuthorizedDiagnosisKeysAvailable
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_xpcConnections;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "xpcPreAuthorizedDiagnosisKeysAvailable", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)xpcReportStatus
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_xpcConnections;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "xpcStatusChanged", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (ENDaemonDelegate)delegate
{
  return (ENDaemonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)setActiveEntity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSMutableDictionary)appActivities
{
  return self->_appActivities;
}

- (void)setAppActivities:(id)a3
{
  objc_storeStrong((id *)&self->_appActivities, a3);
}

- (BOOL)automaticRegionSwitchEnabled
{
  return self->_automaticRegionSwitchEnabled;
}

- (void)setAutomaticRegionSwitchEnabled:(BOOL)a3
{
  self->_automaticRegionSwitchEnabled = a3;
}

- (BOOL)availabilityAlertDisabled
{
  return self->_availabilityAlertDisabled;
}

- (void)setAvailabilityAlertDisabled:(BOOL)a3
{
  self->_availabilityAlertDisabled = a3;
}

- (int64_t)travelStatus
{
  return self->_travelStatus;
}

- (void)setTravelStatus:(int64_t)a3
{
  self->_travelStatus = a3;
}

- (NSString)btTracingAppID
{
  return self->_btTracingAppID;
}

- (void)setBtTracingAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (ENConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (ENDifferentialPrivacyManager)differentialPrivacyManager
{
  return self->_differentialPrivacyManager;
}

- (void)setDifferentialPrivacyManager:(id)a3
{
  objc_storeStrong((id *)&self->_differentialPrivacyManager, a3);
}

- (OS_dispatch_queue)dispatchExposureDetectionManagingQueue
{
  return self->_dispatchExposureDetectionManagingQueue;
}

- (void)setDispatchExposureDetectionManagingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchExposureDetectionManagingQueue, a3);
}

- (OS_dispatch_queue)dispatchDownloadManagingQueue
{
  return self->_dispatchDownloadManagingQueue;
}

- (void)setDispatchDownloadManagingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchDownloadManagingQueue, a3);
}

- (OS_dispatch_queue)dispatchTestResultManagingQueue
{
  return self->_dispatchTestResultManagingQueue;
}

- (void)setDispatchTestResultManagingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchTestResultManagingQueue, a3);
}

- (ENDownloadManager)downloadManager
{
  return self->_downloadManager;
}

- (void)setDownloadManager:(id)a3
{
  objc_storeStrong((id *)&self->_downloadManager, a3);
}

- (ENExposureDetectionManager)exposureDetectionManager
{
  return self->_exposureDetectionManager;
}

- (void)setExposureDetectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_exposureDetectionManager, a3);
}

- (ENOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void)setOnboardingManager:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingManager, a3);
}

- (BOOL)onboardingFirstTime
{
  return self->_onboardingFirstTime;
}

- (void)setOnboardingFirstTime:(BOOL)a3
{
  self->_onboardingFirstTime = a3;
}

- (int64_t)onboardingLegalConsentLastViewCount
{
  return self->_onboardingLegalConsentLastViewCount;
}

- (void)setOnboardingLegalConsentLastViewCount:(int64_t)a3
{
  self->_onboardingLegalConsentLastViewCount = a3;
}

- (unsigned)onboardingTrigger
{
  return self->_onboardingTrigger;
}

- (void)setOnboardingTrigger:(unsigned int)a3
{
  self->_onboardingTrigger = a3;
}

- (void)setOnboardingRegionTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingRegionTrigger, a3);
}

- (int64_t)overallStatus
{
  return self->_overallStatus;
}

- (void)setOverallStatus:(int64_t)a3
{
  self->_overallStatus = a3;
}

- (NSBackgroundActivityScheduler)persistencePurgeScheduler
{
  return self->_persistencePurgeScheduler;
}

- (void)setPersistencePurgeScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_persistencePurgeScheduler, a3);
}

- (NSMutableOrderedSet)previouslyTrackedApps
{
  return self->_previouslyTrackedApps;
}

- (void)setPreviouslyTrackedApps:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyTrackedApps, a3);
}

- (ENRegionMonitor)regionMonitor
{
  return self->_regionMonitor;
}

- (void)setRegionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_regionMonitor, a3);
}

- (NSMutableDictionary)remoteUISessions
{
  return self->_remoteUISessions;
}

- (void)setRemoteUISessions:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUISessions, a3);
}

- (NSMutableDictionary)screenUnlockPendingActions
{
  return self->_screenUnlockPendingActions;
}

- (void)setScreenUnlockPendingActions:(id)a3
{
  objc_storeStrong((id *)&self->_screenUnlockPendingActions, a3);
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_systemMonitor, a3);
}

- (ENTemporaryExposureKeyManager)temporaryExposureKeyManager
{
  return self->_temporaryExposureKeyManager;
}

- (void)setTemporaryExposureKeyManager:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryExposureKeyManager, a3);
}

- (ENTestResultManager)testResultManager
{
  return self->_testResultManager;
}

- (void)setTestResultManager:(id)a3
{
  objc_storeStrong((id *)&self->_testResultManager, a3);
}

- (ENTextMessageManager)textMessageManager
{
  return self->_textMessageManager;
}

- (void)setTextMessageManager:(id)a3
{
  objc_storeStrong((id *)&self->_textMessageManager, a3);
}

- (ENUserAlert)userAlert
{
  return self->_userAlert;
}

- (void)setUserAlert:(id)a3
{
  objc_storeStrong((id *)&self->_userAlert, a3);
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationCenter, a3);
}

- (BOOL)wasInRestrictedStatus
{
  return self->_wasInRestrictedStatus;
}

- (void)setWasInRestrictedStatus:(BOOL)a3
{
  self->_wasInRestrictedStatus = a3;
}

- (BOOL)wasInDifferentActiveRegion
{
  return self->_wasInDifferentActiveRegion;
}

- (void)setWasInDifferentActiveRegion:(BOOL)a3
{
  self->_wasInDifferentActiveRegion = a3;
}

- (BOOL)monthlySummaryDisabled
{
  return self->_monthlySummaryDisabled;
}

- (ENXPCTimer)monthlyNotificationTimer
{
  return self->_monthlyNotificationTimer;
}

- (void)setMonthlyNotificationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_monthlyNotificationTimer, a3);
}

- (ENXPCTimer)onboardingTimer
{
  return self->_onboardingTimer;
}

- (void)setOnboardingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingTimer, a3);
}

- (BOOL)prefAggressiveScanning
{
  return self->_prefAggressiveScanning;
}

- (void)setPrefAggressiveScanning:(BOOL)a3
{
  self->_prefAggressiveScanning = a3;
}

- (BOOL)prefConfigurationManagerEnabled
{
  return self->_prefConfigurationManagerEnabled;
}

- (void)setPrefConfigurationManagerEnabled:(BOOL)a3
{
  self->_prefConfigurationManagerEnabled = a3;
}

- (double)prefDatabasePurgeInterval
{
  return self->_prefDatabasePurgeInterval;
}

- (void)setPrefDatabasePurgeInterval:(double)a3
{
  self->_prefDatabasePurgeInterval = a3;
}

- (BOOL)prefDeveloperServerConfiguration
{
  return self->_prefDeveloperServerConfiguration;
}

- (void)setPrefDeveloperServerConfiguration:(BOOL)a3
{
  self->_prefDeveloperServerConfiguration = a3;
}

- (BOOL)prefEnableNKD
{
  return self->_prefEnableNKD;
}

- (void)setPrefEnableNKD:(BOOL)a3
{
  self->_prefEnableNKD = a3;
}

- (double)prefServerConfigurationRefreshInterval
{
  return self->_prefServerConfigurationRefreshInterval;
}

- (void)setPrefServerConfigurationRefreshInterval:(double)a3
{
  self->_prefServerConfigurationRefreshInterval = a3;
}

- (void)setPrefDifferentialPrivacyConsent:(int64_t)a3
{
  self->_prefDifferentialPrivacyConsent = a3;
}

- (void)setPrefEnabled:(BOOL)a3
{
  self->_prefEnabled = a3;
}

- (BOOL)prefLoggingSensitive
{
  return self->_prefLoggingSensitive;
}

- (void)setPrefLoggingSensitive:(BOOL)a3
{
  self->_prefLoggingSensitive = a3;
}

- (BOOL)prefLoggingRPI
{
  return self->_prefLoggingRPI;
}

- (void)setPrefLoggingRPI:(BOOL)a3
{
  self->_prefLoggingRPI = a3;
}

- (void)setPrefPaused:(BOOL)a3
{
  self->_prefPaused = a3;
}

- (BOOL)prefNetworkProxyEnabled
{
  return self->_prefNetworkProxyEnabled;
}

- (void)setPrefNetworkProxyEnabled:(BOOL)a3
{
  self->_prefNetworkProxyEnabled = a3;
}

- (unsigned)prefRateLimitMaxAPICount
{
  return self->_prefRateLimitMaxAPICount;
}

- (void)setPrefRateLimitMaxAPICount:(unsigned int)a3
{
  self->_prefRateLimitMaxAPICount = a3;
}

- (unsigned)prefRateLimitMaxAPICountV2
{
  return self->_prefRateLimitMaxAPICountV2;
}

- (void)setPrefRateLimitMaxAPICountV2:(unsigned int)a3
{
  self->_prefRateLimitMaxAPICountV2 = a3;
}

- (NSString)prefRegionIdentifierOverride
{
  return self->_prefRegionIdentifierOverride;
}

- (void)setPrefRegionIdentifierOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (BOOL)prefRegionMonitorTestMode
{
  return self->_prefRegionMonitorTestMode;
}

- (void)setPrefRegionMonitorTestMode:(BOOL)a3
{
  self->_prefRegionMonitorTestMode = a3;
}

- (BOOL)prefServerForceDisable
{
  return self->_prefServerForceDisable;
}

- (void)setPrefServerForceDisable:(BOOL)a3
{
  self->_prefServerForceDisable = a3;
}

- (BOOL)prefSkipExposureWindowShuffling
{
  return self->_prefSkipExposureWindowShuffling;
}

- (void)setPrefSkipExposureWindowShuffling:(BOOL)a3
{
  self->_prefSkipExposureWindowShuffling = a3;
}

- (void)setPrefSkipFileSigning:(BOOL)a3
{
  self->_prefSkipFileSigning = a3;
}

- (BOOL)prefStoreDemoMode
{
  return self->_prefStoreDemoMode;
}

- (void)setPrefStoreDemoMode:(BOOL)a3
{
  self->_prefStoreDemoMode = a3;
}

- (BOOL)prefTCCAllowWithoutApps
{
  return self->_prefTCCAllowWithoutApps;
}

- (void)setPrefTCCAllowWithoutApps:(BOOL)a3
{
  self->_prefTCCAllowWithoutApps = a3;
}

- (unsigned)usageUserEnabled
{
  return self->_usageUserEnabled;
}

- (void)setUsageUserEnabled:(unsigned int)a3
{
  self->_usageUserEnabled = a3;
}

- (unsigned)usageUserDisabled
{
  return self->_usageUserDisabled;
}

- (void)setUsageUserDisabled:(unsigned int)a3
{
  self->_usageUserDisabled = a3;
}

- (unsigned)usageUserPaused
{
  return self->_usageUserPaused;
}

- (void)setUsageUserPaused:(unsigned int)a3
{
  self->_usageUserPaused = a3;
}

- (unsigned)usageUserUnpaused
{
  return self->_usageUserUnpaused;
}

- (void)setUsageUserUnpaused:(unsigned int)a3
{
  self->_usageUserUnpaused = a3;
}

- (unsigned)usageUserAlertShare
{
  return self->_usageUserAlertShare;
}

- (void)setUsageUserAlertShare:(unsigned int)a3
{
  self->_usageUserAlertShare = a3;
}

- (unsigned)usageUserAlertDontShare
{
  return self->_usageUserAlertDontShare;
}

- (void)setUsageUserAlertDontShare:(unsigned int)a3
{
  self->_usageUserAlertDontShare = a3;
}

- (unsigned)usageUserAlertReset
{
  return self->_usageUserAlertReset;
}

- (void)setUsageUserAlertReset:(unsigned int)a3
{
  self->_usageUserAlertReset = a3;
}

- (unsigned)usageUserAlertDontReset
{
  return self->_usageUserAlertDontReset;
}

- (void)setUsageUserAlertDontReset:(unsigned int)a3
{
  self->_usageUserAlertDontReset = a3;
}

- (unsigned)usageGetDiagnosisKeys
{
  return self->_usageGetDiagnosisKeys;
}

- (void)setUsageGetDiagnosisKeys:(unsigned int)a3
{
  self->_usageGetDiagnosisKeys = a3;
}

- (unsigned)usageResetAllData
{
  return self->_usageResetAllData;
}

- (void)setUsageResetAllData:(unsigned int)a3
{
  self->_usageResetAllData = a3;
}

- (unsigned)usageExposureDetectFileActivate
{
  return self->_usageExposureDetectFileActivate;
}

- (void)setUsageExposureDetectFileActivate:(unsigned int)a3
{
  self->_usageExposureDetectFileActivate = a3;
}

- (unsigned)usageExposureDetectFileAddKeys
{
  return self->_usageExposureDetectFileAddKeys;
}

- (void)setUsageExposureDetectFileAddKeys:(unsigned int)a3
{
  self->_usageExposureDetectFileAddKeys = a3;
}

- (unsigned)usageExposureDetectFileFinish
{
  return self->_usageExposureDetectFileFinish;
}

- (void)setUsageExposureDetectFileFinish:(unsigned int)a3
{
  self->_usageExposureDetectFileFinish = a3;
}

- (unsigned)usageExposureDetectFileGetExposures
{
  return self->_usageExposureDetectFileGetExposures;
}

- (void)setUsageExposureDetectFileGetExposures:(unsigned int)a3
{
  self->_usageExposureDetectFileGetExposures = a3;
}

- (unsigned)usageExposureDetectFileGetExposureWindows
{
  return self->_usageExposureDetectFileGetExposureWindows;
}

- (void)setUsageExposureDetectFileGetExposureWindows:(unsigned int)a3
{
  self->_usageExposureDetectFileGetExposureWindows = a3;
}

- (SBSRemoteAlertHandle)buddyAlertHandle
{
  return self->_buddyAlertHandle;
}

- (void)setBuddyAlertHandle:(id)a3
{
  objc_storeStrong((id *)&self->_buddyAlertHandle, a3);
}

- (SFClient)sharingClient
{
  return self->_sharingClient;
}

- (void)setSharingClient:(id)a3
{
  objc_storeStrong((id *)&self->_sharingClient, a3);
}

- (PrivacyProxyServiceStatus)networkProxyStatus
{
  return self->_networkProxyStatus;
}

- (void)setNetworkProxyStatus:(id)a3
{
  objc_storeStrong((id *)&self->_networkProxyStatus, a3);
}

- (unint64_t)networkProxyTraffic
{
  return self->_networkProxyTraffic;
}

- (void)setNetworkProxyTraffic:(unint64_t)a3
{
  self->_networkProxyTraffic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkProxyStatus, 0);
  objc_storeStrong((id *)&self->_sharingClient, 0);
  objc_storeStrong((id *)&self->_buddyAlertHandle, 0);
  objc_storeStrong((id *)&self->_prefRegionIdentifierOverride, 0);
  objc_storeStrong((id *)&self->_onboardingTimer, 0);
  objc_storeStrong((id *)&self->_monthlyNotificationTimer, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_userAlert, 0);
  objc_storeStrong((id *)&self->_textMessageManager, 0);
  objc_storeStrong((id *)&self->_testResultManager, 0);
  objc_storeStrong((id *)&self->_temporaryExposureKeyManager, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_screenUnlockPendingActions, 0);
  objc_storeStrong((id *)&self->_remoteUISessions, 0);
  objc_storeStrong((id *)&self->_regionMonitor, 0);
  objc_storeStrong((id *)&self->_previouslyTrackedApps, 0);
  objc_storeStrong((id *)&self->_persistencePurgeScheduler, 0);
  objc_storeStrong((id *)&self->_onboardingRegionTrigger, 0);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_exposureDetectionManager, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_dispatchTestResultManagingQueue, 0);
  objc_storeStrong((id *)&self->_dispatchDownloadManagingQueue, 0);
  objc_storeStrong((id *)&self->_dispatchExposureDetectionManagingQueue, 0);
  objc_storeStrong((id *)&self->_differentialPrivacyManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_btTracingAppID, 0);
  objc_storeStrong((id *)&self->_appActivities, 0);
  objc_storeStrong((id *)&self->_activeEntity, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_pauseTimer, 0);
  objc_storeStrong((id *)&self->_exposureDatabase, 0);
  objc_storeStrong((id *)&self->_applicationObserver, 0);
}

@end
