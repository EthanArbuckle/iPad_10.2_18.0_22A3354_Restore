@implementation HMDUserCloudShareController

- (void)_invalidateXpcClient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  HMDUserCloudShareController *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDUserCloudShareController connectedClients](self, "connectedClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

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
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Found invalidated connection %@ will de-register.", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDUserCloudShareController _deregisterXpcClient:](v9, "_deregisterXpcClient:", v4);
  }

}

uint64_t __51__HMDUserCloudShareController_invalidateXpcClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateXpcClient:", *(_QWORD *)(a1 + 40));
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSHashTable)connectedClients
{
  NSObject *v3;

  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_connectedClients;
}

- (void)invalidateXpcClient:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__HMDUserCloudShareController_invalidateXpcClient___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_deregisterXpcClient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  HMDUserCloudShareController *v18;
  NSObject *v19;
  HMDUserCloudShareController *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v26 = v4;
  +[HMDUserCloudShareController identifierForConnection:](HMDUserCloudShareController, "identifierForConnection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserCloudShareController containerIdToConnectionIdentifierMap](self, "containerIdToConnectionIdentifierMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    v27 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      v28 = v11;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13);
        -[HMDUserCloudShareController containerIdToConnectionIdentifierMap](self, "containerIdToConnectionIdentifierMap");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "isEqualToString:", v6))
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = self;
            v21 = v9;
            v22 = v6;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v34 = v23;
            v35 = 2112;
            v36 = v22;
            v37 = 2112;
            v38 = v14;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Deregistering connection %@ from container %@.", buf, 0x20u);

            v6 = v22;
            v9 = v21;
            self = v20;
            v12 = v27;
          }

          objc_autoreleasePoolPop(v17);
          -[HMDUserCloudShareController containerIdToConnectionIdentifierMap](v18, "containerIdToConnectionIdentifierMap");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeObjectForKey:", v14);

          v11 = v28;
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    }
    while (v11);
  }

  -[HMDUserCloudShareController connectedClients](self, "connectedClients");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeObject:", v26);

}

- (NSMutableDictionary)containerIdToConnectionIdentifierMap
{
  NSObject *v3;

  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_containerIdToConnectionIdentifierMap;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_123930 != -1)
    dispatch_once(&logCategory__hmf_once_t27_123930, &__block_literal_global_123931);
  return (id)logCategory__hmf_once_v28_123932;
}

- (HMDUserCloudShareController)initWithDelegate:(id)a3 queue:(id)a4 pendingRequestTimeoutInterval:(double)a5
{
  id v8;
  id v9;
  HMDUserCloudShareController *v10;
  uint64_t v11;
  OS_os_log *logger;
  uint64_t v13;
  NSHashTable *connectedClients;
  uint64_t v15;
  NSMutableDictionary *containerIdToConnectionIdentifierMap;
  uint64_t v17;
  NSMutableArray *pendingRequests;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDUserCloudShareController;
  v10 = -[HMDUserCloudShareController init](&v20, sel_init);
  if (v10)
  {
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    logger = v10->_logger;
    v10->_logger = (OS_os_log *)v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeStrong((id *)&v10->_clientQueue, a4);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    connectedClients = v10->_connectedClients;
    v10->_connectedClients = (NSHashTable *)v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    containerIdToConnectionIdentifierMap = v10->_containerIdToConnectionIdentifierMap;
    v10->_containerIdToConnectionIdentifierMap = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    pendingRequests = v10->_pendingRequests;
    v10->_pendingRequests = (NSMutableArray *)v17;

    v10->_pendingRequestTimeoutInterval = a5;
  }

  return v10;
}

