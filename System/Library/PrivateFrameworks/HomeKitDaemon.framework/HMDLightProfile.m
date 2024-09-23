@implementation HMDLightProfile

- (HMDLightProfile)initWithWorkQueue:(id)a3 lightService:(id)a4 accessory:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDNaturalLightingCurveWriter *v30;
  HMDLightProfileDataSource *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  HMDCharacteristicsAvailabilityListener *v37;
  HMDLightProfile *v38;
  void *v40;
  HMDLightProfile *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v46;
  HMDLightProfileDataSource *v47;
  uint64_t v48;
  void *v49;
  _QWORD v50[5];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  _QWORD v55[4];

  v55[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v47 = objc_alloc_init(HMDLightProfileDataSource);
  v10 = 0x24BDD1000uLL;
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "instanceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v9, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v13;
  v55[0] = v13;
  v55[1] = CFSTR("2BB698E3-7C61-4B4F-B60A-33194DF41A06");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hm_deriveUUIDFromBaseUUID:withSalts:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!_os_feature_enabled_impl())
    goto LABEL_8;
  v18 = objc_msgSend(v9, "supportsCHIP");
  if ((v18 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v9, "matterNodeID");
  v19 = objc_claimAutoreleasedReturnValue();
  v10 = 0x24BDD1000;
  if (!v19)
  {
LABEL_8:
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isResidentCapable");

    if (v23)
    {
      objc_msgSend(v9, "home");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(v10 + 1992);
      objc_msgSend(v24, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("%@/%@/%@"), v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = -[HMDNaturalLightingCurveWriter initWithUUID:workQueue:logIdentifier:]([HMDNaturalLightingCurveWriter alloc], "initWithUUID:workQueue:logIdentifier:", v17, v7, v29);
    }
    else
    {
      v30 = 0;
    }
    v31 = v47;
    v32 = (void *)MEMORY[0x24BDBCF20];
    v50[0] = CFSTR("00000143-0000-1000-8000-0026BB765291");
    v50[1] = CFSTR("00000144-0000-1000-8000-0026BB765291");
    v33 = *MEMORY[0x24BDD57A0];
    v50[2] = *MEMORY[0x24BDD57F0];
    v50[3] = v33;
    v50[4] = CFSTR("0000024B-0000-1000-8000-0026BB765291");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithArray:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = *MEMORY[0x24BDD6C00];
    v49 = v35;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[HMDCharacteristicsAvailabilityListener initWithAccessory:workQueue:interestedCharacteristicTypesByServiceType:]([HMDCharacteristicsAvailabilityListener alloc], "initWithAccessory:workQueue:interestedCharacteristicTypesByServiceType:", v9, v7, v36);
    v38 = -[HMDLightProfile initWithUUID:workQueue:lightService:accessory:characteristicsAvailabilityListener:naturalLightingCurveWriter:dataSource:](self, "initWithUUID:workQueue:lightService:accessory:characteristicsAvailabilityListener:naturalLightingCurveWriter:dataSource:", v17, v7, v8, v9, v37, v30, v47);

    goto LABEL_12;
  }
  v16 = (void *)v19;
  objc_msgSend(v9, "matterNodeID");
  v10 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)v10, "isEqual:", &unk_24E96D400))
  {

    v10 = 0x24BDD1000;
    goto LABEL_8;
  }
LABEL_6:
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isResidentCapable");

  if (v18)
  {
    v10 = 0x24BDD1000uLL;
    if ((v21 & 1) == 0)
      goto LABEL_8;
  }
  else
  {

    v10 = 0x24BDD1000;
    if (!v21)
      goto LABEL_8;
  }
  v40 = (void *)MEMORY[0x227676638]();
  v41 = self;
  HMFGetOSLogHandle();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v43;
    v53 = 2112;
    v54 = v44;
    _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@HMDLightProfile creating matter curve writer for accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v40);
  v30 = -[HMDNaturalLightingMatterCurveWriter initWithWorkQueue:accessory:]([HMDNaturalLightingMatterCurveWriter alloc], "initWithWorkQueue:accessory:", v7, v9);
  v31 = v47;
  v38 = -[HMDLightProfile initWithUUID:workQueue:lightService:accessory:matterCurveWriter:dataSource:](v41, "initWithUUID:workQueue:lightService:accessory:matterCurveWriter:dataSource:", v17, v7, v8, v9, v30, v47);
LABEL_12:

  return v38;
}

- (HMDLightProfile)initWithUUID:(id)a3 workQueue:(id)a4 lightService:(id)a5 accessory:(id)a6 characteristicsAvailabilityListener:(id)a7 naturalLightingCurveWriter:(id)a8 dataSource:(id)a9
{
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  HMDLightProfile *v22;
  uint64_t v23;
  NSSet *notificationEnabledCharacteristics;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *clientIdentifier;
  uint64_t v30;
  NSHashTable *characteristicValueObservers;
  id v33;
  id v34;
  id v35;
  void *v36;
  objc_super v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v16 = a5;
  v17 = a6;
  v35 = a7;
  v34 = a8;
  v33 = a9;
  v36 = v16;
  v38[0] = v16;
  v18 = (void *)MEMORY[0x24BDBCE30];
  v19 = a4;
  v20 = a3;
  objc_msgSend(v18, "arrayWithObjects:count:", v38, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37.receiver = self;
  v37.super_class = (Class)HMDLightProfile;
  v22 = -[HMDAccessoryProfile initWithAccessory:uniqueIdentifier:services:workQueue:](&v37, sel_initWithAccessory_uniqueIdentifier_services_workQueue_, v17, v20, v21, v19);

  if (v22)
  {
    objc_storeStrong((id *)&v22->_service, a5);
    objc_storeStrong((id *)&v22->_characteristicsAvailabilityListener, a7);
    objc_storeWeak((id *)&v22->_hapAccessory, v17);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    notificationEnabledCharacteristics = v22->_notificationEnabledCharacteristics;
    v22->_notificationEnabledCharacteristics = (NSSet *)v23;

    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@.HMDLightProfile.%@"), CFSTR("com.apple.HomeKitDaemon"), v27, v33, v34, v35, v36);
    v28 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v22->_clientIdentifier;
    v22->_clientIdentifier = (NSString *)v28;

    objc_storeStrong((id *)&v22->_naturalLightingCurveWriter, a8);
    objc_storeStrong((id *)&v22->_dataSource, a9);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v30 = objc_claimAutoreleasedReturnValue();
    characteristicValueObservers = v22->_characteristicValueObservers;
    v22->_characteristicValueObservers = (NSHashTable *)v30;

  }
  return v22;
}

- (HMDLightProfile)initWithUUID:(id)a3 workQueue:(id)a4 lightService:(id)a5 accessory:(id)a6 matterCurveWriter:(id)a7 dataSource:(id)a8
{
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  HMDLightProfile *v21;
  id v23;
  id v24;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v15 = a5;
  v16 = a6;
  v24 = a7;
  v23 = a8;
  v26[0] = v15;
  v17 = (void *)MEMORY[0x24BDBCE30];
  v18 = a4;
  v19 = a3;
  objc_msgSend(v17, "arrayWithObjects:count:", v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)HMDLightProfile;
  v21 = -[HMDAccessoryProfile initWithAccessory:uniqueIdentifier:services:workQueue:](&v25, sel_initWithAccessory_uniqueIdentifier_services_workQueue_, v16, v19, v20, v18);

  if (v21)
  {
    objc_storeStrong((id *)&v21->_service, a5);
    objc_storeWeak((id *)&v21->_hapAccessory, v16);
    objc_storeStrong((id *)&v21->_matterCurveWriter, a7);
    objc_storeStrong((id *)&v21->_dataSource, a8);
  }

  return v21;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hapAccessory);
  -[NSSet allObjects](self->_notificationEnabledCharacteristics, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 0, v4, self->_clientIdentifier);

  v5.receiver = self;
  v5.super_class = (Class)HMDLightProfile;
  -[HMDLightProfile dealloc](&v5, sel_dealloc);
}

- (void)registerForMessages
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDLightProfile *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void *v20;
  HMDLightProfile *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDLightProfile *v26;
  NSObject *v27;
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
  int v40;
  void *v41;
  __int16 v42;
  void *v43;
  void *v44;
  _QWORD v45[4];

  v45[3] = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDLightProfile hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v5, "naturalLightingContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HMDLightProfile settings](self, "settings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "supportsNaturalLighting");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLightProfile setNaturalLightingSupported:](self, "setNaturalLightingSupported:", objc_msgSend(v9, "BOOLValue"));

      if (-[HMDLightProfile isNaturalLightingSupported](self, "isNaturalLightingSupported"))
      {
        v10 = (void *)MEMORY[0x227676638]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 138543362;
          v41 = v13;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting supported features with natural lighting supported", (uint8_t *)&v40, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
        -[HMDLightProfile setSupportedFeatures:](v11, "setSupportedFeatures:", 1);
        -[HMDLightProfile notifyClientsOfUpdatedSettingsWithPreviousSettings:](v11, "notifyClientsOfUpdatedSettingsWithPreviousSettings:", v8);
      }

    }
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "supportsCHIP"))
    {
      v45[0] = v14;
      v45[1] = v15;
      v45[2] = v16;
      v17 = (void *)MEMORY[0x24BDBCE30];
      v18 = (void **)v45;
      v19 = 3;
    }
    else
    {
      v44 = v14;
      v17 = (void *)MEMORY[0x24BDBCE30];
      v18 = &v44;
      v19 = 1;
    }
    objc_msgSend(v17, "arrayWithObjects:count:", v18, v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543618;
      v41 = v28;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Registering for xpc handler messages with home: %@", (uint8_t *)&v40, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    -[HMDAccessoryProfile msgDispatcher](v26, "msgDispatcher");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD6500], v26, v24, sel_handleSetNaturalLightingEnabledMessage_);

    -[HMDAccessoryProfile msgDispatcher](v26, "msgDispatcher");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD64F0], v26, v24, sel_handleFetchNaturalLightColorTemperatureForBrightnessMessage_);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v26, sel_handleAccessorySupportsNaturalLightingDidChangeNotification_, CFSTR("HMDAccessorySupportsNaturalLightingDidChangeNotification"), v4);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v26, sel_handleAccessoryNaturalLightingEnabledDidChangeNotification_, CFSTR("HMDAccessoryNaturalLightingEnabledDidChangeNotification"), v4);

    -[HMDLightProfile matterCurveWriter](v26, "matterCurveWriter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      -[HMDLightProfile matterCurveWriter](v26, "matterCurveWriter");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "configureWithLightProfile:", v26);

    }
    else
    {
      -[HMDLightProfile naturalLightingCurveWriter](v26, "naturalLightingCurveWriter");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "configureWithLightProfile:", v26);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObserver:selector:name:object:", v26, sel_handleHomeDidEnableCharacteristicNotification_, CFSTR("HMDHomeDidEnableCharacteristicNotifyEventNotification"), v6);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addObserver:selector:name:object:", v26, sel_handleHomeDidDisableCharacteristicNotification_, CFSTR("HMDHomeDidDisableCharacteristicNotifyEventNotification"), v6);

      -[HMDLightProfile characteristicsAvailabilityListener](v26, "characteristicsAvailabilityListener");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setDelegate:", v26);

      -[HMDLightProfile characteristicsAvailabilityListener](v26, "characteristicsAvailabilityListener");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "start");

      if (objc_msgSend(v6, "hasCharacteristicNotificationRegistrations")
        && -[HMDLightProfile enableNaturalLightingCharacteristicNotificationsForObserver:](v26, "enableNaturalLightingCharacteristicNotificationsForObserver:", v6))
      {
        -[HMDLightProfile readNaturalLightingCharacteristicsWithReason:](v26, "readNaturalLightingCharacteristicsWithReason:", CFSTR("Characteristic notifications enabled"));
      }
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
      v40 = 138543362;
      v41 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Accessory or home is nil", (uint8_t *)&v40, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (void)handleSetNaturalLightingEnabledMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDLightProfile *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  HMDLightProfile *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfile hapAccessory](v7, "hapAccessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "supportsCHIP");
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v12;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received message to set Natural Lighting setting: %@ supportsCHIP: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDLightProfile hapAccessory](v7, "hapAccessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "supportsCHIP");

  if (v14)
  {
    -[HMDLightProfile handleSetNaturalLightingEnabledMessageForMatterAccessory:](v7, "handleSetNaturalLightingEnabledMessageForMatterAccessory:", v4);
  }
  else
  {
    v15 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x24BDD6508]);
    v16 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x24BDD6510]);
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __58__HMDLightProfile_handleSetNaturalLightingEnabledMessage___block_invoke;
    v21 = &unk_24E79BCC8;
    v22 = v4;
    v23 = v7;
    v17 = _Block_copy(&v18);
    -[HMDLightProfile setNaturalLightingEnabled:shouldRetryOnFailure:completion:](v7, "setNaturalLightingEnabled:shouldRetryOnFailure:completion:", v15, v16, v17, v18, v19, v20, v21);

  }
}

