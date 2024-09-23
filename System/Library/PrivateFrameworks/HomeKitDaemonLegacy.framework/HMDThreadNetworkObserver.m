@implementation HMDThreadNetworkObserver

- (HMDThreadNetworkObserver)initWithLogEventDispatcher:(id)a3 countersManager:(id)a4 dailyScheduler:(id)a5 currentHomeDataSource:(id)a6 dateProvider:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HMDThreadNetworkObserver *v19;

  v12 = (void *)MEMORY[0x1E0CB37D0];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMDThreadNetworkObserver initWithLogEventDispatcher:countersManager:dailyScheduler:currentHomeDataSource:dateProvider:notificationCenter:](self, "initWithLogEventDispatcher:countersManager:dailyScheduler:currentHomeDataSource:dateProvider:notificationCenter:", v17, v16, v15, v14, v13, v18);

  return v19;
}

- (HMDThreadNetworkObserver)initWithLogEventDispatcher:(id)a3 countersManager:(id)a4 dailyScheduler:(id)a5 currentHomeDataSource:(id)a6 dateProvider:(id)a7 notificationCenter:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HMDThreadNetworkObserver *v18;
  HMDThreadNetworkObserver *v19;
  NSDate *curReport_threadNetworkLastUpTime;
  NSDate *curReport_threadNetworkLastDownTime;
  NSMutableDictionary *v22;
  NSMutableDictionary *curReport_topReadWriteErrors;
  NSMutableDictionary *v24;
  NSMutableDictionary *curReport_topSessionErrors;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HMDThreadNetworkObserver;
  v18 = -[HMDThreadNetworkObserver init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_logEventDispatcher, v13);
    objc_storeWeak((id *)&v19->_countersManager, v14);
    objc_storeWeak((id *)&v19->_notificationCenter, v17);
    objc_storeWeak((id *)&v19->_currentHomeDataSource, v15);
    objc_storeWeak((id *)&v19->_dateProvider, v16);
    v19->_curReport_threadNetworkUp = 0;
    *(_OWORD *)&v19->_curReport_numAdvertisedBRs = 0u;
    *(_OWORD *)&v19->_curReport_numThirdPartyBRs = 0u;
    *(_OWORD *)&v19->_curReport_maxSimuIPPrefixes = 0u;
    *(_OWORD *)&v19->_curReport_txSuccess = 0u;
    *(_OWORD *)&v19->_curReport_rxTotal = 0u;
    *(_OWORD *)&v19->_curReport_reportDuration = 0u;
    curReport_threadNetworkLastUpTime = v19->_curReport_threadNetworkLastUpTime;
    v19->_curReport_threadNetworkDownDuration = 0.0;
    v19->_curReport_threadNetworkLastUpTime = 0;

    curReport_threadNetworkLastDownTime = v19->_curReport_threadNetworkLastDownTime;
    v19->_curReport_threadNetworkLastDownTime = 0;

    v19->_curReport_readWritesCount = 0;
    v19->_curReport_readErrorCount = 0;
    v19->_curReport_writeErrorCount = 0;
    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    curReport_topReadWriteErrors = v19->_curReport_topReadWriteErrors;
    v19->_curReport_topReadWriteErrors = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    curReport_topSessionErrors = v19->_curReport_topSessionErrors;
    v19->_curReport_topSessionErrors = v24;

    *(_WORD *)&v19->_started = 0;
  }

  return v19;
}

- (void)_setDailyScheduler:(id)a3
{
  if (!self->_dailyReportingRegistered)
  {
    self->_dailyReportingRegistered = 1;
    objc_msgSend(a3, "registerDailyTaskRunner:", self);
  }
}

- (void)start
{
  void *v3;
  HMDThreadNetworkObserver *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDThreadNetworkObserver *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = v4;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@This device does not support Thread network stability reporting", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v8->_started = 1;
}

- (void)stop
{
  void *v3;
  HMDThreadNetworkObserver *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_started)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    self->_started = 0;
  }
}

