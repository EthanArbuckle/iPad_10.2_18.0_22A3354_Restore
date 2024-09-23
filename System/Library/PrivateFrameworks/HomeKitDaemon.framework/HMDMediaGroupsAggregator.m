@implementation HMDMediaGroupsAggregator

- (HMDMediaGroupsAggregator)initWithIdentifier:(id)a3 messenger:(id)a4 eventForwarder:(id)a5 subscriptionProvider:(id)a6 eventStoreReadHandle:(id)a7 groupsLocalDataStorage:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDFeaturesDataSource *v20;
  HMDMediaGroupsAggregator *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(HMDFeaturesDataSource);
  v21 = -[HMDMediaGroupsAggregator initWithIdentifier:messenger:eventForwarder:subscriptionProvider:eventStoreReadHandle:groupsLocalDataStorage:timerProvider:featuresDataSource:](self, "initWithIdentifier:messenger:eventForwarder:subscriptionProvider:eventStoreReadHandle:groupsLocalDataStorage:timerProvider:featuresDataSource:", v19, v18, v17, v16, v15, v14, self, v20);

  return v21;
}

- (HMDMediaGroupsAggregator)initWithIdentifier:(id)a3 messenger:(id)a4 eventForwarder:(id)a5 subscriptionProvider:(id)a6 eventStoreReadHandle:(id)a7 groupsLocalDataStorage:(id)a8 timerProvider:(id)a9 featuresDataSource:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HMDMediaGroupsAggregator *v22;
  HMDMediaGroupsAggregator *v23;
  HMFTimer *warmUpTimer;
  uint64_t v25;
  NSMutableDictionary *destinations;
  uint64_t v27;
  NSMutableDictionary *destinationControllersData;
  HMDMediaGroupsAggregateData *v29;
  uint64_t v30;
  HMDMediaGroupsAggregateData *aggregateData;
  uint64_t v32;
  NSArray *generators;
  HMDMediaGroupsAggregator *v35;
  SEL v36;
  id obj;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v17 = a3;
  obj = a4;
  v18 = a4;
  v38 = a5;
  v19 = a5;
  v42 = a6;
  v40 = a7;
  v41 = a8;
  v20 = a9;
  v21 = a10;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v19)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v42)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v41)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v40)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v20)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v21)
  {
LABEL_19:
    v35 = (HMDMediaGroupsAggregator *)_HMFPreconditionFailure();
    return (HMDMediaGroupsAggregator *)-[HMDMediaGroupsAggregator createGenerators](v35, v36);
  }
  v39 = v21;
  v43.receiver = self;
  v43.super_class = (Class)HMDMediaGroupsAggregator;
  v22 = -[HMDMediaGroupsAggregator init](&v43, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v22->_featuresDataSource, a10);
    objc_storeStrong((id *)&v23->_identifier, a3);
    v23->_state = 0;
    warmUpTimer = v23->_warmUpTimer;
    v23->_warmUpTimer = 0;

    objc_storeWeak((id *)&v23->_timerProvider, v20);
    objc_storeStrong((id *)&v23->_messenger, obj);
    objc_storeStrong((id *)&v23->_eventForwarder, v38);
    objc_storeStrong((id *)&v23->_subscriptionProvider, a6);
    objc_storeStrong((id *)&v23->_groupLocalDataStorage, a8);
    objc_storeStrong((id *)&v23->_eventStoreReadHandle, a7);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    destinations = v23->_destinations;
    v23->_destinations = (NSMutableDictionary *)v25;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v27 = objc_claimAutoreleasedReturnValue();
    destinationControllersData = v23->_destinationControllersData;
    v23->_destinationControllersData = (NSMutableDictionary *)v27;

    v29 = [HMDMediaGroupsAggregateData alloc];
    v30 = -[HMDMediaGroupsAggregateData initWithDestinations:destinationControllersData:](v29, "initWithDestinations:destinationControllersData:", MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);
    aggregateData = v23->_aggregateData;
    v23->_aggregateData = (HMDMediaGroupsAggregateData *)v30;

    -[HMDMediaGroupsAggregator createGenerators](v23, "createGenerators");
    v32 = objc_claimAutoreleasedReturnValue();
    generators = v23->_generators;
    v23->_generators = (NSArray *)v32;

  }
  return v23;
}

