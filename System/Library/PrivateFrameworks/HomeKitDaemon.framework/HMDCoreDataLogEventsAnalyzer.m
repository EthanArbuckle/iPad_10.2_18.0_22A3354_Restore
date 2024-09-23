@implementation HMDCoreDataLogEventsAnalyzer

- (HMDCoreDataLogEventsAnalyzer)initWithEventCountersManager:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDCoreDataLogEventsAnalyzer *v12;
  HMDCoreDataLogEventsAnalyzer *v13;
  uint64_t v14;
  HMDEventCounterGroup *aggregationEventGroup;
  uint64_t v16;
  HMDEventCounterGroup *cloudStoreReasonsEventGroup;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDCoreDataLogEventsAnalyzer;
  v12 = -[HMDCoreDataLogEventsAnalyzer init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_countersManager, a3);
    objc_storeStrong((id *)&v13->_logEventSubmitter, a4);
    objc_msgSend(v9, "counterGroupForName:", CFSTR("CoreDataAggregationEventGroup"));
    v14 = objc_claimAutoreleasedReturnValue();
    aggregationEventGroup = v13->_aggregationEventGroup;
    v13->_aggregationEventGroup = (HMDEventCounterGroup *)v14;

    objc_msgSend(v9, "counterGroupForName:", CFSTR("CoreDataCloudStoreReasonsGroup"));
    v16 = objc_claimAutoreleasedReturnValue();
    cloudStoreReasonsEventGroup = v13->_cloudStoreReasonsEventGroup;
    v13->_cloudStoreReasonsEventGroup = (HMDEventCounterGroup *)v16;

    objc_msgSend(v11, "registerDailyTaskRunner:", v13);
  }

  return v13;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v12;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    -[HMDCoreDataLogEventsAnalyzer handleWorkingStoreTransactionEvent:](self, "handleWorkingStoreTransactionEvent:", v5);
  }
  else
  {
    v6 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      -[HMDCoreDataLogEventsAnalyzer handleCloudStoreTransactionEvent:](self, "handleCloudStoreTransactionEvent:", v8);
    }
    else
    {
      v9 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      if (v11)
        -[HMDCoreDataLogEventsAnalyzer handleCloudKitOperationEvent:](self, "handleCloudKitOperationEvent:", v11);

    }
  }

}

- (void)handleCloudStoreTransactionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMDCoreDataLogEventsAnalyzer *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  HMDCoreDataLogEventsAnalyzer *v19;
  void *v20;
  void *v21;
  __int128 v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCoreDataLogEventsAnalyzer aggregationEventGroup](self, "aggregationEventGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "incrementEventCounterForEventName:", CFSTR("CloudStoreCommitCount"));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v4, "reasons");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v26;
    *(_QWORD *)&v7 = 138543874;
    v22 = v7;
    do
    {
      v10 = 0;
      v23 = v8;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v10);
        objc_msgSend(v4, "reasons", v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countForObject:", v11);

        v14 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = v9;
          v18 = v4;
          v19 = self;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v22;
          v30 = v20;
          v31 = 2112;
          v32 = v11;
          v33 = 2048;
          v34 = v13;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Processing HMDCoreDataCloudStoreTransactionLogEvent with reason: %@ reasonCount: %lu", buf, 0x20u);

          self = v19;
          v4 = v18;
          v9 = v17;
          v8 = v23;
        }

        objc_autoreleasePoolPop(v14);
        -[HMDCoreDataLogEventsAnalyzer cloudStoreReasonsEventGroup](v15, "cloudStoreReasonsEventGroup");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "incrementEventCounterForEventName:withValue:", v11, v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v8);
  }

}

- (void)handleWorkingStoreTransactionEvent:(id)a3
{
  id v4;
  void *v5;
  HMDCoreDataLogEventsAnalyzer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionAuthor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Processing HMDCoreDataWorkingStoreTransactionLogEvent, author: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCoreDataLogEventsAnalyzer aggregationEventGroup](v6, "aggregationEventGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "incrementEventCounterForEventName:", CFSTR("WorkingStoreCommitCount"));

}

