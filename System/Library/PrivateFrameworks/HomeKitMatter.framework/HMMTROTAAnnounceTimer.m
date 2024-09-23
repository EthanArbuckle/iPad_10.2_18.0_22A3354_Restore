@implementation HMMTROTAAnnounceTimer

- (HMMTROTAAnnounceTimer)initWithServer:(id)a3 nodeId:(id)a4 endpoint:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMMTROTAAnnounceTimer *v14;
  HMMTROTAAnnounceTimer *v15;
  uint64_t v16;
  HMFTimer *announceTimer;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMMTROTAAnnounceTimer;
  v14 = -[HMMTROTAAnnounceTimer init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_server, v10);
    objc_storeStrong((id *)&v15->_nodeId, a4);
    objc_storeStrong((id *)&v15->_endpoint, a5);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, (double)(arc4random_uniform(0x258u) + 300));
    announceTimer = v15->_announceTimer;
    v15->_announceTimer = (HMFTimer *)v16;

    -[HMFTimer setDelegateQueue:](v15->_announceTimer, "setDelegateQueue:", v13);
    -[HMFTimer setDelegate:](v15->_announceTimer, "setDelegate:", v15);
  }

  return v15;
}

- (void)start
{
  void *v3;
  HMMTROTAAnnounceTimer *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFTimer timeInterval](v4->_announceTimer, "timeInterval");
    v8 = v7;
    -[HMMTROTAAnnounceTimer server](v4, "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v6;
    v13 = 2048;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting OTA Announce timeout with delay of %f for accessory server [%@]", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTROTAAnnounceTimer announceTimer](v4, "announceTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

}

- (void)stop
{
  void *v3;
  HMMTROTAAnnounceTimer *v4;
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
    -[HMMTROTAAnnounceTimer server](v4, "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Stop OTA Announce timeout for accessory server [%@]", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTROTAAnnounceTimer announceTimer](v4, "announceTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspend");

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMMTROTAAnnounceTimer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  NSNumber *nodeId;
  NSNumber *endpoint;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTROTAAnnounceTimer server](v6, "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@OTA Announce triggered for [%@]", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  WeakRetained = objc_loadWeakRetained((id *)&v6->_server);
  nodeId = v6->_nodeId;
  endpoint = v6->_endpoint;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __38__HMMTROTAAnnounceTimer_timerDidFire___block_invoke;
  v13[3] = &unk_250F223C0;
  v13[4] = v6;
  objc_msgSend(WeakRetained, "announceOtaProvider:providerEndpoint:immediateAnnouncement:completionHandler:", nodeId, endpoint, 1, v13);

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

- (HMFTimer)announceTimer
{
  return self->_announceTimer;
}

- (void)setAnnounceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_announceTimer, a3);
}

- (NSNumber)nodeId
{
  return self->_nodeId;
}

- (void)setNodeId:(id)a3
{
  objc_storeStrong((id *)&self->_nodeId, a3);
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (HMMTRAccessoryServer)server
{
  return (HMMTRAccessoryServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_nodeId, 0);
  objc_storeStrong((id *)&self->_announceTimer, 0);
}

void __38__HMMTROTAAnnounceTimer_timerDidFire___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "server");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      v10 = "%{public}@OTA Announce failed for server:%@ with Error: %@.";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v11, v12, v10, (uint8_t *)&v14, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v10 = "%{public}@OTA Announce completed for server:%@.";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5 != -1)
    dispatch_once(&logCategory__hmf_once_t5, &__block_literal_global_3126);
  return (id)logCategory__hmf_once_v6;
}

void __36__HMMTROTAAnnounceTimer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6;
  logCategory__hmf_once_v6 = v0;

}

@end
