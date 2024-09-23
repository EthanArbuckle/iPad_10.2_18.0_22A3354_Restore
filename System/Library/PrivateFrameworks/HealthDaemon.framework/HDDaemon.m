@implementation HDDaemon

- (_HKBehavior)behavior
{
  return self->_behavior;
}

- (HDQueryManager)queryManager
{
  return self->_queryManager;
}

- (HDPrimaryProfile)primaryProfile
{
  return self->_primaryProfile;
}

- (HDProfileManager)profileManager
{
  HDProfileManager *profileManager;
  void *v6;

  profileManager = self->_profileManager;
  if (!profileManager)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDaemon.m"), 1084, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_profileManager != nil"));

    profileManager = self->_profileManager;
  }
  return profileManager;
}

- (HDProcessStateManager)processStateManager
{
  HDProcessStateManager *processStateManager;
  void *v6;

  processStateManager = self->_processStateManager;
  if (!processStateManager)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDaemon.m"), 1070, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_processStateManager != nil"));

    processStateManager = self->_processStateManager;
  }
  return processStateManager;
}

- (HDPluginManager)pluginManager
{
  HDPluginManager *pluginManager;
  void *v6;

  pluginManager = self->_pluginManager;
  if (!pluginManager)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDaemon.m"), 1075, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_pluginManager != nil"));

    pluginManager = self->_pluginManager;
  }
  return pluginManager;
}

- (HDNanoAlertSuppressionService)alertSuppressionService
{
  return self->_alertSuppressionService;
}

- (void)performBlockWithPowerAssertionIdentifier:(id)a3 transactionName:(id)a4 powerAssertionInterval:(double)a5 block:(id)a6
{
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  if (v18)
  {
    if (v11)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDaemon.m"), 918, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transactionName != nil"));

    if (v12)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDaemon.m"), 919, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDaemon.m"), 917, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("powerAssertionIdentifier != nil"));

  if (!v11)
    goto LABEL_6;
LABEL_3:
  if (!v12)
    goto LABEL_7;
LABEL_4:
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", self, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDPowerAssertion powerAssertionWithIdentifier:timeout:timeoutHandler:](HDPowerAssertion, "powerAssertionWithIdentifier:timeout:timeoutHandler:", v18, 0, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12);
  objc_msgSend(v14, "invalidate");
  objc_msgSend(v13, "invalidate");

}

uint64_t __38__HDDaemon__setupMemoryWarningHandler__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (HDBackgroundTaskScheduler)backgroundTaskScheduler
{
  HDBackgroundTaskScheduler *backgroundTaskScheduler;
  void *v6;

  backgroundTaskScheduler = self->_backgroundTaskScheduler;
  if (!backgroundTaskScheduler)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDaemon.m"), 1057, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_backgroundTaskScheduler != nil"));

    backgroundTaskScheduler = self->_backgroundTaskScheduler;
  }
  return backgroundTaskScheduler;
}

- (void)registerForDaemonReady:(id)a3
{
  -[HDDaemon registerDaemonReadyObserver:queue:](self, "registerDaemonReadyObserver:queue:", a3, 0);
}

- (void)setAlertSuppressionService:(id)a3
{
  objc_storeStrong((id *)&self->_alertSuppressionService, a3);
}

- (NSObject)_setupSignal:(void *)a3 handler:
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD handler[4];
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = dispatch_source_create(MEMORY[0x1E0C80DC0], a2, 0, *(dispatch_queue_t *)(a1 + 32));
  if (v6)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __33__HDDaemon__setupSignal_handler___block_invoke;
    handler[3] = &unk_1E6CE7DE0;
    v10 = v5;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    signal(a2, (void (__cdecl *)(int))1);

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v12 = a2;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Could not set up signal handler for %d", buf, 8u);
    }
  }

  return v6;
}

void __38__HDDaemon__setupMemoryWarningHandler__block_invoke(uint64_t a1, double *a2, uint64_t a3)
{
  double Current;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  if (Current >= *a2 + 1.0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = a3;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
    }
    *a2 = Current;
  }
}

- (HDContentProtectionManager)contentProtectionManager
{
  HDContentProtectionManager *contentProtectionManager;
  void *v6;

  contentProtectionManager = self->_contentProtectionManager;
  if (!contentProtectionManager)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDaemon.m"), 1052, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_contentProtectionManager != nil"));

    contentProtectionManager = self->_contentProtectionManager;
  }
  return contentProtectionManager;
}

- (id)nanoPairedDeviceRegistry
{
  return (id)objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
}

- (void)registerForLaunchNotification:(const char *)a3
{
  id v4;

  if (self)
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "Notification", a3);
    xpc_set_event();

  }
}

- (HDDaemonTester)daemonTester
{
  return (HDDaemonTester *)objc_loadWeakRetained((id *)&self->_daemonTester);
}

- (id)IDSServiceWithIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D34358];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithService:", v4);

  return v5;
}

- (id)taskServerClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  v34 = objc_opt_class();
  v35 = objc_opt_class();
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  v42 = objc_opt_class();
  v43 = objc_opt_class();
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  v46 = objc_opt_class();
  v47 = objc_opt_class();
  v48 = objc_opt_class();
  v49 = objc_opt_class();
  v50 = objc_opt_class();
  v51 = objc_opt_class();
  v52 = objc_opt_class();
  v53 = objc_opt_class();
  v54 = objc_opt_class();
  v55 = objc_opt_class();
  v56 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 51);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDQueryServer builtInQueryServerClasses](HDQueryServer, "builtInQueryServerClasses", v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v53,
    v54,
    v55);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pairedSyncCoordinatorWithServiceName:(id)a3
{
  return +[HDPairedSyncManager syncCoordinatorWithServiceName:](HDPairedSyncManager, "syncCoordinatorWithServiceName:", a3);
}

- (id)healthDomainAccessorWithPairedDevice:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D51610];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDomain:pairedDevice:", CFSTR("com.apple.healthd"), v4);

  return v5;
}

- (id)healthLiteUserDefaultsDomain
{
  HDKeyValueDomain *v3;
  void *v4;
  HDKeyValueDomain *v5;

  v3 = [HDKeyValueDomain alloc];
  -[HDDaemon primaryProfile](self, "primaryProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v3, "initWithCategory:domainName:profile:", 105, CFSTR("HealthLite"), v4);

  return v5;
}

- (HDDaemon)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDDaemon)initWithContainerDirectoryPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HDDaemon *v7;

  v4 = a3;
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Health"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("MedicalID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HDDaemon initWithHealthDirectoryPath:medicalIDDirectoryPath:](self, "initWithHealthDirectoryPath:medicalIDDirectoryPath:", v5, v6);
  return v7;
}

- (HDDaemon)initWithHealthDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4
{
  id v6;
  id v7;
  HDDaemon *v8;
  HDDaemon *v9;
  uint64_t v10;
  _HKBehavior *behavior;
  uint64_t v12;
  OS_dispatch_queue *queue;
  NSMutableArray *v14;
  NSMutableArray *daemonReadyBlocks;
  NSMutableArray *v16;
  NSMutableArray *daemonActivatedBlocks;
  uint64_t v18;
  NSString *healthDirectoryPath;
  uint64_t v20;
  NSString *medicalIDDirectoryPath;
  uint64_t v22;
  HDDaemonConnectionManager *connectionManager;
  HDBackgroundObservationServerExtensionManager *v24;
  HDBackgroundObservationServerExtensionManager *extensionManager;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HDDaemon;
  v8 = -[HDDaemon init](&v27, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isTerminating = 0;
    atomic_store(0, (unsigned __int8 *)&v8->_hasCalledExit);
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v10 = objc_claimAutoreleasedReturnValue();
    behavior = v9->_behavior;
    v9->_behavior = (_HKBehavior *)v10;

    HKCreateSerialDispatchQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    daemonReadyBlocks = v9->_daemonReadyBlocks;
    v9->_daemonReadyBlocks = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    daemonActivatedBlocks = v9->_daemonActivatedBlocks;
    v9->_daemonActivatedBlocks = v16;

    v18 = objc_msgSend(v6, "copy");
    healthDirectoryPath = v9->_healthDirectoryPath;
    v9->_healthDirectoryPath = (NSString *)v18;

    v20 = objc_msgSend(v7, "copy");
    medicalIDDirectoryPath = v9->_medicalIDDirectoryPath;
    v9->_medicalIDDirectoryPath = (NSString *)v20;

    v9->_daemonReadyLock._os_unfair_lock_opaque = 0;
    v9->_protectedResourceStoreProvidersLock._os_unfair_lock_opaque = 0;
    v22 = -[HDDaemon _newConnectionManager](v9, "_newConnectionManager");
    connectionManager = v9->_connectionManager;
    v9->_connectionManager = (HDDaemonConnectionManager *)v22;

    v24 = objc_alloc_init(HDBackgroundObservationServerExtensionManager);
    extensionManager = v9->_extensionManager;
    v9->_extensionManager = v24;

  }
  return v9;
}

