@implementation HMDAppleMediaAccessoriesStateManagerMetricsDispatcher

- (HMDAppleMediaAccessoriesStateManagerMetricsDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessoriesStateManagerMetricsDispatcher *v9;
  uint64_t v10;
  NSUUID *identifier;
  HMDAppleMediaAccessoriesStateManagerMetricsDispatcher *result;
  HMDAppleMediaAccessoriesStateManagerMetricsDispatcher *v13;
  SEL v14;
  int64_t v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v13 = (HMDAppleMediaAccessoriesStateManagerMetricsDispatcher *)_HMFPreconditionFailure();
    -[HMDAppleMediaAccessoriesStateManagerMetricsDispatcher submitMatchingIdentifierEventWithMatchingCount:](v13, v14, v15);
    return result;
  }
  v16.receiver = self;
  v16.super_class = (Class)HMDAppleMediaAccessoriesStateManagerMetricsDispatcher;
  v9 = -[HMDAppleMediaAccessoriesStateManagerMetricsDispatcher init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_logEventSubmitter, a4);
  }

  return v9;
}

- (void)submitMatchingIdentifierEventWithMatchingCount:(int64_t)a3
{
  void *v5;
  HMDAppleMediaAccessoriesStateManagerMetricsDispatcher *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessoryMatchingIdentifierEvent *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Submitting matching identifiers event with matching count: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = -[HMDAppleMediaAccessoryMatchingIdentifierEvent initWithMatchingIdentifiersCount:]([HMDAppleMediaAccessoryMatchingIdentifierEvent alloc], "initWithMatchingIdentifiersCount:", a3);
  -[HMDAppleMediaAccessoriesStateManagerMetricsDispatcher logEventSubmitter](v6, "logEventSubmitter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitLogEvent:", v10);

}

- (void)submitMatchingIdentifierRemovalEventWithRemovalCount:(int64_t)a3
{
  void *v5;
  HMDAppleMediaAccessoriesStateManagerMetricsDispatcher *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Submitting matching identifier removal event with count: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = -[HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent initWithRemovalCount:]([HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent alloc], "initWithRemovalCount:", a3);
  -[HMDAppleMediaAccessoriesStateManagerMetricsDispatcher logEventSubmitter](v6, "logEventSubmitter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitLogEvent:", v10);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAppleMediaAccessoriesStateManagerMetricsDispatcher identifier](self, "identifier");
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
  if (logCategory__hmf_once_t2_142747 != -1)
    dispatch_once(&logCategory__hmf_once_t2_142747, &__block_literal_global_142748);
  return (id)logCategory__hmf_once_v3_142749;
}

void __68__HMDAppleMediaAccessoriesStateManagerMetricsDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_142749;
  logCategory__hmf_once_v3_142749 = v0;

}

@end
