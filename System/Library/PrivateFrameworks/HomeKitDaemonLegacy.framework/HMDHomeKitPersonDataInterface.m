@implementation HMDHomeKitPersonDataInterface

- (HMDHomeKitPersonDataInterface)initWithUUID:(id)a3 messageDispatcher:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDActiveXPCClientConnectionsPeriodicTimer *v11;
  void *v12;
  HMDActiveXPCClientConnectionsPeriodicTimer *v13;
  HMDHomeKitPersonDataInterface *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [HMDActiveXPCClientConnectionsPeriodicTimer alloc];
  objc_msgSend(v10, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDActiveXPCClientConnectionsPeriodicTimer initWithTimeInterval:logIdentifier:workQueue:](v11, "initWithTimeInterval:logIdentifier:workQueue:", v12, v8, 60.0);

  v14 = -[HMDHomeKitPersonDataInterface initWithUUID:messageDispatcher:workQueue:clientConnectionsTimer:](self, "initWithUUID:messageDispatcher:workQueue:clientConnectionsTimer:", v10, v9, v8, v13);
  return v14;
}

- (HMDHomeKitPersonDataInterface)initWithUUID:(id)a3 messageDispatcher:(id)a4 workQueue:(id)a5 clientConnectionsTimer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDHomeKitPersonDataInterface *v14;
  HMDHomeKitPersonDataInterface *v15;
  uint64_t v16;
  NSUUID *UUID;
  void *v18;
  id fetchServerFactory;
  _QWORD aBlock[4];
  id v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMDHomeKitPersonDataInterface;
  v14 = -[HMDHomeKitPersonDataInterface init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_workQueue, a5);
    v16 = objc_msgSend(v10, "copy");
    UUID = v15->_UUID;
    v15->_UUID = (NSUUID *)v16;

    objc_storeStrong((id *)&v15->_messageDispatcher, a4);
    objc_storeStrong((id *)&v15->_clientConnectionsTimer, a6);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __97__HMDHomeKitPersonDataInterface_initWithUUID_messageDispatcher_workQueue_clientConnectionsTimer___block_invoke;
    aBlock[3] = &unk_1E89B7F60;
    v22 = v12;
    v18 = _Block_copy(aBlock);
    fetchServerFactory = v15->_fetchServerFactory;
    v15->_fetchServerFactory = v18;

  }
  return v15;
}

- (void)_notifySubscribersOfMessageWithName:(id)a3 payload:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HMDHomeKitPersonDataInterface *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v30 = a4;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDHomeKitPersonDataInterface clientConnectionsTimer](self, "clientConnectionsTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientConnections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeKitPersonDataInterface clientConnectionsTimer](v11, "clientConnectionsTimer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "clientConnections");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v14;
      v39 = 2048;
      v40 = objc_msgSend(v16, "count");
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying %lu subscribers", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[HMDHomeKitPersonDataInterface clientConnectionsTimer](v11, "clientConnectionsTimer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clientConnections");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v22);
          objc_msgSend(MEMORY[0x1E0D285F8], "entitledMessageWithName:messagePayload:", v31, v30);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setTransport:", v23);
          v25 = objc_alloc(MEMORY[0x1E0D285D8]);
          -[HMDHomeKitPersonDataInterface UUID](v11, "UUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(v25, "initWithTarget:", v26);
          objc_msgSend(v24, "setDestination:", v27);

          objc_msgSend(v24, "setRequiresPersonManagerEntitlement");
          -[HMDHomeKitPersonDataInterface messageDispatcher](v11, "messageDispatcher");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "sendMessage:", v24);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v20);
    }

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v29;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEBUG, "%{public}@No subscribed transports to notify", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)handleSubscribeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HMDHomeKitPersonDataInterface *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    v21 = 138543362;
    v22 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling subscribe message", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "transport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    -[HMDHomeKitPersonDataInterface clientConnectionsTimer](v7, "clientConnectionsTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addClientConnection:", v12);

    objc_msgSend(v4, "respondWithSuccess");
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_class();
      objc_msgSend(v4, "transport");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Subscribing transport was not of expected class %@: %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v20);

  }
}

