@implementation HMAccessorySettingsDataSource

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMAccessorySettingsDataSource)initWithContext:(id)a3 localizationManager:(id)a4 messengerFactory:(id)a5 subscriptionProvider:(id)a6 lastEventStoreReadHandle:(id)a7 lastEventStoreWriteHandle:(id)a8 metricsDispatcher:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HMAccessorySettingsDataSource *v21;
  HMAccessorySettingsDataSource *v22;
  uint64_t v23;
  OS_dispatch_queue *workQueue;
  HMAccessControl *v26;
  SEL v27;
  id v28;
  id obj;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v32 = a6;
  v31 = a7;
  obj = a8;
  v30 = a8;
  v19 = a9;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v16)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v18)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v20 = v19;
  if (!v19)
  {
LABEL_11:
    v26 = (HMAccessControl *)_HMFPreconditionFailure();
    return (HMAccessorySettingsDataSource *)-[HMAccessControl initWithUser:](v26, v27, v28);
  }
  v33.receiver = self;
  v33.super_class = (Class)HMAccessorySettingsDataSource;
  v21 = -[HMAccessorySettingsDataSource init](&v33, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v21->_context, a3);
    objc_msgSend(v16, "queue");
    v23 = objc_claimAutoreleasedReturnValue();
    workQueue = v22->_workQueue;
    v22->_workQueue = (OS_dispatch_queue *)v23;

    objc_storeStrong((id *)&v22->_localizationManager, a4);
    objc_storeWeak((id *)&v22->_messengerFactory, v18);
    objc_storeStrong((id *)&v22->_eventSubscriptionProvider, a6);
    objc_storeStrong((id *)&v22->_lastEventStoreReadHandle, a7);
    objc_storeStrong((id *)&v22->_lastEventStoreWriteHandle, obj);
    objc_storeStrong((id *)&v22->_metricsDispatcher, a9);
  }

  return v22;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)fetchAccessorySettingsWithAccessoryIdentifier:(id)a3 keyPaths:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMAccessorySettingsDataSource context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegateCaller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __118__HMAccessorySettingsDataSource_Deprecated__fetchAccessorySettingsWithAccessoryIdentifier_keyPaths_completionHandler___block_invoke;
  v16[3] = &unk_1E3AB4D20;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "invokeBlock:", v16);

}

- (void)subscribeToAccessorySettingsWithAccessoryIdentifier:(id)a3 keyPaths:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  unint64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[HMAccessorySettingsDataSource context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "delegateCaller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __132__HMAccessorySettingsDataSource_Deprecated__subscribeToAccessorySettingsWithAccessoryIdentifier_keyPaths_options_completionHandler___block_invoke;
  v18[3] = &unk_1E3AB1A30;
  v18[4] = self;
  v19 = v10;
  v21 = v12;
  v22 = a5;
  v20 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  objc_msgSend(v14, "invokeBlock:", v18);

}

void __132__HMAccessorySettingsDataSource_Deprecated__subscribeToAccessorySettingsWithAccessoryIdentifier_keyPaths_options_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    HMAccessorySettingsDataSourceSubscribeOptionsAsString(*(_QWORD *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544130;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Deprecated API: Subscribing to accessory settings with accessory identifier: %@ key paths: %@ options: %@", (uint8_t *)&v10, 0x2Au);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __118__HMAccessorySettingsDataSource_Deprecated__fetchAccessorySettingsWithAccessoryIdentifier_keyPaths_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Deprecated API: Fetching accessory settings with accessory identifier: %@ key paths: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)fetchAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  HMAccessorySettingsDataSource *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  HMAccessorySettingsMessenger *messenger;
  void *v23;
  uint64_t v24;
  HMAccessorySettingsMessenger *v25;
  HMAccessorySettingsMessenger *v26;
  id v27;
  id v28;
  void *v29;
  HMAccessorySettingsDataSource *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMAccessorySettingsDataSource *v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v37 = a5;
  v38 = a6;
  v12 = (void *)MEMORY[0x1A1AC1AAC]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v44 = v15;
    v45 = 2112;
    v46 = v10;
    v47 = 2112;
    v48 = v11;
    v49 = 2112;
    v50 = v37;
    _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Fetching accessory settings with home identifier: %@ accessory identifier: %@ key paths: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  -[HMAccessorySettingsDataSource dataSourceHomeWithHomeIdentifier:](v13, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "accessoryWithUniqueIdentifier:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v17, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      if (v13)
      {
        os_unfair_lock_lock_with_options();
        messenger = v13->_messenger;
        if (!messenger)
        {
          -[HMAccessorySettingsDataSource messengerFactory](v13, "messengerFactory");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "createAccessorySettingsMessengerWithHomeUUID:", v21);
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = v13->_messenger;
          v13->_messenger = (HMAccessorySettingsMessenger *)v24;

          messenger = v13->_messenger;
        }
        v26 = messenger;
        os_unfair_lock_unlock(&v13->_lock);
      }
      else
      {
        v26 = 0;
      }

      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __121__HMAccessorySettingsDataSource_fetchAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke;
      v39[3] = &unk_1E3AB1CE8;
      v39[4] = v13;
      v40 = v21;
      v41 = v20;
      v42 = v38;
      v27 = v20;
      v28 = v21;
      -[HMAccessorySettingsMessenger sendFetchAccessorySettingsRequestWithAccessoryUUID:keyPaths:completionHandler:](v26, "sendFetchAccessorySettingsRequestWithAccessoryUUID:keyPaths:completionHandler:", v27, v37, v39);

    }
    else
    {
      v33 = (void *)MEMORY[0x1A1AC1AAC]();
      v34 = v13;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v36;
        v45 = 2112;
        v46 = v11;
        _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory settings due to unknown accessory identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v26 = (HMAccessorySettingsMessenger *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsDataSource context](v34, "context");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "delegateCaller");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "callCompletion:error:obj:", v38, v26, MEMORY[0x1E0C9AA60]);
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x1A1AC1AAC]();
    v30 = v13;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v32;
      v45 = 2112;
      v46 = v10;
      _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory settings due to unknown home identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsDataSource context](v30, "context");
    v26 = (HMAccessorySettingsMessenger *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsMessenger delegateCaller](v26, "delegateCaller");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "callCompletion:error:obj:", v38, v18, MEMORY[0x1E0C9AA60]);
  }

}

