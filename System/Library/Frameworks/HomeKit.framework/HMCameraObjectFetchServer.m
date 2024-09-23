@implementation HMCameraObjectFetchServer

- (HMCameraObjectFetchServer)initWithFetchMessage:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraObjectFetchServer *v10;
  HMCameraObjectFetchServer *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuidForKey:", CFSTR("HMCOFC.mk.u"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "transport");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[HMCameraObjectFetchServer initWithClientUUID:transport:workQueue:](self, "initWithClientUUID:transport:workQueue:", v8, v9, v7);
      v11 = v10;
    }
    else
    {
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v10 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v18;
        v22 = 2112;
        v23 = v6;
        _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not find transport on message: %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v11 = 0;
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "messagePayload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not find client UUID in message payload: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (HMCameraObjectFetchServer)initWithClientUUID:(id)a3 transport:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMCameraObjectFetchServer *v11;
  HMCameraObjectFetchServer *v12;
  uint64_t v13;
  NSUUID *clientUUID;
  uint64_t v15;
  NSMutableArray *currentlyBatchedFetchedObjects;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMCameraObjectFetchServer;
  v11 = -[HMCameraObjectFetchServer init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_workQueue, a5);
    v13 = objc_msgSend(v8, "copy");
    clientUUID = v12->_clientUUID;
    v12->_clientUUID = (NSUUID *)v13;

    objc_storeWeak((id *)&v12->_transport, v9);
    v12->_fetchedObjectsBatchLimit = 100;
    v12->_totalFetchedObjectsLimit = -1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v12->_fetchedObjectsBatchLimit);
    v15 = objc_claimAutoreleasedReturnValue();
    currentlyBatchedFetchedObjects = v12->_currentlyBatchedFetchedObjects;
    v12->_currentlyBatchedFetchedObjects = (NSMutableArray *)v15;

  }
  return v12;
}

- (BOOL)canHandleMoreFetchedObjects
{
  NSObject *v3;
  void *v4;
  unint64_t v5;
  BOOL v6;

  -[HMCameraObjectFetchServer workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMCameraObjectFetchServer transport](self, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[HMCameraObjectFetchServer totalFetchedObjectsCount](self, "totalFetchedObjectsCount");
    v6 = v5 < -[HMCameraObjectFetchServer totalFetchedObjectsLimit](self, "totalFetchedObjectsLimit");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)handleFetchedObject:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  HMCameraObjectFetchServer *v16;
  NSObject *v17;
  void *v18;
  HMCameraObjectFetchServer *v19;
  void *v20;
  const char *v21;
  HMCameraObjectFetchServer *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMCameraObjectFetchServer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMCameraObjectFetchServer transport](self, "transport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v20;
      v21 = "%{public}@Cannot handle fetched object because transport no longer exists";
LABEL_12:
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v23, 0xCu);

    }
LABEL_13:

    objc_autoreleasePoolPop(v15);
    goto LABEL_14;
  }
  if (!-[HMCameraObjectFetchServer canHandleMoreFetchedObjects](self, "canHandleMoreFetchedObjects"))
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v20;
      v21 = "%{public}@Asked to handle fetched object while unable to handle more fetched objects";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  -[HMCameraObjectFetchServer currentlyBatchedFetchedObjects](self, "currentlyBatchedFetchedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  -[HMCameraObjectFetchServer currentlyBatchedFetchedObjects](self, "currentlyBatchedFetchedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = -[HMCameraObjectFetchServer fetchedObjectsBatchLimit](self, "fetchedObjectsBatchLimit");

  if (v9 >= v10)
  {
    -[HMCameraObjectFetchServer currentlyBatchedFetchedObjects](self, "currentlyBatchedFetchedObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraObjectFetchServer clientUUID](self, "clientUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraObjectFetchServer _notifyTransport:ofFetchedObjects:forClientUUID:responseHandler:](self, "_notifyTransport:ofFetchedObjects:forClientUUID:responseHandler:", v6, v11, v12, 0);

    -[HMCameraObjectFetchServer currentlyBatchedFetchedObjects](self, "currentlyBatchedFetchedObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllObjects");

  }
  -[HMCameraObjectFetchServer setTotalFetchedObjectsCount:](self, "setTotalFetchedObjectsCount:", -[HMCameraObjectFetchServer totalFetchedObjectsCount](self, "totalFetchedObjectsCount") + 1);
  v14 = -[HMCameraObjectFetchServer totalFetchedObjectsCount](self, "totalFetchedObjectsCount");
  if (v14 >= -[HMCameraObjectFetchServer totalFetchedObjectsLimit](self, "totalFetchedObjectsLimit"))
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v18;
      v25 = 2048;
      v26 = -[HMCameraObjectFetchServer totalFetchedObjectsLimit](v16, "totalFetchedObjectsLimit");
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Reached limit of %lu fetched objects", (uint8_t *)&v23, 0x16u);

    }
    goto LABEL_13;
  }
