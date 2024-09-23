@implementation HMDAppleMediaAccessoryMetricsDispatcher

- (HMDAppleMediaAccessoryMetricsDispatcher)initWithDataSource:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDAppleMediaAccessoryMetricsDispatcher *v11;
  HMDAppleMediaAccessoryMetricsDispatcher *v12;
  NSString *previousRoomName;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDAppleMediaAccessoryMetricsDispatcher;
  v11 = -[HMDAppleMediaAccessoryMetricsDispatcher init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeStrong((id *)&v12->_logEventSubmitter, a4);
    objc_storeStrong((id *)&v12->_dailyScheduler, a5);
    previousRoomName = v12->_previousRoomName;
    v12->_previousRoomName = (NSString *)CFSTR("UNSET");

    -[HMDLogEventDailyScheduler registerDailyTaskRunner:](v12->_dailyScheduler, "registerDailyTaskRunner:", v12);
  }

  return v12;
}

- (void)registerForDailySetRoomLogEvents
{
  void *v3;
  id v4;

  -[HMDAppleMediaAccessoryMetricsDispatcher dataSource](self, "dataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentRoomForAppleMediaAccessoryMetricsDispatcher:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoryMetricsDispatcher setPreviousRoomName:](self, "setPreviousRoomName:", v3);

}

- (void)submitDailySetRoomEvent
{
  void *v3;
  HMDAppleMediaAccessoryMetricsDispatcher *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  HMDAppleMediaAccessoryMetricsDispatcher *v12;
  NSObject *v13;
  void *v14;
  HMDAppleMediaAccessoryDailySetRoomEvent *v15;
  void *v16;
  void *v17;
  HMDAppleMediaAccessoryMetricsDispatcher *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDAppleMediaAccessoryMetricsDispatcher *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  NSString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543362;
    v27 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Submitting daily room event", (uint8_t *)&v26, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAppleMediaAccessoryMetricsDispatcher dataSource](v4, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "currentRoomForAppleMediaAccessoryMetricsDispatcher:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      os_unfair_lock_lock_with_options();
      v10 = v4->_previousRoomName;
      objc_storeStrong((id *)&v4->_previousRoomName, v9);
      os_unfair_lock_unlock(&v4->_lock);
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = v4;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v14;
        v28 = 2112;
        v29 = v9;
        v30 = 2112;
        v31 = v10;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Submitting daily room event with currentRoom: %@, previousRoom: %@", (uint8_t *)&v26, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      v15 = -[HMDAppleMediaAccessoryDailySetRoomEvent initWithCurrentRoom:previousRoom:]([HMDAppleMediaAccessoryDailySetRoomEvent alloc], "initWithCurrentRoom:previousRoom:", v9, v10);
      -[HMDAppleMediaAccessoryMetricsDispatcher logEventSubmitter](v12, "logEventSubmitter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "submitLogEvent:", v15);

    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v4;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessoryMetricsDispatcher previousRoomName](v22, "previousRoomName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v24;
        v28 = 2112;
        v29 = v25;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Data sourced nil current room name when submitting set room event metric with previous room name %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v4;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@No data source to submit set room event metric", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)submitRoomChangeEvent:(id)a3 previousRoom:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  HMDAppleMediaAccessoryMetricsDispatcher *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessoryMetricsDispatcher *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Recording change but not submitting room changed event", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  if (!v7)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v9;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@previousRoom is nil. Substituting with empty string.", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v7 = &stru_1E89C3E38;
  }
  -[HMDAppleMediaAccessoryMetricsDispatcher setPreviousRoomName:](v9, "setPreviousRoomName:", v7);

}

- (NSString)previousRoomName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_previousRoomName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPreviousRoomName:(id)a3
{
  NSString *v4;
  NSString *previousRoomName;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  previousRoomName = self->_previousRoomName;
  self->_previousRoomName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)submitDailyStatusEvent
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  HMDAppleMediaAccessoryMetricsDispatcher *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[9];
  _QWORD v17[4];
  NSObject *v18;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMDAppleMediaAccessoryMetricsDispatcher dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "numberOfCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher:", self);
    v6 = objc_msgSend(v4, "numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher:", self);
    v7 = objc_msgSend(v4, "numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher:", self);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v21 = 0x2020000000;
    v22 = 0;
    v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__HMDAppleMediaAccessoryMetricsDispatcher_submitDailyStatusEvent__block_invoke;
    v17[3] = &unk_1E89A5A88;
    p_buf = &buf;
    v10 = v8;
    v18 = v10;
    objc_msgSend(v4, "currentAccessorySensorStatusFlagsForAppleMediaAccessoryMetricsDispatcher:completion:", self, v17);
    objc_msgSend(v4, "workQueueForAppleMediaAccessoryMetricsDispatcher:", self);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __65__HMDAppleMediaAccessoryMetricsDispatcher_submitDailyStatusEvent__block_invoke_2;
    block[3] = &unk_1E89A5AB0;
    block[6] = v5;
    block[7] = v6;
    block[8] = v7;
    block[4] = self;
    block[5] = &buf;
    dispatch_group_notify(v10, v11, block);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to submit daily accessory metric due to nil data source", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)runDailyTask
{
  -[HMDAppleMediaAccessoryMetricsDispatcher submitDailySetRoomEvent](self, "submitDailySetRoomEvent");
  -[HMDAppleMediaAccessoryMetricsDispatcher submitDailyStatusEvent](self, "submitDailyStatusEvent");
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 24, 1);
}

- (HMDLogEventDailyScheduler)dailyScheduler
{
  return (HMDLogEventDailyScheduler *)objc_getProperty(self, a2, 32, 1);
}

- (HMDAppleMediaAccessoryMetricsDispatcherDataSource)dataSource
{
  return (HMDAppleMediaAccessoryMetricsDispatcherDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_dailyScheduler, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_previousRoomName, 0);
}

void __65__HMDAppleMediaAccessoryMetricsDispatcher_submitDailyStatusEvent__block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __65__HMDAppleMediaAccessoryMetricsDispatcher_submitDailyStatusEvent__block_invoke_2(uint64_t a1)
{
  HMDCurrentAppleMediaAccessoryConfigurationLogEvent *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCurrentAppleMediaAccessoryConfigurationLogEvent *v8;

  v2 = [HMDCurrentAppleMediaAccessoryConfigurationLogEvent alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDCurrentAppleMediaAccessoryConfigurationLogEvent initWithNumPairedSensors:sensorStatus:numPairedSensorAutomations:numMediaAutomations:](v2, "initWithNumPairedSensors:sensorStatus:numPairedSensorAutomations:numMediaAutomations:", v3, v4, v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "submitLogEvent:", v8);

}

@end