- (void)fetchCachedAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMAccessorySettingsDataSource *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  id Property;
  NSObject *v22;
  id v23;
  void *v24;
  HMAccessorySettingsDataSource *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMAccessorySettingsDataSource *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v49 = v17;
    v50 = 2112;
    v51 = v10;
    v52 = 2112;
    v53 = v11;
    v54 = 2112;
    v55 = v12;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Fetching only cached accessory settings with home identifier: %@ accessory identifier: %@ key paths: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);
  -[HMAccessorySettingsDataSource homeUUIDForIdentifier:](v15, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[HMAccessorySettingsDataSource accessoryUUIDForIdentifier:homeIdentifier:](v15, v11, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_initWeak((id *)buf, v15);
      if (v15)
        Property = objc_getProperty(v15, v20, 56, 1);
      else
        Property = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_2;
      block[3] = &unk_1E3AB1D38;
      v22 = Property;
      objc_copyWeak(&v43, (id *)buf);
      v37 = v18;
      v23 = v19;
      v38 = v23;
      v39 = v12;
      v40 = v10;
      v41 = v11;
      v42 = v13;
      dispatch_async(v22, block);

      objc_destroyWeak(&v43);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v30 = (void *)MEMORY[0x1A1AC1AAC]();
      v31 = v15;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v33;
        v50 = 2112;
        v51 = v11;
        _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cached accessory settings due to unknown accessory identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      -[HMAccessorySettingsDataSource context](v31, "context");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "delegateCaller");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_21;
      v44[3] = &unk_1E3AB6078;
      v45 = v13;
      objc_msgSend(v35, "invokeBlock:", v44);

      v23 = 0;
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = v15;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v27;
      v50 = 2112;
      v51 = v10;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cached accessory settings due to unknown home identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    -[HMAccessorySettingsDataSource context](v25, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "delegateCaller");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke;
    v46[3] = &unk_1E3AB6078;
    v47 = v13;
    objc_msgSend(v29, "invokeBlock:", v46);

    v23 = v47;
  }

}

- (void)subscribeToAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  HMAccessorySettingsDataSource *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  HMAccessorySettingsDataSource *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  SEL v35;
  id Property;
  void *v37;
  void *v38;
  HMAccessorySettingsDataSource *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HMAccessorySettingsDataSource *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  _BYTE buf[24];
  void *v56;
  _BYTE v57[20];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v54 = a4;
  v13 = a5;
  v53 = a7;
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMAccessorySettingsDataSourceSubscribeOptionsAsString(a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v56 = v54;
    *(_WORD *)v57 = 2112;
    *(_QWORD *)&v57[2] = v18;
    *(_WORD *)&v57[10] = 2112;
    *(_QWORD *)&v57[12] = v19;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Subscribing to accessory settings from cache with home identifier: %@ accessory identifier: %@ # key paths: %@ options: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMAccessorySettingsDataSource homeUUIDForIdentifier:](v15, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[HMAccessorySettingsDataSource accessoryUUIDForIdentifier:homeIdentifier:](v15, v54, v12);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      v23 = v20;
      v24 = v22;
      v52 = v13;
      v25 = v13;
      v26 = v53;
      v27 = v26;
      if (v15)
      {
        v51 = v26;
        v28 = v23;
        v29 = (void *)MEMORY[0x1A1AC1AAC]();
        v30 = v15;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          HMAccessorySettingsDataSourceSubscribeOptionsAsString(a6);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          *(_QWORD *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v28;
          *(_WORD *)&buf[22] = 2112;
          v56 = v24;
          *(_WORD *)v57 = 2112;
          *(_QWORD *)&v57[2] = v25;
          *(_WORD *)&v57[10] = 2112;
          *(_QWORD *)&v57[12] = v33;
          _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_INFO, "%{public}@Subscribing to accessory settings with home uuid: %@ accessory uuid: %@ key paths: %@ options: %@", buf, 0x34u);

        }
        objc_autoreleasePoolPop(v29);
        v23 = v28;
        -[HMAccessorySettingsDataSource topicsForHomeUUID:accessoryUUID:keyPaths:]((uint64_t)v30, v28, v24, v25);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        Property = objc_getProperty(v30, v35, 40, 1);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke;
        v56 = &unk_1E3AB1D88;
        *(_QWORD *)v57 = v30;
        v27 = v51;
        *(_QWORD *)&v57[8] = v51;
        objc_msgSend(Property, "registerConsumer:topicFilters:completion:", v30, v34, buf);

      }
      v13 = v52;
      v37 = v53;
    }
    else
    {
      v44 = (void *)MEMORY[0x1A1AC1AAC]();
      v45 = v15;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v54;
        _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory settings from cache due to unknown accessory identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v44);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsDataSource context](v45, "context");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "delegateCaller");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v53;
      objc_msgSend(v50, "callCompletion:error:", v53, v48);

      v24 = 0;
    }
  }
  else
  {
    v38 = (void *)MEMORY[0x1A1AC1AAC]();
    v39 = v15;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_19B1B0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory settings from cache due to unknown home identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v38);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsDataSource context](v39, "context");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "delegateCaller");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v53;
    objc_msgSend(v43, "callCompletion:error:", v53, v24);

  }
}

