@implementation HMDCoreFollowUpManager

- (HMDCoreFollowUpManager)init
{
  HMDCoreFollowUpManagerDataSource *v3;
  HMDCoreFollowUpManager *v4;

  v3 = objc_alloc_init(HMDCoreFollowUpManagerDataSource);
  v4 = -[HMDCoreFollowUpManager initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (HMDCoreFollowUpManager)initWithDataSource:(id)a3
{
  id v5;
  HMDCoreFollowUpManager *v6;
  HMDCoreFollowUpManager *v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  NSOperationQueue *v12;
  NSOperationQueue *followUpOperationQueue;
  HMDCoreFollowUpManager *v14;
  objc_super v16;

  v5 = a3;
  if (v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDCoreFollowUpManager;
    v6 = -[HMDCoreFollowUpManager init](&v16, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v6->_dataSource, a3);
      v8 = (const char *)HMFDispatchQueueName();
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = dispatch_queue_create(v8, v9);
      workQueue = v7->_workQueue;
      v7->_workQueue = (OS_dispatch_queue *)v10;

      v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
      followUpOperationQueue = v7->_followUpOperationQueue;
      v7->_followUpOperationQueue = v12;

      -[NSOperationQueue setUnderlyingQueue:](v7->_followUpOperationQueue, "setUnderlyingQueue:", v7->_workQueue);
      -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_followUpOperationQueue, "setMaxConcurrentOperationCount:", 1);
    }
    self = v7;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)startAdvertising:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSObject *v9;
  _QWORD v10[6];

  -[HMDCoreFollowUpManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentDeviceSupportsDeviceSetup");

  if (v6)
  {
    -[HMDCoreFollowUpManager dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "currentDeviceSupportsSetupFollowUp");

    if (a3 != 2 || v8)
    {
      -[HMDCoreFollowUpManager workQueue](self, "workQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __43__HMDCoreFollowUpManager_startAdvertising___block_invoke;
      v10[3] = &unk_1E89C0B98;
      v10[4] = self;
      v10[5] = a3;
      dispatch_async(v9, v10);

    }
  }
}

- (void)_startAdvertising:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCoreFollowUpManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDCoreFollowUpPostItemOperation *v25;
  void *v26;
  void *v27;
  HMDCoreFollowUpManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDCoreFollowUpManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[HMDCoreFollowUpManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCoreFollowUpManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "followUpItemForDeviceSetupManager:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCoreFollowUpManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "followUpPreferencesBundleIdentifierForDeviceSetupManager:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTargetBundleIdentifier:", v9);

  if (a3 == 2)
  {
    objc_msgSend(v7, "setUniqueIdentifier:", CFSTR("com.apple.HomeKit.UpdateTvOS"));
    v10 = CFSTR("FOLLOW_UP_ITEM_DEVICE_UPDATE_TVOS_TITLE");
LABEL_5:
    HMDLocalizedStringForKey(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v11);

    -[HMDCoreFollowUpManager dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "currentDeviceSupportsSetupFollowUp");

    if (v13)
    {
      -[HMDCoreFollowUpManager dataSource](self, "dataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "followUpActionForDeviceSetupManager:", self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3 == 2)
        v16 = CFSTR("prefs:root=Home&cfuAction=updateOS");
      else
        v16 = CFSTR("prefs:root=Home&cfuAction=finishSetup");
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setUrl:", v17);

      v36 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setActions:", v18);

    }
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Checking existing follow up setup items", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDCoreFollowUpManager dataSource](v20, "dataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "followUpControllerForDeviceSetupManager:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = -[HMDCoreFollowUpPostItemOperation initWithItemToPost:followUpController:]([HMDCoreFollowUpPostItemOperation alloc], "initWithItemToPost:followUpController:", v7, v24);
      -[HMDCoreFollowUpManager followUpOperationQueue](v20, "followUpOperationQueue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addOperation:", v25);

    }
    else
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = v20;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCoreFollowUpManager dataSource](v28, "dataSource");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v30;
        v39 = 2112;
        v40 = (int64_t)v31;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to get followup controller from datasource: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
    }

    goto LABEL_21;
  }
  if (a3 == 1)
  {
    objc_msgSend(v7, "setUniqueIdentifier:", *MEMORY[0x1E0CB8BE8]);
    v10 = CFSTR("FOLLOW_UP_ITEM_DEVICE_SETUP_TITLE");
    goto LABEL_5;
  }
  v32 = (void *)MEMORY[0x1D17BA0A0]();
  v33 = self;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v35;
    v39 = 2048;
    v40 = a3;
    _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unexpected setup mode to start advertising: %ld", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v32);
LABEL_21:

}