- (void)handleFetchNaturalLightColorTemperatureForBrightnessMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDLightProfile *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  HMDLightProfile *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDLightProfile *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDLightProfile *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HMDLightProfile *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v9;
    v45 = 2112;
    v46 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received message to fetch color temperature for brightness: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD64D8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "integerValue") < 0)
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v7;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v27;
      v45 = 2112;
      v46 = v11;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Invalid brightness value: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }
  else
  {
    -[HMDLightProfile hapAccessory](v7, "hapAccessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "naturalLightingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[HMDLightProfile naturalLightingCurve](v7, "naturalLightingCurve");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[HMDLightProfile dataSource](v7, "dataSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLightProfile dataSource](v7, "dataSource");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v14;
        objc_msgSend(v14, "timeZone");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v16, "millisecondsElapsedSinceStartOfDayWithDate:timeZone:", v18, v19);

        objc_msgSend(v15, "colorTemperatureForBrightness:millisecondsElapsedSinceStartOfDay:", objc_msgSend(v11, "integerValue"), v20);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v21)
        {
          v41 = *MEMORY[0x24BDD64E8];
          v42 = v21;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "respondWithPayload:", v23);
        }
        else
        {
          v36 = (void *)MEMORY[0x227676638]();
          v37 = v7;
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v44 = v39;
            v45 = 2112;
            v46 = v11;
            _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to calculate color temperature value for brightness: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v36);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "respondWithError:", v23);
        }
        v14 = v40;

      }
      else
      {
        v32 = (void *)MEMORY[0x227676638]();
        v33 = v7;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v35;
          v45 = 2112;
          v46 = 0;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Natural lighting curve is not set: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v22);
      }

    }
    else
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v7;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v31;
        v45 = 2112;
        v46 = 0;
        v47 = 2112;
        v48 = v13;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Natural lighting context not set for home (%@:%@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v15);
    }

  }
}

- (void)resetNaturalLightingEnabledRetryContext
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDLightProfile *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDLightProfile naturalLightingEnabledRetryContext](self, "naturalLightingEnabledRetryContext");
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
      v11 = 138543618;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Resetting natural lighting context: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completion");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v9);

    -[HMDLightProfile setNaturalLightingEnabledRetryContext:](v6, "setNaturalLightingEnabledRetryContext:", 0);
  }

}

- (void)handleSetNaturalLightingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;

  v3 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDLightProfile settings](self, "settings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfile setNaturalLightingEnabled:](self, "setNaturalLightingEnabled:", v3);
  -[HMDLightProfile notifyClientsOfUpdatedSettingsWithPreviousSettings:](self, "notifyClientsOfUpdatedSettingsWithPreviousSettings:", v6);

}

- (void)notifyClientsOfUpdatedSettingsWithPreviousSettings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  HMDLightProfile *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMDLightProfile *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDLightProfile *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDLightProfile settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLightProfile settings](v9, "settings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v11;
      v50 = 2112;
      v51 = v4;
      v52 = 2112;
      v53 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating settings from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDLightProfile settings](v9, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "supportedFeatures") & 1;

    if (v14 != (objc_msgSend(v4, "supportedFeatures") & 1))
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = v9;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v18;
        v50 = 2112;
        v51 = v19;
        v52 = 2112;
        v53 = v20;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Requesting to sync siri data since natural lighting supported changed from %@ -> %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDAccessoryProfile accessory](v16, "accessory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "home");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "homeManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "assistantSyncDataChanged:", CFSTR("Natural lighting support updated"));

    }
    v24 = -[HMDLightProfile isNaturalLightingEnabled](v9, "isNaturalLightingEnabled");
    v25 = objc_msgSend(v4, "isNaturalLightingEnabled");
    if (v24)
    {
      if ((v25 & 1) == 0)
      {
        -[HMDLightProfile lastNaturalLightingEnabledDate](v9, "lastNaturalLightingEnabledDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLightProfile dataSource](v9, "dataSource");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "date");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLightProfile setLastNaturalLightingUsedDate:](v9, "setLastNaturalLightingUsedDate:", v28);
        -[HMDLightProfile setLastNaturalLightingEnabledDate:](v9, "setLastNaturalLightingEnabledDate:", v28);

        v29 = (void *)MEMORY[0x227676638]();
        v30 = v9;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDLightProfile lastNaturalLightingEnabledDate](v30, "lastNaturalLightingEnabledDate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v49 = v32;
          v50 = 2112;
          v51 = v33;
          v52 = 2112;
          v53 = v26;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Updating lastNaturalLightingEnabledDate to: %@ from: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v29);

      }
      if (!-[HMDLightProfile supportsCHIP](v9, "supportsCHIP"))
        -[HMDLightProfile synchronizeCurveToAccessory](v9, "synchronizeCurveToAccessory");
    }
    else if (v25)
    {
      -[HMDLightProfile dataSource](v9, "dataSource");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "date");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLightProfile setLastNaturalLightingUsedDate:](v9, "setLastNaturalLightingUsedDate:", v35);

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "postNotificationName:object:", CFSTR("HMDLightProfile.SettingsUpdated"), v9);

    -[HMDLightProfile settings](v9, "settings", *MEMORY[0x24BDD6518]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObjectForIncomingXPCMessage(v37, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = objc_alloc(MEMORY[0x24BE3F1B8]);
    -[HMDAccessoryProfile uniqueIdentifier](v9, "uniqueIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v40, "initWithTarget:", v41);

    v43 = objc_alloc(MEMORY[0x24BE3F1D0]);
    v44 = (void *)objc_msgSend(v43, "initWithName:destination:payload:", *MEMORY[0x24BDD6520], v42, v39);
    objc_msgSend(v44, "setRequiresSPIEntitlement");
    -[HMDAccessoryProfile msgDispatcher](v9, "msgDispatcher");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "sendMessage:", v44);

  }
}

- (void)updateNaturalLightingEnabledForCharacteristic:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDLightProfile *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  HMDLightProfile *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDLightProfile *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDLightProfile *v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  void *v33;
  HMDLightProfile *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDLightProfile *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDLightProfile *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  HMDLightProfile *v53;
  NSObject *v54;
  _BOOL4 v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *contexta;
  void *context;
  void *v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543618;
    v66 = v9;
    v67 = 2112;
    v68 = (uint64_t)v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating natural lighting enabled with characteristic: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDLightProfile colorTemperatureCharacteristic](v7, "colorTemperatureCharacteristic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[HMDLightProfile setNaturalLightingEnabled:](v7, "setNaturalLightingEnabled:", 0);
    v26 = (void *)MEMORY[0x227676638](-[HMDLightProfile setNaturalLightingActiveTransitionContext:](v7, "setNaturalLightingActiveTransitionContext:", 0));
    v27 = v7;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v29;
      v67 = 2112;
      v68 = 0;
      v30 = "%{public}@Ignoring Value Transition Control Characteristic update because Color Temperature Characteristic is %@";
      v31 = v28;
      v32 = 22;
LABEL_19:
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);

    }
