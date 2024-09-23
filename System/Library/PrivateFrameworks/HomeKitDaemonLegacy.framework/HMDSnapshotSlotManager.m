@implementation HMDSnapshotSlotManager

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (id)encodedMostRecentSnapshotForMessage:(id)a3
{
  id v4;
  SEL v5;
  id Property;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  HMDSnapshotSlotManager *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSMapTable *snapshotFilesByAssociatedProcessInfo;
  void *v19;
  void *v20;
  HMDSnapshotSlotManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    Property = objc_getProperty(self, v5, 72, 1);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    Property = 0;
  }
  v7 = Property;
  if (!isMostRecentSnapshotValid(v7))
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v23;
      v29 = 2112;
      v30 = v24;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Not encoding invalid most recent snapshot for message %@: %@", (uint8_t *)&v27, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    goto LABEL_14;
  }
  objc_msgSend(v7, "snapshotTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceNow");
  v10 = fabs(v9);

  if (v10 > 2.0)
  {
LABEL_14:
    v19 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v4, "proxyConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v17;
      v29 = 2112;
      v30 = v12;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Associating process info %@ with most recent snapshot file: %@", (uint8_t *)&v27, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    if (self)
      snapshotFilesByAssociatedProcessInfo = v14->_snapshotFilesByAssociatedProcessInfo;
    else
      snapshotFilesByAssociatedProcessInfo = 0;
    -[NSMapTable setObject:forKey:](snapshotFilesByAssociatedProcessInfo, "setObject:forKey:", v7, v12);
    encodedSnapshotFile(v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v25;
      v29 = 2112;
      v30 = v4;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot encode most recent snapshot for message without process info: %@", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v19 = 0;
  }

LABEL_19:
  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_160041 != -1)
    dispatch_once(&logCategory__hmf_once_t0_160041, &__block_literal_global_160042);
  return (id)logCategory__hmf_once_v1_160043;
}

- (HMDSnapshotSlotManager)initWithAccessory:(id)a3 workQueue:(id)a4 imageCacheDirectory:(id)a5 logID:(id)a6 uniqueIdentifier:(id)a7 msgDispatcher:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMDSnapshotSlotManager *v18;
  uint64_t v19;
  NSMapTable *snapshotFilesByAssociatedProcessInfo;
  uint64_t v21;
  NSMapTable *filledSnapshotSlotIdentifiersByProcess;
  HMDNotificationRegistration *v23;
  HMDNotificationRegistration *notificationRegistration;
  id v26;
  id v27;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v27 = a7;
  v26 = a8;
  v28.receiver = self;
  v28.super_class = (Class)HMDSnapshotSlotManager;
  v18 = -[HMDSnapshotSlotManager init](&v28, sel_init);
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    snapshotFilesByAssociatedProcessInfo = v18->_snapshotFilesByAssociatedProcessInfo;
    v18->_snapshotFilesByAssociatedProcessInfo = (NSMapTable *)v19;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v21 = objc_claimAutoreleasedReturnValue();
    filledSnapshotSlotIdentifiersByProcess = v18->_filledSnapshotSlotIdentifiersByProcess;
    v18->_filledSnapshotSlotIdentifiersByProcess = (NSMapTable *)v21;

    objc_storeWeak((id *)&v18->_accessory, v14);
    objc_storeStrong((id *)&v18->_workQueue, a4);
    objc_storeStrong((id *)&v18->_logIdentifier, a6);
    objc_storeStrong((id *)&v18->_imageCacheDirectory, a5);
    objc_storeStrong((id *)&v18->_uniqueIdentifier, a7);
    objc_storeStrong((id *)&v18->_msgDispatcher, a8);
    v23 = -[HMDNotificationRegistration initWithRegisterer:]([HMDNotificationRegistration alloc], "initWithRegisterer:", v18);
    notificationRegistration = v18->_notificationRegistration;
    v18->_notificationRegistration = v23;

  }
  return v18;
}

