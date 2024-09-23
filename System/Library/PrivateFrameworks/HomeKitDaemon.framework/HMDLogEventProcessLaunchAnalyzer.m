@implementation HMDLogEventProcessLaunchAnalyzer

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (void)resetAggregationAnalysisContext
{
  id v2;

  -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetEventCountersForRequestGroup:", CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup"));

}

- (HMDLogEventProcessLaunchAnalyzer)initWithProcessLaunchInfoTimer:(id)a3 dataSource:(id)a4 preferencesDebugManager:(id)a5
{
  return -[HMDLogEventProcessLaunchAnalyzer initWithProcessLaunchInfoTimer:dataSource:preferencesDebugManager:lastExitContextBlock:](self, "initWithProcessLaunchInfoTimer:dataSource:preferencesDebugManager:lastExitContextBlock:", a3, a4, a5, &__block_literal_global_175098);
}

- (HMDLogEventProcessLaunchAnalyzer)initWithProcessLaunchInfoTimer:(id)a3 dataSource:(id)a4 preferencesDebugManager:(id)a5 lastExitContextBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDLogEventProcessLaunchAnalyzer *v15;
  HMDLogEventProcessLaunchAnalyzer *v16;
  uint64_t v17;
  HMDEventCountersManager *eventCountersManager;
  void *v19;
  uint64_t v20;
  NSUserDefaults *userDefaults;
  void *v22;
  id lastExitContextBlock;
  void *v24;
  void *v25;
  void *v26;
  HMDCounterThresholdTTRTrigger *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  HMDCounterThresholdTTRTrigger *v34;
  id v36;
  objc_super v37;
  _QWORD v38[7];

  v38[6] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v37.receiver = self;
  v37.super_class = (Class)HMDLogEventProcessLaunchAnalyzer;
  v15 = -[HMDLogEventProcessLaunchAnalyzer init](&v37, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_submitProcessLaunchInfoTimer, a3);
    objc_msgSend(v12, "legacyCountersManager");
    v17 = objc_claimAutoreleasedReturnValue();
    eventCountersManager = v16->_eventCountersManager;
    v16->_eventCountersManager = (HMDEventCountersManager *)v17;

    objc_msgSend(v12, "logEventSubmitter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v16->_logEventSubmitter, v19);

    objc_msgSend(v12, "userDefaults");
    v20 = objc_claimAutoreleasedReturnValue();
    userDefaults = v16->_userDefaults;
    v16->_userDefaults = (NSUserDefaults *)v20;

    objc_storeStrong((id *)&v16->_preferencesDebugManager, a5);
    v22 = _Block_copy(v14);
    lastExitContextBlock = v16->_lastExitContextBlock;
    v16->_lastExitContextBlock = v22;

    v16->_processRelaunchEventTimeIntervalThreshold = 600.0;
    objc_msgSend(v12, "logEventDispatcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    v38[3] = objc_opt_class();
    v38[4] = objc_opt_class();
    v38[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:forEventClasses:", v16, v25);

    v36 = v11;
    objc_msgSend(v12, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("homedExitCount"), CFSTR("processExit"), CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup"), 10);
    objc_msgSend(v12, "legacyCountersManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = [HMDCounterThresholdTTRTrigger alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Excessive homed launches (>=%d)"), 10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 590644);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v30 = v13;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "radarInitiator");
    v32 = v14;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[HMDCounterThresholdTTRTrigger initWithThreshold:message:radarTitle:componentName:componentVersion:componentID:radarInitiator:](v27, "initWithThreshold:message:radarTitle:componentName:componentVersion:componentID:radarInitiator:", 10, CFSTR("Excessive homed launches detected. Please file a radar"), v28, CFSTR("HomeKit"), CFSTR("New Bugs"), v31, v33);
    objc_msgSend(v26, "addObserver:forEventName:requestGroup:", v34, CFSTR("processExit"), CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup"));

    v14 = v32;
    v13 = v30;

    v11 = v36;
  }

  return v16;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
    -[HMDLogEventProcessLaunchAnalyzer handleDataSyncStateUpdateLogEvent:](self, "handleDataSyncStateUpdateLogEvent:", v6);
  v7 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
    -[HMDLogEventProcessLaunchAnalyzer handleProcessLaunchLogEvent:](self, "handleProcessLaunchLogEvent:", v9);
  v10 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
    -[HMDLogEventProcessLaunchAnalyzer handleXPCMessageTransportStartedEvent:](self, "handleXPCMessageTransportStartedEvent:", v12);
  v13 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
    -[HMDLogEventProcessLaunchAnalyzer handleAccountResolvedEvent:](self, "handleAccountResolvedEvent:", v15);
  v18 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v18;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
    -[HMDLogEventProcessLaunchAnalyzer handleArchiveReplayLogEvent:](self, "handleArchiveReplayLogEvent:", v17);

}

- (void)homeKitConfigurationChangedWithHomeManager:(id)a3
{
  double v4;

  -[HMDLogEventProcessLaunchAnalyzer setHomeManager:](self, "setHomeManager:", a3);
  self->_configurationLoaded = 1;
  if (self->_launchTime > 0.0 && !self->_homeDataLoadedMilliseconds)
  {
    objc_msgSend(MEMORY[0x24BE4F198], "currentTime");
    self->_homeDataLoadedMilliseconds = (uint64_t)((v4 - self->_launchTime) * 1000.0);
  }
  -[HMDLogEventProcessLaunchAnalyzer submitProcessLaunchInfoEventPendingAllConditions](self, "submitProcessLaunchInfoEventPendingAllConditions");
}

- (void)handleProcessLaunchLogEvent:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *processLaunchTime;
  double v7;
  void (**v8)(void);
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  processLaunchTime = self->_processLaunchTime;
  self->_processLaunchTime = v5;

  objc_msgSend(v4, "startTime");
  self->_launchTime = v7;
  -[HMDLogEventProcessLaunchAnalyzer updateProcessLaunchInfoFromDisk](self, "updateProcessLaunchInfoFromDisk");
  -[HMDLogEventProcessLaunchAnalyzer submitMigrationLogEvent](self, "submitMigrationLogEvent");
  -[HMDLogEventProcessLaunchAnalyzer lastExitContextBlock](self, "lastExitContextBlock");
  v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v8[2]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isFirstLaunchAfterBoot");

  -[HMDLogEventProcessLaunchAnalyzer handleExitContextForHomed:firstLaunchAfterBoot:](self, "handleExitContextForHomed:firstLaunchAfterBoot:", v9, v10);
  -[HMDLogEventProcessLaunchAnalyzer submitProcessLaunchInfoTimer](self, "submitProcessLaunchInfoTimer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resume");

}

