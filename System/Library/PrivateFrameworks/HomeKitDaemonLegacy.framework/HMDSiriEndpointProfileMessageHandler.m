@implementation HMDSiriEndpointProfileMessageHandler

- (HMDSiriEndpointProfileMessageHandler)initWithHomeUUID:(id)a3
{
  id v5;
  HMDSiriEndpointProfileMessageHandler *v6;
  HMDSiriEndpointProfileMessageHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSiriEndpointProfileMessageHandler;
  v6 = -[HMDSiriEndpointProfileMessageHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_homeUUID, a3);

  return v7;
}

- (void)handleSiriEndpointApplyOnboardingSelectionsRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDSiriEndpointProfileMessageHandler *v6;
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
  void *v19;
  HMDSiriEndpointProfileMessageHandler *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDSiriEndpointProfileMessageHandler *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
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
    v30 = v8;
    v31 = 2112;
    v32 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling siri endpoint apply onboarding selections request message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA858]), "initWithPayload:", v9);
    if (v10)
    {
      -[HMDSiriEndpointProfileMessageHandler dataSourceSiriEndpointOnboardingManager](v6, "dataSourceSiriEndpointOnboardingManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_zeroUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSiriEndpointProfileMessageHandler dataSource](v6, "dataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSiriEndpointProfileMessageHandler homeUUID](v6, "homeUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "userUUIDForMessage:homeUUID:", v4, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "onboardingSelections");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "accessoryUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSiriEndpointProfileMessageHandler homeUUID](v6, "homeUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __98__HMDSiriEndpointProfileMessageHandler_handleSiriEndpointApplyOnboardingSelectionsRequestMessage___block_invoke;
        v27[3] = &unk_1E89A6E08;
        v27[4] = v6;
        v28 = v4;
        objc_msgSend(v11, "applyOnboardingSelections:accessoryUUID:homeUUID:userUUID:completion:", v16, v17, v18, v15, v27);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v15);
      }

    }
    else
    {
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = v6;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v26;
        v31 = 2112;
        v32 = v9;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode onboarding message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v11);
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v22;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to get onboarding message payload on message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v10);
  }

}

- (void)handleSiriEndpointDeleteSiriHistoryRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDSiriEndpointProfileMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HMDSiriEndpointProfileMessageHandler *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDSiriEndpointProfileMessageHandler *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDSiriEndpointProfileMessageHandler *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
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
    v40 = v8;
    v41 = 2112;
    v42 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handle siri endpoint delete siri history request message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA868]), "initWithPayload:", v9);
    if (v10)
    {
      -[HMDSiriEndpointProfileMessageHandler dataSourceHubAccessories](v6, "dataSourceHubAccessories");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v10, "accessoryUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSiriEndpointProfileMessageHandler deleteHistoryForAccessoryUUID:onHubAccessories:](v6, "deleteHistoryForAccessoryUUID:onHubAccessories:", v12, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = MEMORY[0x1E0C809B0];
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __90__HMDSiriEndpointProfileMessageHandler_handleSiriEndpointDeleteSiriHistoryRequestMessage___block_invoke;
        v35[3] = &unk_1E89BA850;
        v35[4] = v6;
        v15 = v12;
        v36 = v15;
        v37 = v11;
        v16 = v4;
        v38 = v16;
        v17 = (id)objc_msgSend(v13, "addFailureBlock:", v35);
        v32[0] = v14;
        v32[1] = 3221225472;
        v32[2] = __90__HMDSiriEndpointProfileMessageHandler_handleSiriEndpointDeleteSiriHistoryRequestMessage___block_invoke_6;
        v32[3] = &unk_1E89B2C88;
        v32[4] = v6;
        v33 = v15;
        v34 = v16;
        v18 = v15;
        v19 = (id)objc_msgSend(v13, "addSuccessBlock:", v32);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1D17BA0A0]();
        v29 = v6;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v31;
          v41 = 2112;
          v42 = v4;
          v43 = 2112;
          v44 = v13;
          _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to get hub accessories to handle delete siri history request message: %@ error: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v28);
        objc_msgSend(v4, "respondWithError:", v13);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = v6;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v27;
        v41 = 2112;
        v42 = v9;
        v43 = 2112;
        v44 = v11;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode message payload from delete siri history message payload: %@ error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(v4, "respondWithError:", v11);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v6;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v23;
      v41 = 2112;
      v42 = v4;
      v43 = 2112;
      v44 = v10;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get message payload from delete siri history message: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v4, "respondWithError:", v10);
  }

}