- (void)registerForMessages
{
  HMDSnapshotSlotManager *v2;
  HMDNotificationRegistration *notificationRegistration;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  HMDSnapshotSlotManager *v19;
  HMDSnapshotSlotManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  id v38;
  HMDSnapshotFile *v39;
  void *v40;
  id *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDSnapshotFile *v46;
  id v47;
  void *v48;
  HMDSnapshotFile *v49;
  void *v50;
  id *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id *v55;
  NSObject *v56;
  void *v57;
  SEL v58;
  id Property;
  id *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[4];
  void *v76;
  __int16 v77;
  HMDSnapshotFile *v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  uint8_t v83[4];
  void *v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v2 = self;
  v87 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    notificationRegistration = v2->_notificationRegistration;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    notificationRegistration = 0;
  }
  -[HMDNotificationRegistration addObserver:name:object:](notificationRegistration, "addObserver:name:object:", sel_handleProcessStateChange_, CFSTR("HMDProcessInfoStateDidChangeNotification"), 0);
  if (v2)
  {
    -[HMDNotificationRegistration addObserver:name:object:](v2->_notificationRegistration, "addObserver:name:object:", sel_backboardServicesRelaunched_, CFSTR("HMDBackboardServicesRelaunchNotification"), 0);
    dispatch_assert_queue_V2((dispatch_queue_t)v2->_workQueue);
    dispatch_assert_queue_V2((dispatch_queue_t)v2->_workQueue);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v2->_imageCacheDirectory, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    v63 = v6;
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v72;
      v10 = 0x1E0C99000uLL;
      do
      {
        v11 = 0;
        v65 = v8;
        do
        {
          if (*(_QWORD *)v72 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v11);
          objc_msgSend(*(id *)(v10 + 3432), "hmd_dateFromSnapshotFileName:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "timeIntervalSinceNow");
          if (v15 <= 86400.0)
          {
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v13, v12);
          }
          else
          {
            v16 = v9;
            v17 = v10;
            v18 = (void *)MEMORY[0x1D17BA0A0](v14);
            v19 = v2;
            v20 = v2;
            HMFGetOSLogHandle();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v80 = v22;
              v81 = 2112;
              v82 = v12;
              _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring snapshot file with date in the future: %@", buf, 0x16u);

              v6 = v63;
            }

            objc_autoreleasePoolPop(v18);
            v2 = v19;
            v10 = v17;
            v9 = v16;
            v8 = v65;
          }

          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
      }
      while (v8);
    }

    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = v2;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v80 = v26;
      v81 = 2112;
      v82 = v64;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Built the snapshot file dictionary: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(v64, "allValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sortedArrayUsingSelector:", sel_compare_);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "lastObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "hmd_snapshotFileName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = v24;
    if (v30)
    {
      v62 = v28;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v31 = v63;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, buf, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v68 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
            if ((objc_msgSend(v36, "isEqualToString:", v30) & 1) == 0)
            {
              v37 = (void *)MEMORY[0x1E0CB3940];
              v38 = v24[7];
              objc_msgSend(v37, "stringWithFormat:", CFSTR("%@/%@"), v38, v36);
              v39 = (HMDSnapshotFile *)objc_claimAutoreleasedReturnValue();

              v40 = (void *)MEMORY[0x1D17BA0A0]();
              v41 = v24;
              HMFGetOSLogHandle();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v75 = 138543618;
                v76 = v43;
                v77 = 2112;
                v78 = v39;
                _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Removing obsolete snapshot at path: %@", v75, 0x16u);

                v24 = v66;
              }

              objc_autoreleasePoolPop(v40);
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "removeItemAtPath:error:", v39, 0);

            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, buf, 16);
        }
        while (v33);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v24[7], v30);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = [HMDSnapshotFile alloc];
      v47 = v24[7];
      v28 = v62;
      objc_msgSend(v62, "lastObject");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[HMDSnapshotFile initWithImageDirectory:externalFilePath:snapshotTimestamp:](v46, "initWithImageDirectory:externalFilePath:snapshotTimestamp:", v47, v45, v48);

      v24 = v66;
      v50 = (void *)MEMORY[0x1D17BA0A0]();
      v51 = v66;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v75 = 138543618;
        v76 = v53;
        v77 = 2112;
        v78 = v49;
        _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Found the most recent snapshot %@", v75, 0x16u);

      }
      objc_autoreleasePoolPop(v50);

    }
    else
    {
      v49 = 0;
    }

    if (v49)
    {
      v54 = (void *)MEMORY[0x1D17BA0A0]((id)objc_msgSend(v24, "createSlotForSnapshotFile:requestMessages:shouldNotifyClients:", v49, MEMORY[0x1E0C9AA60], 0));
      v55 = v24;
      HMFGetOSLogHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        Property = objc_getProperty(v55, v58, 72, 1);
        *(_DWORD *)v83 = 138543618;
        v84 = v57;
        v85 = 2112;
        v86 = Property;
        _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_INFO, "%{public}@Created the most recent snapshot %@", v83, 0x16u);

      }
    }
    else
    {
      v54 = (void *)MEMORY[0x1D17BA0A0]();
      v60 = v24;
      HMFGetOSLogHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v83 = 138543362;
        v84 = v61;
        _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_INFO, "%{public}@No recent snapshot found", v83, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v54);
  }
  else
  {
    objc_msgSend(0, "addObserver:name:object:", sel_backboardServicesRelaunched_, CFSTR("HMDBackboardServicesRelaunchNotification"), 0);
  }
}