- (void)submitMigrationLogEvent
{
  void *v3;
  HMDHH2MigrationStateLogger *v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD v7[5];
  HMDHH2MigrationStateLogger *v8;

  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = objc_alloc_init(HMDHH2MigrationStateLogger);
  if (-[HMDHH2MigrationStateLogger shouldSubmitLogEvent](v4, "shouldSubmitLogEvent"))
  {
    v5 = dispatch_time(0, 10000000000);
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __59__HMDLogEventProcessLaunchAnalyzer_submitMigrationLogEvent__block_invoke;
    v7[3] = &unk_24E79C268;
    v7[4] = self;
    v8 = v4;
    dispatch_after(v5, v6, v7);

  }
  objc_autoreleasePoolPop(v3);
}

- (void)handleDataSyncStateUpdateLogEvent:(id)a3
{
  NSString *v4;
  NSString *dataSyncStateAsString;
  NSString *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "dataSyncState");
  HMHomeManagerDataSyncStateToString();
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  dataSyncStateAsString = self->_dataSyncStateAsString;
  self->_dataSyncStateAsString = v4;

  if (!self->_millisecondsSinceLaunchToDataSyncStateGood)
  {
    v6 = self->_dataSyncStateAsString;
    HMHomeManagerDataSyncStateToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if ((_DWORD)v6)
    {
      objc_msgSend(v9, "startTime");
      self->_millisecondsSinceLaunchToDataSyncStateGood = (uint64_t)((v8 - self->_launchTime) * 1000.0);
      -[HMDLogEventProcessLaunchAnalyzer submitProcessLaunchInfoEventPendingAllConditions](self, "submitProcessLaunchInfoEventPendingAllConditions");
    }
  }

}

- (void)handleXPCMessageTransportStartedEvent:(id)a3
{
  double v4;

  if (!self->_xpcMessageTransportReadyMilliseconds)
  {
    objc_msgSend(a3, "startTime");
    self->_xpcMessageTransportReadyMilliseconds = (uint64_t)((v4 - self->_launchTime) * 1000.0);
  }
}

- (void)handleAccountResolvedEvent:(id)a3
{
  double v4;

  if (!self->_accountResolvedMilliseconds)
  {
    objc_msgSend(a3, "startTime");
    self->_accountResolvedMilliseconds = (uint64_t)((v4 - self->_launchTime) * 1000.0);
  }
}

