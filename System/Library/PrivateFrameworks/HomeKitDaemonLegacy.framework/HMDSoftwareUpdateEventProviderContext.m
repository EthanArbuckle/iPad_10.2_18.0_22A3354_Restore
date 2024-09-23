@implementation HMDSoftwareUpdateEventProviderContext

- (HMDSoftwareUpdateEventProviderContext)initWithAccessory:(id)a3 workQueue:(id)a4 eventStoreReadHandle:(id)a5 eventForwarder:(id)a6 suControllerManagerFactory:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDSoftwareUpdateEventProviderContext *v17;
  HMDSoftwareUpdateEventProviderContext *v18;
  void *v19;
  id suControllerManagerFactory;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HMDSoftwareUpdateEventProviderContext;
  v17 = -[HMDSoftwareUpdateEventProviderContext init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_accessory, v12);
    objc_storeStrong((id *)&v18->_workQueue, a4);
    objc_storeStrong((id *)&v18->_eventStoreReadHandle, a5);
    objc_storeStrong((id *)&v18->_eventForwarder, a6);
    v19 = _Block_copy(v16);
    suControllerManagerFactory = v18->_suControllerManagerFactory;
    v18->_suControllerManagerFactory = v19;

  }
  return v18;
}

- (void)configureWithDelegate:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, id);

  v4 = a3;
  -[HMDSoftwareUpdateEventProviderContext suControllerManagerFactory](self, "suControllerManagerFactory");
  v6 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v6[2](v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDSoftwareUpdateEventProviderContext setSuControllerManager:](self, "setSuControllerManager:", v5);
}

- (void)managerStatus:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDSoftwareUpdateEventProviderContext suControllerManager](self, "suControllerManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managerStatus:", v4);

}

- (void)scanWithOptions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDSoftwareUpdateEventProviderContext suControllerManager](self, "suControllerManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scanForUpdates:", v4);

}

- (void)forwardEvent:(id)a3 withTopicSuffixID:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDSoftwareUpdateEventProviderContext *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDSoftwareUpdateEventProviderContext *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDSoftwareUpdateEventProviderContext accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v10)
  {
    objc_msgSend(MEMORY[0x1E0CBA240], "topicFromSuffixID:homeUUID:accessoryUUID:", a4, v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[HMDSoftwareUpdateEventProviderContext eventForwarder](self, "eventForwarder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __72__HMDSoftwareUpdateEventProviderContext_forwardEvent_withTopicSuffixID___block_invoke;
      v21[3] = &unk_1E89C2350;
      v21[4] = self;
      objc_msgSend(v12, "forwardEvent:topic:completion:", v6, v11, v21);

    }
    else
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v23 = v20;
        v24 = 2048;
        v25 = a4;
        v26 = 2112;
        v27 = v10;
        v28 = 2112;
        v29 = v8;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get topic with suffix: %ld, homeUUID: %@, accessoryUUID: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v16;
      v24 = 2112;
      v25 = (unint64_t)v10;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil value in homeUUID: %@, accessoryUUID: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (id)lastEventForTopicSuffixID:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDSoftwareUpdateEventProviderContext *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HMDSoftwareUpdateEventProviderContext accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v6 && v8)
  {
    objc_msgSend(MEMORY[0x1E0CBA240], "topicFromSuffixID:homeUUID:accessoryUUID:", a3, v8, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[HMDSoftwareUpdateEventProviderContext eventStoreReadHandle](self, "eventStoreReadHandle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastEventForTopic:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138544130;
        v18 = v15;
        v19 = 2048;
        v20 = a3;
        v21 = 2112;
        v22 = v8;
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get topic with suffix: %ld, homeUUID: %@, accessoryUUID: %@", (uint8_t *)&v17, 0x2Au);

      }
      objc_autoreleasePoolPop(v12);
      v9 = 0;
    }

  }
  return v9;
}

- (NSString)eventSource
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDSoftwareUpdateEventProviderContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (double)eventTimeStamp
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 24, 1);
}

- (HMEEventForwarder)eventForwarder
{
  return (HMEEventForwarder *)objc_getProperty(self, a2, 32, 1);
}

- (HMDSUControllerManager)suControllerManager
{
  return (HMDSUControllerManager *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSuControllerManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)suControllerManagerFactory
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setSuControllerManagerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_suControllerManagerFactory, 0);
  objc_storeStrong((id *)&self->_suControllerManager, 0);
  objc_storeStrong((id *)&self->_eventForwarder, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __72__HMDSoftwareUpdateEventProviderContext_forwardEvent_withTopicSuffixID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error in forwarding the event: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_65349 != -1)
    dispatch_once(&logCategory__hmf_once_t4_65349, &__block_literal_global_65350);
  return (id)logCategory__hmf_once_v5_65351;
}

void __52__HMDSoftwareUpdateEventProviderContext_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_65351;
  logCategory__hmf_once_v5_65351 = v0;

}

@end