LABEL_20:

    objc_autoreleasePoolPop(v26);
    goto LABEL_44;
  }
  if (!v4)
  {
    -[HMDLightProfile setNaturalLightingEnabled:](v7, "setNaturalLightingEnabled:", 0);
    v26 = (void *)MEMORY[0x227676638](-[HMDLightProfile setNaturalLightingActiveTransitionContext:](v7, "setNaturalLightingActiveTransitionContext:", 0));
    v27 = v7;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v29;
      v30 = "%{public}@Value Transition Control Characteristic is nil";
      v31 = v28;
      v32 = 12;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  objc_msgSend(v4, "value");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hmf_hexadecimalRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v17;
      v67 = 2112;
      v68 = (uint64_t)v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Decoding Value Transition Control Characteristic value: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BE1BA48], "parsedFromData:error:", v13, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "naturalLightingEnabledForCharacteristic:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = v15;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v66 = v24;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Parsed the Value Transition Control Characteristic value update as Transition Start", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      -[HMDLightProfile setNaturalLightingEnabled:](v22, "setNaturalLightingEnabled:", objc_msgSend(v20, "BOOLValue"));
      objc_msgSend(v19, "naturalLightingActiveTransitionContextForCharacteristic:", v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLightProfile setNaturalLightingActiveTransitionContext:](v22, "setNaturalLightingActiveTransitionContext:", v25);
    }
    else
    {
      v64 = v19;
      objc_msgSend(MEMORY[0x24BE1BA50], "parsedFromData:error:", v13, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "valueTransition");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLightProfile colorTemperatureCharacteristic](v15, "colorTemperatureCharacteristic");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "naturalLightingActiveTransitionContextForCharacteristic:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        v40 = (void *)MEMORY[0x227676638]();
        v41 = v15;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v66 = v43;
          _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Parsed the Value Transition Control Characteristic value update as Transition Control Fetch Response", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v40);
        -[HMDLightProfile setNaturalLightingEnabled:](v41, "setNaturalLightingEnabled:", 1);
      }
      else
      {
        objc_msgSend(v25, "transitionState");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "isValid"))
        {
          v45 = (void *)MEMORY[0x227676638]();
          v46 = v15;
          HMFGetOSLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            contexta = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "activeTransitionContexts");
            v60 = v45;
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v66 = contexta;
            v67 = 2112;
            v68 = (uint64_t)v48;
            _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Parsed the Value Transition Control Characteristic value update as Transition Control Write Response, active transition contexts are: %@", buf, 0x16u);

            v45 = v60;
          }

          objc_autoreleasePoolPop(v45);
          -[HMDLightProfile setNaturalLightingEnabled:](v46, "setNaturalLightingEnabled:", objc_msgSend(v44, "isNaturalLightingEnabledForCharacteristic:", v10));
          objc_msgSend(v25, "transitionState");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "naturalLightingActiveTransitionContextForCharacteristic:", v10);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDLightProfile setNaturalLightingActiveTransitionContext:](v46, "setNaturalLightingActiveTransitionContext:", v50);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BE1BA78], "parsedFromData:error:", v13, 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = objc_msgSend(v51, "isValid");
          context = (void *)MEMORY[0x227676638]();
          v53 = v15;
          HMFGetOSLogHandle();
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = os_log_type_enabled(v54, OS_LOG_TYPE_INFO);
          if (v52)
          {
            if (v55)
            {
              HMFGetLogIdentifier();
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "activeTransitionContexts");
              v56 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v66 = v61;
              v67 = 2112;
              v68 = v56;
              v57 = (void *)v56;
              _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_INFO, "%{public}@Parsed the Value Transition Control Characteristic value update as Transition State, active transition contexts are: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(context);
            -[HMDLightProfile setNaturalLightingEnabled:](v53, "setNaturalLightingEnabled:", objc_msgSend(v51, "isNaturalLightingEnabledForCharacteristic:", v10));
            objc_msgSend(v51, "naturalLightingActiveTransitionContextForCharacteristic:", v10);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDLightProfile setNaturalLightingActiveTransitionContext:](v53, "setNaturalLightingActiveTransitionContext:", v58);

          }
          else
          {
            if (v55)
            {
              HMFGetLogIdentifier();
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v66 = v59;
              v67 = 2112;
              v68 = (uint64_t)v13;
              _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_INFO, "%{public}@Did not handle Value Transiton Control Charactersitic update: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(context);
          }
          v44 = v51;
        }

      }
      v19 = v64;
    }

  }
  else
  {
    -[HMDLightProfile setNaturalLightingEnabled:](v7, "setNaturalLightingEnabled:", 0);
    v33 = (void *)MEMORY[0x227676638](-[HMDLightProfile setNaturalLightingActiveTransitionContext:](v7, "setNaturalLightingActiveTransitionContext:", 0));
    v34 = v7;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v36;
      v67 = 2112;
      v68 = (uint64_t)v11;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Value Transition Control Characteristic value is not of type data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
  }

LABEL_44:
}

- (void)updateSupportedFeaturesWithCharacteristics:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  HMDLightProfile *v15;
  NSObject *v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  HMDLightProfile *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  HMDLightProfile *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HMDLightProfile *v42;
  NSObject *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  HMDLightProfile *v47;
  NSObject *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  HMDLightProfile *v52;
  NSObject *v53;
  void *v54;
  const char *v55;
  NSObject *v56;
  os_log_type_t v57;
  uint32_t v58;
  void *v59;
  void *v60;
  HMDLightProfile *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  __CFString *v68;
  __CFString *v69;
  __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  _QWORD v75[4];
  __CFString *v76;
  id v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  const __CFString *v81;
  __int16 v82;
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_238798);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_97_238800);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v41 = (void *)MEMORY[0x227676638]();
      v42 = self;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (const __CFString *)*MEMORY[0x24BDD57F0];
        *(_DWORD *)buf = 138543874;
        v79 = v44;
        v80 = 2112;
        v81 = v45;
        v82 = 2112;
        v83 = v4;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Characteristic Color Temperature: %@ is not supported, available characteristics: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v41);
      goto LABEL_49;
    }
    objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_99_238802);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v46 = (void *)MEMORY[0x227676638]();
      v47 = self;
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (const __CFString *)*MEMORY[0x24BDD57A0];
        *(_DWORD *)buf = 138543874;
        v79 = v49;
        v80 = 2112;
        v81 = v50;
        v82 = 2112;
        v83 = v4;
        _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@Characteristics Brightness: %@ is not supported, available characteristics: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v46);
      goto LABEL_48;
    }
    objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_101_238804);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[HMDLightProfile setNaturalLightingSupported:](self, "setNaturalLightingSupported:", 1);
      -[HMDLightProfile naturalLightingCurve](self, "naturalLightingCurve");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v9, "value");
        v11 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;

        v14 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v13)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v73 = v14;
            v18 = v13;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString hmf_hexadecimalRepresentation](v18, "hmf_hexadecimalRepresentation");
            v71 = v9;
            v20 = v11;
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v79 = v19;
            v80 = 2112;
            v81 = v21;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Decoding supported value transition configuration: %@", buf, 0x16u);

            v11 = v20;
            v9 = v71;

            v13 = v18;
            v14 = v73;
          }

          objc_autoreleasePoolPop(v14);
          v77 = 0;
          objc_msgSend(MEMORY[0x24BE1BBF0], "parsedFromData:error:", v13, &v77);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v22;
          v74 = v77;
          if (v22)
          {
            v68 = v13;
            v69 = v11;
            objc_msgSend(v22, "transitions");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v75[0] = MEMORY[0x24BDAC760];
            v75[1] = 3221225472;
            v75[2] = __62__HMDLightProfile_updateSupportedFeaturesWithCharacteristics___block_invoke_103;
            v75[3] = &unk_24E798AC8;
            v24 = v7;
            v76 = (__CFString *)v24;
            objc_msgSend(v23, "na_firstObjectPassingTest:", v75);
            v25 = objc_claimAutoreleasedReturnValue();

            v26 = (void *)MEMORY[0x227676638]();
            v27 = v15;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
            v67 = (void *)v25;
            if (v25)
            {
              if (v29)
              {
                HMFGetLogIdentifier();
                v30 = v26;
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v79 = v31;
                _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Updating supported features with natural lighting feature", buf, 0xCu);

                v26 = v30;
              }

              objc_autoreleasePoolPop(v26);
              -[HMDLightProfile setSupportedFeatures:](v27, "setSupportedFeatures:", 1);
              -[HMDLightProfile hapAccessory](v27, "hapAccessory");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "home");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v33, "isCurrentDeviceConfirmedPrimaryResident"))
              {
                objc_msgSend(v33, "naturalLightingContext");
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                if (v34)
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = (id)objc_msgSend(v32, "saveSupportsNaturalLighting:", v35);

                }
              }

            }
            else
            {
              if (v29)
              {
                HMFGetLogIdentifier();
                v65 = v26;
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v79 = v66;
                v80 = 2112;
                v81 = v24;
                _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Characteristic: %@ doesn't support Linear Derived Transition", buf, 0x16u);

                v26 = v65;
              }

              objc_autoreleasePoolPop(v26);
            }
            v64 = v72;

            v13 = v68;
            v11 = v69;
          }
          else
          {
            v60 = (void *)MEMORY[0x227676638]();
            v61 = v15;
            HMFGetOSLogHandle();
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v70 = v11;
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v79 = v63;
              v80 = 2112;
              v81 = v13;
              v82 = 2112;
              v83 = v74;
              _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode the supported value transition configuration from: %@ error: %@", buf, 0x20u);

              v11 = v70;
            }

            objc_autoreleasePoolPop(v60);
            v64 = 0;
          }

        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v79 = v59;
            v80 = 2112;
            v81 = v11;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Supported Value Transition Configuration Characteristic value: %@ is not of expected type NSData", buf, 0x16u);

            v13 = 0;
          }

          objc_autoreleasePoolPop(v14);
        }

        goto LABEL_47;
      }
      v51 = (void *)MEMORY[0x227676638]();
      v52 = self;
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v54;
        v55 = "%{public}@Natural lighting curve is not set";
        v56 = v53;
        v57 = OS_LOG_TYPE_ERROR;
        v58 = 12;
        goto LABEL_33;
      }
    }
    else
    {
      v51 = (void *)MEMORY[0x227676638]();
      v52 = self;
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v79 = v54;
        v80 = 2112;
        v81 = CFSTR("00000144-0000-1000-8000-0026BB765291");
        v82 = 2112;
        v83 = v4;
        v55 = "%{public}@Supported Value Transition Characteristic: %@ is not supported, available characteristics: %@";
        v56 = v53;
        v57 = OS_LOG_TYPE_INFO;
        v58 = 32;
LABEL_33:
        _os_log_impl(&dword_2218F0000, v56, v57, v55, buf, v58);

      }
    }

    objc_autoreleasePoolPop(v51);
LABEL_47:

LABEL_48:
LABEL_49:

    goto LABEL_50;
  }
  v37 = (void *)MEMORY[0x227676638]();
  v38 = self;
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v79 = v40;
    v80 = 2112;
    v81 = CFSTR("00000143-0000-1000-8000-0026BB765291");
    v82 = 2112;
    v83 = v4;
    _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Value Transition Control Characteristic: %@ is not supported, available characteristics: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v37);
LABEL_50:

}

- (void)_handleAccessoryCharacteristicsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDLightProfile *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  HMDLightProfile *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  HMDLightProfile *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
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
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v9;
    v41 = 2112;
    v42 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling notification: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDLightProfile settings](v7, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfile naturalLightingActiveTransitionContext](v7, "naturalLightingActiveTransitionContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDLightProfile availableCharacteristicWithType:fromChangedObjects:](v7, "availableCharacteristicWithType:fromChangedObjects:", CFSTR("00000144-0000-1000-8000-0026BB765291"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfile hapAccessory](v7, "hapAccessory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "naturalLightingContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[HMDLightProfile naturalLightingCurve](v7, "naturalLightingCurve");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = v7;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v24;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Initialize the curve since natural lighting context is present", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      -[HMDLightProfile updateNaturalLightingCurve](v22, "updateNaturalLightingCurve");
    }
  }
  else
  {

  }
  if (v15)
  {
    -[HMDLightProfile availableCharacteristics](v7, "availableCharacteristics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfile updateSupportedFeaturesWithCharacteristics:](v7, "updateSupportedFeaturesWithCharacteristics:", v25);

  }
  -[HMDLightProfile availableCharacteristicWithType:fromChangedObjects:](v7, "availableCharacteristicWithType:fromChangedObjects:", CFSTR("00000143-0000-1000-8000-0026BB765291"), v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    -[HMDLightProfile updateNaturalLightingEnabledForCharacteristic:](v7, "updateNaturalLightingEnabledForCharacteristic:", v26);
  -[HMDLightProfile availableCharacteristicWithType:fromChangedObjects:](v7, "availableCharacteristicWithType:fromChangedObjects:", CFSTR("0000024B-0000-1000-8000-0026BB765291"), v14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27
    && -[HMDLightProfile updateActiveTransitionCountWithCharacteristic:](v7, "updateActiveTransitionCountWithCharacteristic:", v27))
  {
    -[HMDLightProfile readNaturalLightingCharacteristicsWithReason:](v7, "readNaturalLightingCharacteristicsWithReason:", CFSTR("Active transition count updated"));
  }
  -[HMDLightProfile notifyClientsOfUpdatedSettingsWithPreviousSettings:](v7, "notifyClientsOfUpdatedSettingsWithPreviousSettings:", v11);
  -[HMDLightProfile naturalLightingActiveTransitionContext](v7, "naturalLightingActiveTransitionContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = HMFEqualObjects();

  if ((v29 & 1) == 0)
  {
    v37 = v11;
    v38 = v4;
    v30 = (void *)MEMORY[0x227676638]();
    v31 = v7;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLightProfile naturalLightingActiveTransitionContext](v31, "naturalLightingActiveTransitionContext");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v33;
      v41 = 2112;
      v42 = v12;
      v43 = 2112;
      v44 = v34;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Updating natural lighting active transition context from %@ -> %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v30);
    -[HMDLightProfile naturalLightingCurveWriter](v31, "naturalLightingCurveWriter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfile naturalLightingActiveTransitionContext](v31, "naturalLightingActiveTransitionContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleActiveTransitionContextUpdated:", v36);

    v11 = v37;
    v4 = v38;
  }

}

- (id)availableCharacteristicWithType:(id)a3 fromChangedObjects:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDLightProfile availableCharacteristics](self, "availableCharacteristics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__HMDLightProfile_availableCharacteristicWithType_fromChangedObjects___block_invoke;
  v14[3] = &unk_24E798AF8;
  v15 = v9;
  v16 = v6;
  v10 = v6;
  v11 = v9;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)updateNaturalLightingCurve
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HMDLightProfile *v23;
  NSObject *v24;
  void *v25;
  const char *v26;
  void *v27;
  HMDNaturalLightingCurve *v28;
  void *v29;
  char v30;
  void *v31;
  HMDLightProfile *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  HMDLightProfile *v43;
  NSObject *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDLightProfile brightnessCharacteristic](self, "brightnessCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  -[HMDLightProfile brightnessCharacteristic](self, "brightnessCharacteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "maximumValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  -[HMDLightProfile colorTemperatureCharacteristic](self, "colorTemperatureCharacteristic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minimumValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDLightProfile colorTemperatureCharacteristic](self, "colorTemperatureCharacteristic");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "maximumValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryProfile accessory](self, "accessory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "naturalLightingContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "curve");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "minimumBrightness") < v7 || objc_msgSend(v21, "minimumBrightness") > v11)
  {
    v22 = MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v51 = v25;
      v52 = 2048;
      v53 = objc_msgSend(v21, "minimumBrightness");
      v54 = 2048;
      v55 = v7;
      v56 = 2048;
      v57 = v11;
      v26 = "%{public}@Not initializing curve because curve minimum brightness is not in supported range %ld (%ld:%ld)";
LABEL_9:
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, v26, buf, 0x2Au);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v21, "maximumBrightness") < v7 || objc_msgSend(v21, "maximumBrightness") > v11)
  {
    v22 = MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v51 = v25;
      v52 = 2048;
      v53 = objc_msgSend(v21, "maximumBrightness");
      v54 = 2048;
      v55 = v7;
      v56 = 2048;
      v57 = v11;
      v26 = "%{public}@Not initializing curve because curve maximum brightness is not in supported range %ld (%ld:%ld)";
      goto LABEL_9;
    }
LABEL_10:

    v27 = (void *)v22;
LABEL_11:
    objc_autoreleasePoolPop(v27);
    v28 = 0;
    goto LABEL_12;
  }
  if (!v14 || !v17)
  {
    v42 = MEMORY[0x227676638]();
    v43 = self;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v45;
      v52 = 2112;
      v53 = (uint64_t)v14;
      v54 = 2112;
      v55 = (uint64_t)v17;
      v46 = "%{public}@Either minimum color temperature: %@ or maximum color temperature: %@";
      goto LABEL_24;
    }
LABEL_25:

    v27 = (void *)v42;
    goto LABEL_11;
  }
  v41 = objc_msgSend(v14, "integerValue");
  if (v41 > objc_msgSend(v17, "integerValue"))
  {
    v42 = MEMORY[0x227676638]();
    v43 = self;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v45;
      v52 = 2112;
      v53 = (uint64_t)v14;
      v54 = 2112;
      v55 = (uint64_t)v17;
      v46 = "%{public}@Minimum color temperature value: %@ is greater than maximum color temperature value: %@";
LABEL_24:
      _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, v46, buf, 0x20u);

      goto LABEL_25;
    }
    goto LABEL_25;
  }
  v47 = objc_msgSend(v14, "integerValue");
  if (v47 > objc_msgSend(v21, "maximumColorTemperature"))
  {
    v42 = MEMORY[0x227676638]();
    v43 = self;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    HMFGetLogIdentifier();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v51 = v45;
    v52 = 2112;
    v53 = (uint64_t)v14;
    v54 = 2048;
    v55 = objc_msgSend(v21, "maximumColorTemperature");
    v46 = "%{public}@Minimum color temperature value: %@  is greater than the curve maximum color temperature value: %ld";
    goto LABEL_24;
  }
  v48 = objc_msgSend(v17, "integerValue");
  if (v48 < objc_msgSend(v21, "minimumColorTemperature"))
  {
    v42 = MEMORY[0x227676638]();
    v43 = self;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    HMFGetLogIdentifier();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v51 = v45;
    v52 = 2112;
    v53 = (uint64_t)v17;
    v54 = 2048;
    v55 = objc_msgSend(v21, "minimumColorTemperature");
    v46 = "%{public}@Maximum color temperature value: %@  is less than the curve minimum color temperature value: %ld";
    goto LABEL_24;
  }
  v28 = -[HMDNaturalLightingCurve initWithCurve:minimumColorTemperature:maximumColorTemperature:]([HMDNaturalLightingCurve alloc], "initWithCurve:minimumColorTemperature:maximumColorTemperature:", v21, objc_msgSend(v14, "integerValue"), objc_msgSend(v17, "integerValue"));
LABEL_12:
  -[HMDLightProfile naturalLightingCurve](self, "naturalLightingCurve");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = HMFEqualObjects();

  if ((v30 & 1) == 0)
  {
    v31 = (void *)MEMORY[0x227676638]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLightProfile naturalLightingCurve](v32, "naturalLightingCurve");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v21;
      v36 = v17;
      v37 = v14;
      v38 = objc_msgSend(v49, "checksum");
      v39 = -[HMDNaturalLightingCurve checksum](v28, "checksum");
      *(_DWORD *)buf = 138543874;
      v51 = v34;
      v52 = 2048;
      v53 = v38;
      v14 = v37;
      v17 = v36;
      v21 = v35;
      v54 = 2048;
      v55 = v39;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Updated natural lighting curve from %llu -> %llu", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v31);
    -[HMDLightProfile setNaturalLightingCurve:](v32, "setNaturalLightingCurve:", v28);
  }

  return v30 ^ 1;
}

- (void)readNaturalLightingCharacteristicsWithReason:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDLightProfile readNaturalLightingCharacteristicsWithReason:completion:](self, "readNaturalLightingCharacteristicsWithReason:completion:", v5, &__block_literal_global_111_238781);
}

- (void)readNaturalLightingCharacteristicsWithReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDLightProfile *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDLightProfile readCharacteristicRequests](self, "readCharacteristicRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[HMDLightProfile hapAccessory](self, "hapAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v16;
        v28 = 2112;
        v29 = v9;
        v30 = 2112;
        v31 = v6;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending read requests to the accessory: %@ with reason: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      objc_initWeak((id *)buf, v13);
      objc_msgSend(v9, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryProfile description](v13, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __75__HMDLightProfile_readNaturalLightingCharacteristicsWithReason_completion___block_invoke;
      v23[3] = &unk_24E79AFA0;
      objc_copyWeak(&v25, (id *)buf);
      v24 = v7;
      objc_msgSend(v11, "readCharacteristicValues:source:sourceForLogging:qualityOfService:withCompletionHandler:", v17, 7, v18, -1, v23);

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v21;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Home is not configured on the accessory", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v22);

    }
  }
  else
  {
    -[HMDLightProfile availableCharacteristics](self, "availableCharacteristics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfile updateSettingsWithCharacteristics:](self, "updateSettingsWithCharacteristics:", v19);

    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v20);

  }
}

- (BOOL)updateActiveTransitionCountWithCharacteristic:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  HMDLightProfile *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  BOOL v16;
  uint64_t v18;
  void *v19;
  HMDLightProfile *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  _BYTE v26[10];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (!v8)
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
      *(_QWORD *)v26 = v6;
      *(_WORD *)&v26[8] = 2112;
      v27 = objc_opt_class();
      v13 = "%{public}@Active transition count value: %@ is not of type %@";
      v14 = v11;
      v15 = 32;
      goto LABEL_11;
    }
LABEL_12:

    objc_autoreleasePoolPop(v9);
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  if (objc_msgSend(v8, "integerValue") < 0 || objc_msgSend(v8, "integerValue") >= 256)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v12;
      v25 = 2048;
      *(_QWORD *)v26 = objc_msgSend(v8, "integerValue");
      v13 = "%{public}@Active transition count value: %ld is less than 0 or greater than 255";
      v14 = v11;
      v15 = 22;
LABEL_11:
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v23, v15);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v18 = objc_msgSend(v8, "unsignedCharValue");
  if (-[HMDLightProfile activeTransitionsCount](self, "activeTransitionsCount") == (_DWORD)v18)
    goto LABEL_13;
  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v22;
    v25 = 1024;
    *(_DWORD *)v26 = -[HMDLightProfile activeTransitionsCount](v20, "activeTransitionsCount");
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v18;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating active transition count from (%u -> %u)", (uint8_t *)&v23, 0x18u);

  }
  objc_autoreleasePoolPop(v19);
  -[HMDLightProfile setActiveTransitionsCount:](v20, "setActiveTransitionsCount:", v18);
  v16 = 1;
LABEL_14:

  return v16;
}

- (void)updateSettingsWithCharacteristics:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  HMDLightProfile *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_114);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[HMDLightProfile updateActiveTransitionCountWithCharacteristic:](self, "updateActiveTransitionCountWithCharacteristic:", v6);
  -[HMDLightProfile settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfile naturalLightingActiveTransitionContext](self, "naturalLightingActiveTransitionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfile updateSupportedFeaturesWithCharacteristics:](self, "updateSupportedFeaturesWithCharacteristics:", v4);
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_115_238773);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfile updateNaturalLightingEnabledForCharacteristic:](self, "updateNaturalLightingEnabledForCharacteristic:", v9);
  -[HMDLightProfile notifyClientsOfUpdatedSettingsWithPreviousSettings:](self, "notifyClientsOfUpdatedSettingsWithPreviousSettings:", v7);
  -[HMDLightProfile naturalLightingActiveTransitionContext](self, "naturalLightingActiveTransitionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = HMFEqualObjects();

  if ((v11 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLightProfile naturalLightingActiveTransitionContext](v13, "naturalLightingActiveTransitionContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v15;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating natural lighting active transition context from %@ -> %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDLightProfile naturalLightingCurveWriter](v13, "naturalLightingCurveWriter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfile naturalLightingActiveTransitionContext](v13, "naturalLightingActiveTransitionContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleActiveTransitionContextUpdated:", v18);

  }
}