- (void)handleProcessStateChange:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HMDSnapshotSlotManager_handleProcessStateChange___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)backboardServicesRelaunched:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMDSnapshotSlotManager_backboardServicesRelaunched___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)handleFillSnapshotSlot:(id)a3
{
  id v4;
  NSObject *workQueue;
  void *v6;
  void *v7;
  HMDSnapshotSlotManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMapTable *filledSnapshotSlotIdentifiersByProcess;
  void *v14;
  NSMapTable *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDSnapshotSlotManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDSnapshotSlotManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  dispatch_assert_queue_V2(workQueue);
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB9C50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v10;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Filling snapshot with slot identifier %@", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v4, "proxyConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (self)
      filledSnapshotSlotIdentifiersByProcess = v8->_filledSnapshotSlotIdentifiersByProcess;
    else
      filledSnapshotSlotIdentifiersByProcess = 0;
    -[NSMapTable objectForKey:](filledSnapshotSlotIdentifiersByProcess, "objectForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        v15 = v8->_filledSnapshotSlotIdentifiersByProcess;
      else
        v15 = 0;
      -[NSMapTable setObject:forKey:](v15, "setObject:forKey:", v14, v12);
    }
    objc_msgSend(v14, "addObject:", v6);
    -[HMDSnapshotSlotManager _snapshotFileWithSlotIdentifier:]((id *)&v8->super.super.isa, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "fillSlot");
      objc_msgSend(v4, "respondWithSuccess");
    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = v8;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v25;
        v29 = 2112;
        v30 = v6;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot fill snapshot with slot identifier %@ because it no longer exist", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v26);

    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v8;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v21;
      v29 = 2112;
      v30 = v4;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot fill snapshot for message without process info: %@", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v14);
  }

}

- (void)handleReleaseSnapshot:(id)a3
{
  id v4;
  NSObject *workQueue;
  uint64_t v6;
  void *v7;
  HMDSnapshotSlotManager *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int *v12;
  NSMapTable *snapshotFilesByAssociatedProcessInfo;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  HMDSnapshotSlotManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDSnapshotSlotManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  dispatch_assert_queue_V2(workQueue);
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB9C50]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v40 = (void *)v6;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v11;
      v48 = 2112;
      v49 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Releasing snapshot file with slot identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v12 = &OBJC_IVAR___HMDUnpairedHAPAccessoryPairingInformation__setupCodeProviderCompletionHandler;
    v38 = v4;
    if (self)
      snapshotFilesByAssociatedProcessInfo = v8->_snapshotFilesByAssociatedProcessInfo;
    else
      snapshotFilesByAssociatedProcessInfo = 0;
    v14 = (void *)-[NSMapTable copy](snapshotFilesByAssociatedProcessInfo, "copy");
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v42;
      obj = v14;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v42 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v18);
          v20 = v12;
          if (self)
            v21 = *(Class *)((char *)&v8->super.super.isa + v12[834]);
          else
            v21 = 0;
          v22 = v21;
          objc_msgSend(v22, "objectForKey:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "slotIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToNumber:", v40);

          if (v25)
          {
            v32 = (void *)MEMORY[0x1D17BA0A0]();
            v33 = v8;
            HMFGetOSLogHandle();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v47 = v35;
              v48 = 2112;
              v49 = (uint64_t)v23;
              _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Releasing snapshot file: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v32);
            v4 = v38;
            v31 = obj;
            if (self)
              v36 = *(Class *)((char *)&v33->super.super.isa + v20[834]);
            else
              v36 = 0;
            objc_msgSend(v36, "removeObjectForKey:", v19);
            objc_msgSend(v38, "respondWithSuccess");

            goto LABEL_32;
          }

          ++v18;
          v12 = v20;
        }
        while (v16 != v18);
        v14 = obj;
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        v16 = v26;
        if (v26)
          continue;
        break;
      }
    }

    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = v8;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v30;
      v48 = 2112;
      v49 = (uint64_t)v40;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find snapshot file to release with slot identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v38;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v37;
      v48 = 2112;
      v49 = (uint64_t)v4;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot find slot identifier in release snapshot message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "respondWithError:", v31);
