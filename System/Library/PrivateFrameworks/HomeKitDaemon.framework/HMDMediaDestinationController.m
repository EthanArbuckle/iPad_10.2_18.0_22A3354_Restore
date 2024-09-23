@implementation HMDMediaDestinationController

- (NSString)urlString
{
  void *v2;
  void *v3;

  -[HMDMediaDestinationController identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  hm_assistantIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)assistantObjectWithHome:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[9];
  _QWORD v15[10];

  v15[9] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("objectType");
  v14[1] = CFSTR("objectName");
  v15[0] = *MEMORY[0x24BE81F30];
  v15[1] = a4;
  v14[2] = CFSTR("objectIdentifier");
  v6 = a4;
  v7 = a3;
  -[HMDMediaDestinationController urlString](self, "urlString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  v14[3] = CFSTR("objectHome");
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  v14[4] = CFSTR("objectHomeIdentifier");
  objc_msgSend(v7, "urlString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[4] = v10;
  v15[5] = self;
  v14[5] = CFSTR("objectReference");
  v14[6] = CFSTR("objectServiceType");
  v11 = *MEMORY[0x24BE81FE0];
  v15[6] = *MEMORY[0x24BE82130];
  v15[7] = v11;
  v14[7] = CFSTR("objectServiceSubType");
  v14[8] = CFSTR("objectGroupType");
  v15[8] = *MEMORY[0x24BE81F60];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HMDMediaDestinationController)initWithData:(id)a3 backingStore:(id)a4 messageDispatcher:(id)a5 notificationCenter:(id)a6 logEventSubmitter:(id)a7 dailyScheduler:(id)a8 targetDevice:(BOOL)a9 dataSource:(id)a10 delegate:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  HMDMediaDestinationControllerMetricsEventDispatcher *v24;
  void *v25;
  HMDMediaDestinationControllerMetricsEventDispatcher *v26;
  HMDMediaDestinationControllerBackingStoreHandler *v27;
  HMDMediaDestinationControllerMessageHandler *v28;
  void *v29;
  HMDMediaDestinationControllerMessageHandler *v30;
  HMDMediaDestinationController *v31;
  id v33;
  id v34;

  v34 = a11;
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v33 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = [HMDMediaDestinationControllerMetricsEventDispatcher alloc];
  objc_msgSend(v23, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[HMDMediaDestinationControllerMetricsEventDispatcher initWithIdentifier:logEventSubmitter:dataSource:](v24, "initWithIdentifier:logEventSubmitter:dataSource:", v25, v20, v18);

  objc_msgSend(v19, "registerDailyTaskRunner:", v26);
  v27 = -[HMDMediaDestinationControllerBackingStoreHandler initWithData:backingStore:metricsEventDispatcher:delegate:]([HMDMediaDestinationControllerBackingStoreHandler alloc], "initWithData:backingStore:metricsEventDispatcher:delegate:", v23, v22, v26, self);

  v28 = [HMDMediaDestinationControllerMessageHandler alloc];
  objc_msgSend(v23, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = -[HMDMediaDestinationControllerMessageHandler initWithMessageTargetUUID:messageDispatcher:notificationCenter:metricsEventDispatcher:targetDevice:dataSource:delegate:](v28, "initWithMessageTargetUUID:messageDispatcher:notificationCenter:metricsEventDispatcher:targetDevice:dataSource:delegate:", v29, v21, v33, v26, a9, self, self);
  v31 = -[HMDMediaDestinationController initWithBackingStoreHandler:messageHandler:metricsEventDispatcher:targetDevice:dataSource:delegate:](self, "initWithBackingStoreHandler:messageHandler:metricsEventDispatcher:targetDevice:dataSource:delegate:", v27, v30, v26, a9, v18, v34);

  return v31;
}

- (HMDMediaDestinationController)initWithBackingStoreHandler:(id)a3 messageHandler:(id)a4 metricsEventDispatcher:(id)a5 targetDevice:(BOOL)a6 dataSource:(id)a7 delegate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  HMDMediaDestinationController *v27;
  uint64_t v28;
  OS_os_log *logger;
  uint64_t v30;
  NSUUID *identifier;
  HMDMediaDestinationController *result;
  HMDMediaDestinationController *v33;
  SEL v34;
  id v35;
  id obj;
  id v38;
  void *v39;
  void *v40;
  objc_super v41;

  v14 = a3;
  v15 = a4;
  v38 = a5;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v15)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v16)
  {
LABEL_9:
    v33 = (HMDMediaDestinationController *)_HMFPreconditionFailure();
    -[HMDMediaDestinationController configureWithHome:](v33, v34, v35);
    return result;
  }
  v19 = v18;
  obj = a4;
  v39 = v16;
  v40 = v15;
  objc_msgSend(v14, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x24BE3F278]);
  objc_msgSend(v20, "destinationIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithValue:", v22);

  v24 = objc_alloc(MEMORY[0x24BE3F278]);
  objc_msgSend(v20, "availableDestinationIdentifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithValue:", v25);

  v41.receiver = self;
  v41.super_class = (Class)HMDMediaDestinationController;
  v27 = -[HMDMediaDestinationController init](&v41, sel_init);
  if (v27)
  {
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    logger = v27->_logger;
    v27->_logger = (OS_os_log *)v28;

    objc_msgSend(v14, "identifier");
    v30 = objc_claimAutoreleasedReturnValue();
    identifier = v27->_identifier;
    v27->_identifier = (NSUUID *)v30;

    objc_storeStrong((id *)&v27->_backingStoreHandler, a3);
    objc_storeStrong((id *)&v27->_messageHandler, obj);
    v27->_isTargetDevice = a6;
    objc_storeStrong((id *)&v27->_metricsEventDispatcher, v38);
    objc_storeWeak((id *)&v27->_dataSource, v17);
    objc_storeWeak((id *)&v27->_delegate, v19);
    objc_storeStrong((id *)&v27->_stagedDestinationIdentifier, v23);
    -[HMFStagedValue setDelegate:](v27->_stagedDestinationIdentifier, "setDelegate:", v27);
    objc_storeStrong((id *)&v27->_stagedAvailableDestinationIdentifiers, v26);
    -[HMFStagedValue setDelegate:](v27->_stagedAvailableDestinationIdentifiers, "setDelegate:", v27);
  }

  return v27;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaDestinationController committedData](v6, "committedData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with data: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaDestinationController messageHandler](v6, "messageHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configureWithHome:", v4);

  -[HMDMediaDestinationController refreshDestinationController](v6, "refreshDestinationController");
  -[HMDMediaDestinationController migrateSupportOptions](v6, "migrateSupportOptions");

}