- (void)handleUnsubscribeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HMDHomeKitPersonDataInterface *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    v21 = 138543362;
    v22 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling unsubscribe message", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "transport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    -[HMDHomeKitPersonDataInterface clientConnectionsTimer](v7, "clientConnectionsTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeClientConnection:", v12);

    objc_msgSend(v4, "respondWithSuccess");
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_class();
      objc_msgSend(v4, "transport");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unsubscribing transport was not of expected class %@: %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v20);

  }
}

- (void)handlePerformCloudPullMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    v17 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling perform cloud pull message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performCloudPull");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__HMDHomeKitPersonDataInterface_handlePerformCloudPullMessage___block_invoke;
  v14[3] = &unk_1E89BF608;
  v15 = v4;
  v12 = v4;
  v13 = (id)objc_msgSend(v11, "addCompletionBlock:", v14);

}

- (void)handleFetchPersonsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HMDHomeKitPersonDataInterface *v17;
  NSObject *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  uint64_t v22;
  void *v23;
  HMDHomeKitPersonDataInterface *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v9;
    v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch persons message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isDataAvailable") & 1) != 0)
  {
    objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB97E0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v11, "personsWithUUIDs:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v31 = *MEMORY[0x1E0CB97E8];
      encodeRootObjectForIncomingXPCMessage(v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v15);

    }
    else
    {
      -[HMDHomeKitPersonDataInterface fetchServerFactory](v7, "fetchServerFactory");
      v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v20)[2](v20, v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __59__HMDHomeKitPersonDataInterface_handleFetchPersonsMessage___block_invoke;
        v29[3] = &unk_1E89B64C8;
        v13 = v21;
        v30 = v13;
        objc_msgSend(v11, "enumeratePersonsUsingBlock:", v29);
        v27[0] = v22;
        v27[1] = 3221225472;
        v27[2] = __59__HMDHomeKitPersonDataInterface_handleFetchPersonsMessage___block_invoke_2;
        v27[3] = &unk_1E89C2730;
        v28 = v4;
        objc_msgSend(v13, "sendCurrentlyBatchedFetchedObjectsWithCompletion:", v27);

        v14 = v30;
      }
      else
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = v7;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v26;
          v35 = 2112;
          v36 = v4;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v14);
        v13 = 0;
      }
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v7;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch persons because data is not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleFetchFaceCropsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HMDHomeKitPersonDataInterface *v17;
  NSObject *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  uint64_t v22;
  void *v23;
  HMDHomeKitPersonDataInterface *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v9;
    v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch face crops message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isDataAvailable") & 1) != 0)
  {
    objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB97C0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v11, "faceCropsWithUUIDs:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v31 = *MEMORY[0x1E0CB97C8];
      encodeRootObjectForIncomingXPCMessage(v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v15);

    }
    else
    {
      -[HMDHomeKitPersonDataInterface fetchServerFactory](v7, "fetchServerFactory");
      v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v20)[2](v20, v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __61__HMDHomeKitPersonDataInterface_handleFetchFaceCropsMessage___block_invoke;
        v29[3] = &unk_1E89B64F0;
        v13 = v21;
        v30 = v13;
        objc_msgSend(v11, "enumerateFaceCropsUsingBlock:", v29);
        v27[0] = v22;
        v27[1] = 3221225472;
        v27[2] = __61__HMDHomeKitPersonDataInterface_handleFetchFaceCropsMessage___block_invoke_2;
        v27[3] = &unk_1E89C2730;
        v28 = v4;
        objc_msgSend(v13, "sendCurrentlyBatchedFetchedObjectsWithCompletion:", v27);

        v14 = v30;
      }
      else
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = v7;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v26;
          v35 = 2112;
          v36 = v4;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v14);
        v13 = 0;
      }
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v7;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch person face crops because data is not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleFetchPersonFaceCropsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HMDHomeKitPersonDataInterface *v17;
  NSObject *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  uint64_t v22;
  void *v23;
  HMDHomeKitPersonDataInterface *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v9;
    v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch person face crops message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isDataAvailable") & 1) != 0)
  {
    objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB97E0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v11, "faceCropsForPersonsWithUUIDs:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v31 = *MEMORY[0x1E0CB97C8];
      encodeRootObjectForIncomingXPCMessage(v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v15);

    }
    else
    {
      -[HMDHomeKitPersonDataInterface fetchServerFactory](v7, "fetchServerFactory");
      v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v20)[2](v20, v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __67__HMDHomeKitPersonDataInterface_handleFetchPersonFaceCropsMessage___block_invoke;
        v29[3] = &unk_1E89B6518;
        v13 = v21;
        v30 = v13;
        objc_msgSend(v11, "enumeratePersonFaceCropsUsingBlock:", v29);
        v27[0] = v22;
        v27[1] = 3221225472;
        v27[2] = __67__HMDHomeKitPersonDataInterface_handleFetchPersonFaceCropsMessage___block_invoke_2;
        v27[3] = &unk_1E89C2730;
        v28 = v4;
        objc_msgSend(v13, "sendCurrentlyBatchedFetchedObjectsWithCompletion:", v27);

        v14 = v30;
      }
      else
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = v7;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v26;
          v35 = 2112;
          v36 = v4;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v14);
        v13 = 0;
      }
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v7;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch person face crops because data is not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleFetchUnassociatedFaceCropsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  HMDHomeKitPersonDataInterface *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDHomeKitPersonDataInterface *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch unassociated face crops message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isDataAvailable") & 1) != 0)
  {
    -[HMDHomeKitPersonDataInterface fetchServerFactory](v7, "fetchServerFactory");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v12)[2](v12, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __73__HMDHomeKitPersonDataInterface_handleFetchUnassociatedFaceCropsMessage___block_invoke;
      v27[3] = &unk_1E89B64F0;
      v15 = v13;
      v28 = v15;
      objc_msgSend(v11, "enumerateUnassociatedFaceCropsUsingBlock:", v27);
      v25[0] = v14;
      v25[1] = 3221225472;
      v25[2] = __73__HMDHomeKitPersonDataInterface_handleFetchUnassociatedFaceCropsMessage___block_invoke_2;
      v25[3] = &unk_1E89C2730;
      v26 = v4;
      objc_msgSend(v15, "sendCurrentlyBatchedFetchedObjectsWithCompletion:", v25);

      v16 = v28;
    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v7;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v24;
        v31 = 2112;
        v32 = v4;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v16);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v7;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch face crops because data is not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }

}

