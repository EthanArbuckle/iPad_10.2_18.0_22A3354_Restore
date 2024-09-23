@implementation HMDMetricsManager

- (HMDMetricsDeviceStateManager)deviceStateManager
{
  return self->_deviceStateManager;
}

- (BOOL)isDemoModeConfigured
{
  void *v2;
  char v3;

  -[HMDMetricsManager homeManager](self, "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "demoFinalized");

  return v3;
}

- (BOOL)isSubmissionEnabled
{
  return !-[HMDMetricsManager isDemoModeConfigured](self, "isDemoModeConfigured");
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

+ (HMMLogEventSubmitting)sharedLogEventSubmitter
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  os_unfair_lock_lock_with_options();
  v2 = (void *)sharedDispatcher;
  if (!sharedDispatcher)
  {
    v2 = (void *)bufferedSubmitter;
    if (!bufferedSubmitter)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0D33460]);
      v4 = (void *)bufferedSubmitter;
      bufferedSubmitter = (uint64_t)v3;

      v2 = (void *)bufferedSubmitter;
    }
  }
  v5 = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedSubmitterLock);
  return (HMMLogEventSubmitting *)v5;
}

- (HMDMetricsManager)initWithMessageDispatcher:(id)a3 accountManager:(id)a4 notificationSettingsProvider:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  HMMCountersManager *v13;
  HMMCountersManager *bridgedCountersManager;
  HMMCountersManager *v15;
  int v16;
  id v17;
  HMDEventCountersManager *v18;
  void *v19;
  void *v20;
  HMDMetricsManager *v21;
  NSObject *v22;
  void *v23;
  HMMCountersManager *v24;
  id v25;
  void *v26;
  HMDCoreAnalyticsLogEventFactory *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDMetricsDeviceStateManager *v40;
  void *v41;
  HMDEventCountersManager *v42;
  void *v43;
  HMDTimeBasedFlagsManager *v44;
  HMDMetricsManager *v45;
  HMDMetricsManager *v46;
  HMDNetworkObserver *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v49 = a4;
  v48 = a5;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0D33498]);
  +[HMDLogEventDailyScheduler createSchedulerWithLogEventSubmitter:](HMDLogEventDailyScheduler, "createSchedulerWithLogEventSubmitter:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D33480], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMetricsManager defaultRadarInitiator](HMDMetricsManager, "defaultRadarInitiator");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[HMDTimeBasedFlagsManager initWithDateProvider:]([HMDTimeBasedFlagsManager alloc], "initWithDateProvider:", v10);
  v45 = self;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v11 = (id)metricsCountersPersistentStorePath;
    v12 = objc_alloc(MEMORY[0x1E0D33478]);
    v13 = (HMMCountersManager *)objc_msgSend(v12, "initWithDataModelName:atPath:", *MEMORY[0x1E0D33410], v11);
    bridgedCountersManager = self->_bridgedCountersManager;
    self->_bridgedCountersManager = v13;

    v15 = self->_bridgedCountersManager;
    v53 = 0;
    v16 = -[HMMCountersManager loadPersistentStoreWithError:](v15, "loadPersistentStoreWithError:", &v53);
    v17 = v53;
    if (v16)
    {
      v18 = -[HMDEventCountersManager initWithBridgedCountersManager:bridgedDateProvider:]([HMDEventCountersManager alloc], "initWithBridgedCountersManager:bridgedDateProvider:", self->_bridgedCountersManager, v10);
      if (isInternalBuild())
      {
        objc_msgSend(v52, "objectForKey:", CFSTR("HMDStartupEphemeralContainer"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          -[HMMCountersManager addEphemeralContainerWithName:](self->_bridgedCountersManager, "addEphemeralContainerWithName:", v19);

      }
    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v23;
        v56 = 2112;
        v57 = v17;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new counters manager. Falling back to legacy manager. Error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(v51, "requestRadarWithDisplayReason:radarTitle:", CFSTR("persistent counter storage failed to load"), CFSTR("Failed to load persistent counter storage"));
      v24 = self->_bridgedCountersManager;
      self->_bridgedCountersManager = 0;

      v18 = objc_alloc_init(HMDEventCountersManager);
    }

  }
  else
  {
    v18 = objc_alloc_init(HMDEventCountersManager);
  }
  v42 = v18;
  v25 = objc_alloc(MEMORY[0x1E0D33470]);
  objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(HMDCoreAnalyticsLogEventFactory);
  v43 = (void *)objc_msgSend(v25, "initWithTagDispatcher:logEventSubmitter:logEventFactory:", v26, v8, v27);

  v47 = -[HMDNetworkObserver initWithLogEventDispatcher:countersManager:dailyScheduler:currentHomeDataSource:dateProvider:]([HMDNetworkObserver alloc], "initWithLogEventDispatcher:countersManager:dailyScheduler:currentHomeDataSource:dateProvider:", v8, v18, v9, self, v10);
  v40 = -[HMDMetricsDeviceStateManager initWithLogEventSubmitter:dailyScheduler:dateProvider:]([HMDMetricsDeviceStateManager alloc], "initWithLogEventSubmitter:dailyScheduler:dateProvider:", v8, v9, v10);
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "preferenceForKey:", CFSTR("backgroundLoggingPeriod"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "numberValue");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_alloc(MEMORY[0x1E0D286C8]);
  objc_msgSend(v41, "doubleValue");
  v31 = (void *)objc_msgSend(v30, "initWithTimeInterval:options:", 4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v33 = (void *)v9;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "softwareVersion");
  v35 = v8;
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "versionString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D334A0], "sharedManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[HMDMetricsManager initWithMessageDispatcher:accountManager:notificationSettingsProvider:logEventDispatcher:dailyScheduler:dateProvider:legacyCountersManager:flagsManager:ewsLogger:deviceStateManager:networkObserver:coreAnalyticsTagObserver:backgroundLoggingTimer:radarInitiator:notificationCenter:userDefaults:currentSoftwareVersion:](v45, "initWithMessageDispatcher:accountManager:notificationSettingsProvider:logEventDispatcher:dailyScheduler:dateProvider:legacyCountersManager:flagsManager:ewsLogger:deviceStateManager:networkObserver:coreAnalyticsTagObserver:backgroundLoggingTimer:radarInitiator:notificationCenter:userDefaults:currentSoftwareVersion:", v50, v49, v48, v35, v33, v10, v42, v44, v38, v40, v47, v43, v31, v51, v32,
          v52,
          v37);

  return v46;
}

- (HMDMetricsManager)initWithMessageDispatcher:(id)a3 accountManager:(id)a4 notificationSettingsProvider:(id)a5 logEventDispatcher:(id)a6 dailyScheduler:(id)a7 dateProvider:(id)a8 legacyCountersManager:(id)a9 flagsManager:(id)a10 ewsLogger:(id)a11 deviceStateManager:(id)a12 networkObserver:(id)a13 coreAnalyticsTagObserver:(id)a14 backgroundLoggingTimer:(id)a15 radarInitiator:(id)a16 notificationCenter:(id)a17 userDefaults:(id)a18 currentSoftwareVersion:(id)a19
{
  id v24;
  id v25;
  id v26;
  id v27;
  HMDMetricsManager *v28;
  HMDMetricsManager *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSMutableArray *aggregationAnalysisEventContributingAnalyzers;
  uint64_t v34;
  NSMutableArray *configurationObservers;
  NSString *v36;
  NSString *PRKitUUIDString;
  NSString *v38;
  NSString *PRKitDateString;
  id v42;
  id v43;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  objc_super v58;

  v57 = a3;
  v42 = a4;
  v56 = a4;
  v43 = a5;
  v55 = a5;
  v54 = a6;
  v53 = a7;
  v52 = a8;
  v51 = a9;
  v50 = a10;
  v24 = a11;
  v49 = a12;
  v48 = a13;
  v47 = a14;
  v25 = a15;
  v46 = a16;
  v45 = a17;
  v26 = a18;
  v27 = a19;
  v58.receiver = self;
  v58.super_class = (Class)HMDMetricsManager;
  v28 = -[HMDMetricsManager init](&v58, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_messageDispatcher, a3);
    objc_storeStrong((id *)&v29->_accountManager, v42);
    objc_storeStrong((id *)&v29->_notificationSettingsProvider, v43);
    objc_storeStrong((id *)&v29->_dailyScheduler, a7);
    objc_storeStrong((id *)&v29->_dateProvider, a8);
    objc_storeStrong((id *)&v29->_legacyCountersManager, a9);
    objc_storeStrong((id *)&v29->_flagsManager, a10);
    objc_storeWeak((id *)&v29->_ewsLogger, v24);
    objc_storeStrong((id *)&v29->_deviceStateManager, a12);
    objc_storeStrong((id *)&v29->_networkObserver, a13);
    objc_storeStrong((id *)&v29->_coreAnalyticsTagObserver, a14);
    objc_storeStrong((id *)&v29->_logEventDispatcher, a6);
    -[HMMLogEventDispatching setDataSource:](v29->_logEventDispatcher, "setDataSource:", v29);
    objc_msgSend(v25, "setDelegate:", v29);
    -[HMDMetricsManager logEventDispatcher](v29, "logEventDispatcher");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "clientQueue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDelegateQueue:", v31);

    objc_msgSend(v25, "resume");
    objc_storeStrong((id *)&v29->_backgroundLoggingTimer, a15);
    objc_storeStrong((id *)&v29->_radarInitiator, a16);
    objc_storeStrong((id *)&v29->_notificationCenter, a17);
    objc_storeStrong((id *)&v29->_userDefaults, a18);
    objc_storeStrong((id *)&v29->_currentSoftwareVersion, a19);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = objc_claimAutoreleasedReturnValue();
    aggregationAnalysisEventContributingAnalyzers = v29->_aggregationAnalysisEventContributingAnalyzers;
    v29->_aggregationAnalysisEventContributingAnalyzers = (NSMutableArray *)v32;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = objc_claimAutoreleasedReturnValue();
    configurationObservers = v29->_configurationObservers;
    v29->_configurationObservers = (NSMutableArray *)v34;

    if (isInternalBuild())
    {
      v36 = (NSString *)CFPreferencesCopyAppValue(CFSTR("HMDUpdaterCurrentUUID"), CFSTR("com.apple.homed"));
      PRKitUUIDString = v29->_PRKitUUIDString;
      v29->_PRKitUUIDString = v36;

      v38 = (NSString *)CFPreferencesCopyAppValue(CFSTR("HMDUpdaterCurrentDate"), CFSTR("com.apple.homed"));
      PRKitDateString = v29->_PRKitDateString;
      v29->_PRKitDateString = v38;

    }
    objc_msgSend(v24, "addCommonField:withValue:", CFSTR("isHH2Enabled"), &unk_1E8B33360, a3);
    -[HMDMetricsManager _configureObservers](v29, "_configureObservers");
    -[HMDMetricsManager _configureManagers](v29, "_configureManagers");
    -[HMDMetricsManager _registerForMessages](v29, "_registerForMessages");
  }

  return v29;
}

