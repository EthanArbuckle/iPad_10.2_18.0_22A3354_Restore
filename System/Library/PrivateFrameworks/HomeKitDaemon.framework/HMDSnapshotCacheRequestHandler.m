@implementation HMDSnapshotCacheRequestHandler

- (HMDSnapshotCacheRequestHandler)initWithWorkQueue:(id)a3 logID:(id)a4
{
  id v7;
  id v8;
  HMDSnapshotCacheRequestHandler *v9;
  HMDSnapshotCacheRequestHandler *v10;
  uint64_t v11;
  NSMutableDictionary *snapshotCacheMap;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDSnapshotCacheRequestHandler;
  v9 = -[HMDSnapshotCacheRequestHandler init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeStrong((id *)&v10->_logIdentifier, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    snapshotCacheMap = v10->_snapshotCacheMap;
    v10->_snapshotCacheMap = (NSMutableDictionary *)v11;

  }
  return v10;
}

- (void)addSnapshotFileToCache:(id)a3
{
  id v4;
  HMDSnapshotCacheEntry *v5;
  void *v6;
  HMDSnapshotCacheRequestHandler *v7;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *snapshotCacheMap;
  int v11;
  void *v12;
  __int16 v13;
  HMDSnapshotCacheEntry *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDSnapshotCacheEntry initWithSnapshotCharacteristicEventUUID:snapshotFile:timer:]([HMDSnapshotCacheEntry alloc], "initWithSnapshotCharacteristicEventUUID:snapshotFile:timer:", v4, 0, 0);
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Added Cache Entry %@ for snapshotCharacteristicEventUUID: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  if (v7)
    snapshotCacheMap = v7->_snapshotCacheMap;
  else
    snapshotCacheMap = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](snapshotCacheMap, "setObject:forKeyedSubscript:", v5, v4);

}

- (void)removeSnapshotFileToCache:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *snapshotCacheMap;
  void *v9;
  void *v10;
  void *v11;
  HMDSnapshotCacheRequestHandler *v12;
  NSObject *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  HMDSnapshotCacheRequestHandler *v17;
  NSObject *v18;
  void *v19;
  NSMutableDictionary *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self)
    snapshotCacheMap = self->_snapshotCacheMap;
  else
    snapshotCacheMap = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](snapshotCacheMap, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snapshotRequestCompletion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v14;
      v23 = 2112;
      v24 = v6;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Snapshot request completion is already set for %@, calling completion with error %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v9, "snapshotRequestCompletion");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v15)[2](v15, 0, v7);

  }
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v19;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Removing Cache Entry for snapshotCharacteristicEventUUID: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  if (self)
    v20 = v17->_snapshotCacheMap;
  else
    v20 = 0;
  -[NSMutableDictionary removeObjectForKey:](v20, "removeObjectForKey:", v6);

}

