@implementation HMBPrivateCloudZoneRebuilder

- (HMBPrivateCloudZoneRebuilder)initWithCloudZone:(id)a3
{
  id v4;
  HMBPrivateCloudZoneRebuilder *v5;
  HMBPrivateCloudZoneRebuilder *v6;
  HMBCloudZoneRebuilderStatus *v7;
  HMBCloudZoneRebuilderStatus *rebuilderStatus;
  NAFuture *v9;
  NAFuture *rebuildCompleteFuture;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMBPrivateCloudZoneRebuilder;
  v5 = -[HMBPrivateCloudZoneRebuilder init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cloudZone, v4);
    v7 = -[HMBCloudZoneRebuilderStatus initWithState:message:]([HMBCloudZoneRebuilderStatus alloc], "initWithState:message:", 0, CFSTR("Rebuilder has not been started up yet."));
    rebuilderStatus = v6->_rebuilderStatus;
    v6->_rebuilderStatus = v7;

    v9 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    rebuildCompleteFuture = v6->_rebuildCompleteFuture;
    v6->_rebuildCompleteFuture = v9;

  }
  return v6;
}

- (id)zoneStartUp
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  id v15;
  id location;

  -[HMBPrivateCloudZoneRebuilder cloudZone](self, "cloudZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x1E0D519C0];
    v14 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v15, &location);
    objc_msgSend(v3, "operationScheduler", v14, 3221225472, __43__HMBPrivateCloudZoneRebuilder_zoneStartUp__block_invoke, &unk_1E8932388);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lazyFutureWithBlock:scheduler:", &v14, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    __transitionToState(self, (void *)7, CFSTR("Not starting up as a mirror. Ignoring rebuild steps."), v5, v6, v7, v8, v9, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)handleIdentityLost
{
  os_unfair_lock_s *p_propertyLock;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  HMBPrivateCloudZoneRebuilder *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _BYTE v17[12];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBPrivateCloudZoneRebuilder rebuilderStatus](self, "rebuilderStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rebuildState");

  os_unfair_lock_unlock(p_propertyLock);
  if (v5 <= 7 && ((1 << v5) & 0x83) != 0)
  {
    v11 = __transitionToState(self, (void *)1, CFSTR("Received notification that zone has lost keys."), v6, v7, v8, v9, v10, *(uint64_t *)v17);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17B6230]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMBCloudZoneRebuilderStatus rebuilderStateString:](HMBCloudZoneRebuilderStatus, "rebuilderStateString:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v17 = 138543618;
      *(_QWORD *)&v17[4] = v15;
      v18 = 2112;
      v19 = v16;
      _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Not transitioning to Lost Key state, already in an active rebuild state (%@).", v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }
}

- (void)rebuild
{
  os_unfair_lock_s *p_propertyLock;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  HMBPrivateCloudZoneRebuilder *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _BYTE v17[12];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBPrivateCloudZoneRebuilder rebuilderStatus](self, "rebuilderStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rebuildState");

  os_unfair_lock_unlock(p_propertyLock);
  if (v5 <= 7 && ((1 << v5) & 0x83) != 0)
  {
    v11 = __transitionToState(self, (void *)4, CFSTR("Attempting to acquire lock on zone."), v6, v7, v8, v9, v10, *(uint64_t *)v17);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17B6230]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMBCloudZoneRebuilderStatus rebuilderStateString:](HMBCloudZoneRebuilderStatus, "rebuilderStateString:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v17 = 138543618;
      *(_QWORD *)&v17[4] = v15;
      v18 = 2112;
      v19 = v16;
      _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Received a request to begin rebuild but we are already in: %@.", v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }
}

- (BOOL)isZoneRebuildInProgress
{
  void *v2;
  char v3;

  -[HMBPrivateCloudZoneRebuilder rebuildCompleteFuture](self, "rebuildCompleteFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFinished") ^ 1;

  return v3;
}

- (void)handleZoneChanged
{
  os_unfair_lock_s *p_propertyLock;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  HMBPrivateCloudZoneRebuilder *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[6];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBPrivateCloudZoneRebuilder rebuilderStatus](self, "rebuilderStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rebuildState");

  os_unfair_lock_unlock(p_propertyLock);
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[HMBPrivateCloudZoneRebuilder uploadMonitorWatchdogTimer](self, "uploadMonitorWatchdogTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", 0);

    os_unfair_lock_lock_with_options();
    -[HMBPrivateCloudZoneRebuilder setUploadMonitorWatchdogTimer:](self, "setUploadMonitorWatchdogTimer:", 0);
    os_unfair_lock_unlock(p_propertyLock);
    __fetchSentinelModel(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __49__HMBPrivateCloudZoneRebuilder_handleZoneChanged__block_invoke;
    v17[3] = &unk_1E8931D88;
    v17[4] = self;
    v17[5] = v5;
    v9 = (id)objc_msgSend(v7, "addFailureBlock:", v17);
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __49__HMBPrivateCloudZoneRebuilder_handleZoneChanged__block_invoke_15;
    v16[3] = &unk_1E8931DB0;
    v16[4] = self;
    v16[5] = v5;
    v10 = (id)objc_msgSend(v7, "addSuccessBlock:", v16);

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17B6230]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMBCloudZoneRebuilderStatus rebuilderStateString:](HMBCloudZoneRebuilderStatus, "rebuilderStateString:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly got a CKNotification when in state %@ (ignoring)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HMBPrivateCloudZoneRebuilder *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _BYTE v20[12];
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMBPrivateCloudZoneRebuilder uploadMonitorWatchdogTimer](self, "uploadMonitorWatchdogTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6 = (void *)MEMORY[0x1D17B6230]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543362;
      *(_QWORD *)&v20[4] = v9;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly got a watchdog fire event from an unexpected timer.", v20, 0xCu);

    }
