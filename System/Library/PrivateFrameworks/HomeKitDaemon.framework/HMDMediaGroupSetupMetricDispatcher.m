@implementation HMDMediaGroupSetupMetricDispatcher

- (HMDMediaGroupSetupMetricDispatcher)initWithDataSource:(id)a3 logEventSubmitter:(id)a4 currentUpTicksFactory:(id)a5 submissionTimerFactory:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDMediaGroupSetupMetricDispatcher *v14;
  HMDMediaGroupSetupMetricDispatcher *v15;
  void *v16;
  id currentUpTicksFactory;
  void *v18;
  id submissionTimerFactory;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDMediaGroupSetupMetricDispatcher;
  v14 = -[HMDMediaGroupSetupMetricDispatcher init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v14->_dataSource, v10);
    v15->_metricType = 0;
    v16 = _Block_copy(v12);
    currentUpTicksFactory = v15->_currentUpTicksFactory;
    v15->_currentUpTicksFactory = v16;

    objc_storeWeak((id *)&v15->_logEventSubmitter, v11);
    v18 = _Block_copy(v13);
    submissionTimerFactory = v15->_submissionTimerFactory;
    v15->_submissionTimerFactory = v18;

  }
  return v15;
}

- (HMDMediaGroupSetupMetricDispatcher)initWithDataSource:(id)a3 logEventSubmitter:(id)a4
{
  return -[HMDMediaGroupSetupMetricDispatcher initWithDataSource:logEventSubmitter:currentUpTicksFactory:submissionTimerFactory:](self, "initWithDataSource:logEventSubmitter:currentUpTicksFactory:submissionTimerFactory:", a3, a4, &__block_literal_global_89419, &__block_literal_global_17_89420);
}

- (void)_resetActiveTracking
{
  void *v3;
  HMDMediaGroupSetupMetricDispatcher *v4;
  NSObject *v5;
  void *v6;
  NSUUID *activeGroupIdentifier;
  NSUUID *v8;
  HMFTimer *submissionTimer;
  NSUUID *setupSessionIdentifier;
  int v11;
  void *v12;
  __int16 v13;
  NSUUID *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = (void *)MEMORY[0x227676638]();
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    activeGroupIdentifier = v4->_activeGroupIdentifier;
    v11 = 138543618;
    v12 = v6;
    v13 = 2112;
    v14 = activeGroupIdentifier;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Reset active tracking for group identifier: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v4->_metricType = 0;
  v8 = v4->_activeGroupIdentifier;
  v4->_activeGroupIdentifier = 0;

  v4->_requestReceivedTimeMS = 0;
  v4->_requestCommittedTimeMS = 0;
  submissionTimer = v4->_submissionTimer;
  v4->_submissionTimer = 0;

  setupSessionIdentifier = v4->_setupSessionIdentifier;
  v4->_setupSessionIdentifier = 0;

  v4->_setupSessionStartTimeMS = 0;
}