- (id)_connectionForContainerID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDUserCloudShareController containerIdToConnectionIdentifierMap](self, "containerIdToConnectionIdentifierMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[HMDUserCloudShareController connectedClients](self, "connectedClients", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          +[HMDUserCloudShareController identifierForConnection:](HMDUserCloudShareController, "identifierForConnection:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", v7))
          {
            v9 = v12;

            goto LABEL_12;
          }

        }
        v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_startTimerIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDUserCloudShareController pendingRequests](self, "pendingRequests");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[HMDUserCloudShareController pendingRequestTimer](self, "pendingRequestTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return;
    -[HMDUserCloudShareController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserCloudShareController pendingRequestTimeoutInterval](self, "pendingRequestTimeoutInterval");
    objc_msgSend(v5, "userCloudShareController:timerWithInterval:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserCloudShareController setPendingRequestTimer:](self, "setPendingRequestTimer:", v6);

    -[HMDUserCloudShareController pendingRequestTimer](self, "pendingRequestTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[HMDUserCloudShareController pendingRequestTimer](self, "pendingRequestTimer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resume");
  }

}

- (void)_removeTimerIfNotNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDUserCloudShareController *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDUserCloudShareController pendingRequests](self, "pendingRequests");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {

  }
  else
  {
    -[HMDUserCloudShareController pendingRequestTimer](self, "pendingRequestTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x227676638]();
      v6 = self;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v11 = v8;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing timer as there are no more pending requests", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
      -[HMDUserCloudShareController setPendingRequestTimer:](v6, "setPendingRequestTimer:", 0);
    }
  }
}

- (void)_addRequestToPending:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDUserCloudShareController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding request to pending %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDUserCloudShareController pendingRequests](v7, "pendingRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v4);

  -[HMDUserCloudShareController _startTimerIfNeeded](v7, "_startTimerIfNeeded");
}

- (void)_handlePendingRequestTimeouts
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  HMDUserCloudShareController *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HMDUserCloudShareController pendingRequests](self, "pendingRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v29;
    *(_QWORD *)&v7 = 138543618;
    v27 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "startDate", v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceNow");
        v14 = -v13;
        -[HMDUserCloudShareController pendingRequestTimeoutInterval](self, "pendingRequestTimeoutInterval");
        v16 = v15;

        if (v16 < v14)
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v27;
            v33 = v20;
            v34 = 2112;
            v35 = v11;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Timing out pending request %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v17);
          v21 = v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v22 = v21;
          else
            v22 = 0;
          v23 = v22;

          if (v23)
          {
            objc_msgSend(v23, "completion");
            v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 8, CFSTR("No process received pending request in time"), CFSTR("No process received share message in required time."), 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, _QWORD, void *))v24)[2](v24, 0, v25);

          }
          -[HMDUserCloudShareController pendingRequests](v18, "pendingRequests");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "removeObject:", v21);

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v8);
  }

}

- (void)_resumeRequestsForContainerID:(id)a3 connection:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  HMDUserCloudShareController *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  HMDUserCloudShareController *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  __int128 v32;
  id v33;
  void *context;
  id v35;
  HMDUserCloudShareController *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v35 = a4;
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = self;
  -[HMDUserCloudShareController pendingRequests](self, "pendingRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v39;
    *(_QWORD *)&v11 = 138543362;
    v32 = v11;
    v33 = v6;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v15, "containerID", v32);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v6);

        if (v17)
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = v36;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v43 = v21;
            v44 = 2112;
            v45 = v15;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Resuming request %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
          v22 = v15;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v23 = v22;
          else
            v23 = 0;
          v24 = v23;

          v25 = v22;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v26 = v25;
          else
            v26 = 0;
          v27 = v26;

          if (v24)
          {
            -[HMDUserCloudShareController _sendShareRequest:toConnection:](v19, "_sendShareRequest:toConnection:", v24, v35);
          }
          else if (v27)
          {
            -[HMDUserCloudShareController _sendRepairRequest:toConnection:](v19, "_sendRepairRequest:toConnection:", v27, v35);
          }
          else
          {
            context = (void *)MEMORY[0x227676638]();
            v28 = v19;
            HMFGetOSLogHandle();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v32;
              v43 = v30;
              _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not determine request type.", buf, 0xCu);

              v6 = v33;
            }

            objc_autoreleasePoolPop(context);
          }
          -[HMDUserCloudShareController pendingRequests](v19, "pendingRequests");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "removeObject:", v25);

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v12);
  }

  -[HMDUserCloudShareController _removeTimerIfNotNeeded](v36, "_removeTimerIfNotNeeded");
}

