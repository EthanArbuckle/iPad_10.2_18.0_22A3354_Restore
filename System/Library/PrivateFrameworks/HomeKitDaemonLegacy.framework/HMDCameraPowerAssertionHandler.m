@implementation HMDCameraPowerAssertionHandler

- (HMDCameraPowerAssertionHandler)init
{
  HMDCameraPowerAssertionHandler *v2;
  uint64_t v3;
  NSMutableSet *currentRequestHandlerSessionIDs;
  id v5;
  const char *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMDCameraPowerAssertionHandler;
  v2 = -[HMDCameraPowerAssertionHandler init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    currentRequestHandlerSessionIDs = v2->_currentRequestHandlerSessionIDs;
    v2->_currentRequestHandlerSessionIDs = (NSMutableSet *)v3;

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

- (void)registerRemoteRequestHandler:(id)a3 forSessionID:(id)a4
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
  -[HMDCameraPowerAssertionHandler workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HMDCameraPowerAssertionHandler_registerRemoteRequestHandler_forSessionID___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)deregisterRemoteRequestHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraPowerAssertionHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HMDCameraPowerAssertionHandler_deregisterRemoteRequestHandler___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSMutableSet)currentRequestHandlerSessionIDs
{
  return self->_currentRequestHandlerSessionIDs;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (unsigned)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(unsigned int)a3
{
  self->_powerAssertion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentRequestHandlerSessionIDs, 0);
}

void __65__HMDCameraPowerAssertionHandler_deregisterRemoteRequestHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentRequestHandlerSessionIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "currentRequestHandlerSessionIDs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v20;
      v25 = 2112;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Cannot find session %@ in current assertion holders %@", (uint8_t *)&v23, 0x20u);

    }
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "currentRequestHandlerSessionIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "currentRequestHandlerSessionIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Deregistering power assertion holder %@, current camera power assertion holders: %@", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "currentRequestHandlerSessionIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "powerAssertion"))
    {
      IOPMAssertionRelease(objc_msgSend(*(id *)(a1 + 32), "powerAssertion"));
      v13 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 32), "setPowerAssertion:", 0));
      v14 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v16;
        v17 = "%{public}@Releasing power assertion for camera";
        v18 = v15;
        v19 = OS_LOG_TYPE_INFO;
LABEL_12:
        _os_log_impl(&dword_1CD062000, v18, v19, v17, (uint8_t *)&v23, 0xCu);

      }
    }
    else
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v16;
        v17 = "%{public}@Needed to release power assertion, but it isnt valid?";
        v18 = v15;
        v19 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }
LABEL_13:

    objc_autoreleasePoolPop(v13);
  }
}

void __76__HMDCameraPowerAssertionHandler_registerRemoteRequestHandler_forSessionID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _HMDCameraPowerAssertion *v7;
  void *v8;
  IOReturn v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v21 = 138543618;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Registering power assertion holder for session %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = -[_HMDCameraPowerAssertion initWithPowerAssertionHandler:remoteRequestHandlerSessionID:]([_HMDCameraPowerAssertion alloc], "initWithPowerAssertionHandler:remoteRequestHandlerSessionID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_setAssociatedObject(*(id *)(a1 + 48), "HMD.CameraPowerAssertionKey", v7, (void *)1);
  objc_msgSend(*(id *)(a1 + 32), "currentRequestHandlerSessionIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", *(_QWORD *)(a1 + 40));

  if (!objc_msgSend(*(id *)(a1 + 32), "powerAssertion"))
  {
    v9 = IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), CFSTR("HomeKit Camera Streaming"), 0, 0, 0, 0.0, 0, (IOPMAssertionID *)(*(_QWORD *)(a1 + 32) + 8));
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v13)
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v14;
        v15 = "%{public}@Failed to create power assertion for camera request handler";
LABEL_9:
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v21, 0xCu);

      }
    }
    else if (v13)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v14;
      v15 = "%{public}@Taking power assertion for camera";
      goto LABEL_9;
    }

    objc_autoreleasePoolPop(v10);
  }
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  v17 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentRequestHandlerSessionIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v19;
    v23 = 2112;
    v24 = v20;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Current camera power assertion holders: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v16);

}

+ (id)sharedHandler
{
  if (sharedHandler_onceToken_121450 != -1)
    dispatch_once(&sharedHandler_onceToken_121450, &__block_literal_global_121451);
  return (id)assertionHandler;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_121445 != -1)
    dispatch_once(&logCategory__hmf_once_t0_121445, &__block_literal_global_20_121446);
  return (id)logCategory__hmf_once_v1_121447;
}

void __45__HMDCameraPowerAssertionHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_121447;
  logCategory__hmf_once_v1_121447 = v0;

}

void __47__HMDCameraPowerAssertionHandler_sharedHandler__block_invoke()
{
  HMDCameraPowerAssertionHandler *v0;
  void *v1;

  v0 = objc_alloc_init(HMDCameraPowerAssertionHandler);
  v1 = (void *)assertionHandler;
  assertionHandler = (uint64_t)v0;

}

@end
