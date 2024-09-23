@implementation HMDLastEventStoreController

- (HMDLastEventStoreController)initWithWithEventStore:(id)a3
{
  id v5;
  HMDLastEventStoreController *v6;
  HMDLastEventStoreController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLastEventStoreController;
  v6 = -[HMDLastEventStoreController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_eventStore, a3);

  return v7;
}

- (void)didRemoveHome:(id)a3
{
  id v4;
  void *v5;
  HMDLastEventStoreController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Removing home events, home: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDLastEventStoreController eventStore](v6, "eventStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("home.%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetWildcardTopics:", v12);

}

- (void)didRemoveMediaSystem:(id)a3
{
  id v4;
  void *v5;
  HMDLastEventStoreController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Removing media system events, media system: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDLastEventStoreController eventStore](v6, "eventStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("stereo.%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetWildcardTopics:", v12);

}

- (void)didRemoveAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDLastEventStoreController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Removing accessory events, accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDLastEventStoreController eventStore](v6, "eventStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("accessory.%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetWildcardTopics:", v12);

}

- (HMELastEventStore)eventStore
{
  return self->_eventStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_230684 != -1)
    dispatch_once(&logCategory__hmf_once_t3_230684, &__block_literal_global_230685);
  return (id)logCategory__hmf_once_v4_230686;
}

void __42__HMDLastEventStoreController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_230686;
  logCategory__hmf_once_v4_230686 = v0;

}

@end