- (void)migrateSupportOptions
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  HMDMediaDestinationController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (isFeatureHomeTheaterQFAEnabledForTests)
  {
    if ((objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
    {
      if (-[HMDMediaDestinationController isTargetDevice](self, "isTargetDevice"))
      {
        v3 = +[HMDMediaDestinationController expectedSupportOptions](HMDMediaDestinationController, "expectedSupportOptions");
        -[HMDMediaDestinationController committedData](self, "committedData");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "supportedOptions");

        if (v5 != v3)
        {
          v6 = (void *)MEMORY[0x227676638]();
          v7 = self;
          HMFGetOSLogHandle();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            HMMediaDestinationControllerSupportOptionsAsString();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v14 = v9;
            v15 = 2112;
            v16 = v10;
            _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Migrating support options: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v6);
          -[HMDMediaDestinationController backingStoreHandler](v7, "backingStoreHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = MEMORY[0x24BDAC760];
          v12[1] = 3221225472;
          v12[2] = __54__HMDMediaDestinationController_migrateSupportOptions__block_invoke;
          v12[3] = &unk_24E79BC78;
          v12[4] = v7;
          v12[5] = v3;
          objc_msgSend(v11, "updateSupportedOptions:completion:", v3, v12);

        }
      }
    }
  }
}

- (void)mergeData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HMDMediaDestinationController backingStoreHandler](self, "backingStoreHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeData:", v9);

  if (!-[HMDMediaDestinationController isTargetDevice](self, "isTargetDevice"))
  {
    -[HMDMediaDestinationController stagedDestinationIdentifier](self, "stagedDestinationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "destinationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commitValue:", v6);

    -[HMDMediaDestinationController stagedAvailableDestinationIdentifiers](self, "stagedAvailableDestinationIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "availableDestinationIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commitValue:", v8);

  }
}

- (void)stageDestinationIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Staging destination identifier: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaDestinationController stagedDestinationIdentifier](v6, "stagedDestinationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hmf_isEqualToUUID:", v4);

  -[HMDMediaDestinationController stagedDestinationIdentifier](v6, "stagedDestinationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stageValue:withTimeout:", v4, 600.0);

  -[HMDMediaDestinationController metricsEventDispatcher](v6, "metricsEventDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startStagedDestinationIdentifierCommittedEventWithStagedDestinationIdentifier:", v4);

  if ((v11 & 1) == 0)
    -[HMDMediaDestinationController notifyDelegateDidUpdateStagedValues](v6, "notifyDelegateDidUpdateStagedValues");

}

