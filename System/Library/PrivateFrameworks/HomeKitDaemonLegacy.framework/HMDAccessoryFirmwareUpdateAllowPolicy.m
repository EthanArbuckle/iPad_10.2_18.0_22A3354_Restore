@implementation HMDAccessoryFirmwareUpdateAllowPolicy

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_100488 != -1)
    dispatch_once(&logCategory__hmf_once_t13_100488, &__block_literal_global_106_100489);
  return (id)logCategory__hmf_once_v14_100490;
}

void __52__HMDAccessoryFirmwareUpdateAllowPolicy_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14_100490;
  logCategory__hmf_once_v14_100490 = v0;

}

@end
