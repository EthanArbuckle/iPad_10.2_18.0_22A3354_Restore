@implementation HMDMediaSystem

- (HMDMediaSystem)initWithMediaSystemData:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDMediaSystem *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDMediaSystem initWithUUID:configuredName:home:data:components:](self, "initWithUUID:configuredName:home:data:components:", v8, v9, v6, v7, MEMORY[0x24BDBD1A8]);

  return v10;
}

- (HMDMediaSystem)initWithUUID:(id)a3 configuredName:(id)a4 home:(id)a5 data:(id)a6 components:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HMDMediaSystem *v20;
  NSObject *v21;
  void *v22;
  id v23;
  HMDMediaSystem *v24;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v15)
  {
    objc_msgSend(v14, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[HMDMediaSystem initalizeDataWithIdentifier:parentIdentifier:name:defaultName:components:](HMDMediaSystem, "initalizeDataWithIdentifier:parentIdentifier:name:defaultName:components:", v12, v17, v13, 0, v16);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD77E8], "roomNameSentinel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDMediaSystem initalizeDataWithIdentifier:parentIdentifier:name:defaultName:components:](HMDMediaSystem, "initalizeDataWithIdentifier:parentIdentifier:name:defaultName:components:", v12, v17, v18, 1, v16);
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v22;
      v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Initializing with derived data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __67__HMDMediaSystem_initWithUUID_configuredName_home_data_components___block_invoke;
  v26[3] = &unk_24E7876B8;
  v27 = v14;
  v23 = v14;
  v24 = -[HMDMediaSystem initWithUUID:configuredName:home:data:components:settingsControllerCreator:](self, "initWithUUID:configuredName:home:data:components:settingsControllerCreator:", v12, v13, v23, v15, v16, v26);

  return v24;
}

- (HMDMediaSystem)initWithUUID:(id)a3 configuredName:(id)a4 home:(id)a5 data:(id)a6 components:(id)a7 settingsControllerCreator:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  HMDMediaSystem *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  dispatch_queue_t v31;
  OS_dispatch_queue *workQueue;
  uint64_t v33;
  NSString *configuredName;
  uint64_t v35;
  NSNotificationCenter *notificationCenter;
  void *v37;
  void *v38;
  uint64_t v39;
  HMDAccessorySettingsController *settingsController;
  id audioDestinationsManagerFactory;
  uint64_t v42;
  HMDMediaGroupsAggregateConsumerDataProvider *aggregateDataProvider;
  HMDMediaSystem *v45;
  SEL v46;
  id v47;
  id v48;
  id obj;
  id v50;
  id v51;
  objc_super v52;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v18)
  {
    v21 = v20;
    v52.receiver = self;
    v52.super_class = (Class)HMDMediaSystem;
    v22 = -[HMDMediaSystem init](&v52, sel_init);
    if (v22)
    {
      HMDispatchQueueNameString();
      v51 = v15;
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      obj = a7;
      v24 = v21;
      v25 = v17;
      v26 = v19;
      v27 = v16;
      v28 = objc_msgSend(v23, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v50 = v18;
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (const char *)v28;
      v16 = v27;
      v19 = v26;
      v17 = v25;
      v21 = v24;
      v31 = dispatch_queue_create(v30, v29);
      workQueue = v22->_workQueue;
      v22->_workQueue = (OS_dispatch_queue *)v31;

      objc_storeStrong((id *)&v22->_uuid, a3);
      objc_msgSend(v16, "hm_truncatedNameString");
      v33 = objc_claimAutoreleasedReturnValue();
      configuredName = v22->_configuredName;
      v22->_configuredName = (NSString *)v33;

      objc_storeWeak((id *)&v22->_home, v17);
      objc_storeStrong((id *)&v22->_data, a6);
      objc_storeStrong((id *)&v22->_components, obj);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v35 = objc_claimAutoreleasedReturnValue();
      notificationCenter = v22->_notificationCenter;
      v22->_notificationCenter = (NSNotificationCenter *)v35;

      -[HMDMediaSystem workQueue](v22, "workQueue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaSystem uuid](v22, "uuid");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *, HMDMediaSystem *, HMDMediaSystem *, void *, _QWORD))v24 + 2))(v24, v37, v22, v22, v38, *MEMORY[0x24BDD7D10]);
      v39 = objc_claimAutoreleasedReturnValue();
      settingsController = v22->_settingsController;
      v22->_settingsController = (HMDAccessorySettingsController *)v39;

      v18 = v50;
      v15 = v51;
      audioDestinationsManagerFactory = v22->_audioDestinationsManagerFactory;
      v22->_audioDestinationsManagerFactory = &__block_literal_global_133530;

      objc_msgSend(v17, "mediaGroupsAggregateConsumer");
      v42 = objc_claimAutoreleasedReturnValue();
      aggregateDataProvider = v22->_aggregateDataProvider;
      v22->_aggregateDataProvider = (HMDMediaGroupsAggregateConsumerDataProvider *)v42;

    }
    return v22;
  }
  else
  {
    v45 = (HMDMediaSystem *)_HMFPreconditionFailure();
    return -[HMDMediaSystem initWithMediaSystemModel:home:](v45, v46, v47, v48);
  }
}

- (HMDMediaSystem)initWithMediaSystemModel:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDMediaSystem *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "mediaSystemComponents", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        +[HMDMediaSystemComponent mediaSystemComponentWithDictionary:home:](HMDMediaSystemComponent, "mediaSystemComponentWithDictionary:home:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13), v7);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v17 = 0;
          goto LABEL_11;
        }
        v15 = (void *)v14;
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
  }

  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuredName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[HMDMediaSystem initWithUUID:configuredName:home:data:components:](self, "initWithUUID:configuredName:home:data:components:", v9, v16, v7, 0, v8);

  v17 = self;
LABEL_11:

  return v17;
}

- (id)modelForMediaSystem
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDMediaSystem accessories](self, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  if (objc_msgSend(v4, "count"))
  {
    -[HMDMediaSystem _modelForMediaSystem]((HMDMediaSystemModel *)self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  -[HMDMediaSystem components](self, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(v19, "na_map:", &__block_literal_global_21_133517);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "na_map:", &__block_literal_global_22_133518);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaSystem uuid](self, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("uuid"), v18);
  v20[0] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaSystem name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("name"), v9);
  v20[1] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaSystem configuredName](self, "configuredName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("configuredName"), v12);
  v20[2] = v13;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F140]), "initWithName:value:", CFSTR("componentUUIDs"), v4);
  v20[3] = v14;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F140]), "initWithName:value:", CFSTR("accessoryUUIDs"), v5);
  v20[4] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaSystem uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  void *v3;
  HMDMediaSystem *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Dealloc-ing MediaSystem", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDMediaSystem;
  -[HMDMediaSystem dealloc](&v7, sel_dealloc);
}

- (id)dumpState
{
  return 0;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDMediaSystem messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (BOOL)isValid
{
  void *v3;
  unint64_t v4;
  void *v5;
  HMDMediaSystem *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaSystem components](self, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 <= 1)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = &unk_24E96B7F8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@There are fewer than %@ components, not valid", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  return v4 > 1;
}