- (void)_configureObservers
{
  HMDCoreAnalyticsLogEventObserverDelegate *v3;
  HMDCoreAnalyticsLogEventObserverDelegate *coreAnalyticsDelegate;
  HMDLogEventWeekBasedFilter *v5;
  NSArray *v6;
  NSArray *coreAnalyticsFilters;
  HMMCoreAnalyticsLogEventObserver *v8;
  HMMCoreAnalyticsLogEventObserver *coreAnalyticsObserver;
  HMDDiagnosticReporterLogObserver *v10;
  HMDDiagnosticReporterLogObserver *diagnosticReporterLogObserver;
  HMDPowerLogObserver *v12;
  HMDPowerLogObserver *powerLogObserver;
  id v14;
  void *v15;
  HMMSiriSELFLogEventObserver *v16;
  HMMSiriSELFLogEventObserver *siriSELFLoggingObserver;
  HMDHH2AutoMigrationEligibilityLogEventSubmitter *v18;
  void *v19;
  HMDHH2AutoMigrationEligibilityLogEventSubmitter *v20;
  HMDHH2AutoMigrationEligibilityLogEventSubmitter *hh2AutoMigrationEligibilitySubmitter;
  HMDLogEventCountingAnalyzer *v22;
  HMDEventCountersManager *legacyCountersManager;
  HMDLogEventDailyScheduler *dailyScheduler;
  HMMDateProvider *dateProvider;
  void *v26;
  void *v27;
  HMDLogEventCountingAnalyzer *v28;
  HMDLogEventCountingAnalyzer *eventCountingAnalyzer;
  HMDHH2MigrationLogEventsAnalyzer *v30;
  HMDHH2MigrationLogEventsAnalyzer *hh2MigrationAnalyzer;
  HMDCloudSyncLogEventsAnalyzer *v32;
  HMDCloudSyncLogEventsAnalyzer *cloudSyncLogEventsAnalyzer;
  HMDLogEventErrorEventsAnalyzer *v34;
  HMDLogEventErrorEventsAnalyzer *errorEventsAnalyzer;
  HMDLogEventHAPMetricsEventAnalyzer *v36;
  HMDLogEventHAPMetricsEventAnalyzer *hapEventsAnalyzer;
  HMDLogEventMessageEventsAnalyzer *v38;
  HMDLogEventMessageEventsAnalyzer *messagingEventsAnalyzer;
  void *v40;
  HMDMetricsPreferencesDebugManager *v41;
  HMDMetricsPreferencesDebugManager *preferencesDebugManager;
  HMDLogEventProcessLaunchAnalyzer *v43;
  HMDLogEventProcessLaunchAnalyzer *processLaunchEventsAnalyzer;
  HMDLogEventProcessMemoryEventsAnalyzer *v45;
  HMDLogEventProcessMemoryEventsAnalyzer *processMemoryEventsAnalyzer;
  HMDLogEventReachabilityEventsAnalyzer *v47;
  HMDLogEventReachabilityEventsAnalyzer *reachabilityEventsAnalyzer;
  HMDLogEventUserActivityAnalyzer *v49;
  HMDLogEventUserActivityAnalyzer *userActivityEventsAnalyzer;
  HMDLogEventElectionEventsAnalyzer *v51;
  HMDLogEventElectionEventsAnalyzer *electionEventsAnalyzer;
  HMDLogEventAccessoryFirmwareUpdateEventAnalyzer *v53;
  HMDLogEventAccessoryFirmwareUpdateEventAnalyzer *firmwareUpdateEventsAnalyzer;
  HMDLogEventBulletinNotificationsAnalyzer *v55;
  HMDLogEventBulletinNotificationsAnalyzer *bulletinNotificationsAnalyzer;
  HMDWidgetTimelineRefresherEventsAnalyzer *v57;
  HMDWidgetTimelineRefresherEventsAnalyzer *widgetTimelineRefresherEventsAnalyzer;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x1E0C80C00];
  v3 = -[HMDCoreAnalyticsLogEventObserverDelegate initWithDataSource:]([HMDCoreAnalyticsLogEventObserverDelegate alloc], "initWithDataSource:", self);
  coreAnalyticsDelegate = self->_coreAnalyticsDelegate;
  self->_coreAnalyticsDelegate = v3;

  v5 = -[HMDLogEventWeekBasedFilter initWithDateProvider:]([HMDLogEventWeekBasedFilter alloc], "initWithDateProvider:", self->_dateProvider);
  v59[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  coreAnalyticsFilters = self->_coreAnalyticsFilters;
  self->_coreAnalyticsFilters = v6;

  v8 = (HMMCoreAnalyticsLogEventObserver *)objc_msgSend(objc_alloc(MEMORY[0x1E0D33468]), "initWithDelegate:filters:", self->_coreAnalyticsDelegate, self->_coreAnalyticsFilters);
  coreAnalyticsObserver = self->_coreAnalyticsObserver;
  self->_coreAnalyticsObserver = v8;

  v10 = -[HMDDiagnosticReporterLogObserver initWithLogEventDispatcher:]([HMDDiagnosticReporterLogObserver alloc], "initWithLogEventDispatcher:", self->_logEventDispatcher);
  diagnosticReporterLogObserver = self->_diagnosticReporterLogObserver;
  self->_diagnosticReporterLogObserver = v10;

  v12 = -[HMDPowerLogObserver initWithLogEventDispatcher:]([HMDPowerLogObserver alloc], "initWithLogEventDispatcher:", self->_logEventDispatcher);
  powerLogObserver = self->_powerLogObserver;
  self->_powerLogObserver = v12;

  v14 = objc_alloc(MEMORY[0x1E0D334A8]);
  objc_msgSend(MEMORY[0x1E0D978A0], "sharedStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (HMMSiriSELFLogEventObserver *)objc_msgSend(v14, "initWithSiriAnalyticsStream:logEventDispatcher:", v15, self->_logEventDispatcher);
  siriSELFLoggingObserver = self->_siriSELFLoggingObserver;
  self->_siriSELFLoggingObserver = v16;

  v18 = [HMDHH2AutoMigrationEligibilityLogEventSubmitter alloc];
  dispatch_get_global_queue(-32768, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HMDHH2AutoMigrationEligibilityLogEventSubmitter initWithEligibilityStatusDataSource:analyzerDataSource:workQueue:](v18, "initWithEligibilityStatusDataSource:analyzerDataSource:workQueue:", self, self, v19);
  hh2AutoMigrationEligibilitySubmitter = self->_hh2AutoMigrationEligibilitySubmitter;
  self->_hh2AutoMigrationEligibilitySubmitter = v20;

  if (isInternalBuild())
  {
    v22 = [HMDLogEventCountingAnalyzer alloc];
    legacyCountersManager = self->_legacyCountersManager;
    dailyScheduler = self->_dailyScheduler;
    dateProvider = self->_dateProvider;
    objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMLogEventDispatching clientQueue](self->_logEventDispatcher, "clientQueue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[HMDLogEventCountingAnalyzer initWithEventCountersManager:dailyScheduler:dateProvider:systemInfo:queue:](v22, "initWithEventCountersManager:dailyScheduler:dateProvider:systemInfo:queue:", legacyCountersManager, dailyScheduler, dateProvider, v26, v27);
    eventCountingAnalyzer = self->_eventCountingAnalyzer;
    self->_eventCountingAnalyzer = v28;

    v30 = -[HMDHH2MigrationLogEventsAnalyzer initWithDataSource:]([HMDHH2MigrationLogEventsAnalyzer alloc], "initWithDataSource:", self);
    hh2MigrationAnalyzer = self->_hh2MigrationAnalyzer;
    self->_hh2MigrationAnalyzer = v30;

  }
  v32 = -[HMDCloudSyncLogEventsAnalyzer initWithDataSource:]([HMDCloudSyncLogEventsAnalyzer alloc], "initWithDataSource:", self);
  cloudSyncLogEventsAnalyzer = self->_cloudSyncLogEventsAnalyzer;
  self->_cloudSyncLogEventsAnalyzer = v32;

  -[HMDMetricsManager addAnalyzer:toListOfAggregationAnalysisEventContributing:](self, "addAnalyzer:toListOfAggregationAnalysisEventContributing:", self->_cloudSyncLogEventsAnalyzer, self->_aggregationAnalysisEventContributingAnalyzers);
  v34 = -[HMDLogEventErrorEventsAnalyzer initWithDataSource:]([HMDLogEventErrorEventsAnalyzer alloc], "initWithDataSource:", self);
  errorEventsAnalyzer = self->_errorEventsAnalyzer;
  self->_errorEventsAnalyzer = v34;

  -[HMDMetricsManager addAnalyzer:toListOfAggregationAnalysisEventContributing:](self, "addAnalyzer:toListOfAggregationAnalysisEventContributing:", self->_errorEventsAnalyzer, self->_aggregationAnalysisEventContributingAnalyzers);
  v36 = -[HMDLogEventHAPMetricsEventAnalyzer initWithEventCountersManager:]([HMDLogEventHAPMetricsEventAnalyzer alloc], "initWithEventCountersManager:", self->_legacyCountersManager);
  hapEventsAnalyzer = self->_hapEventsAnalyzer;
  self->_hapEventsAnalyzer = v36;

  -[NSMutableArray addObject:](self->_aggregationAnalysisEventContributingAnalyzers, "addObject:", self->_hapEventsAnalyzer);
  v38 = -[HMDLogEventMessageEventsAnalyzer initWithDataSource:]([HMDLogEventMessageEventsAnalyzer alloc], "initWithDataSource:", self);
  messagingEventsAnalyzer = self->_messagingEventsAnalyzer;
  self->_messagingEventsAnalyzer = v38;

  -[HMDMetricsManager addAnalyzer:toListOfAggregationAnalysisEventContributing:](self, "addAnalyzer:toListOfAggregationAnalysisEventContributing:", self->_messagingEventsAnalyzer, self->_aggregationAnalysisEventContributingAnalyzers);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 8, 300.0);
  v41 = -[HMDMetricsPreferencesDebugManager initWithDataSource:]([HMDMetricsPreferencesDebugManager alloc], "initWithDataSource:", self);
  preferencesDebugManager = self->_preferencesDebugManager;
  self->_preferencesDebugManager = v41;

  v43 = -[HMDLogEventProcessLaunchAnalyzer initWithProcessLaunchInfoTimer:dataSource:preferencesDebugManager:]([HMDLogEventProcessLaunchAnalyzer alloc], "initWithProcessLaunchInfoTimer:dataSource:preferencesDebugManager:", v40, self, self->_preferencesDebugManager);
  processLaunchEventsAnalyzer = self->_processLaunchEventsAnalyzer;
  self->_processLaunchEventsAnalyzer = v43;

  -[HMDMetricsManager addAnalyzer:toListOfAggregationAnalysisEventContributing:](self, "addAnalyzer:toListOfAggregationAnalysisEventContributing:", self->_processLaunchEventsAnalyzer, self->_aggregationAnalysisEventContributingAnalyzers);
  v45 = -[HMDLogEventProcessMemoryEventsAnalyzer initWithDataSource:]([HMDLogEventProcessMemoryEventsAnalyzer alloc], "initWithDataSource:", self);
  processMemoryEventsAnalyzer = self->_processMemoryEventsAnalyzer;
  self->_processMemoryEventsAnalyzer = v45;

  -[HMDMetricsManager addAnalyzer:toListOfAggregationAnalysisEventContributing:](self, "addAnalyzer:toListOfAggregationAnalysisEventContributing:", self->_processMemoryEventsAnalyzer, self->_aggregationAnalysisEventContributingAnalyzers);
  v47 = -[HMDLogEventReachabilityEventsAnalyzer initWithEventCountersManager:]([HMDLogEventReachabilityEventsAnalyzer alloc], "initWithEventCountersManager:", self->_legacyCountersManager);
  reachabilityEventsAnalyzer = self->_reachabilityEventsAnalyzer;
  self->_reachabilityEventsAnalyzer = v47;

  -[HMDMetricsManager addAnalyzer:toListOfAggregationAnalysisEventContributing:](self, "addAnalyzer:toListOfAggregationAnalysisEventContributing:", self->_reachabilityEventsAnalyzer, self->_aggregationAnalysisEventContributingAnalyzers);
  v49 = -[HMDLogEventUserActivityAnalyzer initWithEventCountersManager:flagsManager:dateProvider:]([HMDLogEventUserActivityAnalyzer alloc], "initWithEventCountersManager:flagsManager:dateProvider:", self->_legacyCountersManager, self->_flagsManager, self->_dateProvider);
  userActivityEventsAnalyzer = self->_userActivityEventsAnalyzer;
  self->_userActivityEventsAnalyzer = v49;

  -[HMDMetricsManager addAnalyzer:toListOfAggregationAnalysisEventContributing:](self, "addAnalyzer:toListOfAggregationAnalysisEventContributing:", self->_userActivityEventsAnalyzer, self->_aggregationAnalysisEventContributingAnalyzers);
  v51 = -[HMDLogEventElectionEventsAnalyzer initWithDataSource:]([HMDLogEventElectionEventsAnalyzer alloc], "initWithDataSource:", self);
  electionEventsAnalyzer = self->_electionEventsAnalyzer;
  self->_electionEventsAnalyzer = v51;

  -[HMDMetricsManager addAnalyzer:toListOfAggregationAnalysisEventContributing:](self, "addAnalyzer:toListOfAggregationAnalysisEventContributing:", self->_electionEventsAnalyzer, self->_aggregationAnalysisEventContributingAnalyzers);
  v53 = -[HMDLogEventAccessoryFirmwareUpdateEventAnalyzer initWithEventCountersManager:]([HMDLogEventAccessoryFirmwareUpdateEventAnalyzer alloc], "initWithEventCountersManager:", self->_legacyCountersManager);
  firmwareUpdateEventsAnalyzer = self->_firmwareUpdateEventsAnalyzer;
  self->_firmwareUpdateEventsAnalyzer = v53;

  v55 = -[HMDLogEventBulletinNotificationsAnalyzer initWithDataSource:notificationSettingsProvider:]([HMDLogEventBulletinNotificationsAnalyzer alloc], "initWithDataSource:notificationSettingsProvider:", self, self->_notificationSettingsProvider);
  bulletinNotificationsAnalyzer = self->_bulletinNotificationsAnalyzer;
  self->_bulletinNotificationsAnalyzer = v55;

  -[HMDMetricsManager addAnalyzer:toListOfAggregationAnalysisEventContributing:](self, "addAnalyzer:toListOfAggregationAnalysisEventContributing:", self->_bulletinNotificationsAnalyzer, self->_aggregationAnalysisEventContributingAnalyzers);
  v57 = -[HMDWidgetTimelineRefresherEventsAnalyzer initWithEventCountersManager:logEventSubmitter:dailyScheduler:]([HMDWidgetTimelineRefresherEventsAnalyzer alloc], "initWithEventCountersManager:logEventSubmitter:dailyScheduler:", self->_legacyCountersManager, self->_logEventDispatcher, self->_dailyScheduler);
  widgetTimelineRefresherEventsAnalyzer = self->_widgetTimelineRefresherEventsAnalyzer;
  self->_widgetTimelineRefresherEventsAnalyzer = v57;

  -[HMDMetricsManager addAnalyzer:toListOfAggregationAnalysisEventContributing:](self, "addAnalyzer:toListOfAggregationAnalysisEventContributing:", self->_widgetTimelineRefresherEventsAnalyzer, self->_aggregationAnalysisEventContributingAnalyzers);
}