- (void)stageAvailableDestinationIdentifiers:(id)a3
{
  id *v3;
  id v5;
  void *v6;
  HMDMediaDestinationController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v9;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Staging available destination identifiers: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDMediaDestinationController stagedAvailableDestinationIdentifiers](v7, "stagedAvailableDestinationIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  v13 = objc_msgSend(v5, "count");
  if (v12 == v13)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __70__HMDMediaDestinationController_stageAvailableDestinationIdentifiers___block_invoke;
    v16[3] = &unk_24E79BCA0;
    v3 = &v17;
    v17 = v5;
    v14 = objc_msgSend(v11, "na_allObjectsPassTest:", v16) ^ 1;
  }
  else
  {
    v14 = 1;
  }
  -[HMDMediaDestinationController stagedAvailableDestinationIdentifiers](v7, "stagedAvailableDestinationIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stageValue:withTimeout:", v5, 600.0);

  if (v14)
    -[HMDMediaDestinationController notifyDelegateDidUpdateStagedValues](v7, "notifyDelegateDidUpdateStagedValues");
  if (v12 == v13)

}

- (id)updateAvailableDestinationIdentifiers:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDMediaDestinationController *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDMediaDestinationController *v18;
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating with available destination identifiers: %@", (uint8_t *)&v24, 0x16u);

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
    -[HMDMediaDestinationController legacyUpdateAvailableDestinationIdentifiers:](v14, "legacyUpdateAvailableDestinationIdentifiers:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDMediaDestinationController mediaGroupParticipantDataLocalStorage](v6, "mediaGroupParticipantDataLocalStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "updateDestinationControllerAvailableDestinationIdentifiers:", v4);
      -[HMDMediaDestinationController stagedAvailableDestinationIdentifiers](v6, "stagedAvailableDestinationIdentifiers");
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
        v24 = 138543362;
        v25 = v20;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to update available destination identifiers in local storage due to no local storage found", (uint8_t *)&v24, 0xCu);

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

- (id)legacyUpdateAvailableDestinationIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[HMDMediaDestinationController stagedAvailableDestinationIdentifiers](self, "stagedAvailableDestinationIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stageValue:withTimeout:", v4, 60.0);

  v6 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[HMDMediaDestinationController backingStoreHandler](self, "backingStoreHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__HMDMediaDestinationController_legacyUpdateAvailableDestinationIdentifiers___block_invoke;
  v12[3] = &unk_24E79BCC8;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v7, "updateAvailableDestinationIdentifiers:completion:", v4, v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

- (id)updateDestinationIdentifier:(id)a3
{
  return -[HMDMediaDestinationController updateDestinationIdentifier:updateOptions:](self, "updateDestinationIdentifier:updateOptions:", a3, 0);
}

- (id)updateDestinationIdentifier:(id)a3 updateOptions:(unint64_t)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  HMDMediaDestinationController *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMDMediaDestinationController *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  HMDMediaDestinationController *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMMediaDestinationControllerUpateOptionsAsString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543874;
    v33 = v10;
    v34 = 2112;
    v35 = v6;
    v36 = 2112;
    v37 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating with destination identifier: %@ support options: %@", (uint8_t *)&v32, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDMediaDestinationController stagedAvailableDestinationIdentifiers](v8, "stagedAvailableDestinationIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (v4 & 3) != 0 || (objc_msgSend(v13, "containsObject:", v6) & 1) != 0)
  {
    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (!v6 || (v4 & 4) != 0)
    {
      if (!v6)
      {
LABEL_23:
        -[HMDMediaDestinationController _updateDestinationIdentifier:](v8, "_updateDestinationIdentifier:", v6);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v30);
        objc_msgSend(MEMORY[0x24BE6B608], "chainFutures:", v14);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_24;
      }
    }
    else if (!-[HMDMediaDestinationController hasSetDestinationRelatedToIdentifier:](v8, "hasSetDestinationRelatedToIdentifier:", v6))
    {
      -[HMDMediaDestinationController unsetAudioGroupForCurrentDestination](v8, "unsetAudioGroupForCurrentDestination");
    }
    -[HMDMediaDestinationController dataSourceDestinationUsingRelatedIdentifier:](v8, "dataSourceDestinationUsingRelatedIdentifier:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = v8;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543618;
        v33 = v19;
        v34 = 2112;
        v35 = v15;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating using related destination: %@", (uint8_t *)&v32, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v15, "uniqueIdentifier");
      v20 = objc_claimAutoreleasedReturnValue();

      v21 = 0;
      v6 = (id)v20;
    }
    else
    {
      v21 = (v4 >> 1) & 1;
    }

    if (!v21 && v6 && (v4 & 4) == 0)
    {
      -[HMDMediaDestinationController identifier](v8, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaDestinationController updateDestinationWithIdentifier:audioGroupIdentifier:](v8, "updateDestinationWithIdentifier:audioGroupIdentifier:", v6, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v29);

    }
    goto LABEL_23;
  }
  v22 = (void *)MEMORY[0x227676638]();
  v23 = v8;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543874;
    v33 = v25;
    v34 = 2112;
    v35 = v6;
    v36 = 2112;
    v37 = v13;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to update to destination identifier: %@ due to identifier not in available destination identifiers: %@", (uint8_t *)&v32, 0x20u);

  }
  objc_autoreleasePoolPop(v22);
  v26 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 9006);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "futureWithError:", v14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v27;
}

