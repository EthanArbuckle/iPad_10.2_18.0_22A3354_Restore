@implementation HMDCloudSyncLogEventsAnalyzer

- (HMDCloudSyncLogEventsAnalyzer)initWithDataSource:(id)a3
{
  id v4;
  HMDCloudSyncLogEventsAnalyzer *v5;
  uint64_t v6;
  HMDEventCountersManager *eventCountersManager;
  uint64_t v8;
  HMDTimeBasedFlagsManager *flagsManager;
  uint64_t v10;
  HMMLogEventSubmitting *logEventSubmitter;
  uint64_t v12;
  HMMDateProvider *dateProvider;
  uint64_t v14;
  HMDMetricsDeviceStateProvider *deviceStateProvider;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[11];

  v20[10] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMDCloudSyncLogEventsAnalyzer;
  v5 = -[HMDCloudSyncLogEventsAnalyzer init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "legacyCountersManager");
    v6 = objc_claimAutoreleasedReturnValue();
    eventCountersManager = v5->_eventCountersManager;
    v5->_eventCountersManager = (HMDEventCountersManager *)v6;

    objc_msgSend(v4, "flagsManager");
    v8 = objc_claimAutoreleasedReturnValue();
    flagsManager = v5->_flagsManager;
    v5->_flagsManager = (HMDTimeBasedFlagsManager *)v8;

    objc_msgSend(v4, "logEventSubmitter");
    v10 = objc_claimAutoreleasedReturnValue();
    logEventSubmitter = v5->_logEventSubmitter;
    v5->_logEventSubmitter = (HMMLogEventSubmitting *)v10;

    objc_msgSend(v4, "dateProvider");
    v12 = objc_claimAutoreleasedReturnValue();
    dateProvider = v5->_dateProvider;
    v5->_dateProvider = (HMMDateProvider *)v12;

    objc_msgSend(v4, "deviceStateProvider");
    v14 = objc_claimAutoreleasedReturnValue();
    deviceStateProvider = v5->_deviceStateProvider;
    v5->_deviceStateProvider = (HMDMetricsDeviceStateProvider *)v14;

    objc_msgSend(v4, "logEventDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v20[3] = objc_opt_class();
    v20[4] = objc_opt_class();
    v20[5] = objc_opt_class();
    v20[6] = objc_opt_class();
    v20[7] = objc_opt_class();
    v20[8] = objc_opt_class();
    v20[9] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:forEventClasses:", v5, v17);

    objc_msgSend(v4, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("cloudSyncPushCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerIncomingPushCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"), 100);
    objc_msgSend(v4, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("cloudSyncFetchCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyFetchCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"), 100);
    objc_msgSend(v4, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("cloudSyncFetchCountV2"), CFSTR("HMDCloudSyncLogEventsAnalyzerFetchCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"), 100);
    objc_msgSend(v4, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("cloudSyncUploadCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"), 10);
    objc_msgSend(v4, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("cloudSyncUploadCountV2"), CFSTR("HMDCloudSyncLogEventsAnalyzerUploadCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"), 10);
    objc_msgSend(v4, "addThresholdTrigger:forEventName:requestGroup:atThreshold:uploadImmediately:", CFSTR("cloudSyncUploadErrorCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadErrorCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"), 10, 1);
    objc_msgSend(v4, "addThresholdTrigger:forEventName:requestGroup:atThreshold:uploadImmediately:", CFSTR("cloudSyncUploadErrorCountV2"), CFSTR("HMDCloudSyncLogEventsAnalyzerUploadErrorCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"), 10, 1);
  }

  return v5;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4;
  void *v5;
  HMDCloudSyncLogEventsAnalyzer *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *context;
  HMDCloudSyncLogEventsAnalyzer *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v8;
    v37 = 2112;
    v38 = objc_opt_class();
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@[CloudSyncLogEventsAnalyzer] Processing Cloud Event: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    -[HMDCloudSyncLogEventsAnalyzer handleIncomingCloudPushLogEvent:](v6, "handleIncomingCloudPushLogEvent:", v11);
  }
  else
  {
    v12 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      -[HMDCloudSyncLogEventsAnalyzer handleFetchLogEvent:](v6, "handleFetchLogEvent:", v14);
    }
    else
    {
      v15 = v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      if (v17)
      {
        -[HMDCloudSyncLogEventsAnalyzer handleUploadLogEvent:](v6, "handleUploadLogEvent:", v17);
      }
      else
      {
        v18 = v15;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
        v20 = v19;

        if (v20)
        {
          -[HMDCloudSyncLogEventsAnalyzer handleUploadReasonLogEvent:](v6, "handleUploadReasonLogEvent:", v20);
        }
        else
        {
          v21 = v18;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v22 = v21;
          else
            v22 = 0;
          v23 = v22;

          if (v23)
          {
            -[HMDCloudSyncLogEventsAnalyzer handleMaximumDelayLogEvent:](v6, "handleMaximumDelayLogEvent:", v23);
          }
          else
          {
            v24 = v21;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v25 = v24;
            else
              v25 = 0;
            v26 = v25;

            if (v26)
            {
              -[HMDCloudSyncLogEventsAnalyzer handleDecryptionCompletedEvent:](v6, "handleDecryptionCompletedEvent:", v26);
            }
            else
            {
              v27 = v24;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v28 = v27;
              else
                v28 = 0;
              v29 = v28;

              if (v29)
              {
                -[HMDCloudSyncLogEventsAnalyzer handleRecordOperationLogEvent:](v6, "handleRecordOperationLogEvent:", v29);
              }
              else
              {
                context = (void *)MEMORY[0x1D17BA0A0]();
                v34 = v6;
                HMFGetOSLogHandle();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_opt_class();
                  *(_DWORD *)buf = 138543618;
                  v36 = v32;
                  v37 = 2112;
                  v38 = v31;
                  _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Event class: %@ matched none of the handlers in HMDCloudSyncLogEventsAnalyzer", buf, 0x16u);

                }
                objc_autoreleasePoolPop(context);
              }

            }
          }

        }
      }

    }
  }

}