- (id)counterGroupForName:(id)a3 homeUUID:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  if (a4)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    -[HMDThreadNetworkObserver countersManager](self, "countersManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:homeUUID:date:](HMDHouseholdDataEventCounterGroupSpecifier, "specifierWithGroupName:homeUUID:date:", v10, v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)_handleReadWriteLogEvent:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HMDThreadNetworkObserver setCurReport_readWritesCount:](self, "setCurReport_readWritesCount:", -[HMDThreadNetworkObserver curReport_readWritesCount](self, "curReport_readWritesCount") + 1);
  objc_msgSend(v10, "error");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v10, "isThreadAccessory");

    if (v6)
    {
      if (objc_msgSend(v10, "isWriteOperation"))
        -[HMDThreadNetworkObserver setCurReport_writeErrorCount:](self, "setCurReport_writeErrorCount:", -[HMDThreadNetworkObserver curReport_writeErrorCount](self, "curReport_writeErrorCount") + 1);
      else
        -[HMDThreadNetworkObserver setCurReport_readErrorCount:](self, "setCurReport_readErrorCount:", -[HMDThreadNetworkObserver curReport_readErrorCount](self, "curReport_readErrorCount") + 1);
      objc_msgSend(v10, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:](HMDLogEventErrorEventsAnalyzer, "eventCounterNameForError:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDThreadNetworkObserver curReport_topReadWriteErrors](self, "curReport_topReadWriteErrors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDThreadNetworkObserver _incrementError:forHistogram:byValue:](self, "_incrementError:forHistogram:byValue:", v8, v9, 1);

      if (objc_msgSend(v10, "isSentOverThread"))
        -[HMDThreadNetworkObserver requestThreadNetworkStateCaptureForAccessory:failingScenario:](self, "requestThreadNetworkStateCaptureForAccessory:failingScenario:", 0, objc_msgSend(v10, "isWriteOperation"));

    }
  }

}

- (void)_handleAccessorySessionEvent:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "topErrorDomain");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v13, "expectedTransport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", CFSTR("Thread"));

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v13, "topErrorDomain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, objc_msgSend(v13, "topErrorCode"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:](HMDLogEventErrorEventsAnalyzer, "eventCounterNameForError:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDThreadNetworkObserver curReport_topSessionErrors](self, "curReport_topSessionErrors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDThreadNetworkObserver _incrementError:forHistogram:byValue:](self, "_incrementError:forHistogram:byValue:", v11, v12, objc_msgSend(v13, "sessionFailures"));

    }
  }

}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v9;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    -[HMDThreadNetworkObserver _handleReadWriteLogEvent:](self, "_handleReadWriteLogEvent:", v5);
LABEL_11:

    goto LABEL_12;
  }
  v6 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMDThreadNetworkObserver _handleAccessorySessionEvent:](self, "_handleAccessorySessionEvent:", v8);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)runDailyTask
{
  void *v3;
  id v4;

  -[HMDThreadNetworkObserver dateProvider](self, "dateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayByAddingDayCount:", -1);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDThreadNetworkObserver _runLoggingForDate:isDailySummary:](self, "_runLoggingForDate:isDailySummary:", v4, 1);
}

- (void)_runLoggingForDate:(id)a3 isDailySummary:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDThreadNetworkObserver *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDThreadNetworkObserver currentHomeDataSource](self, "currentHomeDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeUUIDForCurrentResidentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDThreadNetworkObserver logEventForHomeWithUUID:associatedWithDate:isDailySummary:](self, "logEventForHomeWithUUID:associatedWithDate:isDailySummary:", v8, v6, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serializedLogEvent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Submitting HMDThreadNetworkStabilityLogEvent: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDThreadNetworkObserver logEventDispatcher](v11, "logEventDispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "submitLogEvent:", v9);

  }
}