LABEL_9:

    objc_autoreleasePoolPop(v6);
    goto LABEL_10;
  }
  os_unfair_lock_lock_with_options();
  -[HMBPrivateCloudZoneRebuilder rebuilderStatus](self, "rebuilderStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rebuildState");

  -[HMBPrivateCloudZoneRebuilder setUploadMonitorWatchdogTimer:](self, "setUploadMonitorWatchdogTimer:", 0);
  os_unfair_lock_unlock(&self->_propertyLock);
  if (v11 != 5)
  {
    v6 = (void *)MEMORY[0x1D17B6230]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMBCloudZoneRebuilderStatus rebuilderStateString:](HMBCloudZoneRebuilderStatus, "rebuilderStateString:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543618;
      *(_QWORD *)&v20[4] = v18;
      v21 = 2112;
      v22 = v19;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly got a watchdog fire event in state %@", v20, 0x16u);

    }
    goto LABEL_9;
  }
  v17 = __transitionToState(self, (void *)2, CFSTR("Watchdog fired while monitoring the upload."), v12, v13, v14, v15, v16, *(uint64_t *)v20);
LABEL_10:

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMBPrivateCloudZoneRebuilder cloudZone](self, "cloudZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMBCloudZoneRebuilderStatus)rebuilderStatus
{
  return (HMBCloudZoneRebuilderStatus *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRebuilderStatus:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NAFuture)rebuildCompleteFuture
{
  return self->_rebuildCompleteFuture;
}

- (void)setRebuildCompleteFuture:(id)a3
{
  objc_storeStrong((id *)&self->_rebuildCompleteFuture, a3);
}

- (CKRecord)previousSentinelRebuildRecord
{
  return self->_previousSentinelRebuildRecord;
}

- (void)setPreviousSentinelRebuildRecord:(id)a3
{
  objc_storeStrong((id *)&self->_previousSentinelRebuildRecord, a3);
}

- (NSUUID)lastRebuildUUID
{
  return self->_lastRebuildUUID;
}

- (void)setLastRebuildUUID:(id)a3
{
  objc_storeStrong((id *)&self->_lastRebuildUUID, a3);
}

- (HMFTimer)uploadMonitorWatchdogTimer
{
  return self->_uploadMonitorWatchdogTimer;
}

- (void)setUploadMonitorWatchdogTimer:(id)a3
{
  objc_storeStrong((id *)&self->_uploadMonitorWatchdogTimer, a3);
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_loadWeakRetained((id *)&self->_cloudZone);
}

- (void)setCloudZone:(id)a3
{
  objc_storeWeak((id *)&self->_cloudZone, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_storeStrong((id *)&self->_uploadMonitorWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_lastRebuildUUID, 0);
  objc_storeStrong((id *)&self->_previousSentinelRebuildRecord, 0);
  objc_storeStrong((id *)&self->_rebuildCompleteFuture, 0);
  objc_storeStrong((id *)&self->_rebuilderStatus, 0);
}

void __49__HMBPrivateCloudZoneRebuilder_handleZoneChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isHMFError") && objc_msgSend(v3, "code") == 2)
  {
    v4 = (void *)MEMORY[0x1D17B6230]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v7;
      _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch succeeded, but no record returned.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    if (*(_QWORD *)(a1 + 40) == 1)
    {
      v13 = (void *)MEMORY[0x1D17B6230]();
      v14 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v16;
        v17 = "%{public}@Insufficient to transition out of Lost Key state.";
LABEL_13:
        _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);

        goto LABEL_14;
      }
      goto LABEL_14;
    }
    v27 = __transitionToState(*(void **)(a1 + 32), (void *)2, CFSTR("Failed to find sentinel model."), v8, v9, v10, v11, v12, v29);
LABEL_17:
    v28 = v27;
    goto LABEL_18;
  }
  v18 = (void *)MEMORY[0x1D17B6230]();
  v19 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v21;
    v32 = 2112;
    v33 = v3;
    _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@received notification, but failed to fetch model: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  if (*(_QWORD *)(a1 + 40) != 1)
  {
    v27 = __transitionToState(*(void **)(a1 + 32), (void *)2, CFSTR("Failed to monitor sentinel due to error: %@"), v22, v23, v24, v25, v26, (uint64_t)v3);
    goto LABEL_17;
  }
  v13 = (void *)MEMORY[0x1D17B6230]();
  v14 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v16;
    v17 = "%{public}@Will not transition out of Lost Key state.";
    goto LABEL_13;
  }