- (void)_sendShareRequest:(id)a3 toConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDUserCloudShareController delegate](self, "delegate");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fromUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodedShareURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shareToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "completion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "userCloudShareController:sendShareRequestMessageWithConnection:fromUser:toUser:home:shareURL:shareToken:containerID:completion:", self, v6, v9, v10, v11, v12, v13, v14, v15);
}

- (void)_sendRepairRequest:(id)a3 toConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDUserCloudShareController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v12;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Sending repair request %@ to client %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDUserCloudShareController delegate](v10, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "repairInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userCloudShareController:sendRepairInfo:toConnection:home:containerID:", v10, v14, v7, v15, v16);

}

- (void)_handleShareForRemoteClientRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDUserCloudShareController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "containerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserCloudShareController _connectionForContainerID:](self, "_connectionForContainerID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDUserCloudShareController _sendShareRequest:toConnection:](self, "_sendShareRequest:toConnection:", v4, v7);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "containerID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@No process registered to handle container %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDUserCloudShareController _addRequestToPending:](v9, "_addRequestToPending:", v4);
    -[HMDUserCloudShareController delegate](v9, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userCloudShareController:wakeClientWithContainerID:", v9, v14);

  }
}

- (void)handleShareForRemoteClientRequest:(id)a3 home:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  HMDUserCloudShareController *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *logger;
  HMDUserCloudShareEstablishShareRequest *v59;
  void *v60;
  void *v61;
  HMDUserCloudShareController *v62;
  void *v63;
  id v64;
  HMDUserCloudShareEstablishShareRequest *v65;
  NSObject *v66;
  HMDUserCloudShareEstablishShareRequest *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  HMDUserCloudShareController *v73;
  void *v74;
  id v75;
  void *v76;
  _QWORD block[5];
  HMDUserCloudShareEstablishShareRequest *v78;
  _QWORD aBlock[5];
  id v80;
  unint64_t v81;
  uint8_t buf[4];
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v75 = a5;
  v10 = v8;
  v11 = v9;
  v76 = v11;
  if (v10)
  {
    v12 = v11;
    v73 = self;
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD7190]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    v71 = v15;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v15);
    objc_msgSend(v12, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v17, "isEqual:", v16);

    if ((_DWORD)v15)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD7188]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      __findUserWithUUID(v18, v12);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD71C0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      __findUserWithUUID(v20, v12);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD71D0]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
      v24 = objc_retainAutorelease(v23);

      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD71C8]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
      v27 = objc_retainAutorelease(v26);

      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD7180]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
      v30 = objc_retainAutorelease(v29);

      if (v19 && v21 && v24 && v30 && v27)
      {
        v31 = 0;
      }
      else
      {
        v38 = v10;
        v39 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v83 = v41;
          _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode all required items from payload.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v39);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Could not decode payload"), CFSTR("Unable to decode all required items"), 0);
        v31 = objc_claimAutoreleasedReturnValue();
        v10 = v38;
      }
    }
    else
    {
      v35 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v83 = v37;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Messaged home had different identifier from payload.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v35);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Inconsistent payload home and originating home"), CFSTR("Messaged home must match home in payload"), 0);
      v31 = objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v21 = 0;
      v24 = 0;
      v27 = 0;
      v30 = 0;
    }

    self = v73;
  }
  else
  {
    v32 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v34;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not decode Remote ClientRequestPayload.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Could not decode payload"), CFSTR("Need a valid payload"), 0);
    v31 = objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v21 = 0;
    v24 = 0;
    v27 = 0;
    v30 = 0;
  }

  v74 = v10;
  v42 = v19;
  v43 = v21;
  v44 = v24;
  v45 = v27;
  v46 = v30;
  v47 = v46;
  v72 = v45;
  if (v31)
  {
    v70 = v46;
    v48 = (void *)v31;
    v49 = (void *)MEMORY[0x227676638]();
    v50 = self;
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v52;
      _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Could not decode payload.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v49);
    v53 = v75;
    v54 = v48;
    (*((void (**)(id, _QWORD, void *))v75 + 2))(v75, 0, v48);
    v55 = v76;
    v47 = v70;
    v56 = v72;
  }
  else
  {
    v69 = v44;
    v57 = v42;
    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      *(_DWORD *)buf = 138412290;
      v83 = v47;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MultiUser.Share.Req", "container=%{signpost.description:attribute}@ ", buf, 0xCu);
    }
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__HMDUserCloudShareController_handleShareForRemoteClientRequest_home_completionHandler___block_invoke;
    aBlock[3] = &unk_24E786390;
    aBlock[4] = self;
    v81 = 0xEEEEB0B5B2B2EEEELL;
    v80 = v75;
    v68 = _Block_copy(aBlock);
    v59 = [HMDUserCloudShareEstablishShareRequest alloc];
    -[HMDUserCloudShareController delegate](self, "delegate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "currentDateForUserCloudShareController:", self);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = self;
    v55 = v76;
    v63 = v57;
    v64 = v57;
    v44 = v69;
    v56 = v72;
    v65 = -[HMDUserCloudShareEstablishShareRequest initWithHome:fromUser:toUser:encodedShareURL:shareToken:containerID:currentDate:completion:](v59, "initWithHome:fromUser:toUser:encodedShareURL:shareToken:containerID:currentDate:completion:", v76, v64, v43, v69, v72, v47, v61, v68);

    -[HMDUserCloudShareController clientQueue](v62, "clientQueue");
    v66 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__HMDUserCloudShareController_handleShareForRemoteClientRequest_home_completionHandler___block_invoke_95;
    block[3] = &unk_24E79C268;
    block[4] = v62;
    v78 = v65;
    v67 = v65;
    dispatch_async(v66, block);

    v53 = v75;
    v42 = v63;

    v54 = 0;
  }

}