LABEL_32:

}

- (id)createSlotForSnapshotFile:(id)a3 requestMessages:(id)a4 shouldNotifyClients:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *workQueue;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  HMDSnapshotSlotManager *v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a4;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  dispatch_assert_queue_V2(workQueue);
  v11 = (void *)MEMORY[0x1E0D28540];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__HMDSnapshotSlotManager_createSlotForSnapshotFile_requestMessages_shouldNotifyClients___block_invoke;
  v16[3] = &unk_1E89BCF10;
  v17 = v9;
  v18 = self;
  v19 = v8;
  v20 = a5;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v11, "activityWithName:block:", CFSTR("Render Snapshot"), v16);
  encodedSnapshotFile(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSDictionary)encodedMostRecentSnapshot
{
  if (self)
    self = (HMDSnapshotSlotManager *)objc_getProperty(self, a2, 72, 1);
  return (NSDictionary *)encodedSnapshotFile(self);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_mostRecentSnapshot, 0);
  objc_storeStrong((id *)&self->_notificationRegistration, 0);
  objc_storeStrong((id *)&self->_imageCacheDirectory, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_snapshotFilesByAssociatedProcessInfo, 0);
  objc_storeStrong((id *)&self->_filledSnapshotSlotIdentifiersByProcess, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

void __88__HMDSnapshotSlotManager_createSlotForSnapshotFile_requestMessages_shouldNotifyClients___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  dispatch_queue_t *v27;
  int v28;
  id v29;
  id v30;
  const char *v31;
  const char *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  dispatch_queue_t *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  dispatch_queue_t *v41;
  NSObject *v42;
  void *v43;
  SEL v44;
  NSObject *v45;
  __int128 v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  _BYTE buf[24];
  void *v54;
  id v55;
  dispatch_queue_t *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  v4 = &OBJC_IVAR___HMDUnpairedHAPAccessoryPairingInformation__setupCodeProviderCompletionHandler;
  if (v2)
  {
    v5 = v2;
    v6 = *(_QWORD *)v49;
    *(_QWORD *)&v3 = 138543618;
    v46 = v3;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v49 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v7);
        objc_msgSend(v8, "proxyConnection", v46);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "processInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = (void *)MEMORY[0x1D17BA0A0]();
        v12 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v10)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v15;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v10;
            *(_WORD *)&buf[22] = 2112;
            v54 = v16;
            _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Associating process info %@ with snapshot file: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v11);
          v17 = *(_QWORD *)(a1 + 40);
          if (v17)
            v18 = *(void **)(v17 + v4[834]);
          else
            v18 = 0;
          objc_msgSend(v18, "setObject:forKey:", *(_QWORD *)(a1 + 48), v10);
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v46;
            *(_QWORD *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v8;
            _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot associate snapshot file for message without process info: %@", buf, 0x16u);

            v4 = &OBJC_IVAR___HMDUnpairedHAPAccessoryPairingInformation__setupCodeProviderCompletionHandler;
          }

          objc_autoreleasePoolPop(v11);
        }

        ++v7;
      }
      while (v5 != v7);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      v5 = v20;
    }
    while (v20);
  }

  v21 = (void *)MEMORY[0x1D17BA0A0]();
  v22 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    v26 = *(_QWORD *)(a1 + 40);
    if (v26)
      v26 = *(_QWORD *)(v26 + 24);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v26;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Current snapshot-application map: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  objc_msgSend(*(id *)(a1 + 48), "updateSlotIdentifier");
  v27 = *(dispatch_queue_t **)(a1 + 40);
  v28 = *(unsigned __int8 *)(a1 + 56);
  v29 = *(id *)(a1 + 48);
  if (v27)
  {
    dispatch_assert_queue_V2(v27[5]);
    v30 = v29;
    dispatch_assert_queue_V2(v27[5]);
    if (!isMostRecentSnapshotValid(v30))
    {
      v36 = (void *)MEMORY[0x1D17BA0A0]();
      v37 = v27;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v39;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v30;
        _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Not updating most recent snapshot with invalid snaphot: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v36);
      goto LABEL_36;
    }
    if (objc_getProperty(v27, v31, 72, 1))
    {
      objc_msgSend(objc_getProperty(v27, v32, 72, 1), "snapshotTimestamp");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "snapshotTimestamp");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "compare:", v34);

      if (v35 == 1)
        goto LABEL_37;
    }
    else
    {

    }
    v40 = (void *)MEMORY[0x1D17BA0A0]();
    v41 = v27;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v30;
      _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Updating most recent snapshot to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    objc_setProperty_atomic(v41, v44, v30, 72);
    if (v28)
    {
      v45 = v41[5];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __72__HMDSnapshotSlotManager__updateMostRecentSnapshot_shouldNotifyClients___block_invoke;
      v54 = &unk_1E89C2328;
      v55 = v30;
      v56 = v41;
      dispatch_async(v45, buf);
      v30 = v55;
LABEL_36:

    }
  }
