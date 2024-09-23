@implementation HMDAppleMediaAccessoryLocalMessageHandler

- (HMDAppleMediaAccessoryLocalMessageHandler)initWithIdentifier:(id)a3 assistantSettingsConnection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDAppleMediaAccessoryLocalMessageHandler *v10;
  HMDAppleMediaAccessoryLocalMessageHandler *v11;
  HMDAppleMediaAccessoryLocalMessageHandler *result;
  HMDAppleMediaAccessoryLocalMessageHandler *v13;
  SEL v14;
  id v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMDAppleMediaAccessoryLocalMessageHandler *)_HMFPreconditionFailure();
    -[HMDAppleMediaAccessoryLocalMessageHandler handleSiriEndpointDeleteSiriHistoryMessage:](v13, v14, v15);
    return result;
  }
  v16.receiver = self;
  v16.super_class = (Class)HMDAppleMediaAccessoryLocalMessageHandler;
  v10 = -[HMDAppleMediaAccessoryLocalMessageHandler init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_storeStrong((id *)&v11->_assistantSettingsConnection, a4);
  }

  return v11;
}

- (void)handleSiriEndpointDeleteSiriHistoryMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessoryLocalMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAppleMediaAccessoryLocalMessageHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDAppleMediaAccessoryLocalMessageHandler *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDAppleMediaAccessoryLocalMessageHandler *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDAppleMediaAccessoryLocalMessageHandler *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v8;
    v39 = 2112;
    v40 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling siri endpoint delete siri history message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA868]), "initWithPayload:", v9);
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "accessoryUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessoryLocalMessageHandler dataSourceAccessoryWithUUID:](v6, "dataSourceAccessoryWithUUID:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "endpointIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[HMDAppleMediaAccessoryLocalMessageHandler assistantSettingsConnection](v6, "assistantSettingsConnection");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __88__HMDAppleMediaAccessoryLocalMessageHandler_handleSiriEndpointDeleteSiriHistoryMessage___block_invoke;
          v35[3] = &unk_1E89C2350;
          v36 = v4;
          objc_msgSend(v16, "deleteSiriHistoryWithEndpointUUID:completionHandler:", v15, v35);

          v17 = v36;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)MEMORY[0x1D17BA0A0]();
          v31 = v6;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v34 = v30;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v38 = v33;
            v39 = 2112;
            v40 = v14;
            v41 = 2112;
            v42 = v4;
            v43 = 2112;
            v44 = v17;
            _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to get endpoint identifier for accessory: %@ for delete siri history message: %@ error: %@", buf, 0x2Au);

            v30 = v34;
          }

          objc_autoreleasePoolPop(v30);
          objc_msgSend(v4, "respondWithError:", v17);
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = v6;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v38 = v29;
          v39 = 2112;
          v40 = v12;
          v41 = 2112;
          v42 = v4;
          v43 = 2112;
          v44 = v15;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to get accessory with uuid: %@ for delete siri history message: %@ error: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v26);
        objc_msgSend(v4, "respondWithError:", v15);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = v6;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v25;
        v39 = 2112;
        v40 = v9;
        v41 = 2112;
        v42 = v12;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode message payload from delete siri history message payload: %@ error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(v4, "respondWithError:", v12);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v6;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v21;
      v39 = 2112;
      v40 = v4;
      v41 = 2112;
      v42 = v11;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get message payload from delete siri history message: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(v4, "respondWithError:", v11);
  }

}

- (id)dataSourceAccessoryWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAppleMediaAccessoryLocalMessageHandler *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAppleMediaAccessoryLocalMessageHandler dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "accessoryWithUUID:forAppleMediaAccessoryLocalMessageHandler:", v4, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get accessory with uuid: %@ due to no data source", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAppleMediaAccessoryLocalMessageHandler identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDAppleMediaAccessoryLocalMessageHandlerDataSource)dataSource
{
  return (HMDAppleMediaAccessoryLocalMessageHandlerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMDAssistantSettingsConnection)assistantSettingsConnection
{
  return (HMDAssistantSettingsConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantSettingsConnection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

uint64_t __88__HMDAppleMediaAccessoryLocalMessageHandler_handleSiriEndpointDeleteSiriHistoryMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_41296 != -1)
    dispatch_once(&logCategory__hmf_once_t6_41296, &__block_literal_global_41297);
  return (id)logCategory__hmf_once_v7_41298;
}

void __56__HMDAppleMediaAccessoryLocalMessageHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_41298;
  logCategory__hmf_once_v7_41298 = v0;

}

@end