LABEL_14:

}

- (void)sendCurrentlyBatchedFetchedObjectsWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMCameraObjectFetchServer *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  HMCameraObjectFetchServer *v18;
  void (**v19)(_QWORD);
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  -[HMCameraObjectFetchServer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMCameraObjectFetchServer transport](self, "transport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMCameraObjectFetchServer currentlyBatchedFetchedObjects](self, "currentlyBatchedFetchedObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraObjectFetchServer clientUUID](self, "clientUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __78__HMCameraObjectFetchServer_sendCurrentlyBatchedFetchedObjectsWithCompletion___block_invoke;
    v17 = &unk_1E3AB59B8;
    v18 = self;
    v19 = v4;
    -[HMCameraObjectFetchServer _notifyTransport:ofFetchedObjects:forClientUUID:responseHandler:](self, "_notifyTransport:ofFetchedObjects:forClientUUID:responseHandler:", v6, v7, v8, &v14);

    -[HMCameraObjectFetchServer currentlyBatchedFetchedObjects](self, "currentlyBatchedFetchedObjects", v14, v15, v16, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllObjects");

  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot send currently batched fetched objects because transport no longer exists", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v4[2](v4);
  }

}

- (void)_notifyTransport:(id)a3 ofFetchedObjects:(id)a4 forClientUUID:(id)a5 responseHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17 = CFSTR("HMCOFC.mk.fo");
  v9 = a6;
  v10 = a5;
  v11 = a3;
  encodeRootObject(a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0D285F8]);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285D8]), "initWithTarget:", v10);

  v16 = (void *)objc_msgSend(v14, "initWithName:destination:payload:", CFSTR("HMCOFC.m.dfo"), v15, v13);
  objc_msgSend(v16, "setTransport:", v11);
  objc_msgSend(v16, "setResponseHandler:", v9);

  objc_msgSend(v11, "sendMessage:completionHandler:", v16, 0);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMCameraObjectFetchServer clientUUID](self, "clientUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)clientUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)fetchedObjectsBatchLimit
{
  return self->_fetchedObjectsBatchLimit;
}

- (void)setFetchedObjectsBatchLimit:(unint64_t)a3
{
  self->_fetchedObjectsBatchLimit = a3;
}

- (unint64_t)totalFetchedObjectsLimit
{
  return self->_totalFetchedObjectsLimit;
}

- (void)setTotalFetchedObjectsLimit:(unint64_t)a3
{
  self->_totalFetchedObjectsLimit = a3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableArray)currentlyBatchedFetchedObjects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (HMFMessageTransport)transport
{
  return (HMFMessageTransport *)objc_loadWeakRetained((id *)&self->_transport);
}

- (void)setTransport:(id)a3
{
  objc_storeWeak((id *)&self->_transport, a3);
}

- (unint64_t)totalFetchedObjectsCount
{
  return self->_totalFetchedObjectsCount;
}

- (void)setTotalFetchedObjectsCount:(unint64_t)a3
{
  self->_totalFetchedObjectsCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transport);
  objc_storeStrong((id *)&self->_currentlyBatchedFetchedObjects, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);
}

void __78__HMCameraObjectFetchServer_sendCurrentlyBatchedFetchedObjectsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HMCameraObjectFetchServer_sendCurrentlyBatchedFetchedObjectsWithCompletion___block_invoke_2;
  block[3] = &unk_1E3AB6078;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

uint64_t __78__HMCameraObjectFetchServer_sendCurrentlyBatchedFetchedObjectsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_32354 != -1)
    dispatch_once(&logCategory__hmf_once_t6_32354, &__block_literal_global_32355);
  return (id)logCategory__hmf_once_v7_32356;
}

void __40__HMCameraObjectFetchServer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_32356;
  logCategory__hmf_once_v7_32356 = v0;

}

@end
