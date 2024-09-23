@implementation HMDCloudShareTrustManagerMetricsEventDispatcher

- (HMDCloudShareTrustManagerMetricsEventDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5 dataSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDCloudShareTrustManagerMetricsEventDispatcher *v15;
  HMDCloudShareTrustManagerMetricsEventDispatcher *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDCloudShareTrustManagerMetricsEventDispatcher;
  v15 = -[HMDCloudShareTrustManagerMetricsEventDispatcher init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_logEventSubmitter, a4);
    objc_storeStrong((id *)&v16->_dailyScheduler, a5);
    objc_storeWeak((id *)&v16->_dataSource, v14);
  }

  return v16;
}

- (void)registerForDailyTrustManagerEvents
{
  id v3;

  -[HMDCloudShareTrustManagerMetricsEventDispatcher dailyScheduler](self, "dailyScheduler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDailyTaskRunner:", self);

}

- (void)submitTrustZoneCreatedEvent
{
  -[HMDCloudShareTrustManagerMetricsEventDispatcher submitTrustActivityEvent:](self, "submitTrustActivityEvent:", 0);
}

- (void)submitTrustZoneRemovedEvent
{
  -[HMDCloudShareTrustManagerMetricsEventDispatcher submitTrustActivityEvent:](self, "submitTrustActivityEvent:", 1);
}

- (void)submitTrustActivityEvent:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMDCloudShareTrustManagerMetricsEventDispatcher *v12;
  NSObject *v13;
  void *v14;
  HMDCloudShareTrustManagerTrustActivityLogEvent *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareTrustManagerMetricsEventDispatcher dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "homeForCloudShareTrustManagerMetricsEventDispatcher:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentUser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "privilege");
    else
      v10 = 2;
    v15 = -[HMDCloudShareTrustManagerTrustActivityLogEvent initWithTrustActivityType:privilege:isPrimaryResident:]([HMDCloudShareTrustManagerTrustActivityLogEvent alloc], "initWithTrustActivityType:privilege:isPrimaryResident:", a3, v10, objc_msgSend(v7, "isCurrentDeviceConfirmedPrimaryResident"));
    -[HMDCloudShareTrustManagerMetricsEventDispatcher logEventSubmitter](self, "logEventSubmitter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "submitLogEvent:", v15);

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to submit daily trust status event due to no data source", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)submitFailureEventWithEventErrorCode:(int64_t)a3
{
  -[HMDCloudShareTrustManagerMetricsEventDispatcher submitFailureEventWithEventErrorCode:error:](self, "submitFailureEventWithEventErrorCode:error:", a3, 0);
}

- (void)submitFailureEventWithEventErrorCode:(int64_t)a3 error:(id)a4
{
  id v6;
  HMDCloudShareTrustManagerFailureLogEvent *v7;
  void *v8;
  id v9;

  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  v7 = -[HMDCloudShareTrustManagerFailureLogEvent initWithTrustManagerErrorCode:error:]([HMDCloudShareTrustManagerFailureLogEvent alloc], "initWithTrustManagerErrorCode:error:", a3, v6);
  -[HMDCloudShareTrustManagerMetricsEventDispatcher logEventSubmitter](self, "logEventSubmitter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitLogEvent:", v7);

}

- (void)submitCloudShareTrustStatusDailyEvent
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  HMDUserCloudShareOwnerAdoptionDailyEvent *v9;
  HMDUserCloudShareParticipantAdoptionDailyEvent *v10;
  void *v11;
  HMDCloudShareTrustManagerMetricsEventDispatcher *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  HMDUserCloudShareParticipantAdoptionDailyEvent *v18;
  void *v19;
  _OWORD v20[4];
  uint8_t buf[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareTrustManagerMetricsEventDispatcher dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "homeForCloudShareTrustManagerMetricsEventDispatcher:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isFromOwnerForCloudShareTrustManagerMetricsEventDispatcher:", self);
    v7 = objc_msgSend(v4, "trustConfigureStateForCloudShareTrustManagerMetricsEventDispatcher:", self);
    if (v6)
    {
      v8 = objc_msgSend(v5, "isCurrentDeviceConfirmedPrimaryResident");
      v23 = 0u;
      v24 = 0u;
      *(_OWORD *)buf = 0u;
      v22 = 0u;
      objc_msgSend(v4, "trustStatusCountsForCloudShareTrustManagerMetricsEventDispatcher:", self);
      v9 = [HMDUserCloudShareOwnerAdoptionDailyEvent alloc];
      v20[0] = *(_OWORD *)buf;
      v20[1] = v22;
      v20[2] = v23;
      v20[3] = v24;
      v10 = -[HMDUserCloudShareOwnerAdoptionDailyEvent initWithConfigureState:isPrimaryResident:trustStatusCounts:](v9, "initWithConfigureState:isPrimaryResident:trustStatusCounts:", v7, v8, v20);
    }
    else
    {
      objc_msgSend(v5, "owner");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cloudShareID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 != 0;

      v10 = -[HMDUserCloudShareParticipantAdoptionDailyEvent initWithConfigureState:hasOwnerCloudShareID:]([HMDUserCloudShareParticipantAdoptionDailyEvent alloc], "initWithConfigureState:hasOwnerCloudShareID:", v7, v17);
    }
    v18 = v10;
    -[HMDCloudShareTrustManagerMetricsEventDispatcher logEventSubmitter](self, "logEventSubmitter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "submitLogEvent:", v18);

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to submit daily trust status event due to no data source", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCloudShareTrustManagerMetricsEventDispatcher identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 24, 1);
}

- (HMDLogEventDailyScheduler)dailyScheduler
{
  return (HMDLogEventDailyScheduler *)objc_getProperty(self, a2, 32, 1);
}

- (HMDCloudShareTrustManagerMetricsEventDispatcherDataSource)dataSource
{
  return (HMDCloudShareTrustManagerMetricsEventDispatcherDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_dailyScheduler, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2 != -1)
    dispatch_once(&logCategory__hmf_once_t2, &__block_literal_global_8036);
  return (id)logCategory__hmf_once_v3;
}

void __62__HMDCloudShareTrustManagerMetricsEventDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3;
  logCategory__hmf_once_v3 = v0;

}

@end