- (void)unsubscribeToAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMAccessorySettingsDataSource *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  id Property;
  void *v24;
  HMAccessorySettingsDataSource *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  HMAccessorySettingsDataSource *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v38 = v17;
    v39 = 2112;
    v40 = v10;
    v41 = 2112;
    v42 = v11;
    v43 = 2112;
    v44 = v12;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing to accessory settings from cache with home identifier: %@ accessory identifier: %@ key paths: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);
  -[HMAccessorySettingsDataSource homeUUIDForIdentifier:](v15, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[HMAccessorySettingsDataSource accessoryUUIDForIdentifier:homeIdentifier:](v15, v11, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = v19;
      -[HMAccessorySettingsDataSource topicsForHomeUUID:accessoryUUID:keyPaths:]((uint64_t)v15, v18, v19, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        Property = objc_getProperty(v15, v21, 40, 1);
      else
        Property = 0;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __129__HMAccessorySettingsDataSource_unsubscribeToAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke;
      v35[3] = &unk_1E3AB5380;
      v35[4] = v15;
      v36 = v13;
      objc_msgSend(Property, "unregisterConsumer:topicFilters:completion:", v15, v22, v35);

    }
    else
    {
      v29 = (void *)MEMORY[0x1A1AC1AAC]();
      v30 = v15;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v32;
        v39 = 2112;
        v40 = v11;
        _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory settings from cache due to unknown accessory identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsDataSource context](v30, "context");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "delegateCaller");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "callCompletion:error:", v13, v22);

      v20 = 0;
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = v15;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v27;
      v39 = 2112;
      v40 = v10;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory settings from cache due to unknown home identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsDataSource context](v25, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "delegateCaller");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "callCompletion:error:", v13, v20);

  }
}

- (void)resetSubscriptions
{
  void *v3;
  HMAccessorySettingsDataSource *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  id Property;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Unsubscribe from all subscriptions", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  if (v4)
    Property = objc_getProperty(v4, v7, 40, 1);
  else
    Property = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HMAccessorySettingsDataSource_resetSubscriptions__block_invoke;
  v9[3] = &unk_1E3AB5CA8;
  v9[4] = v4;
  objc_msgSend(Property, "unregisterConsumer:completion:", v4, v9);
}

- (id)localizedTitleForKeyPath:(id)a3
{
  HMAccessorySettingsDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  SEL v7;
  void *v8;

  if (self)
  {
    v3 = self;
    objc_msgSend(a3, "uppercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("."), CFSTR("_"), 1, 0, objc_msgSend(v5, "length"));
    objc_msgSend(v5, "appendString:", CFSTR("_LOCALIZATION_KEY"));
    v6 = (void *)objc_msgSend(v5, "copy");

    self = (HMAccessorySettingsDataSource *)objc_getProperty(v3, v7, 32, 1);
  }
  else
  {
    v6 = 0;
  }
  -[HMAccessorySettingsDataSource getLocalizedString:](self, "getLocalizedString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)subscribeToMediaSystemSettingsWithHomeIdentifier:(id)a3 mediaSystemIdentifier:(id)a4 keyPaths:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  HMAccessorySettingsDataSource *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  void *v27;
  id Property;
  void *v29;
  void *v30;
  HMAccessorySettingsDataSource *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  HMAccessorySettingsDataSource *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)MEMORY[0x1A1AC1AAC]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HMAccessorySettingsDataSourceSubscribeOptionsAsString(a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v47 = v19;
    v48 = 2112;
    v49 = v12;
    v50 = 2112;
    v51 = v13;
    v52 = 2112;
    v53 = v14;
    v54 = 2112;
    v55 = v20;
    _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Subscribing to media system settings with home identifier: %@ accessory identifier: %@ key paths: %@ options: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v16);
  -[HMAccessorySettingsDataSource homeUUIDForIdentifier:](v17, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[HMAccessorySettingsDataSource mediaSystemUUIDForIdentifier:homeIdentifier:](v17, v13, v12);
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      v24 = MEMORY[0x1E0C809B0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke;
      v43[3] = &unk_1E3AB1CC0;
      v44 = v21;
      v25 = v23;
      v45 = v25;
      objc_msgSend(v14, "na_map:", v43);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        Property = objc_getProperty(v17, v26, 40, 1);
      else
        Property = 0;
      v41[0] = v24;
      v41[1] = 3221225472;
      v41[2] = __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_2;
      v41[3] = &unk_1E3AB1D88;
      v41[4] = v17;
      v42 = v15;
      objc_msgSend(Property, "registerConsumer:topicFilters:completion:", v17, v27, v41);

      v29 = v44;
    }
    else
    {
      v35 = (void *)MEMORY[0x1A1AC1AAC]();
      v36 = v17;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v38;
        v48 = 2112;
        v49 = v13;
        _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to subscribe to media system settings due to unknown accessory identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsDataSource context](v36, "context");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "delegateCaller");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "callCompletion:error:", v15, v29);

      v25 = 0;
    }
  }
  else
  {
    v30 = (void *)MEMORY[0x1A1AC1AAC]();
    v31 = v17;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v33;
      v48 = 2112;
      v49 = v12;
      _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to subscribe to media system settings due to unknown home identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsDataSource context](v31, "context");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "delegateCaller");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "callCompletion:error:", v15, v25);

  }
}

