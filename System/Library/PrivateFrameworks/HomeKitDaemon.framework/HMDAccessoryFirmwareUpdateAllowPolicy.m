@implementation HMDAccessoryFirmwareUpdateAllowPolicy

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_140806 != -1)
    dispatch_once(&logCategory__hmf_once_t13_140806, &__block_literal_global_106_140807);
  return (id)logCategory__hmf_once_v14_140808;
}

void __52__HMDAccessoryFirmwareUpdateAllowPolicy_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14_140808;
  logCategory__hmf_once_v14_140808 = v0;

}

@end
