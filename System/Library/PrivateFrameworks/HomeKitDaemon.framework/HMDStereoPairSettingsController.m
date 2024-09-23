@implementation HMDStereoPairSettingsController

- (HMDStereoPairSettingsController)initWithDataSource:(id)a3 workQueue:(id)a4 stateManagerFactory:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  HMDStereoPairSettingsController *v11;
  HMDStereoPairSettingsController *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *residentRunStateManager;
  HMDStereoPairSettingsControllerStateManager *v18;
  uint64_t v19;
  HMDCompositeSettingControllerManagerStateManager *v20;
  uint64_t v21;
  NSMutableDictionary *topicToLastReceivedEvent;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v24.receiver = self;
  v24.super_class = (Class)HMDStereoPairSettingsController;
  v11 = -[HMDStereoPairSettingsController init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeStrong((id *)&v12->_workQueue, a4);
    objc_msgSend(v8, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10)
    {
      objc_msgSend(v13, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      residentRunStateManager = v12->_residentRunStateManager;
      v12->_residentRunStateManager = (HMDCompositeSettingControllerManagerStateManager *)v16;
    }
    else
    {
      v18 = [HMDStereoPairSettingsControllerStateManager alloc];
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "uuid");
      residentRunStateManager = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HMDCompositeSettingControllerManagerStateManager initWithDataSource:notificationRegistrationProvider:subscribeWithOptions:delegate:uuid:](v18, "initWithDataSource:notificationRegistrationProvider:subscribeWithOptions:delegate:uuid:", v12, v15, 1, v12, residentRunStateManager);
      v20 = v12->_residentRunStateManager;
      v12->_residentRunStateManager = (HMDCompositeSettingControllerManagerStateManager *)v19;

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    topicToLastReceivedEvent = v12->_topicToLastReceivedEvent;
    v12->_topicToLastReceivedEvent = (NSMutableDictionary *)v21;

  }
  return v12;
}

- (HMDStereoPairSettingsController)initWithDataSource:(id)a3 workQueue:(id)a4
{
  return -[HMDStereoPairSettingsController initWithDataSource:workQueue:stateManagerFactory:](self, "initWithDataSource:workQueue:stateManagerFactory:", a3, a4, 0);
}

- (void)startIfPrimaryResident
{
  void *v3;
  HMDStereoPairSettingsController *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (-[HMDStereoPairSettingsController _currentDevicePrimaryResident](self, "_currentDevicePrimaryResident"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDStereoPairSettingsController dataSource](v4, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v6;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Current device for home %@ is primary resident", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDStereoPairSettingsController dataSource](v4, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuidToMediaSystems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          -[HMDStereoPairSettingsController _subscribeToAddedMediaSystem:](v4, "_subscribeToAddedMediaSystem:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

- (void)subscribeToAddedMediaSystemIfPrimaryResident:(id)a3
{
  id v4;

  v4 = a3;
  if (-[HMDStereoPairSettingsController _currentDevicePrimaryResident](self, "_currentDevicePrimaryResident"))
    -[HMDStereoPairSettingsController _subscribeToAddedMediaSystem:](self, "_subscribeToAddedMediaSystem:", v4);

}

- (void)unsubscribeToRemovedMediaSystemIfPrimaryResident:(id)a3
{
  id v4;

  v4 = a3;
  if (-[HMDStereoPairSettingsController _currentDevicePrimaryResident](self, "_currentDevicePrimaryResident"))
    -[HMDStereoPairSettingsController _unsubscribeToRemovedMediaSystem:](self, "_unsubscribeToRemovedMediaSystem:", v4);

}

- (void)stopIfPrimaryResidentChange
{
  _BOOL4 v3;
  void *v4;
  HMDStereoPairSettingsController *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = -[HMDStereoPairSettingsController _currentDevicePrimaryResident](self, "_currentDevicePrimaryResident");
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Ask to stop subscription on primary resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Primary resident changed and unsubscribe all", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDStereoPairSettingsController dataSource](v5, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuidToMediaSystems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          -[HMDStereoPairSettingsController _unsubscribeToRemovedMediaSystem:](v5, "_unsubscribeToRemovedMediaSystem:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++), (_QWORD)v19);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

    -[HMDStereoPairSettingsController topicToLastReceivedEvent](v5, "topicToLastReceivedEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeAllObjects");

  }
}