- (id)createGenerators
{
  HMDMediaSystemsAggregateDataGenerator *v3;
  HMDMediaDestinationControllerAggregateDataGenerator *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(HMDMediaSystemsAggregateDataGenerator);
  -[HMDMediaSystemsAggregateDataGenerator setDataSource:](v3, "setDataSource:", self);
  v7[0] = v3;
  v4 = objc_alloc_init(HMDMediaDestinationControllerAggregateDataGenerator);
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 primaryResidentChangeMonitor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDMediaGroupsAggregator *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v17;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Configuring media groups aggregator", (uint8_t *)&v19, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDMediaGroupsAggregator registerForNotificationsWithHome:notificationCenter:primaryResidentChangeMonitor:](v15, "registerForNotificationsWithHome:notificationCenter:primaryResidentChangeMonitor:", v10, v12, v13);
  -[HMDMediaGroupsAggregator refreshRunningStateUsingPrimaryResidentChangeMonitor:](v15, "refreshRunningStateUsingPrimaryResidentChangeMonitor:", v13);
  -[HMDMediaGroupsAggregator messenger](v15, "messenger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "configureWithMessageDispatcher:home:", v11, v10);

}

- (void)registerForNotificationsWithHome:(id)a3 notificationCenter:(id)a4 primaryResidentChangeMonitor:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v10 = a4;
  v9 = a3;
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleHomeAddedAccessoryNotification_, CFSTR("HMDNotificationHomeAddedAccessory"), v9);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleHomeRemovedAccessoryNotification_, CFSTR("HMDHomeAccessoryRemovedNotification"), v9);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleMediaSystemAddedNotification_, CFSTR("HMDMediaSystemAddedNotification"), v9);

  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentDeviceChangeNotification_, CFSTR("HMDPrimaryResidentChangeMonitorIsCurrentDeviceChangeNotification"), v8);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentDeviceChangeNotification_, CFSTR("HMDPrimaryResidentChangeMonitorHasResidentDevicesChangeNotification"), v8);

  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleAccessoryChangedRoomNotification_, CFSTR("HMDNotificationAccessoryChangedRoom"), 0);
}

- (void)refreshRunningStateUsingPrimaryResidentChangeMonitor:(id)a3
{
  if (objc_msgSend(a3, "isCurrentDevicePrimaryResident"))
    -[HMDMediaGroupsAggregator runAsPrimary](self, "runAsPrimary");
  else
    -[HMDMediaGroupsAggregator stop](self, "stop");
}

- (void)handleHomeAddedAccessoryNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  HMDMediaGroupsAggregator *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HMDNotificationAddedAccessoryKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v9 = v7;
    else
      v9 = 0;
    v10 = v9;

    if ((isKindOfClass & 1) != 0)
      -[HMDMediaGroupsAggregator registerForEventsForAccessory:](self, "registerForEventsForAccessory:", v7);

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
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get added accessory from notification: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)handleHomeRemovedAccessoryNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char isKindOfClass;
  void *v11;
  id v12;
  void *v13;
  HMDMediaGroupsAggregator *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HMDAccessoryNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsAggregator fixupGroupsForRemovedParticipantAccessoryUUID:](self, "fixupGroupsForRemovedParticipantAccessoryUUID:", v7);

    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsAggregator clearCachedDataForParticipantAccessoryUUID:](self, "clearCachedDataForParticipantAccessoryUUID:", v8);

    v9 = v6;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

    if ((isKindOfClass & 1) != 0)
      -[HMDMediaGroupsAggregator unregisterForEventsForAccessory:](self, "unregisterForEventsForAccessory:", v9);

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
      v17 = 138543618;
      v18 = v16;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get removed accessory from notification: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)handleMediaSystemAddedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsAggregator *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDMediaGroupsAggregator isRunning](self, "isRunning"))
  {
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
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Refreshing aggregate data due to added media system notification", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDMediaGroupsAggregator refreshAggregateData](v6, "refreshAggregateData");
  }

}

- (void)handlePrimaryResidentDeviceChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDMediaGroupsAggregator *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HMDMediaGroupsAggregator refreshRunningStateUsingPrimaryResidentChangeMonitor:](self, "refreshRunningStateUsingPrimaryResidentChangeMonitor:", v7);
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
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get primary resident change monitor from notification: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)handleAccessoryChangedRoomNotification:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsAggregator *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDMediaGroupsAggregator isRunning](self, "isRunning"))
  {
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
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Refreshing aggregate data due to change room notification", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDMediaGroupsAggregator refreshAggregateData](v6, "refreshAggregateData");
  }

}