- (void)addAnalyzer:(id)a3 toListOfAggregationAnalysisEventContributing:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EFA95190))
    objc_msgSend(v5, "addObject:", v6);

}

- (void)_configureManagers
{
  HMDMetricsAccessoryDetailsManager *v3;
  HMDMetricsAccessoryDetailsManager *accessoryDetailsManager;
  HMDHouseholdMetricsManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMMDateProvider *dateProvider;
  void *v11;
  HMDHouseholdMetricsManager *v12;
  HMDHouseholdMetricsManager *householdMetricsManager;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = -[HMDMetricsAccessoryDetailsManager initWithDataSource:]([HMDMetricsAccessoryDetailsManager alloc], "initWithDataSource:", self);
  accessoryDetailsManager = self->_accessoryDetailsManager;
  self->_accessoryDetailsManager = v3;

  v5 = [HMDHouseholdMetricsManager alloc];
  -[HMDMetricsManager legacyCountersManager](self, "legacyCountersManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMetricsManager accessoryDetailsManager](self, "accessoryDetailsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMetricsManager dailyScheduler](self, "dailyScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dateProvider = self->_dateProvider;
  v14[0] = self->_userActivityEventsAnalyzer;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDHouseholdMetricsManager initWithCountersManager:dataSource:accessoryDetailsManager:dailyScheduler:logEventSubmitter:dateProvider:activityContributors:](v5, "initWithCountersManager:dataSource:accessoryDetailsManager:dailyScheduler:logEventSubmitter:dateProvider:activityContributors:", v6, self, v7, v8, v9, dateProvider, v11);
  householdMetricsManager = self->_householdMetricsManager;
  self->_householdMetricsManager = v12;

}