- (void)markRequestReceivedForGroupIdentifier:(id)a3 metricType:(unint64_t)a4 setupSessionIdentifier:(id)a5 setupSessionStartTimeMS:(unint64_t)a6
{
  id v11;
  uint64_t v12;
  void *v13;
  HMDMediaGroupSetupMetricDispatcher *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSUUID *activeGroupIdentifier;
  unint64_t v19;
  const __CFString *v20;
  void *v21;
  HMDMediaGroupSetupMetricDispatcher *v22;
  NSObject *v23;
  void *v24;
  unint64_t metricType;
  HMDMediaGroupSetupMetricDispatcher *v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  const __CFString *v30;
  NSObject *v31;
  uint64_t v32;
  const __CFString *v33;
  HMFTimer *submissionTimer;
  HMFTimer *v35;
  HMDMediaGroupSetupMetricDispatcher *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t (**v39)(void);
  void (**v40)(void);
  uint64_t v41;
  HMFTimer *v42;
  void *v43;
  void *context;
  void *v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  id v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  unint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v46 = a3;
  v11 = a5;
  if (a4)
  {
    v12 = os_unfair_lock_lock_with_options();
    if (self->_activeGroupIdentifier)
    {
      v13 = (void *)MEMORY[0x227676638](v12);
      v14 = self;
      HMFGetOSLogHandle();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        activeGroupIdentifier = self->_activeGroupIdentifier;
        v19 = v14->_metricType - 1;
        if (v19 > 3)
          v20 = CFSTR("Unknown Metric Type");
        else
          v20 = off_24E782060[v19];
        *(_DWORD *)buf = 138543874;
        v48 = v16;
        v49 = 2112;
        v50 = activeGroupIdentifier;
        v51 = 2112;
        v52 = v20;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Already has active setup tracking for metric identifier: %@ group type: %@", buf, 0x20u);

      }
    }
    else
    {
      metricType = self->_metricType;
      v13 = (void *)MEMORY[0x227676638](v12);
      v26 = self;
      if (!metricType)
      {
        HMFGetOSLogHandle();
        v31 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = objc_claimAutoreleasedReturnValue();
          if (a4 > 4)
            v33 = CFSTR("Unknown Metric Type");
          else
            v33 = off_24E782060[a4 - 1];
          *(_DWORD *)buf = 138544386;
          v48 = v32;
          v49 = 2112;
          v50 = v46;
          v51 = 2112;
          v52 = v33;
          v53 = 2112;
          v54 = v11;
          v55 = 2048;
          v56 = a6;
          v45 = (void *)v32;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Request received for group identifier %@ metric type: %@ session identifier: %@ setup start time: %llu", buf, 0x34u);

        }
        objc_autoreleasePoolPop(v13);
        submissionTimer = v26->_submissionTimer;
        if (submissionTimer)
        {
          -[HMFTimer suspend](submissionTimer, "suspend");
          v35 = v26->_submissionTimer;
          v26->_submissionTimer = 0;

          context = (void *)MEMORY[0x227676638]();
          v36 = v26;
          HMFGetOSLogHandle();
          v37 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v38 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v48 = v38;
            v43 = (void *)v38;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Resetting the submission timer", buf, 0xCu);

          }
          objc_autoreleasePoolPop(context);
        }
        objc_storeStrong((id *)&self->_activeGroupIdentifier, a3);
        self->_metricType = a4;
        -[HMDMediaGroupSetupMetricDispatcher currentUpTicksFactory](v26, "currentUpTicksFactory");
        v39 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
        v26->_requestReceivedTimeMS = v39[2]();

        if (v11)
        {
          objc_storeStrong((id *)&v26->_setupSessionIdentifier, a5);
          v26->_setupSessionStartTimeMS = a6;
        }
        -[HMDMediaGroupSetupMetricDispatcher submissionTimerFactory](v26, "submissionTimerFactory", v43);
        v40 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v40[2]();
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = v26->_submissionTimer;
        v26->_submissionTimer = (HMFTimer *)v41;

        -[HMFTimer setDelegate:](v26->_submissionTimer, "setDelegate:", v26);
        -[HMFTimer resume](v26->_submissionTimer, "resume");
        goto LABEL_21;
      }
      HMFGetOSLogHandle();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        v29 = self->_metricType - 1;
        if (v29 > 3)
          v30 = CFSTR("Unknown Metric Type");
        else
          v30 = off_24E782060[v29];
        *(_DWORD *)buf = 138543618;
        v48 = v27;
        v49 = 2112;
        v50 = (id)v30;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Dispatcher already tracking metric type: %@", buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v13);
LABEL_21:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_22;
  }
  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v48 = (uint64_t)v24;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Dispatcher cannot track unknown metric type for request", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v21);
LABEL_22:

}