LABEL_37:

}

void __72__HMDSnapshotSlotManager__updateMostRecentSnapshot_shouldNotifyClients___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  HMDHomeManagerXPCMessageSendPolicy *v7;
  uint64_t v8;
  void *v9;
  id v10;

  encodedSnapshotFile(*(void **)(a1 + 32));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithTarget:", v3);

  v5 = objc_alloc(MEMORY[0x1E0D285F8]);
  v6 = (void *)objc_msgSend(v5, "initWithName:destination:payload:", *MEMORY[0x1E0CB8628], v4, v10);
  v7 = -[HMDHomeManagerXPCMessageSendPolicy initWithEntitlements:options:active:]([HMDHomeManagerXPCMessageSendPolicy alloc], "initWithEntitlements:options:active:", 1, 513, 1);
  objc_msgSend(v6, "setSendPolicy:", v7);
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    v9 = *(void **)(v8 + 48);
  else
    v9 = 0;
  objc_msgSend(v9, "sendMessage:", v6);

}

- (id)_snapshotFileWithSlotIdentifier:(id *)a1
{
  const char *v3;
  id v4;
  void *v5;
  int v6;
  const char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (!a1)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_15;
  }
  objc_msgSend(objc_getProperty(a1, v3, 72, 1), "slotIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToNumber:", v4);

  if (!v6)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(a1[3], "objectEnumerator", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "slotIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToNumber:", v4);

          if ((v16 & 1) != 0)
          {
            v8 = v14;

            goto LABEL_15;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }

    goto LABEL_13;
  }
  v8 = objc_getProperty(a1, v7, 72, 1);
LABEL_15:

  return v8;
}

void __54__HMDSnapshotSlotManager_backboardServicesRelaunched___block_invoke(uint64_t a1)
{
  HMDSnapshotFile *v2;
  _QWORD *v3;
  const char *v4;
  _QWORD *v5;
  id Property;
  const char *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  HMDSnapshotFile *v12;

  v2 = [HMDSnapshotFile alloc];
  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[7];
  v5 = v3;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v4, 72, 1);
  objc_msgSend(Property, "filePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(id *)(a1 + 32);
  if (v9)
    v9 = objc_getProperty(v9, v7, 72, 1);
  objc_msgSend(v9, "snapshotTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDSnapshotFile initWithImageDirectory:filePath:snapshotTimestamp:](v2, "initWithImageDirectory:filePath:snapshotTimestamp:", v5, v8, v10);

  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "createSlotForSnapshotFile:requestMessages:shouldNotifyClients:", v12, MEMORY[0x1E0C9AA60], 1);
}

