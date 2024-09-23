@implementation HMDHomeMediaStateSubscriber

- (HMDHomeMediaStateSubscriber)initWithHomeUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5 remoteSubscriptionProvider:(id)a6 localSubscriptionProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDHomeMediaStateSubscriber *v17;
  uint64_t v18;
  NSUUID *homeUUID;
  uint64_t v20;
  NSMutableDictionary *subscribedAccessoriesToTokenMap;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDHomeMediaStateSubscriber;
  v17 = -[HMDHomeMediaStateSubscriber init](&v23, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    homeUUID = v17->_homeUUID;
    v17->_homeUUID = (NSUUID *)v18;

    objc_storeStrong((id *)&v17->_workQueue, a4);
    objc_storeStrong((id *)&v17->_remoteSubscriptionProvider, a6);
    objc_storeStrong((id *)&v17->_localSubscriptionProvider, a7);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    subscribedAccessoriesToTokenMap = v17->_subscribedAccessoriesToTokenMap;
    v17->_subscribedAccessoriesToTokenMap = (NSMutableDictionary *)v20;

    objc_storeWeak((id *)&v17->_dataSource, v14);
  }

  return v17;
}

- (void)subscribeForAppleMediaStateWithSubscriptionToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHomeMediaStateSubscriber workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__HMDHomeMediaStateSubscriber_subscribeForAppleMediaStateWithSubscriptionToken___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)unsubscribeForAppleMediaStateWithSubscriptionToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHomeMediaStateSubscriber workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__HMDHomeMediaStateSubscriber_unsubscribeForAppleMediaStateWithSubscriptionToken___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)subscribeForAppleMediaStateForAccessory:(id)a3 subscriptionToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDHomeMediaStateSubscriber *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  HMDHomeMediaStateSubscriber *v19;
  NSObject *v20;
  void *v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDHomeMediaStateSubscriber dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "currentAccessoryUUIDsForMediaStateSubscriber:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && (objc_msgSend(v6, "uuid"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v10),
          v11,
          v12))
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v16;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping subscribe to media state for current accessory : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }
    else
    {
      -[HMDHomeMediaStateSubscriber workQueue](self, "workQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __89__HMDHomeMediaStateSubscriber_subscribeForAppleMediaStateForAccessory_subscriptionToken___block_invoke;
      block[3] = &unk_24E79BBD0;
      block[4] = self;
      v23 = v6;
      v24 = v7;
      dispatch_async(v17, block);

    }
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v21;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to subscribe to media state for accessory : %@, nil data source", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }

}

- (void)unsubscribeForAppleMediaStateForAccessory:(id)a3 subscriptionToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDHomeMediaStateSubscriber *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  HMDHomeMediaStateSubscriber *v19;
  NSObject *v20;
  void *v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDHomeMediaStateSubscriber dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "currentAccessoryUUIDsForMediaStateSubscriber:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && (objc_msgSend(v6, "uuid"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v10),
          v11,
          v12))
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v16;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping unsubscribe to media state for current accessory : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }
    else
    {
      -[HMDHomeMediaStateSubscriber workQueue](self, "workQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __91__HMDHomeMediaStateSubscriber_unsubscribeForAppleMediaStateForAccessory_subscriptionToken___block_invoke;
      block[3] = &unk_24E79BBD0;
      block[4] = self;
      v23 = v6;
      v24 = v7;
      dispatch_async(v17, block);

    }
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v21;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to unsubscribe to media state for accessory : %@, nil data source", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }

}

