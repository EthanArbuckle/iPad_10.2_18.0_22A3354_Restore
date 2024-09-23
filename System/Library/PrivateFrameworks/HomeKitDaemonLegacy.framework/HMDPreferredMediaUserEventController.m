@implementation HMDPreferredMediaUserEventController

- (HMDPreferredMediaUserEventController)initWithDataSource:(id)a3 queue:(id)a4 driver:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDPreferredMediaUserEventController *v11;
  HMDPreferredMediaUserEventController *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDPreferredMediaUserEventController;
  v11 = -[HMDPreferredMediaUserEventController init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeStrong((id *)&v12->_queue, a4);
    objc_storeStrong((id *)&v12->_driver, a5);
    -[HMDFetchedSettingsDriver setDelegate:](v12->_driver, "setDelegate:", v12);
  }

  return v12;
}

- (void)updatePreferredMediaUserWithPrimaryUserInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDPreferredMediaUserEventController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__HMDPreferredMediaUserEventController_updatePreferredMediaUserWithPrimaryUserInfo_completion___block_invoke;
  block[3] = &unk_1E89C1B48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)eventSource
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDPreferredMediaUserEventController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)eventTimestamp
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

- (void)_postUpdateEventsIfDifferent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPreferredMediaUserEventController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  HMDPreferredMediaUserEventController *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDPreferredMediaUserEventController *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDPreferredMediaUserEventController *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDPreferredMediaUserEventController *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HMDPreferredMediaUserEventController *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[5];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDPreferredMediaUserEventController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v9;
    v53 = 2112;
    v54 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Posting event to update primaryUserInfo: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDPreferredMediaUserEventController dataSource](v7, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "accessoryUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "homeUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isCurrentAccessory"))
    {
LABEL_27:

      goto LABEL_28;
    }
    if (!v12 || !v13)
    {
      v28 = (void *)MEMORY[0x1D17BA0A0]();
      v29 = v7;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v52 = v31;
        v53 = 2112;
        v54 = v13;
        v55 = 2112;
        v56 = v12;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil value in homeUUID: %@, accessoryUUID: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x1E0CBA240], "topicFromSuffixID:homeUUID:accessoryUUID:", *MEMORY[0x1E0CB7C28], v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "eventStoreReadHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastEventForTopic:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_alloc(MEMORY[0x1E0CBA258]);
      objc_msgSend(v16, "encodedData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithProtoData:", v18);

      if (v19)
      {
        if (objc_msgSend(v19, "isEqual:", v4))
        {
          v20 = (void *)MEMORY[0x1D17BA0A0]();
          v21 = v7;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v47 = v20;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v52 = v23;
            _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Skip sending event update for primaryUserInfo as it matches stored", buf, 0xCu);

            v20 = v47;
          }

          objc_autoreleasePoolPop(v20);
LABEL_26:

          goto LABEL_27;
        }
LABEL_23:
        v49 = v16;
        v36 = (void *)MEMORY[0x1D17BA0A0]();
        v37 = v7;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v52 = v39;
          v53 = 2112;
          v54 = v14;
          v55 = 2112;
          v56 = v4;
          _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Forwarding event with topic: %@ for primaryUserInfo: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v36);
        v40 = objc_alloc(MEMORY[0x1E0D32D38]);
        -[HMDPreferredMediaUserEventController eventSource](v37, "eventSource");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPreferredMediaUserEventController eventTimestamp](v37, "eventTimestamp");
        v42 = (void *)objc_msgSend(v40, "initWithSource:cachePolicy:combineType:timestamp:", v41, 2, 2);

        v43 = objc_alloc(MEMORY[0x1E0D32D28]);
        objc_msgSend(v4, "protoData");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(v43, "initWithEventData:metadata:", v44, v42);

        objc_msgSend(v11, "eventForwarder");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __69__HMDPreferredMediaUserEventController__postUpdateEventsIfDifferent___block_invoke;
        v50[3] = &unk_1E89C2350;
        v50[4] = v37;
        objc_msgSend(v46, "forwardEvent:topic:completion:", v45, v14, v50);

        v16 = v49;
        goto LABEL_26;
      }
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = v7;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v48 = v32;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v35;
        v53 = 2112;
        v54 = v14;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Error reading stored primary user for topic %@", buf, 0x16u);

        v32 = v48;
      }

      objc_autoreleasePoolPop(v32);
    }
    v19 = 0;
    goto LABEL_23;
  }
  v24 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = v7;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v27;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot post primaryUserInfo update event because dataSource is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v24);
LABEL_28:

}

- (void)driver:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDPreferredMediaUserEventController *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Only primaryUserInfo settings is supported.", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)driver:(id)a3 didUpdatePrimaryUserInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDPreferredMediaUserEventController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDPreferredMediaUserEventController *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDPreferredMediaUserEventController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v12;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received primaryUserInfo updates: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDPreferredMediaUserEventController _postUpdateEventsIfDifferent:](v10, "_postUpdateEventsIfDifferent:", v7);
  -[HMDPreferredMediaUserEventController dataSource](v10, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v7, "uuidString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updatePreferredMediaUser:selectionType:", v14, objc_msgSend(v7, "selectionType"));

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v10;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot update primaryUserInfo in the accessory because dataSource is nil", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)driverDidReload:(id)a3
{
  id v4;
  void *v5;
  HMDPreferredMediaUserEventController *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@PrimaryUserInfo fetch is not supported", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (HMDFetchedSettingsDriver)driver
{
  return (HMDFetchedSettingsDriver *)objc_getProperty(self, a2, 16, 1);
}

- (HMDPreferredMediaUserEventControllerDataSource)dataSource
{
  return (HMDPreferredMediaUserEventControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __69__HMDPreferredMediaUserEventController__postUpdateEventsIfDifferent___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error in forwarding the primary user event: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __95__HMDPreferredMediaUserEventController_updatePreferredMediaUserWithPrimaryUserInfo_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuidString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "selectionType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating preferred media user: %@, type: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "driver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateSettingWithKeyPath:primaryUserInfo:completion:", CFSTR("root.home.primaryUser"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