- (void)start
{
  atomic_flag *p_didStart;
  unsigned __int8 v5;
  void *v6;
  NSString *healthDirectoryPath;
  char v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  HDPostInstallUpdateManager *v12;
  HDPostInstallUpdateManager *postInstallUpdateManager;
  HDPluginManager *v14;
  HDPluginManager *pluginManager;
  HDCacheDeleteCoordinator *v16;
  HDCacheDeleteCoordinator *cacheDeleteCoordinator;
  HDContentProtectionManager *v18;
  HDContentProtectionManager *contentProtectionManager;
  HDProcessStateManager *v20;
  HDProcessStateManager *processStateManager;
  HDBackgroundTaskScheduler *v22;
  HDBackgroundTaskScheduler *backgroundTaskScheduler;
  HDNotificationInstructionSyncService *v24;
  HDNotificationInstructionSyncService *notificationInstructionSyncService;
  HDHealthAppNewDeviceNotificationService *v26;
  HDHealthAppNewDeviceNotificationService *healthAppNewDeviceNotificationService;
  HDPairedDeviceCapabilityProviding *v28;
  HDPairedDeviceCapabilityProviding *nanoRegistryDeviceCapabilityProvider;
  HDOTAFeatureAvailabilityManager *v30;
  HDOTAFeatureAvailabilityManager *OTAFeatureAvailabilityManager;
  HDXPCAlarmScheduler *v32;
  HDXPCAlarmScheduler *alarmScheduler;
  HDMaintenanceWorkCoordinator *v34;
  HDMaintenanceWorkCoordinator *maintenanceWorkCoordinator;
  HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource *v36;
  HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource *featureAvailabilityRequirementSatisfactionOverridesDataSource;
  HKWatchLowPowerModeDataSource *v38;
  HKWatchLowPowerModeDataSource *watchLowPowerModeDataSource;
  HKWristDetectionSettingManager *v40;
  HKWristDetectionSettingManager *wristDetectionSettingManager;
  HDPrimaryProfile *v42;
  HDPrimaryProfile *primaryProfile;
  HDProfileManager *v44;
  HDProfileManager *profileManager;
  HDCloudSyncCoordinator *v46;
  HDCloudSyncCoordinator *cloudSyncCoordinator;
  HDDatabasePruningCoordinator *v48;
  HDDatabasePruningCoordinator *databasePruningCoordinator;
  HDAnalyticsSubmissionCoordinator *v50;
  HDAnalyticsSubmissionCoordinator *analyticsSubmissionCoordinator;
  HDAutoBugCaptureReporter *v52;
  HDAutoBugCaptureReporter *autoBugCaptureReporter;
  HDOntologyBackingStore *v54;
  HDOntologyBackingStore *ontologyBackingStore;
  HDOntologyConfigurationProvider *v56;
  HDOntologyConfigurationProvider *ontologyConfigurationProvider;
  HDOntologyUpdateCoordinator *v58;
  HDOntologyUpdateCoordinator *ontologyUpdateCoordinator;
  HDDevicePowerMonitor *v60;
  HDDevicePowerMonitor *devicePowerMonitor;
  HDQueryManager *v62;
  HDQueryManager *queryManager;
  HDTaskServerRegistry *v64;
  HDTaskServerRegistry *taskServerRegistry;
  HDUserDomainConceptEntityRegistry *v66;
  HDUserDomainConceptEntityRegistry *userDomainConceptEntityRegistry;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  HDTaskServerRegistry *v76;
  BOOL v77;
  id v78;
  NSObject *v79;
  NSDictionary *v80;
  NSDictionary *daemonExtensionsByIdentifier;
  void *v82;
  HDXPCEventManager *v83;
  HDXPCEventManager *xpcEventManager;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  id WeakRetained;
  NSMutableArray *v94;
  NSMutableArray *daemonReadyBlocks;
  os_log_t v96;
  NSObject *v97;
  uint64_t v98;
  NSObject *v99;
  _BOOL4 v100;
  NSObject *v101;
  uint64_t v102;
  NSMutableArray *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t i;
  NSMutableArray *v107;
  NSMutableArray *daemonActivatedBlocks;
  os_log_t v109;
  NSObject *v110;
  uint64_t v111;
  NSMutableArray *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t j;
  NSObject *v116;
  _BOOL4 v117;
  NSObject *v118;
  uint64_t v119;
  NSObject *queue;
  id v121;
  dispatch_source_t v122;
  void *v123;
  dispatch_source_t v124;
  void *v125;
  dispatch_source_t v126;
  void *v127;
  void *v128;
  NSObject *v129;
  NSString *v130;
  void *v131;
  id v132;
  void *v133;
  _QWORD handler[4];
  id v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  id location[2];
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  HDDaemon *v151;
  id from;
  uint64_t v153;
  void *v154;
  void *v155;
  id v156[12];
  _BYTE buf[24];
  void *v158;
  id v159[16];

  v159[13] = *(id *)MEMORY[0x1E0C80C00];
  p_didStart = &self->_didStart;
  do
    v5 = __ldaxr((unsigned __int8 *)p_didStart);
  while (__stlxr(1u, (unsigned __int8 *)p_didStart));
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDaemon.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alreadyStarted == false"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    healthDirectoryPath = self->_healthDirectoryPath;
    v141 = 0;
    v8 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", healthDirectoryPath, 1, 0, &v141);
    v132 = v141;

    v9 = (os_log_t *)MEMORY[0x1E0CB52C0];
    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      v10 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        v130 = self->_healthDirectoryPath;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v130;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v132;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Failed to create \"%{public}@\": %{public}@", buf, 0x16u);
      }
    }
    if ((-[_HKBehavior isDeviceSupported](self->_behavior, "isDeviceSupported") & 1) == 0)
    {
      _HKInitializeLogging();
      v11 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "Device is unsupported", buf, 2u);
      }
    }
    v12 = -[HDPostInstallUpdateManager initWithDaemon:]([HDPostInstallUpdateManager alloc], "initWithDaemon:", self);
    postInstallUpdateManager = self->_postInstallUpdateManager;
    self->_postInstallUpdateManager = v12;

    if (-[_HKBehavior isDeviceSupported](self->_behavior, "isDeviceSupported"))
    {
      v14 = -[HDDaemon _newPluginManager](self, "_newPluginManager");
      pluginManager = self->_pluginManager;
      self->_pluginManager = v14;

      v16 = -[HDDaemon _newCacheDeleteCoordinator](self, "_newCacheDeleteCoordinator");
      cacheDeleteCoordinator = self->_cacheDeleteCoordinator;
      self->_cacheDeleteCoordinator = v16;

      v18 = -[HDDaemon _newContentProtectionManager](self, "_newContentProtectionManager");
      contentProtectionManager = self->_contentProtectionManager;
      self->_contentProtectionManager = v18;

      v20 = -[HDDaemon _newProcessStateManager](self, "_newProcessStateManager");
      processStateManager = self->_processStateManager;
      self->_processStateManager = v20;

      v22 = -[HDDaemon _newBackgroundTaskScheduler](self, "_newBackgroundTaskScheduler");
      backgroundTaskScheduler = self->_backgroundTaskScheduler;
      self->_backgroundTaskScheduler = v22;

      v24 = -[HDDaemon _newNotificationInstructionSyncService](self, "_newNotificationInstructionSyncService");
      notificationInstructionSyncService = self->_notificationInstructionSyncService;
      self->_notificationInstructionSyncService = v24;

      if (-[_HKBehavior healthAppSupportedOnDevice](self->_behavior, "healthAppSupportedOnDevice"))
      {
        v26 = -[HDDaemon _newHealthAppNewDeviceNotificationService](self, "_newHealthAppNewDeviceNotificationService");
        healthAppNewDeviceNotificationService = self->_healthAppNewDeviceNotificationService;
        self->_healthAppNewDeviceNotificationService = v26;

      }
      v28 = -[HDDaemon _newNanoRegistryDeviceCapabilityProvider](self, "_newNanoRegistryDeviceCapabilityProvider");
      nanoRegistryDeviceCapabilityProvider = self->_nanoRegistryDeviceCapabilityProvider;
      self->_nanoRegistryDeviceCapabilityProvider = v28;

      v30 = -[HDDaemon _newOTAFeatureAvailabilityManager](self, "_newOTAFeatureAvailabilityManager");
      OTAFeatureAvailabilityManager = self->_OTAFeatureAvailabilityManager;
      self->_OTAFeatureAvailabilityManager = v30;

      v32 = (HDXPCAlarmScheduler *)objc_alloc_init(MEMORY[0x1E0D298E0]);
      alarmScheduler = self->_alarmScheduler;
      self->_alarmScheduler = v32;

      v34 = -[HDDaemon _newMaintenanceWorkCoordinator](self, "_newMaintenanceWorkCoordinator");
      maintenanceWorkCoordinator = self->_maintenanceWorkCoordinator;
      self->_maintenanceWorkCoordinator = v34;

      objc_msgSend(MEMORY[0x1E0CB66E8], "requirementSatisfactionOverridesDataSource");
      v36 = (HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource *)objc_claimAutoreleasedReturnValue();
      featureAvailabilityRequirementSatisfactionOverridesDataSource = self->_featureAvailabilityRequirementSatisfactionOverridesDataSource;
      self->_featureAvailabilityRequirementSatisfactionOverridesDataSource = v36;

      v38 = (HKWatchLowPowerModeDataSource *)objc_alloc_init(MEMORY[0x1E0CB6DC8]);
      watchLowPowerModeDataSource = self->_watchLowPowerModeDataSource;
      self->_watchLowPowerModeDataSource = v38;

      v40 = (HKWristDetectionSettingManager *)objc_alloc_init(MEMORY[0x1E0CB6ED8]);
      wristDetectionSettingManager = self->_wristDetectionSettingManager;
      self->_wristDetectionSettingManager = v40;

      v42 = -[HDDaemon _newPrimaryProfile](self, "_newPrimaryProfile");
      primaryProfile = self->_primaryProfile;
      self->_primaryProfile = v42;

      -[HDDaemon unitTest_didCreateProfile:](self, "unitTest_didCreateProfile:", self->_primaryProfile);
      v44 = -[HDDaemon _newProfileManager](self, "_newProfileManager");
      profileManager = self->_profileManager;
      self->_profileManager = v44;

      -[HDProfileManager addProfile:](self->_profileManager, "addProfile:", self->_primaryProfile);
      v46 = -[HDDaemon _newCloudSyncCoordinator](self, "_newCloudSyncCoordinator");
      cloudSyncCoordinator = self->_cloudSyncCoordinator;
      self->_cloudSyncCoordinator = v46;

      v48 = -[HDDaemon _newDatabasePruningCoordinator](self, "_newDatabasePruningCoordinator");
      databasePruningCoordinator = self->_databasePruningCoordinator;
      self->_databasePruningCoordinator = v48;

      v50 = -[HDDaemon _newAnalyticsSubmissionCoordinator](self, "_newAnalyticsSubmissionCoordinator");
      analyticsSubmissionCoordinator = self->_analyticsSubmissionCoordinator;
      self->_analyticsSubmissionCoordinator = v50;

      v52 = -[HDDaemon _newAutoBugCaptureReporter](self, "_newAutoBugCaptureReporter");
      autoBugCaptureReporter = self->_autoBugCaptureReporter;
      self->_autoBugCaptureReporter = v52;

      if (-[_HKBehavior supportsOntology](self->_behavior, "supportsOntology"))
      {
        v54 = -[HDOntologyBackingStore initWithDaemon:]([HDOntologyBackingStore alloc], "initWithDaemon:", self);
        ontologyBackingStore = self->_ontologyBackingStore;
        self->_ontologyBackingStore = v54;

        v56 = objc_alloc_init(HDOntologyConfigurationProvider);
        ontologyConfigurationProvider = self->_ontologyConfigurationProvider;
        self->_ontologyConfigurationProvider = v56;

        v58 = -[HDOntologyUpdateCoordinator initWithDaemon:]([HDOntologyUpdateCoordinator alloc], "initWithDaemon:", self);
        ontologyUpdateCoordinator = self->_ontologyUpdateCoordinator;
        self->_ontologyUpdateCoordinator = v58;

      }
      v60 = -[HDDaemon _newDevicePowerMonitor](self, "_newDevicePowerMonitor");
      devicePowerMonitor = self->_devicePowerMonitor;
      self->_devicePowerMonitor = v60;

      v62 = -[HDQueryManager initWithDaemon:]([HDQueryManager alloc], "initWithDaemon:", self);
      queryManager = self->_queryManager;
      self->_queryManager = v62;

      v64 = -[HDDaemon _newTaskServerRegistry](self, "_newTaskServerRegistry");
      taskServerRegistry = self->_taskServerRegistry;
      self->_taskServerRegistry = v64;

      +[HDUserDomainConceptEntityRegistry registryWithDaemon:setSharedInstance:](HDUserDomainConceptEntityRegistry, "registryWithDaemon:setSharedInstance:", self, 1);
      v66 = (HDUserDomainConceptEntityRegistry *)objc_claimAutoreleasedReturnValue();
      userDomainConceptEntityRegistry = self->_userDomainConceptEntityRegistry;
      self->_userDomainConceptEntityRegistry = v66;

      v151 = self;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v151, 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDPluginManager pluginsConformingToProtocol:](self->_pluginManager, "pluginsConformingToProtocol:", &unk_1EF1ADC88);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "allValues");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "arrayByAddingObjectsFromArray:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      v71 = v70;
      v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v137, v150, 16);
      if (v72)
      {
        v73 = *(_QWORD *)v138;
        do
        {
          v74 = 0;
          do
          {
            if (*(_QWORD *)v138 != v73)
              objc_enumerationMutation(v71);
            v75 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * v74);
            v76 = self->_taskServerRegistry;
            v136 = 0;
            v77 = -[HDTaskServerRegistry registerTaskServerClassesWithProvider:error:](v76, "registerTaskServerClassesWithProvider:error:", v75, &v136);
            v78 = v136;
            if (!v77)
            {
              _HKInitializeLogging();
              v79 = *v9;
              if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v75;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v78;
                _os_log_error_impl(&dword_1B7802000, v79, OS_LOG_TYPE_ERROR, "Failed to register task server classes from provider %{public}@: %{public}@", buf, 0x16u);
              }
            }

            ++v74;
          }
          while (v72 != v74);
          v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v137, v150, 16);
        }
        while (v72);
      }

      -[HDPluginManager createExtensionsForDaemon:](self->_pluginManager, "createExtensionsForDaemon:", self);
      v80 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      daemonExtensionsByIdentifier = self->_daemonExtensionsByIdentifier;
      self->_daemonExtensionsByIdentifier = v80;

      if (!_HDIsUnitTesting)
      {
        from = CFSTR("UserAssignedDeviceName");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &from, 1);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(location, self);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __41__HDDaemon__registerForDeviceNameChanges__block_invoke;
        v158 = &unk_1E6CF2B78;
        objc_copyWeak(v159, location);
        self->_deviceNameChangesToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();
        objc_destroyWeak(v159);
        objc_destroyWeak(location);

      }
    }
    else
    {
      +[HDCloudSyncPeriodicActivityScheduler registerDisabledPeriodicActivitiesForUnsupportedDaemon:](HDCloudSyncPeriodicActivityScheduler, "registerDisabledPeriodicActivitiesForUnsupportedDaemon:", self);
      +[HDDatabasePruningCoordinator registerDisabledPeriodicActivitiesForUnsupportedDaemon:](HDDatabasePruningCoordinator, "registerDisabledPeriodicActivitiesForUnsupportedDaemon:", self);
      self->_healthdStateHandler = HDAddStateHandler((uint64_t)self->_queue, CFSTR("Sensitive Logging Status"), &__block_literal_global_64);
    }
    v83 = objc_alloc_init(HDXPCEventManager);
    xpcEventManager = self->_xpcEventManager;
    self->_xpcEventManager = v83;

    objc_initWeak(location, self);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __32__HDDaemon__setUpSignalHandlers__block_invoke;
    v158 = &unk_1E6CECE78;
    objc_copyWeak(v159, location);
    -[HDDaemon _setupSignal:handler:]((uint64_t)self, 0xFu, buf);
    v85 = objc_claimAutoreleasedReturnValue();
    v86 = (void *)_MergedGlobals_202;
    _MergedGlobals_202 = v85;

    -[HDDaemon _setupSignal:handler:]((uint64_t)self, 0x1Eu, &__block_literal_global_284_0);
    v87 = objc_claimAutoreleasedReturnValue();
    v88 = (void *)qword_1ED552258;
    qword_1ED552258 = v87;

    from = (id)MEMORY[0x1E0C809B0];
    v153 = 3221225472;
    v154 = __32__HDDaemon__setUpSignalHandlers__block_invoke_3;
    v155 = &unk_1E6CECE78;
    objc_copyWeak(v156, location);
    -[HDDaemon _setupSignal:handler:]((uint64_t)self, 0x1Fu, &from);
    v89 = objc_claimAutoreleasedReturnValue();
    v90 = (void *)qword_1ED552260;
    qword_1ED552260 = v89;

    objc_destroyWeak(v156);
    objc_destroyWeak(v159);
    objc_destroyWeak(location);
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObserver:", self);

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addObject:", self);

    os_unfair_lock_lock(&self->_daemonReadyLock);
    self->_daemonReady = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_daemonTester);
    v94 = self->_daemonReadyBlocks;
    daemonReadyBlocks = self->_daemonReadyBlocks;
    self->_daemonReadyBlocks = 0;

    os_unfair_lock_unlock(&self->_daemonReadyLock);
    _HKInitializeLogging();
    v96 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v97 = v96;
      v98 = -[NSMutableArray count](v94, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v98;
      _os_log_impl(&dword_1B7802000, v97, OS_LOG_TYPE_DEFAULT, "Notify (%lu) Daemon Ready Observers", buf, 0xCu);

    }
    _HKInitializeLogging();
    _HKLogPersistedSignposts();
    v99 = objc_claimAutoreleasedReturnValue();
    v100 = os_signpost_enabled(v99);

    if (v100)
    {
      _HKLogPersistedSignposts();
      v101 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v101))
      {
        v102 = -[NSMutableArray count](v94, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v102;
        _os_signpost_emit_with_name_impl(&dword_1B7802000, v101, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Notify Daemon Ready Observers", "count=%lu", buf, 0xCu);
      }

    }
    v144 = 0u;
    v145 = 0u;
    v142 = 0u;
    v143 = 0u;
    v103 = v94;
    v104 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v103, "countByEnumeratingWithState:objects:count:", &v142, &from, 16);
    if (v104)
    {
      v105 = *(_QWORD *)v143;
      do
      {
        for (i = 0; i != v104; ++i)
        {
          if (*(_QWORD *)v143 != v105)
            objc_enumerationMutation(v103);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * i) + 16))();
        }
        v104 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v103, "countByEnumeratingWithState:objects:count:", &v142, &from, 16);
      }
      while (v104);
    }

    os_unfair_lock_lock(&self->_daemonReadyLock);
    v107 = self->_daemonActivatedBlocks;
    daemonActivatedBlocks = self->_daemonActivatedBlocks;
    self->_daemonActivatedBlocks = 0;

    os_unfair_lock_unlock(&self->_daemonReadyLock);
    _HKInitializeLogging();
    v109 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v110 = v109;
      v111 = -[NSMutableArray count](v107, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v111;
      _os_log_impl(&dword_1B7802000, v110, OS_LOG_TYPE_DEFAULT, "Notify (%lu) Daemon Activated Observers", buf, 0xCu);

    }
    v148 = 0u;
    v149 = 0u;
    *(_OWORD *)location = 0u;
    v147 = 0u;
    v112 = v107;
    v113 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v112, "countByEnumeratingWithState:objects:count:", location, buf, 16);
    if (v113)
    {
      v114 = *(_QWORD *)v147;
      do
      {
        for (j = 0; j != v113; ++j)
        {
          if (*(_QWORD *)v147 != v114)
            objc_enumerationMutation(v112);
          (*(void (**)(void))(*((_QWORD *)location[1] + j) + 16))();
        }
        v113 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v112, "countByEnumeratingWithState:objects:count:", location, buf, 16);
      }
      while (v113);
    }

    _HKInitializeLogging();
    _HKLogPersistedSignposts();
    v116 = objc_claimAutoreleasedReturnValue();
    v117 = os_signpost_enabled(v116);

    if (v117)
    {
      _HKLogPersistedSignposts();
      v118 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v118))
      {
        v119 = -[NSMutableArray count](v103, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v119;
        _os_signpost_emit_with_name_impl(&dword_1B7802000, v118, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Notify Daemon Ready Observers", "cound=%lu", buf, 0xCu);
      }

    }
    -[HDDaemon _postDaemonLaunchDarwinNotification](self, "_postDaemonLaunchDarwinNotification");
    objc_msgSend(WeakRetained, "daemonReadyComplete:", self);

    objc_initWeak(&from, self);
    queue = self->_queue;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __48__HDDaemon__setUpDarwinNotificationEventHandler__block_invoke;
    v158 = &unk_1E6CF2A90;
    objc_copyWeak(v159, &from);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", queue, buf);
    objc_destroyWeak(v159);
    objc_destroyWeak(&from);
    objc_initWeak(&from, self);
    v121 = MEMORY[0x1E0C80D38];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __53__HDDaemon__setUpDistributedNotificationEventHandler__block_invoke;
    v158 = &unk_1E6CF2A90;
    objc_copyWeak(v159, &from);
    xpc_set_event_stream_handler("com.apple.distnoted.matching", MEMORY[0x1E0C80D38], buf);

    objc_destroyWeak(v159);
    objc_destroyWeak(&from);
    v122 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 1uLL, MEMORY[0x1E0C80D38]);
    v123 = (void *)qword_1ED552278;
    qword_1ED552278 = (uint64_t)v122;

    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __38__HDDaemon__setupMemoryWarningHandler__block_invoke_312;
    v158 = &unk_1E6CE7DE0;
    v159[0] = &__block_literal_global_311;
    dispatch_source_set_event_handler((dispatch_source_t)qword_1ED552278, buf);
    dispatch_activate((dispatch_object_t)qword_1ED552278);
    v124 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 2uLL, MEMORY[0x1E0C80D38]);
    v125 = (void *)qword_1ED552280;
    qword_1ED552280 = (uint64_t)v124;

    from = (id)MEMORY[0x1E0C809B0];
    v153 = 3221225472;
    v154 = __38__HDDaemon__setupMemoryWarningHandler__block_invoke_2;
    v155 = &unk_1E6CE7DE0;
    v156[0] = &__block_literal_global_311;
    dispatch_source_set_event_handler((dispatch_source_t)qword_1ED552280, &from);
    dispatch_activate((dispatch_object_t)qword_1ED552280);
    v126 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 4uLL, MEMORY[0x1E0C80D38]);
    v127 = (void *)qword_1ED552288;
    qword_1ED552288 = (uint64_t)v126;

    location[0] = (id)MEMORY[0x1E0C809B0];
    location[1] = (id)3221225472;
    *(_QWORD *)&v147 = __38__HDDaemon__setupMemoryWarningHandler__block_invoke_3;
    *((_QWORD *)&v147 + 1) = &unk_1E6CE7DE0;
    *(_QWORD *)&v148 = &__block_literal_global_311;
    dispatch_source_set_event_handler((dispatch_source_t)qword_1ED552288, location);
    dispatch_activate((dispatch_object_t)qword_1ED552288);

    xpc_set_event_stream_handler("com.apple.rapport.matching", (dispatch_queue_t)self->_queue, &__block_literal_global_317);
    -[HDPostInstallUpdateManager start](self->_postInstallUpdateManager, "start");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "addObserver:selector:name:object:", self, sel__localeOrLanguageChanged_, *MEMORY[0x1E0C99720], 0);

    objc_initWeak((id *)buf, self);
    v129 = self->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __17__HDDaemon_start__block_invoke_2;
    handler[3] = &unk_1E6CE8390;
    objc_copyWeak(&v135, (id *)buf);
    notify_register_dispatch("com.apple.language.changed", &self->_languageChangeNotifyToken, v129, handler);
    -[HDCacheDeleteCoordinator activate](self->_cacheDeleteCoordinator, "activate");
    -[HDDaemonConnectionManager resume](self->_connectionManager, "resume");
    objc_destroyWeak(&v135);
    objc_destroyWeak((id *)buf);

  }
}