- (void)synchronizeCurveToAccessory
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  HMDLightProfile *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDLightProfile naturalLightingCurve](self, "naturalLightingCurve");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        v6 = -[HMDLightProfile isNaturalLightingEnabled](self, "isNaturalLightingEnabled"),
        v5,
        v6))
  {
    -[HMDLightProfile naturalLightingCurveWriter](self, "naturalLightingCurveWriter");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfile naturalLightingActiveTransitionContext](self, "naturalLightingActiveTransitionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "synchronizeCurveWithActiveTransitionContext:", v7);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLightProfile isNaturalLightingEnabled](v9, "isNaturalLightingEnabled");
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLightProfile naturalLightingCurve](v9, "naturalLightingCurve");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not rewriting curve because either natural lighting is disabled: %@ or curve is nil: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
}

- (BOOL)updateEnabledCharacteristicsNotifications
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  HMDLightProfile *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDLightProfile *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDLightProfile availableCharacteristics](self, "availableCharacteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_116_238768);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[HMDLightProfile characteristicValueObservers](self, "characteristicValueObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v24;
      v25 = "%{public}@Not enabling characteristic notifications because there are no Characteristic value observers";
LABEL_13:
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v27, 0xCu);

    }
LABEL_14:

    objc_autoreleasePoolPop(v21);
    v11 = 0;
    goto LABEL_15;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v24;
      v25 = "%{public}@Did not find any characteristics to enable notifications";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v9 = objc_msgSend(v6, "count");
  -[HMDLightProfile notificationEnabledCharacteristics](self, "notificationEnabledCharacteristics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 != objc_msgSend(v10, "count");

  v12 = (void *)MEMORY[0x227676638](-[HMDLightProfile setNotificationEnabledCharacteristics:](self, "setNotificationEnabledCharacteristics:", v6));
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfile notificationEnabledCharacteristics](v13, "notificationEnabledCharacteristics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Enabling notifications for natural lighting characteristics: %@", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDLightProfile hapAccessory](v13, "hapAccessory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfile notificationEnabledCharacteristics](v13, "notificationEnabledCharacteristics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfile clientIdentifier](v13, "clientIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 1, v19, v20);

LABEL_15:
  return v11;
}

- (BOOL)enableNaturalLightingCharacteristicNotificationsForObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDLightProfile *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
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
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDLightProfile characteristicValueObservers](self, "characteristicValueObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfile characteristicValueObservers](v9, "characteristicValueObservers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = v11;
    v23 = 2112;
    v24 = v4;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding Characteristic value observer: %@ to current observers: %@", (uint8_t *)&v21, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDLightProfile characteristicValueObservers](v9, "characteristicValueObservers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v4);

  if (v7)
  {
    v14 = 0;
  }
  else
  {
    -[HMDLightProfile hapAccessory](v9, "hapAccessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v9, sel_handleAccessoryUnconfigured_, CFSTR("HMDAccessoryDisconnectedNotification"), v15);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v9, sel_handleAccessoryCharacteristicsChanged_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v15);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v9, sel_handleHomeNaturalLightingContextUpdated_, CFSTR("HMDHomeNaturalLightingContextUpdatedNotification"), v16);

    v14 = -[HMDLightProfile updateEnabledCharacteristicsNotifications](v9, "updateEnabledCharacteristicsNotifications");
  }

  return v14;
}

- (void)disableNaturalLightingCharacteristicNotificationsForObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDLightProfile *v7;
  NSObject *v8;
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
  uint64_t v20;
  void *v21;
  HMDLightProfile *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
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
    -[HMDLightProfile characteristicValueObservers](v7, "characteristicValueObservers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543874;
    v31 = v9;
    v32 = 2112;
    v33 = v4;
    v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing Characteristic value observer: %@ from current observers: %@", (uint8_t *)&v30, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDLightProfile characteristicValueObservers](v7, "characteristicValueObservers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", v4);

  -[HMDLightProfile characteristicValueObservers](v7, "characteristicValueObservers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    -[HMDLightProfile hapAccessory](v7, "hapAccessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObserver:name:object:", v7, CFSTR("HMDAccessoryDisconnectedNotification"), v14);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObserver:name:object:", v7, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v14);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObserver:name:object:", v7, CFSTR("HMDHomeNaturalLightingContextUpdatedNotification"), v15);

    -[HMDLightProfile notificationEnabledCharacteristics](v7, "notificationEnabledCharacteristics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v7;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    if (v20)
    {
      if (v24)
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v25;
        v32 = 2112;
        v33 = v19;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Disabling notifications for natural lighting characteristics: %@", (uint8_t *)&v30, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v19, "allObjects");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLightProfile clientIdentifier](v22, "clientIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 0, v26, v27);

      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLightProfile setNotificationEnabledCharacteristics:](v22, "setNotificationEnabledCharacteristics:", v28);

    }
    else
    {
      if (v24)
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543362;
        v31 = v29;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Did not find any characteristics to disable notifications", (uint8_t *)&v30, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
    }

  }
}

- (void)setNaturalLightingEnabled:(BOOL)a3 shouldRetryOnFailure:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  HMDLightProfile *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDNaturalLightingEnabledRetryContext *v17;
  void *v18;
  HMDLightProfile *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v5 = a4;
  v6 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *))a5;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[HMDLightProfile resetNaturalLightingEnabledRetryContext](self, "resetNaturalLightingEnabledRetryContext");
  -[HMDLightProfile settings](self, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "supportedFeatures");

  if ((v11 & 1) != 0)
  {
    if (v5)
    {
      v17 = -[HMDNaturalLightingEnabledRetryContext initWithNaturalLightingEnabled:completion:retryCount:]([HMDNaturalLightingEnabledRetryContext alloc], "initWithNaturalLightingEnabled:completion:retryCount:", v6, v8, 0);
      -[HMDLightProfile setNaturalLightingEnabledRetryContext:](self, "setNaturalLightingEnabledRetryContext:", v17);

      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLightProfile naturalLightingEnabledRetryContext](v19, "naturalLightingEnabledRetryContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v21;
        v25 = 2112;
        v26 = v22;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Created natural lighting enabled retry context: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
    }
    -[HMDLightProfile naturalLightingEnabledRetryContext](self, "naturalLightingEnabledRetryContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfile setNaturalLightingEnabled:completion:retryContext:](self, "setNaturalLightingEnabled:completion:retryContext:", v6, v8, v16);
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
      v23 = 138543362;
      v24 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Natural lighting feature is not supported", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v16);
  }

}

- (void)setNaturalLightingEnabled:(BOOL)a3 completion:(id)a4 retryContext:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDLightProfile *v12;
  NSObject *v13;
  void *v14;
  HMDLightProfile *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDLightProfile *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  BOOL v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  HMDLightProfile *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v6 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v15 = (HMDLightProfile *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v14;
    v32 = 2112;
    v33 = v15;
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Setting natural lighting enabled: %@ with retry context: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDAccessoryProfile accessory](v12, "accessory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_initWeak((id *)buf, v12);
    objc_msgSend(v17, "naturalLightingCurveWriter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __69__HMDLightProfile_setNaturalLightingEnabled_completion_retryContext___block_invoke;
    v25[3] = &unk_24E798C18;
    objc_copyWeak(&v28, (id *)buf);
    v29 = v6;
    v27 = v8;
    v26 = v9;
    objc_msgSend(v18, "setNaturalLightingEnabled:forLightProfiles:completion:", v6, v19, v25);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v12;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v23;
      v32 = 2112;
      v33 = v21;
      v34 = 2112;
      v35 = v16;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Home on accessory with light profile is not set %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfile callSetNaturalLightingEnabledCompletion:error:](v21, "callSetNaturalLightingEnabledCompletion:error:", v8, v24);

  }
}

- (void)retrySetNaturalLightingEnabledWithContext:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  HMDLightProfile *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDLightProfile *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33[2];
  char v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "naturalLightingEnabled");
  -[HMDLightProfile dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "naturalLightingEnabledMaxRetryCount");

  -[HMDLightProfile dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "naturalLightingEnabledRetryInterval");
  v15 = v14;

  if (v12 < 1 || *(double *)&v15 <= 0.0)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v22;
      v37 = 2048;
      v38 = v12;
      v39 = 2048;
      v40 = (uint64_t)v15;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Skipping retry because either retry count: %ld or retry interval: %f is less than or equal to 0", buf, 0x20u);

    }
    goto LABEL_6;
  }
  -[HMDLightProfile naturalLightingEnabledRetryContext](self, "naturalLightingEnabledRetryContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "retryCount") + 1;

  if (v17 > v12)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v21;
      v37 = 2112;
      v38 = (uint64_t)v6;
      v39 = 2048;
      v40 = v12;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to set Natural Lighting enabled for retry context: %@ exhausted retry attempts: %lu", buf, 0x20u);

    }
LABEL_6:

    objc_autoreleasePoolPop(v18);
    -[HMDLightProfile callSetNaturalLightingEnabledCompletion:error:](v19, "callSetNaturalLightingEnabledCompletion:error:", v9, v7);
    goto LABEL_13;
  }
  -[HMDLightProfile naturalLightingEnabledRetryContext](self, "naturalLightingEnabledRetryContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setRetryCount:", v17);

  v24 = (void *)MEMORY[0x227676638]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v27;
    v37 = 2112;
    v38 = (uint64_t)v6;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Will retry set Natural Lighting enabled with retry context: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  objc_initWeak((id *)buf, v25);
  -[HMDLightProfile dataSource](v25, "dataSource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile workQueue](v25, "workQueue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __67__HMDLightProfile_retrySetNaturalLightingEnabledWithContext_error___block_invoke;
  v30[3] = &unk_24E798C40;
  objc_copyWeak(v33, (id *)buf);
  v31 = v6;
  v32 = v9;
  v33[1] = v15;
  v34 = v10;
  objc_msgSend(v28, "dispatchAfterTimeInterval:queue:block:", v29, v30, *(double *)&v15);

  objc_destroyWeak(v33);
  objc_destroyWeak((id *)buf);
LABEL_13:

}

- (BOOL)shouldRetrySetNaturalLightingEnabledWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD5BD8]))
  {

    goto LABEL_5;
  }
  v7 = objc_msgSend(v4, "code");

  if (v7 != 4)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v8 = 1;
LABEL_6:

  return v8;
}

- (void)callSetNaturalLightingEnabledCompletion:(id)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  void (**v8)(id, id);

  v6 = a4;
  v8 = (void (**)(id, id))a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDLightProfile setNaturalLightingEnabledRetryContext:](self, "setNaturalLightingEnabledRetryContext:", 0);
  v8[2](v8, v6);

}

