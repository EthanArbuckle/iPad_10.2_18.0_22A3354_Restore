@implementation HMDAssistantSettingsConnection

- (HMDAssistantSettingsConnection)initWithScheduler:(id)a3
{
  id v5;
  HMDAssistantSettingsConnection *v6;
  HMDAssistantSettingsConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAssistantSettingsConnection;
  v6 = -[HMDAssistantSettingsConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_scheduler, a3);

  return v7;
}

- (void)deleteSiriHistoryWithEndpointUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAssistantSettingsConnection *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HMDAssistantSettingsConnection *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDAssistantSettingsConnection *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v11;
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Deleting siri history for endpoint with uuid: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAssistantSettingsConnection dataSource](v9, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "connectionForEndpointUUID:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "deleteSiriHistoryOperationWithConnection:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_initWeak((id *)buf, v14);
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __86__HMDAssistantSettingsConnection_deleteSiriHistoryWithEndpointUUID_completionHandler___block_invoke;
      v26[3] = &unk_24E78C1B0;
      objc_copyWeak(&v28, (id *)buf);
      v26[4] = v9;
      v27 = v7;
      objc_msgSend(v14, "setCompletionBlock:", v26);
      -[HMDAssistantSettingsConnection scheduler](v9, "scheduler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v15, "performOperation:", v14);

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = v9;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v24;
        v31 = 2112;
        v32 = v6;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get a delete operation for endpoint uuid: %@ datasource: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v25);

      v14 = 0;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v9;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v20;
      v31 = 2112;
      v32 = v6;
      v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get a connection for endpoint uuid: %@ datasource: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v14);
  }

}

- (id)connectionForEndpointUUID:(id)a3
{
  id v4;
  void *v5;
  HMDAssistantSettingsConnection *v6;
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Device does not support siri endpoint history deletion", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

  return 0;
}

- (id)deleteSiriHistoryOperationWithConnection:(id)a3
{
  id v3;
  HMDAppleMediaAccessoryDeleteSiriHistoryOperation *v4;

  v3 = a3;
  v4 = -[HMDAppleMediaAccessoryDeleteSiriHistoryOperation initWithSettingsConnection:]([HMDAppleMediaAccessoryDeleteSiriHistoryOperation alloc], "initWithSettingsConnection:", v3);

  return v4;
}

- (HMDAssistantSettingsConnectionDataSource)dataSource
{
  return (HMDAssistantSettingsConnectionDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMFScheduler)scheduler
{
  return (HMFScheduler *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

void __86__HMDAssistantSettingsConnection_deleteSiriHistoryWithEndpointUUID_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x227676638]();
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
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history operation completed with error: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Delete siri history operation completed", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_39815 != -1)
    dispatch_once(&logCategory__hmf_once_t6_39815, &__block_literal_global_39816);
  return (id)logCategory__hmf_once_v7_39817;
}

void __45__HMDAssistantSettingsConnection_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_39817;
  logCategory__hmf_once_v7_39817 = v0;

}

@end