- (BOOL)supportsUserMediaSettings
{
  void *v3;
  int v4;
  void *v5;
  BOOL v6;

  -[HMDMediaSystem accessories](self, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_44_133509);

  if (!v4)
    return 0;
  -[HMDMediaSystem accessories](self, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (void)configureWithMessageDispatcher:(id)a3
{
  id v4;
  void *v5;
  HMDMediaSystem *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaSystem components](v6, "components");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v8;
    v39 = 2112;
    v40 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring media system with components: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v31 = v4;
  -[HMDMediaSystem setMsgDispatcher:](v6, "setMsgDispatcher:", v4);
  -[HMDMediaSystem _registerForMessages](v6, "_registerForMessages");
  -[HMDMediaSystem _registerForNotifications](v6, "_registerForNotifications");
  -[HMDMediaSystem components](v6, "components");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMediaSystem _configureMediaSystemComponents:mediaSystem:](HMDMediaSystem, "_configureMediaSystemComponents:mediaSystem:", v10, v6);

  -[HMDMediaSystem home](v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem targetAccessoryBySerial](v6, "targetAccessoryBySerial");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCurrentAccessory");

  -[HMDMediaSystem settingsController](v6, "settingsController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem targetAccessory](v6, "targetAccessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configureIsSettingOwner:migrationOwner:home:legacySettingsAdaptor:", objc_msgSend(v15, "isCurrentAccessory"), v13, v11, 0);

  if ((v13 & 1) == 0 && -[HMDMediaSystem _otherAccessoryUsesVersionBasedMigrationOwner](v6))
  {
    -[HMDMediaSystem settingsController](v6, "settingsController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didDetectCounterpartUsesSoftwareVersionBasedMigrationOwner");

  }
  -[HMDMediaSystem settingsController](v6, "settingsController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "messageHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem msgDispatcher](v6, "msgDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "configureWithMessageDispatcher:home:", v19, v11);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HMDMediaSystem components](v6, "components");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v24), "accessory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v25;
        else
          v26 = 0;
        v27 = v26;

        objc_msgSend(v27, "settingsController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[HMDMediaSystem settingsController](v6, "settingsController");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "settingsController");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addDependant:", v30);

        }
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v22);
  }

  -[HMDMediaSystem configureAudioDestinationsManager](v6, "configureAudioDestinationsManager");
}

- (void)configureMediaSystemComponents:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDMediaSystem *v9;

  v4 = a3;
  -[HMDMediaSystem workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__HMDMediaSystem_configureMediaSystemComponents___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)audioDestinationIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("222AA6C0-21DB-4EE6-8E62-019974477350"));
  v4 = (void *)MEMORY[0x24BDD1880];
  -[HMDMediaSystem uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_UUIDWithNamespace:data:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMMediaDestination)audioDestination
{
  void *v3;
  void *v4;
  HMMediaDestination *v5;
  os_unfair_lock_s *p_lock;
  HMMediaDestination *audioDestination;
  HMMediaDestination *v8;
  void *v10;
  HMDMediaSystem *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    -[HMDMediaSystem legacyAudioDestination](self, "legacyAudioDestination");
    return (HMMediaDestination *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDMediaSystem dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "destinationForMediaSystem:", self);
      v5 = (HMMediaDestination *)objc_claimAutoreleasedReturnValue();
      p_lock = &self->_lock;
      os_unfair_lock_lock_with_options();
      audioDestination = v5;
      if (!v5)
        audioDestination = self->_audioDestination;
      v8 = audioDestination;
      os_unfair_lock_unlock(p_lock);

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
        v14 = 138543362;
        v15 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get audio destination data due to no data source set", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      v8 = 0;
    }

    return v8;
  }
}

- (id)legacyAudioDestination
{
  void *v3;
  void *v4;
  HMMediaDestination *v5;
  os_unfair_lock_s *p_lock;

  -[HMDMediaSystem audioDestinationsManager](self, "audioDestinationsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "destination");
    v5 = (HMMediaDestination *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v5 = self->_audioDestination;
    os_unfair_lock_unlock(p_lock);
  }

  return v5;
}

- (NSArray)associatedAudioDestinationManagers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v9;
  HMDMediaSystem *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (-[HMDMediaSystem isValid](self, "isValid"))
  {
    -[HMDMediaSystem components](self, "components");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __52__HMDMediaSystem_associatedAudioDestinationManagers__block_invoke;
    v13[3] = &unk_24E7877C0;
    v13[4] = self;
    objc_msgSend(v3, "na_map:", v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    if (v5 == objc_msgSend(v3, "count"))
      v6 = v4;
    else
      v6 = 0;
    v7 = v6;

    return (NSArray *)v7;
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
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get associated destination managers due to invalid media system", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    return (NSArray *)0;
  }
}

- (void)configureAudioDestinationsManager
{
  uint64_t v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HMDMediaSystem audioDestination](self, "audioDestination");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    -[HMDMediaSystem createNewAudioDestination](self, "createNewAudioDestination");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (id)v3;
  -[HMDMediaSystem audioDestinationsManagerFactory](self, "audioDestinationsManagerFactory");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem msgDispatcher](self, "msgDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem notificationCenter](self, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, void *, void *, HMDMediaSystem *, HMDMediaSystem *))v5)[2](v5, v11, v6, v7, self, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem setAudioDestinationsManager:](self, "setAudioDestinationsManager:", v8);

  -[HMDMediaSystem audioDestinationsManager](self, "audioDestinationsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureWithHome:", v10);

  if (!v4)
    -[HMDMediaSystem repairAnyPreExistingAudioGroups](self, "repairAnyPreExistingAudioGroups");

}

- (id)createNewAudioDestination
{
  void *v3;
  HMDMediaSystem *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = objc_alloc(MEMORY[0x24BDD7780]);
  -[HMDMediaSystem audioDestinationIdentifier](v4, "audioDestinationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem uuid](v4, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:", v8, v9, 0);

  return v10;
}

- (void)repairAnyPreExistingAudioGroups
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDMediaSystem *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[HMDMediaSystem isCurrentComponent](self, "isCurrentComponent"))
  {
    -[HMDMediaSystem home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaSystem audioDestinationIdentifier](self, "audioDestinationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "destinationControllerWithCommittedDestinationIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5
      || (-[HMDMediaSystem uuid](self, "uuid"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "destinationControllerWithCommittedDestinationIdentifier:", v6),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v5)
      || (-[HMDMediaSystem destinationControllerGroupedWithAssociatedDestination](self, "destinationControllerGroupedWithAssociatedDestination"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v10;
        v17 = 2112;
        v18 = v5;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Repairing existing audio group with destination controller: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDMediaSystem audioDestinationsManager](v8, "audioDestinationsManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __49__HMDMediaSystem_repairAnyPreExistingAudioGroups__block_invoke;
      v14[3] = &unk_24E79BD80;
      v14[4] = v8;
      objc_msgSend(v12, "sendRequestToUpdateAudioGroupIdentifier:completion:", v13, v14);

    }
  }
}

- (id)destinationControllerGroupedWithAssociatedDestination
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDMediaSystem associatedAudioDestinationManagers](self, "associatedAudioDestinationManagers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
      -[HMDMediaSystem home](self, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "destinationControllerWithDestinationIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (BOOL)isCurrentComponent
{
  void *v2;
  char v3;

  -[HMDMediaSystem components](self, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_49_133498);

  return v3;
}

- (id)mediaGroupsAggregatorMessengerForMediaDestinationsManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDMediaSystem *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaSystem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaGroupsAggregator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messenger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
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
      v15 = 138543874;
      v16 = v13;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get messenger from dependencies home: %@ aggregator: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }

  return v8;
}