id __17__HDDaemon_start__block_invoke()
{
  void *v0;
  int v1;
  const __CFString *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("Sensitive Logging");
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "showSensitiveLogItems");
  v2 = CFSTR("Disabled");
  if (v1)
    v2 = CFSTR("Enabled");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __17__HDDaemon_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_localeOrLanguageChanged:", 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  MGCancelNotifications();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

  notify_cancel(self->_languageChangeNotifyToken);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  if (self->_healthdStateHandler)
    os_state_remove_handler();
  v5.receiver = self;
  v5.super_class = (Class)HDDaemon;
  -[HDDaemon dealloc](&v5, sel_dealloc);
}

- (id)daemonExtensionWithIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_daemonExtensionsByIdentifier, "objectForKeyedSubscript:", a3);
}

- (id)daemonExtensionsConformingToProtocol:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NSDictionary allValues](self->_daemonExtensionsByIdentifier, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__HDDaemon_daemonExtensionsConformingToProtocol___block_invoke;
  v9[3] = &unk_1E6CF2A20;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "hk_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __49__HDDaemon_daemonExtensionsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", *(_QWORD *)(a1 + 32));
}

- (void)invalidateAndWaitWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  HDDaemon *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating (%{public}@).", (uint8_t *)&v6, 0x16u);
  }

  -[HDDaemonConnectionManager invalidate](self->_connectionManager, "invalidate");
  -[HDMaintenanceWorkCoordinator cancelAllOperations](self->_maintenanceWorkCoordinator, "cancelAllOperations");
  -[HDOntologyBackingStore invalidate](self->_ontologyBackingStore, "invalidate");
  -[HDProfileManager invalidateAndWaitWithReason:](self->_profileManager, "invalidateAndWaitWithReason:", v4);

}