- (void)_registerForMessages
{
  void *v3;
  uint64_t v4;
  void *v5;
  HMDMetricsManager *v6;
  NSObject *v7;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "productVariant");

  if (v4 == 3)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering for homeutil messages", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDMetricsManager messageDispatcher](v6, "messageDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", CFSTR("readCounters"), v6, v11, sel__handleReadCounters_);

    -[HMDMetricsManager messageDispatcher](v6, "messageDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerForMessage:receiver:policies:selector:", CFSTR("saveCounters"), v6, v14, sel__handleSaveCounters_);

    -[HMDMetricsManager messageDispatcher](v6, "messageDispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerForMessage:receiver:policies:selector:", CFSTR("deleteCounters"), v6, v17, sel__handleDeleteCounters_);

    -[HMDMetricsManager messageDispatcher](v6, "messageDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerForMessage:receiver:policies:selector:", CFSTR("addEphemeralContainer"), v6, v20, sel__handleAddEphemeralContainer_);

    -[HMDMetricsManager messageDispatcher](v6, "messageDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerForMessage:receiver:policies:selector:", CFSTR("deactivateEphemeralContainer"), v6, v23, sel__handleDeactivateEphemeralContainer_);

    -[HMDMetricsManager messageDispatcher](v6, "messageDispatcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "registerForMessage:receiver:policies:selector:", CFSTR("deleteEphemeralContainer"), v6, v26, sel__handleDeleteEphemeralContainer_);

    -[HMDMetricsManager messageDispatcher](v6, "messageDispatcher");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "registerForMessage:receiver:policies:selector:", CFSTR("startupEphemeralContainer"), v6, v29, sel__handleStartupEphemeralContainer_);

    -[HMDMetricsManager messageDispatcher](v6, "messageDispatcher");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "registerForMessage:receiver:policies:selector:", CFSTR("listEphemeralContainers"), v6, v32, sel__handleListEphemeralContainers_);

    -[HMDMetricsManager messageDispatcher](v6, "messageDispatcher");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "registerForMessage:receiver:policies:selector:", CFSTR("fetchEventCounters"), v6, v35, sel__handleFetchEventCounters_);

    -[HMDMetricsManager messageDispatcher](v6, "messageDispatcher");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "registerForMessage:receiver:policies:selector:", CFSTR("resetEventCounters"), v6, v38, sel__handleResetEventCounters_);

    -[HMDMetricsManager messageDispatcher](v6, "messageDispatcher");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "registerForMessage:receiver:policies:selector:", CFSTR("logEventDailySchedulerRequestStatus"), v6, v41, sel__handleLogEventDailySchedulerStatusRequest_);

    -[HMDMetricsManager messageDispatcher](v6, "messageDispatcher");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "registerForMessage:receiver:policies:selector:", CFSTR("logEventDailySchedulerRunRegisteredBlocks"), v6, v44, sel__handleLogEventDailySchedulerSubmitRequest_);

  }
}

- (void)configureHAPMetricsDispatcher:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLogDispatcher:", v5);

}

- (void)startMetricsCollection
{
  os_unfair_lock_s *p_lock;
  void *v4;
  HMDMetricsManager *v5;
  NSObject *v6;
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
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[HMDMetricsManager metricsCollectionStarted](self, "metricsCollectionStarted"))
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Metrics collection already started", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[HMDMetricsManager setMetricsCollectionStarted:](self, "setMetricsCollectionStarted:", 1);
    os_unfair_lock_unlock(p_lock);
    -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMetricsManager coreAnalyticsObserver](self, "coreAnalyticsObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forProtocol:", v9, &unk_1EFA5A9F0);

    -[HMDMetricsManager registerTaggedLoggingProcessors](self, "registerTaggedLoggingProcessors");
    -[HMDMetricsManager diagnosticReporterLogObserver](self, "diagnosticReporterLogObserver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "start");

    -[HMDMetricsManager powerLogObserver](self, "powerLogObserver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "start");

    -[HMDMetricsManager coreAnalyticsTagObserver](self, "coreAnalyticsTagObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configure");

    -[HMDMetricsManager startAnalyzers](self, "startAnalyzers");
    -[HMDMetricsManager registerEWSTriggers](self, "registerEWSTriggers");
    -[HMDMetricsManager registerTTRTriggers](self, "registerTTRTriggers");
    -[HMDMetricsManager dailyScheduler](self, "dailyScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerDailyTaskRunner:", self);

    os_unfair_lock_lock_with_options();
    v14 = (void *)bufferedSubmitter;
    -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "processLogEventsWithSubmitter:", v15);

    v16 = (void *)bufferedSubmitter;
    bufferedSubmitter = 0;

    -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)sharedDispatcher;
    sharedDispatcher = v17;

    os_unfair_lock_unlock((os_unfair_lock_t)&sharedSubmitterLock);
  }
}

- (void)runDailyTask
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  HMDMetricsManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  HMDCameraConfigurationsLogEvent *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDCameraConfigurationsLogEvent *v26;
  void *v27;
  HMDWatchConnectivityLogEvent *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "productVariant");

  if (v4 == 3)
  {
    objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serialNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v10;
        v46 = 2112;
        v47 = v6;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@[CA] Serial Number: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
    }

  }
  if (-[HMDMetricsManager updateCachedWidgetCount](self, "updateCachedWidgetCount"))
    -[HMDMetricsManager homeKitConfigurationChanged](self, "homeKitConfigurationChanged");
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[HMDMetricsManager cachedConfiguration](self, "cachedConfiguration", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homeConfigurations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v40;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v16);
        -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "submitLogEvent:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v14);
  }

  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMetricsManager cachedConfiguration](self, "cachedConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "submitLogEvent:", v20);

  -[HMDMetricsManager submitCurrentUserSettings](self, "submitCurrentUserSettings");
  v21 = [HMDCameraConfigurationsLogEvent alloc];
  v22 = (void *)MEMORY[0x1E0C99D20];
  -[HMDMetricsManager homeManager](self, "homeManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "homes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[HMDCameraConfigurationsLogEvent initWithHomes:](v21, "initWithHomes:", v25);

  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "submitLogEvent:", v26);

  v28 = objc_alloc_init(HMDWatchConnectivityLogEvent);
  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "submitLogEvent:", v28);

  -[HMDMetricsManager messagingEventsAnalyzer](self, "messagingEventsAnalyzer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "submitDailyMessageEvents");

  -[HMDMetricsManager submitDailyAggregationAnalysisEvents](self, "submitDailyAggregationAnalysisEvents");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (isInternalBuild())
  {
    -[HMDMetricsManager PRKitUUIDString](self, "PRKitUUIDString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("HomePRKitUUID"));

    -[HMDMetricsManager PRKitDateString](self, "PRKitDateString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("HomePRKitDate"));

  }
  -[HMDMetricsManager ewsLogger](self, "ewsLogger");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "submitEventWithName:serviceName:uploadImmediately:payload:", CFSTR("Daily heartbeat"), CFSTR("EWS Heartbeat"), 0, v31);

  -[HMDMetricsManager dateProvider](self, "dateProvider");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "startOfDayByAddingDayCount:", -7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMetricsManager dateProvider](self, "dateProvider");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "startOfDayByAddingDayCount:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMCountersManager deletePartitionsBeforeDate:](self->_bridgedCountersManager, "deletePartitionsBeforeDate:", v36);
  -[HMMCountersManager deletePartitionsAfterDate:](self->_bridgedCountersManager, "deletePartitionsAfterDate:", v38);

}