- (void)localSubscribeForAppleMediaState
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHomeMediaStateSubscriber workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HMDHomeMediaStateSubscriber_localSubscribeForAppleMediaState__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)localUnsubscribeForAppleMediaState
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHomeMediaStateSubscriber workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HMDHomeMediaStateSubscriber_localUnsubscribeForAppleMediaState__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)localUnsubscribeForAppleMediaStateForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMDHomeMediaStateSubscriber *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  HMDHomeMediaStateSubscriber *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeMediaStateSubscriber dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "currentAccessoryUUIDsForMediaStateSubscriber:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (objc_msgSend(v4, "uuid"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "hmf_isEqualToUUID:", v7),
          v8,
          v9))
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v13;
        v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Skipping local unsubscribe to media state for current accessory : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }
    else
    {
      -[HMDHomeMediaStateSubscriber workQueue](self, "workQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __78__HMDHomeMediaStateSubscriber_localUnsubscribeForAppleMediaStateForAccessory___block_invoke;
      v19[3] = &unk_24E79C268;
      v19[4] = self;
      v20 = v4;
      dispatch_async(v14, v19);

    }
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v18;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to locally unsubscribe to media state for accessory : %@, nil data source", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)localSubscribeForAppleMediaStateForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMDHomeMediaStateSubscriber *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  HMDHomeMediaStateSubscriber *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeMediaStateSubscriber dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "currentAccessoryUUIDsForMediaStateSubscriber:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (objc_msgSend(v4, "uuid"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "hmf_isEqualToUUID:", v7),
          v8,
          v9))
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v13;
        v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Skipping local subscribe to media state for current accessory : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }
    else
    {
      -[HMDHomeMediaStateSubscriber workQueue](self, "workQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __76__HMDHomeMediaStateSubscriber_localSubscribeForAppleMediaStateForAccessory___block_invoke;
      v19[3] = &unk_24E79C268;
      v19[4] = self;
      v20 = v4;
      dispatch_async(v14, v19);

    }
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v18;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to locally subscribe to media state for accessory : %@, nil data source", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  -[HMDHomeMediaStateSubscriber processEvent:topic:](self, a3, a4);
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  -[HMDHomeMediaStateSubscriber processEvent:topic:](self, a3, a4);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHomeMediaStateSubscriber homeUUID](self, "homeUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDHomeMediaStateSubscriberDataSource)dataSource
{
  return (HMDHomeMediaStateSubscriberDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMESubscriptionProviding)remoteSubscriptionProvider
{
  return self->_remoteSubscriptionProvider;
}

- (HMESubscriptionProviding)localSubscriptionProvider
{
  return self->_localSubscriptionProvider;
}

- (NSMutableDictionary)subscribedAccessoriesToTokenMap
{
  return self->_subscribedAccessoriesToTokenMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedAccessoriesToTokenMap, 0);
  objc_storeStrong((id *)&self->_localSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_remoteSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)processEvent:(void *)a3 topic:
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__HMDHomeMediaStateSubscriber_processEvent_topic___block_invoke;
    block[3] = &unk_24E79BBD0;
    block[4] = a1;
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

void __50__HMDHomeMediaStateSubscriber_processEvent_topic___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
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
  id v40;
  NSObject *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  const char *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  id v76;
  __int16 v77;
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    objc_msgSend(v1, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    objc_msgSend(MEMORY[0x24BDD7640], "decodeTopic:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asAccessoryTopic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v1, "homeUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "homeUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "hmf_isEqualToUUID:", v9);

      if ((v10 & 1) != 0)
      {
        v11 = objc_msgSend(v7, "accessoryEventTopicSuffixID");
        if (v11 == *MEMORY[0x24BDD4BA0])
        {
          v12 = objc_alloc(MEMORY[0x24BDD73B0]);
          objc_msgSend(v3, "encodedData");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v12, "initWithProtoData:", v13);

          if (v14)
          {
            objc_msgSend(v7, "accessoryUUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v14;
            v17 = v15;
            objc_msgSend(v1, "workQueue");
            v18 = objc_claimAutoreleasedReturnValue();
            dispatch_assert_queue_V2(v18);

            objc_msgSend(v1, "dataSource");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "mediaProfileForAppleMediaAccessoryUUID:mediaStateSubscriber:", v17, v1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = (void *)MEMORY[0x227676638]();
            v22 = v1;
            HMFGetOSLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v20)
            {
              v69 = v17;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v74 = v25;
                v75 = 2112;
                v76 = v69;
                v77 = 2112;
                v78 = v16;
                _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Updating Media State for accessory: %@ to: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v21);
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "mediaIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, *MEMORY[0x24BDD66C8]);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v16, "playbackState"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, *MEMORY[0x24BDD66E0]);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v16, "shuffleState"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BDD6738]);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v16, "repeatState"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BDD6708]);

              v31 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v16, "volume");
              objc_msgSend(v31, "numberWithDouble:");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BDD6758]);

              objc_msgSend(v20, "uniqueIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "UUIDString");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BDD66B8]);

              objc_msgSend(v20, "mediaSession");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "uuid");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "UUIDString");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v37, *MEMORY[0x24BDD6750]);

              v38 = (void *)objc_msgSend(v26, "copy");
              objc_msgSend(v20, "handleSessionUpdatedNotification:", v38);

              v17 = v69;
              goto LABEL_35;
            }
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v74 = v71;
              v75 = 2112;
              v76 = v17;
              _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@No media profile found for accessory %@", buf, 0x16u);

            }
LABEL_34:

            objc_autoreleasePoolPop(v21);