- (id)mediaDestinationsManager:(id)a3 destinationControllerWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HMDMediaSystem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinationControllerWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)mediaDestinationsManager:(id)a3 didUpdateDestination:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaSystem *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
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
    v16 = 138543618;
    v17 = v11;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating home and siri sync data due to updated destination: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMediaSystem home](v9, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x24BDD65E8];
  -[HMDMediaSystem uuid](v9, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", v14, v15, 1);

  objc_msgSend(v13, "assistantSyncDataChanged:", v14);
}

- (void)unconfigureMediaSystemComponents
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDMediaSystem workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__HMDMediaSystem_unconfigureMediaSystemComponents__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)unconfigureMediaSystemComponents:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[HMDMediaSystem workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__HMDMediaSystem_unconfigureMediaSystemComponents___block_invoke;
  block[3] = &unk_24E79C240;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (void)auditMediaComponents
{
  void *v3;
  HMDMediaSystem *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (isFeatureHomeTheaterQFAEnabledForTests
    && !objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    -[HMDMediaSystem workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__HMDMediaSystem_auditMediaComponents__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v7, block);

  }
  else
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Skipping audit due to Home Theater QFA enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  -[HMDMediaSystem msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRoles:", objc_msgSend(v4, "roles") | 4);
  v5 = (void *)objc_msgSend(v4, "copy");
  -[HMDMediaSystem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v16[2] = v5;
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD7E38], self, v10, sel__routeUpdateMediaSystem_);
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  v15[2] = v5;
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD7D18], self, v14, sel__handleAppData_);
}

- (void)_registerForNotifications
{
  void *v3;
  id v4;

  -[HMDMediaSystem notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleRemovedAccessory_, CFSTR("HMDHomeAccessoryRemovedNotification"), 0);

  -[HMDMediaSystem notificationCenter](self, "notificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleAccessorySoftwareUpdated_, CFSTR("HMDAppleMediaAccessorySoftwareVersionUpdatedNotification"), 0);

}

- (void)_routeUpdateMediaSystem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDMediaSystem home](self, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeMediaSystemWithMessage:", v4);

}

- (void)_handleAppData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaSystem *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaSystem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaSystemController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processedMediaSystemBuilderMessageFor:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDMediaSystem _updateAppData:](self, "_updateAppData:", v7);
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to pre process update media system app data message: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_updateAppData:(id)a3
{
  id v4;
  void *v5;
  HMDMediaSystem *v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  HMDApplicationData *v12;
  HMDApplicationData *v13;
  HMDApplicationData *v14;
  void *v15;
  HMDApplicationData *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating app data with message: %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = CFSTR("com.apple.homekit-entitledclient.identifer");
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("kAppDataInformationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem appData](v6, "appData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (HMDApplicationData *)objc_msgSend(v11, "copy");
  if (v12)
  {
    v13 = v12;
    if (v10)
      -[HMDApplicationData setApplicationData:forIdentifier:](v12, "setApplicationData:forIdentifier:", v10, CFSTR("com.apple.homekit-entitledclient.identifer"));
    else
      -[HMDApplicationData removeApplicationDataForIdentifier:](v12, "removeApplicationDataForIdentifier:", CFSTR("com.apple.homekit-entitledclient.identifer"));
    v16 = v13;
    v17 = 2;
  }
  else
  {
    if (!v10)
    {
      v13 = 0;
      goto LABEL_13;
    }
    v14 = [HMDApplicationData alloc];
    -[HMDMediaSystem uuid](v6, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDApplicationData initWithParentUUID:](v14, "initWithParentUUID:", v15);

    -[HMDApplicationData setApplicationData:forIdentifier:](v13, "setApplicationData:forIdentifier:", v10, CFSTR("com.apple.homekit-entitledclient.identifer"));
    v16 = v13;
    v17 = 1;
  }
  -[HMDApplicationData modelObjectWithChangeType:](v16, "modelObjectWithChangeType:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
LABEL_13:
    objc_msgSend(v4, "respondWithPayload:", 0);
    goto LABEL_14;
  }
  -[HMDMediaSystem home](v6, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "backingStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "transaction:options:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "add:withMessage:", v18, v4);
  objc_msgSend(v23, "run");

LABEL_14:
}

- (void)handleAccessorySoftwareUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v9 = v5;

  v6 = v9;
  if (v9)
  {
    -[HMDMediaSystem accessories](self, "accessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v9);

    v6 = v9;
    if (v8)
    {
      -[HMDMediaSystem reevaluateSettingOwner](self);
      v6 = v9;
    }
  }

}

- (void)relayMessage:(id)a3
{
  id v4;
  void *v5;
  HMDMediaSystem *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDRemoteDeviceMessageDestination *v12;
  void *v13;
  HMDRemoteDeviceMessageDestination *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDMediaSystem *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDMediaSystem *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDMediaSystem *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isRemote"))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v8;
      v35 = 2112;
      v36 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay remote message: %@", (uint8_t *)&v33, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v9);
  }
  else
  {
    -[HMDMediaSystem msgDispatcher](self, "msgDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[HMDMediaSystem targetAccessory](self, "targetAccessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = [HMDRemoteDeviceMessageDestination alloc];
        -[HMDMediaSystem messageTargetUUID](self, "messageTargetUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v12, "initWithTarget:device:", v13, v11);

        if (v14)
        {
          objc_msgSend(v4, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v4, "qualityOfService");
          objc_msgSend(v4, "messagePayload");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", v15, v16, v14, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "responseHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setResponseHandler:", v19);

          objc_msgSend(v9, "sendMessage:", v18);
        }
        else
        {
          v28 = (void *)MEMORY[0x227676638]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 138543618;
            v34 = v31;
            v35 = 2112;
            v36 = v4;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to get message destination to relay message: %@", (uint8_t *)&v33, 0x16u);

          }
          objc_autoreleasePoolPop(v28);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "respondWithError:", v32);

          v14 = 0;
        }
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
          v33 = 138543618;
          v34 = v27;
          v35 = 2112;
          v36 = v4;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to get target device to relay message: %@", (uint8_t *)&v33, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
        v14 = (HMDRemoteDeviceMessageDestination *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v14);
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
        v33 = 138543618;
        v34 = v23;
        v35 = 2112;
        v36 = v4;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get message dispatcher to relay message: %@", (uint8_t *)&v33, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v11);
    }

  }
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDMediaSystem name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD7D08]);

  }
  -[HMDMediaSystem configuredName](self, "configuredName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDMediaSystem configuredName](self, "configuredName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD7CF8]);

  }
  -[HMDMediaSystem uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD7D20]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDD7CD8]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HMDMediaSystem components](self, "components", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "serialize");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD7CF0]);
  v17 = (void *)objc_msgSend(v3, "copy");

  return v17;
}