- (void)handleFetchFaceprintsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HMDHomeKitPersonDataInterface *v17;
  NSObject *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  uint64_t v22;
  void *v23;
  HMDHomeKitPersonDataInterface *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v9;
    v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch faceprints message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isDataAvailable") & 1) != 0)
  {
    objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB97C0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v11, "faceprintsForFaceCropsWithUUIDs:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v31 = *MEMORY[0x1E0CB97D8];
      encodeRootObjectForIncomingXPCMessage(v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v15);

    }
    else
    {
      -[HMDHomeKitPersonDataInterface fetchServerFactory](v7, "fetchServerFactory");
      v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v20)[2](v20, v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __62__HMDHomeKitPersonDataInterface_handleFetchFaceprintsMessage___block_invoke;
        v29[3] = &unk_1E89B6540;
        v13 = v21;
        v30 = v13;
        objc_msgSend(v11, "enumerateFaceprintsUsingBlock:", v29);
        v27[0] = v22;
        v27[1] = 3221225472;
        v27[2] = __62__HMDHomeKitPersonDataInterface_handleFetchFaceprintsMessage___block_invoke_2;
        v27[3] = &unk_1E89C2730;
        v28 = v4;
        objc_msgSend(v13, "sendCurrentlyBatchedFetchedObjectsWithCompletion:", v27);

        v14 = v30;
      }
      else
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = v7;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v26;
          v35 = 2112;
          v36 = v4;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v14);
        v13 = 0;
      }
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v7;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch faceprints because data is not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleAddOrUpdatePersonsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HMDHomeKitPersonDataInterface *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling add/update persons message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v11 = *MEMORY[0x1E0CB97E8];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOrUpdatePersons:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __65__HMDHomeKitPersonDataInterface_handleAddOrUpdatePersonsMessage___block_invoke;
    v23[3] = &unk_1E89BF608;
    v24 = v4;
    v16 = (id)objc_msgSend(v15, "addCompletionBlock:", v23);

    v17 = v24;
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find persons in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v17);
  }

}

- (void)handleAddOrUpdateFaceCropsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HMDHomeKitPersonDataInterface *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling add/update face crops message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v11 = *MEMORY[0x1E0CB97C8];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOrUpdateFaceCrops:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __67__HMDHomeKitPersonDataInterface_handleAddOrUpdateFaceCropsMessage___block_invoke;
    v23[3] = &unk_1E89BF608;
    v24 = v4;
    v16 = (id)objc_msgSend(v15, "addCompletionBlock:", v23);

    v17 = v24;
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find face crops in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v17);
  }

}

- (void)handleAddOrUpdateFaceprintsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HMDHomeKitPersonDataInterface *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling add/update faceprints message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v11 = *MEMORY[0x1E0CB97D8];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOrUpdateFaceprints:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __68__HMDHomeKitPersonDataInterface_handleAddOrUpdateFaceprintsMessage___block_invoke;
    v23[3] = &unk_1E89BF608;
    v24 = v4;
    v16 = (id)objc_msgSend(v15, "addCompletionBlock:", v23);

    v17 = v24;
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find faceprints in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v17);
  }

}

- (void)handleAssociateFaceCropsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  HMDHomeKitPersonDataInterface *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDHomeKitPersonDataInterface *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDHomeKitPersonDataInterface *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v9;
    v40 = 2112;
    v41 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling associate face crops message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB97C0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB97E0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB9808]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = objc_msgSend(v14, "integerValue");
        -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "associateFaceCropsWithUUIDs:toPersonWithUUID:forSource:", v11, v13, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __65__HMDHomeKitPersonDataInterface_handleAssociateFaceCropsMessage___block_invoke;
        v36[3] = &unk_1E89BF608;
        v37 = v4;
        v19 = (id)objc_msgSend(v18, "addCompletionBlock:", v36);

        v20 = v37;
      }
      else
      {
        v31 = (void *)MEMORY[0x1D17BA0A0]();
        v32 = v7;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "messagePayload");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v39 = v34;
          v40 = 2112;
          v41 = v35;
          _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not find source in message payload: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v20);
      }

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
        objc_msgSend(v4, "messagePayload");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v29;
        v40 = 2112;
        v41 = v30;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not find person UUID in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v15);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v7;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v24;
      v40 = 2112;
      v41 = v25;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not find face crop UUIDs in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }

}

- (void)handleDisassociateFaceCropsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMDHomeKitPersonDataInterface *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling disassociate face crops message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB97C0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "disassociateFaceCropsWithUUIDs:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __68__HMDHomeKitPersonDataInterface_handleDisassociateFaceCropsMessage___block_invoke;
    v21[3] = &unk_1E89BF608;
    v22 = v4;
    v14 = (id)objc_msgSend(v13, "addCompletionBlock:", v21);

    v15 = v22;
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v7;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find face crop UUIDs in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
  }

}

- (void)handleRemovePersonsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMDHomeKitPersonDataInterface *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling remove persons message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB97E0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removePersonsWithUUIDs:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __60__HMDHomeKitPersonDataInterface_handleRemovePersonsMessage___block_invoke;
    v21[3] = &unk_1E89BF608;
    v22 = v4;
    v14 = (id)objc_msgSend(v13, "addCompletionBlock:", v21);

    v15 = v22;
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v7;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find person UUIDs in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
  }

}

- (void)handleRemoveFaceCropsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMDHomeKitPersonDataInterface *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling remove face crops message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB97C0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFaceCropsWithUUIDs:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __62__HMDHomeKitPersonDataInterface_handleRemoveFaceCropsMessage___block_invoke;
    v21[3] = &unk_1E89BF608;
    v22 = v4;
    v14 = (id)objc_msgSend(v13, "addCompletionBlock:", v21);

    v15 = v22;
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v7;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find face crop UUIDs in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
  }

}