- (void)markRequestCommittedForGroupIdentifier:(id)a3 metricType:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSUUID *activeGroupIdentifier;
  unint64_t metricType;
  void *v12;
  HMDMediaGroupSetupMetricDispatcher *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSUUID *v17;
  const __CFString *v18;
  void *v19;
  HMDMediaGroupSetupMetricDispatcher *v20;
  NSObject *v21;
  void *v22;
  HMDMediaGroupSetupMetricDispatcher *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  const __CFString *v28;
  HMDMediaGroupSetupMetricDispatcher *v29;
  void *v30;
  NSUUID *v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  const __CFString *v35;
  uint64_t (**v36)(void);
  unint64_t requestReceivedTimeMS;
  unint64_t requestCommittedTimeMS;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  const __CFString *v43;
  int v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (a4)
  {
    os_unfair_lock_lock_with_options();
    activeGroupIdentifier = self->_activeGroupIdentifier;
    if (activeGroupIdentifier)
    {
      if ((-[NSUUID hmf_isEqualToUUID:](activeGroupIdentifier, "hmf_isEqualToUUID:", v8) & 1) != 0)
      {
        metricType = self->_metricType;
        v12 = (void *)MEMORY[0x227676638]();
        v13 = self;
        if (metricType == a4)
        {
          HMFGetOSLogHandle();
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            v17 = self->_activeGroupIdentifier;
            if (a4 > 4)
              v18 = CFSTR("Unknown Metric Type");
            else
              v18 = off_24E782060[a4 - 1];
            v44 = 138543874;
            v45 = v15;
            v46 = 2112;
            v47 = v17;
            v48 = 2112;
            v49 = (void *)v18;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Request committed for group identifier %@ metric type: %@", (uint8_t *)&v44, 0x20u);

          }
          objc_autoreleasePoolPop(v12);
          -[HMDMediaGroupSetupMetricDispatcher currentUpTicksFactory](v13, "currentUpTicksFactory");
          v36 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
          v13->_requestCommittedTimeMS = v36[2]();

          requestReceivedTimeMS = v13->_requestReceivedTimeMS;
          if (requestReceivedTimeMS)
          {
            requestCommittedTimeMS = v13->_requestCommittedTimeMS;
            v39 = requestCommittedTimeMS >= requestReceivedTimeMS;
            v40 = requestCommittedTimeMS - requestReceivedTimeMS;
            if (v39)
              v41 = v40;
            else
              v41 = 0;
          }
          else
          {
            v41 = 0;
          }
          if (v13->_setupSessionIdentifier)
            v42 = v13->_requestCommittedTimeMS - v13->_setupSessionStartTimeMS;
          else
            v42 = 0;
          -[HMDMediaGroupSetupMetricDispatcher _submitLogEventWithTotalDuration:totalDurationSinceSetupSessionStart:error:](v13, "_submitLogEventWithTotalDuration:totalDurationSinceSetupSessionStart:error:", v41, v42, v9);
          -[HMDMediaGroupSetupMetricDispatcher _resetActiveTracking](v13, "_resetActiveTracking");
          goto LABEL_38;
        }
        HMFGetOSLogHandle();
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v32;
          v34 = self->_metricType - 1;
          if (v34 > 3)
            v35 = CFSTR("Unknown Metric Type");
          else
            v35 = off_24E782060[v34];
          if (a4 > 4)
            v43 = CFSTR("Unknown Metric Type");
          else
            v43 = off_24E782060[a4 - 1];
          v44 = 138543874;
          v45 = v32;
          v46 = 2112;
          v47 = (id)v35;
          v48 = 2112;
          v49 = (void *)v43;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Dispatcher is tracking metric type %@ but ask to mark metric type %@", (uint8_t *)&v44, 0x20u);

        }
      }
      else
      {
        v12 = (void *)MEMORY[0x227676638]();
        v29 = self;
        HMFGetOSLogHandle();
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = self->_activeGroupIdentifier;
          v44 = 138543874;
          v45 = (uint64_t)v30;
          v46 = 2112;
          v47 = v8;
          v48 = 2112;
          v49 = v31;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Tracking different group identifier: %@ active group identifier: %@", (uint8_t *)&v44, 0x20u);

        }
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v27 = v23->_metricType - 1;
        if (v27 > 3)
          v28 = CFSTR("Unknown Metric Type");
        else
          v28 = off_24E782060[v27];
        v44 = 138543618;
        v45 = v25;
        v46 = 2112;
        v47 = (id)v28;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@No active setup tracking for metric type: %@", (uint8_t *)&v44, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v12);