- (NSString)name
{
  void *v3;
  void *v4;

  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    -[HMDMediaSystem legacyName](self, "legacyName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDMediaSystem data](self, "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (id)legacyName
{
  void *v3;
  NSString *v4;
  os_unfair_lock_s *p_lock;
  NSString *configuredName;
  NSString *v7;

  -[HMDMediaSystem room](self, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  configuredName = self->_configuredName;
  if (!configuredName)
    configuredName = v4;
  v7 = configuredName;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDRoom)room
{
  void *v2;
  void *v3;

  -[HMDMediaSystem targetAccessory](self, "targetAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDRoom *)v3;
}

- (NSString)configuredName
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    -[HMDMediaSystem legacyConfiguredName](self, "legacyConfiguredName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDMediaSystem data](self, "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isDefaultName");

    if ((v4 & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[HMDMediaSystem data](self, "data");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (NSString *)v5;
}

- (id)legacyConfiguredName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_configuredName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setConfiguredName:(id)a3
{
  NSString *v4;
  NSString *configuredName;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)components
{
  void *v3;

  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    -[HMDMediaSystem legacyComponents](self, "legacyComponents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDMediaSystem generateComponents](self, "generateComponents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v3;
}

- (id)generateComponents
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[HMDMediaSystem data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleMediaAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__HMDMediaSystem_generateComponents__block_invoke;
  v9[3] = &unk_24E787828;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "na_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)legacyComponents
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSArray copy](self->_components, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setComponents:(id)a3
{
  id v5;

  v5 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDMediaSystem unconfigureMediaSystemComponents:](self, "unconfigureMediaSystemComponents:", self->_components);
  objc_storeStrong((id *)&self->_components, a3);
  -[HMDMediaSystem configureMediaSystemComponents:](self, "configureMediaSystemComponents:", v5);
  os_unfair_lock_unlock(&self->_lock);

}

- (NSArray)accessories
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDMediaSystem components](self, "components", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "accessory");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v11;
}

- (HMDMediaSession)mediaSession
{
  os_unfair_lock_s *p_lock;
  HMDMediaSession *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_mediaSession;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMediaSession:(id)a3
{
  os_unfair_lock_s *p_lock;
  HMDMediaSession **p_mediaSession;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_mediaSession = &self->_mediaSession;
  if ((HMFEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_mediaSession, a3);
  os_unfair_lock_unlock(p_lock);

}

- (HMDApplicationData)appData
{
  os_unfair_lock_s *p_lock;
  HMDApplicationData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_appData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAppData:(id)a3
{
  HMDApplicationData *v4;
  HMDApplicationData *appData;

  v4 = (HMDApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  appData = self->_appData;
  self->_appData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDAppleMediaAccessory)targetAccessory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDMediaSystem components](self, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMediaSystem sortMediaComponents:](HMDMediaSystem, "sortMediaComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (HMDAppleMediaAccessory *)v5;
}

- (id)targetAccessoryBySerial
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  HMDMediaSystem *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDMediaSystem *v23;
  NSObject *v24;
  void *v25;
  HMDMediaSystem *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[HMDMediaSystem components](self, "components");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v3)
  {
    v4 = v3;
    v27 = self;
    v5 = 0;
    v6 = *(_QWORD *)v30;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v6)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v7), "accessory", v27);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;

      if (!v10)
      {
        v18 = (void *)MEMORY[0x227676638]();
        v19 = v27;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v34 = v21;
          _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Missing accessory cannot determine target.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
        goto LABEL_27;
      }
      objc_msgSend(v10, "serialNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v22 = (void *)MEMORY[0x227676638]();
        v23 = v27;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v34 = v25;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Missing serial cannot determine target.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v22);

LABEL_27:
        v17 = 0;
        goto LABEL_28;
      }
      if (!v5)
        break;
      objc_msgSend(v5, "serialNumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serialNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "compare:", v13);

      if (v14 == -1)
      {
        v15 = v10;

LABEL_15:
        v5 = v8;
      }

      if (v4 == ++v7)
      {
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_20;
      }
    }
    v16 = v10;
    goto LABEL_15;
  }
  v5 = 0;
LABEL_20:

  v5 = v5;
  v17 = v5;
LABEL_28:

  return v17;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDMediaSystem *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  HMDMediaSystem *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
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
    v34 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received transaction object updated", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  v15 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    -[HMDMediaSystem _transactionMediaSystemUpdated:message:](v12, "_transactionMediaSystemUpdated:message:", v17, v10);
    v18 = v15;
  }
  else
  {
    v18 = v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v20)
    {
      -[HMDMediaSystem _appDataUpdated:message:](v12, "_appDataUpdated:message:", v20, v10);
    }
    else
    {
      v18 = v18;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v18;
      else
        v21 = 0;
      v22 = v21;

      v23 = (void *)MEMORY[0x227676638]();
      v24 = v12;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v22)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v27;
          v35 = 2112;
          v36 = v22;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Handling add of root settings %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        -[HMDMediaSystem settingsController](v24, "settingsController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __61__HMDMediaSystem_transactionObjectUpdated_newValues_message___block_invoke;
        v32[3] = &unk_24E79BD80;
        v32[4] = v24;
        objc_msgSend(v28, "handleUpdatedGroupModel:completion:", v22, v32);

      }
      else
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v34 = v29;
          v35 = 2112;
          v36 = v18;
          v37 = 2112;
          v38 = v30;
          v31 = v30;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "respondWithError:", v18);
      }
    }
  }

}

- (void)_transactionMediaSystemUpdated:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaSystem *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDMediaSystem *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  HMDMediaSystem *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDMediaSystem *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDMediaSystem *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  HMDMediaSystem *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543362;
    v55 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Applying the changes", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  if (isFeatureHomeTheaterQFAEnabledForTests
    && !objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    objc_msgSend(v6, "setProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", CFSTR("configuredName"));

    if (v17)
    {
      objc_msgSend(v6, "configuredName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaSystem setConfiguredName:](v9, "setConfiguredName:", v18);

    }
    objc_msgSend(v6, "setProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "containsObject:", CFSTR("mediaSystemComponents"));

    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v47 = v6;
      objc_msgSend(v6, "mediaSystemComponents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v49;
        while (2)
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v49 != v25)
              objc_enumerationMutation(v22);
            v27 = *(HMDMediaSystem **)(*((_QWORD *)&v48 + 1) + 8 * i);
            -[HMDMediaSystem home](v9, "home");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDMediaSystemComponent mediaSystemComponentWithDictionary:home:](HMDMediaSystemComponent, "mediaSystemComponentWithDictionary:home:", v27, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v29)
            {
              v42 = (void *)MEMORY[0x227676638]();
              v43 = v9;
              HMFGetOSLogHandle();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v55 = v45;
                v56 = 2112;
                v57 = v27;
                _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Unable to initialize a mediaSystemComponent from %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v42);
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "respondWithError:", v46);

              v6 = v47;
              goto LABEL_26;
            }
            objc_msgSend(v21, "addObject:", v29);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
          if (v24)
            continue;
          break;
        }
      }

      v30 = (void *)MEMORY[0x227676638]();
      v31 = v9;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v55 = v33;
        v56 = 2112;
        v57 = v31;
        v58 = 2112;
        v59 = v21;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Updated the media system %@ components to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      v34 = (void *)objc_msgSend(v21, "copy");
      -[HMDMediaSystem setComponents:](v31, "setComponents:", v34);

      -[HMDMediaSystem reevaluateSettingOwner](v31);
      v6 = v47;
    }
    v52 = *MEMORY[0x24BDD7CD0];
    -[HMDMediaSystem serialize](v9, "serialize");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v35;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithPayload:", v36);

    objc_msgSend(v7, "transactionResult");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "markChanged");
    objc_msgSend(v37, "markSaveToAssistant");
    -[HMDMediaSystem serialize](v9, "serialize");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F1B0], "entitledMessageWithName:messagePayload:", *MEMORY[0x24BDD7D28], v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaSystem msgDispatcher](v9, "msgDispatcher");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaSystem uuid](v9, "uuid");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sendMessage:target:", v39, v41);

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v9;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Skipping transaction update due to Home Theater QFA enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }
LABEL_26:

}

