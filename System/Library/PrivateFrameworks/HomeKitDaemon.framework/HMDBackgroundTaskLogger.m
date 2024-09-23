@implementation HMDBackgroundTaskLogger

- (HMDBackgroundTaskLogger)initWithLogEventSubmitter:(id)a3
{
  id v5;
  HMDBackgroundTaskLogger *v6;
  HMDBackgroundTaskLogger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDBackgroundTaskLogger;
  v6 = -[HMDBackgroundTaskLogger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_submitter, a3);

  return v7;
}

- (HMDBackgroundTaskLogger)init
{
  void *v3;
  HMDBackgroundTaskLogger *v4;

  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDBackgroundTaskLogger initWithLogEventSubmitter:](self, "initWithLogEventSubmitter:", v3);

  return v4;
}

- (void)submitLogEventForTask:(id)a3
{
  id v4;
  void *v5;
  HMDBackgroundTaskLogEvent *v6;
  void *v7;
  HMDBackgroundTaskLogEvent *v8;
  void *v9;
  HMDBackgroundTaskLogger *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  HMDBackgroundTaskLogEvent *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = [HMDBackgroundTaskLogEvent alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDBackgroundTaskLogEvent initWithTask:didFire:now:](v6, "initWithTask:didFire:now:", v4, 1, v7);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v12;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Submitting log %@ with identifier %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDBackgroundTaskLogger submitter](v10, "submitter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submitLogEvent:", v8);

  objc_autoreleasePoolPop(v5);
}

- (void)submitNotFiredLogEventForTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HMDBackgroundTaskLogEvent *v9;
  void *v10;
  HMDBackgroundTaskLogEvent *v11;
  void *v12;
  HMDBackgroundTaskLogger *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  HMDBackgroundTaskLogEvent *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  objc_msgSend(v4, "expectedFireDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (v8 != 1)
  {
    v9 = [HMDBackgroundTaskLogEvent alloc];
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDBackgroundTaskLogEvent initWithTask:didFire:now:](v9, "initWithTask:didFire:now:", v4, 0, v10);

    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v15;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Submitting never fired log %@ with identifier %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDBackgroundTaskLogger submitter](v13, "submitter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "submitLogEvent:", v11);

  }
  objc_autoreleasePoolPop(v5);

}

- (HMMLogEventSubmitting)submitter
{
  return self->_submitter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submitter, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_233366 != -1)
    dispatch_once(&logCategory__hmf_once_t2_233366, &__block_literal_global_233367);
  return (id)logCategory__hmf_once_v3_233368;
}

void __38__HMDBackgroundTaskLogger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_233368;
  logCategory__hmf_once_v3_233368 = v0;

}

@end
