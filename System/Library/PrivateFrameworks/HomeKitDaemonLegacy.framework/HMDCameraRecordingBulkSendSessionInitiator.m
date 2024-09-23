@implementation HMDCameraRecordingBulkSendSessionInitiator

- (HMDCameraRecordingBulkSendSessionInitiator)initWithWorkQueue:(id)a3 accessory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDCameraRecordingBulkSendSessionInitiator *v10;
  HMDCameraRecordingBulkSendSessionInitiator *v11;
  HMDCameraRecordingBulkSendSessionInitiator *v13;
  SEL v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMDCameraRecordingBulkSendSessionInitiator *)_HMFPreconditionFailure();
    return (HMDCameraRecordingBulkSendSessionInitiator *)-[HMDCameraRecordingBulkSendSessionInitiator isSessionOpenInProgress](v13, v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraRecordingBulkSendSessionInitiator;
  v10 = -[HMDCameraRecordingBulkSendSessionInitiator init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workQueue, a3);
    objc_storeWeak((id *)&v11->_accessory, v9);
  }

  return v11;
}

- (BOOL)isSessionOpenInProgress
{
  NSObject *v3;
  void *v4;

  -[HMDCameraRecordingBulkSendSessionInitiator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingBulkSendSessionInitiator currentListener](self, "currentListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isSessionOpenInProgress");

  return (char)v3;
}

- (void)configure
{
  NSObject *v3;
  void *v4;
  id v5;

  -[HMDCameraRecordingBulkSendSessionInitiator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingBulkSendSessionInitiator accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleAccessoryDoesSupportBulkSendDataStreamNotification_, CFSTR("HMDAccessoryDoesSupportBulkSendDataStreamNotification"), v4);

}

- (void)stop
{
  NSObject *v3;
  void *v4;
  HMDCameraRecordingBulkSendSessionInitiator *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCameraRecordingBulkSendSessionInitiator *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HMDCameraRecordingBulkSendSessionInitiator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopping bulk send session initiator", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraRecordingBulkSendSessionInitiator currentListener](v5, "currentListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = v5;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing bulk send listener: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDCameraRecordingBulkSendSessionInitiator accessory](v10, "accessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeDataStreamBulkSendListener:", v8);

    -[HMDCameraRecordingBulkSendSessionInitiator setWaitingForAccessory:](v10, "setWaitingForAccessory:", 0);
    -[HMDCameraRecordingBulkSendSessionInitiator setCurrentListener:](v10, "setCurrentListener:", 0);
  }
  else
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Ignoring stop request because we have no active listener", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)openNewSessionWithCallback:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  HMDCameraRecordingBulkSendSessionInitiator *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HMDCameraRecordingBulkSendSessionInitiator *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCameraRecordingBulkSendSessionInitiator *v20;
  NSObject *v21;
  void *v22;
  HMDCameraRecordingBulkSendListener *v23;
  void *v24;
  HMDCameraRecordingBulkSendListener *v25;
  void *v26;
  HMDCameraRecordingBulkSendSessionInitiator *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  HMDCameraRecordingBulkSendListener *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  -[HMDCameraRecordingBulkSendSessionInitiator workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543362;
    v35 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Opening new session", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraRecordingBulkSendSessionInitiator currentListener](v7, "currentListener");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSessionOpenInProgress");

  if (v11)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v7;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot open new session because a session is already being opened", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v16);
  }
  else
  {
    -[HMDCameraRecordingBulkSendSessionInitiator accessory](v7, "accessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingBulkSendSessionInitiator currentListener](v7, "currentListener");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "openBulkSendSessionWithAccessory:callback:", v16, v4);
    }
    else
    {
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = v7;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v22;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Registering bulk send listener before opening new session", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      v23 = [HMDCameraRecordingBulkSendListener alloc];
      -[HMDCameraRecordingBulkSendSessionInitiator workQueue](v20, "workQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[HMDCameraRecordingBulkSendListener initWithWorkQueue:](v23, "initWithWorkQueue:", v24);

      -[HMDCameraRecordingBulkSendListener setDelegate:](v25, "setDelegate:", v20);
      -[HMDCameraRecordingBulkSendListener addPendingBulkSendSessionCallback:](v25, "addPendingBulkSendSessionCallback:", v4);
      -[HMDCameraRecordingBulkSendSessionInitiator setCurrentListener:](v20, "setCurrentListener:", v25);
      if ((objc_msgSend(v16, "canAcceptBulkSendListeners") & 1) != 0)
      {
        -[HMDCameraRecordingBulkSendSessionInitiator _registerBulkSendListener](v20, "_registerBulkSendListener");
      }
      else
      {
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = v20;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v35 = v29;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Establishing local HAP connection with accessory because it cannot currently accept bulk send listeners", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v26);
        -[HMDCameraRecordingBulkSendSessionInitiator setWaitingForAccessory:](v27, "setWaitingForAccessory:", 1);
        -[HMDCameraRecordingBulkSendSessionInitiator workQueue](v27, "workQueue");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __73__HMDCameraRecordingBulkSendSessionInitiator_openNewSessionWithCallback___block_invoke;
        v31[3] = &unk_1E89C0DA8;
        v31[4] = v27;
        v32 = v25;
        v33 = v16;
        objc_msgSend(v33, "establishLocalHAPConnectionWithQueue:completion:", v30, v31);

      }
    }

  }
}