- (void)invalidateAllServersForProfile:(id)a3
{
  -[HDDaemonConnectionManager invalidateAllServersForProfile:](self->_connectionManager, "invalidateAllServersForProfile:", a3);
}

- (void)obliterateAndTerminateWithOptions:(unint64_t)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  -[HDDaemon profileManager](self, "profileManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allProfileIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDaemon obliterateAndTerminateProfiles:options:reason:completion:](self, "obliterateAndTerminateProfiles:options:reason:completion:", v10, a3, v9, v8);

}

- (void)obliterateAndTerminateProfiles:(id)a3 options:(unint64_t)a4 reason:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", self, CFSTR("Obliteration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isTerminating = 1;
  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
  {
    v19 = v14;
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v20;
    v27 = 2114;
    v28 = v11;
    v29 = 2048;
    v30 = a4;
    _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "*** OBLITERATING HEALTH DATA (%{public}@): %{public}@ (%ld)", buf, 0x20u);

  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __69__HDDaemon_obliterateAndTerminateProfiles_options_reason_completion___block_invoke;
  v24[3] = &unk_1E6CF2A48;
  v24[4] = self;
  objc_msgSend(v10, "hk_map:", v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v12;
  v22 = v11;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v21;
  HKDispatchAsyncOnGlobalConcurrentQueue();

}

id __69__HDDaemon_obliterateAndTerminateProfiles_options_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "profileForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v3;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Failed to find profile %{public}@ during obliteration", (uint8_t *)&v9, 0xCu);
    }
  }

  return v5;
}

