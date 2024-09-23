@implementation HMDMediaGroupParticipantLocalDataStorage

- (HMDMediaGroupParticipantLocalDataStorage)initWithIdentifier:(id)a3 backUpReciever:(id)a4 userDefaults:(id)a5 eventForwarder:(id)a6 eventStoreReadHandle:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDFeaturesDataSource *v17;
  HMDMediaGroupParticipantLocalDataStorage *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(HMDFeaturesDataSource);
  v18 = -[HMDMediaGroupParticipantLocalDataStorage initWithIdentifier:backUpReciever:userDefaults:eventForwarder:eventStoreReadHandle:featuresDataSource:](self, "initWithIdentifier:backUpReciever:userDefaults:eventForwarder:eventStoreReadHandle:featuresDataSource:", v16, v15, v14, v13, v12, v17);

  return v18;
}

- (HMDMediaGroupParticipantLocalDataStorage)initWithIdentifier:(id)a3 backUpReciever:(id)a4 userDefaults:(id)a5 eventForwarder:(id)a6 eventStoreReadHandle:(id)a7 featuresDataSource:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  HMDMediaGroupParticipantLocalDataStorage *v22;
  uint64_t v23;
  OS_os_log *logger;
  HMDMediaGroupParticipantLocalDataStorage *result;
  HMDMediaGroupParticipantLocalDataStorage *v26;
  SEL v27;
  id v28;
  id v29;
  id obj;
  id v31;
  id v32;
  objc_super v33;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  obj = a6;
  v18 = a6;
  v31 = a7;
  v19 = a7;
  v32 = a8;
  v20 = a8;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
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
  v21 = v20;
  if (!v20)
  {
LABEL_15:
    v26 = (HMDMediaGroupParticipantLocalDataStorage *)_HMFPreconditionFailure();
    -[HMDMediaGroupParticipantLocalDataStorage configureWithHome:messageDispatcher:](v26, v27, v28, v29);
    return result;
  }
  v33.receiver = self;
  v33.super_class = (Class)HMDMediaGroupParticipantLocalDataStorage;
  v22 = -[HMDMediaGroupParticipantLocalDataStorage init](&v33, sel_init);
  if (v22)
  {
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    logger = v22->_logger;
    v22->_logger = (OS_os_log *)v23;

    objc_storeStrong((id *)&v22->_identifier, a3);
    objc_storeStrong((id *)&v22->_groupsBackupReceiver, a4);
    objc_storeStrong((id *)&v22->_userDefaults, a5);
    objc_storeStrong((id *)&v22->_eventForwarder, obj);
    objc_storeStrong((id *)&v22->_eventStoreReadHandle, v31);
    objc_storeStrong((id *)&v22->_featuresDataSource, v32);
  }

  return v22;
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaGroupParticipantLocalDataStorage *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring media groups participant local storage", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMediaGroupParticipantLocalDataStorage groupsBackupReceiver](v9, "groupsBackupReceiver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configureWithHome:messageDispatcher:", v6, v7);

  -[HMDMediaGroupParticipantLocalDataStorage publishCachedObjectIfNeeded](v9, "publishCachedObjectIfNeeded");
}

- (id)protoParticipantData
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDMediaGroupParticipantLocalDataStorage userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataForKey:", CFSTR("HMDMediaDestinationControllerLocalDataStorageHandlerObjectDataKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_4;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA640]), "initWithData:", v3);
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_4:
    v4 = 0;
  }

  return v4;
}

- (id)lastCachedEventParticipantData
{
  void *v3;
  void *v4;
  void *v5;
  HMDMediaGroupsParticipantData *v6;
  void *v7;
  HMDMediaGroupsParticipantData *v8;
  HMDMediaGroupsParticipantData *v9;
  void *v10;
  HMDMediaGroupParticipantLocalDataStorage *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDMediaGroupParticipantLocalDataStorage *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMDMediaGroupParticipantLocalDataStorage topicName](self, "topicName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDMediaGroupParticipantLocalDataStorage eventStoreReadHandle](self, "eventStoreReadHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastEventForTopic:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = [HMDMediaGroupsParticipantData alloc];
      objc_msgSend(v5, "encodedData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[HMDMediaGroupsParticipantData initWithProtoBufferData:](v6, "initWithProtoBufferData:", v7);

      if (v8)
      {
        v9 = v8;
      }
      else
      {
        v14 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "encodedData");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543874;
          v21 = v17;
          v22 = 2112;
          v23 = v18;
          v24 = 2112;
          v25 = v5;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode last cached event participant data: %@ from event: %@", (uint8_t *)&v20, 0x20u);

        }
        objc_autoreleasePoolPop(v14);
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get last cached event participant data due to missing topic name", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v8 = 0;
  }

  return v8;
}

