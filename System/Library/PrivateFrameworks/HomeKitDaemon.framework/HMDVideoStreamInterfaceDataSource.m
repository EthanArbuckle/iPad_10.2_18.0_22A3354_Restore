@implementation HMDVideoStreamInterfaceDataSource

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_136476 != -1)
    dispatch_once(&logCategory__hmf_once_t0_136476, &__block_literal_global_136477);
  return (id)logCategory__hmf_once_v1_136478;
}

void __48__HMDVideoStreamInterfaceDataSource_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_136478;
  logCategory__hmf_once_v1_136478 = v0;

}

@end