- (void)handleArchiveReplayLogEvent:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  self->_numUncommittedRecords = objc_msgSend(v4, "numUncommittedRecords");
  v5 = objc_msgSend(v4, "numUncommittedAndPushedRecords");

  self->_numUncommittedAndPushedRecords = v5;
}

- (void)submitProcessLaunchInfoEventPendingAllConditions
{
  void *v3;
  int v4;

  if (self->_millisecondsSinceLaunchToDataSyncStateGood
    && self->_accountResolvedMilliseconds
    && self->_configurationLoaded
    && !self->_processLaunchInfoEventSubmitted)
  {
    -[HMDLogEventProcessLaunchAnalyzer submitProcessLaunchInfoTimer](self, "submitProcessLaunchInfoTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isRunning");

    if (v4)
      self->_launchInfoSubmissionState = 1;
    self->_processLaunchInfoEventSubmitted = 1;
    -[HMDLogEventProcessLaunchAnalyzer submitProcessLaunchEventWithCurrentAnalysis](self, "submitProcessLaunchEventWithCurrentAnalysis");
  }
}

- (void)updateProcessLaunchInfoFromDisk
{
  void *v3;
  void *v4;
  void *v5;
  NSDate *v6;
  NSDate *processLastExitTime;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  HMDProcessRelaunchThresholdLogEvent *v14;
  void *v15;
  HMDProcessRelaunchThresholdLogEvent *v16;
  id v17;

  -[HMDLogEventProcessLaunchAnalyzer preferencesDebugManager](self, "preferencesDebugManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitPreferencesSizeLogEventsForApplicationID:submissionTrigger:", CFSTR("com.apple.homed"), 1);

  -[HMDLogEventProcessLaunchAnalyzer userDefaults](self, "userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("homedLaunchTime"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDLogEventProcessLaunchAnalyzer userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("homedLastReportedExitTime"));
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  processLastExitTime = self->_processLastExitTime;
  self->_processLastExitTime = v6;

  -[HMDLogEventProcessLaunchAnalyzer userDefaults](self, "userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", self->_processLaunchTime, CFSTR("homedLaunchTime"));

  v9 = v17;
  if (v17)
  {
    -[NSDate timeIntervalSinceDate:](self->_processLaunchTime, "timeIntervalSinceDate:", v17);
    v11 = v10;
    self->_timeIntervalSincePreviousProcessLaunch = v10;
    -[HMDLogEventProcessLaunchAnalyzer processRelaunchEventTimeIntervalThreshold](self, "processRelaunchEventTimeIntervalThreshold");
    v9 = v17;
    if (v11 < v12)
    {
      -[HMDLogEventProcessLaunchAnalyzer logEventSubmitter](self, "logEventSubmitter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = [HMDProcessRelaunchThresholdLogEvent alloc];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeIntervalSincePreviousProcessLaunch);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HMDProcessRelaunchThresholdLogEvent initWithTimeSincePreviousLaunch:](v14, "initWithTimeSincePreviousLaunch:", v15);
      objc_msgSend(v13, "submitLogEvent:", v16);

      v9 = v17;
    }
  }

}

- (void)handleExitContextForHomed:(id)a3 firstLaunchAfterBoot:(BOOL)a4
{
  void *v6;
  void *v7;
  NSDate *processLastExitTime;
  void *v9;
  BOOL v10;
  NSDate *v11;
  NSDate *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSString *processExitType;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *processExitReason;
  HMDProcessExitInfoLogEvent *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  int v31;
  NSString *v32;
  void *v33;
  void *v34;
  void *v35;
  NSString *v36;
  NSString *v37;
  HMDProcessExitInfoLogEvent *v38;
  void *v39;
  id v40;

  v40 = a3;
  -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDLogEventProcessLaunchAnalyzerProcessLaunchEventCounter"), CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup"));

  if (!a4
    && !-[HMDLogEventProcessLaunchAnalyzer isIdleExitJetsamForExitContext:](self, "isIdleExitJetsamForExitContext:", v40))
  {
    -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "incrementEventCounterForEventName:requestGroup:", CFSTR("processExit"), CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup"));

  }
  processLastExitTime = self->_processLastExitTime;
  if (!processLastExitTime
    || (objc_msgSend(v40, "timestamp"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = -[NSDate isEqualToDate:](processLastExitTime, "isEqualToDate:", v9),
        v9,
        !v10))
  {
    objc_msgSend(v40, "timestamp");
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v12 = self->_processLastExitTime;
    self->_processLastExitTime = v11;

    -[HMDLogEventProcessLaunchAnalyzer userDefaults](self, "userDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", self->_processLastExitTime, CFSTR("homedLastReportedExitTime"));

    -[HMDLogEventProcessLaunchAnalyzer logEventSubmitter](self, "logEventSubmitter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "status");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isJetsam");

    if (v16)
    {
      processExitType = self->_processExitType;
      self->_processExitType = (NSString *)CFSTR("Jetsam");

      objc_msgSend(v40, "status");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "userInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FD8]);
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      processExitReason = self->_processExitReason;
      self->_processExitReason = v21;

      v23 = -[HMDProcessExitInfoLogEvent initWithExitType:reason:]([HMDProcessExitInfoLogEvent alloc], "initWithExitType:reason:", self->_processExitType, self->_processExitReason);
      objc_msgSend(v14, "submitLogEvent:", v23);

      -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDLogEventProcessLaunchAnalyzerProcessJetsamCountEventCounter"), CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup"));

      objc_msgSend(v40, "status");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "code");

      if (v26 == 9)
      {
        -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        v29 = CFSTR("idleExit");
      }
      else if (v26 == 7)
      {
        -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        v29 = CFSTR("HMDLogEventProcessLaunchAnalyzerJetsamReasonProcessLimitCountEventCounter");
      }
      else
      {
        -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26 == 2)
        {
          v28 = v27;
          v29 = CFSTR("HMDLogEventProcessLaunchAnalyzerJetsamReasonHighwaterEventCounter");
        }
        else
        {
          v28 = v27;
          v29 = CFSTR("HMDLogEventProcessLaunchAnalyzerJetsamReasonOtherEventCounter");
        }
      }
    }
    else
    {
      objc_msgSend(v40, "status");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isCrash");

      if (!v31)
      {
LABEL_17:

        goto LABEL_18;
      }
      v32 = self->_processExitType;
      self->_processExitType = (NSString *)CFSTR("Crash");

      objc_msgSend(v40, "status");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "error");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "userInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FD8]);
      v36 = (NSString *)objc_claimAutoreleasedReturnValue();
      v37 = self->_processExitReason;
      self->_processExitReason = v36;

      v38 = -[HMDProcessExitInfoLogEvent initWithExitType:reason:]([HMDProcessExitInfoLogEvent alloc], "initWithExitType:reason:", self->_processExitType, self->_processExitReason);
      objc_msgSend(v14, "submitLogEvent:", v38);

      -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = CFSTR("HMDLogEventProcessLaunchAnalyzerProcessCrashCountEventCounter");
    }
    objc_msgSend(v27, "incrementEventCounterForEventName:requestGroup:", v29, CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup"));

    goto LABEL_17;
  }