- (void)handleShareRepairForRemoteClientRequest:(id)a3 home:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v20;
  HMDUserCloudShareController *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDUserCloudShareRepairRequest *v25;
  void *v26;
  HMDUserCloudShareRepairRequest *v27;
  uint64_t v28;
  void *v29;
  HMDUserCloudShareController *v30;
  NSObject *v31;
  void *v32;
  void *context;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  HMDUserCloudShareRepairRequest *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD7180]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD71B0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  v36 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v17, &v36);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v36;
  if (v14)
    v19 = v18 == 0;
  else
    v19 = 1;
  if (v19)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing required items in payload", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Could not decode payload"), CFSTR("Unable to find required items in payload"), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v24);
  }
  else
  {
    -[HMDUserCloudShareController delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = [HMDUserCloudShareRepairRequest alloc];
    objc_msgSend(v24, "currentDateForUserCloudShareController:", self);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v9;
    v27 = -[HMDUserCloudShareRepairRequest initWithStartDate:containerID:home:repairInfo:](v25, "initWithStartDate:containerID:home:repairInfo:", v26, v14, v9, v18);

    -[HMDUserCloudShareController _connectionForContainerID:](self, "_connectionForContainerID:", v14);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v28)
    {
      -[HMDUserCloudShareController _sendRepairRequest:toConnection:](self, "_sendRepairRequest:toConnection:", v27, v28);
    }
    else
    {
      context = (void *)MEMORY[0x227676638]();
      v30 = self;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v32;
        v39 = 2112;
        v40 = v27;
        v41 = 2112;
        v42 = v14;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Add repair request %@ to pending for %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(context);
      -[HMDUserCloudShareController _addRequestToPending:](v30, "_addRequestToPending:", v27);
      objc_msgSend(v24, "userCloudShareController:wakeClientForRepairWithContainerID:", v30, v14);
    }
    v10[2](v10, 0);

    v9 = v34;
  }

}

