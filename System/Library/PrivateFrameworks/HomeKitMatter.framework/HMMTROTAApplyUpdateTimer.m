@implementation HMMTROTAApplyUpdateTimer

- (HMMTROTAApplyUpdateTimer)initWithServer:(id)a3 otaProvider:(id)a4 newVersion:(id)a5 delay:(id)a6 queue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMMTROTAApplyUpdateTimer *v17;
  HMMTROTAApplyUpdateTimer *v18;
  uint64_t v19;
  HMFTimer *updateTimer;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HMMTROTAApplyUpdateTimer;
  v17 = -[HMMTROTAApplyUpdateTimer init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_server, v12);
    objc_storeStrong((id *)&v18->_expectedVersion, a5);
    v18->_retryCount = 0;
    objc_storeWeak((id *)&v18->_otaProvider, v13);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, (double)(objc_msgSend(v15, "integerValue") + 300));
    updateTimer = v18->_updateTimer;
    v18->_updateTimer = (HMFTimer *)v19;

    -[HMFTimer setDelegateQueue:](v18->_updateTimer, "setDelegateQueue:", v16);
    -[HMFTimer setDelegate:](v18->_updateTimer, "setDelegate:", v18);
  }

  return v18;
}

- (void)start
{
  void *v3;
  HMMTROTAApplyUpdateTimer *v4;
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
    -[HMMTROTAApplyUpdateTimer server](v4, "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting OTA apply timeout for accessory server [%@]", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTROTAApplyUpdateTimer updateTimer](v4, "updateTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

}

- (void)stop
{
  void *v3;
  HMMTROTAApplyUpdateTimer *v4;
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
    -[HMMTROTAApplyUpdateTimer server](v4, "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Stop OTA apply timeout for accessory server [%@]", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTROTAApplyUpdateTimer updateTimer](v4, "updateTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspend");

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMMTROTAApplyUpdateTimer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[5];
  uint8_t buf[4];
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
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTROTAApplyUpdateTimer server](v6, "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@OTA apply timed out for accessory server [%@]", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  WeakRetained = objc_loadWeakRetained((id *)&v6->_server);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __41__HMMTROTAApplyUpdateTimer_timerDidFire___block_invoke;
  v11[3] = &unk_250F23B48;
  v11[4] = v6;
  objc_msgSend(WeakRetained, "fetchSoftwareVersion:completionHandler:", 1, v11);

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

- (NSNumber)expectedVersion
{
  return self->_expectedVersion;
}

- (void)setExpectedVersion:(id)a3
{
  objc_storeStrong((id *)&self->_expectedVersion, a3);
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

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_destroyWeak((id *)&self->_otaProvider);
  objc_storeStrong((id *)&self->_expectedVersion, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
}

void __41__HMMTROTAApplyUpdateTimer_timerDidFire___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  _BYTE v37[24];
  id v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      objc_autoreleasePoolPop(v7);
      v14 = 0;
      goto LABEL_6;
    }
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v37 = 138543618;
    *(_QWORD *)&v37[4] = v10;
    *(_WORD *)&v37[12] = 2112;
    *(_QWORD *)&v37[14] = v6;
    v11 = "%{public}@Failed to retrieve software version number: %@";
    v12 = v9;
    v13 = 22;
LABEL_4:
    _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_ERROR, v11, v37, v13);

    goto LABEL_5;
  }
  if (!v5)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v37 = 138543362;
    *(_QWORD *)&v37[4] = v10;
    v11 = "%{public}@Failed to retrieve software version number, got nil object";
    v12 = v9;
    v13 = 12;
    goto LABEL_4;
  }
  v14 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v32 = v14;
  else
    v32 = 0;
  v33 = v32;

  if (!v33)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v37 = 138543618;
      *(_QWORD *)&v37[4] = v36;
      *(_WORD *)&v37[12] = 2112;
      *(_QWORD *)&v37[14] = v14;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve software version number, unexpected object: %@", v37, 0x16u);

    }
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "expectedVersion");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isEqualToNumber:", v14);

  if (v35)
  {
    objc_msgSend(*(id *)(a1 + 32), "otaProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "server");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = &unk_250F40170;
    goto LABEL_10;
  }
LABEL_6:
  v15 = (void *)MEMORY[0x242656984](objc_msgSend(*(id *)(a1 + 32), "setRetryCount:", objc_msgSend(*(id *)(a1 + 32), "retryCount", *(_OWORD *)v37, *(_QWORD *)&v37[16]) + 1));
  v16 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "expectedVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(*(id *)(a1 + 32), "retryCount");
    *(_DWORD *)v37 = 138544130;
    *(_QWORD *)&v37[4] = v18;
    *(_WORD *)&v37[12] = 2112;
    *(_QWORD *)&v37[14] = v19;
    *(_WORD *)&v37[22] = 2112;
    v38 = v14;
    v39 = 2048;
    v40 = v20;
    _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_ERROR, "%{public}@Expected Version %@, accessory reported %@ [Attempt %ld].", v37, 0x2Au);

  }
  objc_autoreleasePoolPop(v15);
  v21 = objc_msgSend(*(id *)(a1 + 32), "retryCount");
  v22 = *(void **)(a1 + 32);
  if (v21 >= 7)
  {
    objc_msgSend(v22, "otaProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "server");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = &unk_250F40188;
LABEL_10:
    objc_msgSend(v23, "applyUpdateTimerExpiredForAccessoryServer:softwareVersion:didTimeout:", v24, v14, v25);

    goto LABEL_14;
  }
  if (objc_msgSend(v22, "retryCount") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateTimer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "delegateQueue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 300.0);
    objc_msgSend(*(id *)(a1 + 32), "setUpdateTimer:", v28);

    objc_msgSend(*(id *)(a1 + 32), "updateTimer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDelegateQueue:", v27);

    v30 = *(void **)(a1 + 32);
    objc_msgSend(v30, "updateTimer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDelegate:", v30);

  }
  objc_msgSend(*(id *)(a1 + 32), "start");
LABEL_14:

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8 != -1)
    dispatch_once(&logCategory__hmf_once_t8, &__block_literal_global_9115);
  return (id)logCategory__hmf_once_v9;
}

void __39__HMMTROTAApplyUpdateTimer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9;
  logCategory__hmf_once_v9 = v0;

}

@end