- (id)participantData
{
  HMDMediaGroupsParticipantData *v2;
  void *v3;
  HMDMediaGroupsParticipantData *v4;
  void *v5;

  v2 = (HMDMediaGroupsParticipantData *)self;
  -[HMDMediaGroupParticipantLocalDataStorage protoParticipantData](self, "protoParticipantData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = [HMDMediaGroupsParticipantData alloc];
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[HMDMediaGroupsParticipantData initWithProtoBufferData:](v4, "initWithProtoBufferData:", v5);

  if (!v2)
  {
    _HMFPreconditionFailure();
LABEL_4:
    -[HMDMediaGroupsParticipantData createDefaultParticipantData](v2, "createDefaultParticipantData");
    v2 = (HMDMediaGroupsParticipantData *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

- (id)createDefaultParticipantData
{
  HMDMediaGroupsParticipantData *v2;

  v2 = [HMDMediaGroupsParticipantData alloc];
  return -[HMDMediaGroupsParticipantData initWithDestination:destinationControllerData:backedUpGroups:](v2, "initWithDestination:destinationControllerData:backedUpGroups:", 0, 0, MEMORY[0x1E0C9AA60]);
}

- (void)migrateWithExpectedDestinationSupportOptions:(unint64_t)a3
{
  void *v5;
  id v6;

  -[HMDMediaGroupParticipantLocalDataStorage participantData](self, "participantData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupParticipantLocalDataStorage migratedParticipantData:withDestinationSupportOptions:](self, "migratedParticipantData:withDestinationSupportOptions:", v6, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
    -[HMDMediaGroupParticipantLocalDataStorage updateParticipantData:](self, "updateParticipantData:", v5);

}

- (id)migratedParticipantData:(id)a3 withDestinationSupportOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDMediaGroupParticipantLocalDataStorage *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  HMDMediaGroupParticipantLocalDataStorage *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HMMediaDestinationSupportOptionsAsString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v19;
      v24 = 2112;
      v25 = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Attempted to migrate expected destination support options: %@ without a destination", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "supportedOptions") == a4)
  {
LABEL_9:
    v15 = v6;
    goto LABEL_10;
  }
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMMediaDestinationSupportOptionsAsString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Migrating supported options to: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v14 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v14, "setSupportedOptions:", a4);
  v15 = (id)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v15, "setDestination:", v14);

LABEL_10:
  return v15;
}

- (void)migrateWithExpectedDestinationControllerSupportOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  HMDMediaGroupParticipantLocalDataStorage *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDMediaGroupParticipantLocalDataStorage *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMDMediaGroupParticipantLocalDataStorage destinationControllerData](self, "destinationControllerData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "supportedOptions") != a3)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        HMMediaDestinationControllerSupportOptionsAsString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v10;
        v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Migrating expected destination controller support options: %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDMediaGroupParticipantLocalDataStorage updateDestinationControllerSupportedOptions:](v8, "updateDestinationControllerSupportedOptions:", a3);
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HMMediaDestinationControllerSupportOptionsAsString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Attempted to migrate with expected support options: %@ without a destination controller", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (HMMediaDestinationControllerData)destinationControllerData
{
  void *v2;
  void *v3;

  -[HMDMediaGroupParticipantLocalDataStorage participantData](self, "participantData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destinationControllerData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMMediaDestinationControllerData *)v3;
}

- (HMMediaDestination)destination
{
  void *v2;
  void *v3;

  -[HMDMediaGroupParticipantLocalDataStorage participantData](self, "participantData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMMediaDestination *)v3;
}

- (BOOL)hasDataToPublishInParticipantData:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "destinationControllerData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "backedUpGroups");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "count") != 0;

    }
  }

  return v5;
}

- (void)publishCachedObjectIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  HMDMediaGroupParticipantLocalDataStorage *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDMediaGroupParticipantLocalDataStorage participantData](self, "participantData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDMediaGroupParticipantLocalDataStorage hasDataToPublishInParticipantData:](self, "hasDataToPublishInParticipantData:", v3))
  {
    -[HMDMediaGroupParticipantLocalDataStorage lastCachedEventParticipantData](self, "lastCachedEventParticipantData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = HMFEqualObjects();
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v9)
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v10;
        v14 = 2112;
        v15 = v4;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Skipping publish due to last cached event participant data: %@", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
    }
    else
    {
      if (v9)
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Publishing cached object due to mismatching last cached event data", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      -[HMDMediaGroupParticipantLocalDataStorage publishCachedObject](v7, "publishCachedObject");
    }

  }
}

