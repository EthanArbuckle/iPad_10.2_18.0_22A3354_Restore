@implementation HMDMediaDestinationManager

- (HMDMediaDestinationManager)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 backingStore:(id)a6 targetDevice:(BOOL)a7 dataSource:(id)a8 delegate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDMediaDestinationManagerMetricsDispatcher *v20;
  void *v21;
  void *v22;
  HMDMediaDestinationManagerMetricsDispatcher *v23;
  HMDMediaDestinationMessageHandler *v24;
  HMDMediaDestinationBackingStoreHandler *v25;
  HMDMediaDestinationManager *v26;
  id v28;
  _BOOL4 v29;

  v29 = a7;
  v28 = a9;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = [HMDMediaDestinationManagerMetricsDispatcher alloc];
  objc_msgSend(v19, "uniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HMDMediaDestinationManagerMetricsDispatcher initWithIdentifier:logEventSubmitter:](v20, "initWithIdentifier:logEventSubmitter:", v21, v22);

  v24 = -[HMDMediaDestinationMessageHandler initWithDestination:messageDispatcher:notificationCenter:dataSource:delegate:]([HMDMediaDestinationMessageHandler alloc], "initWithDestination:messageDispatcher:notificationCenter:dataSource:delegate:", v19, v18, v17, self, self);
  v25 = -[HMDMediaDestinationBackingStoreHandler initWithDestination:backingStore:metricsDispatcher:delegate:]([HMDMediaDestinationBackingStoreHandler alloc], "initWithDestination:backingStore:metricsDispatcher:delegate:", v19, v16, v23, self);

  v26 = -[HMDMediaDestinationManager initWithDestination:messageHandler:backingStoreHandler:metricsDispatcher:targetDevice:dataSource:delegate:](self, "initWithDestination:messageHandler:backingStoreHandler:metricsDispatcher:targetDevice:dataSource:delegate:", v19, v24, v25, v23, v29, v15, v28);
  return v26;
}

- (HMDMediaDestinationManager)initWithDestination:(id)a3 messageHandler:(id)a4 backingStoreHandler:(id)a5 metricsDispatcher:(id)a6 targetDevice:(BOOL)a7 dataSource:(id)a8 delegate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HMDMediaDestinationManager *v21;
  uint64_t v22;
  OS_os_log *logger;
  uint64_t v24;
  NSUUID *identifier;
  id v26;
  void *v27;
  uint64_t v28;
  HMFStagedValue *stagedAudioGroupIdentifier;
  HMDMediaDestinationManager *result;
  HMDMediaDestinationManager *v31;
  SEL v32;
  id v33;
  BOOL v34;
  id v35;
  objc_super v36;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v35 = a6;
  v18 = a8;
  v19 = a9;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v16)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v17)
  {
LABEL_9:
    v31 = (HMDMediaDestinationManager *)_HMFPreconditionFailure();
    -[HMDMediaDestinationManager configureWithHome:currentAccessory:](v31, v32, v33, v34);
    return result;
  }
  v20 = v19;
  v36.receiver = self;
  v36.super_class = (Class)HMDMediaDestinationManager;
  v21 = -[HMDMediaDestinationManager init](&v36, sel_init);
  if (v21)
  {
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    logger = v21->_logger;
    v21->_logger = (OS_os_log *)v22;

    objc_msgSend(v15, "uniqueIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    identifier = v21->_identifier;
    v21->_identifier = (NSUUID *)v24;

    objc_storeStrong((id *)&v21->_messageHandler, a4);
    objc_storeStrong((id *)&v21->_backingStoreHandler, a5);
    objc_storeStrong((id *)&v21->_metricsDispatcher, a6);
    v21->_targetDevice = a7;
    objc_storeWeak((id *)&v21->_dataSource, v18);
    objc_storeWeak((id *)&v21->_delegate, v20);
    v26 = objc_alloc(MEMORY[0x24BE3F278]);
    objc_msgSend(v15, "audioGroupIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "initWithValue:", v27);
    stagedAudioGroupIdentifier = v21->_stagedAudioGroupIdentifier;
    v21->_stagedAudioGroupIdentifier = (HMFStagedValue *)v28;

    -[HMFStagedValue setDelegate:](v21->_stagedAudioGroupIdentifier, "setDelegate:", v21);
  }

  return v21;
}

- (void)configureWithHome:(id)a3 currentAccessory:(BOOL)a4
{
  id v5;
  void *v6;
  HMDMediaDestinationManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  HMDMediaDestinationManager *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaDestinationManager committedDestination](v7, "committedDestination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v9;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Configuring destination manager: %@ destination: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDMediaDestinationManager messageHandler](v7, "messageHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configureWithHome:", v5);

}

- (void)mergeDestination:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMDMediaDestinationManager backingStoreHandler](self, "backingStoreHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeDestination:", v7);

  if (!-[HMDMediaDestinationManager isTargetDevice](self, "isTargetDevice"))
  {
    -[HMDMediaDestinationManager stagedAudioGroupIdentifier](self, "stagedAudioGroupIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioGroupIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commitValue:", v6);

  }
}