- (void)setSnapshotFileToCache:(id)a3 snapshotCharacteristicEventUUID:(id)a4
{
  HMDSnapshotCacheEntry *v6;
  HMDSnapshotCacheEntry *v7;
  NSMutableDictionary *snapshotCacheMap;
  void *v9;
  void *v10;
  void *v11;
  HMDSnapshotCacheRequestHandler *v12;
  NSObject *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  void *v17;
  OS_dispatch_queue *workQueue;
  HMDSnapshotCacheEntry *v19;
  void *v20;
  HMDSnapshotCacheRequestHandler *v21;
  NSObject *v22;
  void *v23;
  NSMutableDictionary *v24;
  int v25;
  void *v26;
  __int16 v27;
  HMDSnapshotCacheEntry *v28;
  __int16 v29;
  HMDSnapshotCacheEntry *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = (HMDSnapshotCacheEntry *)a3;
  v7 = (HMDSnapshotCacheEntry *)a4;
  if (self)
    snapshotCacheMap = self->_snapshotCacheMap;
  else
    snapshotCacheMap = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](snapshotCacheMap, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snapshotRequestCompletion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v14;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Snapshot request completion is already set for %@, calling completion with %@", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v9, "snapshotRequestCompletion");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, HMDSnapshotCacheEntry *, _QWORD))v15)[2](v15, v6, 0);

  }
  v16 = objc_alloc(MEMORY[0x24BE3F298]);
  v17 = (void *)objc_msgSend(v16, "initWithTimeInterval:options:", 1, *(double *)&snapshotCacheValidPeriod);
  objc_msgSend(v17, "setDelegate:", self);
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  objc_msgSend(v17, "setDelegateQueue:", workQueue);
  v19 = -[HMDSnapshotCacheEntry initWithSnapshotCharacteristicEventUUID:snapshotFile:timer:]([HMDSnapshotCacheEntry alloc], "initWithSnapshotCharacteristicEventUUID:snapshotFile:timer:", v7, v6, v17);

  v20 = (void *)MEMORY[0x227676638]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v23;
    v27 = 2112;
    v28 = v19;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Setting Cache Entry %@ for snapshotCharacteristicEventUUID: %@", (uint8_t *)&v25, 0x20u);

  }
  objc_autoreleasePoolPop(v20);
  if (self)
    v24 = v21->_snapshotCacheMap;
  else
    v24 = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v19, v7);
  objc_msgSend(v17, "resume");

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSMutableDictionary *snapshotCacheMap;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  HMDSnapshotCacheRequestHandler *v17;
  NSObject *v18;
  void *v19;
  NSMutableDictionary *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    snapshotCacheMap = self->_snapshotCacheMap;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    snapshotCacheMap = 0;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
  }
  v6 = (void *)-[NSMutableDictionary copy](snapshotCacheMap, "copy", (_QWORD)v21);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        if (self)
          v12 = self->_snapshotCacheMap;
        else
          v12 = 0;
        -[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timer");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 == v4)
        {
          v16 = (void *)MEMORY[0x227676638]();
          v17 = self;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v26 = v19;
            v27 = 2112;
            v28 = v11;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Cache entry for %@ has expired", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v16);
          if (self)
            v20 = v17->_snapshotCacheMap;
          else
            v20 = 0;
          -[NSMutableDictionary removeObjectForKey:](v20, "removeObjectForKey:", v11);

          goto LABEL_21;
        }

        ++v10;
      }
      while (v8 != v10);
      v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      v8 = v15;
      if (v15)
        continue;
      break;
    }
  }
LABEL_21:

}

- (void)requestSnapshot:(id)a3 streamingTierType:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__HMDSnapshotCacheRequestHandler_requestSnapshot_streamingTierType_completionHandler___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(workQueue, block);

}

- (BOOL)isSnapshotPresentForCharacteristicEventUUID:(id)a3
{
  id v4;
  NSMutableDictionary *snapshotCacheMap;
  void *v6;
  void *v7;
  void *v8;
  HMDSnapshotCacheRequestHandler *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    snapshotCacheMap = self->_snapshotCacheMap;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    snapshotCacheMap = 0;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](snapshotCacheMap, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshotFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Snapshot file is present in cache for %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

  return v7 != 0;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_snapshotCacheMap, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __86__HMDSnapshotCacheRequestHandler_requestSnapshot_streamingTierType_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[2];
  v3 = *(void **)(a1 + 40);
  v4 = v2;
  objc_msgSend(v3, "snapshotCharacteristicEventUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 40);
      v23 = 138543618;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Did not find the snapshot cache file for %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v21 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v15);
    goto LABEL_11;
  }
  objc_msgSend(v6, "snapshotFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      v23 = 138543618;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Found the snapshot cache file for %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v6, "snapshotFile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, 0);
LABEL_11:

    goto LABEL_15;
  }
  if (v11)
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v22;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Found the snapshot cache file placeholder, saving the completion handler", (uint8_t *)&v23, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "setSnapshotRequestCompletion:", *(_QWORD *)(a1 + 48));
LABEL_15:

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_233787 != -1)
    dispatch_once(&logCategory__hmf_once_t0_233787, &__block_literal_global_233788);
  return (id)logCategory__hmf_once_v1_233789;
}

void __45__HMDSnapshotCacheRequestHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_233789;
  logCategory__hmf_once_v1_233789 = v0;

}

@end