LABEL_35:

            goto LABEL_36;
          }
          v61 = (void *)MEMORY[0x227676638]();
          v62 = v1;
          HMFGetOSLogHandle();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "encodedData");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v74 = v64;
            v75 = 2112;
            v76 = v4;
            v77 = 2112;
            v78 = v65;
            v66 = "%{public}@Skipping handling of accessory topic: %@ with bad media state payload: %@";
LABEL_30:
            _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_ERROR, v66, buf, 0x20u);

            goto LABEL_31;
          }
          goto LABEL_31;
        }
        v44 = objc_msgSend(v7, "accessoryEventTopicSuffixID");
        if (v44 == *MEMORY[0x24BDD4BC8])
        {
          v45 = objc_alloc(MEMORY[0x24BDD73E0]);
          objc_msgSend(v3, "encodedData");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v45, "initWithProtoData:", v46);

          if (v14)
          {
            objc_msgSend(v7, "accessoryUUID");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v14;
            v17 = v47;
            objc_msgSend(v1, "workQueue");
            v48 = objc_claimAutoreleasedReturnValue();
            dispatch_assert_queue_V2(v48);

            objc_msgSend(v1, "dataSource");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "mediaProfileForAppleMediaAccessoryUUID:mediaStateSubscriber:", v17, v1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = (void *)MEMORY[0x227676638]();
            v22 = v1;
            HMFGetOSLogHandle();
            v50 = objc_claimAutoreleasedReturnValue();
            v24 = v50;
            if (v20)
            {
              v70 = v14;
              v51 = v16;
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v74 = v52;
                v75 = 2112;
                v76 = v17;
                v77 = 2112;
                v78 = v51;
                _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Updating sleep wake state for accessory: %@ to: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v21);
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v51, "sleepWakeState"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "setObject:forKeyedSubscript:", v54, *MEMORY[0x24BDD6748]);

              objc_msgSend(v20, "uniqueIdentifier");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "UUIDString");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "setObject:forKeyedSubscript:", v56, *MEMORY[0x24BDD66B8]);

              objc_msgSend(v20, "mediaSession");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "uuid");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "UUIDString");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "setObject:forKeyedSubscript:", v59, *MEMORY[0x24BDD6750]);

              v60 = (void *)objc_msgSend(v53, "copy");
              objc_msgSend(v20, "handleSessionUpdatedNotification:", v60);

              v16 = v51;
              v14 = v70;
              goto LABEL_35;
            }
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v72 = v14;
              v67 = v16;
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v74 = v68;
              v75 = 2112;
              v76 = v17;
              _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@No media profile found for accessory %@", buf, 0x16u);

              v16 = v67;
              v14 = v72;
            }
            goto LABEL_34;
          }
          v61 = (void *)MEMORY[0x227676638]();
          v62 = v1;
          HMFGetOSLogHandle();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "encodedData");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v74 = v64;
            v75 = 2112;
            v76 = v4;
            v77 = 2112;
            v78 = v65;
            v66 = "%{public}@Skipping handling of accessory topic: %@ with bad sleep wake state payload: %@";
            goto LABEL_30;
          }
LABEL_31:

          objc_autoreleasePoolPop(v61);
LABEL_36:

          goto LABEL_37;
        }
        v39 = (void *)MEMORY[0x227676638]();
        v40 = v1;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v42;
          v75 = 2112;
          v76 = v4;
          v43 = "%{public}@Skipping handling of unexpected accessory topic: %@";
          goto LABEL_22;
        }
LABEL_23:

        objc_autoreleasePoolPop(v39);
LABEL_37:

        goto LABEL_38;
      }
      v39 = (void *)MEMORY[0x227676638]();
      v40 = v1;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v74 = v42;
      v75 = 2112;
      v76 = v4;
      v43 = "%{public}@Skipping handling of accessory topic: %@ with unexpected home";
    }
    else
    {
      v39 = (void *)MEMORY[0x227676638]();
      v40 = v1;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v74 = v42;
      v75 = 2112;
      v76 = v4;
      v43 = "%{public}@Skipping handling of non accessory topic: %@";
    }
LABEL_22:
    _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, v43, buf, 0x16u);

    goto LABEL_23;
  }
LABEL_38:

}

void __76__HMDHomeMediaStateSubscriber_localSubscribeForAppleMediaStateForAccessory___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaStateSubscriber _localSubscribeForAppleMediaState:forAccessories:](v1, 1, v3);

}