LABEL_38:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_39;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 138543362;
    v45 = (uint64_t)v22;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Dispatcher cannot track unknown metric type for committed request", (uint8_t *)&v44, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
LABEL_39:

}

- (void)_submitLogEventWithTotalDuration:(unint64_t)a3 totalDurationSinceSetupSessionStart:(unint64_t)a4 error:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  HMDMediaGroupSetupMetricDispatcher *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  -[HMDMediaGroupSetupMetricDispatcher dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v14;
      v24 = 2048;
      v25 = a3;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Submitting log event: %llu error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = objc_msgSend(v9, "isCurrentDeviceIOSDevice");
    v16 = objc_msgSend(v9, "isPrimaryResidentDevice");
    v17 = -[HMDMediaGroupSetupMetricDispatcher metricType](v11, "metricType");
    -[HMDMediaGroupSetupMetricDispatcher activeGroupIdentifier](v11, "activeGroupIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupSetupMetricDispatcher setupSessionIdentifier](v11, "setupSessionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupSetupMetricDispatcher setupLatencyLogEvent:groupIdentifier:isController:isPrimaryResident:totalDuration:setupSessionIdentifier:totalDurationSinceSetupSessionStart:errorStage:](v11, "setupLatencyLogEvent:groupIdentifier:isController:isPrimaryResident:totalDuration:setupSessionIdentifier:totalDurationSinceSetupSessionStart:errorStage:", v17, v18, v15, v16, a3, v19, a4, CFSTR("Committed Group"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDMediaGroupSetupMetricDispatcher _submitLogEvent:error:](v11, "_submitLogEvent:error:", v20, v8);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v21;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get data source for metric event submission", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDMediaGroupSetupMetricDispatcher _resetActiveTracking](v11, "_resetActiveTracking");
  }

}

- (void)_submitLogEvent:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaGroupSetupMetricDispatcher *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coreAnalyticsEventDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Submitting log event: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMediaGroupSetupMetricDispatcher logEventSubmitter](v9, "logEventSubmitter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitLogEvent:error:", v6, v7);

}