- (id)_updateDestinationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDMediaDestinationController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDMediaDestinationController *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDMediaDestinationController legacyUpdateDestinationIdentifier:](v10, "legacyUpdateDestinationIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDMediaDestinationController mediaGroupParticipantDataLocalStorage](self, "mediaGroupParticipantDataLocalStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "updateDestinationControllerDestinationIdentifier:", v4);
      -[HMDMediaDestinationController stagedDestinationIdentifier](self, "stagedDestinationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "commitValue:", v4);

      objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v16;
        v22 = 2112;
        v23 = v4;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination identifier: %@ in local storage due to no local storage found", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      v17 = (void *)MEMORY[0x24BE6B608];
      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 9008);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "futureWithError:", v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (id)legacyUpdateDestinationIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[HMDMediaDestinationController stagedDestinationIdentifier](self, "stagedDestinationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stageValue:withTimeout:", v4, 60.0);

  v6 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[HMDMediaDestinationController backingStoreHandler](self, "backingStoreHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__HMDMediaDestinationController_legacyUpdateDestinationIdentifier___block_invoke;
  v12[3] = &unk_24E79BCC8;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v7, "updateDestinationIdentifier:completion:", v4, v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

- (void)unsetAudioGroupForCurrentDestination
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[HMDMediaDestinationController stagedDestinationIdentifier](self, "stagedDestinationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    v5 = -[HMDMediaDestinationController updateDestinationWithIdentifier:audioGroupIdentifier:](self, "updateDestinationWithIdentifier:audioGroupIdentifier:", v6, 0);
    v4 = v6;
  }

}

- (id)updateDestinationWithIdentifier:(id)a3 audioGroupIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaDestinationController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  HMDMediaDestinationController *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  void *v27;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v11;
    v33 = 2112;
    v34 = v6;
    v35 = 2112;
    v36 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating destination with identifier: %@ audio group identifier: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMediaDestinationController dataSourceDestinationManagerWithIdentifier:](v9, "dataSourceDestinationManagerWithIdentifier:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v9;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v7)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v23;
        v33 = 2112;
        v34 = v6;
        v24 = "%{public}@Failed to update destination due to no destination manager found for identifier: %@";
        v25 = v22;
        v26 = OS_LOG_TYPE_ERROR;
LABEL_10:
        _os_log_impl(&dword_2218F0000, v25, v26, v24, buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      v33 = 2112;
      v34 = v6;
      v24 = "%{public}@No destination manager found to unset the audio group for the destination with identifier: %@";
      v25 = v22;
      v26 = OS_LOG_TYPE_INFO;
      goto LABEL_10;
    }

    objc_autoreleasePoolPop(v19);
    v27 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 9007);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "futureWithError:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v12, "stageAudioGroupIdentifier:", v7);
  v14 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __86__HMDMediaDestinationController_updateDestinationWithIdentifier_audioGroupIdentifier___block_invoke;
  v29[3] = &unk_24E79BCC8;
  v29[4] = v9;
  v15 = v14;
  v30 = v15;
  objc_msgSend(v13, "requestToUpdateAudioGroupIdentifier:completion:", v7, v29);
  v16 = v30;
  v17 = v15;

  v18 = v17;
LABEL_12:

  return v18;
}