- (void)submitCurrentUserSettings
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  HMDUserSettingsPerHomeLogEvent *v10;
  void *v11;
  HMDUserSettingsPerHomeLogEvent *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDMetricsManager homeManager](self, "homeManager", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = [HMDUserSettingsPerHomeLogEvent alloc];
        objc_msgSend(v9, "currentUser");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[HMDUserSettingsPerHomeLogEvent initWithUser:](v10, "initWithUser:", v11);

        -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "submitLogEvent:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)submitDailyAggregationAnalysisEvents
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HMDMetricsManager_submitDailyAggregationAnalysisEvents__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (id)homeKitAggregationAnalysisLogEventForDate:(id)a3
{
  id v4;
  HMDAggregationAnalysisLogEvent *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(HMDAggregationAnalysisLogEvent);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDMetricsManager aggregationAnalysisEventContributingAnalyzers](self, "aggregationAnalysisEventContributingAnalyzers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "populateAggregationAnalysisLogEvent:forDate:", v5, v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)resetHomeKitAggregationAnalysisContext
{
  void *v2;
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
  -[HMDMetricsManager aggregationAnalysisEventContributingAnalyzers](self, "aggregationAnalysisEventContributingAnalyzers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "resetAggregationAnalysisContext");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)timerDidFire:(id)a3
{
  -[HMDMetricsManager logEventAggregationAnalysisLogEvents](self, "logEventAggregationAnalysisLogEvents", a3);
  -[HMDMetricsManager submitHAPMetricsCounters](self, "submitHAPMetricsCounters");
}

- (void)logEventAggregationAnalysisLogEvents
{
  void *v3;
  void *v4;
  void *v5;
  HMDMetricsManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMetricsManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMDMetricsManager dateProvider](self, "dateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfCurrentDay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMetricsManager homeKitAggregationAnalysisLogEventForDate:](v6, "homeKitAggregationAnalysisLogEventForDate:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Current state of aggregated event counts since last metric submission (reset every 24 hrs): %{public}@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = v6;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMetricsManager errorEventsAnalyzer](v12, "errorEventsAnalyzer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorEventsAnalyzedSummaryForDate:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v14;
    v19 = 2114;
    v20 = v16;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Current state of aggregated error counts since last metric submission (reset every 24 hrs): %{public}@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v11);

}

- (void)submitHAPMetricsCounters
{
  HMDHAPMetricsLogEvent *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDMetricsManager *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(HMDHAPMetricsLogEvent);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = self;
  -[HMDMetricsManager homeManager](self, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v10, "hapAccessories");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v24 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend(v16, "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "matchingHAPAccessoryWithServerIdentifier:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v18, "server");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
                -[HMDHAPMetricsLogEvent updateWithHAPAccessoryServer:](v3, "updateWithHAPAccessoryServer:", v19);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v13);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  -[HMDMetricsManager logEventDispatcher](v21, "logEventDispatcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "submitLogEvent:", v3);

}

- (void)addConfigurationChangedObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *configurationObservers;
  void *v6;
  id aBlock;

  aBlock = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  configurationObservers = self->_configurationObservers;
  v6 = _Block_copy(aBlock);
  -[NSMutableArray addObject:](configurationObservers, "addObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)configurationObservers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_configurationObservers, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)homeKitConfigurationChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];

  -[HMDMetricsManager homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDMetricsManager processLaunchEventsAnalyzer](self, "processLaunchEventsAnalyzer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeKitConfigurationChangedWithHomeManager:", v3);

    -[HMDMetricsManager cachedConfiguration](self, "cachedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HMDMetricsManager updateCachedConfiguration](self, "updateCachedConfiguration");
    }
    else
    {
      -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clientQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__HMDMetricsManager_homeKitConfigurationChanged__block_invoke;
      block[3] = &unk_1E89C2730;
      block[4] = self;
      dispatch_async(v7, block);

    }
  }

}

- (void)updateCachedConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  HMDConfigurationLogEvent *v6;
  void *v7;
  HMDConfigurationLogEvent *v8;
  HMDConfigurationLogEvent *cachedConfiguration;
  HMDConfigurationLogEvent *v10;

  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v6 = [HMDConfigurationLogEvent alloc];
  -[HMDMetricsManager homeManager](self, "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDConfigurationLogEvent initWithHomeManager:widgetDataSource:metadataVersion:](v6, "initWithHomeManager:widgetDataSource:metadataVersion:", v7, self, v5);

  os_unfair_lock_lock_with_options();
  cachedConfiguration = self->_cachedConfiguration;
  self->_cachedConfiguration = v8;
  v10 = v8;

  os_unfair_lock_unlock(&self->_lock);
  -[HMDMetricsManager notifyConfigurationObserversWithUpdatedEvent:](self, "notifyConfigurationObserversWithUpdatedEvent:", v10);

}

- (void)notifyConfigurationObserversWithUpdatedEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDMetricsManager configurationObservers](self, "configurationObservers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (HMDConfigurationLogEvent)cachedConfiguration
{
  os_unfair_lock_s *p_lock;
  HMDConfigurationLogEvent *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_cachedConfiguration;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)cachedHomeConfigurationForHomeUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
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
  -[HMDMetricsManager cachedConfiguration](self, "cachedConfiguration", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "homeUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)accessoryForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HMDMetricsManager homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v7 = *(_QWORD *)v27;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v9, "accessories", v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v15, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqual:", v4);

              if ((v17 & 1) != 0)
              {
                v18 = v15;

                goto LABEL_19;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v12)
              continue;
            break;
          }
        }

        v7 = v20;
      }
      v18 = 0;
      v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (BOOL)updateCachedWidgetCount
{
  void *v3;
  void *v4;
  int64_t v5;
  os_unfair_lock_s *p_lock;
  BOOL v7;

  -[HMDMetricsManager homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetConfigurationReader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "homeWidgetsEnabledCount");

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v5 < 0 || v5 == self->_configuredWidgetsCount)
  {
    v7 = 0;
  }
  else
  {
    self->_configuredWidgetsCount = v5;
    v7 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)registerTaggedLoggingProcessors
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D334C0];
  v6[0] = *MEMORY[0x1E0D33228];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__HMDMetricsManager_registerTaggedLoggingProcessors__block_invoke;
  v5[3] = &unk_1E89AF310;
  v5[4] = self;
  objc_msgSend(v3, "addObserverForStartTags:usingCreatorBlock:", v4, v5);

}

- (void)startAnalyzers
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
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[7];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMetricsManager processMemoryEventsAnalyzer](self, "processMemoryEventsAnalyzer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forEventClasses:", v4, v5);

  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMetricsManager userActivityEventsAnalyzer](self, "userActivityEventsAnalyzer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  v26[4] = objc_opt_class();
  v26[5] = objc_opt_class();
  v26[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forEventClasses:", v7, v8);

  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMetricsManager hapEventsAnalyzer](self, "hapEventsAnalyzer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:forEventClasses:", v10, v11);

  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMetricsManager firmwareUpdateEventsAnalyzer](self, "firmwareUpdateEventsAnalyzer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:forEventClasses:", v13, v14);

  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMetricsManager reachabilityEventsAnalyzer](self, "reachabilityEventsAnalyzer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:forEventClasses:", v16, v17);

  if (isInternalBuild())
  {
    -[HMDMetricsManager eventCountingAnalyzer](self, "eventCountingAnalyzer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMetricsManager eventCountingAnalyzer](self, "eventCountingAnalyzer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:forProtocol:", v20, &unk_1EFA59580);

    }
  }
  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMetricsManager widgetTimelineRefresherEventsAnalyzer](self, "widgetTimelineRefresherEventsAnalyzer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObserver:forEventClass:", v22, objc_opt_class());

}

