@implementation HMDPairedSync

- (HMDPairedSync)initWithDelegate:(id)a3 queue:(id)a4
{
  id v5;
  HMDPairedSync *v6;
  HMDPairedSync *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  uint64_t v13;
  PSYSyncCoordinator *coordinator;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMDPairedSync;
  v6 = -[HMDPairedSync init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v5);
    HMDispatchQueueNameString();
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v9, v10);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v11;

    v7->_currentOperationCount = 0;
    objc_msgSend(MEMORY[0x1E0D65240], "syncCoordinatorWithServiceName:", CFSTR("com.apple.pairedsync.homekit"));
    v13 = objc_claimAutoreleasedReturnValue();
    coordinator = v7->_coordinator;
    v7->_coordinator = (PSYSyncCoordinator *)v13;

    -[PSYSyncCoordinator setDelegate:queue:](v7->_coordinator, "setDelegate:queue:", v7, v7->_workQueue);
  }

  return v7;
}

- (id)restrictionAsString:(unint64_t)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("PSYSyncRestrictionNone");
  if (a3 == 1)
  {
    v3 = CFSTR("PSYSyncRestrictionLimitPush");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown restriction state: %tu"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)needToSync
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDPairedSync workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__HMDPairedSync_needToSync__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_callStartSync
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[HMDPairedSync delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Calling the clients to start the sync", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "pairedSyncDidStart:", self);
  }

}

- (void)syncComplete
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDPairedSync workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__HMDPairedSync_syncComplete__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)syncPartiallyComplete
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDPairedSync workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HMDPairedSync_syncPartiallyComplete__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Received an update to being-sync-session to watch", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDPairedSync _callStartSync](self, "_callStartSync");

}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Received delegate call syncCoordinator:didInvalidateSyncSession", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v7);

}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPairedSync restrictionAsString:](self, "restrictionAsString:", objc_msgSend(v4, "syncRestriction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Sync restriction is changing to %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (!objc_msgSend(v4, "syncRestriction"))
    -[HMDPairedSync _callStartSync](self, "_callStartSync");

}

- (HMDPairedSyncDelegate)delegate
{
  return (HMDPairedSyncDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (unint64_t)currentOperationCount
{
  return self->_currentOperationCount;
}

- (void)setCurrentOperationCount:(unint64_t)a3
{
  self->_currentOperationCount = a3;
}

- (PSYSyncCoordinator)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __38__HMDPairedSync_syncPartiallyComplete__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "currentOperationCount");
  if (v2)
    v2 = objc_msgSend(*(id *)(a1 + 32), "setCurrentOperationCount:", objc_msgSend(*(id *)(a1 + 32), "currentOperationCount") - 1);
  v3 = (void *)MEMORY[0x1D17BA0A0](v2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "currentOperationCount");
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Partially complete, Current operation count is %tu", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
}

void __29__HMDPairedSync_syncComplete__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "currentOperationCount"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "setCurrentOperationCount:", objc_msgSend(*(id *)(a1 + 32), "currentOperationCount") - 1);
  }
  else
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_ERROR, "%{public}@Current operation count is already 0, cannot decrement further", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  v6 = (void *)MEMORY[0x1D17BA0A0](v2);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "currentOperationCount");
    v15 = 138543618;
    v16 = v8;
    v17 = 2048;
    v18 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Current operation count is %tu", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (!objc_msgSend(*(id *)(a1 + 32), "currentOperationCount"))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Informing sync coordinator that sync is complete", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "coordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeSyncSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "syncDidComplete");

  }
}

void __27__HMDPairedSync_needToSync__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCurrentOperationCount:", objc_msgSend(*(id *)(a1 + 32), "currentOperationCount") + 1);
  objc_msgSend(*(id *)(a1 + 32), "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "syncRestriction");

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "restrictionAsString:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "currentOperationCount");
    v12 = 138543874;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    v16 = 2050;
    v17 = v8;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Current sync restriction state: %{public}@, operation count: %{public}tu", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  if (v3)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Need to wait for the begin sync to happen for HomeKit.", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_callStartSync");
  }
}

@end
