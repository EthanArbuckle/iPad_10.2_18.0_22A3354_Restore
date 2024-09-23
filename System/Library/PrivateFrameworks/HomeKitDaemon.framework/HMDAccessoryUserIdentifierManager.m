@implementation HMDAccessoryUserIdentifierManager

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_84286 != -1)
    dispatch_once(&logCategory__hmf_once_t0_84286, &__block_literal_global_84287);
  return (id)logCategory__hmf_once_v1_84288;
}

void __48__HMDAccessoryUserIdentifierManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_84288;
  logCategory__hmf_once_v1_84288 = v0;

}

@end