- (id)_groupOwnerTopicsForMediaSystem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDStereoPairSettingsController *v17;
  NSObject *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)();
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDStereoPairSettingsController _homeUUID](self, "_homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStereoPairSettingsController _mediaSystemGroupOwnerAccessoryUUID:](self, "_mediaSystemGroupOwnerAccessoryUUID:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x24BDD7418], "defaultSettingsAllKeyPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __67__HMDStereoPairSettingsController__groupOwnerTopicsForMediaSystem___block_invoke;
    v27[3] = &unk_24E79A8E8;
    v10 = v5;
    v28 = v10;
    v11 = v7;
    v29 = v11;
    objc_msgSend(v8, "na_map:", v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD7418], "languageKeyPaths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v9;
    v22 = 3221225472;
    v23 = __67__HMDStereoPairSettingsController__groupOwnerTopicsForMediaSystem___block_invoke_2;
    v24 = &unk_24E79A8E8;
    v25 = v10;
    v26 = v11;
    objc_msgSend(v13, "na_map:", &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v12, v21, v22, v23, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v19;
      v32 = 2112;
      v33 = v4;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Media system %@ does not have an owner", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v15 = 0;
  }

  return v15;
}

- (void)_subscribeToAddedMediaSystem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDStereoPairSettingsController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDStereoPairSettingsController *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDStereoPairSettingsController *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDStereoPairSettingsController _homeUUID](self, "_homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStereoPairSettingsController _mediaSystemGroupOwnerAccessoryUUID:](self, "_mediaSystemGroupOwnerAccessoryUUID:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    -[HMDStereoPairSettingsController _groupOwnerTopicsForMediaSystem:](self, "_groupOwnerTopicsForMediaSystem:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "count"))
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v30 = v13;
        v31 = 2112;
        v32 = v5;
        v33 = 2112;
        v34 = v7;
        v35 = 2112;
        v36 = v9;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Subscribing to home: %@, (owner) accessory: %@ topics: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v10);
      -[HMDStereoPairSettingsController dataSource](v11, "dataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localAndRemoteSubscriptionProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __64__HMDStereoPairSettingsController__subscribeToAddedMediaSystem___block_invoke;
      v24[3] = &unk_24E79A938;
      v24[4] = v11;
      v25 = v9;
      v26 = v7;
      v27 = v5;
      v28 = v4;
      objc_msgSend(v15, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", v11, v25, MEMORY[0x24BDBD1A8], v24);

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
        *(_DWORD *)buf = 138543874;
        v30 = v23;
        v31 = 2112;
        v32 = v5;
        v33 = 2112;
        v34 = v7;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@No topics for home: %@ accessory: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v19;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Media system %@ does not have an owner", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)_processReceivedEvent:(id)a3 topic:(id)a4 home:(id)a5 mediaSystem:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDStereoPairSettingsController *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDStereoPairSettingsController *v29;
  NSObject *v30;
  void *v31;
  void *context;
  void *contexta;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDStereoPairSettingsController workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  +[HMDLegacyAccessorySettingsAdaptor parsedBoolSettingEvent:topic:](HMDLegacyAccessorySettingsAdaptor, "parsedBoolSettingEvent:topic:", v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "keyPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDStereoPairSettingsController _postAsStereoPairEventsIfDifferentForHome:mediaSystem:keyPath:setting:](self, "_postAsStereoPairEventsIfDifferentForHome:mediaSystem:keyPath:setting:", v12, v13, v17, v16);
  }
  else
  {
    +[HMDLegacyAccessorySettingsAdaptor parsedIntegerSettingEvent:topic:](HMDLegacyAccessorySettingsAdaptor, "parsedIntegerSettingEvent:topic:", v10, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v18;
    if (v18)
    {
      objc_msgSend(v18, "keyPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDStereoPairSettingsController _postAsStereoPairEventsIfDifferentForHome:mediaSystem:keyPath:setting:](self, "_postAsStereoPairEventsIfDifferentForHome:mediaSystem:keyPath:setting:", v12, v13, v19, v17);
    }
    else
    {
      +[HMDLegacyAccessorySettingsAdaptor parsedLanguageSetting:topic:](HMDLegacyAccessorySettingsAdaptor, "parsedLanguageSetting:topic:", v10, v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v20;
      if (v20)
      {
        objc_msgSend(v20, "keyPath");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDStereoPairSettingsController _postAsStereoPairEventsIfDifferentForHome:mediaSystem:keyPath:setting:](self, "_postAsStereoPairEventsIfDifferentForHome:mediaSystem:keyPath:setting:", v12, v13, v21, v19);

      }
      else
      {
        +[HMDLegacyAccessorySettingsAdaptor parsedLanguageListSetting:topic:](HMDLegacyAccessorySettingsAdaptor, "parsedLanguageListSetting:topic:", v10, v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        context = (void *)MEMORY[0x227676638]();
        v23 = self;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v34 = v22;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v25;
          v37 = 2112;
          v38 = v34;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Language List:%@", buf, 0x16u);

          v22 = v34;
        }

        objc_autoreleasePoolPop(context);
        v26 = v22;
        if (v22)
        {
          objc_msgSend(v22, "keyPath");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDStereoPairSettingsController _postAsStereoPairEventsIfDifferentForHome:mediaSystem:keyPath:setting:](v23, "_postAsStereoPairEventsIfDifferentForHome:mediaSystem:keyPath:setting:", v12, v13, v27, v26);

        }
        else
        {
          v28 = (void *)MEMORY[0x227676638]();
          v29 = v23;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            contexta = v28;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v36 = v31;
            v37 = 2112;
            v38 = v10;
            v39 = 2112;
            v40 = v11;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Received unknown event type: %@ topic: %@", buf, 0x20u);

            v28 = contexta;
          }

          objc_autoreleasePoolPop(v28);
          v26 = 0;
        }

      }
    }

  }
}

- (void)_postAsStereoPairEventsIfDifferentForHome:(id)a3 mediaSystem:(id)a4 keyPath:(id)a5 setting:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  HMDStereoPairSettingsController *v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  HMDStereoPairSettingsController *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDStereoPairSettingsController *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[HMDStereoPairSettingsController dataSource](self, "dataSource");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStereoPairSettingsController workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v50 = v18;
    v51 = 2112;
    v52 = v10;
    v53 = 2112;
    v54 = v11;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Forward media system %@ keypath: %@", buf, 0x20u);

    v12 = v17;
  }

  objc_autoreleasePoolPop(v14);
  objc_msgSend(v10, "UUIDString");
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v45 = (void *)v19;
  v44 = objc_msgSend(objc_alloc(MEMORY[0x24BDD7708]), "initWithSetting:eventSource:eventTimestamp:", v12, v19, v20);
  HMImmutableSettingChangeEventTopicFromMediaSystem();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v46;
  objc_msgSend(v46, "eventStoreReadHandle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lastEventForTopic:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    v25 = 0;
    goto LABEL_15;
  }
  v48 = 0;
  objc_msgSend(MEMORY[0x24BDD7708], "decodeSettingFromEvent:error:", v24, &v48);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v48;
  if (v26)
  {
    v40 = v12;
    v42 = v11;
    v27 = (void *)MEMORY[0x227676638]();
    v28 = v15;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = v27;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v30;
      v51 = 2112;
      v52 = v21;
      v53 = 2112;
      v54 = v26;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Error reading stored setting for topic %@, error: %@", buf, 0x20u);

      v27 = v39;
    }

    objc_autoreleasePoolPop(v27);
    v12 = v40;
    v11 = v42;
  }

  if (!v25 || !objc_msgSend(v25, "isEqual:", v12))
  {
    v22 = v46;
LABEL_15:
    objc_msgSend(v22, "eventForwarder", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)v44;
    objc_msgSend(v38, "forwardEvent:topic:completion:", v44, v21, &__block_literal_global_13_247112);

    goto LABEL_16;
  }
  v31 = v12;
  v32 = (void *)MEMORY[0x227676638]();
  v33 = v15;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v43 = v11;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "keyPath");
    v41 = v32;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v35;
    v51 = 2114;
    v52 = v36;
    _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Skip sending event for keyPath: %{public}@ as it matches stored", buf, 0x16u);

    v32 = v41;
    v11 = v43;
  }

  objc_autoreleasePoolPop(v32);
  v12 = v31;
  v22 = v46;
  v37 = (void *)v44;
