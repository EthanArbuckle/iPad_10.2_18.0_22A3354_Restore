@implementation HMMTROTAApplyUpdateRequestTimer

- (HMMTROTAApplyUpdateRequestTimer)initWithServer:(id)a3 otaProvider:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMMTROTAApplyUpdateRequestTimer *v11;
  HMMTROTAApplyUpdateRequestTimer *v12;
  uint64_t v13;
  HMFTimer *updateTimer;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMMTROTAApplyUpdateRequestTimer;
  v11 = -[HMMTROTAApplyUpdateRequestTimer init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_server, v8);
    objc_storeWeak((id *)&v12->_otaProvider, v9);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 300.0);
    updateTimer = v12->_updateTimer;
    v12->_updateTimer = (HMFTimer *)v13;

    -[HMFTimer setDelegateQueue:](v12->_updateTimer, "setDelegateQueue:", v10);
    -[HMFTimer setDelegate:](v12->_updateTimer, "setDelegate:", v12);
  }

  return v12;
}

- (void)start
{
  void *v3;
  HMMTROTAApplyUpdateRequestTimer *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTROTAApplyUpdateRequestTimer server](v4, "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting OTA apply update request timeout for accessory server [%@]", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTROTAApplyUpdateRequestTimer updateTimer](v4, "updateTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

}

- (void)stop
{
  void *v3;
  HMMTROTAApplyUpdateRequestTimer *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTROTAApplyUpdateRequestTimer server](v4, "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Stop OTA apply update request timeout for accessory server [%@]", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTROTAApplyUpdateRequestTimer updateTimer](v4, "updateTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspend");

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMMTROTAApplyUpdateRequestTimer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTROTAApplyUpdateRequestTimer server](v6, "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@OTA apply update request timed out for accessory server [%@]", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMTROTAApplyUpdateRequestTimer otaProvider](v6, "otaProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTROTAApplyUpdateRequestTimer server](v6, "server");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applyUpdateRequestTimerExpiredForAccessoryServer:", v11);

}

- (id)logIdentifier
{
  void *v2;
  HMMTRAccessoryServer **p_server;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDD17C8];
  p_server = &self->_server;
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  objc_msgSend(WeakRetained, "nodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)p_server);
  objc_msgSend(v6, "fabricID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMFTimer)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_updateTimer, a3);
}

- (HMMTROTAProviderDelegate)otaProvider
{
  return (HMMTROTAProviderDelegate *)objc_loadWeakRetained((id *)&self->_otaProvider);
}

- (void)setOtaProvider:(id)a3
{
  objc_storeWeak((id *)&self->_otaProvider, a3);
}

- (HMMTRAccessoryServer)server
{
  return (HMMTRAccessoryServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_destroyWeak((id *)&self->_otaProvider);
  objc_storeStrong((id *)&self->_updateTimer, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_1036 != -1)
    dispatch_once(&logCategory__hmf_once_t3_1036, &__block_literal_global_1037);
  return (id)logCategory__hmf_once_v4_1038;
}

void __46__HMMTROTAApplyUpdateRequestTimer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_1038;
  logCategory__hmf_once_v4_1038 = v0;

}

@end