- (void)timerDidFire:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserCloudShareController clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__HMDUserCloudShareController_timerDidFire___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_registerWithXpcClient:(id)a3 containerIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  HMDUserCloudShareController *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDUserCloudShareController *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  HMDUserCloudShareController *v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  id obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  +[HMDUserCloudShareController identifierForConnection:](HMDUserCloudShareController, "identifierForConnection:", v6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v35 = v7;
    v36 = v6;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v44 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          -[HMDUserCloudShareController containerIdToConnectionIdentifierMap](self, "containerIdToConnectionIdentifierMap", v35);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 && (objc_msgSend(v15, "isEqual:", v38) & 1) == 0)
          {
            v21 = (void *)MEMORY[0x227676638]();
            v22 = self;
            HMFGetOSLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v49 = v24;
              v50 = 2112;
              v51 = v15;
              v52 = 2112;
              v53 = v13;
              _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Another connection with identifier: %@ is registered for the same container: %@.", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v21);
          }
          else
          {
            v16 = (void *)MEMORY[0x227676638]();
            v17 = self;
            HMFGetOSLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v49 = v19;
              v50 = 2112;
              v51 = v38;
              v52 = 2112;
              v53 = v13;
              _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Registering connection identifier: %@ for container: %@.", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v16);
            -[HMDUserCloudShareController containerIdToConnectionIdentifierMap](v17, "containerIdToConnectionIdentifierMap");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v38, v13);

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      }
      while (v10);
    }

    -[HMDUserCloudShareController connectedClients](self, "connectedClients");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v36;
    objc_msgSend(v25, "addObject:", v36);

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v26 = obj;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v40 != v29)
            objc_enumerationMutation(v26);
          -[HMDUserCloudShareController _resumeRequestsForContainerID:connection:](self, "_resumeRequestsForContainerID:connection:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j), v36, v35);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v28);
    }

    v7 = v35;
  }
  else
  {
    v31 = (void *)MEMORY[0x227676638]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v34;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Cannot register a client without a valid connection identifier.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v31);
  }

}

- (void)registerWithXpcClient:(id)a3 containerIDs:(id)a4
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
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HMDUserCloudShareController_registerWithXpcClient_containerIDs___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)deregisterXpcClient:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDUserCloudShareController clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__HMDUserCloudShareController_deregisterXpcClient___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setContainerIdToConnectionIdentifierMap:(id)a3
{
  objc_storeStrong((id *)&self->_containerIdToConnectionIdentifierMap, a3);
}

- (HMDUserCloudShareControllerDelegate)delegate
{
  return (HMDUserCloudShareControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (double)pendingRequestTimeoutInterval
{
  return self->_pendingRequestTimeoutInterval;
}

- (HMFTimer)pendingRequestTimer
{
  return self->_pendingRequestTimer;
}

- (void)setPendingRequestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequestTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestTimer, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerIdToConnectionIdentifierMap, 0);
  objc_storeStrong((id *)&self->_connectedClients, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

uint64_t __51__HMDUserCloudShareController_deregisterXpcClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deregisterXpcClient:", *(_QWORD *)(a1 + 40));
}

uint64_t __66__HMDUserCloudShareController_registerWithXpcClient_containerIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerWithXpcClient:containerIDs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __44__HMDUserCloudShareController_timerDidFire___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handlePendingRequestTimeouts");
  objc_msgSend(*(id *)(a1 + 32), "setPendingRequestTimer:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_startTimerIfNeeded");
}

void __88__HMDUserCloudShareController_handleShareForRemoteClientRequest_home_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1[4] + 8);
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = 138412290;
    v11 = v6;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MultiUser.Share.Req", "error=%{signpost.description:attribute}@ ", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

uint64_t __88__HMDUserCloudShareController_handleShareForRemoteClientRequest_home_completionHandler___block_invoke_95(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleShareForRemoteClientRequest:", *(_QWORD *)(a1 + 40));
}

+ (id)identifierForConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get identifier for connection: %@ process info: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

  return v7;
}

void __42__HMDUserCloudShareController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v28_123932;
  logCategory__hmf_once_v28_123932 = v0;

}

@end