void __69__HDDaemon_obliterateAndTerminateProfiles_options_reason_completion___block_invoke_239(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  os_log_t *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  char v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  id v42;
  void *v43;
  os_log_t v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  id v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint8_t v80[128];
  _BYTE buf[132];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.ActivityMonitorApp"), CFSTR("com.apple.DeepBreathing"), CFSTR("com.apple.Fitness"), CFSTR("com.apple.Health"), CFSTR("com.apple.HeartRatecom.apple.SessionTrackerApp"), CFSTR("com.apple.NanoHeartRhythm"), CFSTR("com.apple.NanoMenstrualCycles"), CFSTR("com.apple.NanoSleep.watchkitapp"), CFSTR("com.apple.NanoOxygenSaturation.watchkitapp"), CFSTR("com.apple.NanoHealthBalance"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    objc_msgSend(*(id *)(v2 + 336), "clientProcesses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v74, buf, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v75;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v75 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * v9), "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10
            && (!objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple."))
             || objc_msgSend(v4, "containsObject:", v11)))
          {
            objc_msgSend(v3, "addObject:", v11);
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v74, buf, 16);
      }
      while (v7);
    }

  }
  else
  {
    v3 = 0;
  }
  _HKInitializeLogging();
  v12 = (os_log_t *)MEMORY[0x1E0CB52C0];
  v13 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "*** PREPARING FOR OBLITERATION ***", buf, 2u);
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v14 = *(id *)(a1 + 40);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v71;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v71 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v18++), "prepareForObliterationWithReason:", *(_QWORD *)(a1 + 48));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    }
    while (v16);
  }

  _HKInitializeLogging();
  v19 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "*** INVALIDATING PROFILES", buf, 2u);
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v20 = *(id *)(a1 + 40);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v67;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v67 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v24++), "invalidateAndWaitWithReason:", CFSTR("OBLITERATION"));
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    }
    while (v22);
  }

  _HKInitializeLogging();
  v25 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "*** OBLITERATING PROFILES", buf, 2u);
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v26 = *(id *)(a1 + 40);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v63;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v63 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * v30++), "obliterateWithOptions:reason:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
    }
    while (v28);
  }

  _HKInitializeLogging();
  v31 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "*** OBLITERATING DAEMON OWNED DATA", buf, 2u);
  }
  v32 = *(id **)(a1 + 32);
  v33 = *(_QWORD *)(a1 + 72);
  v34 = *(id *)(a1 + 48);
  if (v32)
  {
    objc_msgSend(v32[51], "invalidate");
    if ((v33 & 1) != 0)
      objc_msgSend(v32[51], "obliterateWithReason:", v34);
    v35 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v32, "localContentURL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v74 = 0;
    v37 = objc_msgSend(v35, "removeItemAtURL:error:", v36, &v74);
    v38 = (id)v74;

    if ((v37 & 1) == 0)
    {
      _HKInitializeLogging();
      v39 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v38;
        _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "Failed to remove local content during obliteration: %{public}@", buf, 0xCu);
      }
    }

  }
  _HKInitializeLogging();
  v40 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B7802000, v40, OS_LOG_TYPE_ERROR, "*** KILLING CLIENTS", buf, 2u);
  }
  v41 = *(_QWORD *)(a1 + 32);
  v42 = v3;
  v43 = v42;
  if (v41 && objc_msgSend(v42, "count"))
  {
    _HKInitializeLogging();
    v44 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      v45 = v44;
      v46 = objc_msgSend(v43, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v46;
      _os_log_impl(&dword_1B7802000, v45, OS_LOG_TYPE_DEFAULT, "Terminating %lu clients in response to obliteration", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifiers:", v43);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E00]), "initWithExplanation:", CFSTR("Health database obliterated"));
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E08]), "initWithPredicate:context:", v47, v48);
    *(_QWORD *)&v74 = 0;
    v50 = objc_msgSend(v49, "execute:", &v74);
    v51 = (id)v74;
    _HKInitializeLogging();
    v52 = *v12;
    v53 = *v12;
    if (v50)
    {
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v43;
        _os_log_impl(&dword_1B7802000, v52, OS_LOG_TYPE_DEFAULT, "Did terminate clients (%{public}@) in response to obliteration", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v43;
      _os_log_error_impl(&dword_1B7802000, v52, OS_LOG_TYPE_ERROR, "Failed to terminate clients in response to obliteration: %{public}@ (%{public}@)", buf, 0x16u);
    }

  }
  _HKInitializeLogging();
  v54 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B7802000, v54, OS_LOG_TYPE_ERROR, "*** CLEARING USER DEFAULTS DOMAINS", buf, 2u);
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v55 = (void *)MEMORY[0x1E0C99EA0];
    v56 = *MEMORY[0x1E0CB7790];
    *(_QWORD *)buf = *MEMORY[0x1E0CB7508];
    *(_QWORD *)&buf[8] = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "hk_deleteDomainsNamed:", v57);

  }
  _HKInitializeLogging();
  v58 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B7802000, v58, OS_LOG_TYPE_ERROR, "*** NOTIFYING PLUGINS", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "pluginManager");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "notifyPluginsOfDatabaseObliteration");

  v60 = *(_QWORD *)(a1 + 64);
  if (v60)
    (*(void (**)(void))(v60 + 16))();
  _HKInitializeLogging();
  v61 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B7802000, v61, OS_LOG_TYPE_ERROR, "*** EXITING", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "terminateClean:reason:", 0, CFSTR("obliterating"));
  objc_msgSend(*(id *)(a1 + 56), "invalidate");

}

- (void)terminateClean:(BOOL)a3 reason:(id)a4
{
  _BOOL8 v4;
  const char *v6;
  void *v7;
  id v8;

  v4 = a3;
  self->_isTerminating = 1;
  v8 = a4;
  -[HDDaemon _terminationCleanup]((uint64_t)self);
  v6 = "";
  if (v4)
    v6 = " clean";
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Terminating%s: %@"), v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDaemon invalidateAndWaitWithReason:](self, "invalidateAndWaitWithReason:", v7);

  -[HDDaemon exitClean:reason:](self, "exitClean:reason:", v4, v8);
}

- (void)_terminationCleanup
{
  id v1;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 128), "terminationCleanup");
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "synchronize");

  }
}

- (void)_localeOrLanguageChanged:(id)a3
{
  -[HDDaemon exitClean:reason:](self, "exitClean:reason:", 1, CFSTR("locale or language changed"));
}

- (void)exitClean:(BOOL)a3 reason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const char *v8;
  BOOL *p_hasCalledExit;
  unsigned __int8 v10;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = "";
    if (v4)
      v8 = " clean";
    *(_DWORD *)buf = 136315394;
    v13 = v8;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "Exiting%s: %{public}@", buf, 0x16u);
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__HDDaemon_exitClean_reason___block_invoke;
    block[3] = &unk_1E6CE80E8;
    block[4] = self;
    if (exitClean_reason__onceToken != -1)
      dispatch_once(&exitClean_reason__onceToken, block);
    xpc_transaction_exit_clean();
  }
  else
  {
    p_hasCalledExit = &self->_hasCalledExit;
    do
      v10 = __ldaxr((unsigned __int8 *)p_hasCalledExit);
    while (__stlxr(1u, (unsigned __int8 *)p_hasCalledExit));
    if ((v10 & 1) == 0)
      exit(0);
  }

}

void __29__HDDaemon_exitClean_reason___block_invoke(uint64_t a1)
{
  dispatch_source_t v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD handler[5];

  v2 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, 0);
  v3 = (void *)exitClean_reason__timerSource;
  exitClean_reason__timerSource = (uint64_t)v2;

  v4 = exitClean_reason__timerSource;
  v5 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __29__HDDaemon_exitClean_reason___block_invoke_2;
  handler[3] = &unk_1E6CE80E8;
  handler[4] = *(_QWORD *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)exitClean_reason__timerSource, handler);
  dispatch_resume((dispatch_object_t)exitClean_reason__timerSource);
}

uint64_t __29__HDDaemon_exitClean_reason___block_invoke_2(uint64_t a1)
{
  xpc_transaction_try_exit_clean();
  return objc_msgSend(*(id *)(a1 + 32), "exitClean:reason:", 0, CFSTR("forcing as xpc failed to quiesce"));
}

void __32__HDDaemon__setUpSignalHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    -[HDDaemon _terminationCleanup]((uint64_t)WeakRetained);
    objc_msgSend(WeakRetained, "exitClean:reason:", 0, CFSTR("received SIGTERM"));
  }

}

void __32__HDDaemon__setUpSignalHandlers__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "logAllDiagnostics");

}

void __32__HDDaemon__setUpSignalHandlers__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("HDUSR2SignalNotification"), WeakRetained);

  }
}

