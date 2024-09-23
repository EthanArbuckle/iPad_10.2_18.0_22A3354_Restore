@implementation HMDAccessoryFirmwareUpdateDenyPolicy

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_140799 != -1)
    dispatch_once(&logCategory__hmf_once_t10_140799, &__block_literal_global_102_140800);
  return (id)logCategory__hmf_once_v11_140801;
}

void __51__HMDAccessoryFirmwareUpdateDenyPolicy_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_140801;
  logCategory__hmf_once_v11_140801 = v0;

}

- (void)configure
{
  void *v3;
  HMDAccessoryFirmwareUpdateDenyPolicy *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](-[HMDAccessoryFirmwareUpdatePolicy setStatus:](self, "setStatus:", 0));
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deny policy configured", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

@end