- (void)refreshDestinationController
{
  void *v3;
  HMDMediaDestinationController *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (-[HMDMediaDestinationController isTargetDevice](self, "isTargetDevice"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Refreshing destination controller", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDMediaDestinationController refreshAvailableDestinationIdentifiers](v4, "refreshAvailableDestinationIdentifiers");
    -[HMDMediaDestinationController refreshDestinationIdentifier](v4, "refreshDestinationIdentifier");
  }
}

- (void)refreshAvailableDestinationIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  HMDMediaDestinationController *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationController dataSourceAvailableDestinationIdentifiers](self, "dataSourceAvailableDestinationIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDMediaDestinationController stagedAvailableDestinationIdentifiers](self, "stagedAvailableDestinationIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToSet:", v7);

    if ((v8 & 1) == 0)
    {
      -[HMDMediaDestinationController updateAvailableDestinationIdentifiers:](self, "updateAvailableDestinationIdentifiers:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x24BDAC760];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __71__HMDMediaDestinationController_refreshAvailableDestinationIdentifiers__block_invoke;
      v18[3] = &unk_24E79BD80;
      v18[4] = self;
      v11 = (id)objc_msgSend(v9, "addFailureBlock:", v18);
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __71__HMDMediaDestinationController_refreshAvailableDestinationIdentifiers__block_invoke_22;
      v17[3] = &unk_24E79BCF0;
      v17[4] = self;
      v12 = (id)objc_msgSend(v9, "addSuccessBlock:", v17);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to update available destination identifiers due to no refreshed available destination identifiers", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)refreshDestinationIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HMDMediaDestinationController *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationController stagedDestinationIdentifier](self, "stagedDestinationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDMediaDestinationController dataSourceDestinationUsingRelatedIdentifier:](self, "dataSourceDestinationUsingRelatedIdentifier:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v20 = v10;
        v21 = 2112;
        v22 = v4;
        v23 = 2112;
        v24 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating related destination identifier: %@ to destination identifier: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(v6, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaDestinationController updateDestinationIdentifier:](v8, "updateDestinationIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = MEMORY[0x24BDAC760];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __61__HMDMediaDestinationController_refreshDestinationIdentifier__block_invoke;
      v18[3] = &unk_24E79BD80;
      v18[4] = v8;
      v15 = (id)objc_msgSend(v13, "addFailureBlock:", v18);
      v17[0] = v14;
      v17[1] = 3221225472;
      v17[2] = __61__HMDMediaDestinationController_refreshDestinationIdentifier__block_invoke_24;
      v17[3] = &unk_24E79BCF0;
      v17[4] = v8;
      v16 = (id)objc_msgSend(v13, "addSuccessBlock:", v17);

    }
  }

}

- (BOOL)hasSetDestinationRelatedToIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[HMDMediaDestinationController stagedDestinationIdentifier](self, "stagedDestinationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((objc_msgSend(v6, "hmf_isEqualToUUID:", v4) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      -[HMDMediaDestinationController dataSourceDestinationUsingRelatedIdentifier:](self, "dataSourceDestinationUsingRelatedIdentifier:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[HMDMediaDestinationController dataSourceDestinationUsingRelatedIdentifier:](self, "dataSourceDestinationUsingRelatedIdentifier:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "uniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uniqueIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v11, "hmf_isEqualToUUID:", v12);

        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HMMediaDestinationControllerData)committedData
{
  void *v2;
  void *v3;

  -[HMDMediaDestinationController backingStoreHandler](self, "backingStoreHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMMediaDestinationControllerData *)v3;
}

- (HMMediaDestinationControllerData)data
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HMDMediaDestinationController backingStoreHandler](self, "backingStoreHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[HMDMediaDestinationController filteredAvailableDestinationIdentifiers](self, "filteredAvailableDestinationIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAvailableDestinationIdentifiers:", v6);

  objc_msgSend(v5, "availableDestinationIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationController filteredDestinationIdentifierFilteredAvailableDestinationIdentifiers:](self, "filteredDestinationIdentifierFilteredAvailableDestinationIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDestinationIdentifier:", v8);

  v9 = (void *)objc_msgSend(v5, "copy");
  return (HMMediaDestinationControllerData *)v9;
}

- (id)filteredAvailableDestinationIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HMDMediaDestinationController stagedAvailableDestinationIdentifiers](self, "stagedAvailableDestinationIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__HMDMediaDestinationController_filteredAvailableDestinationIdentifiers__block_invoke;
  v7[3] = &unk_24E79BCA0;
  v7[4] = self;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)filteredDestinationIdentifierFilteredAvailableDestinationIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  HMDMediaDestinationController *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaDestinationController stagedDestinationIdentifier](self, "stagedDestinationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDMediaDestinationController dataSourceDestinationWithIdentifier:](self, "dataSourceDestinationWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[HMDMediaDestinationController dataSourceDestinationUsingRelatedIdentifier:](self, "dataSourceDestinationUsingRelatedIdentifier:", v6), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v7, "audioGroupIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaDestinationController identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "hmf_isEqualToUUID:", v9) & 1) != 0)
      {
        v10 = objc_msgSend(v4, "containsObject:", v6);

        if ((v10 & 1) != 0)
        {
          v11 = v6;
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {

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
      v17 = 138544130;
      v18 = v15;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Filtering unknown destination with identifier: %@ due to destination: %@ available destinations: %@", (uint8_t *)&v17, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
    goto LABEL_12;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)mediaGroupParticipantDataLocalStorage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDMediaDestinationController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDMediaDestinationController *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "mediaGroupLocalDataStorageForMediaDestinationController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v15;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get local data storage due data source: %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
    }

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
      v17 = 138543362;
      v18 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to data souce local data storage due to no data source", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v6 = 0;
  }

  return v6;
}

- (id)dataSourceAvailableDestinationIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaDestinationController *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "availableDestinationIdentifiersForMediaDestinationController:", self);
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
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get refreshed available destination identifiers due to no data source", (uint8_t *)&v11, 0xCu);

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
  HMDMediaDestinationController *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "targetAccessoryForMediaDestinationController:", self);
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

