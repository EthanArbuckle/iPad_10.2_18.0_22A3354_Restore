@implementation HMDMediaDestinationsManager

- (HMDMediaDestinationsManager)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 dataSource:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDMediaDestinationsMessageHandler *v17;
  HMDMediaDestinationsManager *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[HMDMediaDestinationsMessageHandler initWithDestination:messageDispatcher:notificationCenter:dataSource:delegate:]([HMDMediaDestinationsMessageHandler alloc], "initWithDestination:messageDispatcher:notificationCenter:dataSource:delegate:", v16, v15, v14, self, self);

  v18 = -[HMDMediaDestinationsManager initWithDestination:messageHandler:dataSource:delegate:](self, "initWithDestination:messageHandler:dataSource:delegate:", v16, v17, v13, v12);
  return v18;
}

- (HMDMediaDestinationsManager)initWithDestination:(id)a3 messageHandler:(id)a4 dataSource:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDMediaDestinationsManager *v16;
  HMDMediaDestinationsManager *v17;
  HMDMediaDestinationsManager *result;
  HMDMediaDestinationsManager *v19;
  SEL v20;
  id v21;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v12)
  {
LABEL_7:
    v19 = (HMDMediaDestinationsManager *)_HMFPreconditionFailure();
    -[HMDMediaDestinationsManager configureWithHome:](v19, v20, v21);
    return result;
  }
  v15 = v14;
  v22.receiver = self;
  v22.super_class = (Class)HMDMediaDestinationsManager;
  v16 = -[HMDMediaDestinationsManager init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_destination, a3);
    objc_storeStrong((id *)&v17->_messageHandler, a4);
    objc_storeWeak((id *)&v17->_dataSource, v13);
    objc_storeWeak((id *)&v17->_delegate, v15);
  }

  return v17;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationsManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  HMDMediaDestinationsManager *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaDestinationsManager committedDestination](v6, "committedDestination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring destinations manager: %@ destination: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaDestinationsManager messageHandler](v6, "messageHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configureWithHome:", v4);

  -[HMDMediaDestinationsManager refreshDestination](v6, "refreshDestination");
}

- (void)stageAudioGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationsManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaDestinationsManager *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Stageing audio group identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDMediaDestinationsManager dataSourceAssociatedDestinationManagers](v6, "dataSourceAssociatedDestinationManagers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __57__HMDMediaDestinationsManager_stageAudioGroupIdentifier___block_invoke;
      v14[3] = &unk_24E7740A8;
      v15 = v4;
      objc_msgSend(v9, "na_each:", v14);
      -[HMDMediaDestinationsManager refreshDestination](v6, "refreshDestination");

    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = v6;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage audio group identifier due to no associated destination managers", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
    }

  }
}

- (void)requestToUpdateAudioGroupIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationsManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDMediaDestinationsManager *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@HT QFA is not enabled", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDMediaDestinationsManager legacyRequestToUpdateAudioGroupIdentifier:completion:](v12, "legacyRequestToUpdateAudioGroupIdentifier:completion:", v6, v7);
  }
  else
  {
    -[HMDMediaDestinationsManager mediaGroupsAggregatorMessenger](self, "mediaGroupsAggregatorMessenger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[HMDMediaDestinationsManager destination](self, "destination");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "parentIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sendRequestToUpdateAssociatedGroupIdentifier:forGroupIdentifier:completion:", v6, v10, v7);

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
        v19 = 138543618;
        v20 = v18;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to request update audio group identifier: %@ due to no aggregator messenger", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v9);
    }

  }
}

- (void)legacyRequestToUpdateAudioGroupIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDMediaDestinationsManager messageHandler](self, "messageHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendRequestToUpdateAudioGroupIdentifier:completion:", v7, v6);

}

- (void)mergeDestination:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  HMDMediaDestinationsManager *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaDestinationsManager destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging destination: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDMediaDestinationsManager setDestination:](v8, "setDestination:", v4);
  }

}

