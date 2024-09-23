@implementation HMDBackingStoreHandler

- (HMDBackingStoreHandler)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  id v7;
  id v8;
  HMDBackingStoreHandler *v9;
  HMDBackingStoreHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDBackingStoreHandler;
  v9 = -[HMDBackingStoreHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_backingStore, a4);
  }

  return v10;
}

- (void)runTransactionWithModel:(id)a3 reason:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBackingStoreHandler runTransactionWithModels:reason:completion:](self, "runTransactionWithModels:reason:completion:", v12, v10, v9, v13, v14);
}

- (void)runTransactionWithModels:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreHandler runTransactionWithModels:options:reason:completion:](self, "runTransactionWithModels:options:reason:completion:", v10, v11, v9, v8);

}

- (void)runTransactionWithModel:(id)a3 options:(id)a4 reason:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v10 = (void *)MEMORY[0x24BDBCE30];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBackingStoreHandler runTransactionWithModels:options:reason:completion:](self, "runTransactionWithModels:options:reason:completion:", v15, v13, v12, v11, v16, v17);
}

- (void)runTransactionWithModels:(id)a3 options:(id)a4 reason:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDBackingStoreHandler *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  HMDBackingStoreHandler *v26;
  NSObject *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v17;
    v39 = 2112;
    v40 = v10;
    v41 = 2112;
    v42 = v11;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Running transaction with models: %@ options: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  if (v13)
  {
    -[HMDBackingStoreHandler backingStore](v15, "backingStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v12;
    objc_msgSend(v18, "transaction:options:", v12, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v20 = v10;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v33;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v19, "add:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v24++));
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v22);
    }

    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __77__HMDBackingStoreHandler_runTransactionWithModels_options_reason_completion___block_invoke;
    v30[3] = &unk_24E79B3A0;
    v30[4] = v15;
    v31 = v13;
    objc_msgSend(v19, "run:", v30);

    v12 = v29;
  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = v15;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Failed to run transaction due to no completion", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
  }

}

- (id)backingStoreObjectsForVersion:(int64_t)a3
{
  void *v4;
  HMDBackingStoreHandler *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x227676638](self, a2, a3);
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive backinstore objects for shared user", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDBackingStoreHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to process udated changes for object: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "respondWithError:", v15);

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDBackingStoreHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
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
    v16 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to process removed object: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "respondWithError:", v12);

}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBackingStoreHandler identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("identifier"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDBackingStoreHandler identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDBackingStore)backingStore
{
  return (HMDBackingStore *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __77__HMDBackingStoreHandler_runTransactionWithModels_options_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v7;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Transaction completed with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v9 = (void *)MEMORY[0x227676638](v8);
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Transaction completed", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_83000 != -1)
    dispatch_once(&logCategory__hmf_once_t7_83000, &__block_literal_global_83001);
  return (id)logCategory__hmf_once_v8_83002;
}

void __37__HMDBackingStoreHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_83002;
  logCategory__hmf_once_v8_83002 = v0;

}

@end