LABEL_16:

}

- (id)_homeUUID
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDStereoPairSettingsController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_mediaSystemGroupOwnerAccessoryUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDStereoPairSettingsController mediaSystemGroupOwner:](self, "mediaSystemGroupOwner:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)mediaSystemGroupOwner:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  HMDStereoPairSettingsController *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDStereoPairSettingsController *v25;
  NSObject *v26;
  void *v27;
  HMDStereoPairSettingsController *v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v30 = v4;
    objc_msgSend(v4, "components");
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v7)
    {
      v8 = v7;
      v29 = self;
      v9 = 0;
      v10 = *(_QWORD *)v33;
      obj = v6;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (!v12)
          {
            v19 = (void *)MEMORY[0x227676638]();
            v20 = v29;
            HMFGetOSLogHandle();
            v21 = objc_claimAutoreleasedReturnValue();
            v5 = v30;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v38 = v22;
              v39 = 2112;
              v40 = v30;
              _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Component is nil for media system %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v19);
            v6 = obj;

            v23 = 0;
            goto LABEL_22;
          }
          if (!v9)
            goto LABEL_10;
          objc_msgSend(v9, "accessory");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "serialNumber");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "accessory");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "serialNumber");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v14, "compare:", v16);

          if (v17 == 1)
          {
LABEL_10:
            v18 = v12;

            v9 = v18;
          }
        }
        v6 = obj;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v9 = 0;
    }

    v9 = v9;
    v23 = v9;
    v5 = v30;