- (void)handleIncomingCloudPushLogEvent:(id)a3
{
  void *v4;
  int v5;
  id v6;

  objc_msgSend(a3, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.icloud-container.com.apple.willowd"));

  if (v5)
  {
    -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDCloudSyncLogEventsAnalyzerIncomingPushCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"));

  }
}

- (void)handleFetchLogEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v13;
  else
    v4 = 0;
  v5 = v4;
  -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyFetchCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"));

    objc_msgSend(v5, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyFetchErrorCount");
LABEL_9:
      objc_msgSend(v9, "incrementEventCounterForEventName:requestGroup:", v11, CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"));

    }
  }
  else
  {
    objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDCloudSyncLogEventsAnalyzerFetchCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"));

    objc_msgSend(v13, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("HMDCloudSyncLogEventsAnalyzerFetchErrorCount");
      goto LABEL_9;
    }
  }

}

- (void)handleUploadLogEvent:(id)a3
{
  void *v4;
  id v5;
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
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v20;
  else
    v4 = 0;
  v5 = v4;
  -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"));

    objc_msgSend(v5, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadErrorCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"));

      -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %tu"), v13, objc_msgSend(v14, "code"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadErrorRequestGroupKey");
LABEL_9:
      objc_msgSend(v10, "incrementEventCounterForEventName:requestGroup:", v15, v16);

    }
  }
  else
  {
    objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDCloudSyncLogEventsAnalyzerUploadCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"));

    objc_msgSend(v20, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDCloudSyncLogEventsAnalyzerUploadErrorCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"));

      -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v20, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ %tu"), v13, objc_msgSend(v14, "code"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("HMDCloudSyncLogEventsAnalyzerUploadErrorRequestGroupKey");
      goto LABEL_9;
    }
  }

}

- (void)handleUploadReasonLogEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCloudSyncLogEventsAnalyzer *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "saveReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544386;
      v16 = v9;
      v17 = 2114;
      v18 = v5;
      v19 = 2048;
      v20 = objc_msgSend(v4, "legacyPushCount");
      v21 = 2048;
      v22 = objc_msgSend(v4, "homeZonePushCount");
      v23 = 2048;
      v24 = objc_msgSend(v4, "homeManagerPushCount");
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[HMDCloudSyncLogEventsAnalyzer] Received upload reason: %{public}@ Count for legacy: %ld homeZone: %ld homeManager: %ld", (uint8_t *)&v15, 0x34u);

    }
    objc_autoreleasePoolPop(v6);
    v10 = objc_msgSend(v4, "legacyPushCount");
    v11 = v10;
    if (v10 < 1)
    {
      v11 = -v10;
      -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](v7, "eventCountersManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "saveReason");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadNoPushReasonRequestGroupKey");
    }
    else
    {
      -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](v7, "eventCountersManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "saveReason");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadReasonRequestGroupKey");
    }
    objc_msgSend(v12, "incrementEventCounterForEventName:requestGroup:withValue:", v13, v14, v11);

  }
}