- (id)setupLatencyLogEvent:(unint64_t)a3 groupIdentifier:(id)a4 isController:(BOOL)a5 isPrimaryResident:(BOOL)a6 totalDuration:(unint64_t)a7 setupSessionIdentifier:(id)a8 totalDurationSinceSetupSessionStart:(unint64_t)a9 errorStage:(id)a10
{
  _BOOL4 v12;
  _BOOL4 v13;
  id v16;
  id v17;
  id v18;
  HMDMediaGroupSetupLatencyLogEvent *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  HMDMediaGroupSetupLatencyLogEvent *v25;

  v12 = a6;
  v13 = a5;
  v16 = a10;
  v17 = a8;
  v18 = a4;
  v19 = [HMDMediaGroupSetupLatencyLogEvent alloc];
  if (a3 - 1 > 3)
    v20 = CFSTR("Unknown Metric Type");
  else
    v20 = off_24E782060[a3 - 1];
  v21 = CFSTR("Unknown Role");
  if (v12)
    v21 = CFSTR("Primary Resident");
  if (v13)
    v22 = CFSTR("Controller");
  else
    v22 = v21;
  objc_msgSend(v18, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[HMDMediaGroupSetupLatencyLogEvent initWithRequestType:systemUUID:deviceRole:totalDurationMS:setupSessionIdentifier:totalDurationSinceAccessorySetupStartMS:errorStage:](v19, "initWithRequestType:systemUUID:deviceRole:totalDurationMS:setupSessionIdentifier:totalDurationSinceAccessorySetupStartMS:errorStage:", v20, v23, v22, a7, v24, a9, v16);
  return v25;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  uint64_t (**v8)(void);
  unint64_t v9;
  unint64_t requestReceivedTimeMS;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  HMDMediaGroupSetupMetricDispatcher *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDMediaGroupSetupMetricDispatcher *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDMediaGroupSetupMetricDispatcher activeGroupIdentifier](self, "activeGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 13, CFSTR("Timeout in getting commited group"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupSetupMetricDispatcher currentUpTicksFactory](self, "currentUpTicksFactory");
    v8 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v9 = v8[2]();

    requestReceivedTimeMS = self->_requestReceivedTimeMS;
    if (v9 <= requestReceivedTimeMS || requestReceivedTimeMS == 0)
      v12 = 0;
    else
      v12 = v9 - requestReceivedTimeMS;
    if (self->_setupSessionIdentifier)
      v13 = v9 - self->_setupSessionStartTimeMS;
    else
      v13 = 0;
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v21;
      v24 = 2048;
      v25 = v12;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Timer fired, submitting log event with duration: %llu error: %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    -[HMDMediaGroupSetupMetricDispatcher _submitLogEventWithTotalDuration:totalDurationSinceSetupSessionStart:error:](v19, "_submitLogEventWithTotalDuration:totalDurationSinceSetupSessionStart:error:", v12, v13, v7);
    -[HMDMediaGroupSetupMetricDispatcher _resetActiveTracking](v19, "_resetActiveTracking");

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Timer fired but no active metric type being tracked.", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDMediaGroupSetupMetricDispatcher _resetActiveTracking](v15, "_resetActiveTracking");
  }
  os_unfair_lock_unlock(p_lock);

}

- (unint64_t)requestReceivedTimeMS
{
  return self->_requestReceivedTimeMS;
}

- (unint64_t)requestCommittedTimeMS
{
  return self->_requestCommittedTimeMS;
}

- (NSUUID)setupSessionIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)setupSessionStartTimeMS
{
  return self->_setupSessionStartTimeMS;
}

- (HMDMediaGroupSetupMetricDispatcherDataSource)dataSource
{
  return (HMDMediaGroupSetupMetricDispatcherDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (unint64_t)metricType
{
  return self->_metricType;
}

- (id)currentUpTicksFactory
{
  return objc_getProperty(self, a2, 64, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_loadWeakRetained((id *)&self->_logEventSubmitter);
}

- (id)submissionTimerFactory
{
  return objc_getProperty(self, a2, 80, 1);
}

- (NSUUID)activeGroupIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setActiveGroupIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (HMFTimer)submissionTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSubmissionTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionTimer, 0);
  objc_storeStrong((id *)&self->_activeGroupIdentifier, 0);
  objc_storeStrong(&self->_submissionTimerFactory, 0);
  objc_destroyWeak((id *)&self->_logEventSubmitter);
  objc_storeStrong(&self->_currentUpTicksFactory, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
}

id __75__HMDMediaGroupSetupMetricDispatcher_initWithDataSource_logEventSubmitter___block_invoke_2()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 8, 900.0);
}

__uint64_t __75__HMDMediaGroupSetupMetricDispatcher_initWithDataSource_logEventSubmitter___block_invoke()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0xF4240;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_89427 != -1)
    dispatch_once(&logCategory__hmf_once_t19_89427, &__block_literal_global_25_89428);
  return (id)logCategory__hmf_once_v20_89429;
}

void __49__HMDMediaGroupSetupMetricDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_89429;
  logCategory__hmf_once_v20_89429 = v0;

}

@end