- (void)handleRemoveFaceprintsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitPersonDataInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMDHomeKitPersonDataInterface *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling remove face crops message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB97D0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HMDHomeKitPersonDataInterface dataSource](v7, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFaceprintsWithUUIDs:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __63__HMDHomeKitPersonDataInterface_handleRemoveFaceprintsMessage___block_invoke;
    v21[3] = &unk_1E89BF608;
    v22 = v4;
    v14 = (id)objc_msgSend(v13, "addCompletionBlock:", v21);

    v15 = v22;
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v7;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find faceprints UUIDs in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHomeKitPersonDataInterface UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)configureWithDataSource:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeKitPersonDataInterface *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[2];
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  if (!v7)
    goto LABEL_7;
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v12;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Configuring HomeKit person data interface", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDHomeKitPersonDataInterface setDataSource:](v10, "setDataSource:", v6);
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 8197);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v7, 0, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v7, 4, 0);
  v41 = v6;
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 4);
  v39 = v7;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v13;
  v45[1] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9850], v10, v17, sel_handleSubscribeMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9858], v10, v17, sel_handleUnsubscribeMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9830], v10, v17, sel_handlePerformCloudPullMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB97B0], v10, v17, sel_handleFetchPersonsMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9798], v10, v17, sel_handleFetchFaceCropsMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB97A8], v10, v17, sel_handleFetchPersonFaceCropsMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB97B8], v10, v17, sel_handleFetchUnassociatedFaceCropsMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB97A0], v10, v17, sel_handleFetchFaceprintsMessage_);

  v44[0] = v13;
  v44[1] = v14;
  v44[2] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v13;
  v43[1] = v14;
  v43[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v13;
  v42[1] = v14;
  v42[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9778], v10, v26, sel_handleAddOrUpdatePersonsMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9768], v10, v26, sel_handleAddOrUpdateFaceCropsMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9770], v10, v26, sel_handleAddOrUpdateFaceprintsMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9780], v10, v27, sel_handleAssociateFaceCropsMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9790], v10, v27, sel_handleDisassociateFaceCropsMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9848], v10, v28, sel_handleRemovePersonsMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9838], v10, v28, sel_handleRemoveFaceCropsMessage_);

  -[HMDHomeKitPersonDataInterface messageDispatcher](v10, "messageDispatcher");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9840], v10, v28, sel_handleRemoveFaceprintsMessage_);

  -[HMDHomeKitPersonDataInterface clientConnectionsTimer](v10, "clientConnectionsTimer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setDelegate:", v10);

}

- (void)handleUpdatedPerson:(id)a3 mirrorOutputFuture:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeKitPersonDataInterface *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying subscribers of updated person: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6, *MEMORY[0x1E0CB9820]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeKitPersonDataInterface _notifySubscribersOfMessageWithName:payload:](v10, "_notifySubscribersOfMessageWithName:payload:", *MEMORY[0x1E0CB9788], v15);
}

- (void)handleUpdatedUnassociatedFaceCrop:(id)a3 mirrorOutputFuture:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeKitPersonDataInterface *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying subscribers of updated unassociated face crop: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6, *MEMORY[0x1E0CB9828]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeKitPersonDataInterface _notifySubscribersOfMessageWithName:payload:](v10, "_notifySubscribersOfMessageWithName:payload:", *MEMORY[0x1E0CB9788], v15);
}

- (void)handleUpdatedPersonFaceCrop:(id)a3 mirrorOutputFuture:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeKitPersonDataInterface *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Notifying subscribers of updated person face crop: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6, *MEMORY[0x1E0CB9818]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeKitPersonDataInterface _notifySubscribersOfMessageWithName:payload:](v10, "_notifySubscribersOfMessageWithName:payload:", *MEMORY[0x1E0CB9788], v16);
}

- (void)handleUpdatedFaceprint:(id)a3 mirrorOutputFuture:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeKitPersonDataInterface *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Notifying subscribers of updated faceprint: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6, *MEMORY[0x1E0CB9810]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeKitPersonDataInterface _notifySubscribersOfMessageWithName:payload:](v10, "_notifySubscribersOfMessageWithName:payload:", *MEMORY[0x1E0CB9788], v15);
}

- (void)handleRemovedPersonWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeKitPersonDataInterface *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying subscribers of removed person UUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6, *MEMORY[0x1E0CB9800]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeKitPersonDataInterface _notifySubscribersOfMessageWithName:payload:](v10, "_notifySubscribersOfMessageWithName:payload:", *MEMORY[0x1E0CB9788], v14);
}

