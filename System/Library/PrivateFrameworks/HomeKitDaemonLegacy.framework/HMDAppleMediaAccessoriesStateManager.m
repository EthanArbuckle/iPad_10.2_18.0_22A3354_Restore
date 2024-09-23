@implementation HMDAppleMediaAccessoriesStateManager

- (HMDAppleMediaAccessoriesStateManager)initWithIdentifier:(id)a3 messenger:(id)a4 metricsDispatcher:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDAppleMediaAccessoriesStateManager *v13;
  HMDAppleMediaAccessoriesStateManager *v14;
  HMDAppleMediaAccessoriesStateManager *result;
  HMDAppleMediaAccessoriesStateManager *v16;
  SEL v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v16 = (HMDAppleMediaAccessoriesStateManager *)_HMFPreconditionFailure();
    -[HMDAppleMediaAccessoriesStateManager run](v16, v17);
    return result;
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDAppleMediaAccessoriesStateManager;
  v13 = -[HMDAppleMediaAccessoriesStateManager init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_messenger, a4);
    objc_storeStrong((id *)&v14->_metricsDispatcher, a5);
  }

  return v14;
}

- (void)run
{
  void *v3;
  HMDAppleMediaAccessoriesStateManager *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Configuring apple media accessories state manager", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAppleMediaAccessoriesStateManager runMultipleIdentifierCorrectionSequence](v4, "runMultipleIdentifierCorrectionSequence");
}

- (void)runMultipleIdentifierCorrectionSequence
{
  void *v3;
  HMDAppleMediaAccessoriesStateManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Running multiple identifier correction sequence", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAppleMediaAccessoriesStateManager remoteAppleMediaAccessoriesByIdentifier](v4, "remoteAppleMediaAccessoriesByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v7, "allKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v14, "count") >= 2)
        {
          -[HMDAppleMediaAccessoriesStateManager metricsDispatcher](v4, "metricsDispatcher");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "submitMatchingIdentifierEventWithMatchingCount:", objc_msgSend(v14, "count"));

          -[HMDAppleMediaAccessoriesStateManager correctStateForMatchingIdentifier:appleMediaAccessories:](v4, "correctStateForMatchingIdentifier:appleMediaAccessories:", v13, v14);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)correctStateForMatchingIdentifier:(id)a3 appleMediaAccessories:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessoriesStateManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Correcting state for matching identifier: %@ apple media accessories: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = (void *)objc_msgSend(v7, "mutableCopy");
  -[HMDAppleMediaAccessoriesStateManager _correctStateForMatchingIdentifier:appleMediaAccessories:sendList:](v9, "_correctStateForMatchingIdentifier:appleMediaAccessories:sendList:", v6, v7, v12);

}

- (void)_correctStateForMatchingIdentifier:(id)a3 appleMediaAccessories:(id)a4 sendList:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMDAppleMediaAccessoriesStateManager *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", 0);
    -[HMDAppleMediaAccessoriesStateManager sendModelIdentifierRequestMessageForAppleMediaAccessory:accessoryIdentifier:](self, "sendModelIdentifierRequestMessageForAppleMediaAccessory:accessoryIdentifier:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __106__HMDAppleMediaAccessoriesStateManager__correctStateForMatchingIdentifier_appleMediaAccessories_sendList___block_invoke;
    v25[3] = &unk_1E89AF890;
    v25[4] = self;
    v14 = v9;
    v26 = v14;
    v15 = (id)objc_msgSend(v12, "addSuccessBlock:", v25);
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __106__HMDAppleMediaAccessoriesStateManager__correctStateForMatchingIdentifier_appleMediaAccessories_sendList___block_invoke_2;
    v21[3] = &unk_1E89BA850;
    v21[4] = self;
    v22 = v8;
    v23 = v14;
    v24 = v10;
    v16 = (id)objc_msgSend(v12, "addFailureBlock:", v21);

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
      *(_DWORD *)buf = 138543618;
      v28 = v20;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to correct matching identifier state for identifier %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (id)sendModelIdentifierRequestMessageForAppleMediaAccessory:(id)a3 accessoryIdentifier:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D519C0];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  -[HMDAppleMediaAccessoriesStateManager messenger](self, "messenger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __116__HMDAppleMediaAccessoriesStateManager_sendModelIdentifierRequestMessageForAppleMediaAccessory_accessoryIdentifier___block_invoke;
  v16[3] = &unk_1E89A21C8;
  v16[4] = self;
  v17 = v6;
  v11 = v9;
  v18 = v11;
  v12 = v6;
  objc_msgSend(v10, "sendModelIdentifierRequestMessageToAppleMediaAccessory:withAccessoryIdentifier:completion:", v12, v8, v16);

  v13 = v18;
  v14 = v11;

  return v14;
}

- (void)correctStateForMatchingAppleMediaAccessories:(id)a3 modelIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessoriesStateManager *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _BYTE *v19;
  _BYTE buf[24];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v21 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Correcting state for matching apple media accessories: %@ model identifier: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v21 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __101__HMDAppleMediaAccessoriesStateManager_correctStateForMatchingAppleMediaAccessories_modelIdentifier___block_invoke;
  v17 = &unk_1E89A21F0;
  v12 = v7;
  v18 = v12;
  v19 = buf;
  objc_msgSend(v6, "na_each:", &v14);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24))
  {
    -[HMDAppleMediaAccessoriesStateManager metricsDispatcher](v9, "metricsDispatcher", v14, v15, v16, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitMatchingIdentifierRemovalEventWithRemovalCount:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));

  }
  _Block_object_dispose(buf, 8);

}

- (id)remoteAppleMediaAccessoriesByIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMDAppleMediaAccessoriesStateManager *v17;
  NSObject *v18;
  void *v19;
  __int128 v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[HMDAppleMediaAccessoriesStateManager remoteAppleMediaAccessories](self, "remoteAppleMediaAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v25;
    *(_QWORD *)&v5 = 138543618;
    v21 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "identifier", v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v3, "objectForKey:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          v13 = (void *)MEMORY[0x1E0C9AA60];
          if (v11)
            v13 = (void *)v11;
          v14 = v13;

          objc_msgSend(v14, "arrayByAddingObject:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "setObject:forKey:", v15, v10);
        }
        else
        {
          v16 = (void *)MEMORY[0x1D17BA0A0]();
          v17 = self;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v29 = v19;
            v30 = 2112;
            v31 = v9;
            _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get identifier for apple media accessory: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v16);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)remoteAppleMediaAccessories
{
  void *v2;
  void *v3;

  -[HMDAppleMediaAccessoriesStateManager dataSourceAppleMediaAccessories](self, "dataSourceAppleMediaAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_1097);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dataSourceAppleMediaAccessories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDAppleMediaAccessoriesStateManager *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDAppleMediaAccessoriesStateManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "appleMediaAccessoriesForStateManager:", self);
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
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source apple media accessories due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAppleMediaAccessoriesStateManager identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDAppleMediaAccessoriesStateManagerDataSource)dataSource
{
  return (HMDAppleMediaAccessoriesStateManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMDAppleMediaAccessoriesStateMessenger)messenger
{
  return (HMDAppleMediaAccessoriesStateMessenger *)objc_getProperty(self, a2, 24, 1);
}

- (HMDAppleMediaAccessoriesStateManagerMetricsDispatcher)metricsDispatcher
{
  return (HMDAppleMediaAccessoriesStateManagerMetricsDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

uint64_t __67__HMDAppleMediaAccessoriesStateManager_remoteAppleMediaAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentAccessory") ^ 1;
}

void __101__HMDAppleMediaAccessoriesStateManager_correctStateForMatchingAppleMediaAccessories_modelIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  if ((v4 & 1) == 0)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(v5, "sendRemovalRequest");
  }

}

void __116__HMDAppleMediaAccessoriesStateManager_sendModelIdentifierRequestMessageForAppleMediaAccessory_accessoryIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v6);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch model identifier from apple media accessory: %@ error: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v5);
  }

}

uint64_t __106__HMDAppleMediaAccessoriesStateManager__correctStateForMatchingIdentifier_appleMediaAccessories_sendList___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "correctStateForMatchingAppleMediaAccessories:modelIdentifier:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __106__HMDAppleMediaAccessoriesStateManager__correctStateForMatchingIdentifier_appleMediaAccessories_sendList___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_correctStateForMatchingIdentifier:appleMediaAccessories:sendList:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8 != -1)
    dispatch_once(&logCategory__hmf_once_t8, &__block_literal_global_13);
  return (id)logCategory__hmf_once_v9;
}

void __51__HMDAppleMediaAccessoriesStateManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9;
  logCategory__hmf_once_v9 = v0;

}

- (void)appleMediaAccessoriesStateMessenger:(id)a3 didReceiveModelIdentifierRequestMessage:(id)a4 withAccessoryIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HMDAppleMediaAccessoriesStateManager *v21;
  NSObject *v22;
  void *v23;
  HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDAppleMediaAccessoriesStateManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAppleMediaAccessoriesStateManager dataSourceAppleMediaAccessories](self, "dataSourceAppleMediaAccessories");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = (HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)(id)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v12)
  {
    v13 = v12;
    v31 = v9;
    v32 = v8;
    v14 = 0;
    v15 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v17, "identifier", v31);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "isEqualToString:", v10))
        {
          v19 = objc_msgSend(v17, "isCurrentAccessory");

          if (v19)
          {
            if (v14)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 12);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = v31;
              objc_msgSend(v31, "respondWithError:", v26);

              v24 = v11;
              v8 = v32;
              goto LABEL_22;
            }
            objc_msgSend(v17, "uuid");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {

        }
      }
      v13 = -[HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      if (v13)
        continue;
      break;
    }

    v9 = v31;
    v8 = v32;
    if (v14)
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v23;
        v39 = 2112;
        v40 = v14;
        v41 = 2112;
        v42 = v10;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Responding with found model identifier: %@ for accessory identifier: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      v24 = -[HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload initWithModelIdentifier:]([HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload alloc], "initWithModelIdentifier:", v14);
      -[HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload payloadCopy](v24, "payloadCopy");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "respondWithPayload:", v25);

      goto LABEL_22;
    }
  }
  else
  {

  }
  v27 = (void *)MEMORY[0x1D17BA0A0]();
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v30;
    v39 = 2112;
    v40 = v10;
    _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine the model identifier for a current accessory with identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v27);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
  v24 = (HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "respondWithError:", v24);
  v14 = 0;
LABEL_22:

}

@end