- (void)handleMaximumDelayLogEvent:(id)a3
{
  id v3;

  -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDCloudSyncLogEventsAnalyzerUploadMaximumDelayReached"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"));

}

- (void)handleDecryptionCompletedEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDCloudSyncLogEventsAnalyzer flagsManager](self, "flagsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flagForName:periodicity:", CFSTR("HMDCloudSyncLogEventsAnalyzerLastDecryptionFailed"), 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v4, "didDecryptionFail");
  if ((_DWORD)v5)
  {
    -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDCloudSyncLogEventsAnalyzerDecryptionFailedCount"), CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"));

    objc_msgSend(v7, "setCurrentBit");
  }
  else
  {
    objc_msgSend(v7, "clearCurrentBit");
  }

}

- (void)handleRecordOperationLogEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  id v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "isLegacy");
    -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "size");
    if (v8)
      v11 = CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyHomeDataBytesPushed");
    else
      v11 = CFSTR("HMDCloudSyncLogEventsAnalyzerHomeDataBytesPushed");
    objc_msgSend(v9, "incrementEventCounterForEventName:requestGroup:withValue:", v11, CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"), v10);

  }
  v18 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v18;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    v14 = objc_msgSend(v13, "isLegacy");
    -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "size");
    if (v14)
      v17 = CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyHomeDataBytesFetched");
    else
      v17 = CFSTR("HMDCloudSyncLogEventsAnalyzerHomeDataBytesFetched");
    objc_msgSend(v15, "incrementEventCounterForEventName:requestGroup:withValue:", v17, CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"), v16);

  }
}

- (id)cloudSyncAnalysisResultForDate:(id)a3
{
  id v4;
  HMDCloudSyncAnalysisResultLogEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  v4 = a3;
  v5 = objc_alloc_init(HMDCloudSyncAnalysisResultLogEvent);
  -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "counterGroupForName:", CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCloudSyncAnalysisResultLogEvent setUploadMaximumDelayReached:](v5, "setUploadMaximumDelayReached:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerUploadMaximumDelayReached"), v4) != 0);
  -[HMDCloudSyncLogEventsAnalyzer flagsManager](self, "flagsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flagForName:periodicity:", CFSTR("HMDCloudSyncLogEventsAnalyzerLastDecryptionFailed"), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCloudSyncAnalysisResultLogEvent setLastDecryptionFailed:](v5, "setLastDecryptionFailed:", objc_msgSend(v26, "bitsForDate:bitCount:outValidBitCount:", v4, 1, 0) != 0);
  -[HMDCloudSyncAnalysisResultLogEvent setIncomingPushCount:](v5, "setIncomingPushCount:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerIncomingPushCount"), v4));
  -[HMDCloudSyncAnalysisResultLogEvent setFetchCount:](v5, "setFetchCount:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerFetchCount"), v4));
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyFetchCount:](v5, "setLegacyFetchCount:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyFetchCount"), v4));
  -[HMDCloudSyncAnalysisResultLogEvent setFetchErrorCount:](v5, "setFetchErrorCount:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerFetchErrorCount"), v4));
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyFetchErrorCount:](v5, "setLegacyFetchErrorCount:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyFetchErrorCount"), v4));
  -[HMDCloudSyncAnalysisResultLogEvent setUploadCount:](v5, "setUploadCount:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerUploadCount"), v4));
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyUploadCount:](v5, "setLegacyUploadCount:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadCount"), v4));
  -[HMDCloudSyncAnalysisResultLogEvent setUploadErrorCount:](v5, "setUploadErrorCount:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerUploadErrorCount"), v4));
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyUploadErrorCount:](v5, "setLegacyUploadErrorCount:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadErrorCount"), v4));
  -[HMDCloudSyncAnalysisResultLogEvent setDecryptionFailedCount:](v5, "setDecryptionFailedCount:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerDecryptionFailedCount"), v4));
  -[HMDCloudSyncAnalysisResultLogEvent setBytesFetched:](v5, "setBytesFetched:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerHomeDataBytesFetched"), v4));
  -[HMDCloudSyncAnalysisResultLogEvent setBytesPushed:](v5, "setBytesPushed:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerHomeDataBytesPushed"), v4));
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyBytesFetched:](v5, "setLegacyBytesFetched:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyHomeDataBytesFetched"), v4));
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyBytesPushed:](v5, "setLegacyBytesPushed:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyHomeDataBytesPushed"), v4));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "counterGroupForName:", CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadReasonRequestGroupKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "counterGroupForName:", CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadNoPushReasonRequestGroupKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "eventCountersForDate:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __64__HMDCloudSyncLogEventsAnalyzer_cloudSyncAnalysisResultForDate___block_invoke;
  v27[3] = &unk_1E89B7608;
  v28 = v13;
  v29 = v4;
  v30 = v9;
  v15 = v9;
  v16 = v4;
  v25 = v13;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v27);
  v17 = (void *)objc_msgSend(v15, "copy");
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyUploadReasonCountMap:](v5, "setLegacyUploadReasonCountMap:", v17);

  -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "counterGroupForName:", CFSTR("HMDCloudSyncLogEventsAnalyzerUploadErrorRequestGroupKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "eventCountersForDate:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudSyncAnalysisResultLogEvent setUploadErrorCountMap:](v5, "setUploadErrorCountMap:", v20);

  -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "counterGroupForName:", CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadErrorRequestGroupKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "eventCountersForDate:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyUploadErrorCountMap:](v5, "setLegacyUploadErrorCountMap:", v23);

  return v5;
}