void __48__HDDaemon__setUpDarwinNotificationEventHandler__block_invoke(uint64_t a1, void *a2)
{
  const char *string;
  const char *v4;
  id *WeakRetained;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  xpc_object_t xdict;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  xdict = a2;
  if (MEMORY[0x1BCCAD334]() == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]);
    if (string)
    {
      v4 = string;
      WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
      v6 = xdict;
      if (WeakRetained)
      {
        _HKInitializeLogging();
        v7 = *MEMORY[0x1E0CB52C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v25 = v4;
          _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "Received notifyd notification \"%s\", buf, 0xCu);
        }
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(WeakRetained[26], "allValues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, buf, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
LABEL_8:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
            if ((objc_opt_respondsToSelector() & 1) != 0
              && (objc_msgSend(v13, "daemonDidReceiveNotification:", v4) & 1) != 0)
            {
              break;
            }
            if (v10 == ++v12)
            {
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, buf, 16);
              if (v10)
                goto LABEL_8;
              goto LABEL_15;
            }
          }
        }
        else
        {
LABEL_15:

          if (!strcasecmp("com.apple.Preferences.ResetPrivacyWarningsNotification", v4))
            objc_msgSend(WeakRetained, "_resetPrivacySettings");
          if (strcasecmp("com.apple.springboard.homescreenunlocked", v4))
            goto LABEL_20;
          v14 = xpc_dictionary_get_uint64(v6, "_State") != 0;
          v22 = CFSTR("HDDaemonHomescreenUnlockedAtHomescreenKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("HDDaemonHomescreenUnlockedNotification"), WeakRetained, v8);

        }
      }
LABEL_20:

    }
  }

}

void __53__HDDaemon__setUpDistributedNotificationEventHandler__block_invoke(uint64_t a1, void *a2)
{
  const char *string;
  const char *v4;
  id WeakRetained;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  char v11;
  int v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  xpc_object_t xdict;
  _QWORD block[5];
  __int128 buf;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  xdict = a2;
  if (MEMORY[0x1BCCAD334]() == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]);
    if (string)
    {
      v4 = string;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v6 = xdict;
      if (WeakRetained)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        _HKInitializeLogging();
        v8 = *MEMORY[0x1E0CB52C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v7;
          _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "Received distnoted notification \"%@\", (uint8_t *)&buf, 0xCu);
        }
        if (objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple.LaunchServices")))
        {
          v9 = v6;
          v10 = v7;
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.LaunchServices.applicationRegistered"));
          v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.LaunchServices.applicationUnregistered"));
          if ((v11 & 1) != 0 || v12)
          {
            v13 = MEMORY[0x1E0C809B0];
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __44__HDDaemon__handleLaunchServicesEvent_name___block_invoke;
            block[3] = &unk_1E6CE80E8;
            block[4] = WeakRetained;
            if (qword_1ED552270 != -1)
              dispatch_once(&qword_1ED552270, block);
            +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", WeakRetained, CFSTR("AppInstallation"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = qword_1ED552268;
            *(_QWORD *)&buf = v13;
            *((_QWORD *)&buf + 1) = 3221225472;
            v21 = __44__HDDaemon__handleLaunchServicesEvent_name___block_invoke_2;
            v22 = &unk_1E6CEDBD8;
            v16 = v9;
            v27 = v11;
            v23 = v16;
            v24 = WeakRetained;
            v25 = v10;
            v26 = v14;
            v17 = v14;
            dispatch_async(v15, &buf);

          }
        }

      }
    }
  }

}

void __44__HDDaemon__handleLaunchServicesEvent_name___block_invoke()
{
  uint64_t v0;
  void *v1;

  HKCreateSerialDispatchQueueWithQOSClass();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED552268;
  qword_1ED552268 = v0;

}

void __44__HDDaemon__handleLaunchServicesEvent_name___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  __CFString **v11;
  __CFString *v12;
  __CFString **v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99D80];
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "UserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hd_dictionaryFromXPCObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPlaceholder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v5)
  {
    if ((v7 & 1) != 0)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring LaunchServices notification for placeholder", (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      if (*(_BYTE *)(a1 + 64))
        v11 = HDHealthDaemonApplicationsInstalledNotification;
      else
        v11 = HDHealthDaemonApplicationsUninstalledNotification;
      v12 = *v11;
      if (*(_BYTE *)(a1 + 64))
        v13 = HDHealthDaemonApplicationsInstalledBundleIdentifiersKey;
      else
        v13 = HDHealthDaemonApplicationsUninstalledBundleIdentifiersKey;
      v21 = *v13;
      v22[0] = v5;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v21;
      v16 = v12;
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:userInfo:", v16, *(_QWORD *)(a1 + 40), v17);

    }
  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v19 = 138412290;
      v20 = v10;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%@ notification missing bundle identifiers", (uint8_t *)&v19, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 56), "invalidate");

}

uint64_t __38__HDDaemon__setupMemoryWarningHandler__block_invoke_312(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __38__HDDaemon__setupMemoryWarningHandler__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __37__HDDaemon__setupRapportEventHandler__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t reply;
  xpc_object_t xdict;

  xdict = a2;
  if (MEMORY[0x1BCCAD334]() == MEMORY[0x1E0C812F8]
    && xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298])
    && xpc_dictionary_get_BOOL(xdict, "replyRequired"))
  {
    reply = xpc_dictionary_create_reply(xdict);
    if (reply)
      xpc_dictionary_send_reply();

  }
}

- (BOOL)isTerminating
{
  return self->_isTerminating;
}

- (void)registerDaemonReadyObserver:(id)a3 queue:(id)queue
{
  id v6;
  HDDaemon *v7;
  HDDaemon *v8;
  id v9;
  id v10;
  id v11;
  os_unfair_lock_s *v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  HDDaemon *v20;
  id v21;
  id v22;
  os_unfair_lock_s *v23;

  v6 = a3;
  v7 = self;
  v8 = v7;
  if (!queue)
    queue = v7->_queue;
  v9 = queue;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __46__HDDaemon_registerDaemonReadyObserver_queue___block_invoke;
  v19 = &unk_1E6CECCA8;
  v20 = v8;
  v10 = v6;
  v21 = v10;
  v11 = v9;
  v22 = v11;
  v12 = v8;
  v23 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(&v16);
  os_unfair_lock_lock(v12 + 36);
  if (LOBYTE(v12[44]._os_unfair_lock_opaque))
  {
    ++*(_QWORD *)&v12[42]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v12 + 36);
    v13[2](v13);
  }
  else
  {
    v14 = *(void **)&v12[38]._os_unfair_lock_opaque;
    ++*(_QWORD *)&v12[40]._os_unfair_lock_opaque;
    v15 = _Block_copy(v13);
    objc_msgSend(v14, "addObject:", v15, v16, v17, v18, v19, v20, v21, v22);

    os_unfair_lock_unlock(v12 + 36);
  }

}

void __46__HDDaemon_registerDaemonReadyObserver_queue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const char *label;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    HKLogInfrastructure();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 48));
      *(_DWORD *)buf = 138543874;
      v13 = v5;
      v14 = 2114;
      v15 = v6;
      v16 = 2080;
      v17 = label;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_INFO, "%{public}@: notify daemon ready for observer %{public}@ on queue %s", buf, 0x20u);
    }

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__HDDaemon_registerDaemonReadyObserver_queue___block_invoke_321;
  v9[3] = &unk_1E6CE8080;
  v8 = *(NSObject **)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 56);
  dispatch_async(v8, v9);

}

uint64_t __46__HDDaemon_registerDaemonReadyObserver_queue___block_invoke_321(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "daemonReady:", *(_QWORD *)(a1 + 40));
}

- (void)_postDaemonLaunchDarwinNotification
{
  notify_post((const char *)*MEMORY[0x1E0CB7668]);
}

- (void)registerDaemonActivatedObserver:(id)a3 queue:(id)queue
{
  id v6;
  HDDaemon *v7;
  HDDaemon *v8;
  id v9;
  id v10;
  id v11;
  os_unfair_lock_s *v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  HDDaemon *v20;
  id v21;
  id v22;
  os_unfair_lock_s *v23;

  v6 = a3;
  v7 = self;
  v8 = v7;
  if (!queue)
    queue = v7->_queue;
  v9 = queue;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __50__HDDaemon_registerDaemonActivatedObserver_queue___block_invoke;
  v19 = &unk_1E6CECCA8;
  v20 = v8;
  v10 = v6;
  v21 = v10;
  v11 = v9;
  v22 = v11;
  v12 = v8;
  v23 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(&v16);
  os_unfair_lock_lock(v12 + 36);
  if (LOBYTE(v12[44]._os_unfair_lock_opaque))
  {
    os_unfair_lock_unlock(v12 + 36);
    v13[2](v13);
  }
  else
  {
    v14 = *(void **)&v12[46]._os_unfair_lock_opaque;
    v15 = _Block_copy(v13);
    objc_msgSend(v14, "addObject:", v15, v16, v17, v18, v19, v20, v21, v22);

    os_unfair_lock_unlock(v12 + 36);
  }

}

void __50__HDDaemon_registerDaemonActivatedObserver_queue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const char *label;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    HKLogInfrastructure();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 48));
      *(_DWORD *)buf = 138543874;
      v13 = v5;
      v14 = 2114;
      v15 = v6;
      v16 = 2080;
      v17 = label;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_INFO, "%{public}@: notify daemon activated for observer %{public}@ on queue %s", buf, 0x20u);
    }

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__HDDaemon_registerDaemonActivatedObserver_queue___block_invoke_322;
  v9[3] = &unk_1E6CE8080;
  v8 = *(NSObject **)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 56);
  dispatch_async(v8, v9);

}