LABEL_18:
  -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "forceSave");

}

- (BOOL)isIdleExitJetsamForExitContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isJetsam"))
  {
    objc_msgSend(v3, "status");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "code") == 9;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)submitProcessLaunchEventWithCurrentAnalysis
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  HMDProcessLaunchInfoLogEvent *v16;
  HMDProcessLaunchInfoLogEvent *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  -[HMDLogEventProcessLaunchAnalyzer submitProcessLaunchInfoTimer](self, "submitProcessLaunchInfoTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDLogEventProcessLaunchAnalyzer homeManager](self, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v4;
  if (v4)
    v5 = objc_msgSend(v4, "areThereAnyTTSUSessionsOngoing");
  else
    v5 = 0;
  -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fetchEventCounterForEventName:requestGroup:", CFSTR("HMDLogEventProcessLaunchAnalyzerProcessLaunchEventCounter"), CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup"));

  -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fetchEventCounterForEventName:requestGroup:", CFSTR("processExit"), CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup"));

  -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fetchEventCounterForEventName:requestGroup:", CFSTR("HMDLogEventProcessLaunchAnalyzerProcessJetsamCountEventCounter"), CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup"));

  -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fetchEventCounterForEventName:requestGroup:", CFSTR("idleExit"), CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup"));

  -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fetchEventCounterForEventName:requestGroup:", CFSTR("HMDLogEventProcessLaunchAnalyzerProcessCrashCountEventCounter"), CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup"));

  v16 = [HMDProcessLaunchInfoLogEvent alloc];
  BYTE1(v19) = v5;
  LOBYTE(v19) = self->_configurationLoaded;
  v17 = -[HMDProcessLaunchInfoLogEvent initWithSubmissionState:dataSyncState:timeIntervalSincePreviousProcessLaunch:millisecondsToHomeDataLoad:millisecondsToXPCMessageTransportReady:millisecondsSinceLaunchToDataSyncStateGood:millisecondsToAccountResolved:numUncommittedRecords:numUncommittedAndPushedRecords:processExitType:processExitReason:processLaunchCount:processExitCount:processJetsamCount:processIdleExitCount:processCrashCount:isConfigurationLoaded:isTTSUInProgress:](v16, "initWithSubmissionState:dataSyncState:timeIntervalSincePreviousProcessLaunch:millisecondsToHomeDataLoad:millisecondsToXPCMessageTransportReady:millisecondsSinceLaunchToDataSyncStateGood:millisecondsToAccountResolved:numUncommittedRecords:numUncommittedAndPushedRecords:processExitType:processExitReason:processLaunchCount:processExitCount:processJetsamCount:processIdleExitCount:processCrashCount:isConfigurationLoaded:isTTSUInProgress:", self->_launchInfoSubmissionState, self->_dataSyncStateAsString, self->_homeDataLoadedMilliseconds, self->_xpcMessageTransportReadyMilliseconds, self->_millisecondsSinceLaunchToDataSyncStateGood, self->_accountResolvedMilliseconds, self->_timeIntervalSincePreviousProcessLaunch, self->_numUncommittedRecords, self->_numUncommittedAndPushedRecords, self->_processExitType, self->_processExitReason, v7, v9, v11,
          v13,
          v15,
          v19);
  -[HMDLogEventProcessLaunchAnalyzer logEventSubmitter](self, "logEventSubmitter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "submitLogEvent:", v17);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDLogEventProcessLaunchAnalyzer submitProcessLaunchInfoTimer](self, "submitProcessLaunchInfoTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    self->_launchInfoSubmissionState = 2;
    -[HMDLogEventProcessLaunchAnalyzer submitProcessLaunchEventWithCurrentAnalysis](self, "submitProcessLaunchEventWithCurrentAnalysis");
    self->_launchInfoSubmissionState = 3;
  }
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HMDLogEventProcessLaunchAnalyzer eventCountersManager](self, "eventCountersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "counterGroupForName:", CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProcessLaunchCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventProcessLaunchAnalyzerProcessLaunchEventCounter"), v6));
  objc_msgSend(v7, "setProcessCrashCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventProcessLaunchAnalyzerProcessCrashCountEventCounter"), v6));
  objc_msgSend(v7, "setProcessJetsamCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventProcessLaunchAnalyzerProcessJetsamCountEventCounter"), v6));
  objc_msgSend(v7, "setJetsamReasonHighwaterCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventProcessLaunchAnalyzerJetsamReasonHighwaterEventCounter"), v6));
  objc_msgSend(v7, "setJetsamReasonProcessLimitCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventProcessLaunchAnalyzerJetsamReasonProcessLimitCountEventCounter"), v6));
  v9 = objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventProcessLaunchAnalyzerJetsamReasonOtherEventCounter"), v6);

  objc_msgSend(v7, "setJetsamReasonOtherCount:", v9);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (HMFTimer)submitProcessLaunchInfoTimer
{
  return self->_submitProcessLaunchInfoTimer;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_loadWeakRetained((id *)&self->_logEventSubmitter);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HMDMetricsPreferencesDebugManager)preferencesDebugManager
{
  return self->_preferencesDebugManager;
}