- (id)logEventForHomeWithUUID:(id)a3 associatedWithDate:(id)a4 isDailySummary:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  const __CFString *v24;
  HMDThreadNetworkStabilityLogEvent *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  HMDThreadNetworkStabilityLogEvent *v49;
  HMDThreadNetworkStatusReport *v50;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id v68;
  id v69[2];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[HMDThreadNetworkObserver currentHomeDataSource](self, "currentHomeDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homeUUIDForCurrentResidentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "hmf_isEqualToUUID:", v11);

  if (v12)
  {
    v67 = v9;
    if (v5)
    {
      -[HMDThreadNetworkObserver countersManager](self, "countersManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDDateCounterGroupSpecifier specifierWithGroupName:date:](HMDDateCounterGroupSpecifier, "specifierWithGroupName:date:", CFSTR("ThreadNetworkStabilityEventGroup"), v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDThreadNetworkObserver counterGroupForName:homeUUID:date:](self, "counterGroupForName:homeUUID:date:", CFSTR("ReadWriteErrorEventGroup_ThreadReporting"), v8, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDThreadNetworkObserver counterGroupForName:homeUUID:date:](self, "counterGroupForName:homeUUID:date:", CFSTR("AccessorySessionErrorGroup_ThreadReporting"), v8, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v15, "fetchEventCounterForEventName:", CFSTR("ReadWriteCount_ThreadReporting"));
      v65 = objc_msgSend(v15, "fetchEventCounterForEventName:", CFSTR("ReadErrorCount_ThreadReporting"));
      v64 = objc_msgSend(v15, "fetchEventCounterForEventName:", CFSTR("WriteErrorCount_ThreadReporting"));
      v69[0] = 0;
      objc_msgSend(v16, "maxCounterName:", v69);
      v57 = v69[0];
      v68 = 0;
      objc_msgSend(v17, "maxCounterName:", &v68);
      v56 = v68;
      v66 = objc_msgSend(v17, "fetchEventCounterForEventName:");
      v55 = objc_msgSend(v15, "fetchMaxValueForStatisticsName:", CFSTR("ThreadNetwork_numAdvertisedBRs"));
      v54 = objc_msgSend(v15, "fetchMaxValueForStatisticsName:", CFSTR("ThreadNetwork_numAppleBRs"));
      v63 = objc_msgSend(v15, "fetchMaxValueForStatisticsName:", CFSTR("ThreadNetwork_numThirdPartyBRs"));
      v62 = objc_msgSend(v15, "fetchMaxValueForStatisticsName:", CFSTR("ThreadNetwork_numThreadNetworks"));
      v61 = objc_msgSend(v15, "fetchMaxValueForStatisticsName:", CFSTR("ThreadNetwork_maxSimuIPPrefixes"));
      v60 = objc_msgSend(v15, "fetchEventCounterForEventName:", CFSTR("ThreadNetwork_txTotal"));
      v59 = objc_msgSend(v15, "fetchEventCounterForEventName:", CFSTR("ThreadNetwork_txSuccess"));
      v18 = objc_msgSend(v15, "fetchMaxValueForStatisticsName:", CFSTR("ThreadNetwork_txDelayAvg"));
      v19 = objc_msgSend(v15, "fetchEventCounterForEventName:", CFSTR("ThreadNetwork_rxTotal"));
      v20 = objc_msgSend(v15, "fetchEventCounterForEventName:", CFSTR("ThreadNetwork_rxSuccess"));
      v21 = objc_msgSend(v15, "fetchEventCounterForEventName:", CFSTR("ThreadNetwork_reportDuration"));
      v22 = objc_msgSend(v15, "fetchEventCounterForEventName:", CFSTR("ThreadNetwork_uptime"));
      v23 = objc_msgSend(v15, "fetchEventCounterForEventName:", CFSTR("ThreadNetwork_downtime"));

      v24 = CFSTR("Daily Metrics");
    }
    else
    {
      v58 = -[HMDThreadNetworkObserver curReport_readWritesCount](self, "curReport_readWritesCount");
      v26 = -[HMDThreadNetworkObserver curReport_readErrorCount](self, "curReport_readErrorCount");
      v27 = -[HMDThreadNetworkObserver curReport_writeErrorCount](self, "curReport_writeErrorCount");
      -[HMDThreadNetworkObserver curReport_topReadWriteErrors](self, "curReport_topReadWriteErrors");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDThreadNetworkObserver _keyOfLargestCountInHistogram:](self, "_keyOfLargestCountInHistogram:", v28);
      v29 = objc_claimAutoreleasedReturnValue();

      -[HMDThreadNetworkObserver curReport_topSessionErrors](self, "curReport_topSessionErrors");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDThreadNetworkObserver _keyOfLargestCountInHistogram:](self, "_keyOfLargestCountInHistogram:", v30);
      v31 = objc_claimAutoreleasedReturnValue();

      v57 = (id)v29;
      if (v31)
      {
        -[HMDThreadNetworkObserver curReport_topSessionErrors](self, "curReport_topSessionErrors");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v33, "unsignedIntValue");

      }
      else
      {
        v66 = 0;
      }
      v34 = -[HMDThreadNetworkObserver curReport_numAdvertisedBRs](self, "curReport_numAdvertisedBRs");
      v35 = -[HMDThreadNetworkObserver curReport_numAppleBRs](self, "curReport_numAppleBRs");
      v36 = -[HMDThreadNetworkObserver curReport_numThirdPartyBRs](self, "curReport_numThirdPartyBRs");
      v62 = -[HMDThreadNetworkObserver curReport_numThreadNetworks](self, "curReport_numThreadNetworks");
      v61 = -[HMDThreadNetworkObserver curReport_maxSimuIPPrefixes](self, "curReport_maxSimuIPPrefixes");
      v60 = -[HMDThreadNetworkObserver curReport_txTotal](self, "curReport_txTotal");
      v59 = -[HMDThreadNetworkObserver curReport_txSuccess](self, "curReport_txSuccess");
      v53 = -[HMDThreadNetworkObserver curReport_txDelayAvg](self, "curReport_txDelayAvg");
      v52 = -[HMDThreadNetworkObserver curReport_rxTotal](self, "curReport_rxTotal");
      v20 = -[HMDThreadNetworkObserver curReport_rxSuccess](self, "curReport_rxSuccess");
      v37 = -[HMDThreadNetworkObserver curReport_reportDuration](self, "curReport_reportDuration");
      v64 = v27;
      v65 = v26;
      v63 = v36;
      v38 = v35;
      v39 = v34;
      if (-[HMDThreadNetworkObserver curReport_threadNetworkUp](self, "curReport_threadNetworkUp"))
      {
        -[HMDThreadNetworkObserver curReport_threadNetworkLastUpTime](self, "curReport_threadNetworkLastUpTime");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "timeIntervalSinceNow");
        v42 = fabs(v41);
        -[HMDThreadNetworkObserver curReport_threadNetworkUpDuration](self, "curReport_threadNetworkUpDuration");
        -[HMDThreadNetworkObserver setCurReport_threadNetworkUpDuration:](self, "setCurReport_threadNetworkUpDuration:", v43 + v42);
      }
      else
      {
        -[HMDThreadNetworkObserver curReport_threadNetworkLastDownTime](self, "curReport_threadNetworkLastDownTime");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "timeIntervalSinceNow");
        v45 = fabs(v44);
        -[HMDThreadNetworkObserver curReport_threadNetworkDownDuration](self, "curReport_threadNetworkDownDuration");
        -[HMDThreadNetworkObserver setCurReport_threadNetworkDownDuration:](self, "setCurReport_threadNetworkDownDuration:", v46 + v45);
      }
      v54 = v38;
      v55 = v39;
      v56 = (id)v31;

      -[HMDThreadNetworkObserver curReport_threadNetworkUpDuration](self, "curReport_threadNetworkUpDuration");
      v22 = v47;
      -[HMDThreadNetworkObserver curReport_threadNetworkDownDuration](self, "curReport_threadNetworkDownDuration");
      v23 = v48;
      -[HMDThreadNetworkObserver _updateDailyCountersAndResetCurrentReportStatsForHomeWithUUID:associatedWithDate:](self, "_updateDailyCountersAndResetCurrentReportStatsForHomeWithUUID:associatedWithDate:", v8, v67);
      v24 = CFSTR("Periodic Snapshot");
      v19 = v52;
      v18 = v53;
      v21 = v37;
    }
    v49 = [HMDThreadNetworkStabilityLogEvent alloc];
    v50 = -[HMDThreadNetworkStatusReport initWithNumAdvertisedBRs:numAppleBRs:numThirdPartyBRs:numThreadNetworks:maxSimuIPPrefixesDetected:txTotal:txSuccess:txDelayAvg:rxTotal:rxSuccess:reportDuration:]([HMDThreadNetworkStatusReport alloc], "initWithNumAdvertisedBRs:numAppleBRs:numThirdPartyBRs:numThreadNetworks:maxSimuIPPrefixesDetected:txTotal:txSuccess:txDelayAvg:rxTotal:rxSuccess:reportDuration:", v55, v54, v63, v62, v61, v60, v59, v18, v19, v20, v21);
    v25 = -[HMDThreadNetworkStabilityLogEvent initWithHomeUUID:threadNetworkStatusReport:threadNetworkUptime:threadNetworkDowntime:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:logTriggerReason:](v49, "initWithHomeUUID:threadNetworkStatusReport:threadNetworkUptime:threadNetworkDowntime:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:logTriggerReason:", v8, v50, v22 / 0x3C, v23 / 0x3C, v58, v65, v64, v57, v56, v66, v24);

    v9 = v67;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)_updateDailyCountersAndResetCurrentReportStatsForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDThreadNetworkObserver countersManager](self, "countersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDateCounterGroupSpecifier specifierWithGroupName:date:](HMDDateCounterGroupSpecifier, "specifierWithGroupName:date:", CFSTR("ThreadNetworkStabilityEventGroup"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", CFSTR("ThreadNetwork_txTotal"), -[HMDThreadNetworkObserver curReport_txTotal](self, "curReport_txTotal"));
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", CFSTR("ThreadNetwork_txSuccess"), -[HMDThreadNetworkObserver curReport_txSuccess](self, "curReport_txSuccess"));
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", CFSTR("ThreadNetwork_rxTotal"), -[HMDThreadNetworkObserver curReport_rxTotal](self, "curReport_rxTotal"));
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", CFSTR("ThreadNetwork_rxSuccess"), -[HMDThreadNetworkObserver curReport_rxSuccess](self, "curReport_rxSuccess"));
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", CFSTR("ThreadNetwork_reportDuration"), -[HMDThreadNetworkObserver curReport_reportDuration](self, "curReport_reportDuration"));
  -[HMDThreadNetworkObserver curReport_threadNetworkUpDuration](self, "curReport_threadNetworkUpDuration");
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", CFSTR("ThreadNetwork_uptime"), v11);
  -[HMDThreadNetworkObserver curReport_threadNetworkDownDuration](self, "curReport_threadNetworkDownDuration");
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", CFSTR("ThreadNetwork_downtime"), v12);
  objc_msgSend(v10, "addValue:toStatisticsName:", -[HMDThreadNetworkObserver curReport_numAdvertisedBRs](self, "curReport_numAdvertisedBRs"), CFSTR("ThreadNetwork_numAdvertisedBRs"));
  objc_msgSend(v10, "addValue:toStatisticsName:", -[HMDThreadNetworkObserver curReport_numAppleBRs](self, "curReport_numAppleBRs"), CFSTR("ThreadNetwork_numAppleBRs"));
  objc_msgSend(v10, "addValue:toStatisticsName:", -[HMDThreadNetworkObserver curReport_numThirdPartyBRs](self, "curReport_numThirdPartyBRs"), CFSTR("ThreadNetwork_numThirdPartyBRs"));
  objc_msgSend(v10, "addValue:toStatisticsName:", -[HMDThreadNetworkObserver curReport_numThreadNetworks](self, "curReport_numThreadNetworks"), CFSTR("ThreadNetwork_numThreadNetworks"));
  objc_msgSend(v10, "addValue:toStatisticsName:", -[HMDThreadNetworkObserver curReport_maxSimuIPPrefixes](self, "curReport_maxSimuIPPrefixes"), CFSTR("ThreadNetwork_maxSimuIPPrefixes"));
  objc_msgSend(v10, "addValue:toStatisticsName:", -[HMDThreadNetworkObserver curReport_txDelayAvg](self, "curReport_txDelayAvg"), CFSTR("ThreadNetwork_txDelayAvg"));
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", CFSTR("ReadWriteCount_ThreadReporting"), -[HMDThreadNetworkObserver curReport_readWritesCount](self, "curReport_readWritesCount"));
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", CFSTR("ReadErrorCount_ThreadReporting"), -[HMDThreadNetworkObserver curReport_readErrorCount](self, "curReport_readErrorCount"));
  v37 = v10;
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", CFSTR("WriteErrorCount_ThreadReporting"), -[HMDThreadNetworkObserver curReport_writeErrorCount](self, "curReport_writeErrorCount"));
  v38 = v7;
  v39 = v6;
  -[HMDThreadNetworkObserver counterGroupForName:homeUUID:date:](self, "counterGroupForName:homeUUID:date:", CFSTR("ReadWriteErrorEventGroup_ThreadReporting"), v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[HMDThreadNetworkObserver curReport_topReadWriteErrors](self, "curReport_topReadWriteErrors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v45;
    do
    {
      v19 = 0;
      v20 = v17;
      do
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v14);
        v21 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v19);
        -[HMDThreadNetworkObserver curReport_topReadWriteErrors](self, "curReport_topReadWriteErrors");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "incrementEventCounterForEventName:withValue:", v21, objc_msgSend(v17, "unsignedIntValue"));
        ++v19;
        v20 = v17;
      }
      while (v16 != v19);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }
  v36 = v13;

  -[HMDThreadNetworkObserver counterGroupForName:homeUUID:date:](self, "counterGroupForName:homeUUID:date:", CFSTR("AccessorySessionErrorGroup_ThreadReporting"), v39, v38);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[HMDThreadNetworkObserver curReport_topSessionErrors](self, "curReport_topSessionErrors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v41;
    do
    {
      v28 = 0;
      v29 = v17;
      do
      {
        if (*(_QWORD *)v41 != v27)
          objc_enumerationMutation(v24);
        v30 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v28);
        -[HMDThreadNetworkObserver curReport_topSessionErrors](self, "curReport_topSessionErrors", v36);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", v30);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "incrementEventCounterForEventName:withValue:", v30, objc_msgSend(v17, "unsignedIntValue"));
        ++v28;
        v29 = v17;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v26);
  }

  -[HMDThreadNetworkObserver setCurReport_readWritesCount:](self, "setCurReport_readWritesCount:", 0);
  -[HMDThreadNetworkObserver setCurReport_readErrorCount:](self, "setCurReport_readErrorCount:", 0);
  -[HMDThreadNetworkObserver setCurReport_writeErrorCount:](self, "setCurReport_writeErrorCount:", 0);
  -[HMDThreadNetworkObserver curReport_topReadWriteErrors](self, "curReport_topReadWriteErrors");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "removeAllObjects");

  -[HMDThreadNetworkObserver curReport_topSessionErrors](self, "curReport_topSessionErrors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "removeAllObjects");

  -[HMDThreadNetworkObserver setCurReport_threadNetworkUpDuration:](self, "setCurReport_threadNetworkUpDuration:", 0.0);
  -[HMDThreadNetworkObserver setCurReport_threadNetworkDownDuration:](self, "setCurReport_threadNetworkDownDuration:", 0.0);
  if (-[HMDThreadNetworkObserver curReport_threadNetworkUp](self, "curReport_threadNetworkUp"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDThreadNetworkObserver setCurReport_threadNetworkLastUpTime:](self, "setCurReport_threadNetworkLastUpTime:", v34);

    -[HMDThreadNetworkObserver setCurReport_threadNetworkLastDownTime:](self, "setCurReport_threadNetworkLastDownTime:", 0);
  }
  else
  {
    -[HMDThreadNetworkObserver setCurReport_threadNetworkLastUpTime:](self, "setCurReport_threadNetworkLastUpTime:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDThreadNetworkObserver setCurReport_threadNetworkLastDownTime:](self, "setCurReport_threadNetworkLastDownTime:", v35);

  }
}

- (void)_incrementError:(id)a3 forHistogram:(id)a4 byValue:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v9)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v9, "unsignedLongValue") + a5);
  else
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v8);

}

