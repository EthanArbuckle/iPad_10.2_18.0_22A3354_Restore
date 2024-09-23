@implementation HMDMultiUserSettingsMetricsEventDispatcher

- (HMDMultiUserSettingsMetricsEventDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDMultiUserSettingsMetricsEventDispatcher *v12;
  HMDMultiUserSettingsMetricsEventDispatcher *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDMultiUserSettingsMetricsEventDispatcher;
  v12 = -[HMDMultiUserSettingsMetricsEventDispatcher init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_logEventSubmitter, a4);
    objc_storeStrong((id *)&v13->_dailyScheduler, a5);
  }

  return v13;
}

- (void)registerForDailyMultiUserSettingsEvents
{
  id v3;

  -[HMDMultiUserSettingsMetricsEventDispatcher dailyScheduler](self, "dailyScheduler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDailyTaskRunner:", self);

}

- (void)submitMultiUserSettingsDailyEvent
{
  void *v3;
  void *v4;
  HMDMultiUserSettingsMetricsEventDispatcher *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  HMDMultiUserSettingsLogEvent *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDMultiUserSettingsMetricsEventDispatcher *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[HMDMultiUserSettingsMetricsEventDispatcher dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Submitting multi user settings daily event", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "multiUserSettingsForMultiUserSettingsMetricsEventDispatcherDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numSharedUsers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "intValue"))
    {
      objc_msgSend(v9, "numSharedUsers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "intValue");

      if (v12 < 11)
      {
        v13 = -[HMDMultiUserSettingsLogEvent initWithMultiUserSettings:]([HMDMultiUserSettingsLogEvent alloc], "initWithMultiUserSettings:", v9);
        -[HMDMultiUserSettingsMetricsEventDispatcher logEventSubmitter](v5, "logEventSubmitter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "submitLogEvent:", v13);

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {

    }
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v5;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numSharedUsers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@numSharedUsers is %@. Don't submit logs", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    goto LABEL_14;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v15;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@No DataSource is set for submitMultiUserSettingsDailyEvent", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
LABEL_15:

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMultiUserSettingsMetricsEventDispatcher identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMultiUserSettingsMetricsEventDispatcherDataSource)dataSource
{
  return (HMDMultiUserSettingsMetricsEventDispatcherDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyScheduler, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_32910 != -1)
    dispatch_once(&logCategory__hmf_once_t3_32910, &__block_literal_global_32911);
  return (id)logCategory__hmf_once_v4_32912;
}

void __57__HMDMultiUserSettingsMetricsEventDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_32912;
  logCategory__hmf_once_v4_32912 = v0;

}

@end