- (void)unsubscribeToMediaSystemSettingsWithHomeIdentifier:(id)a3 mediaSystemIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMAccessorySettingsDataSource *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  void *v24;
  id Property;
  void *v26;
  void *v27;
  HMAccessorySettingsDataSource *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMAccessorySettingsDataSource *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v44 = v17;
    v45 = 2112;
    v46 = v10;
    v47 = 2112;
    v48 = v11;
    v49 = 2112;
    v50 = v12;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing to media system settings with home identifier: %@ media system identifier: %@ key paths: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);
  -[HMAccessorySettingsDataSource homeUUIDForIdentifier:](v15, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[HMAccessorySettingsDataSource mediaSystemUUIDForIdentifier:homeIdentifier:](v15, v11, v10);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      v21 = MEMORY[0x1E0C809B0];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __133__HMAccessorySettingsDataSource_unsubscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_completionHandler___block_invoke;
      v40[3] = &unk_1E3AB1CC0;
      v41 = v18;
      v22 = v20;
      v42 = v22;
      objc_msgSend(v12, "na_map:", v40);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        Property = objc_getProperty(v15, v23, 40, 1);
      else
        Property = 0;
      v38[0] = v21;
      v38[1] = 3221225472;
      v38[2] = __133__HMAccessorySettingsDataSource_unsubscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_completionHandler___block_invoke_2;
      v38[3] = &unk_1E3AB5380;
      v38[4] = v15;
      v39 = v13;
      objc_msgSend(Property, "unregisterConsumer:topicFilters:completion:", v15, v24, v38);

      v26 = v41;
    }
    else
    {
      v32 = (void *)MEMORY[0x1A1AC1AAC]();
      v33 = v15;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v35;
        v45 = 2112;
        v46 = v11;
        _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to unsubscribe media system settings from cache due to unknown media system identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsDataSource context](v33, "context");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "delegateCaller");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "callCompletion:error:", v13, v26);

      v22 = 0;
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = v15;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v30;
      v45 = 2112;
      v46 = v10;
      _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to unsubscribe media system settings from cache due to unknown home identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsDataSource context](v28, "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "delegateCaller");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "callCompletion:error:", v13, v22);

  }
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  NSObject *Property;
  void *v10;
  HMAccessorySettingsDataSource *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 56, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v13;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Received live event: %@, topic: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMAccessorySettingsDataSource _didReceiveEvent:topic:](v11, v6, v8);

}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  id v11;
  NSObject *Property;
  void *v13;
  HMAccessorySettingsDataSource *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v11 = a5;
  if (self)
    Property = objc_getProperty(self, v10, 56, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  v13 = (void *)MEMORY[0x1A1AC1AAC]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v16;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Received cached event: %@, topic: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMAccessorySettingsDataSource _didReceiveEvent:topic:](v14, v8, v9);

}