- (void)refreshDestination
{
  void *v3;
  HMDMediaDestinationsManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDMediaDestinationsManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDMediaDestinationsManager *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Refreshing destination", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDMediaDestinationsManager destination](v4, "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaDestinationsManager deriveAudioDestination](v4, "deriveAudioDestination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((HMFEqualObjects() & 1) == 0)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = v4;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543874;
        v21 = v12;
        v22 = 2112;
        v23 = v7;
        v24 = 2112;
        v25 = v8;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating audio destination: %@ with derived audio destination: %@", (uint8_t *)&v20, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
      -[HMDMediaDestinationsManager setDestination:](v10, "setDestination:", v8);
      -[HMDMediaDestinationsManager messageHandler](v10, "messageHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleUpdatedDestination:", v8);

      -[HMDMediaDestinationsManager delegate](v10, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "mediaDestinationsManager:didUpdateDestination:", v10, v8);
      }
      else
      {
        v16 = (void *)MEMORY[0x227676638]();
        v17 = v10;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543362;
          v21 = v19;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify delegate of updated destination due to no delegate", (uint8_t *)&v20, 0xCu);

        }
        objc_autoreleasePoolPop(v16);
      }

    }
  }
}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[HMDMediaDestinationsManager destination](self, "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)sendRequestsToUpdateSupportOptions:(unint64_t)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id obj;
  HMDMediaDestinationsManager *v27;
  _QWORD v28[6];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationsManager dataSourceAssociatedDestinationManagers](self, "dataSourceAssociatedDestinationManagers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v27 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HMMediaDestinationSupportOptionsAsString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v8;
      v37 = 2112;
      v38 = v9;
      v39 = 2112;
      v40 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending request to update supported options: %@ managers: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = v4;
    obj = v4;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      v14 = MEMORY[0x24BDAC760];
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
          v17 = objc_alloc_init(MEMORY[0x24BE6B608]);
          objc_msgSend(v10, "addObject:", v17);
          objc_msgSend(v16, "messageHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = v14;
          v28[1] = 3221225472;
          v28[2] = __66__HMDMediaDestinationsManager_sendRequestsToUpdateSupportOptions___block_invoke;
          v28[3] = &unk_24E799FD0;
          v28[4] = v27;
          v28[5] = v16;
          v29 = v17;
          v19 = v17;
          objc_msgSend(v18, "sendRequestToUpdateSupportOptions:completion:", a3, v28);

          ++v15;
        }
        while (v12 != v15);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x24BE6B608], "chainFutures:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v24;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v21;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to send update supported options request to associated destinations due to no associated destinations", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v22 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "futureWithError:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)sendRequestsToUpdateAudioGroupIdentifier:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id obj;
  id v25;
  HMDMediaDestinationsManager *v26;
  _QWORD v27[6];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  -[HMDMediaDestinationsManager dataSourceAssociatedDestinationManagers](self, "dataSourceAssociatedDestinationManagers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v26 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v8;
      v36 = 2112;
      v37 = v25;
      v38 = 2112;
      v39 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending request to update audio group identifier: %@ managers: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = v4;
    obj = v4;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      v13 = MEMORY[0x24BDAC760];
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v14);
          v16 = objc_alloc_init(MEMORY[0x24BE6B608]);
          objc_msgSend(v9, "addObject:", v16);
          objc_msgSend(v15, "messageHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = v13;
          v27[1] = 3221225472;
          v27[2] = __72__HMDMediaDestinationsManager_sendRequestsToUpdateAudioGroupIdentifier___block_invoke;
          v27[3] = &unk_24E799FD0;
          v27[4] = v26;
          v27[5] = v15;
          v28 = v16;
          v18 = v16;
          objc_msgSend(v17, "sendRequestToUpdateAudioGroupIdentifier:completion:", v25, v27);

          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x24BE6B608], "chainFutures:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v23;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v20;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to send update supported options request to associated destinations due to no associated destinations", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v21 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "futureWithError:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)deriveAudioDestination
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationsManager *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationsManager dataSourceAssociatedDestinations](self, "dataSourceAssociatedDestinations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDMediaDestinationsManager destination](self, "destination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[HMDMediaDestinationsManager deriveSupportedOptionsFromDestinations:](HMDMediaDestinationsManager, "deriveSupportedOptionsFromDestinations:", v3);
    +[HMDMediaDestinationsManager deriveAudioGroupIdentifierFromDestinations:](HMDMediaDestinationsManager, "deriveAudioGroupIdentifierFromDestinations:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDD7780]);
    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:", v8, v9, v5, v6);

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Derived default destination due to no associated destinations", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDMediaDestinationsManager defaultDestination](v12, "defaultDestination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)defaultDestination
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDMediaDestinationsManager destination](self, "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDD7780]);
  objc_msgSend(v2, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:", v4, v5, 0);

  return v6;
}

- (id)mediaGroupsAggregatorMessenger
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaDestinationsManager *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationsManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "mediaGroupsAggregatorMessengerForMediaDestinationsManager:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media groups aggregator messenger due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)dataSourceAssociatedDestinations
{
  void *v2;
  void *v3;

  -[HMDMediaDestinationsManager dataSourceAssociatedDestinationManagers](self, "dataSourceAssociatedDestinationManagers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_4890);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dataSourceAssociatedDestinationManagers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaDestinationsManager *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationsManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "associatedDestinationManagersForMediaDestinationsManager:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive destination due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)dataSourceTargetAccessory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaDestinationsManager *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationsManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "targetAccessoryForMediaDestinationManager:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get target accessory due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)dataSourceDestinationControllerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaDestinationsManager *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaDestinationsManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mediaDestinationsManager:destinationControllerWithIdentifier:", self, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source destination controller due to no data source", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)messageHandler:(id)a3 deviceForOutgoingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationsManager *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaDestinationsManager dataSourceTargetAccessory](self, "dataSourceTargetAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "deviceForDirectMessaging");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get device for message due to no target accessory", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)messageHandler:(id)a3 shouldRelayIncomingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationsManager *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaDestinationsManager dataSourceTargetAccessory](self, "dataSourceTargetAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "isCurrentAccessory") ^ 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get relay preference due to no target accessory", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (BOOL)messageHandler:(id)a3 isReadyForIncomingMessage:(id)a4
{
  void *v4;
  BOOL v5;

  -[HMDMediaDestinationsManager destination](self, "destination", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportedOptions") != 0;

  return v5;
}

- (void)mediaDestinationMessageHandler:(id)a3 didReceiveUpdateAudioGroupIdentifierRequestMessage:(id)a4 audioGroupIdentifier:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v7 = a4;
  -[HMDMediaDestinationsManager sendRequestsToUpdateAudioGroupIdentifier:](self, "sendRequestsToUpdateAudioGroupIdentifier:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __134__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke;
  v16[3] = &unk_24E79BCC8;
  v16[4] = self;
  v10 = v7;
  v17 = v10;
  v11 = (id)objc_msgSend(v8, "addFailureBlock:", v16);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __134__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke_13;
  v14[3] = &unk_24E79BD18;
  v14[4] = self;
  v15 = v10;
  v12 = v10;
  v13 = (id)objc_msgSend(v8, "addSuccessBlock:", v14);

}

- (void)mediaDestinationMessageHandler:(id)a3 didReceiveUpdateSupportedOptionsRequestMessage:(id)a4 supportOptions:(unint64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v7 = a4;
  -[HMDMediaDestinationsManager sendRequestsToUpdateSupportOptions:](self, "sendRequestsToUpdateSupportOptions:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __124__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke;
  v16[3] = &unk_24E79BCC8;
  v16[4] = self;
  v10 = v7;
  v17 = v10;
  v11 = (id)objc_msgSend(v8, "addFailureBlock:", v16);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __124__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke_15;
  v14[3] = &unk_24E79BD18;
  v14[4] = self;
  v15 = v10;
  v12 = v10;
  v13 = (id)objc_msgSend(v8, "addSuccessBlock:", v14);

}

- (void)mediaDestinationsMessageHandler:(id)a3 didReceiveDestinationUpdatedNotification:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDMediaDestinationsManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Refreshing manager due to updated destination notification with destination: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDMediaDestinationsManager refreshDestination](v12, "refreshDestination");
  }

}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaDestinationsManager identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("identifier"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaDestinationsManager identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMMediaDestination)destination
{
  return (HMMediaDestination *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDestination:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HMDMediaDestinationMessageHandler)messageHandler
{
  return (HMDMediaDestinationMessageHandler *)objc_getProperty(self, a2, 16, 1);
}

- (HMDMediaDestinationsManagerDataSource)dataSource
{
  return (HMDMediaDestinationsManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDMediaDestinationsManagerDelegate)delegate
{
  return (HMDMediaDestinationsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

void __124__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Send update supported options requests finished with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v3);

}

void __124__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Send update supported options requests finished", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "respondWithSuccess");

}

void __134__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Send update audio group identifier requests finished with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v3);

}