- (id)_keyOfLargestCountInHistogram:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  _QWORD v13[4];

  v3 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__170945;
  v11 = __Block_byref_object_dispose__170946;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__HMDThreadNetworkObserver__keyOfLargestCountInHistogram___block_invoke;
  v6[3] = &unk_1E89C22B8;
  v6[4] = v13;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
  return v4;
}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HMDThreadNetworkObserver countersManager](self, "countersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HMDThreadNetworkObserver_deleteCountersBeforeDate___block_invoke;
  v7[3] = &unk_1E89C22E0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeCounterGroupsBasedOnPredicate:", v7);

}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HMDThreadNetworkObserver countersManager](self, "countersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HMDThreadNetworkObserver_deleteCountersAfterDate___block_invoke;
  v7[3] = &unk_1E89C22E0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeCounterGroupsBasedOnPredicate:", v7);

}

- (void)_injectThreadNetworkStateForTestingWithNumAdvertisedBRs:(unint64_t)a3 numAppleBRs:(unint64_t)a4 numThirdPartyBRs:(unint64_t)a5 numThreadNetworks:(unint64_t)a6 maxSimuIPPrefixesDetected:(unint64_t)a7 txTotal:(unint64_t)a8 txSuccess:(unint64_t)a9 txDelayAvg:(unint64_t)a10 rxTotal:(unint64_t)a11 rxSuccess:(unint64_t)a12 reportDuration:(unint64_t)a13 reportDate:(id)a14 reportDailySummary:(BOOL)a15
{
  id v22;

  v22 = a14;
  -[HMDThreadNetworkObserver setCurReport_numAdvertisedBRs:](self, "setCurReport_numAdvertisedBRs:", a3);
  -[HMDThreadNetworkObserver setCurReport_numAppleBRs:](self, "setCurReport_numAppleBRs:", a4);
  -[HMDThreadNetworkObserver setCurReport_numThirdPartyBRs:](self, "setCurReport_numThirdPartyBRs:", a5);
  -[HMDThreadNetworkObserver setCurReport_numThreadNetworks:](self, "setCurReport_numThreadNetworks:", a6);
  -[HMDThreadNetworkObserver setCurReport_maxSimuIPPrefixes:](self, "setCurReport_maxSimuIPPrefixes:", a7);
  -[HMDThreadNetworkObserver setCurReport_txTotal:](self, "setCurReport_txTotal:", a8);
  -[HMDThreadNetworkObserver setCurReport_txSuccess:](self, "setCurReport_txSuccess:", a9);
  -[HMDThreadNetworkObserver setCurReport_txDelayAvg:](self, "setCurReport_txDelayAvg:", a10);
  -[HMDThreadNetworkObserver setCurReport_rxTotal:](self, "setCurReport_rxTotal:", a11);
  -[HMDThreadNetworkObserver setCurReport_rxSuccess:](self, "setCurReport_rxSuccess:", a12);
  -[HMDThreadNetworkObserver setCurReport_reportDuration:](self, "setCurReport_reportDuration:", a13);
  -[HMDThreadNetworkObserver _runLoggingForDate:isDailySummary:](self, "_runLoggingForDate:isDailySummary:", v22, a15);

}