- (id)defaultSettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMBooleanSetting *v16;
  HMBooleanSetting *v17;
  HMBooleanSetting *v18;
  HMBooleanSetting *v19;
  HMBooleanSetting *v20;
  HMBooleanSetting *v21;
  void *v22;
  HMLanguageSetting *v23;
  HMBooleanSetting *v24;
  void *v25;
  HMBooleanSetting *v26;
  HMBooleanSetting *v27;
  HMBooleanSetting *v28;
  void *v29;
  void *v30;
  HMAccessorySettingsDataSource *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  HMAccessorySettingsDataSource *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  HMAccessorySettingsDataSource *v39;
  NSObject *v40;
  void *v41;
  int v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMAccessorySettingsDataSource dataSourceHomeWithHomeIdentifier:](self, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "supportedSiriEndPointVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", CFSTR("7.2"));
      if ((objc_msgSend(v13, "isAtLeastVersion:", v14) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "containsObject:", CFSTR("root.siri.allowHeySiri")))
        {
          v16 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:]([HMBooleanSetting alloc], "initWithKeyPath:readOnly:BOOLValue:", CFSTR("root.siri.allowHeySiri"), 1, 0);
          objc_msgSend(v15, "addObject:", v16);

        }
        if (objc_msgSend(v10, "containsObject:", CFSTR("root.siri.siriEnabled")))
        {
          v17 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:]([HMBooleanSetting alloc], "initWithKeyPath:readOnly:BOOLValue:", CFSTR("root.siri.siriEnabled"), 1, 0);
          objc_msgSend(v15, "addObject:", v17);

        }
        if (objc_msgSend(v10, "containsObject:", CFSTR("root.airPlay.airPlayEnabled")))
        {
          v18 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:]([HMBooleanSetting alloc], "initWithKeyPath:readOnly:BOOLValue:", CFSTR("root.airPlay.airPlayEnabled"), 1, 0);
          objc_msgSend(v15, "addObject:", v18);

        }
        if (objc_msgSend(v10, "containsObject:", CFSTR("root.siri.lightWhenUsingSiri")))
        {
          v19 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:]([HMBooleanSetting alloc], "initWithKeyPath:readOnly:BOOLValue:", CFSTR("root.siri.lightWhenUsingSiri"), 1, 1);
          objc_msgSend(v15, "addObject:", v19);

        }
        if (objc_msgSend(v10, "containsObject:", CFSTR("root.siri.tapToAccess")))
        {
          v20 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:]([HMBooleanSetting alloc], "initWithKeyPath:readOnly:BOOLValue:", CFSTR("root.siri.tapToAccess"), 1, 1);
          objc_msgSend(v15, "addObject:", v20);

        }
        if (objc_msgSend(v10, "containsObject:", CFSTR("root.siri.soundAlert")))
        {
          v21 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:]([HMBooleanSetting alloc], "initWithKeyPath:readOnly:BOOLValue:", CFSTR("root.siri.soundAlert"), 1, 1);
          objc_msgSend(v15, "addObject:", v21);

        }
        if (objc_msgSend(v10, "containsObject:", CFSTR("root.siri.language")))
        {
          +[HMAccessorySettingsDataSource defaultLanguageValue](HMAccessorySettingsDataSource, "defaultLanguageValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[HMLanguageSetting initWithKeyPath:readOnly:languageValue:]([HMLanguageSetting alloc], "initWithKeyPath:readOnly:languageValue:", CFSTR("root.siri.language"), 1, v22);
          objc_msgSend(v15, "addObject:", v23);

        }
        if (objc_msgSend(v10, "containsObject:", CFSTR("root.locationServices.enabled")))
        {
          v24 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:]([HMBooleanSetting alloc], "initWithKeyPath:readOnly:BOOLValue:", CFSTR("root.locationServices.enabled"), 1, 1);
          objc_msgSend(v15, "addObject:", v24);

        }
        objc_msgSend(v12, "accessoryWithUniqueIdentifier:", v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "containsObject:", CFSTR("root.music.allowExplicitContent"))
          && (objc_msgSend(v25, "supportsUserMediaSettings") & 1) == 0)
        {
          v26 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:]([HMBooleanSetting alloc], "initWithKeyPath:readOnly:BOOLValue:", CFSTR("root.music.allowExplicitContent"), 1, 0);
          objc_msgSend(v15, "addObject:", v26);

        }
        if (objc_msgSend(v10, "containsObject:", CFSTR("root.announce.enabled")))
        {
          v27 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:]([HMBooleanSetting alloc], "initWithKeyPath:readOnly:BOOLValue:", CFSTR("root.announce.enabled"), 1, 0);
          objc_msgSend(v15, "addObject:", v27);

        }
        if (objc_msgSend(v10, "containsObject:", CFSTR("root.general.analytics.shareSiriAnalytics")))
        {
          v28 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:]([HMBooleanSetting alloc], "initWithKeyPath:readOnly:BOOLValue:", CFSTR("root.general.analytics.shareSiriAnalytics"), 1, 0);
          objc_msgSend(v15, "addObject:", v28);

        }
        v29 = (void *)objc_msgSend(v15, "copy");

      }
      else
      {
        v38 = (void *)MEMORY[0x1A1AC1AAC]();
        v39 = self;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138543874;
          v44 = v41;
          v45 = 2112;
          v46 = v13;
          v47 = 2112;
          v48 = v12;
          _os_log_impl(&dword_19B1B0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to get default settings due to unsupported siri endpoint version: %@ for home: %@", (uint8_t *)&v43, 0x20u);

        }
        objc_autoreleasePoolPop(v38);
        v29 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v34 = (void *)MEMORY[0x1A1AC1AAC]();
      v35 = self;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138543618;
        v44 = v37;
        v45 = 2112;
        v46 = v12;
        _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to get default settings due to unknown supported siri endpoint version for home: %@", (uint8_t *)&v43, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      v29 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v30 = (void *)MEMORY[0x1A1AC1AAC]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 138543618;
      v44 = v33;
      v45 = 2112;
      v46 = v8;
      _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to get default settings due to unknown home with identifier: %@", (uint8_t *)&v43, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    v29 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v29;
}

- (void)dealloc
{
  void *v3;
  HMAccessorySettingsDataSource *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsDataSource delegate](v4, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating. delegate:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v8.receiver = v4;
  v8.super_class = (Class)HMAccessorySettingsDataSource;
  -[HMAccessorySettingsDataSource dealloc](&v8, sel_dealloc);
}

- (HMAccessorySettingsDataSourceDelegate)delegate
{
  return (HMAccessorySettingsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMAccessorySettingsDataSourceDataSource)dataSource
{
  return (HMAccessorySettingsDataSourceDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 88, 1);
}

- (HMAccessorySettingsMessengerFactory)messengerFactory
{
  return (HMAccessorySettingsMessengerFactory *)objc_loadWeakRetained((id *)&self->_messengerFactory);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messengerFactory);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_lastEventStoreWriteHandle, 0);
  objc_storeStrong((id *)&self->_lastEventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_eventSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_localizationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_messenger, 0);
}