- (void)resetDataSource
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
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
  objc_msgSend((id)objc_opt_class(), "managedEventCounterRequestGroups", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[HMDCloudSyncLogEventsAnalyzer eventCountersManager](self, "eventCountersManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "resetEventCountersForRequestGroup:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[HMDCloudSyncLogEventsAnalyzer cloudSyncAnalysisResultForDate:](self, "cloudSyncAnalysisResultForDate:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCloudSyncPushCount:", objc_msgSend(v7, "incomingPushCount"));
  objc_msgSend(v6, "setCloudSyncFetchCount:", objc_msgSend(v7, "legacyFetchCount"));
  objc_msgSend(v6, "setCloudSyncUploadCount:", objc_msgSend(v7, "legacyUploadCount"));
  objc_msgSend(v6, "setCloudSyncUploadErrorCount:", objc_msgSend(v7, "legacyUploadErrorCount"));
  objc_msgSend(v6, "setHomeDataBytesFetched:", objc_msgSend(v7, "bytesFetched"));
  objc_msgSend(v6, "setHomeDataBytesPushed:", objc_msgSend(v7, "bytesPushed"));
  objc_msgSend(v6, "setLegacyHomeDataBytesFetched:", objc_msgSend(v7, "legacyBytesFetched"));
  objc_msgSend(v6, "setLegacyHomeDataBytesPushed:", objc_msgSend(v7, "legacyBytesPushed"));
  objc_msgSend(v6, "setCloudSyncDecryptionFailedCount:", objc_msgSend(v7, "decryptionFailedCount"));
  objc_msgSend(v6, "setCloudSyncLastDecryptionFailed:", objc_msgSend(v7, "lastDecryptionFailed"));
  objc_msgSend(v6, "setCloudSyncMaximumDelayReached:", objc_msgSend(v7, "uploadMaximumDelayReached"));

}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (HMDTimeBasedFlagsManager)flagsManager
{
  return self->_flagsManager;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (HMDMetricsDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (HMDLogEventAnalyzerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_deviceStateProvider, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_flagsManager, 0);
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
}

void __64__HMDCloudSyncLogEventsAnalyzer_cloudSyncAnalysisResultForDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = objc_msgSend(a3, "unsignedIntegerValue");
  if (v5 - objc_msgSend(*(id *)(a1 + 32), "fetchEventCounterForEventName:forDate:", v7, *(_QWORD *)(a1 + 40)) >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v6, v7);

  }
}

+ (id)managedEventCounterRequestGroups
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey");
  v3[1] = CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadReasonRequestGroupKey");
  v3[2] = CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadNoPushReasonRequestGroupKey");
  v3[3] = CFSTR("HMDCloudSyncLogEventsAnalyzerUploadErrorRequestGroupKey");
  v3[4] = CFSTR("HMDCloudSyncLogEventsAnalyzerLegacyUploadErrorRequestGroupKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