- (NSSet)availableCharacteristics
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HMDLightProfile characteristicsAvailabilityListener](self, "characteristicsAvailabilityListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableCharacteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__HMDLightProfile_availableCharacteristics__block_invoke;
  v7[3] = &unk_24E798C68;
  v7[4] = self;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDLightProfile;
  v4 = a3;
  -[HMDAccessoryProfile encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMDLightProfile settings](self, "settings", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x24BDD6518]);

}

- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  _QWORD v15[5];

  v5 = a4;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__HMDLightProfile_listener_didUpdateAvailableCharacteristics___block_invoke;
  v15[3] = &unk_24E798C68;
  v15[4] = self;
  objc_msgSend(v5, "na_filter:", v15);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "na_firstObjectPassingTest:", &__block_literal_global_128_238739);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfile setBrightnessCharacteristic:](self, "setBrightnessCharacteristic:", v7);

  objc_msgSend(v14, "na_firstObjectPassingTest:", &__block_literal_global_129_238740);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfile setColorTemperatureCharacteristic:](self, "setColorTemperatureCharacteristic:", v8);

  -[HMDLightProfile updateNaturalLightingCurve](self, "updateNaturalLightingCurve");
  -[HMDLightProfile updateSettingsWithCharacteristics:](self, "updateSettingsWithCharacteristics:", v14);
  -[HMDLightProfile updateEnabledCharacteristicsNotifications](self, "updateEnabledCharacteristicsNotifications");
  -[HMDLightProfile readCharacteristicRequests](self, "readCharacteristicRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_map:", &__block_literal_global_131_238741);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDLightProfile characteristicValueObservers](self, "characteristicValueObservers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    -[HMDLightProfile readCharacteristics](self, "readCharacteristics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", v10);

    if ((v13 & 1) == 0)
      -[HMDLightProfile readNaturalLightingCharacteristicsWithReason:](self, "readNaturalLightingCharacteristicsWithReason:", CFSTR("Characteristic notifications enabled"));
  }
  else
  {

  }
}

- (id)updateSettingsWithReadCharacteristicResponsePayload:(id)a3 error:(id *)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  id v27;
  void *v28;
  HMDLightProfile *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  HMDLightProfile *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDLightProfile *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  HMDLightProfile *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  id *v51;
  void *v52;
  id v53;
  void *v54;
  HMDLightProfile *v55;
  NSObject *v56;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  HMDLightProfile *v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v70;
  HMDLightProfile *v71;
  id *v72;
  id obj;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  id v83;
  __int16 v84;
  id v85;
  __int16 v86;
  uint64_t v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v74 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDLightProfile readCharacteristicRequests](self, "readCharacteristicRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_135_238730);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfile setReadCharacteristics:](self, "setReadCharacteristics:", v41);

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v42 = (void *)MEMORY[0x227676638]();
    v43 = self;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v81 = v45;
      _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Read characteristics disappeared from the light profile", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v42);
LABEL_54:
    v62 = 0;
    goto LABEL_55;
  }
  v72 = a4;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
  if (!v9)
    goto LABEL_24;
  v10 = v9;
  v11 = *(_QWORD *)v77;
  v70 = v8;
  v71 = self;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v77 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
      v75 = 0;
      objc_msgSend(v74, "hmd_valueOfCharacteristic:error:", v13, &v75, v70);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v75;
      if (!v14)
      {
        v46 = (void *)MEMORY[0x227676638]();
        v47 = v71;
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v81 = v49;
          v82 = 2112;
          v83 = v13;
          v84 = 2112;
          v85 = v15;
          _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Read request failed for characteristic failed %@:%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v46);
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLightProfile setReadCharacteristics:](v47, "setReadCharacteristics:", v50);

        v51 = v72;
        v52 = obj;
        if (v72)
        {
          v53 = objc_retainAutorelease(v15);
          v15 = v53;
          v18 = 0;
          goto LABEL_51;
        }
        v18 = 0;
        goto LABEL_52;
      }
      objc_msgSend(v13, "type");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("0000024B-0000-1000-8000-0026BB765291"));

      if (v17)
      {
        v18 = v14;
        objc_opt_class();
        v19 = objc_opt_isKindOfClass() & 1;
        if (v19)
          v20 = v18;
        else
          v20 = 0;
        v21 = v20;

        if (!v19)
        {
          v54 = (void *)MEMORY[0x227676638]();
          v55 = v71;
          HMFGetOSLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_opt_class();
            *(_DWORD *)buf = 138544130;
            v81 = v58;
            v82 = 2112;
            v83 = v13;
            v84 = 2112;
            v85 = v18;
            v86 = 2112;
            v87 = v59;
            _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@Value of characteristic: %@ is not of expected type %@:%@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v54);
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDLightProfile setReadCharacteristics:](v55, "setReadCharacteristics:", v60);

          goto LABEL_49;
        }
      }
      else
      {
        objc_msgSend(v13, "type");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "isEqualToString:", CFSTR("00000143-0000-1000-8000-0026BB765291")))
        {

        }
        else
        {
          objc_msgSend(v13, "type");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("00000144-0000-1000-8000-0026BB765291"));

          if (!v24)
            goto LABEL_22;
        }
        v18 = v14;
        objc_opt_class();
        v25 = objc_opt_isKindOfClass() & 1;
        if (v25)
          v26 = v18;
        else
          v26 = 0;
        v27 = v26;

        if (!v25)
        {
          v63 = (void *)MEMORY[0x227676638]();
          v64 = v71;
          HMFGetOSLogHandle();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_opt_class();
            *(_DWORD *)buf = 138544130;
            v81 = v66;
            v82 = 2112;
            v83 = v13;
            v84 = 2112;
            v85 = v18;
            v86 = 2112;
            v87 = v67;
            _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_ERROR, "%{public}@Value of characteristic: %@ is not of expected type %@:%@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v63);
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDLightProfile setReadCharacteristics:](v64, "setReadCharacteristics:", v68);

LABEL_49:
          v51 = v72;
          v52 = obj;
          if (v72)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 43);
            v53 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:
            v8 = v70;
            *v51 = v53;
LABEL_53:

            goto LABEL_54;
          }
LABEL_52:
          v8 = v70;
          goto LABEL_53;
        }
      }

LABEL_22:
    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
    v8 = v70;
    self = v71;
    if (v10)
      continue;
    break;
  }
LABEL_24:

  v28 = (void *)MEMORY[0x227676638](-[HMDLightProfile setReadCharacteristics:](self, "setReadCharacteristics:", obj));
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v81 = v31;
    v82 = 2112;
    v83 = obj;
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Successfully handled read response payload for characteristics:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  -[HMDLightProfile hapAccessory](v29, "hapAccessory");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "home");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "naturalLightingContext");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[HMDLightProfile naturalLightingCurve](v29, "naturalLightingCurve");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = v29;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v81 = v40;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Initialize the curve before updating settings", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v37);
      -[HMDLightProfile updateNaturalLightingCurve](v38, "updateNaturalLightingCurve");
    }
  }
  else
  {

  }
  -[HMDLightProfile availableCharacteristics](v29, "availableCharacteristics");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfile updateSettingsWithCharacteristics:](v29, "updateSettingsWithCharacteristics:", v61);

  -[HMDLightProfile settings](v29, "settings");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_55:

  return v62;
}

- (NSSet)readCharacteristicRequests
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HMDLightProfile availableCharacteristics](self, "availableCharacteristics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_137_238729);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count") == 3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSSet *)v5;
}

- (HMLightProfileSettings)settings
{
  return (HMLightProfileSettings *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD7750]), "initWithSupportedFeatures:naturalLightingEnabled:", -[HMDLightProfile supportedFeatures](self, "supportedFeatures"), -[HMDLightProfile isNaturalLightingEnabled](self, "isNaturalLightingEnabled"));
}

- (void)setNaturalLightingEnabled:(BOOL)a3 completion:(id)a4
{
  -[HMDLightProfile setNaturalLightingEnabled:shouldRetryOnFailure:completion:](self, "setNaturalLightingEnabled:shouldRetryOnFailure:completion:", a3, 0, a4);
}

- (NSDate)mostRecentNaturalLightingEnabledDate
{
  void *v3;
  HMDLightProfile *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if ((-[HMDLightProfile supportedFeatures](self, "supportedFeatures") & 1) != 0)
  {
    -[HMDLightProfile lastNaturalLightingEnabledDate](self, "lastNaturalLightingEnabledDate");
    return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Returning mostRecentNaturalLightingEnabledDate with nil since feature is not supported", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    return (NSDate *)0;
  }
}

- (NSDate)mostRecentNaturalLightingUsedDate
{
  void *v3;
  HMDLightProfile *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if ((-[HMDLightProfile supportedFeatures](self, "supportedFeatures") & 1) != 0)
  {
    -[HMDLightProfile lastNaturalLightingUsedDate](self, "lastNaturalLightingUsedDate");
    return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Returning mostRecentNaturalLightingUsedDate with nil since feature is not supported", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    return (NSDate *)0;
  }
}

- (void)setNaturalLightingCharacteristicsNotificationEnabled:(BOOL)a3 forObserver:(id)a4
{
  NSObject *v6;
  _BOOL4 v7;
  id v8;

  v8 = a4;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (a3)
  {
    v7 = -[HMDLightProfile enableNaturalLightingCharacteristicNotificationsForObserver:](self, "enableNaturalLightingCharacteristicNotificationsForObserver:", v8);

    if (v7)
      -[HMDLightProfile readNaturalLightingCharacteristicsWithReason:](self, "readNaturalLightingCharacteristicsWithReason:", CFSTR("Characteristic notifications enabled"));
  }
  else
  {
    -[HMDLightProfile disableNaturalLightingCharacteristicNotificationsForObserver:](self, "disableNaturalLightingCharacteristicNotificationsForObserver:", v8);

  }
}

- (void)fetchNaturalLightingEnabledWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__HMDLightProfile_fetchNaturalLightingEnabledWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAccessoryUnconfigured:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__HMDLightProfile_handleAccessoryUnconfigured___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAccessoryCharacteristicsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMDLightProfile_handleAccessoryCharacteristicsChanged___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleHomeDidEnableCharacteristicNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HMDLightProfile_handleHomeDidEnableCharacteristicNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleHomeDidDisableCharacteristicNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__HMDLightProfile_handleHomeDidDisableCharacteristicNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleHomeNaturalLightingContextUpdated:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryProfile workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HMDLightProfile_handleHomeNaturalLightingContextUpdated___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleAccessorySupportsNaturalLightingDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDLightProfile *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  HMDLightProfile *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (objc_msgSend(v7, "supportsCHIP") && (_os_feature_enabled_impl() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Not handling SupportsNaturalLighting change for matter accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    -[HMDAccessoryProfile workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __79__HMDLightProfile_handleAccessorySupportsNaturalLightingDidChangeNotification___block_invoke;
    v13[3] = &unk_24E79C268;
    v14 = v7;
    v15 = self;
    dispatch_async(v8, v13);

  }
}

- (void)handleAccessoryNaturalLightingEnabledDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  HMDLightProfile *v11;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __78__HMDLightProfile_handleAccessoryNaturalLightingEnabledDidChangeNotification___block_invoke;
  v9[3] = &unk_24E79C268;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (BOOL)supportsCHIP
{
  void *v2;
  char v3;

  -[HMDLightProfile hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsCHIP");

  return v3;
}

- (void)handleSetNaturalLightingEnabledMessageForMatterAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[HMDLightProfile hapAccessory](self, "hapAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isCurrentDeviceConfirmedPrimaryResident"))
  {
    -[HMDLightProfile matterCurveWriter](self, "matterCurveWriter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v11);

      goto LABEL_6;
    }
    -[HMDLightProfile matterCurveWriter](self, "matterCurveWriter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleSetNaturalLightingEnabledMessage:lightProfile:", v4, self);
  }
  else
  {
    v8 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __76__HMDLightProfile_handleSetNaturalLightingEnabledMessageForMatterAccessory___block_invoke;
    v12[3] = &unk_24E798D90;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    objc_msgSend(v8, "setResponseHandler:", v12);
    -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryProfile workQueue](self, "workQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "redispatchToResidentMessage:target:responseQueue:", v8, v9, v10);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

LABEL_6:
}

- (void)updateSettingsWithNaturalLightingSupported:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDLightProfile *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDLightProfile settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfile settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportedFeatures");

  if (((v8 & 1) == 0) == v3)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating supported features with natural lighting supported: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDLightProfile setSupportedFeatures:](v10, "setSupportedFeatures:", v3);
    -[HMDLightProfile setNaturalLightingSupported:](v10, "setNaturalLightingSupported:", v3);
    -[HMDLightProfile notifyClientsOfUpdatedSettingsWithPreviousSettings:](v10, "notifyClientsOfUpdatedSettingsWithPreviousSettings:", v6);
    -[HMDLightProfile hapAccessory](v10, "hapAccessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "supportsNaturalLighting");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16 != v3)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v14, "saveSupportsNaturalLighting:", v17);

    }
  }

}

- (void)updateSettingsWithNaturalLightingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDLightProfile *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDLightProfile *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  void *v24;
  HMDLightProfile *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v3 = a3;
  v38 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDLightProfile hapAccessory](self, "hapAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v10;
    v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@updateSettingsWithNaturalLightingEnabled naturalLightingEnabled: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDLightProfile settings](v8, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDLightProfile isNaturalLightingEnabled](v8, "isNaturalLightingEnabled") != v3)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v8;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLightProfile isNaturalLightingEnabled](v14, "isNaturalLightingEnabled");
      HMFBooleanToString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v16;
      v34 = 2112;
      v35 = v17;
      v36 = 2112;
      v37 = v18;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating naturalLightingEnabled from: %@ to: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v6, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isCurrentDeviceConfirmedPrimaryResident"))
    {
      objc_msgSend(v6, "naturalLightingEnabled");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLValue");

      if (v21 == v3)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v6, "saveNaturalLightingEnabled:", v19);
    }

LABEL_10:
    -[HMDLightProfile setNaturalLightingEnabled:](v14, "setNaturalLightingEnabled:", v3);
    v23 = -[HMDLightProfile notifyClientsOfUpdatedSettingsWithPreviousSettings:](v14, "notifyClientsOfUpdatedSettingsWithPreviousSettings:", v12);
    if (v3)
    {
      v24 = (void *)MEMORY[0x227676638](v23);
      v25 = v14;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v27;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Reading color temperature after natural lighting enabled", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      -[HMDLightProfile service](v25, "service");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "findCharacteristicWithType:", *MEMORY[0x24BDD57F0]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v31 = v29;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLightProfile readCharacteristics:](v25, "readCharacteristics:", v30);

      }
    }
  }

}

- (void)handleColorControlAttributeReport:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDLightProfile matterCurveWriter](self, "matterCurveWriter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDAccessoryProfile workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __53__HMDLightProfile_handleColorControlAttributeReport___block_invoke;
    v7[3] = &unk_24E79C268;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

- (id)setNaturalLightingEnabledForMatterLightProfile:(BOOL)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  BOOL v15;

  -[HMDLightProfile matterCurveWriter](self, "matterCurveWriter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE3F168]);
    -[HMDAccessoryProfile workQueue](self, "workQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithQueue:", v7);

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __66__HMDLightProfile_setNaturalLightingEnabledForMatterLightProfile___block_invoke;
    v14[3] = &unk_24E798DB8;
    v14[4] = self;
    v15 = a3;
    objc_msgSend(MEMORY[0x24BE3F180], "inContext:perform:", v8, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "futureWithError:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
}

- (void)readCharacteristics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDLightProfile *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "na_map:", &__block_literal_global_148_238692);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfile hapAccessory](self, "hapAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Sending read requests to read characteristics from the accessory: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_initWeak((id *)buf, v9);
    -[HMDAccessoryProfile description](v9, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __39__HMDLightProfile_readCharacteristics___block_invoke_149;
    v15[3] = &unk_24E798E20;
    objc_copyWeak(&v16, (id *)buf);
    objc_msgSend(v7, "readCharacteristicValues:source:sourceForLogging:qualityOfService:withCompletionHandler:", v5, 7, v13, -1, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Home is not configured on the accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (BOOL)isNaturalLightingEnabled
{
  return self->_naturalLightingEnabled;
}

- (void)setNaturalLightingEnabled:(BOOL)a3
{
  self->_naturalLightingEnabled = a3;
}

- (BOOL)isNaturalLightingSupported
{
  return self->_naturalLightingSupported;
}

- (void)setNaturalLightingSupported:(BOOL)a3
{
  self->_naturalLightingSupported = a3;
}

- (HMDNaturalLightingCurve)naturalLightingCurve
{
  return (HMDNaturalLightingCurve *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNaturalLightingCurve:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (HMDService)service
{
  return (HMDService *)objc_getProperty(self, a2, 72, 1);
}

- (NSSet)notificationEnabledCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNotificationEnabledCharacteristics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (unint64_t)supportedFeatures
{
  return self->_supportedFeatures;
}

- (void)setSupportedFeatures:(unint64_t)a3
{
  self->_supportedFeatures = a3;
}

- (HMDCharacteristicsAvailabilityListener)characteristicsAvailabilityListener
{
  return (HMDCharacteristicsAvailabilityListener *)objc_getProperty(self, a2, 96, 1);
}

- (HMDHAPAccessory)hapAccessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_hapAccessory);
}

- (void)setHapAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_hapAccessory, a3);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (HMDNaturalLightingCurveWriter)naturalLightingCurveWriter
{
  return (HMDNaturalLightingCurveWriter *)objc_getProperty(self, a2, 120, 1);
}

- (NSDate)lastNaturalLightingEnabledDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastNaturalLightingEnabledDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSDate)lastNaturalLightingUsedDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastNaturalLightingUsedDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (HMDLightProfileDataSource)dataSource
{
  return (HMDLightProfileDataSource *)objc_getProperty(self, a2, 144, 1);
}

- (HMDCharacteristic)brightnessCharacteristic
{
  return (HMDCharacteristic *)objc_getProperty(self, a2, 152, 1);
}

- (void)setBrightnessCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (HMDCharacteristic)colorTemperatureCharacteristic
{
  return (HMDCharacteristic *)objc_getProperty(self, a2, 160, 1);
}

- (void)setColorTemperatureCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSDate)lastNaturalLightingCurveUpdateDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLastNaturalLightingCurveUpdateDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (HMDNaturalLightingActiveTransitionContext)naturalLightingActiveTransitionContext
{
  return (HMDNaturalLightingActiveTransitionContext *)objc_getProperty(self, a2, 176, 1);
}

- (void)setNaturalLightingActiveTransitionContext:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (NSSet)readCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 184, 1);
}

- (void)setReadCharacteristics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (HMDNaturalLightingEnabledRetryContext)naturalLightingEnabledRetryContext
{
  return (HMDNaturalLightingEnabledRetryContext *)objc_getProperty(self, a2, 192, 1);
}

- (void)setNaturalLightingEnabledRetryContext:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (unsigned)activeTransitionsCount
{
  return self->_activeTransitionsCount;
}

- (void)setActiveTransitionsCount:(unsigned __int8)a3
{
  self->_activeTransitionsCount = a3;
}

- (NSHashTable)characteristicValueObservers
{
  return (NSHashTable *)objc_getProperty(self, a2, 200, 1);
}

- (void)setCharacteristicValueObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (HMDNaturalLightingMatterCurveWriter)matterCurveWriter
{
  return (HMDNaturalLightingMatterCurveWriter *)objc_getProperty(self, a2, 208, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matterCurveWriter, 0);
  objc_storeStrong((id *)&self->_characteristicValueObservers, 0);
  objc_storeStrong((id *)&self->_naturalLightingEnabledRetryContext, 0);
  objc_storeStrong((id *)&self->_readCharacteristics, 0);
  objc_storeStrong((id *)&self->_naturalLightingActiveTransitionContext, 0);
  objc_storeStrong((id *)&self->_lastNaturalLightingCurveUpdateDate, 0);
  objc_storeStrong((id *)&self->_colorTemperatureCharacteristic, 0);
  objc_storeStrong((id *)&self->_brightnessCharacteristic, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_lastNaturalLightingUsedDate, 0);
  objc_storeStrong((id *)&self->_lastNaturalLightingEnabledDate, 0);
  objc_storeStrong((id *)&self->_naturalLightingCurveWriter, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_destroyWeak((id *)&self->_hapAccessory);
  objc_storeStrong((id *)&self->_characteristicsAvailabilityListener, 0);
  objc_storeStrong((id *)&self->_notificationEnabledCharacteristics, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_naturalLightingCurve, 0);
}

void __39__HMDLightProfile_readCharacteristics___block_invoke_149(uint64_t a1)
{

}

HMDCharacteristicRequest *__39__HMDLightProfile_readCharacteristics___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", a2);
}

void __66__HMDLightProfile_setNaturalLightingEnabledForMatterLightProfile___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "matterCurveWriter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNaturalLightingEnabled:", *(unsigned __int8 *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;

  }
  else
  {
    v5 = _HMFPreconditionFailure();
    __53__HMDLightProfile_handleColorControlAttributeReport___block_invoke(v5);
  }
}

void __53__HMDLightProfile_handleColorControlAttributeReport___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "matterCurveWriter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleColorControlAttributeReport:", *(_QWORD *)(a1 + 40));

}

void __76__HMDLightProfile_handleSetNaturalLightingEnabledMessageForMatterAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "respondWithError:", v14);
LABEL_15:

    goto LABEL_16;
  }
  if (!v5)
  {
    objc_msgSend(v6, "hmf_dataForKey:", *MEMORY[0x24BDD6518]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, &v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v27;
    if (v15)
    {
      v17 = (void *)MEMORY[0x227676638](objc_msgSend(WeakRetained, "updateSettingsWithNaturalLightingEnabled:", objc_msgSend(v15, "isNaturalLightingEnabled")));
      v18 = WeakRetained;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = v16;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v20;
        v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Successfully updated natural lighting settings to: %@", buf, 0x16u);

        v16 = v25;
      }

      objc_autoreleasePoolPop(v17);
      objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:", v6);
    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = WeakRetained;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = v21;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v24;
        v30 = 2112;
        v31 = v16;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode natural lighting settings: %@", buf, 0x16u);

        v21 = v26;
      }

      objc_autoreleasePoolPop(v21);
      objc_msgSend(*(id *)(a1 + 32), "respondWithError:", v16);
    }

    goto LABEL_15;
  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    v32 = 2112;
    v33 = v5;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle message: %@ with error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 32), "respondWithError:", v5);