- (void)registerForEvents
{
  void *v3;
  void *v4;
  void *v5;
  HMDMediaGroupsAggregator *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaGroupsAggregator appleMediaAccessories](self, "appleMediaAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __45__HMDMediaGroupsAggregator_registerForEvents__block_invoke;
    v9[3] = &unk_24E788560;
    v9[4] = self;
    objc_msgSend(v3, "na_each:", v9);
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
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for events due to no accessories", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (void)registerForEventsForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDMediaGroupsAggregator *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDMediaGroupsAggregator isRunningAsPrimary](self, "isRunningAsPrimary"))
  {
    -[HMDMediaGroupsAggregator participantDataTopicForAccessory:](self, "participantDataTopicForAccessory:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v16 = v9;
        v17 = 2112;
        v18 = v5;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering participant data topic: %@ for accessory: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v6);
      -[HMDMediaGroupsAggregator subscriptionProvider](v7, "subscriptionProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __58__HMDMediaGroupsAggregator_registerForEventsForAccessory___block_invoke;
      v12[3] = &unk_24E78B610;
      v12[4] = v7;
      v13 = v5;
      objc_msgSend(v10, "registerConsumer:topicFilters:completion:", v7, v11, v12);

    }
  }

}

- (void)unregisterForAllEvents
{
  void *v3;
  HMDMediaGroupsAggregator *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
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
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Unregister for all events", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMediaGroupsAggregator subscriptionProvider](v4, "subscriptionProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__HMDMediaGroupsAggregator_unregisterForAllEvents__block_invoke;
  v8[3] = &unk_24E79BD80;
  v8[4] = v4;
  objc_msgSend(v7, "unregisterConsumer:completion:", v4, v8);

}

- (void)unregisterForEventsForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDMediaGroupsAggregator *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDMediaGroupsAggregator isRunningAsPrimary](self, "isRunningAsPrimary"))
  {
    -[HMDMediaGroupsAggregator participantDataTopicForAccessory:](self, "participantDataTopicForAccessory:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v16 = v9;
        v17 = 2112;
        v18 = v5;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Unregistering destination topic: %@ for accessory: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v6);
      -[HMDMediaGroupsAggregator subscriptionProvider](v7, "subscriptionProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __60__HMDMediaGroupsAggregator_unregisterForEventsForAccessory___block_invoke;
      v12[3] = &unk_24E79BCC8;
      v12[4] = v7;
      v13 = v5;
      objc_msgSend(v10, "unregisterConsumer:topicFilters:completion:", v7, v11, v12);

    }
  }

}

- (void)refreshAggregateData
{
  HMDMediaGroupsAggregateData *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaGroupsAggregateData *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HMDMediaGroupsAggregateData *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HMDMediaGroupsAggregator *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDMediaGroupsAggregator *v25;
  NSObject *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  HMDMediaGroupsAggregateData *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (-[HMDMediaGroupsAggregator isRunning](self, "isRunning"))
  {
    v3 = [HMDMediaGroupsAggregateData alloc];
    -[HMDMediaGroupsAggregator destinations](self, "destinations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsAggregator destinationControllersData](self, "destinationControllersData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsAggregator groups](self, "groups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDMediaGroupsAggregateData initWithDestinations:destinationControllersData:groups:](v3, "initWithDestinations:destinationControllersData:groups:", v4, v5, v6);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[HMDMediaGroupsAggregator generators](self, "generators", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        v12 = 0;
        v13 = v7;
        do
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
          -[HMDMediaGroupsAggregateData destinations](v13, "destinations");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaGroupsAggregateData destinationControllersData](v13, "destinationControllersData");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaGroupsAggregateData groups](v13, "groups");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "aggregateDataWithDestinations:controllers:groups:", v15, v16, v17);
          v7 = (HMDMediaGroupsAggregateData *)objc_claimAutoreleasedReturnValue();

          ++v12;
          v13 = v7;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v10);
    }

    -[HMDMediaGroupsAggregator aggregateData](self, "aggregateData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqual:", v7);

    if (v19)
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        v34 = 2112;
        v35 = v7;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Refresh resulted in no change to aggregate data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }
    else
    {
      v24 = (void *)MEMORY[0x227676638](-[HMDMediaGroupsAggregator setAggregateData:](self, "setAggregateData:", v7));
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v27;
        v34 = 2112;
        v35 = v7;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Updated aggregate data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      -[HMDMediaGroupsAggregator notifyOfUpdatedMediaGroupsAggregateData:](v25, "notifyOfUpdatedMediaGroupsAggregateData:", v7);
      -[HMDMediaGroupsAggregator forwardAggregateData](v25, "forwardAggregateData");
    }

  }
}