- (id)dataSourceHomeWithHomeIdentifier:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "accessorySettingsDataSource:homeWithHomeIdentifier:", a1, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x1A1AC1AAC]();
      v8 = a1;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v10;
        _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source accessory UUID due to no data source", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_didReceiveEvent:(void *)a3 topic:
{
  id v5;
  const char *v6;
  id v7;
  NSObject *Property;
  int v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  _BYTE buf[12];
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v6, 56, 1);
    dispatch_assert_queue_V2(Property);
    v55 = 0;
    v56 = 0;
    v54 = 0;
    v9 = HMImmutableSettingChangeEventComponentsFromTopic(v7, &v56, &v55, &v54);
    v10 = v56;
    v11 = v55;
    v12 = v54;
    v13 = v12;
    if (v9)
    {
      v49 = v7;
      v50 = v5;
      v14 = v5;
      v15 = v10;
      v16 = v11;
      v58 = 0;
      +[HMImmutableSettingChangeEvent decodeSettingFromEvent:error:](HMImmutableSettingChangeEvent, "decodeSettingFromEvent:error:", v14, &v58);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v58;
      v18 = (void *)MEMORY[0x1A1AC1AAC]();
      v19 = a1;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v21;
        v61 = 2112;
        v62 = v17;
        v63 = 2112;
        v64 = v47;
        v65 = 2112;
        v66 = v22;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Modified accessory setting:%@, error:%@, delegate:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v18);
      if (v17)
      {
        objc_msgSend(v19, "dataSource");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        v57 = 0;
        v24 = objc_msgSend(v23, "accessorySettingsDataSource:transformHomeUUID:accessoryUUID:toClientHomeIdentifier:clientAccessoryIdentifier:", v19, v15, v16, buf, &v57);
        v25 = *(id *)buf;
        v26 = v57;

        if (v24)
        {
          v59 = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMAccessorySettingsDataSource notifyDelegateDidReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:](v19, v26, v27);

        }
      }
      else
      {
        v25 = 0;
        v26 = 0;
      }

    }
    else
    {
      v52 = v11;
      v53 = v10;
      v51 = v12;
      v28 = HMImmutableSettingChangeEventComponentsFromMediaSystemTopic((uint64_t)v7, &v53, &v52, &v51);
      v15 = v53;

      v16 = v52;
      v29 = v51;

      if (!v28)
      {
        v43 = (void *)MEMORY[0x1A1AC1AAC]();
        v44 = a1;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v46;
          v61 = 2112;
          v62 = v5;
          v63 = 2112;
          v64 = v15;
          v65 = 2112;
          v66 = v16;
          _os_log_impl(&dword_19B1B0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Received unknown event: %@ home: %@ target: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v43);
        v13 = v29;
        goto LABEL_22;
      }
      v48 = v29;
      v49 = v7;
      v50 = v5;
      v30 = v5;
      v15 = v15;
      v16 = v16;
      v58 = 0;
      +[HMImmutableSettingChangeEvent decodeSettingFromEvent:error:](HMImmutableSettingChangeEvent, "decodeSettingFromEvent:error:", v30, &v58);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v58;
      v33 = (void *)MEMORY[0x1A1AC1AAC]();
      v34 = a1;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "delegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v36;
        v61 = 2112;
        v62 = v31;
        v63 = 2112;
        v64 = v32;
        v65 = 2112;
        v66 = v37;
        _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_INFO, "%{public}@Modified media system setting:%@, error:%@, delegate:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v33);
      if (v31)
      {
        objc_msgSend(v34, "dataSource");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        v57 = 0;
        v39 = objc_msgSend(v38, "accessorySettingsDataSource:transformHomeUUID:mediaSystemUUID:toClientHomeIdentifier:clientMediaSystemIdentifier:", v34, v15, v16, buf, &v57);
        v40 = *(id *)buf;
        v41 = v57;

        if (v39)
        {
          v59 = v31;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMAccessorySettingsDataSource notifyDelegateDidReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:](v34, v41, v42);

        }
      }
      else
      {
        v40 = 0;
        v41 = 0;
      }

      v13 = v48;
    }
    v7 = v49;
    v5 = v50;
LABEL_22:

  }
}

- (void)notifyDelegateDidReceiveSettingsUpdatesForAccessoryWithIdentifier:(void *)a3 settings:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = a1;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v23 = v11;
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did receive settings updates for accessory with identifier: %@ settings: %@ delegate: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v9, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegateCaller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __108__HMAccessorySettingsDataSource_notifyDelegateDidReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke;
  v17[3] = &unk_1E3AB59E8;
  v18 = v7;
  v19 = v9;
  v14 = v5;
  v20 = v14;
  v15 = v6;
  v21 = v15;
  v16 = v7;
  objc_msgSend(v13, "invokeBlock:", v17);

}

uint64_t __108__HMAccessorySettingsDataSource_notifyDelegateDidReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "accessorySettingsDataSource:didReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (id)homeUUIDForIdentifier:(void *)a1
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    -[HMAccessorySettingsDataSource dataSourceHomeWithHomeIdentifier:](a1, a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "uuid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)mediaSystemUUIDForIdentifier:(void *)a3 homeIdentifier:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    -[HMAccessorySettingsDataSource dataSourceHomeWithHomeIdentifier:](a1, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "mediaSystemWithUniqueIdentifier:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "uuid");
        a1 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        a1 = 0;
      }

    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

uint64_t __133__HMAccessorySettingsDataSource_unsubscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("home.%@.mediagroup.stereo.%@.settings.%@.updated"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

void __133__HMAccessorySettingsDataSource_unsubscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Unsubscribe topics with result: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegateCaller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "callCompletion:error:", *(_QWORD *)(a1 + 40), v3);

}