- (void)_appDataUpdated:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDApplicationData *v10;
  void *v11;
  void *v12;
  HMDApplicationData *v13;
  void *v14;
  HMDMediaSystem *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaSystem appData](self, "appData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDMediaSystem appData](self, "appData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateWithModel:", v6);

  }
  else
  {
    v10 = [HMDApplicationData alloc];
    objc_msgSend(v6, "appDataDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaSystem uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDApplicationData initWithDictionary:parentUUID:](v10, "initWithDictionary:parentUUID:", v11, v12);
    -[HMDMediaSystem setAppData:](self, "setAppData:", v13);

    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appDataDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data : %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }
  objc_msgSend(v7, "transactionResult");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "markChanged");
  objc_msgSend(v7, "respondWithPayload:", 0);

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HMDMediaSystem *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  if (v9)
  {
    -[HMDMediaSystem _appDataRemoved:message:](self, "_appDataRemoved:message:", v9, v7);
    v10 = v6;
  }
  else
  {
    v10 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      -[HMDMediaSystem settingsController](self, "settingsController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __51__HMDMediaSystem_transactionObjectRemoved_message___block_invoke;
      v19[3] = &unk_24E79BD80;
      v19[4] = self;
      objc_msgSend(v13, "handleRemovedGroupModel:completion:", v12, v19);

    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v21 = v17;
        v22 = 2112;
        v23 = v10;
        v24 = 2112;
        v25 = (id)objc_opt_class();
        v18 = v25;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithError:", v10);
    }
  }

}

- (void)_appDataRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaSystem *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
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
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling removal of app data", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMediaSystem setAppData:](v9, "setAppData:", 0);
  objc_msgSend(v7, "transactionResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "markChanged");
  objc_msgSend(v7, "respondWithPayload:", 0);

}

- (HMDMediaSystem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HMDMediaSystem *v15;
  void *v16;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  HMDApplicationData *appData;
  uint64_t v21;
  HMMediaDestination *audioDestination;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD7D20]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD7CF8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, *MEMORY[0x24BDD7CF0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD77E8], "codingKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HMDMediaSystem initWithUUID:configuredName:home:data:components:](self, "initWithUUID:configuredName:home:data:components:", v5, v6, v7, v14, v11);
  if (v15)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD7D08]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hm_truncatedNameString");
    v17 = objc_claimAutoreleasedReturnValue();
    name = v15->_name;
    v15->_name = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.appDataRepository"));
    v19 = objc_claimAutoreleasedReturnValue();
    appData = v15->_appData;
    v15->_appData = (HMDApplicationData *)v19;

    -[HMDApplicationData updateParentUUIDIfNil:](v15->_appData, "updateParentUUIDIfNil:", v15->_uuid);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6760]);
    v21 = objc_claimAutoreleasedReturnValue();
    audioDestination = v15->_audioDestination;
    v15->_audioDestination = (HMMediaDestination *)v21;

  }
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[HMDMediaSystem home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v5, *MEMORY[0x24BDD7D08]);

  -[HMDMediaSystem configuredName](self, "configuredName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, *MEMORY[0x24BDD7CF8]);

  -[HMDMediaSystem uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v7, *MEMORY[0x24BDD7D20]);

  -[HMDMediaSystem components](self, "components");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, *MEMORY[0x24BDD7CF0]);

  if (objc_msgSend(v15, "hmd_isForLocalStore"))
  {
    -[HMDMediaSystem data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD77E8], "codingKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v9, v10);

  }
  if (!objc_msgSend(v15, "hmd_isForXPCTransport")
    || objc_msgSend(v15, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    -[HMDMediaSystem audioDestination](self, "audioDestination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v11, *MEMORY[0x24BDD6760]);

  }
  objc_msgSend(v15, "encodeConditionalObject:forKey:", v4, CFSTR("home"));
  v12 = objc_msgSend(v15, "hmd_isForXPCTransport");
  -[HMDMediaSystem appData](self, "appData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
    objc_msgSend(v13, "encodeForXPCTransportWithCoder:key:", v15, CFSTR("HM.appData"));
  else
    objc_msgSend(v15, "encodeObject:forKey:", v13, CFSTR("HM.appDataRepository"));

}

- (void)mergeAudioDestination:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDMediaSystem audioDestinationsManager](self, "audioDestinationsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergeDestination:", v4);

}

- (void)mergeMediaSystemData:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  HMDMediaSystem *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaSystem data](self, "data");
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
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging media system data: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDMediaSystem setData:](v8, "setData:", v4);
  }

}

- (id)backingStoreObjectsForVersion:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem modelObjectWithChangeType:](self, "modelObjectWithChangeType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  -[HMDMediaSystem settingsController](self, "settingsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "modelObjectsForSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v8);

  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  HMDMediaSystem *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaSystem modelForMediaSystem](self, "modelForMediaSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setObjectChangeType:", a3);
    -[HMDMediaSystem configuredName](self, "configuredName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConfiguredName:", v7);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[HMDMediaSystem components](self, "components", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "serialize");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    objc_msgSend(v6, "setMediaSystemComponents:", v8);
    v15 = v6;

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
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive media system model with change type: %@ due to no provided model for media system", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

  return v6;
}

- (NSSet)messageReceiverChildren
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem mediaSession](self, "mediaSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDMediaSystem mediaSession](self, "mediaSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[HMDMediaSystem accessories](self, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v7;
}

- (HMDBackingStore)backingStore
{
  void *v2;
  void *v3;

  -[HMDMediaSystem home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDBackingStore *)v3;
}

- (void)setSetupActivity:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDMediaSystem home](self, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetupActivity:", v4);

}

- (HMDAccessorySetupMetricDispatcher)accessorySetupMetricDispatcher
{
  return 0;
}

- (HMFActivity)setupActivity
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDMediaSystem home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFActivity *)v4;
}

- (void)setSetupStartTimestamp:(double)a3
{
  void *v5;
  HMDMediaSystem *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2048;
    v14 = a3;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Setup start timestamp %f", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaSystem home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSetupStartTimestamp:", a3);

}

- (double)setupStartTimestamp
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HMDMediaSystem home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupStartTimestamp");
  v5 = v4;

  return v5;
}