- (void)notifyOfStoppedState
{
  void *v3;
  void *v4;
  void *v5;
  HMDMediaGroupsAggregator *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaGroupsAggregator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "didStopMediaGroupsAggregator:", self);
  }
  else
  {
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
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Failed to notify of stopped state due to no delegate", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (void)forwardAggregateData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDMediaGroupsAggregator *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDMediaGroupsAggregator *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDMediaGroupsAggregator *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaGroupsAggregator warmUpTimer](self, "warmUpTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HMDMediaGroupsAggregator aggregateDataTopic](self, "aggregateDataTopic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[HMDMediaGroupsAggregator eventSource](self, "eventSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[HMDMediaGroupsAggregator aggregateData](self, "aggregateData");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x227676638]();
        v8 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v27 = v10;
          v28 = 2112;
          v29 = v4;
          v30 = 2112;
          v31 = v6;
          _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Publishing topic: %@ data: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v7);
        v11 = objc_alloc(MEMORY[0x24BE4ED90]);
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        v12 = (void *)objc_msgSend(v11, "initWithSource:cachePolicy:combineType:timestamp:", v5, 2, 2);
        v13 = objc_alloc(MEMORY[0x24BE4ED80]);
        objc_msgSend(v6, "encodeToProtoBufferData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithEventData:metadata:", v14, v12);

        -[HMDMediaGroupsAggregator eventForwarder](v8, "eventForwarder");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __48__HMDMediaGroupsAggregator_forwardAggregateData__block_invoke;
        v25[3] = &unk_24E79BD80;
        v25[4] = v8;
        objc_msgSend(v16, "forwardEvent:topic:completion:", v15, v4, v25);

      }
      else
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v27 = v24;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get event source to forward data", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v21);
      }

    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v20;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get topic name to forward data", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
}

- (BOOL)shouldWarmUp
{
  void *v3;
  void *v4;
  void *v5;
  HMDMediaGroupsAggregateData *v6;
  void *v7;
  HMDMediaGroupsAggregateData *v8;
  void *v9;
  BOOL v10;
  void *v11;
  HMDMediaGroupsAggregator *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDMediaGroupsAggregator *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaGroupsAggregator aggregateDataTopic](self, "aggregateDataTopic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDMediaGroupsAggregator eventStoreReadHandle](self, "eventStoreReadHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastEventForTopic:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = [HMDMediaGroupsAggregateData alloc];
      objc_msgSend(v5, "encodedData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[HMDMediaGroupsAggregateData initWithProtoBufferData:](v6, "initWithProtoBufferData:", v7);

      if (v8)
      {
        -[HMDMediaGroupsAggregateData destinations](v8, "destinations");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          v10 = 1;
        }
        else
        {
          -[HMDMediaGroupsAggregateData destinationControllersData](v8, "destinationControllersData");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v20, "count") != 0;

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
          objc_msgSend(v5, "encodedData");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543874;
          v23 = v18;
          v24 = 2112;
          v25 = v19;
          v26 = 2112;
          v27 = v5;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode last cached event participant data: %@ from event: %@", (uint8_t *)&v22, 0x20u);

        }
        objc_autoreleasePoolPop(v15);
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

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
      v22 = 138543362;
      v23 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get last cached event participant data due to missing topic name", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)aggregateDataTopic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaGroupsAggregator *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaGroupsAggregator dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "aggregateDataTopicForMediaGroupsAggregator:", self);
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
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get aggregated data topic due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)participantDataTopicForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaGroupsAggregator *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsAggregator dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "participantDataTopicForAccessory:mediaGroupsAggregator:", v4, self);
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination topic due to no data source", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)eventSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaGroupsAggregator *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaGroupsAggregator dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "eventSourceForMediaGroupsAggregator:", self);
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
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get event source due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)appleMediaAccessories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaGroupsAggregator *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaGroupsAggregator dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "appleMediaAccessoriesForMediaGroupsAggregator:", self);
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
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get apple media accessories due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)destinationManagerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaGroupsAggregator *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsAggregator dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "destinationManagerWithIdentifier:mediaGroupsAggregator:", v4, self);
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

