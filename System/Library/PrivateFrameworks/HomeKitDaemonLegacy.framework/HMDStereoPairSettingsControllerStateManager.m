@implementation HMDStereoPairSettingsControllerStateManager

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_22193 != -1)
    dispatch_once(&logCategory__hmf_once_t0_22193, &__block_literal_global_22194);
  return (id)logCategory__hmf_once_v1_22195;
}

void __58__HMDStereoPairSettingsControllerStateManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_22195;
  logCategory__hmf_once_v1_22195 = v0;

}

@end
