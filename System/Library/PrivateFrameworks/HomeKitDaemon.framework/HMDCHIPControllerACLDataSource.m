@implementation HMDCHIPControllerACLDataSource

- (HMDCHIPControllerACLDataSource)initWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDCHIPControllerACLDataSource *v6;
  HMDCHIPControllerACLDataSource *v7;
  HMDCHIPControllerACLDataSource *v9;
  SEL v10;
  objc_super v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)HMDCHIPControllerACLDataSource;
    v6 = -[HMDCHIPControllerACLDataSource init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeWeak((id *)&v6->_home, v5);

    return v7;
  }
  else
  {
    v9 = (HMDCHIPControllerACLDataSource *)_HMFPreconditionFailure();
    return (HMDCHIPControllerACLDataSource *)-[HMDCHIPControllerACLDataSource keyValueStore](v9, v10);
  }
}

- (id)keyValueStore
{
  void *v3;
  HMDCHIPControllerACLDataSource *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "%{public}@Controller ACL Data Source not implemented yet", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  return 0;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  HMDCHIPControllerACLDataSource *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Controller ACL Data Source not implemented yet", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

  return 0;
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCHIPControllerACLDataSource *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Controller ACL Data Source not implemented yet", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v11);

  return 0;
}

- (BOOL)removeValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPControllerACLDataSource *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Controller ACL Data Source not implemented yet", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);

  return 0;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMDCHIPControllerACLDataSource home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "logIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fabric");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fabricID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_250550 != -1)
    dispatch_once(&logCategory__hmf_once_t4_250550, &__block_literal_global_250551);
  return (id)logCategory__hmf_once_v5_250552;
}

void __45__HMDCHIPControllerACLDataSource_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_250552;
  logCategory__hmf_once_v5_250552 = v0;

}

@end
