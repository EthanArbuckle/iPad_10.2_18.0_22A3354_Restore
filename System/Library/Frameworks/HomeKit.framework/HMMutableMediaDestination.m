@implementation HMMutableMediaDestination

- (id)copyWithZone:(_NSZone *)a3
{
  HMMediaDestination *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  HMMediaDestination *v9;

  v4 = +[HMMediaDestination allocWithZone:](HMMediaDestination, "allocWithZone:", a3);
  -[HMMediaDestination uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaDestination parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMediaDestination supportedOptions](self, "supportedOptions");
  -[HMMediaDestination audioGroupIdentifier](self, "audioGroupIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMMediaDestination initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:](v4, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:", v5, v6, v7, v8);

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14 != -1)
    dispatch_once(&logCategory__hmf_once_t14, &__block_literal_global_228);
  return (id)logCategory__hmf_once_v15;
}

void __40__HMMutableMediaDestination_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v15;
  logCategory__hmf_once_v15 = v0;

}

@end