- (HMDCurrentAccessorySetupMetricDispatcher)currentAccessorySetupMetricDispatcher
{
  return 0;
}

- (void)removeManagedConfigurationProfileWithProfileData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  HMDMediaSystem *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
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
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Remove managed configuration profile not supported", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v12);

}

- (id)modelsToMakeSettingsForController:(id)a3 parentUUID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDMediaSystem *v20;
  HMDMediaSystem *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDMediaSystem *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDMediaSystem *v34;
  NSObject *v35;
  void *v36;
  id v38;
  id v39;
  id obj;
  HMDAccessorySettingsMetadata *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v41 = objc_alloc_init(HMDAccessorySettingsMetadata);
  if (v41)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[HMDMediaSystem components](self, "components");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v8)
    {
      v9 = v8;
      v38 = v7;
      v39 = v6;
      v10 = 0;
      v42 = *(_QWORD *)v44;
      v11 = obj;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v44 != v42)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "accessory", v38);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
          v15 = v14;

          if (v10)
          {
            objc_msgSend(v15, "settingsController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "rootGroup");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)objc_msgSend(v17, "copyReplica");

            if (v18)
            {
              v19 = (void *)MEMORY[0x227676638]();
              v20 = self;
              v21 = self;
              HMFGetOSLogHandle();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v48 = v23;
                v49 = 2112;
                v50 = v15;
                _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Merging root group of %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v19);
              -[HMDAccessorySettingsMetadata rootGroup](v41, "rootGroup");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "intersectSettingGroup:groupMetadata:shouldAddMissingItems:", v18, v24, 0);

              self = v20;
              v11 = obj;
            }
          }
          else
          {
            v25 = (void *)MEMORY[0x227676638]();
            v26 = self;
            HMFGetOSLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v48 = v28;
              v49 = 2112;
              v50 = v15;
              _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Took first group from %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v25);
            objc_msgSend(v15, "settingsController");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "rootGroup");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = (void *)objc_msgSend(v30, "copyReplica");

            -[HMDMediaSystem uuid](v26, "uuid");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setParentIdentifier:", v31);

            -[HMDAccessorySettingsMetadata rootGroup](v41, "rootGroup");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "intersectSettingGroup:groupMetadata:shouldAddMissingItems:", v10, v18, 0);
          }

        }
        v9 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v9);

      v6 = v39;
      if (!v10)
      {
        v32 = 0;
        v7 = v38;
        goto LABEL_28;
      }
      +[HMDAccessorySettingTransform modelsForGroup:](HMDAccessorySettingTransform, "modelsForGroup:", v10);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v38;
    }
    else
    {
      v32 = 0;
      v10 = obj;
    }

  }
  else
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v36;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Cannot load settings metadata", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v33);
    v32 = 0;
  }
LABEL_28:

  return v32;
}

- (id)modelsToMigrateSettingsForController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDMediaSystem *v27;
  NSObject *v28;
  void *v29;
  void *v31;
  id v32;
  HMDMediaSystem *v33;
  id obj;
  HMDAccessorySettingsMetadata *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v35 = objc_alloc_init(HMDAccessorySettingsMetadata);
  if (v35)
  {
    v32 = v4;
    -[HMDMediaSystem settingsController](self, "settingsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v6, "copyIdentical");

    -[HMDMediaSystem settingsController](self, "settingsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyIdentical");

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[HMDMediaSystem components](self, "components");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v10)
    {
      v11 = v10;
      v33 = self;
      v12 = *(_QWORD *)v37;
      v13 = 1;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v37 != v12)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "accessory");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
          v17 = v16;

          objc_msgSend(v17, "settingsController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "rootGroup");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v19, "copyReplica");

          if (v9)
          {
            if (v20)
            {
              -[HMDAccessorySettingsMetadata rootGroup](v35, "rootGroup");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "intersectSettingGroup:groupMetadata:shouldAddMissingItems:", v20, v21, v13 & 1);

              v13 = 0;
              v22 = v20;
            }
            else
            {
              v22 = 0;
            }
          }
          else
          {
            -[HMDMediaSystem uuid](v33, "uuid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setParentIdentifier:", v23);

            -[HMDAccessorySettingsMetadata rootGroup](v35, "rootGroup");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "intersectSettingGroup:groupMetadata:shouldAddMissingItems:", v20, v22, 0);
            v13 = 0;
            v9 = v20;
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v11);
    }

    if (v9)
    {
      v24 = v31;
      v4 = v32;
      if (v31 && (objc_msgSend(v31, "compareSettingsTree:", v9) & 1) != 0)
      {
        v25 = 0;
      }
      else
      {
        +[HMDAccessorySettingTransform modelsForGroupDiff:fromGroup:](HMDAccessorySettingTransform, "modelsForGroupDiff:fromGroup:", v31, v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v25 = 0;
      v24 = v31;
      v4 = v32;
    }

  }
  else
  {
    v26 = (void *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v29;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot load settings metadata", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    v25 = 0;
  }

  return v25;
}

- (void)accessorySettingsController:(id)a3 saveWithReason:(id)a4 model:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  -[HMDMediaSystem home](self, "home");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveWithReason:postSyncNotification:objectChange:", v7, 0, a5 != 0);

}

- (void)accessorySettingsController:(id)a3 saveWithReason:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[HMDMediaSystem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDMediaSystem uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", v5, v7, 1);

}

- (BOOL)isMultiUserEnabledForAccessorySettingsController:(id)a3
{
  void *v3;
  char v4;

  -[HMDMediaSystem home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMultiUserEnabled");

  return v4;
}

- (id)supportedMultiUserLanguageCodesForAccessorySettingsController:(id)a3
{
  void *v3;
  void *v4;

  -[HMDMediaSystem targetAccessory](self, "targetAccessory", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedMultiUserLanguageCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)remoteMessageDestinationForAccessorySettingsController:(id)a3 target:(id)a4
{
  id v5;
  void *v6;
  HMDRemoteDeviceMessageDestination *v7;
  HMDRemoteDeviceMessageDestination *v8;
  void *v9;

  v5 = a4;
  -[HMDMediaSystem targetAccessory](self, "targetAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v7 = (HMDRemoteDeviceMessageDestination *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [HMDRemoteDeviceMessageDestination alloc];
    objc_msgSend(v6, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v8, "initWithTarget:device:", v5, v9);

  }
  return v7;
}

- (id)assistantAccessControlModelWithRemovedAccessoriesForAccessorySettingsController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HMDMediaSystem components](self, "components", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "accessory");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
        v12 = v11;

        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  -[HMDMediaSystem home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentUser");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assistantAccessControl");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "assistantAccessControlModelWithRemovedAccessories:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)componentsSupportsHomeLevelLocationServiceSetting
{
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  HMDMediaSystem *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaSystem accessories](self, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_88);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 == objc_msgSend(v3, "count"))
  {
    v6 = objc_msgSend(v4, "na_all:", &__block_literal_global_91_133403);
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
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine supports home level location services setting for all components: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v6 = 0;
  }

  return v6;
}