- (void)_registerBulkSendListener
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDCameraRecordingBulkSendSessionInitiator *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDCameraRecordingBulkSendSessionInitiator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingBulkSendSessionInitiator currentListener](self, "currentListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    _HMFPreconditionFailure();
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingBulkSendSessionInitiator currentListener](v6, "currentListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering bulk send listener: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraRecordingBulkSendSessionInitiator accessory](v6, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingBulkSendSessionInitiator currentListener](v6, "currentListener");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addDataStreamBulkSendListener:fileType:", v11, CFSTR("ipcamera.recording"));

}

- (void)handleAccessoryDoesSupportBulkSendDataStreamNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraRecordingBulkSendSessionInitiator workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__HMDCameraRecordingBulkSendSessionInitiator_handleAccessoryDoesSupportBulkSendDataStreamNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)listenerDidReceiveDataStreamStart:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDCameraRecordingBulkSendSessionInitiator *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraRecordingBulkSendSessionInitiator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingBulkSendSessionInitiator currentListener](self, "currentListener");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6 == v4)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v12;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Data stream did start for listener: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferenceForKey:", CFSTR("HAPDefaultIPCameraDisconnectOnIdleTimeoutSeconds"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    -[HMDCameraRecordingBulkSendSessionInitiator accessory](v8, "accessory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateActiveDisconnectOnIdleTimeout:", v17);

  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v11;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring data stream start for irrelevant listener: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)listenerDidReceiveDataStreamClose:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDCameraRecordingBulkSendSessionInitiator *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraRecordingBulkSendSessionInitiator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingBulkSendSessionInitiator currentListener](self, "currentListener");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6 == v4)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Data stream did close for listener: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDCameraRecordingBulkSendSessionInitiator setWaitingForAccessory:](v8, "setWaitingForAccessory:", 0);
    -[HMDCameraRecordingBulkSendSessionInitiator setCurrentListener:](v8, "setCurrentListener:", 0);
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring data stream close for irrelevant listener: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraRecordingBulkSendSessionInitiator accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (BOOL)isWaitingForAccessory
{
  return self->_waitingForAccessory;
}

- (void)setWaitingForAccessory:(BOOL)a3
{
  self->_waitingForAccessory = a3;
}

- (HMDCameraRecordingBulkSendListener)currentListener
{
  return (HMDCameraRecordingBulkSendListener *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentListener, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __103__HMDCameraRecordingBulkSendSessionInitiator_handleAccessoryDoesSupportBulkSendDataStreamNotification___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isWaitingForAccessory");
  if ((_DWORD)result)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Accessory now supports data streams so registering bulk send listener because we were waiting for accessory", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "setWaitingForAccessory:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "_registerBulkSendListener");
  }
  return result;
}

void __73__HMDCameraRecordingBulkSendSessionInitiator_openNewSessionWithCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to start HAP session with camera: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 40), "accessory:didCloseDataStreamWithError:", *(_QWORD *)(a1 + 48), v3);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_106527 != -1)
    dispatch_once(&logCategory__hmf_once_t14_106527, &__block_literal_global_106528);
  return (id)logCategory__hmf_once_v15_106529;
}

void __57__HMDCameraRecordingBulkSendSessionInitiator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v15_106529;
  logCategory__hmf_once_v15_106529 = v0;

}

@end