- (id)dataSourceDestinationManagerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaDestinationController *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaDestinationController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mediaDestinationController:destinationManagerWithIdentifier:", self, v4);
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
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination manager with identifier: %@ due to no data source", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)dataSourceDestinationWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[HMDMediaDestinationController dataSourceDestinationManagerWithIdentifier:](self, "dataSourceDestinationManagerWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dataSourceDestinationUsingRelatedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaDestinationController *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  HMDMediaDestinationController *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  HMDMediaDestinationController *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaDestinationController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mediaDestinationController:destinationWithParentIdentifier:", self, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
        v25 = 138543874;
        v26 = v11;
        v27 = 2112;
        v28 = v7;
        v29 = 2112;
        v30 = v4;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Found destination: %@ using parent identifier: %@", (uint8_t *)&v25, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v7, "uniqueIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v12;
    }
    objc_msgSend(v6, "mediaDestinationController:rootDestinationWithDecendantIdentifier:", self, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    if (v13)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543874;
        v26 = v18;
        v27 = 2112;
        v28 = v13;
        v29 = 2112;
        v30 = v4;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Found root destination: %@ using decendant identifier: %@", (uint8_t *)&v25, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      v14 = v13;

    }
    v19 = v14;

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v23;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get data source during destination with parent identifier: %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v19 = 0;
  }

  return v19;
}

- (id)messageHandler:(id)a3 shouldRelayIncomingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationController *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaDestinationController dataSourceTargetAccessory](self, "dataSourceTargetAccessory");
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

- (id)messageHandler:(id)a3 deviceForOutgoingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationController *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaDestinationController dataSourceTargetAccessory](self, "dataSourceTargetAccessory");
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
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get relay preference due to no target accessory", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (void)mediaDestinationControllerMessageHandler:(id)a3 didReceiveMediaDestinationControllerUpdateDestinationRequestMessage:(id)a4 destinationIdentifier:(id)a5 updateOptions:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDMediaDestinationController *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v16;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Handling did receive media destination controller update destination request message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDMediaDestinationController metricsEventDispatcher](v14, "metricsEventDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationController stagedDestinationIdentifier](v14, "stagedDestinationIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "submitReceivedUpdateDestinationRequestMessageEventWithDestinationIdentifier:existingDestinationIdentifier:", v12, v19);

  -[HMDMediaDestinationController updateDestinationIdentifier:updateOptions:](v14, "updateDestinationIdentifier:updateOptions:", v12, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __178__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdateDestinationRequestMessage_destinationIdentifier_updateOptions___block_invoke;
  v28[3] = &unk_24E79BCC8;
  v28[4] = v14;
  v22 = v11;
  v29 = v22;
  v23 = (id)objc_msgSend(v20, "addFailureBlock:", v28);
  v26[0] = v21;
  v26[1] = 3221225472;
  v26[2] = __178__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdateDestinationRequestMessage_destinationIdentifier_updateOptions___block_invoke_26;
  v26[3] = &unk_24E79BD18;
  v26[4] = v14;
  v27 = v22;
  v24 = v22;
  v25 = (id)objc_msgSend(v20, "addSuccessBlock:", v26);

}

- (void)mediaDestinationControllerMessageHandler:(id)a3 didReceiveMediaDestinationControllerUpdatedDestinationNotification:(id)a4 destinationControllerIdentifier:(id)a5 destinationIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  HMDMediaDestinationController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  int v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDMediaDestinationController identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "hmf_isEqualToUUID:", v14))
  {

  }
  else
  {
    -[HMDMediaDestinationController stagedDestinationIdentifier](self, "stagedDestinationIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "hmf_isEqualToUUID:", v16);

    if (v17)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        v32 = 2112;
        v33 = v13;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Unsetting media destination due to another destination controller with the same destination identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      -[HMDMediaDestinationController updateDestinationIdentifier:updateOptions:](v19, "updateDestinationIdentifier:updateOptions:", 0, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x24BDAC760];
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __195__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdatedDestinationNotification_destinationControllerIdentifier_destinationIdentifier___block_invoke;
      v29[3] = &unk_24E79BD80;
      v29[4] = v19;
      v24 = (id)objc_msgSend(v22, "addFailureBlock:", v29);
      v28[0] = v23;
      v28[1] = 3221225472;
      v28[2] = __195__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdatedDestinationNotification_destinationControllerIdentifier_destinationIdentifier___block_invoke_27;
      v28[3] = &unk_24E79BCF0;
      v28[4] = v19;
      v25 = (id)objc_msgSend(v22, "addSuccessBlock:", v28);

    }
  }
  -[HMDMediaDestinationController identifier](self, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v12, "hmf_isEqualToUUID:", v26);

  if (v27)
    -[HMDMediaDestinationController refreshDestinationController](self, "refreshDestinationController");

}

