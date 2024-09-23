@implementation HMDCloudManagerMetricsDispatcher

- (HMDCloudManagerMetricsDispatcher)initWithLogEventDispatcher:(id)a3
{
  id v5;
  HMDCloudManagerMetricsDispatcher *v6;
  HMDCloudManagerMetricsDispatcher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCloudManagerMetricsDispatcher;
  v6 = -[HMDCloudManagerMetricsDispatcher init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_logEventSubmitter, a3);

  return v7;
}

- (void)submitFailureEventWithModelType:(id)a3 failureCode:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDCloudManagerMetricsDispatcher *v11;
  NSObject *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  HMDCloudManagerModelFailureEvent *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 1)
    {
      v14 = CFSTR("NoAddTransaction");
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("failureCode(%@)"), v16);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    *(_DWORD *)buf = 138544130;
    v20 = v13;
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Submitting failure event with model type: %@ failure code: %@ error: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  v17 = -[HMDCloudManagerModelFailureEvent initWithModel:failureCode:error:]([HMDCloudManagerModelFailureEvent alloc], "initWithModel:failureCode:error:", v8, a4, v9);
  -[HMDCloudManagerMetricsDispatcher logEventSubmitter](v11, "logEventSubmitter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "submitLogEvent:", v17);

}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_178070 != -1)
    dispatch_once(&logCategory__hmf_once_t1_178070, &__block_literal_global_178071);
  return (id)logCategory__hmf_once_v2_178072;
}

void __47__HMDCloudManagerMetricsDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_178072;
  logCategory__hmf_once_v2_178072 = v0;

}

@end