- (id)lastExitContextBlock
{
  return self->_lastExitContextBlock;
}

- (double)processRelaunchEventTimeIntervalThreshold
{
  return self->_processRelaunchEventTimeIntervalThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastExitContextBlock, 0);
  objc_storeStrong((id *)&self->_preferencesDebugManager, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_logEventSubmitter);
  objc_storeStrong((id *)&self->_submitProcessLaunchInfoTimer, 0);
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_dataSyncStateAsString, 0);
  objc_storeStrong((id *)&self->_processExitReason, 0);
  objc_storeStrong((id *)&self->_processExitType, 0);
  objc_storeStrong((id *)&self->_processLastExitTime, 0);
  objc_storeStrong((id *)&self->_processLaunchTime, 0);
}

void __59__HMDLogEventProcessLaunchAnalyzer_submitMigrationLogEvent__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "migrationEndLogEventFromDisk");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submitLogEvent:", v2);

  objc_msgSend(*(id *)(a1 + 40), "migrationDetailsLogEventFromDisk");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submitLogEvent:", v3);

}

id __102__HMDLogEventProcessLaunchAnalyzer_initWithProcessLaunchInfoTimer_dataSource_preferencesDebugManager___block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE80C78], "currentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lastExitContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)managedEventCounterRequestGroups
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("HMDLogEventProcessLaunchAnalyzerRequestGroup");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