- (void)mediaDestinationControllerBackingStoreHandler:(id)a3 didUpdateDestinationIdentifier:(id)a4
{
  id v6;
  id v7;
  OS_os_log *v8;
  void *v9;
  void *v10;
  HMDMediaDestinationController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_logger;
  if (os_signpost_enabled((os_log_t)v8))
  {
    if (v7)
    {
      v17 = 138412290;
      v18 = v7;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, (os_log_t)v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HMDMediaDestinationControllerCommitDestinationIdentifierEvent", "destinationIdentifier=%{signpost.description:attribute}@ ", (uint8_t *)&v17, 0xCu);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v9;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, (os_log_t)v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HMDMediaDestinationControllerCommitDestinationIdentifierEvent", "destinationIdentifier=%{signpost.description:attribute}@ ", (uint8_t *)&v17, 0xCu);

    }
  }

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v13;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Committing updated destination identifier: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDMediaDestinationController stagedDestinationIdentifier](v11, "stagedDestinationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commitValue:", v7);

  -[HMDMediaDestinationController metricsEventDispatcher](v11, "metricsEventDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "submitStagedDestinationIdentifierCommittedEventWithCommittedDestinationIdentifier:", v7);

  -[HMDMediaDestinationController messageHandler](v11, "messageHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "notifyUpdatedDestinationWithIdentifier:", v7);

}

- (void)mediaDestinationControllerBackingStoreHandler:(id)a3 didUpdateAvailableDestinationIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaDestinationController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Committing updated available destination identifiers: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMediaDestinationController stagedAvailableDestinationIdentifiers](v9, "stagedAvailableDestinationIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "commitValue:", v7);

}

- (void)mediaDestinationControllerBackingStoreHandlerDidProcessUnexpectedModelAdd:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationController *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Refreshing destination controller due to unexpected model add", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaDestinationController refreshDestinationController](v6, "refreshDestinationController");

}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaDestinationController identifier](self, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("identifier"), v22);
  v23[0] = v21;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaDestinationController isTargetDevice](self, "isTargetDevice");
  HMFBooleanToString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("isTargetDevice"), v20);
  v23[1] = v19;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaDestinationController stagedDestinationIdentifier](self, "stagedDestinationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("destinationIdentifier"), v7);
  v23[2] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaDestinationController committedData](self, "committedData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "supportedOptions");
  HMMediaDestinationControllerSupportOptionsAsString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("supportedOptions"), v11);
  v23[3] = v12;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaDestinationController stagedAvailableDestinationIdentifiers](self, "stagedAvailableDestinationIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("availableDestinationIdentifiers"), v15);
  v23[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaDestinationController identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)triggerStageValueDidExpireValueForStagedDestinationIdentifier
{
  void *v3;
  HMDMediaDestinationController *v4;
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
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Triggering stage value did expire value for staged destination identifier", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMediaDestinationController stagedDestinationIdentifier](v4, "stagedDestinationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationController stagedValue:didExpireValue:](v4, "stagedValue:didExpireValue:", v7, v8);

}

- (void)triggerStageValueDidExpireValueForStagedAvailableDestinationIdentifiers
{
  void *v3;
  HMDMediaDestinationController *v4;
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
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Triggering stage value did expire value for staged available destination identifiers", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMediaDestinationController stagedAvailableDestinationIdentifiers](v4, "stagedAvailableDestinationIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationController stagedValue:didExpireValue:](v4, "stagedValue:didExpireValue:", v7, v8);

}

- (void)stagedValue:(id)a3 didExpireValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  HMDMediaDestinationController *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaDestinationController stagedDestinationIdentifier](self, "stagedDestinationIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[HMDMediaDestinationController stagedValue:didExpireDestinationIdentifier:](self, "stagedValue:didExpireDestinationIdentifier:", v6, v7);
  }
  else
  {
    -[HMDMediaDestinationController stagedAvailableDestinationIdentifiers](self, "stagedAvailableDestinationIdentifiers");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v6)
    {
      -[HMDMediaDestinationController stagedValue:didExpireAvailableDestinationIdentifiers:](self, "stagedValue:didExpireAvailableDestinationIdentifiers:", v6, v7);
    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v13;
        v16 = 2112;
        v17 = v6;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unknown stage value: %@ did expire value: %@", (uint8_t *)&v14, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
    }
  }

}

- (void)stagedValue:(id)a3 didExpireDestinationIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDMediaDestinationController *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaDestinationController committedData](self, "committedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destinationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HMFEqualObjects();

  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v14;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Handling did expire destination identifier: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDMediaDestinationController metricsEventDispatcher](v12, "metricsEventDispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "submitFailureEventWithEventErrorCode:error:", 8, v16);

    -[HMDMediaDestinationController messageHandler](v12, "messageHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "notifyUpdatedDestinationWithIdentifier:", v7);

    -[HMDMediaDestinationController notifyDelegateDidUpdateStagedValues](v12, "notifyDelegateDidUpdateStagedValues");
  }

}