uint64_t __50__HDDaemon_registerDaemonActivatedObserver_queue___block_invoke_322(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "daemonActivated:", *(_QWORD *)(a1 + 40));
}

- (void)registerProtectedResourceStoreProvider:(id)a3
{
  NSHashTable *protectedResourceStoreProviders;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_protectedResourceStoreProvidersLock);
  protectedResourceStoreProviders = self->_protectedResourceStoreProviders;
  if (!protectedResourceStoreProviders)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_protectedResourceStoreProviders;
    self->_protectedResourceStoreProviders = v5;

    protectedResourceStoreProviders = self->_protectedResourceStoreProviders;
  }
  -[NSHashTable addObject:](protectedResourceStoreProviders, "addObject:", v7);
  os_unfair_lock_unlock(&self->_protectedResourceStoreProvidersLock);

}

- (void)unregisterProtectedResourceStoreProvider:(id)a3
{
  os_unfair_lock_s *p_protectedResourceStoreProvidersLock;
  id v5;

  p_protectedResourceStoreProvidersLock = &self->_protectedResourceStoreProvidersLock;
  v5 = a3;
  os_unfair_lock_lock(p_protectedResourceStoreProvidersLock);
  -[NSHashTable removeObject:](self->_protectedResourceStoreProviders, "removeObject:", v5);

  os_unfair_lock_unlock(p_protectedResourceStoreProvidersLock);
}

- (id)protectedResourceStoreProviders
{
  os_unfair_lock_s *p_protectedResourceStoreProvidersLock;
  NSHashTable *protectedResourceStoreProviders;
  void *v5;

  p_protectedResourceStoreProvidersLock = &self->_protectedResourceStoreProvidersLock;
  os_unfair_lock_lock(&self->_protectedResourceStoreProvidersLock);
  protectedResourceStoreProviders = self->_protectedResourceStoreProviders;
  if (protectedResourceStoreProviders)
  {
    -[NSHashTable allObjects](protectedResourceStoreProviders, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  os_unfair_lock_unlock(p_protectedResourceStoreProvidersLock);
  return v5;
}

- (void)setDaemonTester:(id)a3
{
  _BOOL4 daemonReady;
  id obj;

  obj = a3;
  os_unfair_lock_lock(&self->_daemonReadyLock);
  objc_storeWeak((id *)&self->_daemonTester, obj);
  daemonReady = self->_daemonReady;
  os_unfair_lock_unlock(&self->_daemonReadyLock);
  if (daemonReady)
    objc_msgSend(obj, "daemonReadyComplete:", self);

}

- (void)unregisterForLaunchNotification:(const char *)a3
{
  if (self)
    xpc_set_event();
}

- (id)healthDirectorySizeInBytes
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  __int128 v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDaemon healthDirectoryURL](self, "healthDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C99AC0];
  v34[0] = *MEMORY[0x1E0C99AC0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, v6, 0, &__block_literal_global_332);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v9)
  {
    v11 = v9;
    v12 = 0;
    v13 = *(_QWORD *)v26;
    *(_QWORD *)&v10 = 138543618;
    v22 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v23 = 0;
        v24 = 0;
        v16 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v24, v5, &v23, v22);
        v17 = v24;
        v18 = v23;
        if (v16)
        {
          v12 += objc_msgSend(v17, "unsignedLongLongValue");
        }
        else
        {
          _HKInitializeLogging();
          v19 = *MEMORY[0x1E0CB52C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            v30 = v15;
            v31 = 2114;
            v32 = v18;
            _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "Unable to determine file size for %{public}@: %{public}@", buf, 0x16u);
          }
        }

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __38__HDDaemon_healthDirectorySizeInBytes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
  {
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

void __41__HDDaemon__registerForDeviceNameChanges__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  __int128 v16;
  id WeakRetained;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(WeakRetained, "profileManager");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "allProfileIdentifiers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v3)
    {
      v5 = v3;
      v6 = 0;
      v7 = *(_QWORD *)v20;
      *(_QWORD *)&v4 = 138543618;
      v16 = v4;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v2);
          v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(WeakRetained, "profileManager", v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "profileForIdentifier:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v11, "sourceManager");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v6;
            v13 = objc_msgSend(v12, "updateCurrentDeviceNameWithError:", &v18);
            v14 = v18;

            if ((v13 & 1) == 0)
            {
              _HKInitializeLogging();
              v15 = *MEMORY[0x1E0CB52C0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v16;
                v24 = v9;
                v25 = 2114;
                v26 = v14;
                _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "Current device source name update failed for profile with identifier %{public}@: %{public}@", buf, 0x16u);
              }
            }
            v6 = v14;
          }

        }
        v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

  }
}

- (void)_resetPrivacySettings
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "Resetting privacy settings", buf, 2u);
  }
  -[HDDaemon primaryProfile](self, "primaryProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authorizationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetAllAuthorizationRecordsWithCompletion:", 0);

  v6 = objc_alloc(MEMORY[0x1E0D51610]);
  v7 = *MEMORY[0x1E0CB7790];
  v8 = (void *)objc_msgSend(v6, "initWithDomain:", *MEMORY[0x1E0CB7790]);
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = *MEMORY[0x1E0CB7798];
  v30[0] = *MEMORY[0x1E0CB77A0];
  v30[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  objc_msgSend(v8, "synchronize");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v8;
      v27 = 2114;
      v28 = v18;
      _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "Failed to synchronize %{public}@: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v20 = objc_alloc_init(MEMORY[0x1E0D51618]);
    objc_msgSend(v20, "synchronizeNanoDomain:keys:", v7, v13);

  }
}

uint64_t __33__HDDaemon__setupSignal_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)healthDirectoryPath
{
  return self->_healthDirectoryPath;
}

- (NSURL)healthDirectoryURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_healthDirectoryPath, 1);
}

- (NSURL)localContentURL
{
  void *v2;
  void *v3;

  -[HDDaemon healthDirectoryURL](self, "healthDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Local"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (HDBackgroundObservationServerExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (HDPostInstallUpdateManager)postInstallUpdateManager
{
  return self->_postInstallUpdateManager;
}

- (HDWorkoutPluginDaemonExtension)workoutPluginExtension
{
  return (HDWorkoutPluginDaemonExtension *)-[HDDaemon daemonExtensionWithIdentifier:](self, "daemonExtensionWithIdentifier:", CFSTR("com.apple.health.WorkoutPlugin"));
}

- (id)createApplicationStateMonitor
{
  return objc_alloc_init(MEMORY[0x1E0CFE2F0]);
}

- (id)createApplicationStateMonitorWithBundleIDs:(id)a3 states:(unsigned int)a4 elevatedPriority:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  void *v9;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = (objc_class *)MEMORY[0x1E0CFE2F0];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithBundleIDs:states:elevatedPriority:", v8, v6, v5);

  return v9;
}

- (id)createRBSProcessStateProvider
{
  return objc_alloc_init(HDRBSProcessStateProvider);
}

- (id)diagnosticDescription
{
  os_unfair_lock_s *p_daemonReadyLock;
  int64_t numberOfDaemonReadyObserversAfterReady;
  int64_t numberOfDaemonReadyObserversBeforeReady;

  p_daemonReadyLock = &self->_daemonReadyLock;
  os_unfair_lock_lock(&self->_daemonReadyLock);
  numberOfDaemonReadyObserversBeforeReady = self->_numberOfDaemonReadyObserversBeforeReady;
  numberOfDaemonReadyObserversAfterReady = self->_numberOfDaemonReadyObserversAfterReady;
  os_unfair_lock_unlock(p_daemonReadyLock);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DaemonReadyObservers: %ld (%ld before ready, %ld after ready)"), numberOfDaemonReadyObserversAfterReady + numberOfDaemonReadyObserversBeforeReady, numberOfDaemonReadyObserversBeforeReady, numberOfDaemonReadyObserversAfterReady);
}

- (id)_newCacheDeleteCoordinator
{
  return objc_alloc_init(HDCacheDeleteCoordinator);
}

- (id)_newConnectionManager
{
  HDDaemonConnectionManager *v3;

  v3 = [HDDaemonConnectionManager alloc];
  return -[HDDaemonConnectionManager initWithMachServiceName:daemon:](v3, "initWithMachServiceName:daemon:", *MEMORY[0x1E0CB5180], self);
}

- (id)_newContentProtectionManager
{
  return objc_alloc_init(MEMORY[0x1E0D29818]);
}

- (id)_newDatabasePruningCoordinator
{
  return -[HDDatabasePruningCoordinator initWithDaemon:]([HDDatabasePruningCoordinator alloc], "initWithDaemon:", self);
}

- (id)_newCloudSyncCoordinator
{
  return -[HDCloudSyncCoordinator initWithDaemon:]([HDCloudSyncCoordinator alloc], "initWithDaemon:", self);
}

- (id)_newAnalyticsSubmissionCoordinator
{
  return -[HDAnalyticsSubmissionCoordinator initWithDaemon:]([HDAnalyticsSubmissionCoordinator alloc], "initWithDaemon:", self);
}

- (id)_newAutoBugCaptureReporter
{
  return -[HDAutoBugCaptureReporter initWithDaemon:]([HDAutoBugCaptureReporter alloc], "initWithDaemon:", self);
}

- (id)_newNotificationInstructionSyncService
{
  return -[HDNotificationInstructionSyncService initWithDaemon:]([HDNotificationInstructionSyncService alloc], "initWithDaemon:", self);
}

- (id)_newHealthAppNewDeviceNotificationService
{
  return objc_alloc_init(HDHealthAppNewDeviceNotificationService);
}

- (id)_newNanoRegistryDeviceCapabilityProvider
{
  return objc_alloc_init(HDNanoRegistryDeviceCapabilityProvider);
}

- (id)_newOTAFeatureAvailabilityManager
{
  return -[HDOTAFeatureAvailabilityManager initWithDaemon:]([HDOTAFeatureAvailabilityManager alloc], "initWithDaemon:", self);
}

- (id)_newPrimaryProfile
{
  void *v5;

  if (!self->_healthDirectoryPath)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDaemon.m"), 1187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_healthDirectoryPath"));

  }
  return -[HDPrimaryProfile initWithDirectoryPath:medicalIDDirectoryPath:daemon:]([HDPrimaryProfile alloc], "initWithDirectoryPath:medicalIDDirectoryPath:daemon:", self->_healthDirectoryPath, self->_medicalIDDirectoryPath, self);
}