- (void)handleCloudKitOperationEvent:(id)a3
{
  id v4;
  void *v5;
  HMDCoreDataLogEventsAnalyzer *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2048;
    v16 = objc_msgSend(v4, "operationType");
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Processing HMDCoreDataCloudKitOperationLogEvent, operationType: %lu", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = objc_msgSend(v4, "operationType");
  if (v9 == 2)
  {
    -[HMDCoreDataLogEventsAnalyzer aggregationEventGroup](v6, "aggregationEventGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("CloudKitExportCount");
    goto LABEL_7;
  }
  if (v9 == 1)
  {
    -[HMDCoreDataLogEventsAnalyzer aggregationEventGroup](v6, "aggregationEventGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("CloudKitImportCount");
LABEL_7:
    objc_msgSend(v10, "incrementEventCounterForEventName:", v12);

  }
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[HMDCoreDataLogEventsAnalyzer aggregationEventGroup](self, "aggregationEventGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCloudStoreCoreDataTransactionCount:", objc_msgSend(v8, "fetchEventCounterForEventName:forDate:", CFSTR("CloudStoreCommitCount"), v6));

  -[HMDCoreDataLogEventsAnalyzer aggregationEventGroup](self, "aggregationEventGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWorkingStoreCoreDataTransactionCount:", objc_msgSend(v9, "fetchEventCounterForEventName:forDate:", CFSTR("WorkingStoreCommitCount"), v6));

  -[HMDCoreDataLogEventsAnalyzer aggregationEventGroup](self, "aggregationEventGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCoreDataCloudKitImportCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("CloudKitImportCount"), v6));

  -[HMDCoreDataLogEventsAnalyzer aggregationEventGroup](self, "aggregationEventGroup");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v12, "fetchEventCounterForEventName:forDate:", CFSTR("CloudKitExportCount"), v6);

  objc_msgSend(v7, "setCoreDataCloudKitExportCount:", v11);
}

- (void)resetAggregationAnalysisContext
{
  id v2;

  -[HMDCoreDataLogEventsAnalyzer aggregationEventGroup](self, "aggregationEventGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetEventCounters");

}

- (void)runDailyTask
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  -[HMDCoreDataLogEventsAnalyzer cloudStoreReasonsEventGroup](self, "cloudStoreReasonsEventGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventCounters");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__HMDCoreDataLogEventsAnalyzer_runDailyTask__block_invoke;
  v6[3] = &unk_24E794580;
  v6[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);
  -[HMDCoreDataLogEventsAnalyzer cloudStoreReasonsEventGroup](self, "cloudStoreReasonsEventGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetEventCounters");

}

- (HMDEventCounterGroup)aggregationEventGroup
{
  return self->_aggregationEventGroup;
}

- (HMDEventCounterGroup)cloudStoreReasonsEventGroup
{
  return self->_cloudStoreReasonsEventGroup;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMDEventCountersManager)countersManager
{
  return self->_countersManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countersManager, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_cloudStoreReasonsEventGroup, 0);
  objc_storeStrong((id *)&self->_aggregationEventGroup, 0);
}

void __44__HMDCoreDataLogEventsAnalyzer_runDailyTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  HMDCoreDataCloudStoreReasonsDailyLogEvent *v7;
  uint64_t v8;
  HMDCoreDataCloudStoreReasonsDailyLogEvent *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "logEventSubmitter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [HMDCoreDataCloudStoreReasonsDailyLogEvent alloc];
  v8 = objc_msgSend(v5, "unsignedIntegerValue");

  v9 = -[HMDCoreDataCloudStoreReasonsDailyLogEvent initWithReason:reasonCount:](v7, "initWithReason:reasonCount:", v6, v8);
  objc_msgSend(v10, "submitLogEvent:", v9);

}

+ (id)managedEventCounterRequestGroups
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("CoreDataAggregationEventGroup");
  v3[1] = CFSTR("CoreDataCloudStoreReasonsGroup");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