void __134__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Send update audio group identifier requests finished", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "respondWithSuccess");

}

uint64_t __63__HMDMediaDestinationsManager_dataSourceAssociatedDestinations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "destination");
}

void __72__HMDMediaDestinationsManager_sendRequestsToUpdateAudioGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543874;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Send request to update audio group identifier for manager: %@ completed with error: %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");
  }

}

void __66__HMDMediaDestinationsManager_sendRequestsToUpdateSupportOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543874;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Send request to update support options for manager: %@ completed with error: %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");
  }

}

uint64_t __57__HMDMediaDestinationsManager_stageAudioGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stageAudioGroupIdentifier:", *(_QWORD *)(a1 + 32));
}

+ (unint64_t)deriveSupportedOptionsFromDestinations:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 77;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!objc_msgSend(v9, "containsSupportedOptions:", 1))
          v7 &= ~1uLL;
        if (!objc_msgSend(v9, "containsSupportedOptions:", 8))
          v7 &= ~8uLL;
        if (!objc_msgSend(v9, "containsSupportedOptions:", 4))
          v7 &= ~4uLL;
        if (!objc_msgSend(v9, "containsSupportedOptions:", 64))
          v7 &= ~0x40uLL;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 77;
  }

  return v7;
}

+ (id)deriveAudioGroupIdentifierFromDestinations:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioGroupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__HMDMediaDestinationsManager_deriveAudioGroupIdentifierFromDestinations___block_invoke;
  v10[3] = &unk_24E79A660;
  v11 = v5;
  v6 = v5;
  LODWORD(v5) = objc_msgSend(v3, "na_allObjectsPassTest:", v10);

  if ((_DWORD)v5)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27 != -1)
    dispatch_once(&logCategory__hmf_once_t27, &__block_literal_global_21);
  return (id)logCategory__hmf_once_v28;
}

void __42__HMDMediaDestinationsManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v28;
  logCategory__hmf_once_v28 = v0;

}

uint64_t __74__HMDMediaDestinationsManager_deriveAudioGroupIdentifierFromDestinations___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "audioGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hmf_isEqualToUUID:", v3);

  return v4;
}

@end