- (BOOL)isRunning
{
  HMDMediaGroupsAggregator *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_state == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isRunningAsPrimary
{
  HMDMediaGroupsAggregator *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_state == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)setState:(unint64_t)a3
{
  return -[HMDMediaGroupsAggregator setState:previousState:](self, "setState:previousState:", a3, 0);
}

- (BOOL)setState:(unint64_t)a3 previousState:(unint64_t *)a4
{
  os_unfair_lock_s *p_lock;
  unint64_t state;
  void *v9;
  HMDMediaGroupsAggregator *v10;
  NSObject *v11;
  id v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  if (state == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    if (a4)
      *a4 = state;
    self->_state = a3;
    os_unfair_lock_unlock(p_lock);
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (a3)
      {
        if (a3 == 1)
        {
          v13 = CFSTR("HMDMediaGroupsAggregatorRunningAsPrimaryState");
        }
        else
        {
          v14 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("Unknown State (%@)"), v15);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v13 = CFSTR("HMDMediaGroupsAggregatorStoppedState");
      }
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updated state: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  return state != a3;
}

- (void)runAsPrimary
{
  uint64_t v3;

  v3 = 0;
  if (-[HMDMediaGroupsAggregator setState:previousState:](self, "setState:previousState:", 1, &v3))
  {
    -[HMDMediaGroupsAggregator startWarmUpTimer](self, "startWarmUpTimer");
    -[HMDMediaGroupsAggregator registerForEvents](self, "registerForEvents");
  }
}

- (void)startWarmUpTimer
{
  void *v3;
  HMDMediaGroupsAggregator *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[HMDMediaGroupsAggregator shouldWarmUp](self, "shouldWarmUp"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting warmup timer", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDMediaGroupsAggregator timerProvider](v4, "timerProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timerWithTimeInterval:options:", 2, 60.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsAggregator setWarmUpTimer:](v4, "setWarmUpTimer:", v8);

    -[HMDMediaGroupsAggregator warmUpTimer](v4, "warmUpTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v4);

    -[HMDMediaGroupsAggregator warmUpTimer](v4, "warmUpTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume");

  }
}

- (void)stopWarmUpTimer
{
  void *v3;

  -[HMDMediaGroupsAggregator warmUpTimer](self, "warmUpTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[HMDMediaGroupsAggregator setWarmUpTimer:](self, "setWarmUpTimer:", 0);
}

- (void)stop
{
  void *v3;
  HMDMediaGroupsAggregator *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[HMDMediaGroupsAggregator setState:](self, "setState:", 0))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping destination controller aggregator", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDMediaGroupsAggregator notifyOfStoppedState](v4, "notifyOfStoppedState");
    -[HMDMediaGroupsAggregator stopWarmUpTimer](v4, "stopWarmUpTimer");
    -[HMDMediaGroupsAggregator unregisterForAllEvents](v4, "unregisterForAllEvents");
    -[HMDMediaGroupsAggregator clearCachedData](v4, "clearCachedData");
    -[HMDMediaGroupsAggregator groupLocalDataStorage](v4, "groupLocalDataStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearCachedData");

  }
}

- (void)setDestination:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsAggregator *v6;
  NSObject *v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *destinations;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting destination: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  destinations = v6->_destinations;
  objc_msgSend(v4, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](destinations, "setObject:forKey:", v4, v11);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)removeDestinationWithParentIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSMutableDictionary *destinations;
  void *v9;
  void *v10;
  HMDMediaGroupsAggregator *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_destinations, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__HMDMediaGroupsAggregator_removeDestinationWithParentIdentifier___block_invoke;
  v15[3] = &unk_24E79A660;
  v6 = v4;
  v16 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    destinations = self->_destinations;
    objc_msgSend(v7, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](destinations, "removeObjectForKey:", v9);

    os_unfair_lock_unlock(&self->_lock);
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Removed destination: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {

    os_unfair_lock_unlock(&self->_lock);
  }

  return v7 != 0;
}

- (id)destinations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_destinations, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDestinationControllerData:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsAggregator *v6;
  NSObject *v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *destinationControllersData;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting destination controller data: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  destinationControllersData = v6->_destinationControllersData;
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](destinationControllersData, "setObject:forKey:", v4, v11);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)removeDestinationControllerDataWithParentIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSMutableDictionary *destinationControllersData;
  void *v9;
  void *v10;
  HMDMediaGroupsAggregator *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_destinationControllersData, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__HMDMediaGroupsAggregator_removeDestinationControllerDataWithParentIdentifier___block_invoke;
  v15[3] = &unk_24E788588;
  v6 = v4;
  v16 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    destinationControllersData = self->_destinationControllersData;
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](destinationControllersData, "removeObjectForKey:", v9);

    os_unfair_lock_unlock(&self->_lock);
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Removed destination controller data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {

    os_unfair_lock_unlock(&self->_lock);
  }

  return v7 != 0;
}