- (void)stageAudioGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
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
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Staging audio group identifier: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaDestinationManager stagedAudioGroupIdentifier](v6, "stagedAudioGroupIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hmf_isEqualToUUID:", v4);

  -[HMDMediaDestinationManager stagedAudioGroupIdentifier](v6, "stagedAudioGroupIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stageValue:withTimeout:", v4, 600.0);

  if ((v11 & 1) == 0)
    -[HMDMediaDestinationManager notifyDelegateDidUpdateStagedValues](v6, "notifyDelegateDidUpdateStagedValues");

}

- (void)requestToUpdateAudioGroupIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDMediaDestinationManager messageHandler](self, "messageHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendRequestToUpdateAudioGroupIdentifier:completion:", v7, v6);

}

- (HMMediaDestination)destination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HMDMediaDestinationManager backingStoreHandler](self, "backingStoreHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[HMDMediaDestinationManager stagedAudioGroupIdentifier](self, "stagedAudioGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudioGroupIdentifier:", v7);

  v8 = (void *)objc_msgSend(v5, "copy");
  return (HMMediaDestination *)v8;
}

- (HMMediaDestination)committedDestination
{
  void *v2;
  void *v3;

  -[HMDMediaDestinationManager backingStoreHandler](self, "backingStoreHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMMediaDestination *)v3;
}

- (id)mediaGroupParticipantLocalDataStorage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaDestinationManager *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "mediaGroupParticipantLocalDataStorageForMediaDestinationManager:", self);
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
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get local data storage due to no data source", (uint8_t *)&v11, 0xCu);

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
  id v6;
  void *v7;
  HMDMediaDestinationManager *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetAccessoryForMediaDestinationManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get associated accessory from data source: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
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
  HMDMediaDestinationManager *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaDestinationManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mediaDestinationManager:destinationControllerWithIdentifier:", self, v4);
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

- (id)dataSourceRootDestinationManager
{
  void *v3;
  void *v4;
  HMDMediaDestinationManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine root destination due to no data source", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(v3, "rootDestinationManagerForMediaDestinationManager:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)updateSupportedOptions:(unint64_t)a3
{
  void *v5;
  HMDMediaDestinationManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDMediaDestinationManager *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  HMDMediaDestinationManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMMediaDestinationSupportOptionsAsString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v8;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating supported options: %@", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDMediaDestinationManager legacyUpdateSupportedOptions:](v14, "legacyUpdateSupportedOptions:", a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDMediaDestinationManager mediaGroupParticipantLocalDataStorage](v6, "mediaGroupParticipantLocalDataStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "updateDestinationSupportOptions:", a3);
      objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = v6;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        HMMediaDestinationSupportOptionsAsString();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v21;
        v27 = 2112;
        v28 = v22;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to update supported options: %@ due to no local storage found", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v23 = (void *)MEMORY[0x24BE6B608];
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "futureWithError:", v24);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    return v12;
  }
}