uint64_t __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("home.%@.mediagroup.stereo.%@.settings.%@.updated"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

void __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  NSObject *Property;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v12;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Subscribe changed topics with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Subscribe changed topics, received cached events %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (objc_msgSend(v5, "count"))
    {
      v15 = *(void **)(a1 + 32);
      if (v15)
        Property = objc_getProperty(v15, v14, 56, 1);
      else
        Property = 0;
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_39;
      block[3] = &unk_1E3AB5ED8;
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 32);
      v27 = v17;
      v28 = v18;
      dispatch_async(Property, block);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "delegateCaller");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_41;
  v23[3] = &unk_1E3AB60A0;
  v21 = *(id *)(a1 + 40);
  v24 = v6;
  v25 = v21;
  v22 = v6;
  objc_msgSend(v20, "invokeBlock:", v23);

}

uint64_t __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_39(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_2_40;
  v3[3] = &unk_1E3AB1D60;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

uint64_t __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_2_40(uint64_t a1, void *a2, void *a3)
{
  -[HMAccessorySettingsDataSource _didReceiveEvent:topic:](*(void **)(a1 + 32), a3, a2);
}

- (id)accessoryUUIDForIdentifier:(void *)a3 homeIdentifier:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    -[HMAccessorySettingsDataSource dataSourceHomeWithHomeIdentifier:](a1, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "accessoryWithUniqueIdentifier:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "uuid");
        a1 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        a1 = 0;
      }

    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

- (id)topicsForHomeUUID:(void *)a3 accessoryUUID:(void *)a4 keyPaths:
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__HMAccessorySettingsDataSource_topicsForHomeUUID_accessoryUUID_keyPaths___block_invoke;
    v11[3] = &unk_1E3AB1CC0;
    v12 = v7;
    v13 = v8;
    objc_msgSend(a4, "na_map:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __129__HMAccessorySettingsDataSource_unsubscribeToAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Unsubscribe topics with result: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegateCaller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "callCompletion:error:", *(_QWORD *)(a1 + 40), v3);

}

id __74__HMAccessorySettingsDataSource_topicsForHomeUUID_accessoryUUID_keyPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  return HMImmutableSettingChangeEventTopicFromComponentsHH2(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

void __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  NSObject *Property;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v12;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Subscribe changed topics with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Subscribe changed topics, received cached events %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (objc_msgSend(v5, "count"))
    {
      v15 = *(void **)(a1 + 32);
      if (v15)
        Property = objc_getProperty(v15, v14, 56, 1);
      else
        Property = 0;
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke_28;
      block[3] = &unk_1E3AB5ED8;
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 32);
      v27 = v17;
      v28 = v18;
      dispatch_async(Property, block);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "delegateCaller");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke_30;
  v23[3] = &unk_1E3AB60A0;
  v21 = *(id *)(a1 + 40);
  v24 = v6;
  v25 = v21;
  v22 = v6;
  objc_msgSend(v20, "invokeBlock:", v23);

}

uint64_t __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke_28(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke_2;
  v3[3] = &unk_1E3AB1D60;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

uint64_t __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  -[HMAccessorySettingsDataSource _didReceiveEvent:topic:](*(void **)(a1 + 32), a3, a2);
}

void __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, MEMORY[0x1E0C9AA60]);

}

void __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_21(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, MEMORY[0x1E0C9AA60]);

}