- (void)publishCachedObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaGroupParticipantLocalDataStorage *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDMediaGroupParticipantLocalDataStorage *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HMDMediaGroupParticipantLocalDataStorage participantData](self, "participantData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDMediaGroupParticipantLocalDataStorage hasDataToPublishInParticipantData:](self, "hasDataToPublishInParticipantData:", v3))
  {
    -[HMDMediaGroupParticipantLocalDataStorage topicName](self, "topicName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupParticipantLocalDataStorage eventSource](self, "eventSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4 && v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v24 = v10;
        v25 = 2112;
        v26 = v4;
        v27 = 2112;
        v28 = v3;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Publishing topic: %@ data: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v6);
      v11 = objc_alloc(MEMORY[0x1E0D32D38]);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v12 = (void *)objc_msgSend(v11, "initWithSource:cachePolicy:combineType:timestamp:", v5, 2, 2);
      v13 = objc_alloc(MEMORY[0x1E0D32D28]);
      objc_msgSend(v3, "encodeToProtoBufferData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithEventData:metadata:", v14, v12);

      -[HMDMediaGroupParticipantLocalDataStorage eventForwarder](v7, "eventForwarder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __63__HMDMediaGroupParticipantLocalDataStorage_publishCachedObject__block_invoke;
      v22[3] = &unk_1E89C2350;
      v22[4] = v7;
      objc_msgSend(v16, "forwardEvent:topic:completion:", v15, v4, v22);

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v21;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to publish data due to no topic name or event source", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Skipping publish due to no data", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (id)topicName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaGroupParticipantLocalDataStorage *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDMediaGroupParticipantLocalDataStorage dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "topicNameForMediaGroupParticipantDataLocalStorage:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get topic name due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)eventSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaGroupParticipantLocalDataStorage *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDMediaGroupParticipantLocalDataStorage dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "eventSourceForMediaGroupParticipantDataLocalStorage:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get event source due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (void)updateParticipantData:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupParticipantLocalDataStorage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating participant data: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupParticipantLocalDataStorage userDefaults](v6, "userDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeToProtoBufferData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("HMDMediaDestinationControllerLocalDataStorageHandlerObjectDataKey"));

  -[HMDMediaGroupParticipantLocalDataStorage publishCachedObject](v6, "publishCachedObject");
}

- (void)updateDestinationControllerData:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupParticipantLocalDataStorage *v6;
  NSObject *v7;
  void *v8;
  NSObject *logger;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDMediaGroupParticipantLocalDataStorage *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v8;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating DestinationControllerData: %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  logger = v6->_logger;
  if (os_signpost_enabled(logger))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MediaGroupsParticipantUpdateDestinationController", ", (uint8_t *)&v18, 2u);
  }
  -[HMDMediaGroupParticipantLocalDataStorage participantData](v6, "participantData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destinationControllerData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping update destination controller due to no change to value: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    v17 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v17, "setDestinationControllerData:", v4);
    -[HMDMediaGroupParticipantLocalDataStorage updateParticipantData:](v6, "updateParticipantData:", v17);

  }
}

- (void)updateDestinationControllerDestinationIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupParticipantLocalDataStorage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDMediaGroupParticipantLocalDataStorage *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v8;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating destinaiton controller destination identifier: %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupParticipantLocalDataStorage participantData](v6, "participantData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destinationControllerData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "destinationControllerData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setDestinationIdentifier:", v4);
    -[HMDMediaGroupParticipantLocalDataStorage updateDestinationControllerData:](v6, "updateDestinationControllerData:", v12);
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupParticipantLocalDataStorage notifyDidChangeDestinationIdentifier:forDestinationControllerIdentifier:](v6, "notifyDidChangeDestinationIdentifier:forDestinationControllerIdentifier:", v4, v13);

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v17;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination controller destination identifier: %@ due to no controller data", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)notifyDidChangeDestinationIdentifier:(id)a3 forDestinationControllerIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaGroupParticipantLocalDataStorage *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDMediaGroupParticipantLocalDataStorage delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "mediaGroupParticipantLocalDataStorage:didChangeDestinationIdentifier:forDestinationControllerIdentifier:", self, v6, v7);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of updated destination identifier due to missing delegate", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)updateDestinationControllerSupportedOptions:(unint64_t)a3
{
  void *v5;
  HMDMediaGroupParticipantLocalDataStorage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDMediaGroupParticipantLocalDataStorage *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMMediaDestinationControllerSupportOptionsAsString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating destination controller supported options: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupParticipantLocalDataStorage participantData](v6, "participantData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destinationControllerData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "destinationControllerData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setSupportedOptions:", a3);
    -[HMDMediaGroupParticipantLocalDataStorage updateDestinationControllerData:](v6, "updateDestinationControllerData:", v13);

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HMMediaDestinationControllerSupportOptionsAsString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination controller supported options: %@ due to no controller data", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)updateDestinationControllerAvailableDestinationIdentifiers:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupParticipantLocalDataStorage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDMediaGroupParticipantLocalDataStorage *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating destination controller available destination identifiers: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupParticipantLocalDataStorage participantData](v6, "participantData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destinationControllerData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "destinationControllerData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setAvailableDestinationIdentifiers:", v4);
    -[HMDMediaGroupParticipantLocalDataStorage updateDestinationControllerData:](v6, "updateDestinationControllerData:", v12);

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v6;
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
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination controller available destination identifiers: %@ due to no controller data", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)updateMediaDestination:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupParticipantLocalDataStorage *v6;
  NSObject *v7;
  void *v8;
  NSObject *logger;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDMediaGroupParticipantLocalDataStorage *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v8;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating media destination: %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  logger = v6->_logger;
  if (os_signpost_enabled(logger))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MediaGroupsParticipantUpdateDestination", ", (uint8_t *)&v18, 2u);
  }
  -[HMDMediaGroupParticipantLocalDataStorage participantData](v6, "participantData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping destination update due to no changed in value: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    v17 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v17, "setDestination:", v4);
    -[HMDMediaGroupParticipantLocalDataStorage updateParticipantData:](v6, "updateParticipantData:", v17);

  }
}