- (id)legacyUpdateSupportedOptions:(unint64_t)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v5 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[HMDMediaDestinationManager backingStoreHandler](self, "backingStoreHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__HMDMediaDestinationManager_legacyUpdateSupportedOptions___block_invoke;
  v11[3] = &unk_24E79BCC8;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v6, "updateSupportedOptions:completion:", a3, v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)updateAudioGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDMediaDestinationManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDMediaDestinationManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating audio group identifier: %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDMediaDestinationManager legacyUpdateAudioGroupIdentifier:](v14, "legacyUpdateAudioGroupIdentifier:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDMediaDestinationManager mediaGroupParticipantLocalDataStorage](v6, "mediaGroupParticipantLocalDataStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "updateAudioGroupIdentifier:", v4);
      -[HMDMediaDestinationManager stagedAudioGroupIdentifier](v6, "stagedAudioGroupIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "commitValue:", v4);

      objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v6;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v20;
        v26 = 2112;
        v27 = v4;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to update local storgage with audio group identifier: %@ due to no local storage found", (uint8_t *)&v24, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v21 = (void *)MEMORY[0x24BE6B608];
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "futureWithError:", v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v12;
}

- (id)legacyUpdateAudioGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationManager *v6;
  HMDMediaDestinationManager *v7;
  HMDMediaDestinationManager *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  if (v4)
  {
    -[HMDMediaDestinationManager dataSourceDestinationControllerWithIdentifier:](self, "dataSourceDestinationControllerWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HMDMediaDestinationManager dataSourceRootDestinationManager](self, "dataSourceRootDestinationManager");
      v6 = (HMDMediaDestinationManager *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        -[HMDMediaDestinationManager stageAudioGroupIdentifier:](v6, "stageAudioGroupIdentifier:", v4);
        v8 = v7;
      }
      else
      {
        v8 = self;
      }
      -[HMDMediaDestinationManager identifier](v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stageDestinationIdentifier:", v9);

    }
  }
  v10 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[HMDMediaDestinationManager backingStoreHandler](self, "backingStoreHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __63__HMDMediaDestinationManager_legacyUpdateAudioGroupIdentifier___block_invoke;
  v16[3] = &unk_24E79BCC8;
  v16[4] = self;
  v12 = v10;
  v17 = v12;
  objc_msgSend(v11, "updateAudioGroupIdentifier:completion:", v4, v16);

  v13 = v17;
  v14 = v12;

  return v14;
}

- (void)mediaDestinationBackingStoreHandler:(id)a3 didUpdateDestination:(id)a4
{
  id v6;
  id v7;
  OS_os_log *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HMDMediaDestinationManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_logger;
  if (os_signpost_enabled((os_log_t)v8))
  {
    objc_msgSend(v7, "audioGroupIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v19 = 138412290;
      v20 = v9;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, (os_log_t)v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HMDMediaDestinationManagerCommitAudioGroupIdentifier", "audioGroupIdentifier=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = (uint64_t)v11;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, (os_log_t)v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HMDMediaDestinationManagerCommitAudioGroupIdentifier", "audioGroupIdentifier=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);

    }
  }

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = (uint64_t)v15;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling did update destination: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDMediaDestinationManager stagedAudioGroupIdentifier](v13, "stagedAudioGroupIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioGroupIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commitValue:", v17);

  -[HMDMediaDestinationManager messageHandler](v13, "messageHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleUpdatedDestination:", v7);

}

- (id)messageHandler:(id)a3 shouldRelayIncomingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationManager *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaDestinationManager dataSourceTargetAccessory](self, "dataSourceTargetAccessory");
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
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine relay preference due to no target accessory", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)messageHandler:(id)a3 deviceForOutgoingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationManager *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaDestinationManager dataSourceTargetAccessory](self, "dataSourceTargetAccessory");
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
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get device due to no target accessory", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (void)mediaDestinationMessageHandler:(id)a3 didReceiveUpdateSupportedOptionsRequestMessage:(id)a4 supportOptions:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  HMDMediaDestinationManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling did receive update supported options request message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDMediaDestinationManager updateSupportedOptions:](v11, "updateSupportedOptions:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __123__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke;
  v22[3] = &unk_24E79BD80;
  v16 = v9;
  v23 = v16;
  v17 = (id)objc_msgSend(v14, "addFailureBlock:", v22);
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __123__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke_2;
  v20[3] = &unk_24E79BCF0;
  v21 = v16;
  v18 = v16;
  v19 = (id)objc_msgSend(v14, "addSuccessBlock:", v20);

}

