@implementation HMDPendingRegionUpdate

void __38___HMDPendingRegionUpdate_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v112;
  logCategory__hmf_once_v112 = v0;

}

@end