LABEL_22:

  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v27;
      v39 = 2112;
      v40 = 0;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Ask to compute owner for media system: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    v23 = 0;
  }

  return v23;
}

- (void)_unsubscribeToRemovedMediaSystem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDStereoPairSettingsController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDStereoPairSettingsController *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDStereoPairSettingsController *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDStereoPairSettingsController _homeUUID](self, "_homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStereoPairSettingsController _mediaSystemGroupOwnerAccessoryUUID:](self, "_mediaSystemGroupOwnerAccessoryUUID:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    -[HMDStereoPairSettingsController _groupOwnerTopicsForMediaSystem:](self, "_groupOwnerTopicsForMediaSystem:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "count"))
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v26 = v13;
        v27 = 2112;
        v28 = v5;
        v29 = 2112;
        v30 = v7;
        v31 = 2112;
        v32 = v9;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@unsubscribing to home: %@, (owner) accessory: %@ topics: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v10);
      -[HMDStereoPairSettingsController dataSource](v11, "dataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localAndRemoteSubscriptionProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __68__HMDStereoPairSettingsController__unsubscribeToRemovedMediaSystem___block_invoke;
      v24[3] = &unk_24E79A980;
      v24[4] = v11;
      objc_msgSend(v15, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", v11, MEMORY[0x24BDBD1A8], v9, v24);

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
        *(_DWORD *)buf = 138543874;
        v26 = v23;
        v27 = 2112;
        v28 = v5;
        v29 = 2112;
        v30 = v7;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@No topics for home: %@ accessory: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Media system %@ does not have an owner", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (BOOL)_currentDevicePrimaryResident
{
  void *v2;
  void *v3;

  -[HMDStereoPairSettingsController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isCurrentDeviceConfirmedPrimaryResident");
  return (char)v2;
}

- (id)_mediaSystems
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDStereoPairSettingsController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuidToMediaSystems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)homes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDStereoPairSettingsController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)didUpdateCurrentRunState:(int64_t)a3 updatedState:(int64_t)a4 forHome:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  HMDStereoPairSettingsController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDStereoPairSettingsController *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  -[HMDStereoPairSettingsController _homeUUID](self, "_homeUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v8))
  {
    if (a3 != 3 || a4 == 3)
    {
      if (a3 != 3 && a4 == 3)
      {
        v14 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543362;
          v19 = v17;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@State change from primary to non-primary: subscribe to the group owner", (uint8_t *)&v18, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        -[HMDStereoPairSettingsController startIfPrimaryResident](v15, "startIfPrimaryResident");
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@State change from primary to non-primary: unsubscribe to the group owner", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      -[HMDStereoPairSettingsController stopIfPrimaryResidentChange](v11, "stopIfPrimaryResidentChange");
    }
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDStereoPairSettingsController _homeUUID](self, "_homeUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_mediaSystemWithAccessorryUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[HMDStereoPairSettingsController _mediaSystems](self, "_mediaSystems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__HMDStereoPairSettingsController__mediaSystemWithAccessorryUUID___block_invoke;
  v9[3] = &unk_24E79A9C8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  HMDStereoPairSettingsController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD7640], "decodeTopic:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asAccessorySettingTopic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
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
      v29 = v21;
      v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse topic: %@", buf, 0x16u);
LABEL_8:

    }
LABEL_9:

    objc_autoreleasePoolPop(v18);
    goto LABEL_10;
  }
  objc_msgSend(v9, "accessoryUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStereoPairSettingsController _mediaSystemWithAccessorryUUID:](self, "_mediaSystemWithAccessorryUUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessoryUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v21;
      v30 = 2112;
      v31 = v6;
      v32 = 2112;
      v33 = v7;
      v34 = 2112;
      v35 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Received event: %@ topic: %@, failed to find media system with accessory: %@", buf, 0x2Au);

      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[HMDStereoPairSettingsController _homeUUID](self, "_homeUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStereoPairSettingsController workQueue](self, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__HMDStereoPairSettingsController_didReceiveEvent_topic___block_invoke;
  block[3] = &unk_24E79AD20;
  block[4] = self;
  v24 = v6;
  v25 = v7;
  v26 = v13;
  v27 = v14;
  v16 = v14;
  v17 = v13;
  dispatch_async(v15, block);

LABEL_10:
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDStereoPairSettingsController *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
    v15 = 138543874;
    v16 = v14;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Process cached event: %@ topic: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDStereoPairSettingsController didReceiveEvent:topic:](v12, "didReceiveEvent:topic:", v8, v9);

}

- (void)pushLastEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDStereoPairSettingsController topicToLastReceivedEvent](self, "topicToLastReceivedEvent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (HMDStereoPairSettingsControllerDataSource)dataSource
{
  return (HMDStereoPairSettingsControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCompositeSettingControllerManagerStateManager)residentRunStateManager
{
  return self->_residentRunStateManager;
}

- (void)setResidentRunStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_residentRunStateManager, a3);
}

- (NSMutableDictionary)topicToLastReceivedEvent
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTopicToLastReceivedEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicToLastReceivedEvent, 0);
  objc_storeStrong((id *)&self->_residentRunStateManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

uint64_t __57__HMDStereoPairSettingsController_didReceiveEvent_topic___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Process event: %@ topic: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_processReceivedEvent:topic:home:mediaSystem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

BOOL __66__HMDStereoPairSettingsController__mediaSystemWithAccessorryUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(*(id *)(a1 + 32), "_mediaSystemGroupOwnerAccessoryUUID:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v3 && (objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) != 0;

  return v5;
}

void __68__HMDStereoPairSettingsController__unsubscribeToRemovedMediaSystem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      objc_autoreleasePoolPop(v7);
      goto LABEL_6;
    }
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v6;
    v11 = "%{public}@Error in unsubscribing: %@";
