@implementation HMDHomeMetricsDispatcher

- (HMDHomeMetricsDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4
{
  id v7;
  id v8;
  HMDHomeMetricsDispatcher *v9;
  HMDHomeMetricsDispatcher *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomeMetricsDispatcher;
  v9 = -[HMDHomeMetricsDispatcher init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_logEventSubmitter, a4);
  }

  return v10;
}

- (void)submitMigrationEventMetricsForModels:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__HMDHomeMetricsDispatcher_submitMigrationEventMetricsForModels_reason___block_invoke;
  v8[3] = &unk_24E775550;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "na_each:", v8);

}

- (void)submitMigrationEventMetricsForModel:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeMetricsDispatcher *v9;
  NSObject *v10;
  void *v11;
  HMDHomeMigrationEvent *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Submitting migration event metric for model: %@ reason: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = -[HMDHomeMigrationEvent initWithModel:reason:]([HMDHomeMigrationEvent alloc], "initWithModel:reason:", v6, v7);
  -[HMDHomeMetricsDispatcher logEventSubmitter](v9, "logEventSubmitter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitLogEvent:", v12);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHomeMetricsDispatcher identifier](self, "identifier");
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

uint64_t __72__HMDHomeMetricsDispatcher_submitMigrationEventMetricsForModels_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "submitMigrationEventMetricsForModel:reason:", a2, *(_QWORD *)(a1 + 40));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_10517 != -1)
    dispatch_once(&logCategory__hmf_once_t1_10517, &__block_literal_global_10518);
  return (id)logCategory__hmf_once_v2_10519;
}

void __39__HMDHomeMetricsDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_10519;
  logCategory__hmf_once_v2_10519 = v0;

}

@end