- (void)stagedValue:(id)a3 didExpireAvailableDestinationIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  HMDMediaDestinationController *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDMediaDestinationController *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDBCF20];
    -[HMDMediaDestinationController committedData](self, "committedData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "availableDestinationIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "isEqualToSet:", v12);

    if ((v13 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v17;
        v26 = 2112;
        v27 = v7;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Handling did expire available destination identifiers: %@", (uint8_t *)&v24, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      -[HMDMediaDestinationController metricsEventDispatcher](v15, "metricsEventDispatcher");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "submitFailureEventWithEventErrorCode:error:", 9, v19);

      -[HMDMediaDestinationController notifyDelegateDidUpdateStagedValues](v15, "notifyDelegateDidUpdateStagedValues");
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Expired available destination identifiers was null when the property is non-null", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (void)notifyDelegateDidUpdateStagedValues
{
  void *v3;
  void *v4;
  void *v5;
  HMDMediaDestinationController *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaDestinationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "mediaDestinationControllerDidUpdateStagedValues:", self);
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
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed notify did update staged values due to no delegate", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMDMediaDestinationControllerMessageHandler)messageHandler
{
  return (HMDMediaDestinationControllerMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (HMDMediaDestinationControllerBackingStoreHandler)backingStoreHandler
{
  return (HMDMediaDestinationControllerBackingStoreHandler *)objc_getProperty(self, a2, 40, 1);
}

- (HMDMediaDestinationControllerDataSource)dataSource
{
  return (HMDMediaDestinationControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDMediaDestinationControllerDelegate)delegate
{
  return (HMDMediaDestinationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isTargetDevice
{
  return self->_isTargetDevice;
}

- (HMDMediaDestinationControllerMetricsEventDispatcher)metricsEventDispatcher
{
  return (HMDMediaDestinationControllerMetricsEventDispatcher *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMetricsEventDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (HMFStagedValue)stagedDestinationIdentifier
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 72, 1);
}

- (HMFStagedValue)stagedAvailableDestinationIdentifiers
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedAvailableDestinationIdentifiers, 0);
  objc_storeStrong((id *)&self->_stagedDestinationIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsEventDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_backingStoreHandler, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __195__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdatedDestinationNotification_destinationControllerIdentifier_destinationIdentifier___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Update destination identifier to unset destination finished with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __195__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdatedDestinationNotification_destinationControllerIdentifier_destinationIdentifier___block_invoke_27(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Update destination identifier to unset destination finished", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);

}

void __178__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdateDestinationRequestMessage_destinationIdentifier_updateOptions___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Update destination future finished with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v3);

}

void __178__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdateDestinationRequestMessage_destinationIdentifier_updateOptions___block_invoke_26(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Update destination future finished", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "respondWithSuccess");

}

BOOL __72__HMDMediaDestinationController_filteredAvailableDestinationIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dataSourceDestinationWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Filtering unknown available destination with identifier: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

  return v4 != 0;
}

void __61__HMDMediaDestinationController_refreshDestinationIdentifier__block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Update destination identifier for refresh finished with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __61__HMDMediaDestinationController_refreshDestinationIdentifier__block_invoke_24(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Update destination identifier for refresh finished", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);

}

void __71__HMDMediaDestinationController_refreshAvailableDestinationIdentifiers__block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Update available destination identifiers for refresh finished with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __71__HMDMediaDestinationController_refreshAvailableDestinationIdentifiers__block_invoke_22(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Update available destination identifiers for refresh finished", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);

}

void __86__HMDMediaDestinationController_updateDestinationWithIdentifier_audioGroupIdentifier___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Send request to update audio group identifier completed with error: %@", (uint8_t *)&v10, 0x16u);

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
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Send request to update audio group identifier completed", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __67__HMDMediaDestinationController_legacyUpdateDestinationIdentifier___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Update destination finished with error: %@", (uint8_t *)&v10, 0x16u);

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
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Update destination finished", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __77__HMDMediaDestinationController_legacyUpdateAvailableDestinationIdentifiers___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Update available destination identifiers finished with error: %@", (uint8_t *)&v10, 0x16u);

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
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Update available destination identifiers finished", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

uint64_t __70__HMDMediaDestinationController_stageAvailableDestinationIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __54__HMDMediaDestinationController_migrateSupportOptions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
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
      HMMediaDestinationControllerSupportOptionsAsString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate supported options: %@ error: %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

+ (unint64_t)expectedSupportOptions
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (+[HMDDeviceCapabilities supportsAudioDestinationControllerCreation](HMDDeviceCapabilities, "supportsAudioDestinationControllerCreation"))
  {
    return 7;
  }
  v3 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@[HMDMediaDestinationController] Querying expected support options on unsupported device", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t53_253204 != -1)
    dispatch_once(&logCategory__hmf_once_t53_253204, &__block_literal_global_253205);
  return (id)logCategory__hmf_once_v54_253206;
}

void __44__HMDMediaDestinationController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v54_253206;
  logCategory__hmf_once_v54_253206 = v0;

}

@end