- (id)_newProcessStateManager
{
  return -[HDProcessStateManager initWithApplicationStateMonitorProvider:]([HDProcessStateManager alloc], "initWithApplicationStateMonitorProvider:", self);
}

- (id)_newBackgroundTaskScheduler
{
  return objc_alloc_init(HDBackgroundTaskScheduler);
}

- (id)_newPluginManager
{
  return -[HDPluginManager initWithDaemon:]([HDPluginManager alloc], "initWithDaemon:", self);
}

- (id)_newProfileManager
{
  return -[HDProfileManager initWithDaemon:]([HDProfileManager alloc], "initWithDaemon:", self);
}

- (id)_newMaintenanceWorkCoordinator
{
  return objc_alloc_init(HDMaintenanceWorkCoordinator);
}

- (id)_newTaskServerRegistry
{
  return -[HDTaskServerRegistry initWithDaemon:]([HDTaskServerRegistry alloc], "initWithDaemon:", self);
}

- (id)_newDevicePowerMonitor
{
  return 0;
}

- (void)applicationStateDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString **v12;
  uint64_t v13;
  void *v14;
  char v15;
  __CFString *v16;
  void *v17;
  HDDaemon *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6DF8D68);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __38__HDDaemon_applicationStateDidChange___block_invoke;
  v23[3] = &unk_1E6CF2BA0;
  v6 = v5;
  v24 = v6;
  objc_msgSend(v4, "hk_filter:", v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v9)
    {
      v10 = v9;
      v18 = self;
      v11 = *(_QWORD *)v20;
      v12 = HDHealthDaemonFitnessAppsRestrictedNotification;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "appState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isRestricted");

        if ((v15 & 1) != 0)
          break;
        if (v10 == ++v13)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
          if (v10)
            goto LABEL_4;
          v12 = HDHealthDaemonFitnessAppsAllowedNotification;
          break;
        }
      }
      self = v18;
    }
    else
    {
      v12 = HDHealthDaemonFitnessAppsAllowedNotification;
    }

    v16 = *v12;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:", v16, self);

  }
}

uint64_t __38__HDDaemon_applicationStateDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (NSString)medicalIDDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (HDAnalyticsSubmissionCoordinator)analyticsSubmissionCoordinator
{
  return self->_analyticsSubmissionCoordinator;
}

- (HDAutoBugCaptureReporter)autoBugCaptureReporter
{
  return self->_autoBugCaptureReporter;
}

- (HDCloudSyncCoordinator)cloudSyncCoordinator
{
  return self->_cloudSyncCoordinator;
}

- (HDDatabasePruningCoordinator)databasePruningCoordinator
{
  return self->_databasePruningCoordinator;
}

- (HDMaintenanceWorkCoordinator)maintenanceWorkCoordinator
{
  return self->_maintenanceWorkCoordinator;
}

- (HDPairedDeviceCapabilityProviding)nanoRegistryDeviceCapabilityProvider
{
  return self->_nanoRegistryDeviceCapabilityProvider;
}

- (HDOntologyConfigurationProvider)ontologyConfigurationProvider
{
  return self->_ontologyConfigurationProvider;
}

- (HDOntologyUpdateCoordinator)ontologyUpdateCoordinator
{
  return self->_ontologyUpdateCoordinator;
}

- (HKWatchLowPowerModeDataSource)watchLowPowerModeDataSource
{
  return self->_watchLowPowerModeDataSource;
}

- (HKWristDetectionSettingManager)wristDetectionSettingManager
{
  return self->_wristDetectionSettingManager;
}

- (HDCacheDeleteCoordinator)cacheDeleteCoordinator
{
  return self->_cacheDeleteCoordinator;
}

- (BOOL)shouldEnqueueMaintenanceWork
{
  return self->_shouldEnqueueMaintenanceWork;
}

- (void)setShouldEnqueueMaintenanceWork:(BOOL)a3
{
  self->_shouldEnqueueMaintenanceWork = a3;
}

- (HDDaemonConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (HDTaskServerRegistry)taskServerRegistry
{
  return self->_taskServerRegistry;
}

- (HDDevicePowerMonitor)devicePowerMonitor
{
  return self->_devicePowerMonitor;
}

- (HDNotificationInstructionSyncService)notificationInstructionSyncService
{
  return self->_notificationInstructionSyncService;
}

- (HDHealthAppNewDeviceNotificationService)healthAppNewDeviceNotificationService
{
  return self->_healthAppNewDeviceNotificationService;
}

- (HDOTAFeatureAvailabilityManager)OTAFeatureAvailabilityManager
{
  return self->_OTAFeatureAvailabilityManager;
}

- (HDXPCAlarmScheduler)alarmScheduler
{
  return self->_alarmScheduler;
}

- (HDXPCEventManager)xpcEventManager
{
  return self->_xpcEventManager;
}

- (HDOntologyAssetProvider)ontologyAssetProvider
{
  return self->_ontologyAssetProvider;
}

- (HDOntologyBackingStore)ontologyBackingStore
{
  return self->_ontologyBackingStore;
}

- (HDUserDomainConceptEntityRegistry)userDomainConceptEntityRegistry
{
  return self->_userDomainConceptEntityRegistry;
}

- (HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource)featureAvailabilityRequirementSatisfactionOverridesDataSource
{
  return self->_featureAvailabilityRequirementSatisfactionOverridesDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureAvailabilityRequirementSatisfactionOverridesDataSource, 0);
  objc_storeStrong((id *)&self->_userDomainConceptEntityRegistry, 0);
  objc_storeStrong((id *)&self->_ontologyBackingStore, 0);
  objc_storeStrong((id *)&self->_ontologyAssetProvider, 0);
  objc_storeStrong((id *)&self->_xpcEventManager, 0);
  objc_storeStrong((id *)&self->_alarmScheduler, 0);
  objc_storeStrong((id *)&self->_OTAFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_healthAppNewDeviceNotificationService, 0);
  objc_storeStrong((id *)&self->_notificationInstructionSyncService, 0);
  objc_storeStrong((id *)&self->_devicePowerMonitor, 0);
  objc_storeStrong((id *)&self->_taskServerRegistry, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
  objc_destroyWeak((id *)&self->_daemonTester);
  objc_storeStrong((id *)&self->_cacheDeleteCoordinator, 0);
  objc_storeStrong((id *)&self->_alertSuppressionService, 0);
  objc_storeStrong((id *)&self->_wristDetectionSettingManager, 0);
  objc_storeStrong((id *)&self->_watchLowPowerModeDataSource, 0);
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_ontologyUpdateCoordinator, 0);
  objc_storeStrong((id *)&self->_nanoRegistryDeviceCapabilityProvider, 0);
  objc_storeStrong((id *)&self->_maintenanceWorkCoordinator, 0);
  objc_storeStrong((id *)&self->_databasePruningCoordinator, 0);
  objc_storeStrong((id *)&self->_autoBugCaptureReporter, 0);
  objc_storeStrong((id *)&self->_analyticsSubmissionCoordinator, 0);
  objc_storeStrong((id *)&self->_medicalIDDirectoryPath, 0);
  objc_storeStrong((id *)&self->_daemonExtensionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_protectedResourceStoreProviders, 0);
  objc_storeStrong((id *)&self->_daemonActivatedBlocks, 0);
  objc_storeStrong((id *)&self->_daemonReadyBlocks, 0);
  objc_storeStrong((id *)&self->_primaryProfile, 0);
  objc_storeStrong((id *)&self->_postInstallUpdateManager, 0);
  objc_storeStrong((id *)&self->_profileManager, 0);
  objc_storeStrong((id *)&self->_processStateManager, 0);
  objc_storeStrong((id *)&self->_pluginManager, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_storeStrong((id *)&self->_ontologyConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_cloudSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_contentProtectionManager, 0);
  objc_storeStrong((id *)&self->_backgroundTaskScheduler, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_healthDirectoryPath, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
}

@end