- (HMDMediaSystemDataSource)dataSource
{
  return (HMDMediaSystemDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (HMDAccessorySettingsController)settingsController
{
  return (HMDAccessorySettingsController *)objc_getProperty(self, a2, 104, 1);
}

- (HMMediaSystemData)data
{
  return (HMMediaSystemData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (HMDMediaDestinationsManager)audioDestinationsManager
{
  return (HMDMediaDestinationsManager *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAudioDestinationsManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (HMDMediaGroupsAggregateConsumerDataProvider)aggregateDataProvider
{
  return (HMDMediaGroupsAggregateConsumerDataProvider *)objc_getProperty(self, a2, 128, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (id)audioDestinationsManagerFactory
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setAudioDestinationsManagerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_audioDestinationsManagerFactory, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_aggregateDataProvider, 0);
  objc_storeStrong((id *)&self->_audioDestinationsManager, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_audioDestination, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_mediaSession, 0);
  objc_storeStrong((id *)&self->_appData, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

uint64_t __67__HMDMediaSystem_componentsSupportsHomeLevelLocationServiceSetting__block_invoke_89(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsHomeLevelLocationServiceSetting");
}

id __67__HMDMediaSystem_componentsSupportsHomeLevelLocationServiceSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

void __51__HMDMediaSystem_transactionObjectRemoved_message___block_invoke(uint64_t a1, void *a2)
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
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error removing root group.", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }

}

- (void)reevaluateSettingOwner
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__HMDMediaSystem_reevaluateSettingOwner__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = a1;
    dispatch_sync(v2, block);

  }
}

void __40__HMDMediaSystem_reevaluateSettingOwner__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "targetAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentAccessory");
  objc_msgSend(*(id *)(a1 + 32), "settingsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSettingOwner");

  if ((_DWORD)v3 != v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v2;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Target accessory sorting order has changed updating setting owner to %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 32), "settingsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateSettingOwner:", v3);

  }
  if (-[HMDMediaSystem _otherAccessoryUsesVersionBasedMigrationOwner](*(void **)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 32), "settingsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didDetectCounterpartUsesSoftwareVersionBasedMigrationOwner");

  }
}

- (BOOL)_otherAccessoryUsesVersionBasedMigrationOwner
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "components");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, &v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
LABEL_4:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v4)
        objc_enumerationMutation(v1);
      objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v5), "accessory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
      v8 = v7;

      if (v8)
      {
        if (!objc_msgSend(v8, "isCurrentAccessory"))
          break;
      }

      if (v3 == ++v5)
      {
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, &v16, 16);
        if (v3)
          goto LABEL_4;
        goto LABEL_14;
      }
    }
    objc_msgSend(v8, "softwareVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_17;
    objc_msgSend(v9, "operatingSystemVersion");
    v16 = *MEMORY[0x24BE3EC90];
    v17 = *(_QWORD *)(MEMORY[0x24BE3EC90] + 16);
    v10 = HMFOperatingSystemVersionCompare() == -1;
  }
  else
  {
LABEL_14:

    v9 = 0;
LABEL_17:
    v10 = 0;
  }

  return v10;
}

void __61__HMDMediaSystem_transactionObjectUpdated_newValues_message___block_invoke(uint64_t a1, void *a2)
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
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error adding root group.", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }

}

HMDMediaSystemComponent *__36__HMDMediaSystem_generateComponents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  HMDMediaSystemComponent *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HMDMediaSystemComponent *v21;

  v3 = a2;
  objc_msgSend(v3, "audioDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "leftDestinationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hmf_isEqualToUUID:", v6))
  {

LABEL_4:
    v10 = [HMDMediaSystemComponent alloc];
    objc_msgSend(v4, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = objc_alloc(MEMORY[0x24BDD77F0]);
    v14 = 1;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "leftDestinationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

  if (v9)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "rightDestinationIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "hmf_isEqualToUUID:", v16))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "rightDestinationIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "hmf_isEqualToUUID:", v18);

    if (!v19)
    {
      v21 = 0;
      goto LABEL_16;
    }
  }
  v10 = [HMDMediaSystemComponent alloc];
  objc_msgSend(v4, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_alloc(MEMORY[0x24BDD77F0]);
  v14 = 2;
LABEL_13:
  v20 = (void *)objc_msgSend(v13, "initWithRole:", v14);
  v21 = -[HMDMediaSystemComponent initWithUUID:accessory:role:](v10, "initWithUUID:accessory:role:", v12, v3, v20);

  if (!v11)
  {

    v11 = 0;
  }

LABEL_16:
  return v21;
}

void __38__HMDMediaSystem_auditMediaComponents__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "isValid") & 1) == 0)
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Media system isn't valid anymore, removing it", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaSystem _modelForMediaSystem](*(HMDMediaSystemModel **)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "setObjectChangeType:", 3);
      objc_msgSend(v6, "backingStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transaction:options:", CFSTR("Remove-Invalid-Media-System"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "add:withMessage:", v8, 0);
      objc_msgSend(v11, "run");

    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Did not obtain media system model, not deleting.", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
    }

  }
}

- (HMDMediaSystemModel)_modelForMediaSystem
{
  HMDMediaSystemModel *v1;
  HMDMediaSystemModel *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    v2 = [HMDMediaSystemModel alloc];
    -[HMDBackingStoreModelObject uuid](v1, "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaSystemModel home](v1, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = -[HMDBackingStoreModelObject initWithUUID:parentUUID:](v2, "initWithUUID:parentUUID:", v3, v5);

  }
  return v1;
}

uint64_t __51__HMDMediaSystem_unconfigureMediaSystemComponents___block_invoke(uint64_t a1)
{
  return +[HMDMediaSystem _configureMediaSystemComponents:mediaSystem:](HMDMediaSystem, "_configureMediaSystemComponents:mediaSystem:", *(_QWORD *)(a1 + 32), 0);
}

void __50__HMDMediaSystem_unconfigureMediaSystemComponents__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMediaSystem _configureMediaSystemComponents:mediaSystem:](HMDMediaSystem, "_configureMediaSystemComponents:mediaSystem:", v2, 0);

  objc_msgSend(*(id *)(a1 + 32), "settingsController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllDependants");

}

uint64_t __36__HMDMediaSystem_isCurrentComponent__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentAccessory");

  return v3;
}

void __49__HMDMediaSystem_repairAnyPreExistingAudioGroups__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
      v12 = 138543618;
      v13 = v7;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Repair existing audio group request completed with error: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Repair existing audio group request completed", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);

}

id __52__HMDMediaSystem_associatedAudioDestinationManagers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
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
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "audioDestinationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v12;
      v16 = 2112;
      v17 = v3;
      v18 = 2112;
      v19 = v4;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@No audio destination manager found for component: %@ accessory: %@ apple media accessory: %@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
  }

  return v8;
}

uint64_t __49__HMDMediaSystem_configureMediaSystemComponents___block_invoke(uint64_t a1)
{
  return +[HMDMediaSystem _configureMediaSystemComponents:mediaSystem:](HMDMediaSystem, "_configureMediaSystemComponents:mediaSystem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __43__HMDMediaSystem_supportsUserMediaSettings__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsUserMediaSettings");
}

id __39__HMDMediaSystem_attributeDescriptions__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __39__HMDMediaSystem_attributeDescriptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

