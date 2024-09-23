@implementation HMDCoreAnalyticsLogEventFactory

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_98597 != -1)
    dispatch_once(&logCategory__hmf_once_t1_98597, &__block_literal_global_98598);
  return (id)logCategory__hmf_once_v2_98599;
}

void __46__HMDCoreAnalyticsLogEventFactory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_98599;
  logCategory__hmf_once_v2_98599 = v0;

}

- (id)logEventForTaggedEvent:(id)a3
{
  id v4;
  void *v5;
  HMDCoreAnalyticsLogEventFactory *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to get log event for unknown tagged event: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

  return 0;
}

- (id)supportedTags
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