- (id)localGroupWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMDMediaGroupsAggregator groups](self, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__HMDMediaGroupsAggregator_localGroupWithIdentifier___block_invoke;
  v9[3] = &unk_24E7885B0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)groups
{
  void *v2;
  void *v3;

  -[HMDMediaGroupsAggregator groupLocalDataStorage](self, "groupLocalDataStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)destinationControllersData
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_destinationControllersData, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)fixupGroupsForRemovedParticipantAccessoryUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDMediaGroupsAggregator *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDMediaGroupsAggregator isRunningAsPrimary](self, "isRunningAsPrimary"))
  {
    -[HMDMediaGroupsAggregator aggregateData](self, "aggregateData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "destinations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __74__HMDMediaGroupsAggregator_fixupGroupsForRemovedParticipantAccessoryUUID___block_invoke;
    v29[3] = &unk_24E79A660;
    v30 = v4;
    objc_msgSend(v6, "na_firstObjectPassingTest:", v29);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HMDMediaGroupsAggregator aggregateData](self, "aggregateData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "groups");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v7;
      v25 = 3221225472;
      v26 = __74__HMDMediaGroupsAggregator_fixupGroupsForRemovedParticipantAccessoryUUID___block_invoke_2;
      v27 = &unk_24E7885B0;
      v11 = v8;
      v28 = v11;
      objc_msgSend(v10, "na_firstObjectPassingTest:", &v24);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "mediaSystemData", v24, v25, v26, v27);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "associatedGroupIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v14, "rightDestinationIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "uniqueIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v16, "hmf_isEqualToUUID:", v17) & 1) != 0)
              objc_msgSend(v14, "leftDestinationIdentifier");
            else
              objc_msgSend(v14, "rightDestinationIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = (void *)MEMORY[0x227676638]();
            v20 = self;
            HMFGetOSLogHandle();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v32 = v22;
              v33 = 2112;
              v34 = v18;
              v35 = 2112;
              v36 = v14;
              v37 = 2112;
              v38 = v11;
              _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Fixing up destination: %@ on removed media system: %@ due to removed destination: %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v19);
            objc_msgSend(v14, "associatedGroupIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDMediaGroupsAggregator updateDestinationWithIdentifier:audioGroupIdentifier:](v20, "updateDestinationWithIdentifier:audioGroupIdentifier:", v18, v23);

          }
        }

      }
    }

  }
}

- (void)updateDestinationWithIdentifier:(id)a3 audioGroupIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDMediaGroupsAggregator *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaGroupsAggregator destinationManagerWithIdentifier:](self, "destinationManagerWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __81__HMDMediaGroupsAggregator_updateDestinationWithIdentifier_audioGroupIdentifier___block_invoke;
    v13[3] = &unk_24E79BCC8;
    v13[4] = self;
    v14 = v6;
    objc_msgSend(v8, "requestToUpdateAudioGroupIdentifier:completion:", v7, v13);

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
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination with identifier: %@ due to no destination manager", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)clearCachedDataForParticipantAccessoryUUID:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  HMDMediaGroupsAggregator *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsAggregator groupLocalDataStorage](self, "groupLocalDataStorage");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "clearCachedDataForParticipantAccessoryUUID:", v4);

  LOBYTE(v5) = -[HMDMediaGroupsAggregator removeDestinationWithParentIdentifier:](self, "removeDestinationWithParentIdentifier:", v4);
  v6 = -[HMDMediaGroupsAggregator removeDestinationControllerDataWithParentIdentifier:](self, "removeDestinationControllerDataWithParentIdentifier:", v4);
  if ((v5 & 1) != 0 || v6)
  {
    v7 = (void *)MEMORY[0x227676638](v6);
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
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Refreshing aggregate data due to cleared cached data for participant uuid: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDMediaGroupsAggregator refreshAggregateData](v8, "refreshAggregateData");
  }

}

- (void)clearCachedData
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v4;
  NSMutableDictionary *destinations;
  NSMutableDictionary *v6;
  NSMutableDictionary *destinationControllersData;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  destinations = self->_destinations;
  self->_destinations = v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  destinationControllersData = self->_destinationControllersData;
  self->_destinationControllersData = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaGroupsAggregator *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDMediaGroupsAggregator *v14;
  NSObject *v15;
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
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v11;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received topic: %@ event: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMediaGroupsAggregator participantAccessoryUUIDFromTopic:](v9, "participantAccessoryUUIDFromTopic:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HMDMediaGroupsAggregator handleParticipantDataEvent:accessoryUUID:](v9, "handleParticipantDataEvent:accessoryUUID:", v6, v12);
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v9;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v16;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get participant accessory uuid from topic: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (id)participantAccessoryUUIDFromTopic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMDMediaGroupsAggregator *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDMediaGroupsAggregator *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD7640], "decodeTopic:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "asAccessoryTopic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "accessoryEventTopicSuffixID");
      if (v9 == *MEMORY[0x24BDD4BA8])
      {
        objc_msgSend(v8, "accessoryUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v8, "accessoryEventTopicSuffixID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v18;
        v23 = 2112;
        v24 = v19;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected topic id: %@ topic: %@", (uint8_t *)&v21, 0x20u);

        goto LABEL_12;
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
        v21 = 138543618;
        v22 = v18;
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert to parsed accessory topic using topic: %@", (uint8_t *)&v21, 0x16u);
LABEL_12:

      }
    }

    objc_autoreleasePoolPop(v15);
    v10 = 0;
    goto LABEL_14;
  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v14;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse topic: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v10 = 0;
