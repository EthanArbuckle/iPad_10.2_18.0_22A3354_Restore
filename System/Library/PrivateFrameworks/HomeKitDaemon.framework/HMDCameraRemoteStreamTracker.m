@implementation HMDCameraRemoteStreamTracker

- (HMDCameraRemoteStreamTracker)init
{
  HMDCameraRemoteStreamTracker *v2;
  uint64_t v3;
  NSMutableSet *currentStreamIdentifiers;
  id v5;
  const char *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMDCameraRemoteStreamTracker;
  v2 = -[HMDCameraRemoteStreamTracker init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    currentStreamIdentifiers = v2->_currentStreamIdentifiers;
    v2->_currentStreamIdentifiers = (NSMutableSet *)v3;

    HMDispatchQueueNameString();
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(v6, v7);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

- (BOOL)startTrackingStreamSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[HMDCameraRemoteStreamTracker workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HMDCameraRemoteStreamTracker_startTrackingStreamSession___block_invoke;
  block[3] = &unk_24E79C0A8;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)stopTrackingStreamWithSessionID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraRemoteStreamTracker workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMDCameraRemoteStreamTracker_stopTrackingStreamWithSessionID___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableSet)currentStreamIdentifiers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStreamIdentifiers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __64__HMDCameraRemoteStreamTracker_stopTrackingStreamWithSessionID___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "currentStreamIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@No longer tracking stream with session ID: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "currentStreamIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Cannot find stream to stop tracking: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
}

void __59__HMDCameraRemoteStreamTracker_startTrackingStreamSession___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  _HMDCameraRemoteStreamTrackerAssertion *v5;
  uint64_t v6;
  void *v7;
  _HMDCameraRemoteStreamTrackerAssertion *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "currentStreamIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  v4 = maximumSimultaneousRemoteStreams;

  if (v3 >= v4)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "currentStreamIdentifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v20;
      v25 = 2112;
      v26 = v21;
      v27 = 2112;
      v28 = (uint64_t)v22;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Cannot start tracking stream session: %@. Already tracking maximum number of stream sessions: %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }
  else
  {
    v5 = [_HMDCameraRemoteStreamTrackerAssertion alloc];
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_HMDCameraRemoteStreamTrackerAssertion initWithStreamTracker:streamIdentifier:](v5, "initWithStreamTracker:streamIdentifier:", v6, v7);

    objc_msgSend(*(id *)(a1 + 32), "currentStreamIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    objc_setAssociatedObject(*(id *)(a1 + 40), "HMD.StreamTrackerAssertion", v8, (void *)1);
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "currentStreamIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      v27 = 2048;
      v28 = objc_msgSend(v16, "count");
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Started tracking stream session: %@. Total count is now %lu", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

  }
}

+ (HMDCameraRemoteStreamTracker)sharedTracker
{
  if (sharedTracker_onceToken_139736 != -1)
    dispatch_once(&sharedTracker_onceToken_139736, &__block_literal_global_139737);
  return (HMDCameraRemoteStreamTracker *)(id)streamTracker;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_139731 != -1)
    dispatch_once(&logCategory__hmf_once_t4_139731, &__block_literal_global_4_139732);
  return (id)logCategory__hmf_once_v5_139733;
}

void __43__HMDCameraRemoteStreamTracker_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_139733;
  logCategory__hmf_once_v5_139733 = v0;

}

void __45__HMDCameraRemoteStreamTracker_sharedTracker__block_invoke()
{
  HMDCameraRemoteStreamTracker *v0;
  void *v1;

  v0 = objc_alloc_init(HMDCameraRemoteStreamTracker);
  v1 = (void *)streamTracker;
  streamTracker = (uint64_t)v0;

}

@end
