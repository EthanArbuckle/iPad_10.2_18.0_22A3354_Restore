@implementation HMDMediaDestinationManagerMetricsDispatcher

- (HMDMediaDestinationManagerMetricsDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4
{
  id v7;
  id v8;
  HMDMediaDestinationManagerMetricsDispatcher *v9;
  HMDMediaDestinationManagerMetricsDispatcher *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMediaDestinationManagerMetricsDispatcher;
  v9 = -[HMDMediaDestinationManagerMetricsDispatcher init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_logEventSubmitter, a4);
  }

  return v10;
}

- (void)submitFailureEventWithFailureCode:(unint64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  HMDMediaDestinationManagerMetricsDispatcher *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationManagerFailureEvent *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMDMediaDestinationManagerFailureCodeAsString(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Submitting failure event with failure code: %@ error: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v12 = -[HMDMediaDestinationManagerFailureEvent initWithFailureCode:error:]([HMDMediaDestinationManagerFailureEvent alloc], "initWithFailureCode:error:", a3, v6);
  -[HMDMediaDestinationManagerMetricsDispatcher logEventSubmitter](v8, "logEventSubmitter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitLogEvent:", v12);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaDestinationManagerMetricsDispatcher identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_181774 != -1)
    dispatch_once(&logCategory__hmf_once_t1_181774, &__block_literal_global_181775);
  return (id)logCategory__hmf_once_v2_181776;
}

void __58__HMDMediaDestinationManagerMetricsDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_181776;
  logCategory__hmf_once_v2_181776 = v0;

}

@end