void __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *WeakRetained;
  const char *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  SEL v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v60;
  id v61;
  id v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;
  __int16 v87;
  id v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v1 = a1;
  v95 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v4 = WeakRetained;
  if (WeakRetained)
    WeakRetained = objc_getProperty(WeakRetained, v3, 56, 1);
  dispatch_assert_queue_V2(WeakRetained);
  v5 = *(void **)(v1 + 40);
  v6 = *(void **)(v1 + 48);
  v7 = *(id *)(v1 + 32);
  v8 = v5;
  v62 = v6;
  if (v4)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = v4;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v82 = v12;
      v83 = 2112;
      v84 = v7;
      v85 = 2112;
      v86 = v8;
      v87 = 2112;
      v88 = v62;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Reading accessory settings from cache for home uuid: %@ accessory uuid: %@ key paths: %@", buf, 0x2Au);

    }
    v60 = v1;

    objc_autoreleasePoolPop(v9);
    v61 = v7;
    -[HMAccessorySettingsDataSource topicsForHomeUUID:accessoryUUID:keyPaths:]((uint64_t)v10, v7, v8, v62);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_getProperty(v10, v14, 64, 1), "eventsForTopicFilters:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      v58 = v13;
      v59 = v8;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v76, buf, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v77;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v77 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = 0;
            +[HMImmutableSettingChangeEvent decodeSettingFromEvent:error:](HMImmutableSettingChangeEvent, "decodeSettingFromEvent:error:", v22, &v75);
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v23;
            if (v75)
              v25 = 1;
            else
              v25 = v23 == 0;
            if (!v25)
              objc_msgSend(v16, "addObject:", v23);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v76, buf, 16);
        }
        while (v19);
      }

      v26 = (void *)objc_msgSend(v16, "copy");
      v13 = v58;
      v8 = v59;
    }
    else
    {
      v27 = (void *)MEMORY[0x1A1AC1AAC]();
      v28 = v10;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v82 = v30;
        v83 = 2112;
        v84 = v61;
        v85 = 2112;
        v86 = v8;
        _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_INFO, "%{public}@Found no events in cache for home uuid: %@ accessory uuid: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
      v26 = (void *)MEMORY[0x1E0C9AA60];
    }

    v1 = v60;
    v7 = v61;
  }
  else
  {
    v26 = 0;
  }

  v31 = (void *)MEMORY[0x1A1AC1AAC]();
  v32 = v4;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v31;
    v36 = *(void **)(v1 + 56);
    v35 = *(void **)(v1 + 64);
    v37 = *(void **)(v1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v1 + 48), "count"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v82 = v34;
    v83 = 2112;
    v84 = v36;
    v85 = 2112;
    v86 = v35;
    v31 = v63;
    v87 = 2112;
    v88 = v37;
    v89 = 2112;
    v90 = v38;
    v91 = 2112;
    v92 = v39;
    v93 = 2112;
    v94 = v26;
    _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_INFO, "%{public}@Returning cached accessory settings from event store with home identifier: %@ accessory identifier: %@ expected key paths: %@ found (%@/%@) settings: %@", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v31);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", *(_QWORD *)(v1 + 48));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v41 = v26;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v72 != v44)
          objc_enumerationMutation(v41);
        objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * j), "keyPath");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "removeObject:", v46);

      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    }
    while (v43);
  }

  v47 = objc_msgSend(v40, "count");
  v48 = MEMORY[0x1E0C809B0];
  if (v47)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v68[0] = v48;
    v68[1] = 3221225472;
    v68[2] = __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_25;
    v68[3] = &unk_1E3AB1D10;
    v69 = (id)objc_claimAutoreleasedReturnValue();
    v70 = v49;
    v50 = v49;
    v51 = v69;
    objc_msgSend(v40, "na_each:", v68);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:userInfo:", 52, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v52 = 0;
  }
  -[NSObject context](v32, "context");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "delegateCaller");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v48;
  v64[1] = 3221225472;
  v64[2] = __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_2_27;
  v64[3] = &unk_1E3AB5C58;
  v55 = *(id *)(v1 + 72);
  v66 = v41;
  v67 = v55;
  v65 = v52;
  v56 = v41;
  v57 = v52;
  objc_msgSend(v54, "invokeBlock:", v64);

}

uint64_t __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_25(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_2_27(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __121__HMAccessorySettingsDataSource_fetchAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  void *v8;
  NSObject *Property;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v7 = a3;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    Property = objc_getProperty(v8, v6, 56, 1);
    v10 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v10 = 0;
    Property = 0;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __121__HMAccessorySettingsDataSource_fetchAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_2;
  v13[3] = &unk_1E3AB53D0;
  v14 = v5;
  v15 = v10;
  v16 = v7;
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v11 = v7;
  v12 = v5;
  dispatch_async(Property, v13);

}

void __121__HMAccessorySettingsDataSource_fetchAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  HMImmutableSettingChangeEvent *v22;
  void *v23;
  HMImmutableSettingChangeEvent *v24;
  const char *v25;
  id Property;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v38 = v7;
    v39 = 2112;
    v40 = v8;
    v41 = 2112;
    v42 = v9;
    v10 = "%{public}@Fetch accessory settings completed with settings: %@ error: %@";
    v11 = v6;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v38 = v7;
    v39 = 2112;
    v40 = v14;
    v10 = "%{public}@Fetch accessory settings completed with settings: %@";
    v11 = v6;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
  }
  _os_log_impl(&dword_19B1B0000, v11, v12, v10, buf, v13);

LABEL_7:
  objc_autoreleasePoolPop(v3);
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = *(id *)(a1 + 48);
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v18);
          objc_msgSend(v19, "keyPath");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          HMImmutableSettingChangeEventTopicFromComponentsHH2(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), (uint64_t)v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = [HMImmutableSettingChangeEvent alloc];
          objc_msgSend(*(id *)(a1 + 64), "UUIDString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v24 = -[HMImmutableSettingChangeEvent initWithSetting:eventSource:eventTimestamp:](v22, "initWithSetting:eventSource:eventTimestamp:", v19, v23);

          Property = *(id *)(a1 + 40);
          if (Property)
          {
            Property = objc_getProperty(Property, v25, 72, 1);
            v27 = *(_QWORD *)(a1 + 40);
          }
          else
          {
            v27 = 0;
          }
          objc_msgSend(Property, "writer:saveEvent:topic:", v27, v24, v21);

          ++v18;
        }
        while (v16 != v18);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        v16 = v28;
      }
      while (v28);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "context");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "delegateCaller");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "callCompletion:error:obj:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

+ (id)defaultLanguageValue
{
  HMSettingLanguageValue *v2;
  void *v3;

  v2 = -[HMSettingLanguageValue initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:]([HMSettingLanguageValue alloc], "initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", CFSTR("en-US"), CFSTR("en-US"), CFSTR("f"), 0);
  +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:](HMFObjectCacheHMSettingLanguageValue, "cachedInstanceForLanguageSettingValue:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42_27514 != -1)
    dispatch_once(&logCategory__hmf_once_t42_27514, &__block_literal_global_27515);
  return (id)logCategory__hmf_once_v43_27516;
}

void __44__HMAccessorySettingsDataSource_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v43_27516;
  logCategory__hmf_once_v43_27516 = v0;

}

@end