LABEL_15:

  return v10;
}

- (void)handleParticipantDataEvent:(id)a3 accessoryUUID:(id)a4
{
  id v6;
  id v7;
  HMDMediaGroupsParticipantData *v8;
  void *v9;
  HMDMediaGroupsParticipantData *v10;
  void *v11;
  HMDMediaGroupsAggregator *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = [HMDMediaGroupsParticipantData alloc];
  objc_msgSend(v6, "encodedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDMediaGroupsParticipantData initWithProtoBufferData:](v8, "initWithProtoBufferData:", v9);

  if (v10)
  {
    -[HMDMediaGroupsAggregator handleIncomingParticipantData:forAccessoryUUID:](self, "handleIncomingParticipantData:forAccessoryUUID:", v10, v7);
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
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize participant event data from event: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)handleIncomingParticipantData:(id)a3 forAccessoryUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "destinationControllerData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v12, "destinationControllerData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsAggregator setDestinationControllerData:](self, "setDestinationControllerData:", v8);

  }
  objc_msgSend(v12, "destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v12, "destination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backedUpGroups");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsAggregator handleParticipantDestination:backedUpGroups:forParticipantAccessoryUUID:](self, "handleParticipantDestination:backedUpGroups:forParticipantAccessoryUUID:", v10, v11, v6);

  }
  -[HMDMediaGroupsAggregator refreshAggregateData](self, "refreshAggregateData");

}

- (BOOL)updateAssociatedGroupIdentifier:(id)a3 forGroupIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  HMDMediaGroupsAggregator *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDMediaGroupsAggregator *v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
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
    v24 = 138543874;
    v25 = v13;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating associated group identifier: %@ for group identifier: %@", (uint8_t *)&v24, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDMediaGroupsAggregator localGroupWithIdentifier:](v11, "localGroupWithIdentifier:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v16, "setAssociatedGroupIdentifier:", v8);
    -[HMDMediaGroupsAggregator groupLocalDataStorage](v11, "groupLocalDataStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateGroup:", v16);

    -[HMDMediaGroupsAggregator refreshAggregateData](v11, "refreshAggregateData");
    -[HMDMediaGroupsAggregator groupLocalDataStorage](v11, "groupLocalDataStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "backupData");

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v11;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v22;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to find an local group with identifier: %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v15 != 0;
}

- (void)updateGroup:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsAggregator *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
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
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating group: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupsAggregator groupLocalDataStorage](v6, "groupLocalDataStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateGroup:", v4);

  -[HMDMediaGroupsAggregator refreshAggregateData](v6, "refreshAggregateData");
  -[HMDMediaGroupsAggregator groupLocalDataStorage](v6, "groupLocalDataStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backupData");

}

- (void)updateGroup:(id)a3 participantAccessoryUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaGroupsAggregator *v9;
  NSObject *v10;
  void *v11;
  void *v12;
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
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating group: %@ for participant accessory uuids: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMediaGroupsAggregator groupLocalDataStorage](v9, "groupLocalDataStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateGroup:participantAccessoryUUIDs:", v6, v7);

  -[HMDMediaGroupsAggregator refreshAggregateData](v9, "refreshAggregateData");
  -[HMDMediaGroupsAggregator groupLocalDataStorage](v9, "groupLocalDataStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backupData");

}

- (void)removeGroupWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsAggregator *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
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
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing group with identifier: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupsAggregator groupLocalDataStorage](v6, "groupLocalDataStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeGroupWithIdentifier:", v4);

  -[HMDMediaGroupsAggregator refreshAggregateData](v6, "refreshAggregateData");
  -[HMDMediaGroupsAggregator groupLocalDataStorage](v6, "groupLocalDataStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backupData");

}

- (void)handleParticipantDestination:(id)a3 backedUpGroups:(id)a4 forParticipantAccessoryUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDMediaGroupsAggregator setDestination:](self, "setDestination:", v10);
  -[HMDMediaGroupsAggregator groupLocalDataStorage](self, "groupLocalDataStorage");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "audioGroupIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "updateUsingParticipantAccessoryUUID:associatedGroupIdentifier:backedUpGroupData:", v8, v11, v9);
}

- (void)didReceiveUpdateAssociatedGroupRequestMessage:(id)a3 withGroupIdentifier:(id)a4 associatedGroupIdentifier:(id)a5 messenger:(id)a6
{
  id v9;
  id v10;
  id v11;

  v11 = 0;
  v9 = a3;
  -[HMDMediaGroupsAggregator updateAssociatedGroupIdentifier:forGroupIdentifier:error:](self, "updateAssociatedGroupIdentifier:forGroupIdentifier:error:", a5, a4, &v11);
  v10 = v11;
  objc_msgSend(v9, "respondWithPayload:error:", 0, v10);

}