- (void)registerEWSTriggers
{
  -[HMDMetricsManager addThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("sentIDSMessageCount"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"), 5000);
  -[HMDMetricsManager addThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("receivedIDSMessageCount"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"), 5000);
  -[HMDMetricsManager addThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("sentIDSProxyMessageCount"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"), 5000);
  -[HMDMetricsManager addThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("receivedIDSProxyMessageCount"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"), 5000);
  -[HMDMetricsManager addThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("sentLoXYMessageCount"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"), 5000);
  -[HMDMetricsManager addThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("receivedLoXYMessageCount"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"), 5000);
  -[HMDMetricsManager addRateTrigger:forEventName:requestGroup:atThreshold:windowSize:](self, "addRateTrigger:forEventName:requestGroup:atThreshold:windowSize:", CFSTR("sentIDSMessageRate"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"), 100, 3600);
  -[HMDMetricsManager addRateTrigger:forEventName:requestGroup:atThreshold:windowSize:](self, "addRateTrigger:forEventName:requestGroup:atThreshold:windowSize:", CFSTR("receivedIDSMessageRate"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"), 100, 3600);
  -[HMDMetricsManager addRateTrigger:forEventName:requestGroup:atThreshold:windowSize:](self, "addRateTrigger:forEventName:requestGroup:atThreshold:windowSize:", CFSTR("sentIDSProxyMessageRate"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"), 100, 3600);
  -[HMDMetricsManager addRateTrigger:forEventName:requestGroup:atThreshold:windowSize:](self, "addRateTrigger:forEventName:requestGroup:atThreshold:windowSize:", CFSTR("receivedIDSProxyMessageRate"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"), 100, 3600);
  -[HMDMetricsManager addRateTrigger:forEventName:requestGroup:atThreshold:windowSize:](self, "addRateTrigger:forEventName:requestGroup:atThreshold:windowSize:", CFSTR("sentLoXYMessageRate"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"), 100, 3600);
  -[HMDMetricsManager addRateTrigger:forEventName:requestGroup:atThreshold:windowSize:](self, "addRateTrigger:forEventName:requestGroup:atThreshold:windowSize:", CFSTR("receivedLoXYMessageRate"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"), 100, 3600);
  -[HMDMetricsManager addThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("memoryPressureStateCritical"), CFSTR("HMDLogEventProcessMemoryEventsAnalyzerProcessMemoryPressureStateCriticalEventCounter"), CFSTR("HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"), 1);
}

- (void)addThresholdTrigger:(id)a3 forEventName:(id)a4 requestGroup:(id)a5 atThreshold:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  HMDCounterThresholdLoggingTrigger *v13;
  void *v14;
  HMDCounterThresholdLoggingTrigger *v15;
  id v16;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[HMDMetricsManager legacyCountersManager](self, "legacyCountersManager");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v13 = [HMDCounterThresholdLoggingTrigger alloc];
  -[HMDMetricsManager ewsLogger](self, "ewsLogger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDCounterThresholdLoggingTrigger initWithThreshold:counterName:ewsLogger:](v13, "initWithThreshold:counterName:ewsLogger:", a6, v12, v14);

  objc_msgSend(v16, "addObserver:forEventName:requestGroup:", v15, v11, v10);
}

- (void)addThresholdTrigger:(id)a3 forEventName:(id)a4 requestGroup:(id)a5 atThreshold:(unint64_t)a6 uploadImmediately:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  HMDCounterThresholdLoggingTrigger *v15;
  void *v16;
  HMDCounterThresholdLoggingTrigger *v17;
  id v18;

  v7 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[HMDMetricsManager legacyCountersManager](self, "legacyCountersManager");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v15 = [HMDCounterThresholdLoggingTrigger alloc];
  -[HMDMetricsManager ewsLogger](self, "ewsLogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDCounterThresholdLoggingTrigger initWithThreshold:counterName:uploadImmediately:ewsLogger:](v15, "initWithThreshold:counterName:uploadImmediately:ewsLogger:", a6, v14, v7, v16);

  objc_msgSend(v18, "addObserver:forEventName:requestGroup:", v17, v13, v12);
}

- (void)addRateTrigger:(id)a3 forEventName:(id)a4 requestGroup:(id)a5 atThreshold:(unint64_t)a6 windowSize:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  HMDCounterRateLoggingTrigger *v15;
  void *v16;
  HMDCounterRateLoggingTrigger *v17;
  id v18;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[HMDMetricsManager legacyCountersManager](self, "legacyCountersManager");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v15 = [HMDCounterRateLoggingTrigger alloc];
  -[HMDMetricsManager ewsLogger](self, "ewsLogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDCounterRateLoggingTrigger initWithThreshold:windowSize:counterName:ewsLogger:](v15, "initWithThreshold:windowSize:counterName:ewsLogger:", a6, a7, v14, v16);

  objc_msgSend(v18, "addObserver:forEventName:requestGroup:", v17, v13, v12);
}

- (void)registerTTRTriggers
{
  if (isInternalBuild())
  {
    -[HMDMetricsManager addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("Remote Message Counts"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"), 100000);
    -[HMDMetricsManager addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("Remote Message Counts"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"), 100000);
    -[HMDMetricsManager addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("Remote Message Counts"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"), 100000);
    -[HMDMetricsManager addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("Remote Message Counts"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeSecureEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"), 100000);
    -[HMDMetricsManager addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("Remote Message Counts"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"), 100000);
    -[HMDMetricsManager addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("Remote Message Counts"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"), 100000);
    -[HMDMetricsManager addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("Remote Message Counts"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"), 100000);
    -[HMDMetricsManager addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:](self, "addTTRThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("Remote Message Counts"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeSecureEventCounter"), CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"), 100000);
  }
}

- (void)addTTRThresholdTrigger:(id)a3 forEventName:(id)a4 requestGroup:(id)a5 atThreshold:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  HMDCounterThresholdTTRTrigger *v13;
  void *v14;
  HMDCounterThresholdTTRTrigger *v15;
  id v16;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[HMDMetricsManager legacyCountersManager](self, "legacyCountersManager");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v13 = [HMDCounterThresholdTTRTrigger alloc];
  -[HMDMetricsManager radarInitiator](self, "radarInitiator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDCounterThresholdTTRTrigger initWithThreshold:ttrCategory:radarInitiator:](v13, "initWithThreshold:ttrCategory:radarInitiator:", a6, v12, v14);

  objc_msgSend(v16, "addObserver:forEventName:requestGroup:", v15, v11, v10);
}

- (BOOL)_canRunCountersManagerCommand:(id)a3
{
  HMMCountersManager *bridgedCountersManager;
  void *v4;
  id v5;
  void *v6;

  bridgedCountersManager = self->_bridgedCountersManager;
  if (!bridgedCountersManager)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = a3;
    objc_msgSend(v4, "hmfErrorWithCode:reason:", 5, CFSTR("New counters manager is not enabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "respondWithError:", v6);

  }
  return bridgedCountersManager != 0;
}

- (void)_handleReadCounters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HMMCountersManager *bridgedCountersManager;
  HMMCountersManager *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[2];
  _QWORD v75[4];

  v75[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:", v4))
  {
    objc_msgSend(v4, "stringForKey:", CFSTR("groupName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("homeUUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("accessoryUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("counter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("statistics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateForKey:", CFSTR("partition"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("ephemeralContainerName"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && v9)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = CFSTR("You can only choose a counter or statistic and not both");
    }
    else
    {
      if (!v54 || !v55)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setLocale:", v14);

        objc_msgSend(v13, "setDateFormat:", CFSTR("MM/dd/yyyy"));
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v13;
        objc_msgSend(v13, "setTimeZone:", v15);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          bridgedCountersManager = self->_bridgedCountersManager;
          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v65[2] = __41__HMDMetricsManager__handleReadCounters___block_invoke;
          v65[3] = &unk_1E89AF338;
          v66 = v5;
          v67 = v6;
          v68 = v7;
          v69 = v55;
          v70 = v8;
          v71 = v16;
          v72 = v54;
          v73 = v13;
          -[HMMCountersManager enumerateCounterGroupsUsingBlock:](bridgedCountersManager, "enumerateCounterGroupsUsingBlock:", v65);

        }
        if (!v8)
        {
          v18 = self->_bridgedCountersManager;
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __41__HMDMetricsManager__handleReadCounters___block_invoke_2;
          v56[3] = &unk_1E89AF360;
          v57 = v5;
          v58 = v6;
          v59 = v7;
          v60 = v55;
          v61 = v9;
          v62 = v16;
          v63 = v54;
          v64 = v13;
          -[HMMCountersManager enumerateStatisticsGroupsUsingBlock:](v18, "enumerateStatisticsGroupsUsingBlock:", v56);

        }
        v49 = v16;
        v50 = v7;
        v51 = v6;
        v52 = v5;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDMetricsManager cachedConfiguration](self, "cachedConfiguration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "softwareVersion");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "buildVersion");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, CFSTR("build"));

        objc_msgSend(v20, "modelIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("model"));

        v48 = v21;
        objc_msgSend(v21, "serialNumber");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, CFSTR("serialNumber"));

        objc_msgSend(v20, "productPlatform");
        HMFProductPlatformToString();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, CFSTR("platform"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "totalHomes"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v28, CFSTR("totalHomes"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v22, "totalUsers"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v29, CFSTR("totalUsers"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "totalAccessories"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v30, CFSTR("totalAccessories"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "totalHAPAccessories"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v31, CFSTR("totalHAPAccessories"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "totalCHIPAccessories"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v32, CFSTR("totalMatterAccessories"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "totalThreadAccessories"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v33, CFSTR("totalThreadAccessories"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "totalCameraAccessories"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v34, CFSTR("totalCameraAccessories"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "totalAppleAudioAccessories"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v35, CFSTR("totalAppleAudioAccessories"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "totalAppleTVAccessories"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v36, CFSTR("totalAppleTVAccessories"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "totalScenes"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v37, CFSTR("totalScenes"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "totalTriggers"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v38, CFSTR("totalTriggers"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v22, "totalWidgets"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v39, CFSTR("totalWidgets"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v22, "isFMFDevice"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v40, CFSTR("isFMFDevice"));

        objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("isHH2Enabled"));
        if (v55)
        {
          v41 = (void *)MEMORY[0x1E0CB37E8];
          -[HMMCountersManager managedEphemeralContainerForName:](self->_bridgedCountersManager, "managedEphemeralContainerForName:", v55);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "activeDuration");
          objc_msgSend(v41, "numberWithLong:", llround(v43));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v44, CFSTR("durationSecs"));

        }
        v74[0] = CFSTR("commonDimensions");
        v45 = (void *)objc_msgSend(v19, "copy");
        v74[1] = CFSTR("groups");
        v75[0] = v45;
        v46 = (void *)objc_msgSend(v49, "copy");
        v75[1] = v46;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithPayload:", v47);

        v6 = v51;
        v5 = v52;
        v7 = v50;
        goto LABEL_16;
      }
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = CFSTR("You can only choose a partition or ephemeral container and not both");
    }
    objc_msgSend(v10, "hmfErrorWithCode:reason:", 3, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);

LABEL_16:
  }

}

- (void)_handleSaveCounters:(id)a3
{
  id v4;

  v4 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:"))
  {
    -[HMMCountersManager save](self->_bridgedCountersManager, "save");
    objc_msgSend(v4, "respondWithSuccess");
  }

}

- (void)_handleDeleteCounters:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:"))
  {
    objc_msgSend(v6, "dateForKey:", CFSTR("beforeDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateForKey:", CFSTR("afterDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[HMMCountersManager deletePartitionsBeforeDate:](self->_bridgedCountersManager, "deletePartitionsBeforeDate:", v4);
    if (v5)
      -[HMMCountersManager deletePartitionsAfterDate:](self->_bridgedCountersManager, "deletePartitionsAfterDate:", v5);
    objc_msgSend(v6, "respondWithSuccess");

  }
}

- (void)_handleAddEphemeralContainer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:"))
  {
    objc_msgSend(v6, "stringForKey:", CFSTR("ephemeralContainerName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 3, CFSTR("Ephemeral container name required"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "respondWithError:", v5);

    }
    -[HMMCountersManager addEphemeralContainerWithName:](self->_bridgedCountersManager, "addEphemeralContainerWithName:", v4);
    objc_msgSend(v6, "respondWithSuccess");

  }
}

- (void)_handleDeactivateEphemeralContainer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:"))
  {
    objc_msgSend(v6, "stringForKey:", CFSTR("ephemeralContainerName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 3, CFSTR("Ephemeral container name required"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "respondWithError:", v5);

    }
    -[HMMCountersManager deactivateEphemeralContainerWithName:](self->_bridgedCountersManager, "deactivateEphemeralContainerWithName:", v4);
    objc_msgSend(v6, "respondWithSuccess");

  }
}

- (void)_handleDeleteEphemeralContainer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:"))
  {
    objc_msgSend(v6, "stringForKey:", CFSTR("ephemeralContainerName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 3, CFSTR("Ephemeral container name required"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "respondWithError:", v5);

    }
    -[HMMCountersManager removeEphemeralContainerWithName:](self->_bridgedCountersManager, "removeEphemeralContainerWithName:", v4);
    objc_msgSend(v6, "respondWithSuccess");

  }
}

- (void)_handleStartupEphemeralContainer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:"))
  {
    objc_msgSend(v7, "stringForKey:", CFSTR("ephemeralContainerName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMetricsManager userDefaults](self, "userDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("HMDStartupEphemeralContainer"));
    else
      objc_msgSend(v5, "removeObjectForKey:", CFSTR("HMDStartupEphemeralContainer"));

    objc_msgSend(v7, "respondWithSuccess");
  }

}

- (void)_handleListEphemeralContainers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  const __CFString *v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:", v4))
  {
    -[HMMCountersManager managedEphemeralContainers](self->_bridgedCountersManager, "managedEphemeralContainers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "isActive", (_QWORD)v17));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "containerName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v9);
    }

    v21 = CFSTR("ephemeralContainers");
    v15 = (void *)objc_msgSend(v6, "copy");
    v22 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithPayload:", v16);

  }
}

- (void)_handleFetchEventCounters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDMetricsManager legacyCountersManager](self, "legacyCountersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAllEventCounters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __47__HMDMetricsManager__handleFetchEventCounters___block_invoke;
  v13 = &unk_1E89AF388;
  v14 = v7;
  v8 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v15 = CFSTR("countersManager");
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1, v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithPayload:", v9);

}

- (void)_handleResetEventCounters:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HMDMetricsManager legacyCountersManager](self, "legacyCountersManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetAllEventCounters");

  objc_msgSend(v5, "respondWithSuccess");
}

- (void)_handleLogEventDailySchedulerStatusRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDMetricsManager dailyScheduler](self, "dailyScheduler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithPayload:", v5);

}

- (void)_handleLogEventDailySchedulerSubmitRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HMDMetricsManager dailyScheduler](self, "dailyScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runHomeutilTasks");

  objc_msgSend(v5, "respondWithSuccess");
}

- (void)waitToCompleteCurrentlyQueuedTasks
{
  NSObject *v2;
  id v3;

  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_336_77453);

}

- (void)saveCounters
{
  id v2;

  -[HMDMetricsManager legacyCountersManager](self, "legacyCountersManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceSave");

}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_msgSend((id)objc_opt_class(), "namespaceUUID");
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDMetricsManager messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMDMetricsManager logEventDispatcher](self, "logEventDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (HMDDevice)currentDevice
{
  void *v2;
  void *v3;

  -[HMDMetricsManager accountManager](self, "accountManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDDevice *)v3;
}

- (NSArray)devicesOnCurrentAccount
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDMetricsManager accountManager](self, "accountManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)homeDataSources
{
  void *v2;
  void *v3;

  -[HMDMetricsManager homeManager](self, "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSUUID)homeUUIDForCurrentResidentDevice
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HMDMetricsManager homeManager](self, "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v8, "residentDeviceManager", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "residentDevices");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "isCurrentDevice") & 1) != 0)
              {
                objc_msgSend(v8, "uuid");
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_19;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v12)
              continue;
            break;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v15 = 0;
    }
    while (v5);
  }
  else
  {
    v15 = 0;
  }
LABEL_19:

  return (NSUUID *)v15;
}

- (HMDHH2AutoMigrationEligibilityChecker)hh2AutoMigrationEligibilityChecker
{
  void *v2;
  void *v3;

  -[HMDMetricsManager homeManager](self, "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hh2AutoMigrationEligibilityChecker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDHH2AutoMigrationEligibilityChecker *)v3;
}

- (HMMLogEventDispatching)logEventDispatcher
{
  return self->_logEventDispatcher;
}

- (HMDEventCountersManager)legacyCountersManager
{
  return self->_legacyCountersManager;
}

- (HMDTimeBasedFlagsManager)flagsManager
{
  return self->_flagsManager;
}

- (HMDEWSLogging)ewsLogger
{
  return (HMDEWSLogging *)objc_loadWeakRetained((id *)&self->_ewsLogger);
}

- (HMMRadarInitiating)radarInitiator
{
  return self->_radarInitiator;
}

- (HMDLogEventDailyScheduler)dailyScheduler
{
  return self->_dailyScheduler;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (NSString)PRKitDateString
{
  return self->_PRKitDateString;
}

- (NSString)PRKitUUIDString
{
  return self->_PRKitUUIDString;
}

- (HMDNetworkObserver)networkObserver
{
  return self->_networkObserver;
}

- (HMDThreadNetworkObserver)threadNetworkObserver
{
  return self->_threadNetworkObserver;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSString)currentSoftwareVersion
{
  return self->_currentSoftwareVersion;
}

- (int64_t)configuredWidgetsCount
{
  return self->_configuredWidgetsCount;
}

- (void)setConfiguredWidgetsCount:(int64_t)a3
{
  self->_configuredWidgetsCount = a3;
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (BOOL)metricsCollectionStarted
{
  return self->_metricsCollectionStarted;
}

- (void)setMetricsCollectionStarted:(BOOL)a3
{
  self->_metricsCollectionStarted = a3;
}

- (HMDMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (HMDAppleAccountManager)accountManager
{
  return self->_accountManager;
}

- (HMDUserNotificationCenterSettingsProviding)notificationSettingsProvider
{
  return self->_notificationSettingsProvider;
}

- (HMDHH2AutoMigrationEligibilityLogEventSubmitter)hh2AutoMigrationEligibilitySubmitter
{
  return self->_hh2AutoMigrationEligibilitySubmitter;
}

- (HMDMetricsAccessoryDetailsManager)accessoryDetailsManager
{
  return self->_accessoryDetailsManager;
}

- (HMDHouseholdMetricsManager)householdMetricsManager
{
  return self->_householdMetricsManager;
}

- (HMDCoreAnalyticsLogEventObserverDelegate)coreAnalyticsDelegate
{
  return self->_coreAnalyticsDelegate;
}

- (NSArray)coreAnalyticsFilters
{
  return self->_coreAnalyticsFilters;
}

- (HMMCoreAnalyticsLogEventObserver)coreAnalyticsObserver
{
  return self->_coreAnalyticsObserver;
}

- (HMDDiagnosticReporterLogObserver)diagnosticReporterLogObserver
{
  return self->_diagnosticReporterLogObserver;
}

- (HMDPowerLogObserver)powerLogObserver
{
  return self->_powerLogObserver;
}

- (HMMSiriSELFLogEventObserver)siriSELFLoggingObserver
{
  return self->_siriSELFLoggingObserver;
}

- (HMDLogEventBulletinNotificationsAnalyzer)bulletinNotificationsAnalyzer
{
  return self->_bulletinNotificationsAnalyzer;
}

- (HMDCloudSyncLogEventsAnalyzer)cloudSyncLogEventsAnalyzer
{
  return self->_cloudSyncLogEventsAnalyzer;
}

- (HMDLogEventElectionEventsAnalyzer)electionEventsAnalyzer
{
  return self->_electionEventsAnalyzer;
}

- (HMDLogEventErrorEventsAnalyzer)errorEventsAnalyzer
{
  return self->_errorEventsAnalyzer;
}

- (HMDLogEventCountingAnalyzer)eventCountingAnalyzer
{
  return self->_eventCountingAnalyzer;
}

- (HMDLogEventHAPMetricsEventAnalyzer)hapEventsAnalyzer
{
  return self->_hapEventsAnalyzer;
}

- (HMDHH2MigrationLogEventsAnalyzer)hh2MigrationAnalyzer
{
  return self->_hh2MigrationAnalyzer;
}

- (HMDLogEventMessageEventsAnalyzer)messagingEventsAnalyzer
{
  return self->_messagingEventsAnalyzer;
}

- (HMDLogEventProcessLaunchAnalyzer)processLaunchEventsAnalyzer
{
  return self->_processLaunchEventsAnalyzer;
}

- (HMDLogEventProcessMemoryEventsAnalyzer)processMemoryEventsAnalyzer
{
  return self->_processMemoryEventsAnalyzer;
}

- (HMDLogEventReachabilityEventsAnalyzer)reachabilityEventsAnalyzer
{
  return self->_reachabilityEventsAnalyzer;
}

- (HMDLogEventUserActivityAnalyzer)userActivityEventsAnalyzer
{
  return self->_userActivityEventsAnalyzer;
}

- (HMDLogEventAccessoryFirmwareUpdateEventAnalyzer)firmwareUpdateEventsAnalyzer
{
  return self->_firmwareUpdateEventsAnalyzer;
}

- (HMDWidgetTimelineRefresherEventsAnalyzer)widgetTimelineRefresherEventsAnalyzer
{
  return self->_widgetTimelineRefresherEventsAnalyzer;
}

- (HMDMetricsPreferencesDebugManager)preferencesDebugManager
{
  return self->_preferencesDebugManager;
}

- (HMMCoreAnalyticsTagObserver)coreAnalyticsTagObserver
{
  return self->_coreAnalyticsTagObserver;
}

- (NSMutableArray)aggregationAnalysisEventContributingAnalyzers
{
  return self->_aggregationAnalysisEventContributingAnalyzers;
}

- (HMFTimer)backgroundLoggingTimer
{
  return self->_backgroundLoggingTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundLoggingTimer, 0);
  objc_storeStrong((id *)&self->_aggregationAnalysisEventContributingAnalyzers, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsTagObserver, 0);
  objc_storeStrong((id *)&self->_preferencesDebugManager, 0);
  objc_storeStrong((id *)&self->_widgetTimelineRefresherEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_firmwareUpdateEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_userActivityEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_reachabilityEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_processMemoryEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_processLaunchEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_messagingEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_hh2MigrationAnalyzer, 0);
  objc_storeStrong((id *)&self->_hapEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_eventCountingAnalyzer, 0);
  objc_storeStrong((id *)&self->_errorEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_electionEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_cloudSyncLogEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_bulletinNotificationsAnalyzer, 0);
  objc_storeStrong((id *)&self->_siriSELFLoggingObserver, 0);
  objc_storeStrong((id *)&self->_powerLogObserver, 0);
  objc_storeStrong((id *)&self->_diagnosticReporterLogObserver, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsObserver, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsFilters, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsDelegate, 0);
  objc_storeStrong((id *)&self->_householdMetricsManager, 0);
  objc_storeStrong((id *)&self->_accessoryDetailsManager, 0);
  objc_storeStrong((id *)&self->_hh2AutoMigrationEligibilitySubmitter, 0);
  objc_storeStrong((id *)&self->_notificationSettingsProvider, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_deviceStateManager, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_currentSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_threadNetworkObserver, 0);
  objc_storeStrong((id *)&self->_networkObserver, 0);
  objc_storeStrong((id *)&self->_PRKitUUIDString, 0);
  objc_storeStrong((id *)&self->_PRKitDateString, 0);
  objc_storeStrong((id *)&self->_cachedConfiguration, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_dailyScheduler, 0);
  objc_storeStrong((id *)&self->_radarInitiator, 0);
  objc_destroyWeak((id *)&self->_ewsLogger);
  objc_storeStrong((id *)&self->_flagsManager, 0);
  objc_storeStrong((id *)&self->_legacyCountersManager, 0);
  objc_storeStrong((id *)&self->_logEventDispatcher, 0);
  objc_storeStrong((id *)&self->_bridgedCountersManager, 0);
  objc_storeStrong((id *)&self->_configurationObservers, 0);
}

void __47__HMDMetricsManager__handleFetchEventCounters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "description");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

}

void __41__HMDMetricsManager__handleReadCounters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  void *v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v41 = a3;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D33420]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqual:", v3))
    {
LABEL_29:

      goto LABEL_30;
    }
  }
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D33428]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqual:", v4) & 1) == 0)
    {

      if (!v8)
        goto LABEL_30;
      goto LABEL_29;
    }
    v10 = *(void **)(a1 + 48);
    if (!v10)
    {
      v11 = 1;
LABEL_9:

LABEL_10:
      if (v8)
        goto LABEL_11;
      goto LABEL_16;
    }
LABEL_8:
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D33418]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v12);

    if (!v9)
      goto LABEL_10;
    goto LABEL_9;
  }
  v10 = *(void **)(a1 + 48);
  if (v10)
    goto LABEL_8;
  v11 = 1;
  if (v8)
  {
LABEL_11:

    if ((v11 & 1) == 0)
      goto LABEL_30;
    goto LABEL_17;
  }
LABEL_16:
  if (v11)
  {
LABEL_17:
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("container"));
      v13 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("descriptor"));

      v14 = *(_QWORD *)(a1 + 64);
      if (v14)
      {
        v15 = objc_msgSend(v41, "valueForCounter:inEphemeralContainer:", v14, *(_QWORD *)(a1 + 56));
        if (!v15)
          goto LABEL_27;
        v50 = *(_QWORD *)(a1 + 64);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _counterArrayFromDictionary(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("counters"));

      }
      else
      {
        objc_msgSend(v41, "countersInEphemeralContainer:", *(_QWORD *)(a1 + 56));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v16, "count"))
        {
LABEL_26:

LABEL_27:
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("counters"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v21 = *(void **)(a1 + 72);
            v22 = (void *)objc_msgSend(v3, "copy");
            objc_msgSend(v21, "addObject:", v22);

          }
          goto LABEL_29;
        }
        _counterArrayFromDictionary(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("counters"));
      }

      goto LABEL_26;
    }
    if (*(_QWORD *)(a1 + 80))
    {
      v49 = *(_QWORD *)(a1 + 80);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v41, "datePartitions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v19;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (!v23)
    {
LABEL_48:

      goto LABEL_30;
    }
    v24 = v23;
    v25 = *(_QWORD *)v43;
    v26 = v7;
LABEL_34:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v25)
        objc_enumerationMutation(obj);
      v28 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v27);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 88), "stringFromDate:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("partition"));

      v31 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("descriptor"));

      v32 = *(_QWORD *)(a1 + 64);
      if (!v32)
        break;
      v33 = objc_msgSend(v41, "valueForCounter:inDatePartition:", v32, v28);
      if (v33)
      {
        v46 = *(_QWORD *)(a1 + 64);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        _counterArrayFromDictionary(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v36, CFSTR("counters"));

        goto LABEL_42;
      }
LABEL_44:
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("counters"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        v38 = *(void **)(a1 + 72);
        v39 = (void *)objc_msgSend(v29, "copy");
        objc_msgSend(v38, "addObject:", v39);

      }
      ++v27;
      v7 = v26;
      if (v24 == v27)
      {
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        if (!v24)
          goto LABEL_48;
        goto LABEL_34;
      }
    }
    objc_msgSend(v41, "countersInDatePartition:", v28);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "count"))
    {
      _counterArrayFromDictionary(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, CFSTR("counters"));
LABEL_42:

    }
    goto LABEL_44;
  }
LABEL_30:

}

void __41__HMDMetricsManager__handleReadCounters___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  void *v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v43 = a3;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D33420]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqual:", v3))
    {
LABEL_29:

      goto LABEL_30;
    }
  }
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D33428]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqual:", v4) & 1) == 0)
    {

      if (!v8)
        goto LABEL_30;
      goto LABEL_29;
    }
    v10 = *(void **)(a1 + 48);
    if (!v10)
    {
      v11 = 1;
LABEL_9:

LABEL_10:
      if (v8)
        goto LABEL_11;
      goto LABEL_16;
    }
LABEL_8:
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D33418]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v12);

    if (!v9)
      goto LABEL_10;
    goto LABEL_9;
  }
  v10 = *(void **)(a1 + 48);
  if (v10)
    goto LABEL_8;
  v11 = 1;
  if (v8)
  {
LABEL_11:

    if ((v11 & 1) == 0)
      goto LABEL_30;
    goto LABEL_17;
  }
LABEL_16:
  if (v11)
  {
LABEL_17:
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("container"));
      v13 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("descriptor"));

      v14 = *(_QWORD *)(a1 + 64);
      if (v14)
      {
        objc_msgSend(v43, "statistics:inEphemeralContainer:", v14, *(_QWORD *)(a1 + 56));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
        {
          v52 = *(_QWORD *)(a1 + 64);
          v53[0] = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          _statisticsArrayFromDictionary(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("statistics"));

        }
      }
      else
      {
        objc_msgSend(v43, "statisticsInEphemeralContainer:", *(_QWORD *)(a1 + 56));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count"))
        {
          _statisticsArrayFromDictionary(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("statistics"));

        }
      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("statistics"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = *(void **)(a1 + 72);
        v24 = (void *)objc_msgSend(v3, "copy");
        objc_msgSend(v23, "addObject:", v24);

      }
      goto LABEL_29;
    }
    if (*(_QWORD *)(a1 + 80))
    {
      v51 = *(_QWORD *)(a1 + 80);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v43, "datePartitions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v19;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (!v25)
    {
LABEL_47:

      goto LABEL_30;
    }
    v26 = v25;
    v27 = *(_QWORD *)v45;
    v28 = v7;
LABEL_34:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v27)
        objc_enumerationMutation(obj);
      v30 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v29);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 88), "stringFromDate:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("partition"));

      v33 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("descriptor"));

      v34 = *(_QWORD *)(a1 + 64);
      if (v34)
      {
        objc_msgSend(v43, "statistics:inDatePartition:", v34, v30);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v35;
        if (v35)
        {
          v48 = *(_QWORD *)(a1 + 64);
          v49 = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          _statisticsArrayFromDictionary(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v38, CFSTR("statistics"));

LABEL_42:
        }
      }
      else
      {
        objc_msgSend(v43, "statisticsInDatePartition:", v30);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "count"))
        {
          _statisticsArrayFromDictionary(v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v37, CFSTR("statistics"));
          goto LABEL_42;
        }
      }

      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("statistics"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        v40 = *(void **)(a1 + 72);
        v41 = (void *)objc_msgSend(v31, "copy");
        objc_msgSend(v40, "addObject:", v41);

      }
      ++v29;
      v7 = v28;
      if (v26 == v29)
      {
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (!v26)
          goto LABEL_47;
        goto LABEL_34;
      }
    }
  }
LABEL_30:

}

HMDMatterThirdPartyPairingTagProcessor *__52__HMDMetricsManager_registerTaggedLoggingProcessors__block_invoke(uint64_t a1)
{
  HMDMatterThirdPartyPairingTagProcessor *v2;
  void *v3;
  HMDMatterThirdPartyPairingTagProcessor *v4;

  v2 = [HMDMatterThirdPartyPairingTagProcessor alloc];
  objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDMatterThirdPartyPairingTagProcessor initWithSubmitter:](v2, "initWithSubmitter:", v3);

  return v4;
}

void __48__HMDMetricsManager_homeKitConfigurationChanged__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "updateCachedWidgetCount");
  objc_msgSend(*(id *)(a1 + 32), "updateCachedConfiguration");
  objc_msgSend(*(id *)(a1 + 32), "logEventDispatcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cachedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitLogEvent:", v2);

}

void __57__HMDMetricsManager_submitDailyAggregationAnalysisEvents__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "dateProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayByAddingDayCount:", -1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "homeKitAggregationAnalysisLogEventForDate:", v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cloudSyncLogEventsAnalyzer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudSyncAnalysisResultForDate:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "resetHomeKitAggregationAnalysisContext");
  objc_msgSend(*(id *)(a1 + 32), "cloudSyncLogEventsAnalyzer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetDataSource");

  objc_msgSend(*(id *)(a1 + 32), "legacyCountersManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forceSave");

  objc_msgSend(*(id *)(a1 + 32), "logEventDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitLogEvent:", v3);

  objc_msgSend(*(id *)(a1 + 32), "logEventDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitLogEvent:", v5);

}

+ (NSUUID)namespaceUUID
{
  if (namespaceUUID_onceToken != -1)
    dispatch_once(&namespaceUUID_onceToken, &__block_literal_global_77687);
  return (NSUUID *)(id)namespaceUUID_namespaceUUID;
}

+ (HMMRadarInitiating)defaultRadarInitiator
{
  return (HMMRadarInitiating *)+[HMDTTRManager sharedManager](HMDTTRManager, "sharedManager");
}

+ (void)submitMinimalCoreAnalyticsEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  HMDMinimalCoreAnalyticsLogEventObserverDelegate *v6;

  v3 = a3;
  v6 = objc_alloc_init(HMDMinimalCoreAnalyticsLogEventObserverDelegate);
  v4 = objc_alloc(MEMORY[0x1E0D33468]);
  v5 = (void *)objc_msgSend(v4, "initWithDelegate:filters:", v6, MEMORY[0x1E0C9AA60]);
  objc_msgSend(v5, "didReceiveEventFromDispatcher:", v3);

}

void __34__HMDMetricsManager_namespaceUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"));
  v1 = (void *)namespaceUUID_namespaceUUID;
  namespaceUUID_namespaceUUID = v0;

}

@end
