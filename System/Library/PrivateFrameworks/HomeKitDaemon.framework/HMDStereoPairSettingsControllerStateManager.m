@implementation HMDStereoPairSettingsControllerStateManager

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_247018 != -1)
    dispatch_once(&logCategory__hmf_once_t0_247018, &__block_literal_global_247019);
  return (id)logCategory__hmf_once_v1_247020;
}

void __58__HMDStereoPairSettingsControllerStateManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_247020;
  logCategory__hmf_once_v1_247020 = v0;

}

@end