LABEL_4:
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0x16u);

    goto LABEL_5;
  }
  if (v5 && objc_msgSend(v5, "count"))
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v5;
    v11 = "%{public}@Received cached events: %@ when unsubscribing all topics";
    goto LABEL_4;
  }
LABEL_6:

}

void __64__HMDStereoPairSettingsController__subscribeToAddedMediaSystem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error in subscribing to topics %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully subscribed to (owner) accessory: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __64__HMDStereoPairSettingsController__subscribeToAddedMediaSystem___block_invoke_7;
    v18[3] = &unk_24E79A910;
    v16 = v5;
    v17 = *(_QWORD *)(a1 + 32);
    v19 = v16;
    v20 = v17;
    v21 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 64);
    dispatch_async(v15, v18);

  }
}

void __64__HMDStereoPairSettingsController__subscribeToAddedMediaSystem___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v19;
    *(_QWORD *)&v3 = 138543874;
    v16 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7, v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x227676638]();
        v10 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v16;
          v23 = v12;
          v24 = 2112;
          v25 = v8;
          v26 = 2112;
          v27 = v7;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Process cached event: %@ topic: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v9);
        v13 = *(void **)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 56), "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_processReceivedEvent:topic:home:mediaSystem:", v8, v7, v14, v15);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v4);
  }

}

void __67__HMDStereoPairSettingsController__groupOwnerTopicsForMediaSystem___block_invoke()
{
  JUMPOUT(0x2276752E8);
}

void __67__HMDStereoPairSettingsController__groupOwnerTopicsForMediaSystem___block_invoke_2()
{
  JUMPOUT(0x2276752E8);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26_247133 != -1)
    dispatch_once(&logCategory__hmf_once_t26_247133, &__block_literal_global_14_247134);
  return (id)logCategory__hmf_once_v27_247135;
}

void __46__HMDStereoPairSettingsController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v27_247135;
  logCategory__hmf_once_v27_247135 = v0;

}

@end