void __51__HMDSnapshotSlotManager_handleProcessStateChange___block_invoke(uint64_t a1)
{
  dispatch_queue_t *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  id *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _BYTE v29[24];
  void *v30;
  id *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v1 = *(dispatch_queue_t **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(v1[5]);
    objc_msgSend(v2, "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    objc_msgSend(v2, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v5)
      v10 = v9 == 0;
    else
      v10 = 1;
    if (!v10)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = v1;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "shortDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v29 = 138543874;
        *(_QWORD *)&v29[4] = v14;
        *(_WORD *)&v29[12] = 2112;
        *(_QWORD *)&v29[14] = v15;
        *(_WORD *)&v29[22] = 2112;
        v30 = v9;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Received notification that process info state changed: %@, stateNumber: %@", v29, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      v16 = objc_msgSend(v9, "unsignedIntegerValue");
      if (v16)
      {
        v17 = v16;
        v18 = v12[3];
        objc_msgSend(v18, "objectForKey:", v5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = (void *)MEMORY[0x1D17BA0A0]();
          v21 = v12;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v29 = 138543874;
            *(_QWORD *)&v29[4] = v23;
            *(_WORD *)&v29[12] = 2112;
            *(_QWORD *)&v29[14] = v5;
            *(_WORD *)&v29[22] = 2112;
            v30 = v19;
            _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Removing snapshot file associated with non-foreground app %@: %@", v29, 0x20u);

          }
          objc_autoreleasePoolPop(v20);
          objc_msgSend(v21[3], "removeObjectForKey:", v5);
        }

        if (v17 == 4)
        {
          v24 = (void *)MEMORY[0x1D17BA0A0]();
          v25 = v12;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v29 = 138543618;
            *(_QWORD *)&v29[4] = v27;
            *(_WORD *)&v29[12] = 2112;
            *(_QWORD *)&v29[14] = v5;
            _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Clearing any of the filled snapshot slots for terminated process: %@", v29, 0x16u);

          }
          objc_autoreleasePoolPop(v24);
          objc_msgSend(v25[2], "objectForKey:", v5);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25[2], "removeObjectForKey:", v5);
          *(_QWORD *)v29 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v29[8] = 3221225472;
          *(_QWORD *)&v29[16] = __52__HMDSnapshotSlotManager__handleProcessStateChange___block_invoke;
          v30 = &unk_1E89BBF48;
          v31 = v25;
          objc_msgSend(v28, "na_each:", v29);

        }
      }
    }

  }
}

void __52__HMDSnapshotSlotManager__handleProcessStateChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[HMDSnapshotSlotManager _snapshotFileWithSlotIdentifier:](*(id **)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = *(_QWORD **)(a1 + 32);
    if (v5)
      v5 = (_QWORD *)v5[2];
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
          v12 = *(_QWORD *)(a1 + 32);
          if (v12)
            v13 = *(void **)(v12 + 16);
          else
            v13 = 0;
          objc_msgSend(v13, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10), (_QWORD)v24);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "containsObject:", v3))
          {
            v20 = (void *)MEMORY[0x1D17BA0A0]();
            v21 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v29 = v23;
              v30 = 2112;
              v31 = v3;
              v32 = 2112;
              v33 = v11;
              _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Cannot clear snapshot slot identifier %@ because is still in use by %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v20);

            goto LABEL_22;
          }

          ++v10;
        }
        while (v8 != v10);
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        v8 = v15;
        if (v15)
          continue;
        break;
      }
    }

    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v19;
      v30 = 2112;
      v31 = v4;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Clearing snapshot slot for snapshot %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v4, "clearSlot");
  }
LABEL_22:

}

void __37__HMDSnapshotSlotManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_160043;
  logCategory__hmf_once_v1_160043 = v0;

}

@end