- (void)_localSubscribeForAppleMediaState:(void *)a3 forAccessories:
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  char v23;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = v19;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v26;
      if (a2)
        v10 = v5;
      else
        v10 = v6;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
          objc_msgSend(a1, "homeUUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomeMediaStateSubscriber topicsForAccessoryUUID:homeUUID:](v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "addObjectsFromArray:", v14);
          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count") || objc_msgSend(v6, "count"))
    {
      objc_initWeak(&location, a1);
      objc_msgSend(a1, "localSubscriptionProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v5, "copy");
      v17 = (void *)objc_msgSend(v6, "copy");
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __80__HMDHomeMediaStateSubscriber__localSubscribeForAppleMediaState_forAccessories___block_invoke;
      v20[3] = &unk_24E78A640;
      objc_copyWeak(&v22, &location);
      v23 = a2;
      v21 = v7;
      objc_msgSend(v15, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", a1, v16, v17, v20);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }

  }
}

- (id)topicsForAccessoryUUID:(void *)a1 homeUUID:(void *)a2
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD73A0];
  v4 = *MEMORY[0x24BDD4BA0];
  v5 = a2;
  v6 = a1;
  objc_msgSend(v3, "topicFromSuffixID:homeUUID:accessoryUUID:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDD73A0], "topicFromSuffixID:homeUUID:accessoryUUID:", *MEMORY[0x24BDD4BC8], v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __80__HMDHomeMediaStateSubscriber__localSubscribeForAppleMediaState_forAccessories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  const __CFString *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x227676638]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = *(unsigned __int8 *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    if (v13)
      v15 = CFSTR("subscribe");
    else
      v15 = CFSTR("unsubscribe");
    v21 = v11;
    v22 = 2112;
    v23 = v15;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Did %@ locally to apple media state for accessories: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  if (objc_msgSend(v5, "count") && v9)
  {
    objc_msgSend(v9, "workQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __80__HMDHomeMediaStateSubscriber__localSubscribeForAppleMediaState_forAccessories___block_invoke_10;
    v17[3] = &unk_24E79C268;
    v18 = v5;
    v19 = v9;
    dispatch_async(v16, v17);

  }
}

void __80__HMDHomeMediaStateSubscriber__localSubscribeForAppleMediaState_forAccessories___block_invoke_10(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7, (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeMediaStateSubscriber processEvent:topic:](*(void **)(a1 + 40), v8, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __78__HMDHomeMediaStateSubscriber_localUnsubscribeForAppleMediaStateForAccessory___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaStateSubscriber _localSubscribeForAppleMediaState:forAccessories:](v1, 0, v3);

}

void __65__HMDHomeMediaStateSubscriber_localUnsubscribeForAppleMediaState__block_invoke(uint64_t a1)
{
  id v2;

  -[HMDHomeMediaStateSubscriber nonCurrentAccessoryUUIDs](*(id *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaStateSubscriber _localSubscribeForAppleMediaState:forAccessories:](*(void **)(a1 + 32), 0, v2);

}

- (id)nonCurrentAccessoryUUIDs
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v1 = a1;
  v17 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(a1, "dataSource");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "appleMediaAccessoryUUIDsForMediaStateSubscriber:", v1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count"))
      {
        objc_msgSend(v3, "currentAccessoryUUIDsForMediaStateSubscriber:", v1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (v5)
        {
          v13[0] = MEMORY[0x24BDAC760];
          v13[1] = 3221225472;
          v13[2] = __55__HMDHomeMediaStateSubscriber_nonCurrentAccessoryUUIDs__block_invoke;
          v13[3] = &unk_24E79BCA0;
          v14 = v5;
          objc_msgSend(v4, "na_filter:", v13);
          v7 = objc_claimAutoreleasedReturnValue();

          v4 = (id)v7;
        }
        v4 = v4;

        v1 = v4;
      }
      else
      {
        v1 = (id)MEMORY[0x24BDBD1A8];
      }

    }
    else
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = v1;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v16 = v11;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to get non-current accessory uuids due to nil data source", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      v1 = (id)MEMORY[0x24BDBD1A8];
    }

  }
  return v1;
}

uint64_t __55__HMDHomeMediaStateSubscriber_nonCurrentAccessoryUUIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32)) ^ 1;
}

void __63__HMDHomeMediaStateSubscriber_localSubscribeForAppleMediaState__block_invoke(uint64_t a1)
{
  id v2;

  -[HMDHomeMediaStateSubscriber nonCurrentAccessoryUUIDs](*(id *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaStateSubscriber _localSubscribeForAppleMediaState:forAccessories:](*(void **)(a1 + 32), 1, v2);

}

void __91__HMDHomeMediaStateSubscriber_unsubscribeForAppleMediaStateForAccessory_subscriptionToken___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaStateSubscriber _subscribeForAppleMediaState:forAccessories:subscriptionToken:](v2, 0, v4, *(void **)(a1 + 48));

}

