@implementation HMDHomeAssistantOperation

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDHomeAssistantOperation;
  -[HMDHomeAssistantOperation dealloc](&v4, sel_dealloc);
}

- (void)handleAccessoryIsReachable:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDHomeAssistantOperation *v9;

  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HMDHomeAssistantOperation_handleAccessoryIsReachable___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)timerDidFire:(id)a3
{
  HMFTimer *v4;
  HMFTimer *accessoryConnectivityWaitTimer;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  HMDHomeAssistantOperation *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    accessoryConnectivityWaitTimer = self->_accessoryConnectivityWaitTimer;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    accessoryConnectivityWaitTimer = 0;
  }
  if (accessoryConnectivityWaitTimer == v4)
  {
    v6 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = self;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[%@] Accessory connectivity wait timer has fired", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDHomeAssistantOperation _callCompletion]((uint64_t)self);
  }

}

- (void)startWithCompletion:(id)a3
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__HMDHomeAssistantOperation_startWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_reachableAccessoriesToOperateOn, 0);
  objc_storeStrong((id *)&self->_accessoriesToOperateOn, 0);
  objc_storeStrong((id *)&self->_accessoryConnectivityWaitTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __49__HMDHomeAssistantOperation_startWithCompletion___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_setProperty_nonatomic_copy(v4, a2, v3, 48);
      v4 = *(void **)(a1 + 32);
    }
    v5 = -[HMDHomeAssistantOperation _testForReachability]((uint64_t)v4);
    v6 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v8)
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 32);
        v19 = 138543618;
        v20 = v9;
        v21 = 2112;
        v22 = v10;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[%@] Reachability test has passed, calling completion right away", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      -[HMDHomeAssistantOperation _callCompletion](*(_QWORD *)(a1 + 32));
    }
    else
    {
      if (v8)
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 32);
        v19 = 138543618;
        v20 = v15;
        v21 = 2112;
        v22 = v16;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[%@] Reachability test did not pass, starting accessory connectivity timer", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      v17 = *(_QWORD *)(a1 + 32);
      if (v17)
        v18 = *(void **)(v17 + 24);
      else
        v18 = 0;
      objc_msgSend(v18, "resume");
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v19 = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%@] Did not receive completion handler, cannot perform operation", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
}

- (uint64_t)_testForReachability
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = a1;
  if (a1)
  {
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "count");
    v1 = v3 == objc_msgSend(*(id *)(v1 + 32), "count");

  }
  return v1;
}

- (void)_callCompletion
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 8))
    {
      v2 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 138543618;
        v6 = v4;
        v7 = 2112;
        v8 = a1;
        _os_log_impl(&dword_2218F0000, v3, OS_LOG_TYPE_INFO, "%{public}@[%@] Completion handler has already been called", (uint8_t *)&v5, 0x16u);

      }
      objc_autoreleasePoolPop(v2);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 24), "suspend");
      *(_BYTE *)(a1 + 8) = 1;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
}

void __56__HMDHomeAssistantOperation_handleAccessoryIsReachable___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = v3 ? *(void **)(v3 + 40) : 0;
    objc_msgSend(v4, "addObject:", v2);
    if (-[HMDHomeAssistantOperation _testForReachability](*(_QWORD *)(a1 + 40)))
    {
      v5 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v2, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUIDString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543874;
        v12 = v7;
        v13 = 2112;
        v14 = v8;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@] Accessory %@ is reachable, reachability test has passed, calling completion right away", (uint8_t *)&v11, 0x20u);

      }
      objc_autoreleasePoolPop(v5);
      -[HMDHomeAssistantOperation _callCompletion](*(_QWORD *)(a1 + 40));
    }
  }

}

+ (id)homeAssistantOperationWithWriteRequests:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "characteristic", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "accessory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v7, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v15 = -[HMDHomeAssistantOperation initWithAccessories:queue:]([HMDHomeAssistantOperation alloc], v7, v6);
  return v15;
}

+ (id)homeAssistantOperationWithReadRequests:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "characteristic", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "accessory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v7, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v15 = -[HMDHomeAssistantOperation initWithAccessories:queue:]([HMDHomeAssistantOperation alloc], v7, v6);
  return v15;
}