- (id)roomForAllDestinationParentIdentifiers:(id)a3 mediaSystemsAggregateDataGenerator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaGroupsAggregator *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaGroupsAggregator dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "roomForAllDestinationParentIdentifiers:mediaGroupsAggregator:", v6, self);
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
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get room name for destination parent identifiers: %@ due to no data source", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a4, a3);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HMDMediaGroupsAggregator *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsAggregator warmUpTimer](self, "warmUpTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 == v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Warm up timer fired", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDMediaGroupsAggregator setWarmUpTimer:](v7, "setWarmUpTimer:", 0);
    -[HMDMediaGroupsAggregator forwardAggregateData](v7, "forwardAggregateData");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Skipping warmUp debounce refresh due to miss matched timer when fired", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaGroupsAggregator identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMediaGroupsAggregatorDataSource)dataSource
{
  return (HMDMediaGroupsAggregatorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDMediaGroupsAggregatorDelegate)delegate
{
  return (HMDMediaGroupsAggregatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDMediaGroupsAggregatorMessenger)messenger
{
  return (HMDMediaGroupsAggregatorMessenger *)objc_getProperty(self, a2, 56, 1);
}

- (HMDTimerProvider)timerProvider
{
  return (HMDTimerProvider *)objc_loadWeakRetained((id *)&self->_timerProvider);
}

- (void)setTimerProvider:(id)a3
{
  objc_storeWeak((id *)&self->_timerProvider, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (HMEEventForwarder)eventForwarder
{
  return (HMEEventForwarder *)objc_getProperty(self, a2, 80, 1);
}

- (HMESubscriptionProviding)subscriptionProvider
{
  return (HMESubscriptionProviding *)objc_getProperty(self, a2, 88, 1);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 96, 1);
}

- (HMDMediaGroupsLocalDataStorage)groupLocalDataStorage
{
  return (HMDMediaGroupsLocalDataStorage *)objc_getProperty(self, a2, 104, 1);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 112, 1);
}

- (HMFTimer)warmUpTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setWarmUpTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (HMDMediaGroupsAggregateData)aggregateData
{
  return (HMDMediaGroupsAggregateData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAggregateData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSArray)generators
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generators, 0);
  objc_storeStrong((id *)&self->_aggregateData, 0);
  objc_storeStrong((id *)&self->_warmUpTimer, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_groupLocalDataStorage, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_storeStrong((id *)&self->_eventForwarder, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_timerProvider);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_destinationControllersData, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
}

void __81__HMDMediaGroupsAggregator_updateDestinationWithIdentifier_audioGroupIdentifier___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination with identifier: %@ due to request error: %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

uint64_t __74__HMDMediaGroupsAggregator_fixupGroupsForRemovedParticipantAccessoryUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "parentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __74__HMDMediaGroupsAggregator_fixupGroupsForRemovedParticipantAccessoryUUID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "destinationUniqueIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

uint64_t __53__HMDMediaGroupsAggregator_localGroupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __80__HMDMediaGroupsAggregator_removeDestinationControllerDataWithParentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "parentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __66__HMDMediaGroupsAggregator_removeDestinationWithParentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "parentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __48__HMDMediaGroupsAggregator_forwardAggregateData__block_invoke(uint64_t a1, void *a2)
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
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Forwarding event resulted in error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __60__HMDMediaGroupsAggregator_unregisterForEventsForAccessory___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unregister for destination topic: %@ resulted in error: %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __50__HMDMediaGroupsAggregator_unregisterForAllEvents__block_invoke(uint64_t a1, void *a2)
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
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unregistering for all events returned with error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __58__HMDMediaGroupsAggregator_registerForEventsForAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Register for destination topic: %@ resulted in error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  objc_msgSend(v5, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__HMDMediaGroupsAggregator_registerForEventsForAccessory___block_invoke_33;
  v14[3] = &unk_24E796918;
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v5;
  v13 = v5;
  objc_msgSend(v12, "na_each:", v14);

}

void __58__HMDMediaGroupsAggregator_registerForEventsForAccessory___block_invoke_33(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveEvent:topic:", v5, v4);

}

uint64_t __45__HMDMediaGroupsAggregator_registerForEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerForEventsForAccessory:", a2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t67 != -1)
    dispatch_once(&logCategory__hmf_once_t67, &__block_literal_global_141128);
  return (id)logCategory__hmf_once_v68;
}

void __39__HMDMediaGroupsAggregator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v68;
  logCategory__hmf_once_v68 = v0;

}

@end