- (void)mediaDestinationMessageHandler:(id)a3 didReceiveUpdateAudioGroupIdentifierRequestMessage:(id)a4 audioGroupIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDMediaDestinationManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling did receive update audio group identifier request message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDMediaDestinationManager updateAudioGroupIdentifier:](v12, "updateAudioGroupIdentifier:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __133__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke;
  v23[3] = &unk_24E79BD80;
  v17 = v9;
  v24 = v17;
  v18 = (id)objc_msgSend(v15, "addFailureBlock:", v23);
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __133__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke_2;
  v21[3] = &unk_24E79BCF0;
  v22 = v17;
  v19 = v17;
  v20 = (id)objc_msgSend(v15, "addSuccessBlock:", v21);

}

- (void)notifyDelegateDidUpdateStagedValues
{
  void *v3;
  void *v4;
  void *v5;
  HMDMediaDestinationManager *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "mediaDestinationManagerDidUpdateStagedValues:", self);
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of updated staged values due to no delegate", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
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
  -[HMDMediaDestinationManager identifier](self, "identifier");
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

  -[HMDMediaDestinationManager identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)triggerStageValueDidExpireValueForAudioDestinationIdentifier
{
  void *v3;
  HMDMediaDestinationManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Triggering did expire value for audio destination identifier", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMediaDestinationManager stagedAudioGroupIdentifier](v4, "stagedAudioGroupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationManager stagedValue:didExpireValue:](v4, "stagedValue:didExpireValue:", v7, v8);

}

- (void)stagedValue:(id)a3 didExpireValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  HMDMediaDestinationManager *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  HMDMediaDestinationManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaDestinationManager stagedAudioGroupIdentifier](self, "stagedAudioGroupIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v13 = v7;
    -[HMDMediaDestinationManager committedDestination](self, "committedDestination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "audioGroupIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = HMFEqualObjects();

    if ((v16 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v20;
        v25 = 2112;
        v26 = v13;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Handling expired audio group identifier value: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDMediaDestinationManager messageHandler](v18, "messageHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaDestinationManager destination](v18, "destination");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleUpdatedDestination:", v22);

      -[HMDMediaDestinationManager notifyDelegateDidUpdateStagedValues](v18, "notifyDelegateDidUpdateStagedValues");
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v12;
      v25 = 2112;
      v26 = v6;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unknown stage value: %@ did expire value: %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMDMediaDestinationMessageHandler)messageHandler
{
  return (HMDMediaDestinationMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (HMDMediaDestinationBackingStoreHandler)backingStoreHandler
{
  return (HMDMediaDestinationBackingStoreHandler *)objc_getProperty(self, a2, 40, 1);
}

- (HMDMediaDestinationManagerDataSource)dataSource
{
  return (HMDMediaDestinationManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDMediaDestinationManagerDelegate)delegate
{
  return (HMDMediaDestinationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isTargetDevice
{
  return self->_targetDevice;
}

- (HMDMediaDestinationManagerMetricsDispatcher)metricsDispatcher
{
  return (HMDMediaDestinationManagerMetricsDispatcher *)objc_getProperty(self, a2, 64, 1);
}

- (HMFStagedValue)stagedAudioGroupIdentifier
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedAudioGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_backingStoreHandler, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

uint64_t __133__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

uint64_t __133__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __123__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

uint64_t __123__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

void __63__HMDMediaDestinationManager_legacyUpdateAudioGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Update audio group identifier completed with error: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Update audio group identifier completed", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __59__HMDMediaDestinationManager_legacyUpdateSupportedOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Update supported options completed with error: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Update supported options completed", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_107203 != -1)
    dispatch_once(&logCategory__hmf_once_t24_107203, &__block_literal_global_107204);
  return (id)logCategory__hmf_once_v25_107205;
}

void __41__HMDMediaDestinationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_107205;
  logCategory__hmf_once_v25_107205 = v0;

}

@end