- (HMMLogEventDispatching)logEventDispatcher
{
  return (HMMLogEventDispatching *)objc_loadWeakRetained((id *)&self->_logEventDispatcher);
}

- (HMDEventCountersManager)countersManager
{
  return (HMDEventCountersManager *)objc_loadWeakRetained((id *)&self->_countersManager);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_loadWeakRetained((id *)&self->_notificationCenter);
}

- (HMDCurrentResidentDeviceDataSource)currentHomeDataSource
{
  return (HMDCurrentResidentDeviceDataSource *)objc_loadWeakRetained((id *)&self->_currentHomeDataSource);
}

- (HMMDateProvider)dateProvider
{
  return (HMMDateProvider *)objc_loadWeakRetained((id *)&self->_dateProvider);
}

- (unint64_t)curReport_numAdvertisedBRs
{
  return self->_curReport_numAdvertisedBRs;
}

- (void)setCurReport_numAdvertisedBRs:(unint64_t)a3
{
  self->_curReport_numAdvertisedBRs = a3;
}

- (unint64_t)curReport_numAppleBRs
{
  return self->_curReport_numAppleBRs;
}

- (void)setCurReport_numAppleBRs:(unint64_t)a3
{
  self->_curReport_numAppleBRs = a3;
}

- (unint64_t)curReport_numThirdPartyBRs
{
  return self->_curReport_numThirdPartyBRs;
}

