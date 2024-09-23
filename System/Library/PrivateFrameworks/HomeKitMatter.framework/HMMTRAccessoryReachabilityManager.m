@implementation HMMTRAccessoryReachabilityManager

- (HMMTRAccessoryReachabilityManager)initWithServer:(id)a3 timeout:(int64_t)a4 queue:(id)a5
{
  id v8;
  id v9;
  HMMTRAccessoryReachabilityManager *v10;
  HMMTRAccessoryReachabilityManager *v11;
  uint64_t v12;
  HMFTimer *reachabilityTimer;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRAccessoryReachabilityManager;
  v10 = -[HMMTRAccessoryReachabilityManager init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_server, v8);
    v11->_reachable = 0;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 8, (double)a4);
    reachabilityTimer = v11->_reachabilityTimer;
    v11->_reachabilityTimer = (HMFTimer *)v12;

    -[HMFTimer setDelegateQueue:](v11->_reachabilityTimer, "setDelegateQueue:", v9);
    -[HMFTimer setDelegate:](v11->_reachabilityTimer, "setDelegate:", v11);
  }

  return v11;
}

- (void)start
{
  id v2;

  -[HMMTRAccessoryReachabilityManager reachabilityTimer](self, "reachabilityTimer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (void)stop
{
  void *v3;
  void *v4;
  HMMTRAccessoryReachabilityManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAccessoryReachabilityManager reachabilityTimer](self, "reachabilityTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  v4 = (void *)MEMORY[0x242656984]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryReachabilityManager server](v5, "server");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Accessory Server: %@ stopped updating reachability", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)reachabilityUpdate
{
  void *v3;
  void *v4;
  HMMTRAccessoryReachabilityManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!-[HMMTRAccessoryReachabilityManager reachable](self, "reachable"))
  {
    -[HMMTRAccessoryReachabilityManager setReachable:](self, "setReachable:", 1);
    -[HMMTRAccessoryReachabilityManager server](self, "server");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didUpdateReachability:", -[HMMTRAccessoryReachabilityManager reachable](self, "reachable"));

    v4 = (void *)MEMORY[0x242656984]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryReachabilityManager server](v5, "server");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Accessory Server: %@ became reachable again", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  -[HMMTRAccessoryReachabilityManager reachabilityTimer](self, "reachabilityTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMMTRAccessoryReachabilityManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMMTRAccessoryReachabilityManager reachable](self, "reachable"))
  {
    v5 = (void *)MEMORY[0x242656984]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryReachabilityManager server](v6, "server");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeInterval");
      v12 = 138543874;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2048;
      v17 = v10;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory Server: %@ did not report in over %.2f seconds, marking unreachable", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMMTRAccessoryReachabilityManager setReachable:](v6, "setReachable:", 0);
    -[HMMTRAccessoryReachabilityManager server](v6, "server");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didUpdateReachability:", -[HMMTRAccessoryReachabilityManager reachable](v6, "reachable"));

  }
}

- (HMMTRAccessoryServer)server
{
  return (HMMTRAccessoryServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (HMFTimer)reachabilityTimer
{
  return self->_reachabilityTimer;
}

- (void)setReachabilityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityTimer, a3);
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityTimer, 0);
  objc_destroyWeak((id *)&self->_server);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3 != -1)
    dispatch_once(&logCategory__hmf_once_t3, &__block_literal_global_779);
  return (id)logCategory__hmf_once_v4;
}

void __48__HMMTRAccessoryReachabilityManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4;
  logCategory__hmf_once_v4 = v0;

}

@end