- (void)handleRemovedFaceCropWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeKitPersonDataInterface *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying subscribers of removed face crop UUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6, *MEMORY[0x1E0CB97F0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeKitPersonDataInterface _notifySubscribersOfMessageWithName:payload:](v10, "_notifySubscribersOfMessageWithName:payload:", *MEMORY[0x1E0CB9788], v14);
}

- (void)handleRemovedFaceprintWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeKitPersonDataInterface *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying subscribers of removed faceprint UUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6, *MEMORY[0x1E0CB97F8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeKitPersonDataInterface _notifySubscribersOfMessageWithName:payload:](v10, "_notifySubscribersOfMessageWithName:payload:", *MEMORY[0x1E0CB9788], v14);
}

- (void)clientConnectionsTimerDidFire:(id)a3
{
  NSObject *v4;
  id v5;
  id v6;

  -[HMDHomeKitPersonDataInterface workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDHomeKitPersonDataInterface dataSource](self, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "performCloudPull");

}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (HMDActiveXPCClientConnectionsPeriodicTimer)clientConnectionsTimer
{
  return (HMDActiveXPCClientConnectionsPeriodicTimer *)objc_getProperty(self, a2, 32, 1);
}

- (HMDPersonDataSource)dataSource
{
  return (HMDPersonDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (id)fetchServerFactory
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setFetchServerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchServerFactory, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_clientConnectionsTimer, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __63__HMDHomeKitPersonDataInterface_handleRemoveFaceprintsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

uint64_t __62__HMDHomeKitPersonDataInterface_handleRemoveFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

uint64_t __60__HMDHomeKitPersonDataInterface_handleRemovePersonsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

uint64_t __68__HMDHomeKitPersonDataInterface_handleDisassociateFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

uint64_t __65__HMDHomeKitPersonDataInterface_handleAssociateFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

uint64_t __68__HMDHomeKitPersonDataInterface_handleAddOrUpdateFaceprintsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

uint64_t __67__HMDHomeKitPersonDataInterface_handleAddOrUpdateFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

uint64_t __65__HMDHomeKitPersonDataInterface_handleAddOrUpdatePersonsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

uint64_t __62__HMDHomeKitPersonDataInterface_handleFetchFaceprintsMessage___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "handleFetchedObject:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "canHandleMoreFetchedObjects");
  *a3 = result ^ 1;
  return result;
}

uint64_t __62__HMDHomeKitPersonDataInterface_handleFetchFaceprintsMessage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __73__HMDHomeKitPersonDataInterface_handleFetchUnassociatedFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "handleFetchedObject:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "canHandleMoreFetchedObjects");
  *a3 = result ^ 1;
  return result;
}

uint64_t __73__HMDHomeKitPersonDataInterface_handleFetchUnassociatedFaceCropsMessage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __67__HMDHomeKitPersonDataInterface_handleFetchPersonFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "handleFetchedObject:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "canHandleMoreFetchedObjects");
  *a3 = result ^ 1;
  return result;
}

uint64_t __67__HMDHomeKitPersonDataInterface_handleFetchPersonFaceCropsMessage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __61__HMDHomeKitPersonDataInterface_handleFetchFaceCropsMessage___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "handleFetchedObject:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "canHandleMoreFetchedObjects");
  *a3 = result ^ 1;
  return result;
}

uint64_t __61__HMDHomeKitPersonDataInterface_handleFetchFaceCropsMessage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __59__HMDHomeKitPersonDataInterface_handleFetchPersonsMessage___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "handleFetchedObject:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "canHandleMoreFetchedObjects");
  *a3 = result ^ 1;
  return result;
}

uint64_t __59__HMDHomeKitPersonDataInterface_handleFetchPersonsMessage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __63__HMDHomeKitPersonDataInterface_handlePerformCloudPullMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

id __97__HMDHomeKitPersonDataInterface_initWithUUID_messageDispatcher_workQueue_clientConnectionsTimer___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CBA400];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFetchMessage:workQueue:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42_130532 != -1)
    dispatch_once(&logCategory__hmf_once_t42_130532, &__block_literal_global_130533);
  return (id)logCategory__hmf_once_v43_130534;
}

void __44__HMDHomeKitPersonDataInterface_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v43_130534;
  logCategory__hmf_once_v43_130534 = v0;

}

@end