- (void)setCurReport_numThirdPartyBRs:(unint64_t)a3
{
  self->_curReport_numThirdPartyBRs = a3;
}

- (unint64_t)curReport_numThreadNetworks
{
  return self->_curReport_numThreadNetworks;
}

- (void)setCurReport_numThreadNetworks:(unint64_t)a3
{
  self->_curReport_numThreadNetworks = a3;
}

- (unint64_t)curReport_maxSimuIPPrefixes
{
  return self->_curReport_maxSimuIPPrefixes;
}

- (void)setCurReport_maxSimuIPPrefixes:(unint64_t)a3
{
  self->_curReport_maxSimuIPPrefixes = a3;
}

- (unint64_t)curReport_txTotal
{
  return self->_curReport_txTotal;
}

- (void)setCurReport_txTotal:(unint64_t)a3
{
  self->_curReport_txTotal = a3;
}

- (unint64_t)curReport_txSuccess
{
  return self->_curReport_txSuccess;
}

- (void)setCurReport_txSuccess:(unint64_t)a3
{
  self->_curReport_txSuccess = a3;
}

- (unint64_t)curReport_txDelayAvg
{
  return self->_curReport_txDelayAvg;
}

- (void)setCurReport_txDelayAvg:(unint64_t)a3
{
  self->_curReport_txDelayAvg = a3;
}