- (id)deleteHistoryForAccessoryUUID:(id)a3 onHubAccessories:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDSiriEndpointProfileMessageHandler *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v11;
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Deleting siri history for accessory UUID: %@ on hub accessories: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke;
  v25[3] = &unk_1E89A6E30;
  v25[4] = v9;
  v26 = v6;
  v14 = v12;
  v27 = v14;
  v15 = v6;
  objc_msgSend(v7, "na_map:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke_4;
  v23[3] = &unk_1E89BF608;
  v18 = v14;
  v24 = v18;
  v19 = (id)objc_msgSend(v17, "addCompletionBlock:", v23);
  v20 = v24;
  v21 = v18;

  return v21;
}

- (id)deleteHistoryForAccessoryUUID:(id)a3 onHubAccessory:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = (objc_class *)MEMORY[0x1E0D519C0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessory___block_invoke;
  v11[3] = &unk_1E89C2350;
  v9 = v8;
  v12 = v9;
  objc_msgSend(v6, "deleteSiriHistoryForAccessoryWithUUID:completionHandler:", v7, v11);

  return v9;
}

- (id)dataSourceSiriEndpointOnboardingManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDSiriEndpointProfileMessageHandler *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDSiriEndpointProfileMessageHandler dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "siriEndpointOnboardingManagerForSiriEndpointProfileMessageHandler:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source Siri Endpoint Onboarding Manager due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)dataSourceHubAccessories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDSiriEndpointProfileMessageHandler *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDSiriEndpointProfileMessageHandler dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDSiriEndpointProfileMessageHandler homeUUID](self, "homeUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hubAccessoriesWithHomeUUID:forSiriEndpointProfileMessageHandler:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source hub accessories due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfileMessageHandler homeUUID](self, "homeUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDSiriEndpointProfileMessageHandlerDataSource)dataSource
{
  return (HMDSiriEndpointProfileMessageHandlerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

uint64_t __85__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessory___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithNoResult");
}

id __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = (objc_class *)MEMORY[0x1E0D519C0];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(*(id *)(a1 + 32), "deleteHistoryForAccessoryUUID:onHubAccessory:", *(_QWORD *)(a1 + 40), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke_2;
  v16[3] = &unk_1E89C21E8;
  v17 = *(id *)(a1 + 48);
  v8 = (id)objc_msgSend(v6, "addSuccessBlock:", v16);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke_3;
  v14[3] = &unk_1E89BF608;
  v9 = v5;
  v15 = v9;
  v10 = (id)objc_msgSend(v6, "addCompletionBlock:", v14);
  v11 = v15;
  v12 = v9;

  return v12;
}

void __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke_4(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 18);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v2);

  }
}

uint64_t __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

uint64_t __87__HMDSiriEndpointProfileMessageHandler_deleteHistoryForAccessoryUUID_onHubAccessories___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

void __90__HMDSiriEndpointProfileMessageHandler_handleSiriEndpointDeleteSiriHistoryRequestMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138544130;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history failed for accessory uuid: %@ using hub accessories: %@ error: %@", (uint8_t *)&v10, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 56), "respondWithError:", v3);

}

void __90__HMDSiriEndpointProfileMessageHandler_handleSiriEndpointDeleteSiriHistoryRequestMessage___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Delete siri history succeeded for accessory uuid: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 48), "respondWithSuccess");

}

void __98__HMDSiriEndpointProfileMessageHandler_handleSiriEndpointApplyOnboardingSelectionsRequestMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Apply onboarding selections failed with error: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v5);
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMSiriEndpointOnboardingResultAsString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Apply result received from onboarding manager: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA860]), "initWithOnboardingResult:", a3);
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v13, "payloadCopy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "respondWithPayload:", v15);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14 != -1)
    dispatch_once(&logCategory__hmf_once_t14, &__block_literal_global_20892);
  return (id)logCategory__hmf_once_v15;
}

void __51__HMDSiriEndpointProfileMessageHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v15;
  logCategory__hmf_once_v15 = v0;

}

@end