- (void)_subscribeForAppleMediaState:(void *)a3 forAccessories:(void *)a4 subscriptionToken:
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id obj;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  char v37;
  id location;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  v33 = a4;
  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v29;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v40;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v40 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
          objc_msgSend(a1, "homeUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomeMediaStateSubscriber topicsForAccessoryUUID:homeUUID:](v11, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1, "subscribedAccessoriesToTokenMap");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (a2)
          {
            v17 = v15 == 0;

            if (v17)
            {
              objc_msgSend(MEMORY[0x24BDBCEF0], "set");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "subscribedAccessoriesToTokenMap");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v11);

              objc_msgSend(v31, "addObjectsFromArray:", v13);
            }
            objc_msgSend(a1, "subscribedAccessoriesToTokenMap");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v33);

          }
          else
          {
            objc_msgSend(v15, "removeObject:", v33);

            objc_msgSend(a1, "subscribedAccessoriesToTokenMap");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v11);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count") == 0;

            if (v24)
            {
              objc_msgSend(a1, "subscribedAccessoriesToTokenMap");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", 0, v11);

              objc_msgSend(v30, "addObjectsFromArray:", v13);
            }
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v31, "count") || objc_msgSend(v30, "count"))
    {
      objc_initWeak(&location, a1);
      objc_msgSend(a1, "remoteSubscriptionProvider");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v31, "copy");
      v28 = (void *)objc_msgSend(v30, "copy");
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __93__HMDHomeMediaStateSubscriber__subscribeForAppleMediaState_forAccessories_subscriptionToken___block_invoke;
      v34[3] = &unk_24E78A640;
      objc_copyWeak(&v36, &location);
      v37 = a2;
      v35 = obj;
      objc_msgSend(v26, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", a1, v27, v28, v34);

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }

  }
}

void __93__HMDHomeMediaStateSubscriber__subscribeForAppleMediaState_forAccessories_subscriptionToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  const __CFString *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x227676638]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = *(unsigned __int8 *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    if (v13)
      v15 = CFSTR("subscribe");
    else
      v15 = CFSTR("unsubscribe");
    v21 = v11;
    v22 = 2112;
    v23 = v15;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Did %@ to apple media state for accessories: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  if (objc_msgSend(v5, "count") && v9)
  {
    objc_msgSend(v9, "workQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __93__HMDHomeMediaStateSubscriber__subscribeForAppleMediaState_forAccessories_subscriptionToken___block_invoke_8;
    v17[3] = &unk_24E79C268;
    v18 = v5;
    v19 = v9;
    dispatch_async(v16, v17);

  }
}

void __93__HMDHomeMediaStateSubscriber__subscribeForAppleMediaState_forAccessories_subscriptionToken___block_invoke_8(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7, (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeMediaStateSubscriber processEvent:topic:](*(void **)(a1 + 40), v8, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __89__HMDHomeMediaStateSubscriber_subscribeForAppleMediaStateForAccessory_subscriptionToken___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaStateSubscriber _subscribeForAppleMediaState:forAccessories:subscriptionToken:](v2, 1, v4, *(void **)(a1 + 48));

}

void __82__HMDHomeMediaStateSubscriber_unsubscribeForAppleMediaStateWithSubscriptionToken___block_invoke(uint64_t a1)
{
  id v2;

  -[HMDHomeMediaStateSubscriber nonCurrentAccessoryUUIDs](*(id *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaStateSubscriber _subscribeForAppleMediaState:forAccessories:subscriptionToken:](*(void **)(a1 + 32), 0, v2, *(void **)(a1 + 40));

}

void __80__HMDHomeMediaStateSubscriber_subscribeForAppleMediaStateWithSubscriptionToken___block_invoke(uint64_t a1)
{
  id v2;

  -[HMDHomeMediaStateSubscriber nonCurrentAccessoryUUIDs](*(id *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaStateSubscriber _subscribeForAppleMediaState:forAccessories:subscriptionToken:](*(void **)(a1 + 32), 1, v2, *(void **)(a1 + 40));

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_157417 != -1)
    dispatch_once(&logCategory__hmf_once_t20_157417, &__block_literal_global_157418);
  return (id)logCategory__hmf_once_v21_157419;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __42__HMDHomeMediaStateSubscriber_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v21_157419;
  logCategory__hmf_once_v21_157419 = v0;

}

@end