- (unint64_t)curReport_rxTotal
{
  return self->_curReport_rxTotal;
}

- (void)setCurReport_rxTotal:(unint64_t)a3
{
  self->_curReport_rxTotal = a3;
}

- (unint64_t)curReport_rxSuccess
{
  return self->_curReport_rxSuccess;
}

- (void)setCurReport_rxSuccess:(unint64_t)a3
{
  self->_curReport_rxSuccess = a3;
}

- (unint64_t)curReport_reportDuration
{
  return self->_curReport_reportDuration;
}

- (void)setCurReport_reportDuration:(unint64_t)a3
{
  self->_curReport_reportDuration = a3;
}

- (BOOL)curReport_threadNetworkUp
{
  return self->_curReport_threadNetworkUp;
}

- (void)setCurReport_threadNetworkUp:(BOOL)a3
{
  self->_curReport_threadNetworkUp = a3;
}

- (double)curReport_threadNetworkUpDuration
{
  return self->_curReport_threadNetworkUpDuration;
}

- (void)setCurReport_threadNetworkUpDuration:(double)a3
{
  self->_curReport_threadNetworkUpDuration = a3;
}

- (double)curReport_threadNetworkDownDuration
{
  return self->_curReport_threadNetworkDownDuration;
}

- (void)setCurReport_threadNetworkDownDuration:(double)a3
{
  self->_curReport_threadNetworkDownDuration = a3;
}

