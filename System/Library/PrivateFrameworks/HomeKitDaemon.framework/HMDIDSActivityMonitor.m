@implementation HMDIDSActivityMonitor

- (HMDIDSActivityMonitor)initWithActivity:(id)a3 serviceIdentifier:(id)a4
{
  id v6;
  id v7;
  HMDIDSActivityMonitor *v8;
  uint64_t v9;
  IDSActivityMonitor *activityMonitor;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDIDSActivityMonitor;
  v8 = -[HMDIDSActivityMonitor init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FBE8]), "initWithActivity:serviceIdentifier:", v6, v7);
    activityMonitor = v8->_activityMonitor;
    v8->_activityMonitor = (IDSActivityMonitor *)v9;

  }
  return v8;
}

- (void)listenWithDelegate:(id)a3
{
  id v4;
  void *v5;
  HMDIDSActivityMonitor *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Enabling IDSActivityMonitor", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDIDSActivityMonitor activityMonitor](v6, "activityMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", v4);

  -[HMDIDSActivityMonitor activityMonitor](v6, "activityMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setListeningForUpdates:", 1);

}

- (NSString)description
{
  void *v2;
  void *v3;

  -[HMDIDSActivityMonitor activityMonitor](self, "activityMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDIDSActivityMonitor activityMonitor](self, "activityMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (IDSActivityMonitor)activityMonitor
{
  return (IDSActivityMonitor *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityMonitor, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_184545 != -1)
    dispatch_once(&logCategory__hmf_once_t1_184545, &__block_literal_global_184546);
  return (id)logCategory__hmf_once_v2_184547;
}

void __36__HMDIDSActivityMonitor_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_184547;
  logCategory__hmf_once_v2_184547 = v0;

}

@end