LABEL_14:

  objc_autoreleasePoolPop(v13);
LABEL_18:

}

void __49__HMBPrivateCloudZoneRebuilder_handleZoneChanged__block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v7;
    v51 = 2112;
    v52 = v3;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully fetched: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "hasCompleted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v13;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Sentinel record indicates that zone is completely rebuilt.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "setLastRebuildUUID:", 0);
    v19 = *(void **)(a1 + 32);
    v20 = CFSTR("Sentinel has been marked as complete.");
    v21 = 7;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "lastRebuildUUID");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_14;
  v24 = (void *)v23;
  objc_msgSend(v3, "uniqueToken");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastRebuildUUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "isEqual:", v26);

  if (!v27)
  {
LABEL_14:
    objc_msgSend(v3, "uniqueToken");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastRebuildUUID:", v33);

    if (*(_QWORD *)(a1 + 40) != 1)
    {
      v39 = *(void **)(a1 + 32);
      objc_msgSend(v39, "lastRebuildUUID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "uniqueToken");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = __transitionToState(v39, (void *)5, CFSTR("Change observed in sentinel %@ -> %@"), v41, v42, v43, v44, v45, (uint64_t)v40);

      goto LABEL_20;
    }
    v28 = (void *)MEMORY[0x1D17B6230]();
    v34 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "lastRebuildUUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "uniqueToken");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v36;
      v51 = 2112;
      v52 = v37;
      v53 = 2112;
      v54 = v38;
      _os_log_impl(&dword_1CCD48000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Sentinel record unique token changed %@ -> %@", buf, 0x20u);

    }
    goto LABEL_18;
  }
  if (*(_QWORD *)(a1 + 40) == 1)
  {
    v28 = (void *)MEMORY[0x1D17B6230]();
    v29 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "uniqueToken");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v31;
      v51 = 2112;
      v52 = v32;
      _os_log_impl(&dword_1CCD48000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Sentinel record unique token did not change from %@", buf, 0x16u);

    }
LABEL_18:
    objc_autoreleasePoolPop(v28);
    goto LABEL_20;
  }
  v19 = *(void **)(a1 + 32);
  v20 = CFSTR("No change observed in sentinel.");
  v21 = 2;
LABEL_7:
  v22 = __transitionToState(v19, (void *)v21, v20, v14, v15, v16, v17, v18, v47);
LABEL_20:

}

void __43__HMBPrivateCloudZoneRebuilder_zoneStartUp__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _BYTE buf[24];
  void *v39;
  id v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = v3;
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = v6;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting up zone rebuilder", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "cloudZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMBCloudZoneRebuilderModel sentinelUUID](HMBCloudZoneRebuilderModel, "sentinelUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v13, "fetchModelWithModelID:ofType:error:", v14, objc_opt_class(), &v37);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v37;

    if (v15)
    {
      v17 = (void *)MEMORY[0x1D17B6230]();
      v18 = v9;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_INFO, "%{public}@Found existing sentinel model: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      __processSentinelModel(v18, v15);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "completionHandlerAdapter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (id)objc_msgSend(v21, "addCompletionBlock:", v22);
    }
    else
    {
      v21 = objc_alloc_init(MEMORY[0x1E0D519D8]);
      __pushSentinelModel(v9, 1, v21);
      objc_msgSend(v21, "future");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ____startUp_block_invoke;
      v39 = &unk_1E8931F60;
      v29 = v9;
      v40 = v29;
      v30 = v7;
      v41 = v30;
      v31 = (id)objc_msgSend(v28, "addSuccessBlock:", buf);

      objc_msgSend(v21, "future");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = ____startUp_block_invoke_211;
      v34[3] = &unk_1E8932D60;
      v35 = v29;
      v36 = v30;
      v33 = (id)objc_msgSend(v32, "addFailureBlock:", v34);

      v22 = v40;
    }

  }
  else
  {
    v24 = (void *)MEMORY[0x1D17B6230]();
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_ERROR, "%{public}@Lost self while starting up rebuild machine.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v27);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t71 != -1)
    dispatch_once(&logCategory__hmf_once_t71, &__block_literal_global_2295);
  return (id)logCategory__hmf_once_v72;
}

void __43__HMBPrivateCloudZoneRebuilder_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v72;
  logCategory__hmf_once_v72 = v0;

}

@end