+ (id)homeAssistantOperationWithActionSet:(id)a3 queue:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id *v31;
  id v33;
  void *v34;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v33 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v34 = v5;
  objc_msgSend(v5, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
LABEL_3:
    v10 = 0;
    while (2)
    {
      if (*(_QWORD *)v42 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v10);
      switch(objc_msgSend(v11, "type"))
      {
        case 0:
          v12 = v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
          v14 = v13;

          if (v14)
          {
            objc_msgSend(v14, "characteristic");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
          v26 = (void *)MEMORY[0x227676638]();
          v27 = a1;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          goto LABEL_45;
        case 1:
          v12 = v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v19 = v12;
          else
            v19 = 0;
          v14 = v19;

          if (v14)
          {
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            objc_msgSend(v14, "mediaProfiles");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v38;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v38 != v22)
                    objc_enumerationMutation(v18);
                  objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "accessory");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "addObject:", v24);

                }
                v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              }
              while (v21);
            }
            goto LABEL_31;
          }
          v26 = (void *)MEMORY[0x227676638]();
          v27 = a1;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          goto LABEL_45;
        case 3:
          v12 = v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v12;
          else
            v16 = 0;
          v14 = v16;

          if (!v14)
          {
            v26 = (void *)MEMORY[0x227676638]();
            v27 = a1;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              goto LABEL_46;
            goto LABEL_45;
          }
          objc_msgSend(v14, "lightProfile");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
          v17 = v15;
          objc_msgSend(v15, "accessory");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
            goto LABEL_31;
          goto LABEL_18;
        case 4:
          v12 = v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v25 = v12;
          else
            v25 = 0;
          v14 = v25;

          if (v14)
          {
            objc_msgSend(v14, "accessory");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
LABEL_18:
              objc_msgSend(v6, "addObject:", v18);
LABEL_31:

          }
          else
          {
            v26 = (void *)MEMORY[0x227676638]();
            v27 = a1;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
LABEL_45:
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              HMActionTypeAsString();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v47 = v29;
              v48 = 2112;
              v49 = v12;
              v50 = 2112;
              v51 = v30;
              _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

            }
LABEL_46:

            objc_autoreleasePoolPop(v26);
            v14 = 0;
          }

LABEL_48:
          if (++v10 != v8)
            continue;
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
          if (!v8)
            goto LABEL_50;
          goto LABEL_3;
        default:
          goto LABEL_48;
      }
    }
  }
LABEL_50:

  v31 = -[HMDHomeAssistantOperation initWithAccessories:queue:]([HMDHomeAssistantOperation alloc], v6, v33);
  return v31;
}

- (id)initWithAccessories:(void *)a3 queue:
{
  id v6;
  id v7;
  id *v8;
  id *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  int *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v38;
  id v39;
  id *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (!a1)
  {
    v9 = 0;
    goto LABEL_23;
  }
  v47.receiver = a1;
  v47.super_class = (Class)HMDHomeAssistantOperation;
  v8 = (id *)objc_msgSendSuper2(&v47, sel_init);
  v9 = v8;
  if (v8)
  {
    v38 = v7;
    objc_storeStrong(v8 + 2, a3);
    v10 = objc_alloc(MEMORY[0x24BE3F298]);
    v11 = objc_msgSend(v10, "initWithTimeInterval:options:", 0, *(double *)&accessoryConnectivityWaitPeriod);
    v12 = v9[3];
    v9[3] = (id)v11;

    objc_msgSend(v9[3], "setDelegate:", v9);
    objc_msgSend(v9[3], "setDelegateQueue:", v9[2]);
    objc_storeStrong(v9 + 4, a2);
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v6, "count"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v9[5];
    v9[5] = (id)v13;

    *((_BYTE *)v9 + 8) = 0;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v39 = v6;
    v15 = v6;
    v16 = &OBJC_IVAR___HMDProcessLaunchInfoLogEvent__numUncommittedAndPushedRecords;
    v17 = v15;
    v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    if (!v18)
      goto LABEL_20;
    v19 = v18;
    v20 = *(_QWORD *)v44;
    v40 = v9;
    v42 = v17;
    while (1)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v44 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v38);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObserver:selector:name:object:", v9, sel_handleAccessoryIsReachable_, CFSTR("HMDAccessoryIsReachableNotification"), v22);

        v24 = v22;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
        v26 = v25;

        if ((objc_msgSend(v26, "isReachable") & 1) != 0)
          goto LABEL_12;
        if (objc_msgSend(v26, "isPrimary") && objc_msgSend(v26, "hasBTLELink"))
        {
          v27 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v41 = v27;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "uuid");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "UUIDString");
            v31 = (id *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v49 = v29;
            v50 = 2112;
            v51 = v31;
            _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Assuming reachability for primary BTLE accessory %@", buf, 0x16u);

            v9 = v40;
            v16 = &OBJC_IVAR___HMDProcessLaunchInfoLogEvent__numUncommittedAndPushedRecords;

            v27 = v41;
          }

          objc_autoreleasePoolPop(v27);
          v17 = v42;
LABEL_12:
          objc_msgSend(*(id *)((char *)v9 + v16[495]), "addObject:", v24);
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
      if (!v19)
      {
LABEL_20:

        v32 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v9[4], "count");
          v36 = objc_msgSend(v9[5], "count");
          *(_DWORD *)buf = 138544130;
          v49 = v34;
          v50 = 2112;
          v51 = v9;
          v52 = 2048;
          v53 = v35;
          v54 = 2048;
          v55 = v36;
          _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@[%@] Need to perform operation on %ld accessories, and reachable accessory count is %ld", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v32);
        v7 = v38;
        v6 = v39;
        break;
      }
    }
  }
LABEL_23:

  return v9;
}

@end