- (void)updateAudioGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupParticipantLocalDataStorage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDMediaGroupParticipantLocalDataStorage *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating audio group identifier: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupParticipantLocalDataStorage participantData](v6, "participantData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setAudioGroupIdentifier:", v4);
    -[HMDMediaGroupParticipantLocalDataStorage updateMediaDestination:](v6, "updateMediaDestination:", v12);

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v6;
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
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio group identifier: %@ due to no destination data", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)updateDestinationSupportOptions:(unint64_t)a3
{
  void *v5;
  HMDMediaGroupParticipantLocalDataStorage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDMediaGroupParticipantLocalDataStorage *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMMediaDestinationSupportOptionsAsString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating destination support options: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupParticipantLocalDataStorage participantData](v6, "participantData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "destination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setSupportedOptions:", a3);
    -[HMDMediaGroupParticipantLocalDataStorage updateMediaDestination:](v6, "updateMediaDestination:", v13);

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HMMediaDestinationSupportOptionsAsString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination support options: %@ due to no destination data", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)updateBackupGroupData:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupParticipantLocalDataStorage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *logger;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  HMDMediaGroupParticipantLocalDataStorage *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Update backup groups: count(%@)", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  logger = v6->_logger;
  if (os_signpost_enabled(logger))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MediaGroupsParticipantUpdateBackupGroup", ", (uint8_t *)&v26, 2u);
  }
  -[HMDMediaGroupParticipantLocalDataStorage participantData](v6, "participantData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backedUpGroups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13 != objc_msgSend(v4, "count"))
  {

    goto LABEL_11;
  }
  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v11, "backedUpGroups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  if (!v18)
  {
LABEL_11:
    v24 = (void *)objc_msgSend(v11, "mutableCopy");
    v25 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v24, "setBackedUpGroups:", v25);

    -[HMDMediaGroupParticipantLocalDataStorage updateParticipantData:](v6, "updateParticipantData:", v24);
    goto LABEL_12;
  }
  v19 = (void *)MEMORY[0x1D17BA0A0]();
  v20 = v6;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v22;
    v28 = 2112;
    v29 = v23;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Skipping backup groups update due to no change to values: count(%@)", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
LABEL_12:

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaGroupParticipantLocalDataStorage identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMediaGroupParticipantLocalDataStorageDataSource)dataSource
{
  return (HMDMediaGroupParticipantLocalDataStorageDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDMediaGroupParticipantLocalDataStorageDelegate)delegate
{
  return (HMDMediaGroupParticipantLocalDataStorageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDMediaGroupsAggregatorBackupReceiver)groupsBackupReceiver
{
  return (HMDMediaGroupsAggregatorBackupReceiver *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 48, 1);
}

- (HMEEventForwarder)eventForwarder
{
  return (HMEEventForwarder *)objc_getProperty(self, a2, 56, 1);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 64, 1);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_eventForwarder, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groupsBackupReceiver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __63__HMDMediaGroupParticipantLocalDataStorage_publishCachedObject__block_invoke(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Forwarding event completed with error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t39_168502 != -1)
    dispatch_once(&logCategory__hmf_once_t39_168502, &__block_literal_global_168503);
  return (id)logCategory__hmf_once_v40_168504;
}

void __55__HMDMediaGroupParticipantLocalDataStorage_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v40_168504;
  logCategory__hmf_once_v40_168504 = v0;

}

@end