- (NSDate)curReport_threadNetworkLastUpTime
{
  return self->_curReport_threadNetworkLastUpTime;
}

- (void)setCurReport_threadNetworkLastUpTime:(id)a3
{
  objc_storeStrong((id *)&self->_curReport_threadNetworkLastUpTime, a3);
}

- (NSDate)curReport_threadNetworkLastDownTime
{
  return self->_curReport_threadNetworkLastDownTime;
}

- (void)setCurReport_threadNetworkLastDownTime:(id)a3
{
  objc_storeStrong((id *)&self->_curReport_threadNetworkLastDownTime, a3);
}

- (unint64_t)curReport_readWritesCount
{
  return self->_curReport_readWritesCount;
}

- (void)setCurReport_readWritesCount:(unint64_t)a3
{
  self->_curReport_readWritesCount = a3;
}

- (unint64_t)curReport_readErrorCount
{
  return self->_curReport_readErrorCount;
}

- (void)setCurReport_readErrorCount:(unint64_t)a3
{
  self->_curReport_readErrorCount = a3;
}

- (unint64_t)curReport_writeErrorCount
{
  return self->_curReport_writeErrorCount;
}

- (void)setCurReport_writeErrorCount:(unint64_t)a3
{
  self->_curReport_writeErrorCount = a3;
}

- (NSMutableDictionary)curReport_topReadWriteErrors
{
  return self->_curReport_topReadWriteErrors;
}

- (NSMutableDictionary)curReport_topSessionErrors
{
  return self->_curReport_topSessionErrors;
}

- (BOOL)started
{
  return self->_started;
}

- (BOOL)dailyReportingRegistered
{
  return self->_dailyReportingRegistered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curReport_topSessionErrors, 0);
  objc_storeStrong((id *)&self->_curReport_topReadWriteErrors, 0);
  objc_storeStrong((id *)&self->_curReport_threadNetworkLastDownTime, 0);
  objc_storeStrong((id *)&self->_curReport_threadNetworkLastUpTime, 0);
  objc_destroyWeak((id *)&self->_dateProvider);
  objc_destroyWeak((id *)&self->_currentHomeDataSource);
  objc_destroyWeak((id *)&self->_notificationCenter);
  objc_destroyWeak((id *)&self->_countersManager);
  objc_destroyWeak((id *)&self->_logEventDispatcher);
}

uint64_t __52__HMDThreadNetworkObserver_deleteCountersAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 32)) == 1)
    {
      if ((objc_msgSend(v6, "isEqual:", CFSTR("ThreadNetworkStabilityEventGroup")) & 1) != 0
        || (objc_msgSend(v6, "isEqual:", CFSTR("ReadWriteErrorEventGroup_ThreadReporting")) & 1) != 0)
      {
        v8 = 1;
      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", CFSTR("AccessorySessionErrorGroup_ThreadReporting"));
      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __53__HMDThreadNetworkObserver_deleteCountersBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 32)) == -1)
    {
      if ((objc_msgSend(v6, "isEqual:", CFSTR("ThreadNetworkStabilityEventGroup")) & 1) != 0
        || (objc_msgSend(v6, "isEqual:", CFSTR("ReadWriteErrorEventGroup_ThreadReporting")) & 1) != 0)
      {
        v8 = 1;
      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", CFSTR("AccessorySessionErrorGroup_ThreadReporting"));
      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __58__HMDThreadNetworkObserver__keyOfLargestCountInHistogram___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) < (unint64_t)objc_msgSend(v6, "unsignedIntValue"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "unsignedIntValue");
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

+ (id)supportedEventClasses
{
  if (supportedEventClasses_onceToken_170991 != -1)
    dispatch_once(&supportedEventClasses_onceToken_170991, &__block_literal_global_170992);
  return (id)supportedEventClasses_supportedEventClasses_170993;
}

void __49__HMDThreadNetworkObserver_supportedEventClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedEventClasses_supportedEventClasses_170993;
  supportedEventClasses_supportedEventClasses_170993 = v0;

}

@end