HMDMediaDestinationsManager *__93__HMDMediaSystem_initWithUUID_configuredName_home_data_components_settingsControllerCreator___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  HMDMediaDestinationsManager *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = a2;
  v15 = -[HMDMediaDestinationsManager initWithDestination:messageDispatcher:notificationCenter:dataSource:delegate:]([HMDMediaDestinationsManager alloc], "initWithDestination:messageDispatcher:notificationCenter:dataSource:delegate:", v14, v13, v12, v11, v10);

  return v15;
}

HMDAccessorySettingsController *__67__HMDMediaSystem_initWithUUID_configuredName_home_data_components___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  HMDAccessorySettingsController *v16;
  void *v17;
  HMDAccessorySettingsController *v18;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = a2;
  v16 = [HMDAccessorySettingsController alloc];
  objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMDAccessorySettingsController initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:](v16, "initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:", v15, v14, v13, v12, v11, v17);

  return v18;
}

+ (id)initalizeDataWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 defaultName:(BOOL)a6 components:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a6;
  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[HMDMediaSystem destinationIdentifierForComponentRoleType:components:](HMDMediaSystem, "destinationIdentifierForComponentRoleType:components:", 1, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMediaSystem destinationIdentifierForComponentRoleType:components:](HMDMediaSystem, "destinationIdentifierForComponentRoleType:components:", 2, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD77E8], "unknownDestinationSentinel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD77E8], "unknownDestinationSentinel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (!v16)
    goto LABEL_5;
LABEL_3:
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD77E8]), "initWithIdentifier:parentIdentifier:name:defaultName:associatedGroupIdentifier:leftDestinationIdentifier:rightDestinationIdentifier:", v14, v13, v12, v7, 0, v15, v16);

  return v17;
}

+ (id)destinationIdentifierForComponentRoleType:(unint64_t)a3 components:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__HMDMediaSystem_destinationIdentifierForComponentRoleType_components___block_invoke;
  v11[3] = &__block_descriptor_40_e33_B16__0__HMDMediaSystemComponent_8l;
  v11[4] = a3;
  objc_msgSend(a4, "na_firstObjectPassingTest:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "audioDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_133553 != -1)
    dispatch_once(&logCategory__hmf_once_t2_133553, &__block_literal_global_36_133554);
  return (id)logCategory__hmf_once_v3_133555;
}

+ (void)_configureMediaSystemComponents:(id)a3 mediaSystem:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "mediaProfile");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;

        if (v13)
          objc_msgSend(v13, "setMediaSystem:", v6);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  objc_msgSend(v6, "auditMediaComponents");

}

+ (id)sortMediaComponents:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __38__HMDMediaSystem_sortMediaComponents___block_invoke;
  v13 = &unk_24E787850;
  v14 = v4;
  v15 = a1;
  v5 = v4;
  objc_msgSend(v5, "sortedArrayUsingComparator:", &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reverseObjectEnumerator", v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 1;
}

uint64_t __38__HMDMediaSystem_sortMediaComponents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v6, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v9)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      v27 = 138544130;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unexpected media accessory not found for components %@, acc1: %@, acc2: %@", (uint8_t *)&v27, 0x2Au);

    }
    objc_autoreleasePoolPop(v14);
    if (v9)
      v21 = 1;
    else
      v21 = -1;
  }
  else
  {
    objc_msgSend(v9, "softwareVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "softwareVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "compare:", v20);

    if (!v21)
    {
      objc_msgSend(v9, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v23, "compare:", v25);

    }
  }

  return v21;
}

void __29__HMDMediaSystem_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_133555;
  logCategory__hmf_once_v3_133555 = v0;

}

BOOL __71__HMDMediaSystem_destinationIdentifierForComponentRoleType_components___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type") == *(_QWORD *)(a1 + 32);

  return v4;
}

- (id)urlString
{
  void *v2;
  void *v3;

  -[HMDMediaSystem uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  hm_assistantIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)assistantObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  void *v45;
  void *v46;
  id obj;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void *v54;
  void *v55;
  _BYTE v56[128];
  _QWORD v57[9];
  _QWORD v58[9];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaSystem home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystem name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && v3)
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (id)*MEMORY[0x24BE81FE0];
      -[HMDMediaSystem components](self, "components");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9 == 2)
      {
        v10 = (id)*MEMORY[0x24BE81FE8];

        v7 = v10;
      }
      v58[0] = *MEMORY[0x24BE81F30];
      v57[0] = CFSTR("objectType");
      v57[1] = CFSTR("objectName");
      -[HMDMediaSystem name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = v11;
      v57[2] = CFSTR("objectIdentifier");
      -[HMDMediaSystem urlString](self, "urlString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v58[2] = v12;
      v57[3] = CFSTR("objectHome");
      objc_msgSend(v3, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v58[3] = v13;
      v57[4] = CFSTR("objectHomeIdentifier");
      objc_msgSend(v3, "urlString");
      v46 = v3;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v58[4] = v14;
      v58[5] = self;
      v57[5] = CFSTR("objectReference");
      v57[6] = CFSTR("objectServiceType");
      v58[6] = *MEMORY[0x24BE82130];
      v58[7] = v7;
      v57[7] = CFSTR("objectServiceSubType");
      v57[8] = CFSTR("objectGroupType");
      v58[8] = *MEMORY[0x24BE81F68];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v15, "mutableCopy");

      v3 = v46;
      -[HMDMediaSystem audioDestination](self, "audioDestination");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v49)
        goto LABEL_26;
      objc_msgSend(v46, "accessories");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "na_map:", &__block_literal_global_34_156327);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      if (v19)
      {
        v20 = v19;
        obj = v18;
        v48 = 0;
        v44 = v7;
        v21 = 0;
        v22 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v51 != v22)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend(v24, "audioDestinationController", v44);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "data");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "destinationIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "uniqueIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v27, "hmf_isEqualToUUID:", v28);

            if (v29)
            {
              objc_msgSend(v24, "name");
              v30 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v25, "urlString");
              v31 = objc_claimAutoreleasedReturnValue();

              v21 = (void *)v30;
              v48 = (void *)v31;
            }

          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        }
        while (v20);
        v18 = obj;

        v32 = v21;
        if (!v21)
        {
          v3 = v46;
          v7 = v44;
          v33 = v48;
          goto LABEL_25;
        }
        v3 = v46;
        v33 = v48;
        if (!v48)
        {
          v7 = v44;
          goto LABEL_25;
        }
        v55 = v32;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKey:", v34, CFSTR("objectGroups"));

        v54 = v48;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKey:", v35, CFSTR("objectGroupIdentifiers"));
        v7 = v44;
      }
      else
      {
        v33 = 0;
        v32 = 0;
        v35 = v18;
      }

LABEL_25:
LABEL_26:
      v42 = (void *)objc_msgSend(v45, "copy");

      goto LABEL_27;
    }
  }
  else
  {

  }
  v36 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaSystem name](self, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaSystem uuid](self, "uuid");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "UUIDString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v60 = v38;
    v61 = 2112;
    v62 = v39;
    v63 = 2112;
    v64 = v41;
    v65 = 2112;
    v66 = v3;
    _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because attribute(s) is nil self %@/%@  self.home %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v36);
  v42 = 0;
LABEL_27:

  return v42;
}

id __44__HMDMediaSystem_Assistant__assistantObject__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

@end