LABEL_16:

}

void __78__HMDLightProfile_handleAccessoryNaturalLightingEnabledDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "naturalLightingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "naturalLightingEnabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if ((_DWORD)v6 != objc_msgSend(*(id *)(a1 + 40), "isNaturalLightingEnabled"))
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v10;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling notification to update naturalLightingEnabled: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(*(id *)(a1 + 40), "setNaturalLightingEnabled:", v6);
      objc_msgSend(*(id *)(a1 + 40), "notifyClientsOfUpdatedSettingsWithPreviousSettings:", v4);
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "naturalLightingEnabled");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      v18 = 138543874;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@naturalLightingEnabled: %@ did change for accessory: %@ but context is not present", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
  }
}

void __79__HMDLightProfile_handleAccessorySupportsNaturalLightingDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "naturalLightingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportedFeatures");

    objc_msgSend(*(id *)(a1 + 32), "supportsNaturalLighting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (((((v6 & 1) == 0) ^ v8) & 1) == 0)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v12;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling notification to update supported features with natural lighting supported: %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(*(id *)(a1 + 40), "setSupportedFeatures:", v8);
      objc_msgSend(*(id *)(a1 + 40), "setNaturalLightingSupported:", v8);
      objc_msgSend(*(id *)(a1 + 40), "notifyClientsOfUpdatedSettingsWithPreviousSettings:", v4);
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "supportsNaturalLighting");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 32);
      v20 = 138543874;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@supportsNaturalLighting: %@ did change for accessory: %@ but context is not present", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }
}

void __59__HMDLightProfile_handleHomeNaturalLightingContextUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "updateNaturalLightingCurve"))
  {
    objc_msgSend(*(id *)(a1 + 32), "settings");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hapAccessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      v6 = v4 == 0;
    else
      v6 = 1;
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
        v21 = 138543362;
        v22 = v10;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Accessory or home is nil", (uint8_t *)&v21, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      if (objc_msgSend(v4, "isCurrentDeviceConfirmedPrimaryResident"))
      {
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v11, "availableCharacteristics");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateSupportedFeaturesWithCharacteristics:", v12);

      }
      else
      {
        objc_msgSend(v3, "supportsNaturalLighting");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setNaturalLightingSupported:", objc_msgSend(v13, "BOOLValue"));

        if (objc_msgSend(*(id *)(a1 + 32), "isNaturalLightingSupported")
          && (objc_msgSend(v5, "naturalLightingContext"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v14,
              v14))
        {
          v15 = (void *)MEMORY[0x227676638]();
          v16 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = 138543362;
            v22 = v18;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating supported features with natural lighting supported", (uint8_t *)&v21, 0xCu);

          }
          objc_autoreleasePoolPop(v15);
          v19 = *(void **)(a1 + 32);
          v20 = 1;
        }
        else
        {
          v19 = *(void **)(a1 + 32);
          v20 = 0;
        }
        objc_msgSend(v19, "setSupportedFeatures:", v20);
      }
      objc_msgSend(*(id *)(a1 + 32), "notifyClientsOfUpdatedSettingsWithPreviousSettings:", v2);
      objc_msgSend(*(id *)(a1 + 32), "synchronizeCurveToAccessory");
    }

  }
}

void __66__HMDLightProfile_handleHomeDidDisableCharacteristicNotification___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "disableNaturalLightingCharacteristicNotificationsForObserver:", v2);

}

void __65__HMDLightProfile_handleHomeDidEnableCharacteristicNotification___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enableNaturalLightingCharacteristicNotificationsForObserver:", v2);

}

uint64_t __57__HMDLightProfile_handleAccessoryCharacteristicsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAccessoryCharacteristicsChanged:", *(_QWORD *)(a1 + 40));
}

void __47__HMDLightProfile_handleAccessoryUnconfigured___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling accessory disconnected notification: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setReadCharacteristics:", v7);

}

void __61__HMDLightProfile_fetchNaturalLightingEnabledWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "characteristicValueObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "readCharacteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "readNaturalLightingCharacteristicsWithReason:completion:", CFSTR("Get up to date natural lighting enabled value"), *(_QWORD *)(a1 + 40));
    return;
  }
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@At least one characteristic value observer subscribed and last time read was successful, so returning the cached enabled value as it should be up to date", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v9 + 16))(v9, objc_msgSend(v10, "isNaturalLightingEnabled"), 0);

}

id __45__HMDLightProfile_readCharacteristicRequests__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("00000143-0000-1000-8000-0026BB765291")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("00000144-0000-1000-8000-0026BB765291")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("0000024B-0000-1000-8000-0026BB765291")))
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __77__HMDLightProfile_updateSettingsWithReadCharacteristicResponsePayload_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristic");
}

uint64_t __62__HMDLightProfile_listener_didUpdateAvailableCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __62__HMDLightProfile_listener_didUpdateAvailableCharacteristics___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristic");
}

uint64_t __62__HMDLightProfile_listener_didUpdateAvailableCharacteristics___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD57F0]);

  return v3;
}

uint64_t __62__HMDLightProfile_listener_didUpdateAvailableCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD57A0]);

  return v3;
}

uint64_t __43__HMDLightProfile_availableCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __67__HMDLightProfile_retrySetNaturalLightingEnabledWithContext_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = WeakRetained;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 56);
      v22 = 138543874;
      v23 = v6;
      v24 = 2112;
      v25 = v7;
      v26 = 2048;
      v27 = v8;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Retrying Natural Lighting enabled with retry context: %@ after %fs", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(v4, "naturalLightingEnabledRetryContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);

    if (v9 == v10)
    {
      objc_msgSend(v4, "setNaturalLightingEnabled:completion:retryContext:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    }
    else
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = v4;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "naturalLightingEnabledRetryContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 32);
        v22 = 138543874;
        v23 = v14;
        v24 = 2112;
        v25 = v15;
        v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Not retrying because retry context changed from (%@ -> %@)", (uint8_t *)&v22, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 32);
      v22 = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to set Natural Lighting enabled for retry context %@ because self is gone", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __69__HMDLightProfile_setNaturalLightingEnabled_completion_retryContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  void *v14;
  id v15;
  id v16;
  char v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__HMDLightProfile_setNaturalLightingEnabled_completion_retryContext___block_invoke_124;
    block[3] = &unk_24E798BF0;
    v13 = v3;
    v14 = v5;
    v17 = *(_BYTE *)(a1 + 56);
    v16 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

    v7 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v10;
      v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to write characteristic for Natural Lighting enabled: %{public}@ because self is gone", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __69__HMDLightProfile_setNaturalLightingEnabled_completion_retryContext___block_invoke_124(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully wrote characteristic for Natural Lighting enabled: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(*(id *)(a1 + 40), "handleSetNaturalLightingEnabled:", *(unsigned __int8 *)(a1 + 64));
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = 0;
    goto LABEL_11;
  }
  if (!*(_QWORD *)(a1 + 48)
    || (objc_msgSend(*(id *)(a1 + 40), "shouldRetrySetNaturalLightingEnabledWithError:", v2) & 1) == 0)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v6;
      v18 = 2114;
      v19 = v7;
      v20 = 2114;
      v21 = v2;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to write characteristic for Natural Lighting enabled: %{public}@ error: %{public}@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = v2;
LABEL_11:
    objc_msgSend(v8, "callSetNaturalLightingEnabledCompletion:error:", v9, v10);
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "retrySetNaturalLightingEnabledWithContext:error:", *(_QWORD *)(a1 + 48), v2);
LABEL_12:

}

uint64_t __60__HMDLightProfile_updateEnabledCharacteristicsNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("0000024B-0000-1000-8000-0026BB765291"));

  return v3;
}

uint64_t __53__HMDLightProfile_updateSettingsWithCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("00000143-0000-1000-8000-0026BB765291"));

  return v3;
}

uint64_t __53__HMDLightProfile_updateSettingsWithCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("0000024B-0000-1000-8000-0026BB765291"));

  return v3;
}

void __75__HMDLightProfile_readNaturalLightingCharacteristicsWithReason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75__HMDLightProfile_readNaturalLightingCharacteristicsWithReason_completion___block_invoke_2;
    v12[3] = &unk_24E798B60;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    v15 = *(id *)(a1 + 32);
    v13 = v6;
    v14 = v5;
    dispatch_async(v9, v12);

    objc_destroyWeak(&v16);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

  }
}

void __75__HMDLightProfile_readNaturalLightingCharacteristicsWithReason_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
LABEL_8:
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

    goto LABEL_11;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Received empty response payload for charactersitic read requests %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    goto LABEL_8;
  }
  v3 = *(_QWORD *)(a1 + 32);
  v15 = 0;
  objc_msgSend(WeakRetained, "updateSettingsWithReadCharacteristicResponsePayload:error:", v3, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v6 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, objc_msgSend(v4, "isNaturalLightingEnabled"), 0);
  else
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);

LABEL_11:
}

uint64_t __70__HMDLightProfile_availableCharacteristicWithType_fromChangedObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (v5 && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    objc_msgSend(v5, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

unint64_t __62__HMDLightProfile_updateSupportedFeaturesWithCharacteristics___block_invoke_103(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "HAPInstanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToNumber:", v6))
  {
    objc_msgSend(v3, "transitionTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = ((unint64_t)objc_msgSend(v7, "value") >> 1) & 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __62__HMDLightProfile_updateSupportedFeaturesWithCharacteristics___block_invoke_100(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("00000144-0000-1000-8000-0026BB765291"));

  return v3;
}

uint64_t __62__HMDLightProfile_updateSupportedFeaturesWithCharacteristics___block_invoke_98(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD57A0]);

  return v3;
}

uint64_t __62__HMDLightProfile_updateSupportedFeaturesWithCharacteristics___block_invoke_96(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD57F0]);

  return v3;
}

uint64_t __62__HMDLightProfile_updateSupportedFeaturesWithCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("00000143-0000-1000-8000-0026BB765291"));

  return v3;
}

void __58__HMDLightProfile_handleSetNaturalLightingEnabledMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
  }
  else
  {
    v6 = *MEMORY[0x24BDD6518];
    objc_msgSend(*(id *)(a1 + 40), "settings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObjectForIncomingXPCMessage(v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:", v5);
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t76 != -1)
    dispatch_once(&logCategory__hmf_once_t76, &__block_literal_global_132_238876);
  return (id)logCategory__hmf_once_v77;
}

void __30__HMDLightProfile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v77;
  logCategory__hmf_once_v77 = v0;

}

@end
