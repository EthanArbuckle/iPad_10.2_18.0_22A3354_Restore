@implementation HMMMLogOrigin

- (HMMMLogOrigin)initWithLogIdentifier:(id)a3
{
  id v5;
  HMMMLogOrigin *v6;
  HMMMLogOrigin *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMMLogOrigin;
  v6 = -[HMMMLogOrigin init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_logId, a3);

  return v7;
}

- (NSString)logId
{
  return self->_logId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logId, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_20185 != -1)
    dispatch_once(&logCategory__hmf_once_t0_20185, &__block_literal_global_20186);
  return (id)logCategory__hmf_once_v1_20187;
}

+ (id)originWithLogIdentifier:(id)a3
{
  id v3;
  HMMMLogOrigin *v4;

  v3 = a3;
  v4 = -[HMMMLogOrigin initWithLogIdentifier:]([HMMMLogOrigin alloc], "initWithLogIdentifier:", v3);

  return v4;
}

void __28__HMMMLogOrigin_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_20187;
  logCategory__hmf_once_v1_20187 = v0;

}

@end
