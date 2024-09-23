@implementation HMMutableMediaDestinationControllerData

- (id)copyWithZone:(_NSZone *)a3
{
  HMMediaDestinationControllerData *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  HMMediaDestinationControllerData *v10;

  v4 = +[HMMediaDestinationControllerData allocWithZone:](HMMediaDestinationControllerData, "allocWithZone:", a3);
  -[HMMediaDestinationControllerData identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaDestinationControllerData parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaDestinationControllerData destinationIdentifier](self, "destinationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMMediaDestinationControllerData supportedOptions](self, "supportedOptions");
  -[HMMediaDestinationControllerData availableDestinationIdentifiers](self, "availableDestinationIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMMediaDestinationControllerData initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:](v4, "initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:", v5, v6, v7, v8, v9);

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13 != -1)
    dispatch_once(&logCategory__hmf_once_t13, &__block_literal_global_168_21435);
  return (id)logCategory__hmf_once_v14;
}

void __54__HMMutableMediaDestinationControllerData_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14;
  logCategory__hmf_once_v14 = v0;

}

@end