- (void)removeAllFollowUpItemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[HMDCoreFollowUpManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "followUpControllerForDeviceSetupManager:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDCoreFollowUpManager workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__HMDCoreFollowUpManager_removeAllFollowUpItemsWithCompletion___block_invoke;
    block[3] = &unk_1E89C1B48;
    block[4] = self;
    v10 = v6;
    v11 = v4;
    dispatch_async(v7, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

- (void)stopAdvertising:(int64_t)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD v8[6];

  -[HMDCoreFollowUpManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentDeviceSupportsDeviceSetup");

  if (v6)
  {
    -[HMDCoreFollowUpManager workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__HMDCoreFollowUpManager_stopAdvertising___block_invoke;
    v8[3] = &unk_1E89C0B98;
    v8[4] = self;
    v8[5] = a3;
    dispatch_async(v7, v8);

  }
}

- (void)_stopAdvertising:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  HMDCoreFollowUpManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  const __CFString **v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCoreFollowUpRemoveItemsOperation *v19;
  void *v20;
  uint64_t v21;
  HMDCoreFollowUpManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDCoreFollowUpManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  HMDCoreFollowUpManager *v32;
  NSObject *v33;
  void *v34;
  _QWORD v35[2];
  const __CFString *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[HMDCoreFollowUpManager workQueue](self, "workQueue");
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
    v38 = v9;
    v39 = 2048;
    v40 = a3;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Stopping advertising for followup mode: %ld", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (a3 == 1)
  {
    v15 = *MEMORY[0x1E0CB8BE8];
    v35[0] = *MEMORY[0x1E0CB8BE0];
    v35[1] = v15;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = (const __CFString **)v35;
    v14 = 2;
    goto LABEL_8;
  }
  if (a3 != 2)
  {
    v21 = MEMORY[0x1D17BA0A0]();
    v22 = v7;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v24;
      v39 = 2048;
      v40 = a3;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unknown followup mode passed to stop advertising: %ld", buf, 0x16u);

    }
    v25 = (void *)v21;
    goto LABEL_20;
  }
  -[HMDCoreFollowUpManager dataSource](v7, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "currentDeviceSupportsSetupFollowUp");

  if (!v11)
  {
    v31 = MEMORY[0x1D17BA0A0]();
    v32 = v7;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v34;
      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly called stop advertising for tvos update mode on non-atv device", buf, 0xCu);

    }
    v25 = (void *)v31;
LABEL_20:
    objc_autoreleasePoolPop(v25);
    v16 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_21;
  }
  v36 = CFSTR("com.apple.HomeKit.UpdateTvOS");
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = &v36;
  v14 = 1;
LABEL_8:
  objc_msgSend(v12, "arrayWithObjects:count:", v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCoreFollowUpManager dataSource](v7, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "followUpControllerForDeviceSetupManager:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = -[HMDCoreFollowUpRemoveItemsOperation initWithIdentifiersToRemove:followUpController:]([HMDCoreFollowUpRemoveItemsOperation alloc], "initWithIdentifiersToRemove:followUpController:", v16, v18);
    -[HMDCoreFollowUpManager followUpOperationQueue](v7, "followUpOperationQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addOperation:", v19);

  }
  else
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = v7;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCoreFollowUpManager dataSource](v27, "dataSource");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v29;
      v39 = 2112;
      v40 = (int64_t)v30;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to get followup controller from data source: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
  }

LABEL_21:
}

- (HMDCoreFollowUpManagerDataSource)dataSource
{
  return (HMDCoreFollowUpManagerDataSource *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSOperationQueue)followUpOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpOperationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

uint64_t __42__HMDCoreFollowUpManager_stopAdvertising___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAdvertising:", *(_QWORD *)(a1 + 40));
}

void __63__HMDCoreFollowUpManager_removeAllFollowUpItemsWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  HMDCoreFollowUpRemoveItemsOperation *v6;
  void *v7;
  HMDCoreFollowUpRemoveItemsOperation *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    objc_msgSend(v1, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    v6 = [HMDCoreFollowUpRemoveItemsOperation alloc];
    objc_msgSend((id)objc_opt_class(), "allPossibleFollowUpItemIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMDCoreFollowUpRemoveItemsOperation initWithIdentifiersToRemove:followUpController:](v6, "initWithIdentifiersToRemove:followUpController:", v7, v3);

    if (v4)
    {
      objc_initWeak(&location, v8);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __61__HMDCoreFollowUpManager__removeAllFollowUpItems_completion___block_invoke;
      v10[3] = &unk_1E89BD190;
      objc_copyWeak(&v12, &location);
      v11 = v4;
      -[HMDCoreFollowUpRemoveItemsOperation setCompletionBlock:](v8, "setCompletionBlock:", v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v1, "followUpOperationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOperation:", v8);

  }
}

void __61__HMDCoreFollowUpManager__removeAllFollowUpItems_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL, void *))(v2 + 16))(v2, v3 == 0, v4);

}

uint64_t __43__HMDCoreFollowUpManager_startAdvertising___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAdvertising:", *(_QWORD *)(a1 + 40));
}

+ (NSArray)allPossibleFollowUpItemIdentifiers
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB8BE8];
  v3[1] = CFSTR("com.apple.HomeKit.UpdateTvOS");
  v3[2] = *MEMORY[0x1E0CB8BE0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_51447 != -1)
    dispatch_once(&logCategory__hmf_once_t7_51447, &__block_literal_global_51448);
  return (id)logCategory__hmf_once_v8_51449;
}

void __37__HMDCoreFollowUpManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_51449;
  logCategory__hmf_once_v8_51449 = v0;

}

@end
