@implementation HMDAppleMediaAccessory

- (BOOL)supportsHomeHub
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  HMDAppleMediaAccessory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "supportsHomeHub");
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
      -[HMDAppleMediaAccessory device](v7, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = 0;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get supports home hub due to no capabilities or device: %@, capabilities: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (void)deleteSiriHistoryForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAppleMediaAccessory *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMDAppleMediaAccessory messenger](self, "messenger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "sendDeleteSiriHistoryRequestForAccessoryWithUUID:completionHandler:", v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get messenger to delete siri history for accessory with uuid: %@ error: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v7[2](v7, v10);

  }
}

- (HMDAppleMediaAccessory)accessoryWithUUID:(id)a3 forAppleMediaAccessoryLocalMessageHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoryWithUUID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDAppleMediaAccessory *)v7;
}

- (HMDAppleMediaAccessory)initWithTransaction:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMDAppleMediaAccessoryDependencyFactory *v8;
  HMDAppleMediaAccessory *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HMDAppleMediaAccessoryDependencyFactory);
  v9 = -[HMDAppleMediaAccessory initWithTransaction:home:dependencyFactory:](self, "initWithTransaction:home:dependencyFactory:", v7, v6, v8);

  return v9;
}

- (HMDAppleMediaAccessory)initWithTransaction:(id)a3 home:(id)a4 dependencyFactory:(id)a5
{
  HMDAppleMediaAccessory *v5;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  HMDAppleMediaAccessory *v24;
  NSObject *v25;
  void *v26;
  HMDAppleMediaAccessory *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  HMDAppleMediaAccessory *v33;
  uint64_t v34;
  OS_os_log *logger;
  void *v36;
  uint64_t v37;
  NSData *rawCapabilities;
  id v39;
  void *v40;
  uint64_t v41;
  HMAccessoryCapabilities *capabilitiesInternal;
  uint64_t v43;
  HMFSoftwareVersion *softwareVersion;
  uint64_t v45;
  HMFPairingIdentity *pairingIdentity;
  id settingsConnectionFactory;
  id deviceMediaRouteIdentifierFactory;
  void *v49;
  void *v50;
  uint64_t v51;
  HMDDeviceAddress *deviceAddress;
  uint64_t v53;
  NSData *deviceIRK;
  void *v55;
  HMDRemoteLoginHandler *v56;
  HMDRemoteLoginHandler *remoteLoginHandler;
  void *v58;
  HMDAppleMediaAccessorySleepWakeStateController *v59;
  void *v60;
  uint64_t v61;
  HMDAppleMediaAccessorySleepWakeStateController *sleepWakeStateController;
  void *v63;
  id v65;
  id v66;
  objc_super v67;
  uint8_t buf[4];
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    objc_msgSend(v14, "deviceUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v14, "deviceUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (HMDAppleMediaAccessory *)objc_msgSend(v16, "initWithUUIDString:", v17);

      objc_msgSend(v11, "deviceControllerWithDeviceIdentifier:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v14, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      if (!v15)
      {
        objc_msgSend(v14, "device");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deviceControllerWithDevice:", v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v14, "device");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateWithDevice:completionHandler:", v20, 0);

    }
    objc_msgSend(v14, "deviceAddress");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v15)
      goto LABEL_24;
    if (v21)
    {
      objc_msgSend(v11, "deviceWithAddress:", v21);
      v5 = (HMDAppleMediaAccessory *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        goto LABEL_21;
    }
    else
    {
      objc_msgSend(v14, "idsIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
        goto LABEL_21;
      objc_msgSend(v14, "idsIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deviceForIDSIdentifier:", v29);
      v5 = (HMDAppleMediaAccessory *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_21;
    }
    objc_msgSend(v11, "deviceControllerWithDevice:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
LABEL_24:

      v67.receiver = self;
      v67.super_class = (Class)HMDAppleMediaAccessory;
      v33 = -[HMDMediaAccessory initWithTransaction:home:](&v67, sel_initWithTransaction_home_, v12, v10);
      if (v33)
      {
        v66 = v10;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        logger = v33->_logger;
        v33->_logger = (OS_os_log *)v34;

        objc_msgSend(v14, "variant");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v33->_variant = objc_msgSend(v36, "unsignedIntegerValue");

        objc_msgSend(v14, "accessoryCapabilities");
        v37 = objc_claimAutoreleasedReturnValue();
        rawCapabilities = v33->_rawCapabilities;
        v33->_rawCapabilities = (NSData *)v37;

        v39 = objc_alloc(MEMORY[0x24BDD7330]);
        objc_msgSend(v14, "accessoryCapabilities");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v39, "initWithProtoData:", v40);
        capabilitiesInternal = v33->_capabilitiesInternal;
        v33->_capabilitiesInternal = (HMAccessoryCapabilities *)v41;

        objc_storeStrong((id *)&v33->_deviceController, v15);
        objc_msgSend(v14, "softwareVersion");
        v43 = objc_claimAutoreleasedReturnValue();
        softwareVersion = v33->_softwareVersion;
        v33->_softwareVersion = (HMFSoftwareVersion *)v43;

        objc_msgSend(v14, "pairingIdentity");
        v45 = objc_claimAutoreleasedReturnValue();
        pairingIdentity = v33->_pairingIdentity;
        v33->_pairingIdentity = (HMFPairingIdentity *)v45;

        settingsConnectionFactory = v33->_settingsConnectionFactory;
        v33->_settingsConnectionFactory = &__block_literal_global_129998;

        deviceMediaRouteIdentifierFactory = v33->_deviceMediaRouteIdentifierFactory;
        v33->_deviceMediaRouteIdentifierFactory = &__block_literal_global_185_129999;

        objc_msgSend(v14, "idsIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v49;
        if (!v49)
        {
          objc_msgSend(v14, "device");
          v5 = (HMDAppleMediaAccessory *)objc_claimAutoreleasedReturnValue();
          -[HMDAppleMediaAccessory idsIdentifier](v5, "idsIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_storeStrong((id *)&v33->_idsIdentifier, v50);
        if (!v49)
        {

        }
        objc_msgSend(v14, "deviceAddress");
        v51 = objc_claimAutoreleasedReturnValue();
        deviceAddress = v33->_deviceAddress;
        v33->_deviceAddress = (HMDDeviceAddress *)v51;

        objc_msgSend(v14, "deviceIRKData");
        v53 = objc_claimAutoreleasedReturnValue();
        deviceIRK = v33->_deviceIRK;
        v33->_deviceIRK = (NSData *)v53;

        objc_msgSend(v14, "loggedInAccount");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = -[HMDRemoteLoginHandler initWithAccessory:loggedInAccountData:]([HMDRemoteLoginHandler alloc], "initWithAccessory:loggedInAccountData:", v33, v55);
        remoteLoginHandler = v33->_remoteLoginHandler;
        v33->_remoteLoginHandler = v56;

        objc_msgSend(v14, "supportedStereoPairVersions");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v33->_supportedStereoPairVersions = objc_msgSend(v58, "unsignedIntegerValue");

        v59 = [HMDAppleMediaAccessorySleepWakeStateController alloc];
        -[HMDAccessory uuid](v33, "uuid");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[HMDAppleMediaAccessorySleepWakeStateController initWithAccessoryUUID:dataSource:](v59, "initWithAccessoryUUID:dataSource:", v60, v33);
        sleepWakeStateController = v33->_sleepWakeStateController;
        v33->_sleepWakeStateController = (HMDAppleMediaAccessorySleepWakeStateController *)v61;

        __bootstrapSupportedStereoPairVersions(v33);
        objc_msgSend(v14, "productColor");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v33->_productColor = objc_msgSend(v63, "unsignedIntegerValue");

        objc_storeStrong((id *)&v33->_dependencyFactory, a5);
        v10 = v66;
      }
      v24 = v33;

      v27 = v24;
      goto LABEL_31;
    }
LABEL_21:
    v30 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v65 = v10;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v32;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Unable to determine device", buf, 0xCu);

      v10 = v65;
    }

    objc_autoreleasePoolPop(v30);
    v15 = 0;
    goto LABEL_24;
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v69 = v26;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize an AppleMedia accessory without an AppleMedia model.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  v27 = 0;
LABEL_31:

  return v27;
}

- (HMDAppleMediaAccessory)initWithDependencyFactory:(id)a3 deviceMediaRouteIdentifierFactory:(id)a4
{
  id v7;
  id v8;
  HMDAppleMediaAccessory *v9;
  HMDAppleMediaAccessory *v10;
  void *v11;
  id deviceMediaRouteIdentifierFactory;

  v7 = a3;
  v8 = a4;
  v9 = -[HMDAppleMediaAccessory init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dependencyFactory, a3);
    if (v8)
    {
      v11 = _Block_copy(v8);
      deviceMediaRouteIdentifierFactory = v10->_deviceMediaRouteIdentifierFactory;
      v10->_deviceMediaRouteIdentifierFactory = v11;

    }
  }

  return v10;
}

- (HMDAppleMediaAccessory)init
{
  HMDAppleMediaAccessory *v2;
  uint64_t v3;
  OS_os_log *logger;
  id settingsConnectionFactory;
  id deviceMediaRouteIdentifierFactory;
  HMDAppleMediaAccessorySleepWakeStateController *v7;
  void *v8;
  uint64_t v9;
  HMDAppleMediaAccessorySleepWakeStateController *sleepWakeStateController;
  uint64_t v11;
  NSHashTable *hostedAccessories;
  HMDAppleMediaAccessoryDependencyFactory *v13;
  HMDAppleMediaAccessoryDependencyFactory *dependencyFactory;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HMDAppleMediaAccessory;
  v2 = -[HMDMediaAccessory init](&v16, sel_init);
  if (v2)
  {
    HMFGetOSLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    v2->_deviceReachable = 1;
    settingsConnectionFactory = v2->_settingsConnectionFactory;
    v2->_settingsConnectionFactory = &__block_literal_global_190_129992;

    deviceMediaRouteIdentifierFactory = v2->_deviceMediaRouteIdentifierFactory;
    v2->_deviceMediaRouteIdentifierFactory = &__block_literal_global_191_129993;

    v7 = [HMDAppleMediaAccessorySleepWakeStateController alloc];
    -[HMDAccessory uuid](v2, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDAppleMediaAccessorySleepWakeStateController initWithAccessoryUUID:dataSource:](v7, "initWithAccessoryUUID:dataSource:", v8, v2);
    sleepWakeStateController = v2->_sleepWakeStateController;
    v2->_sleepWakeStateController = (HMDAppleMediaAccessorySleepWakeStateController *)v9;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    hostedAccessories = v2->_hostedAccessories;
    v2->_hostedAccessories = (NSHashTable *)v11;

    v2->_productColor = 0;
    objc_storeWeak((id *)&v2->_mediaDestinationControllerFactory, v2);
    objc_storeWeak((id *)&v2->_mediaDestinationManagerFactory, v2);
    v13 = objc_alloc_init(HMDAppleMediaAccessoryDependencyFactory);
    dependencyFactory = v2->_dependencyFactory;
    v2->_dependencyFactory = v13;

  }
  return v2;
}

- (HMDAppleMediaAccessory)initWithDeviceController:(id)a3 deviceIdentifierFactory:(id)a4
{
  id v7;
  id v8;
  HMDAppleMediaAccessory *v9;
  HMDAppleMediaAccessory *v10;
  void *v11;
  id deviceMediaRouteIdentifierFactory;

  v7 = a3;
  v8 = a4;
  v9 = -[HMDAppleMediaAccessory init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceController, a3);
    v11 = _Block_copy(v8);
    deviceMediaRouteIdentifierFactory = v10->_deviceMediaRouteIdentifierFactory;
    v10->_deviceMediaRouteIdentifierFactory = v11;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HMDAppleMediaAccessory targetControlManager](self, "targetControlManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[HMDAppleMediaAccessory setTargetControlManager:](self, "setTargetControlManager:", 0);
  v5.receiver = self;
  v5.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v17 = (void *)MEMORY[0x24BDD17C8];
  v16 = objc_opt_class();
  -[HMDAccessory uuid](self, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaAccessory name](self, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory category](self, "category");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory softwareVersion](self, "softwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory softwareUpdate](self, "softwareUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    v7 = CFSTR(" isCurrent = YES,");
  else
    v7 = &stru_24E79DB48;
  -[HMDAppleMediaAccessory device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory room](self, "room");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@, UUID = %@, Name = %@, Identifier = %@, Category = %@, Version = %@, Update = %@, Stereo Pair Versions = %@,%@ Device = %@, Home = %@, RoomUUID = %@>"), v16, v15, v21, v3, v14, v4, v5, v6, v7, v8, v10, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory _registerForMessages](&v20, sel__registerForMessages);
  -[HMDAccessory msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isInternalBuild();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v6;
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD4BF8], self, v8, sel_handleFetchManagedConfigurationProfiles_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD4D98], self, v8, sel_handleRemoveManagedConfigurationProfile_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD4C38], self, v8, sel_handleInstallManagedConfigurationProfile_);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 4, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD6DE8], self, v12, sel__startUpdate_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD4B30], self, v12, sel_handleDeleteSiriHistoryRequest_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD5140], self, v12, sel_handleUpdatePreferredMediaUser_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD4FE0], self, v12, sel_handleSoftwareUpdateV2Scan_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD4FE8], self, v12, sel_handleSoftwareUpdateV2ScanRepeatedlyAndApplyMessage_);

  if (isInternalBuild())
  {
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    v22[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD5120], self, v15, sel__handleTriggerPairingIdentityUpdateNotification_);
  }
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v17;
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD7C10], self, v19, sel__handleAudioAnalysisBulletinBoardCommit_);
}

- (BOOL)_shouldFilterAccessoryProfileForUnentitledClients:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HMDAppleMediaAccessory;
    v5 = -[HMDMediaAccessory _shouldFilterAccessoryProfileForUnentitledClients:](&v7, sel__shouldFilterAccessoryProfileForUnentitledClients_, v4);
  }

  return v5;
}

- (BOOL)_shouldFilterAccessoryProfileForEntitledClients:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)HMDAppleMediaAccessory;
    v5 = -[HMDAccessory _shouldFilterAccessoryProfileForEntitledClients:](&v7, sel__shouldFilterAccessoryProfileForEntitledClients_, v4);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (HMDDoorbellChimeProfile)doorbellChimeProfile
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDAccessory accessoryProfiles](self, "accessoryProfiles", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v5)
        objc_enumerationMutation(v2);
      v7 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * v6);
      objc_opt_class();
      v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
      v9 = v8;

      if (v9)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v7 = 0;
  }

  return (HMDDoorbellChimeProfile *)v7;
}

- (void)_configureGroupParticipantLocalDataStorageWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDAppleMediaAccessory *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    if (isFeatureHomeTheaterQFAEnabledForTests
      && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
    }
    else
    {
      objc_msgSend(v4, "homeManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory msgDispatcher](self, "msgDispatcher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaGroupParticipantDataLocalStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v4 && v6 && v7)
      {
        objc_msgSend(v7, "configureWithHome:messageDispatcher:", v4, v6);
      }
      else
      {
        v9 = (void *)MEMORY[0x227676638]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138544386;
          v18 = v12;
          v19 = 2112;
          v20 = v4;
          v21 = 2112;
          v22 = v6;
          v23 = 2112;
          v24 = v8;
          v25 = 2112;
          v26 = v5;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to configure groups participant local data storage with dependencies home: %@ messageDispatcher: %@ dataStorage: %@ homeManager: %@", (uint8_t *)&v17, 0x34u);

        }
        objc_autoreleasePoolPop(v9);
      }

    }
  }

}

- (void)configureWithHome:(id)a3 msgDispatcher:(id)a4 configurationTracker:(id)a5 initialConfiguration:(BOOL)a6
{
  uint64_t v6;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDDoorbellChimeProfile *v32;
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
  void *v43;
  HMDAudioAnalysisEventSubscriber *v44;
  HMDAudioAnalysisEventSubscriberContext *v45;
  HMDAudioAnalysisEventSubscriberContext *v46;
  HMDAudioAnalysisEventSubscriber *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  HMDAppleMediaAccessory *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v59;
  void *v60;
  void *v61;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v62;
  void *v63;
  void *v64;
  HMDAppleMediaAccessory *v65;
  NSObject *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  __CFString *v71;
  __CFString *v72;
  HMDDevice *device;
  void *v74;
  void (**v75)(void);
  void *v76;
  int v77;
  NSObject *logger;
  NSObject *v79;
  void *v80;
  void *v81;
  HMDDeviceController *deviceController;
  void *v83;
  void *v84;
  HMDAppleMediaAccessory *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  HMDDeviceController *v89;
  HMDDeviceController *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  char v104;
  NSObject *v105;
  void *v106;
  HMDTargetControlManager *v107;
  void *v108;
  void *v109;
  HMDAppleMediaAccessoryMetricsDispatcher *v110;
  void *v111;
  void *v112;
  HMDAppleMediaAccessoryMetricsDispatcher *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  void *v119;
  NSObject *v120;
  NSObject *v121;
  id v122;
  void *v123;
  void *v124;
  NSObject *v125;
  void *v126;
  unsigned int v127;
  _QWORD v128[5];
  id v129;
  NSObject *v130;
  uint64_t v131;
  char v132;
  _QWORD block[5];
  _QWORD v134[5];
  _QWORD v135[5];
  unsigned __int8 v136;
  objc_super v137;
  uint8_t buf[4];
  void *v139;
  __int16 v140;
  const __CFString *v141;
  __int16 v142;
  const __CFString *v143;
  __int16 v144;
  const __CFString *v145;
  __int16 v146;
  const __CFString *v147;
  __int16 v148;
  const __CFString *v149;
  __int16 v150;
  void *v151;
  __int16 v152;
  const __CFString *v153;
  __int16 v154;
  void *v155;
  __int16 v156;
  const __CFString *v157;
  __int16 v158;
  void *v159;
  uint64_t v160;

  v6 = a6;
  v160 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = HMFUptime();
  v15 = v14;
  v127 = v6;
  v125 = v12;
  if ((_DWORD)v6)
  {
    v16 = (void *)MEMORY[0x227676638](v13);
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 0x24BDD1000;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory uuid](v17, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545922;
      v139 = v20;
      v140 = 2114;
      v141 = CFSTR("accessoryConfigureStart");
      v142 = 2112;
      v143 = CFSTR("Configuring accessory");
      v144 = 2114;
      v145 = CFSTR("state");
      v146 = 2112;
      v147 = CFSTR("start");
      v148 = 2114;
      v149 = CFSTR("homeUUID");
      v150 = 2112;
      v151 = v21;
      v152 = 2114;
      v153 = CFSTR("accessoryUUID");
      v154 = 2112;
      v155 = v22;
      v156 = 2114;
      v157 = CFSTR("initialConfig");
      v158 = 2112;
      v159 = v23;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x70u);

      v19 = 0x24BDD1000uLL;
    }

    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc(MEMORY[0x24BE4F1D0]);
    objc_msgSend(v10, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory uuid](v17, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v19 + 1760), "numberWithBool:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v25, "initWithTag:data:", CFSTR("accessoryConfigureStart"), v29, CFSTR("state"), CFSTR("start"), CFSTR("homeUUID"), v26, CFSTR("accessoryUUID"), v27, CFSTR("initialConfig"), v28);
    objc_msgSend(MEMORY[0x24BE3F138], "currentTagProcessorList");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "submitTaggedEvent:processorList:", v30, v31);

    v6 = v127;
    v12 = v125;
  }
  objc_msgSend(v10, "homeManager");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    dispatch_group_enter(v12);
  if (-[HMDAppleMediaAccessory isHomePod](self, "isHomePod"))
  {
    v32 = -[HMDDoorbellChimeProfile initWithAppleMediaAccessory:]([HMDDoorbellChimeProfile alloc], "initWithAppleMediaAccessory:", self);
    -[NSMutableSet addObject:](self->super.super._accessoryProfiles, "addObject:", v32);

  }
  v137.receiver = self;
  v137.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory configureWithHome:msgDispatcher:configurationTracker:initialConfiguration:](&v137, sel_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration_, v10, v11, v12, v6);
  -[HMDAppleMediaAccessory configureAppleMediaAccessoryMessengerWithFactory:](self, "configureAppleMediaAccessoryMessengerWithFactory:", self);
  objc_msgSend(v10, "wifiManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory setWifiManager:](self, "setWifiManager:", v33);

  -[HMDAppleMediaAccessory dependencyFactory](self, "dependencyFactory");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "darwinNotificationProviderForAccessory:", self);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory setDarwinNotificationProvider:](self, "setDarwinNotificationProvider:", v35);

  -[HMDAppleMediaAccessory remoteLoginHandler](self, "remoteLoginHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory workQueue](self, "workQueue");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory eventStoreReadHandle](self, "eventStoreReadHandle");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory eventForwarder](self, "eventForwarder");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "configureWithWorkQueue:messageDispatcher:eventStoreReadHandle:eventForwarder:", v37, v11, v38, v39);

  -[HMDAppleMediaAccessory dependencyFactory](self, "dependencyFactory");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "symptomsHandlerForAccessory:", self);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory setSymptomsHandler:](self, "setSymptomsHandler:", v41);

  -[HMDAppleMediaAccessory symptomsHandler](self, "symptomsHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "configure");

  -[HMDAppleMediaAccessory configureAudioDestinationManager](self, "configureAudioDestinationManager");
  -[HMDAppleMediaAccessory audioAnalysisEventSubscriber](self, "audioAnalysisEventSubscriber");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    goto LABEL_12;
  if (-[HMDAppleMediaAccessory isHomePod](self, "isHomePod"))
  {
    v44 = [HMDAudioAnalysisEventSubscriber alloc];
    v45 = [HMDAudioAnalysisEventSubscriberContext alloc];
    -[HMDAccessory workQueue](self, "workQueue");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[HMDAudioAnalysisEventSubscriberContext initWithAccessory:queue:](v45, "initWithAccessory:queue:", self, v43);
    v47 = -[HMDAudioAnalysisEventSubscriber initWithContext:](v44, "initWithContext:", v46);
    -[HMDAppleMediaAccessory setAudioAnalysisEventSubscriber:](self, "setAudioAnalysisEventSubscriber:", v47);

LABEL_12:
  }
  if (_os_feature_enabled_impl() && (isMac() || isiOSDevice()))
  {
    objc_msgSend(v10, "audioAnalysisBulletinNotificationManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "multipleLocalRegistrationsForAccessory:", self);

    v136 = 0;
    objc_msgSend(v10, "audioAnalysisBulletinNotificationManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localRegistrationForAccessory:enabled:", self, &v136);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v49 & 1) != 0 || !v51)
    {
      v124 = v51;
      v59 = [HMDAudioAnalysisEventBulletinNotificationRegistration alloc];
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory uuid](self, "uuid");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = -[HMDAudioAnalysisEventBulletinNotificationRegistration initWithConditions:audioAnalysisClassifierOptions:accessoryUUID:](v59, "initWithConditions:audioAnalysisClassifierOptions:accessoryUUID:", v60, 3, v61);

      -[HMDAudioAnalysisEventBulletinNotificationRegistration predicate](v62, "predicate");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory setAudioAnalysisEventNotificationCondition:](self, "setAudioAnalysisEventNotificationCondition:", v63);

      v64 = (void *)MEMORY[0x227676638](-[HMDAppleMediaAccessory setAudioAnalysisEventNotificationEnabled:](self, "setAudioAnalysisEventNotificationEnabled:", 1));
      v65 = self;
      HMFGetOSLogHandle();
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
      if (v49)
      {
        if (v67)
        {
          HMFGetLogIdentifier();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v139 = v68;
          _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@Multiple local store registrations detected, attempting cleanup now...", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v64);
        objc_msgSend(v10, "audioAnalysisBulletinNotificationManager");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v135[0] = MEMORY[0x24BDAC760];
        v135[1] = 3221225472;
        v135[2] = __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke;
        v135[3] = &unk_24E79BD80;
        v135[4] = v65;
        objc_msgSend(v69, "cleanupMultipleRegistrationsAndReplaceWithRegistration:completion:", v62, v135);
      }
      else
      {
        if (v67)
        {
          HMFGetLogIdentifier();
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAppleMediaAccessory isAudioAnalysisEventNotificationEnabled](v65, "isAudioAnalysisEventNotificationEnabled");
          HMFBooleanToString();
          v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[HMDAppleMediaAccessory audioAnalysisEventNotificationCondition](v65, "audioAnalysisEventNotificationCondition");
          v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v139 = v70;
          v140 = 2112;
          v141 = v71;
          v142 = 2112;
          v143 = v72;
          _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@Local bulletin not found creating and initializing audio analysis event notification registration with enabled: %@, condition: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v64);
        objc_msgSend(v10, "audioAnalysisBulletinNotificationManager");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v134[0] = MEMORY[0x24BDAC760];
        v134[1] = 3221225472;
        v134[2] = __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_249;
        v134[3] = &unk_24E79BD80;
        v134[4] = v65;
        objc_msgSend(v69, "updateNotificationRegistration:enabled:completion:", v62, 1, v134);
      }

      LOBYTE(v6) = v127;
      v51 = v124;
      v12 = v125;
    }
    else
    {
      objc_msgSend(v51, "predicate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory setAudioAnalysisEventNotificationCondition:](self, "setAudioAnalysisEventNotificationCondition:", v52);

      v53 = (void *)MEMORY[0x227676638](-[HMDAppleMediaAccessory setAudioAnalysisEventNotificationEnabled:](self, "setAudioAnalysisEventNotificationEnabled:", v136));
      v54 = self;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v123 = v51;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessory audioAnalysisEventNotificationCondition](v54, "audioAnalysisEventNotificationCondition");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v6 = objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessory audioAnalysisEventNotificationCondition](v54, "audioAnalysisEventNotificationCondition");
        v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v139 = v56;
        v140 = 2112;
        v141 = (const __CFString *)v6;
        v142 = 2112;
        v143 = v58;
        _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, "%{public}@Initializing audio analysis event notification registration with enabled: %@, condition: %@", buf, 0x20u);

        LOBYTE(v6) = v127;
        v51 = v123;
      }

      objc_autoreleasePoolPop(v53);
      v12 = v125;
    }

  }
  device = self->_device;
  self->_device = 0;

  -[HMDAccessory identifier](self, "identifier");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory deviceMediaRouteIdentifierFactory](self, "deviceMediaRouteIdentifierFactory");
  v75 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v75[2]();
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v74, "isEqual:", v76);

  if (v77)
  {
    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      v79 = logger;
      -[HMDAccessory uuid](self, "uuid");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v139 = v80;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, v79, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ConfigureCurrentAccessory", "accessoryUUID=%{signpost.description:attribute}@ ", buf, 0xCu);

    }
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "postNotificationName:object:", CFSTR("HMDAppleMediaAccessoryCurrentAccessoryAddedNotification"), self);

    -[HMDAppleMediaAccessory registerForDarwinNotificationsOnCurrentAccessory](self, "registerForDarwinNotificationsOnCurrentAccessory");
    deviceController = self->_deviceController;
    if (!deviceController
      || (-[HMDDeviceController identifier](deviceController, "identifier"),
          v83 = (void *)objc_claimAutoreleasedReturnValue(),
          v83,
          v83))
    {
      v84 = (void *)MEMORY[0x227676638]();
      v85 = self;
      HMFGetOSLogHandle();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v139 = v87;
        _os_log_impl(&dword_2218F0000, v86, OS_LOG_TYPE_INFO, "%{public}@Setting up device controller for ourselves", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v84);
      -[HMDAppleMediaAccessory dependencyFactory](v85, "dependencyFactory");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "deviceController");
      v89 = (HMDDeviceController *)objc_claimAutoreleasedReturnValue();
      v90 = self->_deviceController;
      self->_deviceController = v89;

    }
    objc_msgSend(v126, "softwareUpdateManager");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setAccessory:", self);

    -[HMDAppleMediaAccessory dependencyFactory](self, "dependencyFactory");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "accountManagerForAccessory:", self);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "device");
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (v94)
    {
      if (-[HMDAppleMediaAccessory shouldUpdateWithDevice:initialConfiguration:](self, "shouldUpdateWithDevice:initialConfiguration:", v94, v127))
      {
        -[HMDAppleMediaAccessory updateWithDevice:](self, "updateWithDevice:", v94);
      }
      -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "removeObserver:name:object:", self, CFSTR("HMDDeviceUpdatedNotification"), 0);

      -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObserver:selector:name:object:", self, sel_handleCurrentDeviceUpdated_, CFSTR("HMDDeviceUpdatedNotification"), v94);

      -[HMDAppleMediaAccessory remoteLoginHandler](self, "remoteLoginHandler");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "_registerForUsernameUpdates");

      objc_msgSend(v94, "rpIdentity");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "deviceIRK");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "data");
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      if (v100)
        -[HMDAppleMediaAccessory postDeviceIRKIfDifferent:](self, "postDeviceIRKIfDifferent:", v100);

    }
    -[HMDAppleMediaAccessory configurePairingIdentity](self, "configurePairingIdentity");
    -[HMDAppleMediaAccessory updateProductInformation](self, "updateProductInformation");
    -[HMDAppleMediaAccessory softwareVersion](self, "softwareVersion");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "softwareVersion");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = HMFEqualObjects();

    if ((v104 & 1) == 0)
    {
      -[HMDAccessory workQueue](self, "workQueue");
      v105 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_253;
      block[3] = &unk_24E79C240;
      block[4] = self;
      dispatch_async(v105, block);

    }
    if (-[HMDAppleMediaAccessory supportsTargetControl](self, "supportsTargetControl"))
    {
      -[HMDAppleMediaAccessory targetControlManager](self, "targetControlManager");
      v106 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v106)
      {
        v107 = -[HMDTargetControlManager initWithTargetAccessory:controllers:]([HMDTargetControlManager alloc], "initWithTargetAccessory:controllers:", self, 0);
        -[HMDAppleMediaAccessory setTargetControlManager:](self, "setTargetControlManager:", v107);

      }
    }
    -[HMDAppleMediaAccessory _fetchMultiUserLanguages](self, "_fetchMultiUserLanguages");
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "removeObserver:name:object:", self, CFSTR("HMDHomeUserRemovedNotification"), 0);

    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "addObserver:selector:name:object:", self, sel_handleHomeUserRemovedNotification_, CFSTR("HMDHomeUserRemovedNotification"), v10);

    v110 = [HMDAppleMediaAccessoryMetricsDispatcher alloc];
    objc_msgSend(v10, "logEventSubmitter");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dailyScheduler");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = -[HMDAppleMediaAccessoryMetricsDispatcher initWithDataSource:logEventSubmitter:dailyScheduler:](v110, "initWithDataSource:logEventSubmitter:dailyScheduler:", self, v111, v112);
    -[HMDAppleMediaAccessory setMetricsDispatcher:](self, "setMetricsDispatcher:", v113);

    -[HMDAppleMediaAccessory metricsDispatcher](self, "metricsDispatcher");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "registerForDailySetRoomLogEvents");

    if ((objc_msgSend(v10, "isMultiUserEnabled") & 1) == 0)
      objc_msgSend(v10, "enableMultiUser");
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "addObserver:selector:name:object:", self, sel_handleCurrentDeviceIRKUpdated_, CFSTR("HMDAppleAccountManagerFetchedCurrentDeviceIRK"), 0);

    v116 = self->_logger;
    if (os_signpost_enabled(v116))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, v116, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ConfigureCurrentAccessory", ", buf, 2u);
    }

    LOBYTE(v6) = v127;
    v12 = v125;
  }
  else
  {
    -[HMDAppleMediaAccessory startMonitoringReachability](self, "startMonitoringReachability");
    -[HMDAppleMediaAccessory createAccessoryInfoSubscriberIfNecessary](self, "createAccessoryInfoSubscriberIfNecessary");
    __bootstrapSupportedStereoPairVersions(self);
  }
  -[HMDAppleMediaAccessory sleepWakeStateController](self, "sleepWakeStateController");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory workQueue](self, "workQueue");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "configureWithHome:messageDispatcher:workQueue:", v118, v11, v119);

  -[HMDAppleMediaAccessory updateReachabilityOfCurrentDevice](self, "updateReachabilityOfCurrentDevice");
  -[HMDAppleMediaAccessory _configureGroupParticipantLocalDataStorageWithHome:](self, "_configureGroupParticipantLocalDataStorageWithHome:", v10);
  -[HMDAppleMediaAccessory createOrUpdateSoftwareUpdateEventProviderIfNecessary](self, "createOrUpdateSoftwareUpdateEventProviderIfNecessary");
  -[HMDAppleMediaAccessory createSoftwareUpdateEventListenerIfNecessary](self, "createSoftwareUpdateEventListenerIfNecessary");
  -[HMDDeviceController setDelegate:](self->_deviceController, "setDelegate:", self);
  -[HMDAccessory workQueue](self, "workQueue");
  v120 = objc_claimAutoreleasedReturnValue();
  v128[0] = MEMORY[0x24BDAC760];
  v128[1] = 3221225472;
  v128[2] = __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_261;
  v128[3] = &unk_24E786CA8;
  v132 = v6;
  v131 = v15;
  v128[4] = self;
  v129 = v10;
  v130 = v12;
  v121 = v12;
  v122 = v10;
  dispatch_async(v120, v128);

}

- (void)configurePairingIdentity
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  HMDAppleMediaAccessory *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairingIdentityForAppleMediaAccessoryWithUUID:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("<waiting>");
    if (v5)
      v11 = v5;
    v13 = 138543618;
    v14 = v9;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Configuring with accessory pairing identity: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (v5)
  {
    -[HMDAppleMediaAccessory setLastCreatedPairingIdentity:](v7, "setLastCreatedPairingIdentity:", v5);
    -[HMDAppleMediaAccessory setPairingIdentity:](v7, "setPairingIdentity:", v5);
    -[__CFString publicPairingIdentity](v5, "publicPairingIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory forwardAccessoryPublicPairingIdentity:](v7, "forwardAccessoryPublicPairingIdentity:", v12);

  }
  else
  {
    -[HMDAppleMediaAccessory createNewPairingIdentity](v7, "createNewPairingIdentity");
  }

}

- (void)createNewPairingIdentity
{
  void *v3;
  NSObject *logger;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAppleMediaAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    -[HMDAppleMediaAccessory currentAccessorySetupMetricDispatcher](self, "currentAccessorySetupMetricDispatcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "markSetupBeginStage:error:", 6, 0);

    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      LOWORD(v25) = 0;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CreateHH2PairingIdentity", ", (uint8_t *)&v25, 2u);
    }
    objc_msgSend(MEMORY[0x24BE3F228], "pairingIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BE3F228]);
    -[HMDAccessory uuid](self, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "publicKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "privateKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "initWithIdentifier:publicKey:privateKey:", v8, v9, v10);

    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v15;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Creating new accessory pairing identity: %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "saveAppleMediaAccessoryPairingIdentity:", v11) & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = v13;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v21;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to save new accessory pairing identity in the keychain store", (uint8_t *)&v25, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 16, CFSTR("Keychain store save failed"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HMDAppleMediaAccessory setLastCreatedPairingIdentity:](v13, "setLastCreatedPairingIdentity:", v11);
    -[HMDAppleMediaAccessory setPairingIdentity:](v13, "setPairingIdentity:", v11);
    objc_msgSend(v11, "publicPairingIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory forwardAccessoryPublicPairingIdentity:](v13, "forwardAccessoryPublicPairingIdentity:", v22);

    -[HMDAppleMediaAccessory notifyFrameworkOfUpdatedPairingIdentity](v13, "notifyFrameworkOfUpdatedPairingIdentity");
    -[HMDAppleMediaAccessory currentAccessorySetupMetricDispatcher](v13, "currentAccessorySetupMetricDispatcher");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "markSetupEndStage:error:", 6, v17);

    v24 = self->_logger;
    if (os_signpost_enabled(v24))
    {
      LOWORD(v25) = 0;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CreateHH2PairingIdentity", ", (uint8_t *)&v25, 2u);
    }

  }
}

- (void)updateProductInformation
{
  void *v3;
  HMDAppleMediaAccessory *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  HMDAppleMediaAccessory *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDAppleMediaAccessory *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543362;
    v34 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating Product Information", (uint8_t *)&v33, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAppleMediaAccessory transactionWithObjectChangeType:](v4, "transactionWithObjectChangeType:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = +[HMDDeviceCapabilities supportsStereoPairingV1](HMDDeviceCapabilities, "supportsStereoPairingV1");
  if (+[HMDDeviceCapabilities supportsStereoPairingV2](HMDDeviceCapabilities, "supportsStereoPairingV2"))
    v10 |= 2uLL;
  if (+[HMDDeviceCapabilities supportsStereoPairingV3](HMDDeviceCapabilities, "supportsStereoPairingV3"))
    v10 |= 4uLL;
  if (+[HMDDeviceCapabilities supportsStereoPairingV4](HMDDeviceCapabilities, "supportsStereoPairingV4"))
    v11 = v10 | 8;
  else
    v11 = v10;
  v12 = -[HMDAppleMediaAccessory supportedStereoPairVersions](v4, "supportedStereoPairVersions");
  if (v12 != v11)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v4;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v16;
      v35 = 2112;
      v36 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating supported stereo pair versions to: %@", (uint8_t *)&v33, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSupportedStereoPairVersions:", v18);

  }
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "productClass");

  if (v20 == 6
    && (objc_msgSend(MEMORY[0x24BE3F260], "productInfo"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "productColor"),
        v21,
        -[HMDAppleMediaAccessory productColor](v4, "productColor") != v22))
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v4;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      HMFProductColorToString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v26;
      v35 = 2112;
      v36 = v27;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Updating product color to: %@", (uint8_t *)&v33, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProductColor:", v28);

  }
  else if (v12 == v11)
  {
    goto LABEL_25;
  }
  -[HMDAccessory home](v4, "home");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "backingStore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "transaction:options:", CFSTR("Update Product Information"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "add:withMessage:", v9, 0);
  objc_msgSend(v32, "run");

LABEL_25:
}

- (BOOL)isHomePod
{
  void *v2;
  void *v3;
  char v4;

  -[HMDAccessory category](self, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD49E0]);

  return v4;
}

- (BOOL)isAppleTV
{
  void *v2;
  void *v3;
  char v4;

  -[HMDAccessory category](self, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD49A0]);

  return v4;
}

- (void)createAccessoryInfoSubscriberIfNecessary
{
  void *v3;
  void *v4;
  HMDAppleMediaAccessory *v5;
  NSObject *v6;
  void *v7;
  HMDAppleMediaAccessoryInfoSubscriber *v8;
  void *v9;
  HMDAppleMediaAccessoryInfoSubscriber *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDAppleMediaAccessory accessoryInfoSubscriber](self, "accessoryInfoSubscriber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating WiFi info subscriber", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v8 = [HMDAppleMediaAccessoryInfoSubscriber alloc];
    -[HMDAccessory workQueue](v5, "workQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDAppleMediaAccessoryInfoSubscriber initWithQueue:dataSource:](v8, "initWithQueue:dataSource:", v9, v5);
    -[HMDAppleMediaAccessory setAccessoryInfoSubscriber:](v5, "setAccessoryInfoSubscriber:", v10);

    -[HMDAppleMediaAccessory accessoryInfoSubscriber](v5, "accessoryInfoSubscriber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v5);

    -[HMDAppleMediaAccessory accessoryInfoSubscriber](v5, "accessoryInfoSubscriber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subscribeToWiFiInfoUpdate");

  }
}

- (BOOL)isDoorbellChimeSettingEnabled
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  char v7;

  -[HMDAppleMediaAccessory currentAccessorySettingsController](self, "currentAccessorySettingsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedSettingForKeyPath:", CFSTR("root.doorbellChime.enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = objc_msgSend(v6, "BOOLValue");
  return v7;
}

- (NSUUID)sensorAccessoryUUID
{
  void *v2;
  void *v3;

  -[HMDAppleMediaAccessory sensorManager](self, "sensorManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sensorAccessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (HMMediaDestinationControllerData)audioDestinationControllerData
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  HMDAppleMediaAccessory *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    -[HMDAppleMediaAccessory legacyAudioDestinationControllerData](self, "legacyAudioDestinationControllerData");
    return (HMMediaDestinationControllerData *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDAppleMediaAccessory dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "destinationControllerDataForAppleMediaAccessory:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get audio destination data due to no data source", (uint8_t *)&v11, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      v5 = 0;
    }

    return (HMMediaDestinationControllerData *)v5;
  }
}

- (id)legacyAudioDestinationControllerData
{
  void *v3;
  void *v4;
  HMMediaDestinationControllerData *v5;

  -[HMDAppleMediaAccessory audioDestinationController](self, "audioDestinationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "data");
    v5 = (HMMediaDestinationControllerData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    v5 = self->_committedAudioDestinationControllerData;
    os_unfair_recursive_lock_unlock();
  }

  return v5;
}

- (id)committedAudioDestinationControllerData
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    -[HMDAppleMediaAccessory legacyCommittedAudioDestinationControllerData](self, "legacyCommittedAudioDestinationControllerData");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v5 = (void *)v6;
    return v5;
  }
  if (!-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    -[HMDAppleMediaAccessory audioDestinationControllerData](self, "audioDestinationControllerData");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[HMDAppleMediaAccessory mediaGroupParticipantDataLocalStorage](self, "mediaGroupParticipantDataLocalStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participantData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationControllerData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)legacyCommittedAudioDestinationControllerData
{
  void *v3;
  void *v4;
  HMMediaDestinationControllerData *v5;

  -[HMDAppleMediaAccessory audioDestinationController](self, "audioDestinationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "committedData");
    v5 = (HMMediaDestinationControllerData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    v5 = self->_committedAudioDestinationControllerData;
    os_unfair_recursive_lock_unlock();
  }

  return v5;
}

- (void)unsetAudioDestinationControllerData
{
  HMMediaDestinationControllerData *committedAudioDestinationControllerData;

  os_unfair_recursive_lock_lock_with_options();
  committedAudioDestinationControllerData = self->_committedAudioDestinationControllerData;
  self->_committedAudioDestinationControllerData = 0;

  os_unfair_recursive_lock_unlock();
}

- (void)mergeAudioDestinationControllerData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAppleMediaAccessory *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAppleMediaAccessory *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAppleMediaAccessory audioDestinationController](self, "audioDestinationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mergeData:", v4);
  }
  else
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
      v28 = v10;
      v29 = 2112;
      v30 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging new audio destination controller with data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessory home](v8, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory msgDispatcher](v8, "msgDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaAccessory notificationCenter](v8, "notificationCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory backingStore](v8, "backingStore");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v11 && v12 && v14)
    {
      -[HMDAppleMediaAccessory mediaDestinationControllerFactory](v8, "mediaDestinationControllerFactory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logEventSubmitter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dailyScheduler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v25) = -[HMDAppleMediaAccessory isCurrentAccessory](v8, "isCurrentAccessory");
      objc_msgSend(v16, "mediaDestinationControllerWithData:backingStore:messageDispatcher:notificationCenter:logEventSubmitter:dailyScheduler:targetDevice:dataSource:delegate:", v4, v15, v12, v13, v17, v18, v25, v8, v8);
      v26 = v13;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory setAudioDestinationController:](v8, "setAudioDestinationController:", v19);

      -[HMDAppleMediaAccessory audioDestinationController](v8, "audioDestinationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "configureWithHome:", v11);

      v13 = v26;
    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = v8;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v28 = v24;
        v29 = 2112;
        v30 = v11;
        v31 = 2112;
        v32 = v12;
        v33 = 2112;
        v34 = v15;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Failed to create audio destination due to no home: %@ messageDispatcher: %@ backing store: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v21);
    }

  }
}

- (void)configureAudioDestinationController
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessory category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDD49A0]);

  if (v5)
  {
    -[HMDAppleMediaAccessory committedAudioDestinationControllerData](self, "committedAudioDestinationControllerData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6
      && (objc_msgSend(v6, "parentIdentifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMDAccessory uuid](self, "uuid"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "hmf_isEqualToUUID:", v9),
          v9,
          v8,
          (v10 & 1) != 0))
    {
      -[HMDAccessory home](self, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v15;
        v27 = 2112;
        v28 = v7;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Configuring audio destination controller with data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDAppleMediaAccessory mediaDestinationControllerFactory](v13, "mediaDestinationControllerFactory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory backingStore](v13, "backingStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory msgDispatcher](v13, "msgDispatcher");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaAccessory notificationCenter](v13, "notificationCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logEventSubmitter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dailyScheduler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v24) = -[HMDAppleMediaAccessory isCurrentAccessory](v13, "isCurrentAccessory");
      objc_msgSend(v16, "mediaDestinationControllerWithData:backingStore:messageDispatcher:notificationCenter:logEventSubmitter:dailyScheduler:targetDevice:dataSource:delegate:", v7, v17, v18, v19, v20, v21, v24, v13, v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory setAudioDestinationController:](v13, "setAudioDestinationController:", v22);

      -[HMDAppleMediaAccessory audioDestinationController](v13, "audioDestinationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "configureWithHome:", v11);

      -[HMDAppleMediaAccessory migrateLocalParticipantData](v13, "migrateLocalParticipantData");
    }
    else
    {
      -[HMDAppleMediaAccessory createAudioDestinationController](self, "createAudioDestinationController");
    }

  }
}

- (void)createAudioDestinationController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  HMDAppleMediaAccessory *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDAppleMediaAccessory *v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    if (+[HMDDeviceCapabilities supportsAudioDestinationControllerCreation](HMDDeviceCapabilities, "supportsAudioDestinationControllerCreation"))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("EE041E8C-28B9-4250-B2E2-0C032BDDDF1A"));
      v4 = (void *)MEMORY[0x24BDD1880];
      -[HMDAccessory uuid](self, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hmf_UUIDWithNamespace:data:", v3, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543618;
        v33 = v12;
        v34 = 2112;
        v35 = v8;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination controller with identifier: %@", (uint8_t *)&v32, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      if (isFeatureHomeTheaterQFAEnabledForTests
        && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
      {
        v28 = (void *)MEMORY[0x227676638]();
        v29 = v10;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138543362;
          v33 = v31;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v32, 0xCu);

        }
        objc_autoreleasePoolPop(v28);
        -[HMDAppleMediaAccessory legacyCreateAudioDestinationControllerWithControllerIdentifier:](v29, "legacyCreateAudioDestinationControllerWithControllerIdentifier:", v8);
      }
      else
      {
        -[HMDAppleMediaAccessory mediaGroupParticipantDataLocalStorage](v10, "mediaGroupParticipantDataLocalStorage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "participantData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "destinationControllerData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = (void *)MEMORY[0x227676638]();
          v17 = v10;
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
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Overwriting stale audio destination controller data: %@", (uint8_t *)&v32, 0x16u);

          }
          objc_autoreleasePoolPop(v16);
        }
        v20 = objc_alloc(MEMORY[0x24BDD7788]);
        -[HMDAccessory uuid](v10, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = +[HMDMediaDestinationController expectedSupportOptions](HMDMediaDestinationController, "expectedSupportOptions");
        v23 = (void *)objc_msgSend(v20, "initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:", v8, v21, 0, v22, MEMORY[0x24BDBD1A8]);

        objc_msgSend(v13, "updateDestinationControllerData:", v23);
        -[HMDAppleMediaAccessory mergeAudioDestinationControllerData:](v10, "mergeAudioDestinationControllerData:", v23);

      }
    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543362;
        v33 = v27;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Skipping audio destination controller creation due to device does not support home theater", (uint8_t *)&v32, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
    }
  }
}

- (void)legacyCreateAudioDestinationControllerWithControllerIdentifier:(id)a3
{
  id v4;
  HMDMediaDestinationControllerModel *v5;
  void *v6;
  HMDMediaDestinationControllerModel *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  v5 = [HMDMediaDestinationControllerModel alloc];
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", 1, v4, v6);

  -[HMDMediaDestinationControllerModel setAvailableDestinationModelIdentifiers:](v7, "setAvailableDestinationModelIdentifiers:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", +[HMDMediaDestinationController expectedSupportOptions](HMDMediaDestinationController, "expectedSupportOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationControllerModel setSupportedOptions:](v7, "setSupportedOptions:", v8);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __89__HMDAppleMediaAccessory_legacyCreateAudioDestinationControllerWithControllerIdentifier___block_invoke;
  v9[3] = &unk_24E79BD80;
  v9[4] = self;
  -[HMDAccessory runTransactionWithModel:label:completion:](self, "runTransactionWithModel:label:completion:", v7, CFSTR("Create audio destination controller"), v9);

}

- (id)committedAudioDestination
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    -[HMDAppleMediaAccessory legacyCommittedAudioDestination](self, "legacyCommittedAudioDestination");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v5 = (void *)v6;
    return v5;
  }
  if (!-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    -[HMDAppleMediaAccessory audioDestination](self, "audioDestination");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[HMDAppleMediaAccessory mediaGroupParticipantDataLocalStorage](self, "mediaGroupParticipantDataLocalStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participantData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)legacyCommittedAudioDestination
{
  void *v3;
  void *v4;
  HMMediaDestination *v5;

  -[HMDAppleMediaAccessory audioDestinationManager](self, "audioDestinationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "committedDestination");
    v5 = (HMMediaDestination *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    v5 = self->_committedAudioDestination;
    os_unfair_recursive_lock_unlock();
  }

  return v5;
}

- (HMMediaDestination)audioDestination
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  HMDAppleMediaAccessory *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    -[HMDAppleMediaAccessory legacyAudioDestination](self, "legacyAudioDestination");
    return (HMMediaDestination *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDAppleMediaAccessory dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "destinationForAppleMediaAccessory:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get audio destination due to no data source", (uint8_t *)&v11, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      v5 = 0;
    }

    return (HMMediaDestination *)v5;
  }
}

- (id)legacyAudioDestination
{
  void *v3;
  void *v4;
  HMMediaDestination *v5;

  -[HMDAppleMediaAccessory audioDestinationManager](self, "audioDestinationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "destination");
    v5 = (HMMediaDestination *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    v5 = self->_committedAudioDestination;
    os_unfair_recursive_lock_unlock();
  }

  return v5;
}

- (void)unsetAudioDestination
{
  HMMediaDestination *committedAudioDestination;

  os_unfair_recursive_lock_lock_with_options();
  committedAudioDestination = self->_committedAudioDestination;
  self->_committedAudioDestination = 0;

  os_unfair_recursive_lock_unlock();
}

- (void)mergeAudioDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAppleMediaAccessory *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAppleMediaAccessory *v22;
  NSObject *v23;
  void *v24;
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
  -[HMDAppleMediaAccessory audioDestinationManager](self, "audioDestinationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mergeDestination:", v4);
  }
  else
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
      v26 = v10;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging new audio destination: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessory home](v8, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory msgDispatcher](v8, "msgDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaAccessory notificationCenter](v8, "notificationCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory backingStore](v8, "backingStore");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v11 && v12 && v14)
    {
      -[HMDAppleMediaAccessory mediaDestinationManagerFactory](v8, "mediaDestinationManagerFactory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "mediaDestinationManagerWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:", v4, v12, v13, v15, -[HMDAppleMediaAccessory isCurrentAccessory](v8, "isCurrentAccessory"), v8, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory setAudioDestinationManager:](v8, "setAudioDestinationManager:", v17);

      -[HMDAppleMediaAccessory audioDestinationManager](v8, "audioDestinationManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "configureWithHome:currentAccessory:", v11, -[HMDAppleMediaAccessory isCurrentAccessory](v8, "isCurrentAccessory"));

      -[HMDAppleMediaAccessory audioDestinationManager](v8, "audioDestinationManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "messageHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleUpdatedDestination:", v4);

    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = v8;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v26 = v24;
        v27 = 2112;
        v28 = v11;
        v29 = 2112;
        v30 = v12;
        v31 = 2112;
        v32 = v15;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Failed to create audio destination manager due to no home: %@ messageDispatcher: %@ backing store: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v21);
    }

  }
}

- (void)configureAudioDestinationManager
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (-[HMDAppleMediaAccessory isHomePod](self, "isHomePod"))
  {
    -[HMDAppleMediaAccessory committedAudioDestination](self, "committedAudioDestination");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13
      && (objc_msgSend(v13, "parentIdentifier"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMDAccessory uuid](self, "uuid"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4),
          v4,
          v3,
          (v5 & 1) != 0))
    {
      -[HMDAppleMediaAccessory mediaDestinationManagerFactory](self, "mediaDestinationManagerFactory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory msgDispatcher](self, "msgDispatcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory backingStore](self, "backingStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mediaDestinationManagerWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:", v13, v7, v8, v9, -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"), self, self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory setAudioDestinationManager:](self, "setAudioDestinationManager:", v10);

      -[HMDAppleMediaAccessory audioDestinationManager](self, "audioDestinationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory home](self, "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configureWithHome:currentAccessory:", v12, -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"));

      -[HMDAppleMediaAccessory migrateLocalParticipantData](self, "migrateLocalParticipantData");
    }
    else
    {
      -[HMDAppleMediaAccessory createAudioDestination](self, "createAudioDestination");
    }

  }
}

- (void)migrateLocalParticipantData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((!isFeatureHomeTheaterQFAEnabledForTests
     || objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
    && -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    -[HMDAppleMediaAccessory audioDestinationController](self, "audioDestinationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[HMDAppleMediaAccessory mediaGroupParticipantDataLocalStorage](self, "mediaGroupParticipantDataLocalStorage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "migrateWithExpectedDestinationControllerSupportOptions:", +[HMDMediaDestinationController expectedSupportOptions](HMDMediaDestinationController, "expectedSupportOptions"));

    }
    -[HMDAppleMediaAccessory audioDestinationManager](self, "audioDestinationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HMDAppleMediaAccessory mediaGroupParticipantDataLocalStorage](self, "mediaGroupParticipantDataLocalStorage");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "migrateWithExpectedDestinationSupportOptions:", -[HMDAppleMediaAccessory expectedDestinationSupportOptions](self, "expectedDestinationSupportOptions"));

    }
  }
}

- (unint64_t)expectedDestinationSupportOptions
{
  if (-[HMDAppleMediaAccessory isHomePodMini](self, "isHomePodMini"))
    return 36;
  if (-[HMDAppleMediaAccessory isHomePod2ndGen](self, "isHomePod2ndGen"))
    return 192;
  return 17;
}

- (void)createAudioDestination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  HMDAppleMediaAccessory *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAppleMediaAccessory *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDAppleMediaAccessory *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDAppleMediaAccessory *v31;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    if (+[HMDDeviceCapabilities supportsAudioDestinationCreation](HMDDeviceCapabilities, "supportsAudioDestinationCreation"))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("5CC65005-CE51-4781-9F78-3429557B6FD4"));
      v4 = (void *)MEMORY[0x24BDD1880];
      -[HMDAccessory uuid](self, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hmf_UUIDWithNamespace:data:", v3, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = -[HMDAppleMediaAccessory expectedDestinationSupportOptions](self, "expectedDestinationSupportOptions");
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        HMMediaDestinationSupportOptionsAsString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543874;
        v35 = v13;
        v36 = 2112;
        v37 = v8;
        v38 = 2112;
        v39 = v14;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination with identifier: %@ supportedOptions: %@", (uint8_t *)&v34, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      if (isFeatureHomeTheaterQFAEnabledForTests
        && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
      {
        v30 = (void *)MEMORY[0x227676638]();
        v31 = v11;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543362;
          v35 = v33;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v34, 0xCu);

        }
        objc_autoreleasePoolPop(v30);
        -[HMDAppleMediaAccessory legacyCreateAudioDestinationWithIdentifier:supportedOptions:](v31, "legacyCreateAudioDestinationWithIdentifier:supportedOptions:", v8, v9);
      }
      else
      {
        -[HMDAppleMediaAccessory mediaGroupParticipantDataLocalStorage](v11, "mediaGroupParticipantDataLocalStorage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "participantData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "destination");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = v11;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 138543618;
            v35 = v21;
            v36 = 2112;
            v37 = v17;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Overwriting stale audio destination: %@", (uint8_t *)&v34, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
        }
        v22 = objc_alloc(MEMORY[0x24BDD7780]);
        -[HMDAccessory uuid](v11, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessory defaultAudioGroupIdentifier](v11, "defaultAudioGroupIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v22, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:", v8, v23, v9, v24);

        objc_msgSend(v15, "updateMediaDestination:", v25);
        -[HMDAppleMediaAccessory mergeAudioDestination:](v11, "mergeAudioDestination:", v25);

      }
    }
    else
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v29;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Skipping creating audio destination manager for unsupported device", (uint8_t *)&v34, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
    }
  }
}

- (id)defaultAudioGroupIdentifier
{
  return 0;
}

- (void)legacyCreateAudioDestinationWithIdentifier:(id)a3 supportedOptions:(unint64_t)a4
{
  id v6;
  HMDMediaDestinationModel *v7;
  void *v8;
  HMDMediaDestinationModel *v9;
  void *v10;
  _QWORD v11[5];

  v6 = a3;
  v7 = [HMDMediaDestinationModel alloc];
  -[HMDAccessory uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v7, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationModel setSupportedOptions:](v9, "setSupportedOptions:", v10);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__HMDAppleMediaAccessory_legacyCreateAudioDestinationWithIdentifier_supportedOptions___block_invoke;
  v11[3] = &unk_24E79BD80;
  v11[4] = self;
  -[HMDAccessory runTransactionWithModel:label:completion:](self, "runTransactionWithModel:label:completion:", v9, CFSTR("Create audio destination"), v11);

}

- (id)mediaGroupParticipantDataLocalStorage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaGroupParticipantDataLocalStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
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
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media groups participant data local storage due to dependencies home: %@ homeManager: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }

  return v6;
}

- (void)removeAudioDestination
{
  void *v3;
  void *v4;
  HMDAppleMediaAccessory *v5;
  NSObject *v6;
  void *v7;
  HMDMediaDestinationModel *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    -[HMDAppleMediaAccessory audioDestination](self, "audioDestination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v7;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing audio destination: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    if (v3)
    {
      v8 = -[HMDMediaDestinationModel initWithDestination:changeType:]([HMDMediaDestinationModel alloc], "initWithDestination:changeType:", v3, 3);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __48__HMDAppleMediaAccessory_removeAudioDestination__block_invoke;
      v13[3] = &unk_24E79BD80;
      v13[4] = v5;
      -[HMDAccessory runTransactionWithModel:label:completion:](v5, "runTransactionWithModel:label:completion:", v8, CFSTR("Remove audio destination"), v13);

    }
  }
  else
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
      v15 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Skipping removing audio destination due to non-current device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
}

- (id)_createMediaProfile
{
  return -[HMDMediaProfile initWithAccessory:]([HMDAppleMediaProfile alloc], "initWithAccessory:", self);
}

- (void)_fetchMultiUserLanguages
{
  void *v3;
  HMDAppleMediaAccessory *v4;
  NSObject *v5;
  void *v6;
  void (**v7)(void);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  HMDAppleMediaAccessory *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching multi-user languages.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAppleMediaAccessory settingsConnectionFactory](v4, "settingsConnectionFactory");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__HMDAppleMediaAccessory__fetchMultiUserLanguages__block_invoke;
  v10[3] = &unk_24E799F40;
  v11 = v8;
  v12 = v4;
  v9 = v8;
  objc_msgSend(v9, "fetchSupportedMultiUserLanguageCodes:", v10);

}

- (void)_fixCloudKeyIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
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
  HMDAppleMediaAccessory *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    return;
  -[HMDAppleMediaAccessory pairingIdentity](self, "pairingIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v24;
      v25 = "%{public}@No pairing identity yet to fix";
LABEL_17:
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, v25, buf, 0xCu);

    }
LABEL_18:

    objc_autoreleasePoolPop(v21);
    return;
  }
  -[HMDAppleMediaAccessory pairingIdentity](self, "pairingIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v24;
      v25 = "%{public}@Pairing identity can't be used.";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (!-[HMDAppleMediaAccessory fixedPairingIdentityInCloud](self, "fixedPairingIdentityInCloud"))
  {
    -[HMDAppleMediaAccessory transactionWithObjectChangeType:](self, "transactionWithObjectChangeType:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v12;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Fixing pairing identity", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      -[HMDAppleMediaAccessory pairingIdentity](v10, "pairingIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "publicPairingIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPairingIdentity:", v14);

      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAppleMediaAccessoryChangeTag:", v16);

      -[HMDAccessory home](v10, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "backingStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "transaction:options:", CFSTR("Fix Pairing Identity"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "add:", v8);
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __46__HMDAppleMediaAccessory__fixCloudKeyIfNeeded__block_invoke;
      v26[3] = &unk_24E79BD80;
      v26[4] = v10;
      objc_msgSend(v20, "run:", v26);

    }
  }
}

- (void)autoConfigureTargetControllers
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__HMDAppleMediaAccessory_autoConfigureTargetControllers__block_invoke;
  v6[3] = &unk_24E7916A0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_each:", v6);

}

- (void)configureTargetController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAppleMediaAccessory targetControlManager](self, "targetControlManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addTargetControllers:", v6);
}

- (HMAccessoryCapabilities)capabilitiesInternal
{
  HMAccessoryCapabilities *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_capabilitiesInternal;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setCapabilitiesInternal:(id)a3
{
  HMAccessoryCapabilities *v4;
  HMAccessoryCapabilities *capabilitiesInternal;

  v4 = (HMAccessoryCapabilities *)a3;
  os_unfair_recursive_lock_lock_with_options();
  capabilitiesInternal = self->_capabilitiesInternal;
  self->_capabilitiesInternal = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSData)rawCapabilities
{
  NSData *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_rawCapabilities;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setRawCapabilities:(id)a3
{
  NSData *v4;
  NSData *rawCapabilities;

  v4 = (NSData *)a3;
  os_unfair_recursive_lock_lock_with_options();
  rawCapabilities = self->_rawCapabilities;
  self->_rawCapabilities = v4;

  os_unfair_recursive_lock_unlock();
}

- (unint64_t)homePodVariant
{
  unint64_t v2;
  unint64_t v3;

  v2 = -[HMDAppleMediaAccessory variant](self, "variant");
  v3 = 2;
  if ((v2 & 2) == 0)
    v3 = ((uint64_t)(v2 << 61) >> 63) & 3;
  if ((v2 & 1) != 0)
    return 1;
  else
    return v3;
}

- (int64_t)productColor
{
  int64_t productColor;

  os_unfair_recursive_lock_lock_with_options();
  productColor = self->_productColor;
  os_unfair_recursive_lock_unlock();
  return productColor;
}

- (void)setProductColor:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_productColor = a3;
  os_unfair_recursive_lock_unlock();
}

- (NSUUID)idsIdentifier
{
  void *v3;
  NSUUID *v4;

  -[HMDAppleMediaAccessory deviceForDirectMessaging](self, "deviceForDirectMessaging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsIdentifier");
  v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    v4 = self->_idsIdentifier;
    os_unfair_recursive_lock_unlock();
  }
  return v4;
}

- (id)idsIdentifierInternal
{
  NSUUID *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_idsIdentifier;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setIdsIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *idsIdentifier;

  v4 = (NSUUID *)a3;
  os_unfair_recursive_lock_lock_with_options();
  idsIdentifier = self->_idsIdentifier;
  self->_idsIdentifier = v4;

  os_unfair_recursive_lock_unlock();
}

- (BOOL)isCurrentAccessory
{
  void *v3;
  void (**v4)(void);
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  char v9;
  BOOL v10;

  -[HMDAppleMediaAccessory device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory deviceMediaRouteIdentifierFactory](self, "deviceMediaRouteIdentifierFactory");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessory identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = v3 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    if (!objc_msgSend(v6, "isEqualToString:", v5))
    {
      v10 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (!v5)
  {
LABEL_9:
    v9 = objc_msgSend(v3, "isCurrentDevice");
    goto LABEL_10;
  }
  v9 = objc_msgSend(v6, "isEqualToString:", v5);
LABEL_10:
  v10 = v9;
LABEL_12:

  return v10;
}

- (BOOL)supportsTargetControl
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsTargetControl");

  return v4;
}

- (BOOL)supportsMultiUser
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsMultiUser");

  return v4;
}

- (BOOL)supportsHomeLevelLocationServiceSetting
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsHomeLevelLocationServiceSetting");

  return v4;
}

- (BOOL)legacyLocationServicesEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  void *v13;
  HMDAppleMediaAccessory *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDAppleMediaAccessory settingsController](self, "settingsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_295);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_299_129875);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "value");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      v12 = objc_msgSend(v11, "BOOLValue");
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
        v18 = 138543618;
        v19 = v16;
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get location service enabled value due to unknown class for value: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)supportsAudioReturnChannel
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsAudioReturnChannel");

  return v4;
}

- (BOOL)supportsCompanionInitiatedRestart
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCompanionInitiatedRestart");

  return v4;
}

- (BOOL)supportsCompanionInitiatedObliterate
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCompanionInitiatedObliterate");

  return v4;
}

- (BOOL)supportsMusicAlarm
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsMusicAlarm");

  return v4;
}

- (BOOL)supportsThirdPartyMusic
{
  void *v2;
  _BOOL4 v4;
  char v5;
  void *v6;

  v4 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v4)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "supportsThirdPartyMusic") & 1) != 0)
    {
      v5 = 1;
LABEL_5:

      return v5;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "supportsThirdPartyMusic");

  if (v4)
    goto LABEL_5;
  return v5;
}

- (BOOL)supportsPreferredMediaUser
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsPreferredMediaUser");

  return v4;
}

- (BOOL)supportsAudioAnalysis
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v7;
  char v8;
  void *v9;

  v7 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v7)
  {
    -[HMDAccessory home](self, "home");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "homeManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "capabilitiesController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentAccessoryCapabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "supportsAudioAnalysis") & 1) != 0)
    {
      v8 = 1;
LABEL_5:

      return v8;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "supportsAudioAnalysis");

  if (v7)
    goto LABEL_5;
  return v8;
}

- (BOOL)supportsDropIn
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v7;
  char v8;
  void *v9;

  v7 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v7)
  {
    -[HMDAccessory home](self, "home");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "homeManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "capabilitiesController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentAccessoryCapabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "supportsDropIn") & 1) != 0)
    {
      v8 = 1;
LABEL_5:

      return v8;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "supportsDropIn");

  if (v7)
    goto LABEL_5;
  return v8;
}

- (BOOL)supportsDoorbellChime
{
  void *v2;
  _BOOL4 v4;
  char v5;
  void *v6;

  v4 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v4)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "supportsDoorbellChime") & 1) != 0)
    {
      v5 = 1;
LABEL_5:

      return v5;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "supportsDoorbellChime");

  if (v4)
    goto LABEL_5;
  return v5;
}

- (BOOL)supportsUserMediaSettings
{
  void *v2;
  _BOOL4 v4;
  char v5;
  void *v6;

  v4 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v4)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "supportsUserMediaSettings") & 1) != 0)
    {
      v5 = 1;
LABEL_5:

      return v5;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "supportsUserMediaSettings");

  if (v4)
    goto LABEL_5;
  return v5;
}

- (BOOL)supportsCoordinationDoorbellChime
{
  void *v2;
  _BOOL4 v4;
  char v5;
  void *v6;

  v4 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v4)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "supportsCoordinationDoorbellChime") & 1) != 0)
    {
      v5 = 1;
LABEL_5:

      return v5;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "supportsCoordinationDoorbellChime");

  if (v4)
    goto LABEL_5;
  return v5;
}

- (BOOL)supportsCoordinationFreeDoorbellChime
{
  void *v2;
  _BOOL4 v4;
  char v5;
  void *v6;

  v4 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v4)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "supportsCoordinationFreeDoorbellChime") & 1) != 0)
    {
      v5 = 1;
LABEL_5:

      return v5;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "supportsCoordinationFreeDoorbellChime");

  if (v4)
    goto LABEL_5;
  return v5;
}

- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification
{
  void *v2;
  _BOOL4 v4;
  char v5;
  void *v6;

  v4 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v4)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "supportsTVOSUpdateManualUpdateAvailableNotification") & 1) != 0)
    {
      v5 = 1;
LABEL_5:

      return v5;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "supportsTVOSUpdateManualUpdateAvailableNotification");

  if (v4)
    goto LABEL_5;
  return v5;
}

- (BOOL)supportsAnnounce
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsAnnounce");

  return v4;
}

- (BOOL)supportsMediaActions
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsMediaActions");

  return v4;
}

- (BOOL)supportsManagedConfigurationProfile
{
  void *v2;
  char v3;

  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsManagedConfigurationProfile");

  return v3;
}

- (HMSoftwareUpdateDescriptor)lastSentSoftwareUpdateDescriptor
{
  return 0;
}

- (HMSoftwareUpdateProgress)lastSentSoftwareUpdateProgress
{
  return 0;
}

- (BOOL)supportsMediaContentProfile
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[HMDAccessory category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HMFEqualObjects();

  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "supportsLoreto");

  return v5 & ~(_BYTE)v3;
}

- (BOOL)supportsMessagedHomePodSettings
{
  return 1;
}

- (BOOL)supportsRMVonAppleTV
{
  void *v3;
  char v4;
  void *v6;
  int v7;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "supportsRMVonAppleTV");

    if ((v4 & 1) == 0)
      return 0;
  }
  else
  {
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsRMVonAppleTV");

    if (!v7)
      return 0;
  }
  return _os_feature_enabled_impl();
}

- (BOOL)supportsJustSiri
{
  void *v3;
  char v4;
  void *v6;
  int v7;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "supportsJustSiri");

    if ((v4 & 1) == 0)
      return 0;
  }
  else
  {
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsJustSiri");

    if (!v7)
      return 0;
  }
  return _os_feature_enabled_impl();
}

- (BOOL)supportsSoftwareUpdateV2
{
  return 1;
}

- (BOOL)isHomePodMini
{
  return -[HMDAppleMediaAccessory variant](self, "variant") == 2;
}

- (BOOL)isHomePod2ndGen
{
  return -[HMDAppleMediaAccessory variant](self, "variant") == 4;
}

- (HMDDevice)deviceForDirectMessaging
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[HMDAppleMediaAccessory device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory deviceAddress](self, "deviceAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory idsIdentifierInternal](self, "idsIdentifierInternal");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v3)
  {
    if (v4)
    {
      -[HMDAppleMediaAccessory dependencyFactory](self, "dependencyFactory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceWithAddress:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v5)
      {
        v3 = 0;
        goto LABEL_7;
      }
      -[HMDAppleMediaAccessory dependencyFactory](self, "dependencyFactory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceForIDSIdentifier:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v3 = (void *)v8;

  }
LABEL_7:

  return (HMDDevice *)v3;
}

- (HMDDevice)device
{
  void *v2;
  void *v3;

  __HMDAppleMediaAccessoryGetDeviceController(self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDDevice *)v3;
}

- (HMDMessageRouter)messageRouter
{
  void *v2;
  void *v3;

  -[HMDAppleMediaAccessory messenger](self, "messenger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "router");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDMessageRouter *)v3;
}

- (void)setDeviceController:(id)a3
{
  NSData *v5;
  id v6;
  void *v7;
  void *v8;
  HMDRPIdentity *v9;
  id v10;

  v10 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_storeStrong((id *)&self->_deviceController, a3);
  v5 = self->_deviceIRK;
  os_unfair_recursive_lock_unlock();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE3F190]);
    v7 = (void *)objc_msgSend(v6, "initWithType:size:data:", *MEMORY[0x24BE3EBE8], *MEMORY[0x24BE3EBE0], v5);
    -[HMDAppleMediaAccessory device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDRPIdentity initWithDeviceIRK:]([HMDRPIdentity alloc], "initWithDeviceIRK:", v7);
    objc_msgSend(v8, "setRpIdentity:", v9);

  }
}

- (void)updateWithDevice:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
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
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t);
  void *v50;
  id v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
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
      *(_DWORD *)buf = 138543618;
      v54 = v8;
      v55 = 2112;
      v56 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating with device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAppleMediaAccessory transactionWithObjectChangeType:](v6, "transactionWithObjectChangeType:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      objc_msgSend(v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDeviceUUID:", v13);

      objc_msgSend(v11, "setDevice:", v4);
      v14 = (void *)MEMORY[0x24BDD7338];
      objc_msgSend(v4, "productInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "categoryForProductInfo:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[HMDAccessory category](v6, "category");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = HMFEqualObjects();

        if ((v18 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD7338], "categoryIdentifierForCategory:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setAccessoryCategory:", v19);

          objc_msgSend(v16, "categoryType");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqual:", *MEMORY[0x24BDD49F8]);

          if ((v21 & 1) == 0)
          {
            objc_initWeak((id *)buf, v6);
            -[HMDAppleMediaAccessory backingStore](v6, "backingStore");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "context");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = MEMORY[0x24BDAC760];
            v48 = 3221225472;
            v49 = __43__HMDAppleMediaAccessory_updateWithDevice___block_invoke;
            v50 = &unk_24E7972B0;
            objc_copyWeak(&v52, (id *)buf);
            v51 = v16;
            objc_msgSend(v23, "performBlock:", &v47);

            objc_destroyWeak(&v52);
            objc_destroyWeak((id *)buf);
          }
        }
      }
      -[HMDAccessory manufacturer](v6, "manufacturer", v47, v48, v49, v50);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = HMFEqualObjects();

      if ((v25 & 1) == 0)
        objc_msgSend(v11, "setManufacturer:", CFSTR("Apple Inc."));
      objc_msgSend(MEMORY[0x24BE3F288], "systemInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "model");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v27, "mutableCopy");

      if (v28)
      {
        objc_msgSend(MEMORY[0x24BE3F288], "systemInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "regionInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
          objc_msgSend(v28, "appendString:", v30);
        -[HMDAccessory model](v6, "model");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v28, "isEqual:", v31);

        if ((v32 & 1) == 0)
          objc_msgSend(v11, "setModel:", v28);

      }
      objc_msgSend(MEMORY[0x24BE3F288], "systemInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "serialNumber");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        -[HMDAccessory serialNumber](v6, "serialNumber");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v34, "isEqual:", v35);

        if ((v36 & 1) == 0)
          objc_msgSend(v11, "setSerialNumber:", v34);
      }

      objc_msgSend(v4, "productInfo");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        objc_msgSend(v37, "softwareVersion");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          -[HMDAccessory firmwareVersion](v6, "firmwareVersion");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v39, "isEqual:", v40);

          if ((v41 & 1) == 0)
          {
            objc_msgSend(v39, "versionString");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setFirmwareVersion:", v42);

          }
        }

      }
      -[HMDAccessory home](v6, "home");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "backingStore");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "transaction:options:", CFSTR("updateWithDevice"), v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "add:withMessage:", v11, 0);
      objc_msgSend(v46, "run");

    }
  }

}

- (BOOL)shouldUpdateWithDevice:(id)a3 initialConfiguration:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  BOOL v31;
  void *v32;
  HMDAppleMediaAccessory *v33;
  NSObject *v34;
  void *v35;
  const char *v36;
  HMDAppleMediaAccessory *v37;
  HMDAppleMediaAccessory *v39;
  int v40;
  void *v41;
  uint64_t v42;

  v4 = a4;
  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDAppleMediaAccessory device](self, "device");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6 && !v4 || !HMFEqualObjects())
    goto LABEL_23;
  objc_msgSend(v6, "productInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "productInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "productInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
    {
LABEL_23:
      v31 = 1;
      goto LABEL_24;
    }
    -[HMDAccessory manufacturer](self, "manufacturer");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_19;
    v13 = (void *)v12;
    -[HMDAccessory model](self, "model");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[HMDAccessory serialNumber](self, "serialNumber");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[HMDAccessory firmwareVersion](self, "firmwareVersion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          goto LABEL_10;
LABEL_19:
        v32 = (void *)MEMORY[0x227676638]();
        v37 = self;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 138543362;
          v41 = v35;
          v36 = "%{public}@Force updating product information";
          goto LABEL_21;
        }
LABEL_22:

        objc_autoreleasePoolPop(v32);
        goto LABEL_23;
      }

    }
    goto LABEL_19;
  }
LABEL_10:
  -[HMDAccessory category](self, "category");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_15;
  v20 = (void *)v19;
  -[HMDAccessory category](self, "category");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BDD7338];
  objc_msgSend(v6, "productInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "categoryForProductInfo:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v21, "isEqual:", v24);

  if ((v25 & 1) == 0)
  {
LABEL_15:
    v32 = (void *)MEMORY[0x227676638]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543362;
      v41 = v35;
      v36 = "%{public}@Force updating category";
LABEL_21:
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, v36, (uint8_t *)&v40, 0xCu);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  objc_msgSend(v6, "rpIdentity");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    objc_msgSend(v6, "rpIdentity");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rpIdentity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if ((v30 & 1) == 0)
    {
      v32 = (void *)MEMORY[0x227676638]();
      v39 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        goto LABEL_22;
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543362;
      v41 = v35;
      v36 = "%{public}@Force updating rapport identity";
      goto LABEL_21;
    }
  }
  v31 = 0;
LABEL_24:

  return v31;
}

- (void)handleCurrentDeviceUpdated:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v8 = v5;

  if (v8)
  {
    -[HMDAppleMediaAccessory device](self, "device");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 == v6)
    {

    }
    else
    {
      v7 = -[HMDAppleMediaAccessory shouldUpdateWithDevice:initialConfiguration:](self, "shouldUpdateWithDevice:initialConfiguration:", v8, 0);

      if (!v7)
        goto LABEL_10;
    }
    -[HMDAppleMediaAccessory updateWithDevice:](self, "updateWithDevice:", v8);
  }
LABEL_10:

}

- (void)handleFetchManagedConfigurationProfiles:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  void *v10;
  HMDAppleMediaAccessory *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAppleMediaAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  HMDAppleMediaAccessory *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  HMDAppleMediaAccessory *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  id v53;
  uint64_t v54;
  void *v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v58 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received fetch managed configuration profiles request", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = -[HMDAppleMediaAccessory isCurrentAccessory](v6, "isCurrentAccessory");
  v10 = (void *)MEMORY[0x227676638]();
  v11 = v6;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling fetch managed configuration profiles request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v46 = v4;
      objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "installedProfileIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x227676638]();
      v19 = v11;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v58 = v21;
        v59 = 2112;
        v60 = v22;
        v61 = 2112;
        v62 = v17;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Fetched profile identifiers: %@, %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v24 = v17;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v49 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v15, "installedProfileDataWithIdentifier:", v29, v46);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7778]), "initWithIdentifier:profileData:", v29, v30);
            objc_msgSend(v23, "addObject:", v31);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        }
        while (v26);
      }

      v32 = (void *)MEMORY[0x24BDD1618];
      v33 = (void *)objc_msgSend(v23, "copy");
      v47 = 0;
      objc_msgSend(v32, "archivedDataWithRootObject:requiringSecureCoding:error:", v33, 1, &v47);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v47;

      if (v34)
      {
        v54 = *MEMORY[0x24BDD4C68];
        v55 = v34;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v46;
        objc_msgSend(v46, "respondWithPayload:", v36);
      }
      else
      {
        v42 = (void *)MEMORY[0x227676638]();
        v43 = v19;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        v4 = v46;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v58 = v45;
          v59 = 2112;
          v60 = v23;
          v61 = 2112;
          v62 = v35;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode profiles %@:%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v42);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "respondWithError:", v36);
      }

    }
    else
    {
      v38 = (void *)MEMORY[0x227676638]();
      v39 = v11;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v41;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to link profile connection", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 14);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v24);
    }

  }
  else
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v37;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Relaying fetch managed configuration profiles request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __66__HMDAppleMediaAccessory_handleFetchManagedConfigurationProfiles___block_invoke;
    v52[3] = &unk_24E799400;
    v52[4] = v11;
    v53 = v4;
    -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v11, "_relayRequestMessage:responseHandler:", v53, v52);

  }
}

- (void)handleRemoveManagedConfigurationProfile:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAppleMediaAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDAppleMediaAccessory *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received remove managed configuration profile request", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDAppleMediaAccessory isCurrentAccessory](v6, "isCurrentAccessory"))
  {
    objc_msgSend(v4, "stringForKey:", *MEMORY[0x24BDD4C58]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __66__HMDAppleMediaAccessory_handleRemoveManagedConfigurationProfile___block_invoke_319;
      v19[3] = &unk_24E79BD80;
      v20 = v4;
      -[HMDAppleMediaAccessory _removeManagedConfigurationProfileWithIdentifier:completion:](v6, "_removeManagedConfigurationProfileWithIdentifier:completion:", v9, v19);
      v10 = v20;
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = v6;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil identifier", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v10);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Relaying remove managed configuration profile request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __66__HMDAppleMediaAccessory_handleRemoveManagedConfigurationProfile___block_invoke;
    v21[3] = &unk_24E799400;
    v21[4] = v12;
    v22 = v4;
    -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v12, "_relayRequestMessage:responseHandler:", v22, v21);

  }
}

- (void)handleInstallManagedConfigurationProfile:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAppleMediaAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDAppleMediaAccessory *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received install managed configuration profile request", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDAppleMediaAccessory isCurrentAccessory](v6, "isCurrentAccessory"))
  {
    objc_msgSend(v4, "dataForKey:", *MEMORY[0x24BDD4C60]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __67__HMDAppleMediaAccessory_handleInstallManagedConfigurationProfile___block_invoke_320;
      v19[3] = &unk_24E7967E8;
      v20 = v4;
      -[HMDAppleMediaAccessory _installManagedConfigurationProfileWithData:completion:](v6, "_installManagedConfigurationProfileWithData:completion:", v9, v19);
      v10 = v20;
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = v6;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@No profile data", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v10);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Relaying remove managed configuration profile request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __67__HMDAppleMediaAccessory_handleInstallManagedConfigurationProfile___block_invoke;
    v21[3] = &unk_24E799400;
    v21[4] = v12;
    v22 = v4;
    -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v12, "_relayRequestMessage:responseHandler:", v22, v21);

  }
}

- (void)_removeManagedConfigurationProfileWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v11;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing managed configuration profile: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = (void *)MEMORY[0x227676638]();
  v13 = v9;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Managed Configuration Profile is not supported", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v19 = (void *)v17;
      v7[2](v7, v17);

    }
  }
  else
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil managed configuration profile identifier", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }

}

- (void)_installManagedConfigurationProfileWithData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Installing managed configuration profile", (uint8_t *)&v20, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  v12 = (void *)MEMORY[0x227676638]();
  v13 = v9;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Managed Configuration Profile is not supported", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v19 = (void *)v17;
      v7[2](v7, 0, v17);

    }
  }
  else
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Passed nil managed configuration profile data", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }

}

- (void)updateReachabilityOfCurrentDevice
{
  void *v3;
  HMDAppleMediaAccessory *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Updating reachability to YES as this is the current device", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDAccessory setReachable:](v4, "setReachable:", 1);
  }
}

- (BOOL)isDeviceReachable
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_deviceReachable;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)setDeviceReachable:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_deviceReachable == v3)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    self->_deviceReachable = v3;
    os_unfair_recursive_lock_unlock();
    -[HMDAppleMediaAccessory notifyClientsOfUpdatedAccessoryControllableValue:](self, "notifyClientsOfUpdatedAccessoryControllableValue:", v3);
  }
}

- (void)notifyClientsOfUpdatedAccessoryControllableValue:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v3 = a3;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory notifyClientsOfUpdatedAccessoryControllableValue:](&v8, sel_notifyClientsOfUpdatedAccessoryControllableValue_);
  if (v3)
  {
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("HMDAccessoryNotificationKey");
    v10[0] = self;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("HMDAppleMediaAccessoryDeviceIsReachableNotification"), v6, v7);

  }
}

- (id)deviceMonitor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secureRemoteTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)startMonitoringReachability
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("HMDRemoteDeviceIsReachableNotification"), 0);

  -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("HMDRemoteDeviceIsNotReachableNotification"), 0);

  -[HMDAppleMediaAccessory device](self, "device");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleDeviceIsReachable_, CFSTR("HMDRemoteDeviceIsReachableNotification"), 0);

    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleDeviceIsNotReachable_, CFSTR("HMDRemoteDeviceIsNotReachableNotification"), 0);

    -[HMDAppleMediaAccessory deviceMonitor](self, "deviceMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unreachableDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v11);

    -[HMDAppleMediaAccessory setDeviceReachable:](self, "setDeviceReachable:", v9 ^ 1u);
    -[HMDAppleMediaAccessory deviceMonitor](self, "deviceMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startMonitoringDevice:withInitialReachability:forClient:", v11, 0, self);

  }
}

- (void)handleDeviceIsReachable:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[HMDAccessory workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__HMDAppleMediaAccessory_handleDeviceIsReachable___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v7, block);

  }
}

- (void)handleDeviceIsNotReachable:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[HMDAccessory workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__HMDAppleMediaAccessory_handleDeviceIsNotReachable___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v7, block);

  }
}

- (void)addAdvertisement:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring added advertisement: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)removeAdvertisement:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring removed advertisement: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (BOOL)isRemotelyReachable
{
  BOOL v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_deviceReachable || self->super.super._remotelyReachable;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setRemotelyReachable:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->super.super._remotelyReachable != v3)
    self->super.super._remotelyReachable = v3;
  os_unfair_recursive_lock_unlock();
}

- (int64_t)reachableTransports
{
  int64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDAppleMediaAccessory;
  v3 = -[HMDMediaAccessory reachableTransports](&v5, sel_reachableTransports);
  if (-[HMDAccessory isReachable](self, "isReachable"))
    v3 |= 0x10uLL;
  if (-[HMDAppleMediaAccessory isRemotelyReachable](self, "isRemotelyReachable"))
    return v3 | 8;
  else
    return v3;
}

- (id)runtimeState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory runtimeState](&v9, sel_runtimeState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v10 = *MEMORY[0x24BDD4B10];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDAppleMediaAccessory isDeviceReachable](self, "isDeviceReachable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (void)_handleUpdatedName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory _handleUpdatedName:](&v3, sel__handleUpdatedName_, a3);
}

- (HMFPairingIdentity)pairingIdentity
{
  HMFPairingIdentity *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_pairingIdentity;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)notifyFrameworkOfUpdatedPairingIdentity
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE3F1D0];
  v4 = *MEMORY[0x24BDD4D18];
  v5 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTarget:", v6);
  objc_msgSend(v3, "messageWithName:destination:payload:", v4, v7, MEMORY[0x24BDBD1B8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of updated accessory pairing identity", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDAccessory msgDispatcher](v10, "msgDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:", v8);

}

- (void)_handleTriggerPairingIdentityUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  HMDAppleMediaAccessory *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638](objc_msgSend(v4, "respondWithSuccess"));
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Will trigger notification for updated pairing identity for accessory: %@ with message HMAccessoryPairingIdentityUpdatedNotification", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAppleMediaAccessory notifyFrameworkOfUpdatedPairingIdentity](v6, "notifyFrameworkOfUpdatedPairingIdentity");

}

- (void)setPairingIdentity:(id)a3
{
  HMFPairingIdentity *v4;
  HMFPairingIdentity *pairingIdentity;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v4 = (HMFPairingIdentity *)objc_msgSend(v6, "copy");
  pairingIdentity = self->_pairingIdentity;
  self->_pairingIdentity = v4;

  os_unfair_recursive_lock_unlock();
}

- (BOOL)supportsUserManagement
{
  return 0;
}

- (void)addUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  HMDAppleMediaAccessory *v9;
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Does not support user management", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);

  }
}

- (void)removeUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  HMDAppleMediaAccessory *v9;
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Does not support user management", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);

  }
}

- (void)pairingsWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Does not support user management", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);

  }
}

- (BOOL)supportsSettings
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;

  -[HMDAccessory identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)_mediaRouteIdentifier;
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "productClass");

  if (v6 != 6)
  {
LABEL_5:
    -[HMDAppleMediaAccessory device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "productInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "productClass") == 6;

    return v7;
  }
  return 1;
}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HMDUserNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v12;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling removed user: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v9);

}

- (unint64_t)supportedStereoPairVersions
{
  unint64_t supportedStereoPairVersions;

  os_unfair_recursive_lock_lock_with_options();
  supportedStereoPairVersions = self->_supportedStereoPairVersions;
  os_unfair_recursive_lock_unlock();
  return supportedStereoPairVersions;
}

- (void)setSupportedStereoPairVersions:(unint64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  if (self->_supportedStereoPairVersions != a3)
    self->_supportedStereoPairVersions = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)handleRoomNameChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory handleRoomNameChanged:](&v14, sel_handleRoomNameChanged_, v4);
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
    -[HMDAccessory room](self, "room");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if (v9)
    {
      if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
      {
        objc_msgSend(v4, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hmf_stringForKey:", CFSTR("kRoomOldNameKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDAppleMediaAccessory metricsDispatcher](self, "metricsDispatcher");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "submitRoomChangeEvent:previousRoom:", v13, v11);

      }
    }
  }

}

- (void)handleRoomChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory handleRoomChanged:](&v14, sel_handleRoomChanged_, v4);
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
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory uuid](self, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "hmf_isEqualToUUID:", v9))
    {
LABEL_8:

      goto LABEL_9;
    }
    v10 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");

    if (v10)
    {
      objc_msgSend(v4, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmf_stringForKey:", CFSTR("kRoomOldNameKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDAppleMediaAccessory metricsDispatcher](self, "metricsDispatcher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory room](self, "room");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "submitRoomChangeEvent:previousRoom:", v13, v8);

      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)handleCurrentDeviceIRKUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAppleMediaAccessory *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceIRK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDAppleMediaAccessory postDeviceIRKIfDifferent:](self, "postDeviceIRKIfDifferent:", v6);
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
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@No device IRK in notification", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)postDeviceIRKIfDifferent:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  HMDAppleMediaAccessory *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  HMDAppleMediaAccessory *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDAppleMediaAccessory *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDAppleMediaAccessory *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v8;
    v48 = 2112;
    v49 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Posting device IRK: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessory home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAppleMediaAccessory eventForwarder](v6, "eventForwarder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory eventStoreReadHandle](v6, "eventStoreReadHandle");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v4 && v11 && v12 && v10)
  {
    v14 = (void *)MEMORY[0x24BDD73A0];
    v15 = *MEMORY[0x24BDD4B98];
    -[HMDAccessory uuid](v6, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topicFromSuffixID:homeUUID:accessoryUUID:", v15, v10, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v17;
    objc_msgSend(v13, "lastEventForTopic:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v6;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@No previously cached IRK", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
    }
    objc_msgSend(v18, "encodedData");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (!v18 || v23)
    {
      if (v23 && objc_msgSend(v4, "isEqualToData:", v23))
      {
        v33 = (void *)MEMORY[0x227676638]();
        v34 = v6;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v36;
          v48 = 2112;
          v49 = v4;
          _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Skipping posting already cached device IRK: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        v37 = v44;
        goto LABEL_25;
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = v6;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = v25;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v28;
        v48 = 2112;
        v49 = v18;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode cached device IRK from event: %@", buf, 0x16u);

        v25 = v43;
      }

      objc_autoreleasePoolPop(v25);
    }
    v38 = objc_alloc(MEMORY[0x24BE4ED90]);
    -[HMDAccessory uuid](v6, "uuid");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "UUIDString");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v41 = (void *)objc_msgSend(v38, "initWithSource:cachePolicy:combineType:timestamp:", v40, 2, 2);

    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4ED80]), "initWithEventData:metadata:", v4, v41);
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __51__HMDAppleMediaAccessory_postDeviceIRKIfDifferent___block_invoke;
    v45[3] = &unk_24E79BD80;
    v45[4] = v6;
    v37 = v44;
    objc_msgSend(v11, "forwardEvent:topic:completion:", v42, v44, v45);

LABEL_25:
    goto LABEL_26;
  }
  v29 = (void *)MEMORY[0x227676638]();
  v30 = v6;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v47 = v32;
    v48 = 2112;
    v49 = v4;
    v50 = 2112;
    v51 = v11;
    v52 = 2112;
    v53 = v13;
    v54 = 2112;
    v55 = v10;
    _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to post deviceIRK: %@ due to missing dependencies eventforwarder: %@ event store read handle: %@ homeUUID: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v29);
LABEL_26:

}

- (HMFSoftwareVersion)softwareVersion
{
  HMFSoftwareVersion *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_softwareVersion;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setSoftwareVersion:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) != 0)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    objc_storeStrong((id *)&self->_softwareVersion, a3);
    os_unfair_recursive_lock_unlock();
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("HMDAppleMediaAccessorySoftwareVersionUpdatedNotification"), self);

  }
}

- (void)_updateSoftwareVersion:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
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
      objc_msgSend(v4, "versionString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating software version to: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAppleMediaAccessory transactionWithObjectChangeType:](v6, "transactionWithObjectChangeType:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "setSoftwareVersion:", v4);
    -[HMDAccessory home](v6, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "backingStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transaction:options:", CFSTR("Update Software Version"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "add:", v12);
    objc_msgSend(v16, "run");

  }
}

- (BOOL)supportsSoftwareUpdate
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[HMDAccessory identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)_mediaRouteIdentifier;
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "productClass");

    if (v6 == 6)
      return 1;
  }
  else
  {

  }
  return -[HMDAppleMediaAccessory isHomePod](self, "isHomePod");
}

- (void)_applySoftwareUpdateModel:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  if (a4)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = a4;
    objc_msgSend(v5, "hmErrorWithCode:", 48);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a4 + 2))(v6, v7);

  }
}

- (BOOL)_allowSoftwareUpdateChangeFromSource:(unint64_t)a3
{
  return 0;
}

- (void)_startUpdate:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;
  void *v13;
  HMDAppleMediaAccessory *v14;
  NSObject *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  HMDAppleMediaAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDAppleMediaAccessory *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDAppleMediaAccessory *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDAppleMediaAccessory *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  void (**v47)(_QWORD, _QWORD, _QWORD);
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v8;
    v51 = 2112;
    v52 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting update for message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "dataForKey:", *MEMORY[0x24BDD6DF8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "deserializeObjectWithData:allowedClass:frameworkClasses:", v9, objc_opt_class(), &unk_24E970FE8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[HMDAccessory home](v6, "home");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isAdminUser") & 1) != 0)
      {
        +[HMDSoftwareUpdateStartedEvent eventUpdateStartedWithAutomaticUpdateEnabled:](HMDSoftwareUpdateStartedEvent, "eventUpdateStartedWithAutomaticUpdateEnabled:", objc_msgSend(v11, "isAutomaticSoftwareUpdateEnabled"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (-[HMDAppleMediaAccessory isCurrentAccessory](v6, "isCurrentAccessory"))
        {
          v13 = (void *)MEMORY[0x227676638]();
          v14 = v6;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v50 = v16;
            v51 = 2112;
            v52 = v10;
            _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Received request to start update: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v13);
          -[HMDAppleMediaAccessory softwareUpdateInstallProvider](v14, "softwareUpdateInstallProvider");
          v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_initWeak((id *)buf, v14);
            v41[0] = MEMORY[0x24BDAC760];
            v41[1] = 3221225472;
            v41[2] = __39__HMDAppleMediaAccessory__startUpdate___block_invoke_357;
            v41[3] = &unk_24E791130;
            objc_copyWeak(&v45, (id *)buf);
            v42 = v10;
            v12 = v12;
            v43 = v12;
            v44 = v4;
            objc_msgSend(v17, "startUpdate:completionHandler:", v42, v41);

            objc_destroyWeak(&v45);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            v35 = (void *)MEMORY[0x227676638]();
            v36 = v14;
            HMFGetOSLogHandle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v50 = v38;
              _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Software update install not supported", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v35);
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "submitLogEvent:error:", v12, v39);

            objc_msgSend(v4, "respondWithError:", v39);
            v17 = 0;
          }
        }
        else
        {
          v46[0] = MEMORY[0x24BDAC760];
          v46[1] = 3221225472;
          v46[2] = __39__HMDAppleMediaAccessory__startUpdate___block_invoke;
          v46[3] = &unk_24E799400;
          v12 = v12;
          v47 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
          v48 = v4;
          -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v6, "_relayRequestMessage:responseHandler:", v48, v46);

          v17 = v47;
        }
      }
      else
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = v6;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "currentUser");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v32;
          v51 = 2112;
          v52 = v33;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Only administrators may start updates, current user: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        objc_msgSend(v4, "responseHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
          goto LABEL_30;
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 17, CFSTR("Insufficient privileges."), CFSTR("Current user is not an administrator."), 0);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, _QWORD))v17)[2](v17, v12, 0);
      }

    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v6;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v27;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Invalid software update in message payload", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(v4, "responseHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        v10 = 0;
LABEL_31:

        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 22);
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "responseHandler");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, v11, 0);
    }

LABEL_30:
    goto LABEL_31;
  }
  v18 = (void *)MEMORY[0x227676638]();
  v19 = v6;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v21;
    v51 = 2112;
    v52 = v22;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized software update from message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  objc_msgSend(v4, "responseHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v10, 0);
    goto LABEL_30;
  }
LABEL_32:

}

- (void)handleDeleteSiriHistoryRequest:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  HMDAppleMediaAccessoryDeleteSiriHistoryOperation *v11;
  void (**v12)(void);
  void *v13;
  HMDAppleMediaAccessoryDeleteSiriHistoryOperation *v14;
  void *v15;
  id v16;
  void *v17;
  HMDAppleMediaAccessory *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDAppleMediaAccessory *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received delete siri history request", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDAppleMediaAccessory isCurrentAccessory](v6, "isCurrentAccessory"))
  {
    objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "productClass") == 6;

    if (v10)
    {
      v11 = [HMDAppleMediaAccessoryDeleteSiriHistoryOperation alloc];
      -[HMDAppleMediaAccessory settingsConnectionFactory](v6, "settingsConnectionFactory");
      v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v12[2]();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMDAppleMediaAccessoryDeleteSiriHistoryOperation initWithSettingsConnection:](v11, "initWithSettingsConnection:", v13);

      objc_initWeak((id *)buf, v14);
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __57__HMDAppleMediaAccessory_handleDeleteSiriHistoryRequest___block_invoke_359;
      v26[3] = &unk_24E7965D0;
      objc_copyWeak(&v28, (id *)buf);
      v26[4] = v6;
      v27 = v4;
      -[HMDAppleMediaAccessoryDeleteSiriHistoryOperation setCompletionBlock:](v14, "setCompletionBlock:", v26);
      objc_msgSend(MEMORY[0x24BE3F268], "defaultScheduler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v15, "performOperation:", v14);

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = v6;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v24;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Attempted to delete siri history on unsupported device", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v25);

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v6;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Relaying delete siri history request to current accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __57__HMDAppleMediaAccessory_handleDeleteSiriHistoryRequest___block_invoke;
    v29[3] = &unk_24E799400;
    v29[4] = v18;
    v30 = v4;
    -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v18, "_relayRequestMessage:responseHandler:", v30, v29);

  }
}

- (void)handleUpdatePreferredMediaUser:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDAppleMediaAccessory *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDAppleMediaAccessory *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDAppleMediaAccessory *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  HMDAppleMediaAccessory *v41;
  NSObject *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "productClass");

    if (v6 == 6)
    {
      objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD4D30]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "unsignedIntegerValue") == 1)
      {
        objc_msgSend(v4, "uuidForKey:", CFSTR("kUserUUIDKey"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessory home](self, "home");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "userWithUUID:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = 1;
LABEL_22:
          v30 = (void *)MEMORY[0x227676638]();
          v31 = self;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v47 = v33;
            _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Handling update preferred media user notification", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v30);
          -[HMDAccessory preferredMediaUserUUID](v31, "preferredMediaUserUUID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = HMFEqualObjects();

          if (v35)
          {
            -[HMDAccessory preferredMediaUserSelectionTypeNumber](v31, "preferredMediaUserSelectionTypeNumber");
            v36 = objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              v37 = (void *)v36;
              -[HMDAccessory preferredMediaUserSelectionTypeNumber](v31, "preferredMediaUserSelectionTypeNumber");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "unsignedIntegerValue");

              if (v11 == v39)
              {
                v40 = (void *)MEMORY[0x227676638]();
                v41 = v31;
                HMFGetOSLogHandle();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v47 = v43;
                  _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@User already matches.", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v40);
                objc_msgSend(v4, "respondWithSuccess");
              }
            }
          }

          goto LABEL_31;
        }
        v24 = (void *)MEMORY[0x227676638]();
        v25 = self;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessory home](v25, "home");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v47 = v27;
          v48 = 2112;
          v49 = v8;
          v50 = 2112;
          v51 = v28;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Did not find user with uuid %@ in home %@.", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v29);

      }
      else
      {
        if (!objc_msgSend(v7, "unsignedIntegerValue"))
        {
          v11 = 0;
          v8 = 0;
          goto LABEL_22;
        }
        v20 = (void *)MEMORY[0x227676638]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v23;
          v48 = 2112;
          v49 = v7;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unexpected selection type %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v8);
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
        *(_DWORD *)buf = 138543362;
        v47 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot set preferred user on device class.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v7);
    }

    goto LABEL_31;
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v15;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Relaying preferred media user update.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __57__HMDAppleMediaAccessory_handleUpdatePreferredMediaUser___block_invoke;
  v44[3] = &unk_24E799400;
  v44[4] = v13;
  v45 = v4;
  -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v13, "_relayRequestMessage:responseHandler:", v45, v44);

LABEL_31:
}

- (void)updatePreferredMediaUserWithUUID:(id)a3 selectionType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = objc_alloc(MEMORY[0x24BDD73B8]);
  objc_msgSend(v8, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithUUIDString:selectionType:", v11, a4);

  -[HMDAppleMediaAccessory preferredMediaUserEventController](self, "preferredMediaUserEventController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __84__HMDAppleMediaAccessory_updatePreferredMediaUserWithUUID_selectionType_completion___block_invoke;
  v16[3] = &unk_24E786D50;
  objc_copyWeak(v19, &location);
  v14 = v8;
  v17 = v14;
  v19[1] = (id)a4;
  v15 = v9;
  v18 = v15;
  objc_msgSend(v13, "updatePreferredMediaUserWithPrimaryUserInfo:completion:", v12, v16);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

- (void)updatePreferredMediaUser:(id)a3 selectionType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v6);
  -[HMDAccessory setPreferredMediaUserUUID:](self, "setPreferredMediaUserUUID:", v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory setPreferredMediaUserSelectionTypeNumber:](self, "setPreferredMediaUserSelectionTypeNumber:", v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory preferredMediaUserUUID](v10, "preferredMediaUserUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory preferredMediaUserSelectionTypeNumber](v10, "preferredMediaUserSelectionTypeNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updated preferred media user UUID: %@, type: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v9);

}

- (void)runTransactionWithPreferredMediaUserUUID:(id)a3 selectionType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDAppleMediaAccessory *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v13;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Run transaction and set preferred media user: %@, type: %@.", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDAppleMediaAccessory transactionWithObjectChangeType:](v11, "transactionWithObjectChangeType:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_msgSend(v17, "setPreferredMediaUserUUID:", v8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPreferredUserSelectionType:", v18);

  v20 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessory runTransactionWithModels:label:completion:](v11, "runTransactionWithModels:label:completion:", v19, CFSTR("Update preferred media user"), v9);
}

- (HMDDeviceAddress)deviceAddress
{
  HMDDeviceAddress *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_deviceAddress;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setDeviceAddress:(id)a3
{
  HMDDeviceAddress *v4;
  HMDDeviceAddress *deviceAddress;

  v4 = (HMDDeviceAddress *)a3;
  os_unfair_recursive_lock_lock_with_options();
  deviceAddress = self->_deviceAddress;
  self->_deviceAddress = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSData)deviceIRK
{
  void *v3;
  void *v4;
  void *v5;
  NSData *v6;
  NSData *deviceIRK;
  NSData *v8;

  -[HMDAppleMediaAccessory device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rpIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIRK");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_lock_with_options();
  deviceIRK = self->_deviceIRK;
  if (!deviceIRK)
    deviceIRK = v6;
  v8 = deviceIRK;
  os_unfair_recursive_lock_unlock();

  return v8;
}

- (void)setDeviceIRK:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  HMDRPIdentity *v8;
  id v9;

  v9 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_storeStrong((id *)&self->_deviceIRK, a3);
  os_unfair_recursive_lock_unlock();
  if (v9)
  {
    v5 = objc_alloc(MEMORY[0x24BE3F190]);
    v6 = (void *)objc_msgSend(v5, "initWithType:size:data:", *MEMORY[0x24BE3EBE8], *MEMORY[0x24BE3EBE0], v9);
    -[HMDAppleMediaAccessory device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMDRPIdentity initWithDeviceIRK:]([HMDRPIdentity alloc], "initWithDeviceIRK:", v6);
    objc_msgSend(v7, "setRpIdentity:", v8);

  }
}

- (void)createSoftwareUpdateEventListenerIfNecessary
{
  void *v3;
  HMDAppleMediaAccessory *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAppleMediaAccessory *v11;
  NSObject *v12;
  void *v13;
  HMDSoftwareUpdateEventListenerContext *v14;
  void *v15;
  HMDSoftwareUpdateEventListenerContext *v16;
  HMDSoftwareUpdateEventListener *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (+[HMDDeviceCapabilities supportsUserNotifications](HMDDeviceCapabilities, "supportsUserNotifications"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating softwareUpdateEventListener", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDAccessory home](v4, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localAndRemoteSubscriptionProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = v4;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to find subscriptionProvider while creating softwareUpdateEventListener", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
    }
    v14 = [HMDSoftwareUpdateEventListenerContext alloc];
    -[HMDAppleMediaAccessory eventStoreReadHandle](v4, "eventStoreReadHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDSoftwareUpdateEventListenerContext initWithAccessory:subscriptionProvider:eventStoreReadHandle:](v14, "initWithAccessory:subscriptionProvider:eventStoreReadHandle:", v4, v9, v15);

    v17 = -[HMDSoftwareUpdateEventListener initWithContext:]([HMDSoftwareUpdateEventListener alloc], "initWithContext:", v16);
    -[HMDAppleMediaAccessory setSoftwareUpdateListener:](v4, "setSoftwareUpdateListener:", v17);

    -[HMDAppleMediaAccessory softwareUpdateListener](v4, "softwareUpdateListener");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerForEvents");

  }
}

- (void)handleSoftwareUpdateV2ScanRepeatedlyAndApplyMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMDAppleMediaAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Handling SoftwareUpdateV2ScanRepeatedlyAndApplyMessage: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD4FD8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HMDAccessory workQueue](v6, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __78__HMDAppleMediaAccessory_handleSoftwareUpdateV2ScanRepeatedlyAndApplyMessage___block_invoke;
    v16[3] = &unk_24E79C268;
    v16[4] = v6;
    v17 = v9;
    dispatch_async(v10, v16);

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@SRAISU: Missing value for required message key: HMAccessorySoftwareUpdateControllerV2MessageKeyShouldApplyUpdate", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);

  }
}

- (void)_scanForSoftwareUpdateRepeatedlyAndInstallUpdate:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  HMDAppleMediaAccessory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  HMDAppleMediaAccessory *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessory workQueue](self, "workQueue");
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
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Scanning for software update repeatedly with shouldInstallUpdate: %@", (uint8_t *)&v28, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDAppleMediaAccessory softwareUpdateListener](v7, "softwareUpdateListener");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSoftwareUpdateAvailable");

  -[HMDAppleMediaAccessory softwareUpdateListener](v7, "softwareUpdateListener");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "softwareUpdateDescriptorForLastEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v7;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@SRAISU: isSoftwareUpdateAvailable: %@ forDescriptor: %@", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    if (v14)
      v21 = v12;
    else
      v21 = 0;
    if (v21 == 1)
    {
      -[HMDAppleMediaAccessory _applySoftwareUpdateWithDescriptor:](v17, "_applySoftwareUpdateWithDescriptor:", v14);
      goto LABEL_17;
    }
    v15 = -[HMDAppleMediaAccessory setShouldApplySoftwareUpdateWhenFound:](v17, "setShouldApplySoftwareUpdateWhenFound:", 1);
  }
  if (v12)
  {
    v22 = (void *)MEMORY[0x227676638](v15);
    v23 = v7;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v25;
      v30 = 2112;
      v31 = v26;
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Skipping scan because isSoftwareUpdateAvailable: %@ forDescriptor: %@", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
  }
  v27 = -[HMDAppleMediaAccessory _scanForSoftwareUpdateWithRetries](v7, "_scanForSoftwareUpdateWithRetries");
LABEL_17:

}

- (void)handleSoftwareUpdateDidBecomeAvailableWithDescriptor:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__HMDAppleMediaAccessory_handleSoftwareUpdateDidBecomeAvailableWithDescriptor___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_applySoftwareUpdateWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAppleMediaAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
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
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Applying software update with descriptor: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAppleMediaAccessory _softwareUpdateV2FromDescriptor:](v6, "_softwareUpdateV2FromDescriptor:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD7470], "softwareUpdateFromSoftwareUpdateV2:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x227676638]();
  v12 = v6;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v14;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Created HMSoftwareUpdate: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v22 = *MEMORY[0x24BDD6DF8];
  encodeRootObject();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDAccessory uuid](v12, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithTarget:", v18);

  objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:destination:payload:", *MEMORY[0x24BDD6DE8], v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __61__HMDAppleMediaAccessory__applySoftwareUpdateWithDescriptor___block_invoke;
  v21[3] = &unk_24E79B7E0;
  v21[4] = v12;
  objc_msgSend(v20, "setResponseHandler:", v21);
  -[HMDAppleMediaAccessory _startUpdate:](v12, "_startUpdate:", v20);

}

- (id)_softwareUpdateV2FromDescriptor:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating HMSoftwareUpdateV2 for descriptor: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x24BDD7A10], "softwareUpdateFromDescriptor:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_scanForSoftwareUpdateWithRetries
{
  void *v3;
  HMDAppleMediaAccessory *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  HMDAppleMediaAccessory *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _QWORD v35[6];

  v35[5] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Scanning for software update with retries.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 360.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 900.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1800.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 7200.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 21600.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (isInternalBuild()
    && (objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "preferenceForKey:", CFSTR("HMDAppleMediaAccessoryShouldOverrideRepeatScanningIntervals")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "BOOLValue"),
        v14,
        v13,
        v15))
  {
    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferenceForKey:", CFSTR("HMDAppleMediaAccessoryRepeatScanningIntervalsOverride"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    v21 = (void *)MEMORY[0x227676638]();
    v22 = v4;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v24;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Overriding retries with new retries: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
  }
  else
  {
    v20 = v12;
  }
  objc_initWeak((id *)buf, v4);
  v25 = (void *)MEMORY[0x24BE6B608];
  -[HMDAccessory workQueue](v4, "workQueue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __59__HMDAppleMediaAccessory__scanForSoftwareUpdateWithRetries__block_invoke;
  v29[3] = &unk_24E786D78;
  objc_copyWeak(&v30, (id *)buf);
  objc_msgSend(v25, "futureWithRetryIntervals:workQueue:block:", v20, v26, v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v30);

  objc_destroyWeak((id *)buf);
  return v27;
}

- (id)_scanForSoftwareUpdate
{
  void *v3;
  HMDAppleMediaAccessory *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Scanning for software update.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDAccessory uuid](v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);

  v10 = (void *)MEMORY[0x24BE3F1D0];
  v22 = *MEMORY[0x24BDD4FD0];
  v23 = &unk_24E96B6F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageWithName:destination:payload:", *MEMORY[0x24BDD4FE0], v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x24BE6B608]);
  objc_initWeak((id *)buf, v4);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __48__HMDAppleMediaAccessory__scanForSoftwareUpdate__block_invoke;
  v19 = &unk_24E798D90;
  objc_copyWeak(&v21, (id *)buf);
  v14 = v13;
  v20 = v14;
  objc_msgSend(v12, "setResponseHandler:", &v16);
  -[HMDAppleMediaAccessory handleSoftwareUpdateV2Scan:](v4, "handleSoftwareUpdateV2Scan:", v12, v16, v17, v18, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

  return v14;
}

- (void)handleSoftwareUpdateV2Scan:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
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
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling SoftwareUpdateV2Scan", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (!-[HMDAppleMediaAccessory isCurrentAccessory](v6, "isCurrentAccessory"))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = v6;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Relaying SoftwareUpdateV2Scan", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __53__HMDAppleMediaAccessory_handleSoftwareUpdateV2Scan___block_invoke;
    v13[3] = &unk_24E799400;
    v13[4] = v10;
    v14 = v4;
    -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v10, "_relayRequestMessage:responseHandler:", v14, v13);

  }
}

- (HMFWiFiNetworkInfo)wifiNetworkInfo
{
  HMFWiFiNetworkInfo *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_wifiNetworkInfo;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setWifiNetworkInfo:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) != 0)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    objc_storeStrong((id *)&self->_wifiNetworkInfo, a3);
    os_unfair_recursive_lock_unlock();
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("HMDAppleMediaAccessoryWiFiNetworkInfoUpdatedNotification"), self);

  }
}

- (void)setLastStagedWifiNetworkInfo:(id)a3
{
  HMFWiFiNetworkInfo *v4;
  HMFWiFiNetworkInfo *lastStagedWifiNetworkInfo;

  v4 = (HMFWiFiNetworkInfo *)a3;
  os_unfair_recursive_lock_lock_with_options();
  lastStagedWifiNetworkInfo = self->_lastStagedWifiNetworkInfo;
  self->_lastStagedWifiNetworkInfo = v4;

  os_unfair_recursive_lock_unlock();
}

- (HMFWiFiNetworkInfo)lastStagedWifiNetworkInfo
{
  HMFWiFiNetworkInfo *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_lastStagedWifiNetworkInfo;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)updateWiFiNetworkInfo
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessory workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HMDAppleMediaAccessory_updateWiFiNetworkInfo__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleCurrentNetworkChangedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Received current network changed notification: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAppleMediaAccessory updateWiFiNetworkInfo](v6, "updateWiFiNetworkInfo");

}

- (void)_relayRequestMessage:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAppleMediaAccessory *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDAppleMediaAccessory *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isRemote"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot relay a remote message", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "respondWithError:", v12);
  }
  else
  {
    -[HMDAccessory home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messageDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HMDAppleMediaAccessory remoteMessageDestination](self, "remoteMessageDestination");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v6, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v6, "qualityOfService");
        objc_msgSend(v6, "messagePayload");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", v16, v17, v15, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)buf, self);
        v28 = MEMORY[0x24BDAC760];
        v29 = 3221225472;
        v30 = __63__HMDAppleMediaAccessory__relayRequestMessage_responseHandler___block_invoke;
        v31 = &unk_24E79AFA0;
        objc_copyWeak(&v33, (id *)buf);
        v32 = v7;
        objc_msgSend(v19, "setResponseHandler:", &v28);
        objc_msgSend(v12, "sendMessage:", v19, v28, v29, v30, v31);

        objc_destroyWeak(&v33);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = self;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v35 = v27;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Cannot send message to unknown remote device", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "respondWithError:", v19);
      }

    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Not configured to relay messages", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "respondWithError:", v15);
    }

  }
}

- (id)remoteMessageDestination
{
  void *v3;
  HMDRemoteDeviceMessageDestination *v4;
  void *v5;
  void *v6;
  HMDRemoteDeviceMessageDestination *v7;

  -[HMDAppleMediaAccessory device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDAccessory messageTargetUUID](self, "messageTargetUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v4, "initWithTarget:device:", v5, v6);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)messageSendPolicy
{
  uint64_t v2;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    v2 = 81;
  else
    v2 = 65;
  return -[HMDHomeManagerXPCMessageSendPolicy initWithEntitlements:options:]([HMDHomeManagerXPCMessageSendPolicy alloc], "initWithEntitlements:options:", 5, v2);
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  HMDAppleMediaAccessoryModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAppleMediaAccessoryModel *v9;

  v5 = [HMDAppleMediaAccessoryModel alloc];
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  return v9;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  void *v4;

  -[HMDAppleMediaAccessory transactionWithObjectChangeType:](self, "transactionWithObjectChangeType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory populateModelObject:version:](self, "populateModelObject:version:", v4, 4);
  return v4;
}

- (void)populateModelObject:(id)a3 version:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  HMDDevice *device;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v40;
  void *v41;
  objc_super v42;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  v42.receiver = self;
  v42.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory populateModelObject:version:](&v42, sel_populateModelObject_version_, v8, a4);
  -[HMDAppleMediaAccessory device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("4.0"));
  v12 = objc_msgSend(v10, "isAtLeastVersion:", v11);

  v13 = isWatch();
  if (v13
    && (+[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        !objc_msgSend(v10, "supportsCloudDataSync")))
  {
    v15 = 1;
  }
  else
  {
    -[HMDAccessory home](self, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isOwnerUser") ^ 1;

    if (!v13)
    {
      if (!v12)
        goto LABEL_15;
      goto LABEL_11;
    }
  }

  if (!v12)
  {
LABEL_15:
    objc_msgSend(v9, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDeviceUUID:", v19);

    if (v15 && self->_device)
    {
      objc_msgSend(v8, "setDevice:");
      device = self->_device;
      self->_device = 0;

    }
    else
    {
      objc_msgSend(v8, "setDevice:", v9);
    }
    goto LABEL_19;
  }
LABEL_11:
  v16 = objc_msgSend(v9, "isCurrentDevice");
  if (a4 > 3)
    v17 = v16;
  else
    v17 = 0;
  if ((v17 | v15) == 1)
    goto LABEL_15;
LABEL_19:
  -[HMDAppleMediaAccessory remoteLoginHandler](self, "remoteLoginHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[HMDAppleMediaAccessory remoteLoginHandler](self, "remoteLoginHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "loggedInAccount");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObject();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLoggedInAccount:", v24);

  }
  -[HMDAppleMediaAccessory softwareVersion](self, "softwareVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[HMDAppleMediaAccessory softwareVersion](self, "softwareVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSoftwareVersion:", v26);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory variant](self, "variant"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVariant:", v27);

  -[HMDAppleMediaAccessory rawCapabilities](self, "rawCapabilities");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessoryCapabilities:", v28);

  -[HMDAppleMediaAccessory wifiNetworkInfo](self, "wifiNetworkInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[HMDAppleMediaAccessory wifiNetworkInfo](self, "wifiNetworkInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWifiNetworkInfo:", v30);

  }
  -[HMDAppleMediaAccessory pairingIdentity](self, "pairingIdentity");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "publicPairingIdentity");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[HMDAppleMediaAccessory pairingIdentity](self, "pairingIdentity");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "publicPairingIdentity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPairingIdentity:", v34);

  }
  if (-[HMDAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSupportedStereoPairVersions:", v35);

  }
  if (-[HMDAppleMediaAccessory supportsPreferredMediaUser](self, "supportsPreferredMediaUser"))
  {
    -[HMDAccessory preferredMediaUserUUID](self, "preferredMediaUserUUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredMediaUserUUID:", v36);

  }
  -[HMDAccessory preferredMediaUserSelectionTypeNumber](self, "preferredMediaUserSelectionTypeNumber");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[HMDAccessory preferredMediaUserSelectionTypeNumber](self, "preferredMediaUserSelectionTypeNumber");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredUserSelectionType:", v38);

  }
  if (-[HMDAppleMediaAccessory productColor](self, "productColor"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDAppleMediaAccessory productColor](self, "productColor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProductColor:", v39);

  }
  -[HMDAppleMediaAccessory idsIdentifier](self, "idsIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[HMDAppleMediaAccessory idsIdentifier](self, "idsIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdsIdentifier:", v41);

  }
}

- (id)backingStoreObjects:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  -[HMDAppleMediaAccessory modelObjectWithChangeType:](self, "modelObjectWithChangeType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory backingStoreObjectForMediaDestination](self, "backingStoreObjectForMediaDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "addObject:", v7);
  -[HMDAppleMediaAccessory backingStoreObjectForMediaDestinationControllerData](self, "backingStoreObjectForMediaDestinationControllerData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "addObject:", v8);
  v12.receiver = self;
  v12.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory backingStoreObjects:](&v12, sel_backingStoreObjects_, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v9);

  v10 = (void *)objc_msgSend(v6, "copy");
  return v10;
}

- (id)backingStoreObjectForMediaDestination
{
  void *v3;
  void *v4;

  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    -[HMDAppleMediaAccessory committedAudioDestination](self, "committedAudioDestination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[HMDMediaDestinationBackingStoreHandler backingStoreObjectForMediaDestination:](HMDMediaDestinationBackingStoreHandler, "backingStoreObjectForMediaDestination:", v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)backingStoreObjectForMediaDestinationControllerData
{
  void *v3;
  void *v4;

  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    -[HMDAppleMediaAccessory committedAudioDestinationControllerData](self, "committedAudioDestinationControllerData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[HMDMediaDestinationControllerBackingStoreHandler backingStoreObjectForData:](HMDMediaDestinationControllerBackingStoreHandler, "backingStoreObjectForData:", v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  objc_super v21;
  objc_super v22;
  _QWORD aBlock[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__129695;
    v28 = __Block_byref_object_dispose__129696;
    v29 = 0;
    objc_msgSend(v10, "responseHandler");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__HMDAppleMediaAccessory_transactionObjectUpdated_newValues_message___block_invoke;
      aBlock[3] = &unk_24E786DA0;
      aBlock[4] = &v24;
      v15 = _Block_copy(aBlock);
      objc_msgSend(v10, "setResponseHandler:", v15);

    }
    v22.receiver = self;
    v22.super_class = (Class)HMDAppleMediaAccessory;
    -[HMDMediaAccessory transactionObjectUpdated:newValues:message:](&v22, sel_transactionObjectUpdated_newValues_message_, 0, v11, v10);
    __transactionAccessoryUpdated_129698(self, v13, v10);
    if (v14)
      v14[2](v14, v25[5], 0);

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v16 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    if (v18)
    {
      -[HMDAppleMediaAccessory handleUpdatedMediaDestinationControllerModel:message:](self, "handleUpdatedMediaDestinationControllerModel:message:", v18, v10);
    }
    else
    {
      v16 = v16;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v16;
      else
        v19 = 0;
      v20 = v19;

      if (!v20)
      {
        v21.receiver = self;
        v21.super_class = (Class)HMDAppleMediaAccessory;
        -[HMDMediaAccessory transactionObjectUpdated:newValues:message:](&v21, sel_transactionObjectUpdated_newValues_message_, v8, v16, v10);
        goto LABEL_21;
      }
      -[HMDAppleMediaAccessory handleUpdatedMediaDestinationModel:message:](self, "handleUpdatedMediaDestinationModel:message:", v20, v10);
    }

  }
LABEL_21:

}

- (void)handleTransactionUpdatedPublicPairingIdentity:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HMDAppleMediaAccessory *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v11;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated accessory public pairing identity: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDAppleMediaAccessory pairingIdentity](v9, "pairingIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", v6);

    if (v13)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = v9;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Skipping already saved pairing identity", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
    }
    else
    {
      -[HMDAppleMediaAccessory setPairingIdentity:](v9, "setPairingIdentity:", v6);
      -[HMDAppleMediaAccessory notifyFrameworkOfUpdatedPairingIdentity](v9, "notifyFrameworkOfUpdatedPairingIdentity");
      objc_msgSend(v7, "markChanged");
    }
  }

}

- (void)handleUpdatedMediaDestinationControllerModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAppleMediaAccessory *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  HMDMediaDestinationController *v35;
  HMDMediaDestinationController *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDAppleMediaAccessory *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *context;
  void *v47;
  void *v48;
  uint64_t v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && !objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    -[HMDAppleMediaAccessory audioDestinationController](self, "audioDestinationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "backingStoreHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "transactionObjectUpdated:newValues:message:", v6, v6, v7);

    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v18;
        v52 = 2112;
        v53 = v6;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination controller with model: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v6, "availableDestinationModelIdentifiers");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = (void *)MEMORY[0x24BDBD1A8];
      if (v19)
        v21 = (void *)v19;
      v22 = v21;

      v23 = objc_alloc(MEMORY[0x24BDD7788]);
      objc_msgSend(v6, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parentUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "destinationModelIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "supportedOptions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v22;
      v49 = objc_msgSend(v23, "initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:", v24, v25, v26, objc_msgSend(v27, "unsignedIntegerValue"), v22);

      -[HMDAccessory home](v16, "home");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory backingStore](v16, "backingStore");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory msgDispatcher](v16, "msgDispatcher");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaAccessory notificationCenter](v16, "notificationCenter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "logEventSubmitter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v28;
      objc_msgSend(v28, "dailyScheduler");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v33;
      if (v29 && v30 && v31 && v32 && v33)
      {
        v35 = [HMDMediaDestinationController alloc];
        LOBYTE(v44) = -[HMDAppleMediaAccessory isCurrentAccessory](v16, "isCurrentAccessory");
        v36 = -[HMDMediaDestinationController initWithData:backingStore:messageDispatcher:notificationCenter:logEventSubmitter:dailyScheduler:targetDevice:dataSource:delegate:](v35, "initWithData:backingStore:messageDispatcher:notificationCenter:logEventSubmitter:dailyScheduler:targetDevice:dataSource:delegate:", v49, v29, v30, v31, v32, v34, v44, v16, v16);
        -[HMDAppleMediaAccessory setAudioDestinationController:](v16, "setAudioDestinationController:", v36);

        -[HMDAppleMediaAccessory audioDestinationController](v16, "audioDestinationController");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v47;
        objc_msgSend(v37, "configureWithHome:", v47);

        objc_msgSend(v7, "transactionResult");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "markChanged");

        objc_msgSend(v7, "transactionResult");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "markSaveToAssistant");

        v41 = (void *)v49;
        objc_msgSend(v7, "respondWithSuccess");
      }
      else
      {
        context = (void *)MEMORY[0x227676638]();
        v42 = v16;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v51 = v45;
          v52 = 2112;
          v53 = v29;
          v54 = 2112;
          v55 = v30;
          v56 = 2112;
          v57 = v31;
          v58 = 2112;
          v59 = v32;
          v60 = 2112;
          v61 = v34;
          _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new audio destination controller due to missing dependencies backing store: %@ message dispatcher: %@ notification center: %@ log submitter: %@ daily scheduler: %@", buf, 0x3Eu);

        }
        objc_autoreleasePoolPop(context);
        v41 = (void *)v49;
        v38 = v47;
      }

    }
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
      *(_DWORD *)buf = 138543618;
      v51 = v11;
      v52 = 2112;
      v53 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping transaction update: %@ due to Home Theater QFA enabled", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)handleUpdatedMediaDestinationModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  HMDMediaDestinationManager *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDMediaDestinationManager *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && !objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    -[HMDAppleMediaAccessory audioDestinationManager](self, "audioDestinationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "backingStoreHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "transactionObjectUpdated:newValues:message:", v6, v6, v7);

    }
    else
    {
      -[HMDAccessory home](self, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
      if (v15)
      {
        v39 = v15;
        if (v19)
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v20;
          v42 = 2112;
          v43 = v6;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination manager with model: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(v6, "supportedOptions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedIntegerValue");

        objc_msgSend(v6, "audioGroupIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_alloc(MEMORY[0x24BDD7780]);
        objc_msgSend(v6, "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "parentUUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v24, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:", v25, v26, v22, v23);

        v28 = [HMDMediaDestinationManager alloc];
        -[HMDAccessory msgDispatcher](v17, "msgDispatcher");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDMediaAccessory notificationCenter](v17, "notificationCenter");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessory backingStore](v17, "backingStore");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[HMDMediaDestinationManager initWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:](v28, "initWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:", v27, v29, v30, v31, -[HMDAppleMediaAccessory isCurrentAccessory](v17, "isCurrentAccessory"), v17, v17);
        -[HMDAppleMediaAccessory setAudioDestinationManager:](v17, "setAudioDestinationManager:", v32);

        -[HMDAppleMediaAccessory audioDestinationManager](v17, "audioDestinationManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v39;
        objc_msgSend(v33, "configureWithHome:currentAccessory:", v39, -[HMDAppleMediaAccessory isCurrentAccessory](v17, "isCurrentAccessory"));

        -[HMDAppleMediaAccessory audioDestinationManager](v17, "audioDestinationManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "messageHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleUpdatedDestination:", v27);

        objc_msgSend(v7, "transactionResult");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "markChanged");

        objc_msgSend(v7, "transactionResult");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "markSaveToAssistant");

        objc_msgSend(v7, "respondWithSuccess");
      }
      else
      {
        if (v19)
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v38;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to create audio destination manager due to no home", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "respondWithError:", v23);
      }

    }
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
      *(_DWORD *)buf = 138543618;
      v41 = v11;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping model: %@ due to home theater QFA", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

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
  objc_super v13;

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
    -[HMDAppleMediaAccessory handleRemovedMediaDestinationModel:message:](self, "handleRemovedMediaDestinationModel:message:", v9, v7);

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
      -[HMDAppleMediaAccessory handleRemovedMediaDestinationControllerModel:message:](self, "handleRemovedMediaDestinationControllerModel:message:", v12, v7);

    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)HMDAppleMediaAccessory;
      -[HMDAccessory transactionObjectRemoved:message:](&v13, sel_transactionObjectRemoved_message_, v10, v7);
    }
  }

}

- (void)handleRemovedMediaDestinationModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
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
    v24 = 138543618;
    v25 = v11;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling transaction removed media destination model: %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory audioDestination](v9, "audioDestination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "hmf_isEqualToUUID:", v14);

  if (v15)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Removing audio destination manager due to removed model transaction", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    -[HMDAppleMediaAccessory audioDestinationManager](v17, "audioDestinationManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory setAudioDestinationManager:](v17, "setAudioDestinationManager:", 0);
    -[HMDAppleMediaAccessory unsetAudioDestination](v17, "unsetAudioDestination");
    objc_msgSend(v20, "messageHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleUpdatedDestination:", 0);

    objc_msgSend(v7, "transactionResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "markChanged");

    objc_msgSend(v7, "transactionResult");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "markSaveToAssistant");

  }
  objc_msgSend(v7, "respondWithSuccess");

}

- (void)handleRemovedMediaDestinationControllerModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
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
    v22 = 138543618;
    v23 = v11;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling transaction removed media destination controller model: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAppleMediaAccessory audioDestinationController](v9, "audioDestinationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "hmf_isEqualToUUID:", v14);

  if (v15)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v19;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Removing audio destination controller: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    -[HMDAppleMediaAccessory setAudioDestinationController:](v17, "setAudioDestinationController:", 0);
    -[HMDAppleMediaAccessory unsetAudioDestinationControllerData](v17, "unsetAudioDestinationControllerData");
    objc_msgSend(v7, "transactionResult");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "markChanged");

    objc_msgSend(v7, "transactionResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "markSaveToAssistant");

  }
  objc_msgSend(v7, "respondWithSuccess");

}

- (void)deviceController:(id)a3 didUpdateDevice:(id)a4
{
  __HMDAppleMediaAccessoryHandleUpdatedDevice(self, a4);
}

- (id)messageReceiverChildren
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (objc_msgSend((id)-[HMDAppleMediaAccessory superclass](self, "superclass"), "instancesRespondToSelector:", sel_messageReceiverChildren))
  {
    v9.receiver = self;
    v9.super_class = (Class)HMDAppleMediaAccessory;
    -[HMDAccessory messageReceiverChildren](&v9, sel_messageReceiverChildren);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HMDAppleMediaAccessory remoteLoginHandler](self, "remoteLoginHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDAppleMediaAccessory remoteLoginHandler](self, "remoteLoginHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (id)availableDestinationIdentifiersForMediaDestinationController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessory home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory room](self, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaDestinationsInRoom:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v13, "containsHomeTheaterSupportedOptions", (_QWORD)v17))
        {
          objc_msgSend(v13, "uniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v15 = (void *)objc_msgSend(v7, "copy");
  return v15;
}

- (id)mediaDestinationController:(id)a3 destinationManagerWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaDestinationManagersWithHomeTheaterSupportedOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__HMDAppleMediaAccessory_mediaDestinationController_destinationManagerWithIdentifier___block_invoke;
  v11[3] = &unk_24E786DC8;
  v12 = v5;
  v8 = v5;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mediaDestinationController:(id)a3 destinationWithParentIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessory home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "destinationManagerWithParentIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

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
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not get home to derive destination from parent identifier: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (id)mediaDestinationController:(id)a3 rootDestinationWithDecendantIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessory home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "rootDestinationManagerWithDescendantDestinationIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

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
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not get home to derive root destination from destination identifier: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (id)mediaGroupLocalDataStorageForMediaDestinationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDAppleMediaAccessory *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessory home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "homeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "mediaGroupParticipantDataLocalStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
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
          v28 = v8;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media group participant data local storage on home manager: %@", (uint8_t *)&v25, 0x16u);

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
        v25 = 138543618;
        v26 = v19;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media group participant data local storage due to no home manager on home: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v10 = 0;
    }

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
      v25 = 138543362;
      v26 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media group participant data local storage due to no home", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v10 = 0;
  }

  return v10;
}

- (id)currentUserForMediaDestinationControllerMetricsEventDispatcher:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)mediaDestinationControllerMetricsEventDispatcher:(id)a3 destinationTypeForDestinationWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  HMDAppleMediaAccessory *v12;
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
  -[HMDAccessory home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "destinationTypeForDestinationWithIdentifier:", v7);
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
      v19 = v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not get home to derive destination identifier from parent destination identifier: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)currentDestinationTypeForMediaDestinationControllerMetricsEventDispatcher:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAppleMediaAccessory audioDestinationControllerData](self, "audioDestinationControllerData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "destinationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDAppleMediaAccessory mediaDestinationControllerMetricsEventDispatcher:destinationTypeForDestinationWithIdentifier:](self, "mediaDestinationControllerMetricsEventDispatcher:destinationTypeForDestinationWithIdentifier:", v4, v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
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
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get controller data for media destination controller metrics", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v8 = &unk_24E96B708;
  }

  return v8;
}

- (void)mediaDestinationControllerDidUpdateStagedValues:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDAppleMediaAccessory *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media destination controller did update staged values", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessory home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = *MEMORY[0x24BDD6628];
    -[HMDAccessory uuid](v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", v11, v12, 1);

    objc_msgSend(v10, "assistantSyncDataChanged:", v11);
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to handle expired values due to no home manager", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (id)mediaDestinationControllerWithData:(id)a3 backingStore:(id)a4 messageDispatcher:(id)a5 notificationCenter:(id)a6 logEventSubmitter:(id)a7 dailyScheduler:(id)a8 targetDevice:(BOOL)a9 dataSource:(id)a10 delegate:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HMDMediaDestinationController *v25;
  uint64_t v27;

  v17 = a11;
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  LOBYTE(v27) = a9;
  v25 = -[HMDMediaDestinationController initWithData:backingStore:messageDispatcher:notificationCenter:logEventSubmitter:dailyScheduler:targetDevice:dataSource:delegate:]([HMDMediaDestinationController alloc], "initWithData:backingStore:messageDispatcher:notificationCenter:logEventSubmitter:dailyScheduler:targetDevice:dataSource:delegate:", v24, v23, v22, v21, v20, v19, v27, v18, v17);

  return v25;
}

- (id)mediaDestinationManager:(id)a3 destinationControllerWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinationControllerWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)rootDestinationManagerForMediaDestinationManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMDAccessory home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rootDestinationManagerWithDescendantDestinationIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mediaGroupParticipantLocalDataStorageForMediaDestinationManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaGroupParticipantDataLocalStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mediaDestinationManagerWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 backingStore:(id)a6 targetDevice:(BOOL)a7 dataSource:(id)a8 delegate:(id)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HMDMediaDestinationManager *v21;

  v10 = a7;
  v15 = a9;
  v16 = a8;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = -[HMDMediaDestinationManager initWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:]([HMDMediaDestinationManager alloc], "initWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:", v20, v19, v18, v17, v10, v16, v15);

  return v21;
}

- (void)mediaDestinationManagerDidUpdateStagedValues:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDAppleMediaAccessory *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media destination manager did update staged values", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessory home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = *MEMORY[0x24BDD6628];
    -[HMDAccessory uuid](v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", v11, v12, 1);

    objc_msgSend(v10, "assistantSyncDataChanged:", v11);
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to handle expired values due to no home manager", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (HMDBackingStore)backingStore
{
  void *v2;
  void *v3;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDBackingStore *)v3;
}

- (HMFActivity)setupActivity
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFActivity *)v4;
}

- (HMDAccessorySetupMetricDispatcher)accessorySetupMetricDispatcher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessorySetupMetricDispatcherForAccessoryUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDAccessorySetupMetricDispatcher *)v6;
}

- (void)setSetupActivity:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDAccessory home](self, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetupActivity:", v4);

}

- (void)setSetupStartTimestamp:(double)a3
{
  void *v5;
  HMDAppleMediaAccessory *v6;
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
  -[HMDAccessory home](v6, "home");
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

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupStartTimestamp");
  v5 = v4;

  return v5;
}

- (id)modelsToMakeSettingsForController:(id)a3 parentUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  HMDAccessorySettingsMetadata *v12;
  HMDAccessorySettingsMetadata *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
    v17 = 138543362;
    v18 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding root settings", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  v12 = objc_alloc_init(HMDAccessorySettingsMetadata);
  v13 = v12;
  if (!v12)
    goto LABEL_6;
  -[HMDAccessorySettingsMetadata rootGroup](v12, "rootGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "modelsWithParentIdentifier:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "count"))
  {

LABEL_6:
    v15 = 0;
  }

  return v15;
}

- (id)modelsToMigrateSettingsForController:(id)a3
{
  HMDAccessorySettingsMetadata *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(HMDAccessorySettingsMetadata);
  if (v4
    && (-[HMDAppleMediaAccessory settingsController](self, "settingsController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[HMDAppleMediaAccessory settingsController](self, "settingsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mergeWithSettingsMetadata:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)removeManagedConfigurationProfileWithProfileData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  HMDAppleMediaAccessory *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v19 = 0;
  objc_msgSend(MEMORY[0x24BE63CA8], "profileWithData:outError:", v6, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
    v14 = v9 == 0;
  else
    v14 = 0;
  if (v14)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Remove managed configuration profile with identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory _removeManagedConfigurationProfileWithIdentifier:completion:](v11, "_removeManagedConfigurationProfileWithIdentifier:completion:", v16, v7);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v15;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get managed configuration profile: %@ with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v16);
  }

}

- (void)accessorySettingsController:(id)a3 saveWithReason:(id)a4 model:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  -[HMDAccessory home](self, "home");
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
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDAccessory uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", v5, v7, 1);

}

- (BOOL)isMultiUserEnabledForAccessorySettingsController:(id)a3
{
  void *v3;
  char v4;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMultiUserEnabled");

  return v4;
}

- (id)remoteMessageDestinationForAccessorySettingsController:(id)a3 target:(id)a4
{
  id v5;
  void *v6;
  HMDRemoteDeviceMessageDestination *v7;
  void *v8;
  HMDRemoteDeviceMessageDestination *v9;

  v5 = a4;
  -[HMDAppleMediaAccessory device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDAppleMediaAccessory device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v7, "initWithTarget:device:", v5, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)assistantAccessControlModelWithRemovedAccessoriesForAccessorySettingsController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[HMDAccessory home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assistantAccessControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assistantAccessControlModelWithRemovedAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)languagesChangedForAccessorySettingsController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[HMDAccessory home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("HMDHomeNotificationKey");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("HMDAppleMediaAccessoryLanguagesChangedNotification"), self, v6);

  }
}

- (id)homeUUID
{
  void *v2;
  void *v3;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  void *v2;
  void *v3;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEventSubmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMMLogEventSubmitting *)v3;
}

- (HMEEventForwarder)eventForwarder
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventForwarder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMEEventForwarder *)v4;
}

- (HMESubscriptionProviding)subscriptionProvider
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localAndRemoteSubscriptionProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMESubscriptionProviding *)v4;
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventStoreReadHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMELastEventStoreReadHandle *)v4;
}

- (id)controller:(id)a3 topicForKeyPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2276752E8](v7, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)eventSourceIdentifierNameForFetchedSettingsController:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessory uuid](self, "uuid", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDCurrentAccessorySetupMetricDispatcher)currentAccessorySetupMetricDispatcher
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAccessorySetupMetricDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCurrentAccessorySetupMetricDispatcher *)v4;
}

- (id)accessoryInfoControllerTopicForWifiInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD73A0];
  v4 = *MEMORY[0x24BDD4BE8];
  -[HMDAccessory home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topicFromSuffixID:homeUUID:accessoryUUID:", v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)eventSourceIdentifierNameForAccessoryInfoController:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessory uuid](self, "uuid", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessoryInfoControllerSoftwareVersionTopicForController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD73A0];
  v5 = *MEMORY[0x24BDD4BE0];
  -[HMDAccessory home](self, "home", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topicFromSuffixID:homeUUID:accessoryUUID:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)currentAccessorySoftwareVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)accessoryInfoController:(id)a3 didUpdateWifiInfo:(id)a4
{
  HMFWiFiNetworkInfo *v5;
  HMFWiFiNetworkInfo *wifiNetworkInfo;

  v5 = (HMFWiFiNetworkInfo *)a4;
  os_unfair_recursive_lock_lock_with_options();
  wifiNetworkInfo = self->_wifiNetworkInfo;
  self->_wifiNetworkInfo = v5;

  os_unfair_recursive_lock_unlock();
}

- (HMDAppleMediaAccessory)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = (HMDAppleMediaAccessory *)-[HMDAppleMediaAccessory _initWithCoder:](self, "_initWithCoder:", v4);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)_initWithCoder:(id)a3
{
  id v4;
  HMDAppleMediaAccessory *v5;
  HMDAppleMediaAccessoryDependencyFactory *v6;
  HMDAppleMediaAccessoryDependencyFactory *dependencyFactory;
  id deviceMediaRouteIdentifierFactory;
  id settingsConnectionFactory;
  uint64_t v10;
  HMDDevice *device;
  uint64_t v12;
  HMDDeviceController *deviceController;
  uint64_t v14;
  HMFPairingIdentity *pairingIdentity;
  uint64_t v16;
  HMFSoftwareVersion *softwareVersion;
  uint64_t v18;
  HMFWiFiNetworkInfo *wifiNetworkInfo;
  uint64_t v20;
  HMDRemoteLoginHandler *remoteLoginHandler;
  HMDRemoteLoginHandler *v22;
  HMDRemoteLoginHandler *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HMDAppleMediaAccessory *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  HMMediaDestinationControllerData *committedAudioDestinationControllerData;
  uint64_t v33;
  uint64_t v34;
  HMMediaDestination *committedAudioDestination;
  HMMediaDestination *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  HMDAppleMediaAccessory *v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  HMMediaDestination *v51;
  void *v52;
  HMDAppleMediaAccessorySleepWakeStateController *v53;
  void *v54;
  uint64_t v55;
  HMDAppleMediaAccessorySleepWakeStateController *sleepWakeStateController;
  objc_super v58;
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)HMDAppleMediaAccessory;
  v5 = -[HMDMediaAccessory initWithCoder:](&v58, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(HMDAppleMediaAccessoryDependencyFactory);
    dependencyFactory = v5->_dependencyFactory;
    v5->_dependencyFactory = v6;

    deviceMediaRouteIdentifierFactory = v5->_deviceMediaRouteIdentifierFactory;
    v5->_deviceMediaRouteIdentifierFactory = &__block_literal_global_399;

    settingsConnectionFactory = v5->_settingsConnectionFactory;
    v5->_settingsConnectionFactory = &__block_literal_global_400;

    if (objc_msgSend(v4, "hmd_isHH2MigrationInProgress")
      && -[HMDAppleMediaAccessory isHomePod](v5, "isHomePod"))
    {
      -[HMDAppleMediaAccessory setVariant:](v5, "setVariant:", 1);
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD4B38]);
    v10 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (HMDDevice *)v10;

    if (v5->_device)
    {
      -[HMDAppleMediaAccessoryDependencyFactory deviceControllerWithDevice:](v5->_dependencyFactory, "deviceControllerWithDevice:");
      v12 = objc_claimAutoreleasedReturnValue();
      deviceController = v5->_deviceController;
      v5->_deviceController = (HMDDeviceController *)v12;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD4D00]);
    v14 = objc_claimAutoreleasedReturnValue();
    pairingIdentity = v5->_pairingIdentity;
    v5->_pairingIdentity = (HMFPairingIdentity *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD4FF0]);
    v16 = objc_claimAutoreleasedReturnValue();
    softwareVersion = v5->_softwareVersion;
    v5->_softwareVersion = (HMFSoftwareVersion *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD5190]);
    v18 = objc_claimAutoreleasedReturnValue();
    wifiNetworkInfo = v5->_wifiNetworkInfo;
    v5->_wifiNetworkInfo = (HMFWiFiNetworkInfo *)v18;

    objc_storeStrong((id *)&v5->_lastStagedWifiNetworkInfo, v5->_wifiNetworkInfo);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD4D78]);
    v20 = objc_claimAutoreleasedReturnValue();
    remoteLoginHandler = v5->_remoteLoginHandler;
    v5->_remoteLoginHandler = (HMDRemoteLoginHandler *)v20;

    if (!v5->_remoteLoginHandler)
    {
      v22 = -[HMDRemoteLoginHandler initWithAccessory:loggedInAccountData:]([HMDRemoteLoginHandler alloc], "initWithAccessory:loggedInAccountData:", v5, 0);
      v23 = v5->_remoteLoginHandler;
      v5->_remoteLoginHandler = v22;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.FixedPairingIdentityInCloudCodingKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
      LOBYTE(v24) = objc_msgSend(v24, "BOOLValue");
    v5->_fixedPairingIdentityInCloud = (char)v24;
    v26 = *MEMORY[0x24BDD4948];
    if (objc_msgSend(v4, "containsValueForKey:", *MEMORY[0x24BDD4948]))
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = v5;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v30;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Decoding destination controller data using legacy encoding", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", objc_opt_class(), CFSTR("HMDMediaDestinationController"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v26);
      v31 = objc_claimAutoreleasedReturnValue();
      committedAudioDestinationControllerData = v28->_committedAudioDestinationControllerData;
      v28->_committedAudioDestinationControllerData = (HMMediaDestinationControllerData *)v31;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD4950]);
      v33 = objc_claimAutoreleasedReturnValue();
      committedAudioDestinationControllerData = v5->_committedAudioDestinationControllerData;
      v5->_committedAudioDestinationControllerData = (HMMediaDestinationControllerData *)v33;
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD4940]);
    v34 = objc_claimAutoreleasedReturnValue();
    committedAudioDestination = v5->_committedAudioDestination;
    v5->_committedAudioDestination = (HMMediaDestination *)v34;

    v36 = v5->_committedAudioDestination;
    if (v36)
    {
      -[HMMediaDestination parentIdentifier](v36, "parentIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (!v37
        || (objc_msgSend(v37, "UUIDString"),
            v39 = (void *)objc_claimAutoreleasedReturnValue(),
            v40 = objc_msgSend(v39, "isEqualToString:", *MEMORY[0x24BDD65F8]),
            v39,
            v40))
      {
        v41 = (void *)MEMORY[0x227676638]();
        v42 = v5;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v60 = v44;
          _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@No parent identifier given was given - fixing bad legacy encoding state", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v41);
        v45 = objc_alloc(MEMORY[0x24BDD7780]);
        -[HMMediaDestination uniqueIdentifier](v5->_committedAudioDestination, "uniqueIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessory uuid](v42, "uuid");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = -[HMMediaDestination supportedOptions](v5->_committedAudioDestination, "supportedOptions");
        -[HMMediaDestination audioGroupIdentifier](v5->_committedAudioDestination, "audioGroupIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v45, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:", v46, v47, v48, v49);
        v51 = v5->_committedAudioDestination;
        v5->_committedAudioDestination = (HMMediaDestination *)v50;

      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6F38]);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportedStereoPairVersions = objc_msgSend(v52, "unsignedIntegerValue");

    __bootstrapSupportedStereoPairVersions(v5);
    -[HMDAccessory decodePreferredMediaUser:](v5, "decodePreferredMediaUser:", v4);
    v53 = [HMDAppleMediaAccessorySleepWakeStateController alloc];
    -[HMDAccessory uuid](v5, "uuid");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[HMDAppleMediaAccessorySleepWakeStateController initWithAccessoryUUID:dataSource:](v53, "initWithAccessoryUUID:dataSource:", v54, v5);
    sleepWakeStateController = v5->_sleepWakeStateController;
    v5->_sleepWakeStateController = (HMDAppleMediaAccessorySleepWakeStateController *)v55;

    v5->_productColor = objc_msgSend(v4, "decodeIntegerForKey:", *MEMORY[0x24BDD6A48]);
  }

  return v5;
}

- (void)_encodeMediaDestinationAndControllerDataWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && !objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    -[HMDAppleMediaAccessory _legacyEncodeMediaDestinationAndControllerDataWithCoder:](self, "_legacyEncodeMediaDestinationAndControllerDataWithCoder:", v6);
  }
  else
  {
    -[HMDAppleMediaAccessory audioDestinationControllerData](self, "audioDestinationControllerData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v4, *MEMORY[0x24BDD4950]);

    -[HMDAppleMediaAccessory audioDestination](self, "audioDestination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, *MEMORY[0x24BDD4940]);

  }
}

- (void)_legacyEncodeMediaDestinationAndControllerDataWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "hmd_isForLocalStore"))
  {
    -[HMDAppleMediaAccessory committedAudioDestinationControllerData](self, "committedAudioDestinationControllerData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory committedAudioDestination](self, "committedAudioDestination");
  }
  else
  {
    -[HMDAppleMediaAccessory audioDestinationControllerData](self, "audioDestinationControllerData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory audioDestination](self, "audioDestination");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x24BDD4950]);
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x24BDD4940]);

}

- (void)addHostedAccessory:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[HMDAppleMediaAccessory hostedAccessories](self, "hostedAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  os_unfair_recursive_lock_unlock();
}

- (void)removeHostedAccessory:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[HMDAppleMediaAccessory hostedAccessories](self, "hostedAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

  os_unfair_recursive_lock_unlock();
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x227676638]();
  -[HMDAppleMediaAccessory _encodeWithCoder:](self, "_encodeWithCoder:", v5);
  objc_autoreleasePoolPop(v4);

}

- (void)_encodeWithCoder:(id)a3
{
  id v4;
  char v5;
  int v6;
  __int16 v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  HMDRPIdentity *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  _BOOL8 v22;
  _BOOL8 v23;
  _BOOL8 v24;
  _BOOL8 v25;
  _BOOL8 v26;
  _BOOL8 v27;
  _BOOL8 v28;
  _BOOL8 v29;
  _BOOL8 v30;
  _BOOL8 v31;
  _BOOL8 v32;
  _BOOL8 v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL8 v37;
  _BOOL8 v38;
  _BOOL8 v39;
  void *v40;
  void *v41;
  void *v42;
  int64_t v43;
  void *v44;
  objc_super v45;

  v4 = a3;
  v5 = objc_msgSend(v4, "hmd_isForXPCTransport");
  v6 = objc_msgSend(v4, "hmd_isForLocalStore");
  v7 = objc_msgSend(v4, "hmd_homeManagerOptions");
  v45.receiver = self;
  v45.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory encodeWithCoder:](&v45, sel_encodeWithCoder_, v4);
  -[HMDAppleMediaAccessory pairingIdentity](self, "pairingIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v8, *MEMORY[0x24BDD4D00]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDAppleMediaAccessory fixedPairingIdentityInCloud](self, "fixedPairingIdentityInCloud"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("HM.FixedPairingIdentityInCloudCodingKey");
LABEL_6:
      objc_msgSend(v4, "encodeObject:forKey:", v10, v11);

      goto LABEL_7;
    }
    if (v8)
    {
      objc_msgSend(v8, "publicPairingIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (const __CFString *)*MEMORY[0x24BDD4D00];
      goto LABEL_6;
    }
  }
LABEL_7:
  if ((v7 & 0x841) == 0
    && ((v7 & 0x10) == 0 || !-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory")))
  {
LABEL_16:
    if ((v6 & 1) != 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    if (!objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
      goto LABEL_16;
    -[HMDAppleMediaAccessory deviceForDirectMessaging](self, "deviceForDirectMessaging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory deviceIRK](self, "deviceIRK");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rpIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14 && v13)
    {
      v15 = objc_alloc(MEMORY[0x24BE3F190]);
      v16 = (void *)objc_msgSend(v15, "initWithType:size:data:", *MEMORY[0x24BE3EBE8], *MEMORY[0x24BE3EBE0], v13);
      v17 = -[HMDRPIdentity initWithDeviceIRK:]([HMDRPIdentity alloc], "initWithDeviceIRK:", v16);
      objc_msgSend(v12, "setRpIdentity:", v17);

    }
    objc_msgSend(v12, "idsIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("HM.accountIdentifier"));

    objc_msgSend(v4, "encodeObject:forKey:", v12, *MEMORY[0x24BDD4B38]);
    -[HMDAppleMediaAccessory deviceIRK](self, "deviceIRK");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v19, *MEMORY[0x24BDD4B40]);

  }
  else
  {
    -[HMDAppleMediaAccessory device](self, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v12, *MEMORY[0x24BDD4B38]);
  }

  if ((v6 & 1) != 0)
  {
LABEL_21:
    v20 = -[HMDAppleMediaAccessory isAudioAnalysisEventNotificationEnabled](self, "isAudioAnalysisEventNotificationEnabled");
    objc_msgSend(v4, "encodeBool:forKey:", v20, *MEMORY[0x24BDD4938]);
    -[HMDAppleMediaAccessory audioAnalysisEventNotificationCondition](self, "audioAnalysisEventNotificationCondition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v21, *MEMORY[0x24BDD4930]);

    goto LABEL_22;
  }
LABEL_20:
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
    goto LABEL_21;
LABEL_22:
  if ((v7 & 0x41) != 0 || -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory") && (v7 & 0x10) != 0)
  {
    if (objc_msgSend(v4, "hmd_isForXPCTransport"))
    {
      v22 = -[HMDAppleMediaAccessory isDeviceReachable](self, "isDeviceReachable");
      objc_msgSend(v4, "encodeBool:forKey:", v22, *MEMORY[0x24BDD4B08]);
      if (objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
      {
        v23 = -[HMDAppleMediaAccessory supportsTargetControl](self, "supportsTargetControl");
        objc_msgSend(v4, "encodeBool:forKey:", v23, *MEMORY[0x24BDD50D8]);
        v24 = -[HMDAppleMediaAccessory supportsCompanionInitiatedRestart](self, "supportsCompanionInitiatedRestart");
        objc_msgSend(v4, "encodeBool:forKey:", v24, *MEMORY[0x24BDD5030]);
        v25 = -[HMDAppleMediaAccessory supportsCompanionInitiatedObliterate](self, "supportsCompanionInitiatedObliterate");
        objc_msgSend(v4, "encodeBool:forKey:", v25, *MEMORY[0x24BDD5028]);
        v26 = -[HMDAppleMediaAccessory supportsAudioAnalysis](self, "supportsAudioAnalysis");
        objc_msgSend(v4, "encodeBool:forKey:", v26, *MEMORY[0x24BDD5010]);
        v27 = -[HMDAppleMediaAccessory supportsDropIn](self, "supportsDropIn");
        objc_msgSend(v4, "encodeBool:forKey:", v27, *MEMORY[0x24BDD5048]);
        v28 = -[HMDAppleMediaAccessory supportsThirdPartyMusic](self, "supportsThirdPartyMusic");
        objc_msgSend(v4, "encodeBool:forKey:", v28, *MEMORY[0x24BDD50B0]);
        v29 = -[HMDAppleMediaAccessory supportsPreferredMediaUser](self, "supportsPreferredMediaUser");
        objc_msgSend(v4, "encodeBool:forKey:", v29, *MEMORY[0x24BDD5090]);
        v30 = -[HMDAppleMediaAccessory supportsCoordinationDoorbellChime](self, "supportsCoordinationDoorbellChime");
        objc_msgSend(v4, "encodeBool:forKey:", v30, *MEMORY[0x24BDD5038]);
        v31 = -[HMDAppleMediaAccessory supportsMediaContentProfile](self, "supportsMediaContentProfile");
        objc_msgSend(v4, "encodeBool:forKey:", v31, *MEMORY[0x24BDD5078]);
        objc_msgSend(v4, "encodeBool:forKey:", 1, *MEMORY[0x24BDD4C18]);
        if (_os_feature_enabled_impl())
        {
          v32 = -[HMDAppleMediaAccessory supportsRMVonAppleTV](self, "supportsRMVonAppleTV");
          objc_msgSend(v4, "encodeBool:forKey:", v32, *MEMORY[0x24BDD50A0]);
        }
        if (_os_feature_enabled_impl())
        {
          v33 = -[HMDAppleMediaAccessory supportsJustSiri](self, "supportsJustSiri");
          objc_msgSend(v4, "encodeBool:forKey:", v33, *MEMORY[0x24BDD5058]);
        }
        os_unfair_recursive_lock_lock_with_options();
        -[HMDAppleMediaAccessory hostedAccessories](self, "hostedAccessories");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "allObjects");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        os_unfair_recursive_lock_unlock();
        -[HMDAppleMediaAccessory encodeServicesFromHostedAccessories:coder:](self, "encodeServicesFromHostedAccessories:coder:", v35, v4);
        -[HMDAppleMediaAccessory encodeFlagsFromHostedAccessories:coder:](self, "encodeFlagsFromHostedAccessories:coder:", v35, v4);

      }
      if (-[HMDAppleMediaAccessory isHomePod](self, "isHomePod"))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory homePodVariant](self, "homePodVariant"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v36, *MEMORY[0x24BDD6230]);

      }
      if (-[HMDAppleMediaAccessory isHomePod](self, "isHomePod"))
      {
        v37 = -[HMDAppleMediaAccessory supportsManagedConfigurationProfile](self, "supportsManagedConfigurationProfile");
        objc_msgSend(v4, "encodeBool:forKey:", v37, *MEMORY[0x24BDD5060]);
        v38 = -[HMDAppleMediaAccessory supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings");
        objc_msgSend(v4, "encodeBool:forKey:", v38, *MEMORY[0x24BDD5080]);
        v39 = -[HMDAppleMediaAccessory supportsSoftwareUpdateV2](self, "supportsSoftwareUpdateV2");
        objc_msgSend(v4, "encodeBool:forKey:", v39, *MEMORY[0x24BDD50A8]);
      }
    }
    if (!objc_msgSend(v4, "hmd_isForXPCTransport")
      || objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
    {
      -[HMDAppleMediaAccessory softwareVersion](self, "softwareVersion");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v40, *MEMORY[0x24BDD4FF0]);

      -[HMDAppleMediaAccessory wifiNetworkInfo](self, "wifiNetworkInfo");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v41, *MEMORY[0x24BDD5190]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v42, *MEMORY[0x24BDD6F38]);

      v43 = -[HMDAppleMediaAccessory productColor](self, "productColor");
      objc_msgSend(v4, "encodeInteger:forKey:", v43, *MEMORY[0x24BDD6A48]);
      -[HMDAppleMediaAccessory _encodeMediaDestinationAndControllerDataWithCoder:](self, "_encodeMediaDestinationAndControllerDataWithCoder:", v4);
    }
    if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
      || (objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount") & 1) != 0
      || (objc_msgSend(v4, "hmd_isForRemoteUserAdministrator") & 1) != 0
      || objc_msgSend(v4, "hmd_isForXPCTransport")
      && objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
    {
      -[HMDAppleMediaAccessory remoteLoginHandler](self, "remoteLoginHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v44, *MEMORY[0x24BDD4D78]);

    }
  }

}

- (void)encodeServicesFromHostedAccessories:(id)a3 coder:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  SEL v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v5 = a4;
  if ((objc_msgSend(v5, "hmd_isForXPCTransport") & 1) != 0)
  {
    objc_msgSend(v13, "na_flatMap:", &__block_literal_global_409);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "na_firstObjectPassingTest:", &__block_literal_global_411);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hapMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDHAPAccessory encodeServices:forXPCCoder:metadata:](HMDHAPAccessory, "encodeServices:forXPCCoder:metadata:", v6, v5, v8);
  }
  else
  {
    v9 = (HMDAppleMediaAccessory *)_HMFPreconditionFailure();
    -[HMDAppleMediaAccessory encodeFlagsFromHostedAccessories:coder:](v9, v10, v11, v12);
  }
}

- (void)encodeFlagsFromHostedAccessories:(id)a3 coder:(id)a4
{
  id v5;
  void *v6;
  HMDAppleMediaAccessory *v7;
  SEL v8;
  id v9;

  v9 = a3;
  v5 = a4;
  if ((objc_msgSend(v5, "hmd_isForXPCTransport") & 1) != 0)
  {
    objc_msgSend(v9, "na_reduceWithInitialValue:reducer:", &unk_24E96B720, &__block_literal_global_415);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("accessoryFlagsCodingKey"));

  }
  else
  {
    v7 = (HMDAppleMediaAccessory *)_HMFPreconditionFailure();
    -[HMDAppleMediaAccessory dumpState](v7, v8);
  }
}

- (id)dumpState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory dumpState](&v18, sel_dumpState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = *MEMORY[0x24BE3EB68];
  objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x24BE3EB68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDAppleMediaAccessory variant](self, "variant");
  if (v7)
  {
    if ((v7 & 1) != 0)
    {
      v8 = CFSTR("Original HomePod");
    }
    else if ((v7 & 2) != 0)
    {
      v8 = CFSTR("HomePod Mini");
    }
    else if ((v7 & 4) != 0)
    {
      v8 = CFSTR("2nd Generation HomePod");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (0x%tx)"), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(", variant: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAppleMediaAccessory device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(", device: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_lock_with_options();
  -[HMDAppleMediaAccessory hostedAccessories](self, "hostedAccessories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_map:", &__block_literal_global_425_129626);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(", hosted accessory uuids: %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v5);

  return v4;
}

- (id)dumpSimpleState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory dumpSimpleState](&v12, sel_dumpSimpleState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = *MEMORY[0x24BE3EB68];
  objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x24BE3EB68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(", device: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v5);
  return v4;
}

- (id)dumpStateLocalSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAppleMediaAccessory *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDAppleMediaAccessory *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "homeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventStoreReadHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory _dumpStateCachedSettingsForHome:accessory:eventStoreReadHandle:](self, "_dumpStateCachedSettingsForHome:accessory:eventStoreReadHandle:", v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

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
        v19 = 138543362;
        v20 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Media accessory that has a home but does not have home manager", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      v9 = (void *)MEMORY[0x24BDBD1B8];
    }

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
      v19 = 138543362;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Media accessory does not have a home", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v9;
}

- (id)_dumpStateCachedSettingsForHome:(id)a3 accessory:(id)a4 eventStoreReadHandle:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HMDAppleMediaAccessory *v21;
  NSObject *v22;
  HMDAppleMediaAccessory *v23;
  void *v24;
  void *v25;
  HMDAccessorySettingsEventHelper *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(HMDAccessorySettingsEventHelper);
  v28 = v9;
  v29 = v8;
  -[HMDAccessorySettingsEventHelper allTopicsForHome:accessory:](v27, "allTopicsForHome:accessory:", v8, v9);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    v31 = v10;
    v32 = *(_QWORD *)v37;
    do
    {
      v14 = 0;
      v33 = v12;
      do
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v14);
        objc_msgSend(v10, "lastEventForTopic:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v35 = 0;
          objc_msgSend(MEMORY[0x24BDD7708], "decodeSettingFromEvent:error:", v16, &v35);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v35;
          if (v18)
          {
            v19 = v18;
            v20 = (void *)MEMORY[0x227676638]();
            v21 = self;
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v23 = self;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v41 = v24;
              v42 = 2112;
              v43 = v15;
              v44 = 2112;
              v45 = v19;
              _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Error decoding stored setting for topic %@, error: %@", buf, 0x20u);

              self = v23;
              v10 = v31;
            }

            objc_autoreleasePoolPop(v20);
            v13 = v32;
            v12 = v33;
          }
          else
          {
            if (!v17)
              goto LABEL_14;
            objc_msgSend(v17, "description");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "keyPath");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v19, v25);

          }
        }
LABEL_14:

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v12);
  }

  return v30;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessory uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_handleAudioAnalysisBulletinBoardCommit:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDAppleMediaAccessory *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v15;
  void *v16;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v17;
  void *v18;
  id v19;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v20;
  void *v21;
  _QWORD v22[5];
  HMDAudioAnalysisEventBulletinNotificationRegistration *v23;
  id v24;
  id v25;
  id v26;
  char v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessory home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v6 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x24BDD7C20]);
    objc_msgSend(v4, "predicateForKey:", *MEMORY[0x24BDD7C18]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v13;
      v30 = 2112;
      v31 = v14;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling request to update audio analysis notification registration with enabled: %@ condition: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = [HMDAudioAnalysisEventBulletinNotificationRegistration alloc];
    -[HMDAccessory uuid](v11, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMDAudioAnalysisEventBulletinNotificationRegistration initWithPredicate:accessoryUUID:](v15, "initWithPredicate:accessoryUUID:", v9, v16);

    objc_msgSend(v5, "audioAnalysisBulletinNotificationManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __66__HMDAppleMediaAccessory__handleAudioAnalysisBulletinBoardCommit___block_invoke;
    v22[3] = &unk_24E786F10;
    v22[4] = v11;
    v23 = v17;
    v24 = v4;
    v25 = v9;
    v27 = v6;
    v26 = v5;
    v19 = v9;
    v20 = v17;
    objc_msgSend(v18, "updateNotificationRegistration:enabled:completion:", v20, v6, v22);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v21);

  }
}

- (id)currentRoomForAppleMediaAccessoryMetricsDispatcher:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDAccessory room](self, "room", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (int64_t)numberOfCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[HMDAppleMediaAccessory hostedAccessories](self, "hostedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  os_unfair_recursive_lock_unlock();
  return v6;
}

- (int64_t)numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[HMDAppleMediaAccessory hostedAccessories](self, "hostedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  objc_msgSend(v6, "na_map:", &__block_literal_global_436);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMDAccessory home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "triggers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_2;
    v13[3] = &unk_24E786F80;
    v14 = v7;
    objc_msgSend(v9, "na_filter:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "count");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  _QWORD v9[5];

  -[HMDAccessory home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke;
  v9[3] = &unk_24E786FD0;
  v9[4] = self;
  objc_msgSend(v5, "na_filter:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  return v7;
}

- (void)currentAccessorySensorStatusFlagsForAppleMediaAccessoryMetricsDispatcher:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (id)currentDeviceProductInfoForAppleMediaAccessorySleepWakeStateController:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE3F260], "productInfo", a3);
}

- (id)appleMediaProfileForAccessoryUUID:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[HMDMediaAccessory mediaProfile](self, "mediaProfile", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)forwardAccessoryPublicPairingIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDAppleMediaAccessory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "privateKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    _HMFPreconditionFailure();
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v9;
      v30 = 2112;
      v31 = v4;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Forwarding accessory public pairing identity: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDAppleMediaAccessory eventForwarder](v7, "eventForwarder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory pairingIdentityTopic](v7, "pairingIdentityTopic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && v10)
    {
      if (!-[HMDAppleMediaAccessory isMatchingCachedEventPublicPairingIdentity:](v7, "isMatchingCachedEventPublicPairingIdentity:", v4))
      {
        v20 = objc_alloc(MEMORY[0x24BE4ED90]);
        -[HMDAccessory uuid](v7, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "UUIDString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        v23 = (void *)objc_msgSend(v20, "initWithSource:cachePolicy:combineType:timestamp:", v22, 2, 2);

        v24 = objc_alloc(MEMORY[0x24BE4ED80]);
        objc_msgSend(v4, "pbData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v24, "initWithEventData:metadata:", v25, v23);

        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __64__HMDAppleMediaAccessory_forwardAccessoryPublicPairingIdentity___block_invoke;
        v27[3] = &unk_24E79BD80;
        v27[4] = v7;
        objc_msgSend(v10, "forwardEvent:topic:completion:", v26, v11, v27);

        goto LABEL_15;
      }
      v12 = (void *)MEMORY[0x227676638]();
      v13 = v7;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        v30 = 2112;
        v31 = v4;
        v16 = "%{public}@Skipping forwarding accessory public pairing identity due to matching cached pairing identity: %@";
        v17 = v14;
        v18 = OS_LOG_TYPE_INFO;
        v19 = 22;
LABEL_12:
        _os_log_impl(&dword_2218F0000, v17, v18, v16, buf, v19);

      }
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = v7;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v15;
        v30 = 2112;
        v31 = v10;
        v32 = 2112;
        v33 = v11;
        v16 = "%{public}@Failed to forward accessory public pairing identity due to missing dependencies eventForwarder: %@ topic: %@";
        v17 = v14;
        v18 = OS_LOG_TYPE_ERROR;
        v19 = 32;
        goto LABEL_12;
      }
    }

    objc_autoreleasePoolPop(v12);
LABEL_15:

  }
}

- (id)pairingIdentityTopic
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessory uuid](self, "uuid");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    objc_msgSend(MEMORY[0x24BDD73A0], "topicFromSuffixID:homeUUID:accessoryUUID:", *MEMORY[0x24BDD4BB8], v4, v5);
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
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get pairing identity topic due to missing homeUUID: %@ accessoryUUID: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)cachedEventPairingIdentity
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDAppleMediaAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDAppleMediaAccessory *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[HMDAppleMediaAccessory eventStoreReadHandle](self, "eventStoreReadHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory pairingIdentityTopic](self, "pairingIdentityTopic");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    objc_msgSend(v3, "lastEventForTopic:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x24BE3F228]);
      objc_msgSend(v6, "encodedData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithProtoData:", v8);

      if (v9)
      {
        v10 = v9;
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
          v20 = 138543618;
          v21 = v18;
          v22 = 2112;
          v23 = v6;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode cached pairing identity from event: %@", (uint8_t *)&v20, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
      }

    }
    else
    {
      v9 = 0;
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
      v20 = 138543874;
      v21 = v14;
      v22 = 2112;
      v23 = v3;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get cached event pairing identity due missing eventStoreReadHandle: %@ topic: %@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v9 = 0;
  }

  return v9;
}

- (BOOL)isMatchingCachedEventPublicPairingIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[HMDAppleMediaAccessory cachedEventPairingIdentity](self, "cachedEventPairingIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "publicPairingIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "publicPairingIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)infoSubscriber:(id)a3 didReceiveWiFiInfoUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Set wifi info to: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAppleMediaAccessory setWifiNetworkInfo:](v9, "setWifiNetworkInfo:", v7);

}

- (id)accessoryBrowserForAppleMediaAccessorySensorManager:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDAppleMediaAccessory)accessoryWithUUID:(id)a3 forAppleMediaAccessorySensorManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoryWithUUID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDAppleMediaAccessory *)v7;
}

- (id)homeUUIDForAppleMediaAccessorySensorManager:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isResidentConfirmedForAppleMediaAccessorySensorManager:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryResident");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isConfirmed");

  return v5;
}

- (id)notificationCenterForAppleMediaAccessorySensorManager:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
}

- (void)performLocalAddAccessoryWithDescription:(id)a3 progressHandlerDelegate:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  -[HMDAccessory home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "performLocalAddAccessoryWithDescription:progressHandlerDelegate:completion:", v13, v8, v9);
  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v12);

  }
}

- (void)renameService:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  HMDAppleMediaAccessory *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE location[12];
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BE3F1B8]);
    objc_msgSend(v8, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithTarget:", v10);

    v30[0] = CFSTR("kServiceInstanceID");
    objc_msgSend(v6, "instanceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = CFSTR("kServiceName");
    v31[0] = v12;
    v31[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:destination:payload:", *MEMORY[0x24BDD7D58], v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)location, self);
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __45__HMDAppleMediaAccessory_renameService_name___block_invoke;
    v25 = &unk_24E793318;
    objc_copyWeak(&v29, (id *)location);
    v26 = v6;
    v15 = v8;
    v27 = v15;
    v28 = v7;
    objc_msgSend(v14, "setResponseHandler:", &v22);
    -[HMDAccessory home](self, "home", v22, v23, v24, v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isCurrentDevicePrimaryResident"))
    {
      objc_msgSend(v15, "_handleRenameService:", v14);
    }
    else
    {
      objc_msgSend(v16, "residentSyncManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "performResidentRequest:options:", v14, 0);

    }
    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)location);

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
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v20;
      v33 = 2112;
      v34 = v6;
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to rename service %@ to %@ as it has no accessory", location, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (id)residentNotificationObjectForAppleMediaAccessorySensorManager:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentDeviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessoriesWithHostUUID:(id)a3 forAppleMediaAccessorySensorManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__HMDAppleMediaAccessory_accessoriesWithHostUUID_forAppleMediaAccessorySensorManager___block_invoke;
  v11[3] = &unk_24E790530;
  v12 = v5;
  v8 = v5;
  objc_msgSend(v7, "na_filter:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isReadyForSensorPairing:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__HMDAppleMediaAccessory_isReadyForSensorPairing___block_invoke;
  v8[3] = &unk_24E796248;
  v9 = v3;
  v6 = v3;
  LOBYTE(v4) = objc_msgSend(v5, "na_any:", v8);

  return (char)v4;
}

- (id)logSubmitterForAppleMediaAccessorySensorManager:(id)a3
{
  return +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter", a3);
}

- (id)residentSyncClientDidSyncFutureForAppleMediaAccessorySensorManager:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentSyncClientDidSyncFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)firstCloudKitImportFutureForAppleMediaAccessorySensorManager:(id)a3
{
  void *v3;
  void *v4;

  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstCloudKitImportFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)keychainStoreForAppleMediaAccessorySensorManager:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE1BC08], "systemStore", a3);
}

- (void)performAfterDelay:(double)a3 block:(id)a4 queue:(id)a5
{
  int64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  dispatch_block_t block;

  v6 = (uint64_t)(a3 * 1000000000.0);
  v7 = a5;
  block = a4;
  v8 = dispatch_time(0, v6);
  dispatch_after(v8, v7, block);

}

- (HMDRemoteLoginHandler)remoteLoginHandler
{
  return (HMDRemoteLoginHandler *)objc_getProperty(self, a2, 520, 1);
}

- (HMDTargetControlManager)targetControlManager
{
  return self->_targetControlManager;
}

- (void)setTargetControlManager:(id)a3
{
  objc_storeStrong((id *)&self->_targetControlManager, a3);
}

- (HMDAccessorySettingsController)settingsController
{
  return (HMDAccessorySettingsController *)objc_getProperty(self, a2, 616, 1);
}

- (void)setSettingsController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 616);
}

- (NSArray)supportedMultiUserLanguageCodes
{
  return (NSArray *)objc_getProperty(self, a2, 624, 1);
}

- (void)setSupportedMultiUserLanguageCodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 624);
}

- (HMDMediaDestinationManager)audioDestinationManager
{
  return (HMDMediaDestinationManager *)objc_getProperty(self, a2, 632, 1);
}

- (void)setAudioDestinationManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 632);
}

- (HMDMediaDestinationController)audioDestinationController
{
  return (HMDMediaDestinationController *)objc_getProperty(self, a2, 640, 1);
}

- (void)setAudioDestinationController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 640);
}

- (HMDAudioAnalysisRequestManager)audioAnalysisRequestManager
{
  return (HMDAudioAnalysisRequestManager *)objc_getProperty(self, a2, 648, 1);
}

- (void)setAudioAnalysisRequestManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 648);
}

- (HMDAudioAnalysisEventSubscriber)audioAnalysisEventSubscriber
{
  return (HMDAudioAnalysisEventSubscriber *)objc_getProperty(self, a2, 656, 1);
}

- (void)setAudioAnalysisEventSubscriber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 656);
}

- (int64_t)fallbackMediaUserType
{
  return self->_fallbackMediaUserType;
}

- (HMDSoftwareUpdateEventListener)softwareUpdateListener
{
  return (HMDSoftwareUpdateEventListener *)objc_getProperty(self, a2, 672, 1);
}

- (void)setSoftwareUpdateListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 672);
}

- (HMFPairingIdentity)lastCreatedPairingIdentity
{
  return self->_lastCreatedPairingIdentity;
}

- (void)setLastCreatedPairingIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_lastCreatedPairingIdentity, a3);
}

- (id)deviceMediaRouteIdentifierFactory
{
  return objc_getProperty(self, a2, 688, 1);
}

- (HMDAppleMediaAccessorySleepWakeStateController)sleepWakeStateController
{
  return (HMDAppleMediaAccessorySleepWakeStateController *)objc_getProperty(self, a2, 696, 1);
}

- (void)setSleepWakeStateController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 696);
}

- (HMDPreferredMediaUserEventController)preferredMediaUserEventController
{
  return (HMDPreferredMediaUserEventController *)objc_getProperty(self, a2, 704, 1);
}

- (void)setPreferredMediaUserEventController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 704);
}

- (HMDAppleMediaAccessoryDependencyFactory)dependencyFactory
{
  return self->_dependencyFactory;
}

- (void)setDependencyFactory:(id)a3
{
  objc_storeStrong((id *)&self->_dependencyFactory, a3);
}

- (BOOL)shouldApplySoftwareUpdateWhenFound
{
  return self->_shouldApplySoftwareUpdateWhenFound;
}

- (void)setShouldApplySoftwareUpdateWhenFound:(BOOL)a3
{
  self->_shouldApplySoftwareUpdateWhenFound = a3;
}

- (HMDarwinNotificationProvider)darwinNotificationProvider
{
  return self->_darwinNotificationProvider;
}

- (void)setDarwinNotificationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_darwinNotificationProvider, a3);
}

- (HMDAccessorySymptomHandler)symptomsHandler
{
  return (HMDAccessorySymptomHandler *)objc_getProperty(self, a2, 728, 1);
}

- (void)setSymptomsHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 728);
}

- (HMDAppleMediaAccessoryMessenger)messenger
{
  return (HMDAppleMediaAccessoryMessenger *)objc_getProperty(self, a2, 736, 1);
}

- (void)setMessenger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 736);
}

- (HMDMediaDestinationControllerFactory)mediaDestinationControllerFactory
{
  return (HMDMediaDestinationControllerFactory *)objc_loadWeakRetained((id *)&self->_mediaDestinationControllerFactory);
}

- (void)setMediaDestinationControllerFactory:(id)a3
{
  objc_storeWeak((id *)&self->_mediaDestinationControllerFactory, a3);
}

- (HMDMediaDestinationManagerFactory)mediaDestinationManagerFactory
{
  return (HMDMediaDestinationManagerFactory *)objc_loadWeakRetained((id *)&self->_mediaDestinationManagerFactory);
}

- (void)setMediaDestinationManagerFactory:(id)a3
{
  objc_storeWeak((id *)&self->_mediaDestinationManagerFactory, a3);
}

- (HMFWiFiManager)wifiManager
{
  return (HMFWiFiManager *)objc_getProperty(self, a2, 760, 1);
}

- (void)setWifiManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 760);
}

- (HMDAppleMediaAccessoryMetricsDispatcher)metricsDispatcher
{
  return (HMDAppleMediaAccessoryMetricsDispatcher *)objc_getProperty(self, a2, 768, 1);
}

- (void)setMetricsDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 768);
}

- (NSHashTable)hostedAccessories
{
  return (NSHashTable *)objc_getProperty(self, a2, 776, 1);
}

- (HMDSoftwareUpdateEventProvider)softwareUpdateProvider
{
  return (HMDSoftwareUpdateEventProvider *)objc_getProperty(self, a2, 784, 1);
}

- (void)setSoftwareUpdateProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 784);
}

- (HMDSoftwareUpdateInstallProvider)softwareUpdateInstallProvider
{
  return (HMDSoftwareUpdateInstallProvider *)objc_getProperty(self, a2, 792, 1);
}

- (void)setSoftwareUpdateInstallProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 792);
}

- (BOOL)fixedPairingIdentityInCloud
{
  return self->_fixedPairingIdentityInCloud;
}

- (void)setFixedPairingIdentityInCloud:(BOOL)a3
{
  self->_fixedPairingIdentityInCloud = a3;
}

- (HMDAppleMediaAccessoryDataSource)dataSource
{
  return (HMDAppleMediaAccessoryDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDAppleMediaAccessorySensorManager)sensorManager
{
  return (HMDAppleMediaAccessorySensorManager *)objc_getProperty(self, a2, 808, 1);
}

- (void)setSensorManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (HMDFetchedAccessorySettingsController)currentAccessorySettingsController
{
  return (HMDFetchedAccessorySettingsController *)objc_getProperty(self, a2, 816, 1);
}

- (void)setCurrentAccessorySettingsController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 816);
}

- (HMDAppleMediaAccessoryInfoController)currentAccessoryInfoController
{
  return (HMDAppleMediaAccessoryInfoController *)objc_getProperty(self, a2, 824, 1);
}

- (void)setCurrentAccessoryInfoController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 824);
}

- (HMDAppleMediaAccessoryInfoSubscriber)accessoryInfoSubscriber
{
  return (HMDAppleMediaAccessoryInfoSubscriber *)objc_getProperty(self, a2, 832, 1);
}

- (void)setAccessoryInfoSubscriber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 832);
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (id)settingsConnectionFactory
{
  return objc_getProperty(self, a2, 848, 1);
}

- (void)setSettingsConnectionFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 848);
}

- (BOOL)isAudioAnalysisEventNotificationEnabled
{
  return self->_audioAnalysisEventNotificationEnabled;
}

- (void)setAudioAnalysisEventNotificationEnabled:(BOOL)a3
{
  self->_audioAnalysisEventNotificationEnabled = a3;
}

- (NSPredicate)audioAnalysisEventNotificationCondition
{
  return (NSPredicate *)objc_getProperty(self, a2, 856, 1);
}

- (void)setAudioAnalysisEventNotificationCondition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 856);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAnalysisEventNotificationCondition, 0);
  objc_storeStrong(&self->_settingsConnectionFactory, 0);
  objc_storeStrong((id *)&self->_accessoryInfoSubscriber, 0);
  objc_storeStrong((id *)&self->_currentAccessoryInfoController, 0);
  objc_storeStrong((id *)&self->_currentAccessorySettingsController, 0);
  objc_storeStrong((id *)&self->_sensorManager, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_softwareUpdateInstallProvider, 0);
  objc_storeStrong((id *)&self->_softwareUpdateProvider, 0);
  objc_storeStrong((id *)&self->_hostedAccessories, 0);
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_destroyWeak((id *)&self->_mediaDestinationManagerFactory);
  objc_destroyWeak((id *)&self->_mediaDestinationControllerFactory);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_symptomsHandler, 0);
  objc_storeStrong((id *)&self->_darwinNotificationProvider, 0);
  objc_storeStrong((id *)&self->_dependencyFactory, 0);
  objc_storeStrong((id *)&self->_preferredMediaUserEventController, 0);
  objc_storeStrong((id *)&self->_sleepWakeStateController, 0);
  objc_storeStrong(&self->_deviceMediaRouteIdentifierFactory, 0);
  objc_storeStrong((id *)&self->_lastCreatedPairingIdentity, 0);
  objc_storeStrong((id *)&self->_softwareUpdateListener, 0);
  objc_storeStrong((id *)&self->_audioAnalysisEventSubscriber, 0);
  objc_storeStrong((id *)&self->_audioAnalysisRequestManager, 0);
  objc_storeStrong((id *)&self->_audioDestinationController, 0);
  objc_storeStrong((id *)&self->_audioDestinationManager, 0);
  objc_storeStrong((id *)&self->_supportedMultiUserLanguageCodes, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_targetControlManager, 0);
  objc_storeStrong((id *)&self->_deviceIRK, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong((id *)&self->_rawCapabilities, 0);
  objc_storeStrong((id *)&self->_capabilitiesInternal, 0);
  objc_storeStrong((id *)&self->_lastStagedWifiNetworkInfo, 0);
  objc_storeStrong((id *)&self->_wifiNetworkInfo, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_remoteLoginHandler, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_committedAudioDestinationControllerData, 0);
  objc_storeStrong((id *)&self->_committedAudioDestination, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

uint64_t __50__HMDAppleMediaAccessory_isReadyForSensorPairing___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

uint64_t __86__HMDAppleMediaAccessory_accessoriesWithHostUUID_forAppleMediaAccessorySensorManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "hostAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __45__HMDAppleMediaAccessory_renameService_name___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = (void *)MEMORY[0x227676638]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    v14 = v6;
    v15 = *(_QWORD *)(a1 + 48);
    HMFBooleanToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v19 = v11;
    v20 = 2112;
    v21 = v17;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v15;
    v6 = v14;
    v8 = v13;
    v26 = 2112;
    v27 = v16;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Did complete renaming service %@ on accessory %@ to %@ after sensor pairing with success: %@/%@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v8);

}

void __64__HMDAppleMediaAccessory_forwardAccessoryPublicPairingIdentity___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR(" with error: ");
    v10 = 138543874;
    v11 = v7;
    if (!v3)
      v8 = &stru_24E79DB48;
    v12 = 2112;
    v13 = v8;
    if (v3)
      v9 = v3;
    else
      v9 = &stru_24E79DB48;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Forwarded accessory public pairing identity event completed %@%@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

uint64_t __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(a2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke_2;
  v6[3] = &unk_24E788D10;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[5];

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mediaProfiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke_3;
    v10[3] = &unk_24E786FA8;
    v10[4] = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(v7, "na_any:", v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
  return v7;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "characteristicBaseEvents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_3;
    v10[3] = &unk_24E786F58;
    v11 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "na_any:", v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_4;
  v8[3] = &unk_24E7928E0;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);
  return v8;
}

id __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke(uint64_t a1, void *a2)
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

void __66__HMDAppleMediaAccessory__handleAudioAnalysisBulletinBoardCommit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
      v9 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio analysis registration: %@, %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v15 = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated audio analysis registration: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 48), "respondWithSuccess");
    objc_msgSend(*(id *)(a1 + 32), "setAudioAnalysisEventNotificationCondition:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "setAudioAnalysisEventNotificationEnabled:", *(unsigned __int8 *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 64), "homeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", v13, v14, 1);

  }
}

id __35__HMDAppleMediaAccessory_dumpState__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __65__HMDAppleMediaAccessory_encodeFlagsFromHostedAccessories_coder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = objc_msgSend(a3, "unsignedIntegerValue");
  v7 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "accessoryFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") | v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

BOOL __68__HMDAppleMediaAccessory_encodeServicesFromHostedAccessories_coder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "hapMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

id __68__HMDAppleMediaAccessory_encodeServicesFromHostedAccessories_coder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __41__HMDAppleMediaAccessory__initWithCoder___block_invoke_2()
{
  return objc_alloc_init(MEMORY[0x24BE092B8]);
}

id __41__HMDAppleMediaAccessory__initWithCoder___block_invoke()
{
  return (id)_mediaRouteIdentifier;
}

uint64_t __86__HMDAppleMediaAccessory_mediaDestinationController_destinationManagerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __69__HMDAppleMediaAccessory_transactionObjectUpdated_newValues_message___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __63__HMDAppleMediaAccessory__relayRequestMessage_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__HMDAppleMediaAccessory__relayRequestMessage_responseHandler___block_invoke_2;
    block[3] = &unk_24E79B440;
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __63__HMDAppleMediaAccessory__relayRequestMessage_responseHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __47__HMDAppleMediaAccessory_updateWiFiNetworkInfo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "wifiManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MACAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "wifiManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentNetworkSSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2C0]), "initWithMACAddress:SSID:", v3, v5);
  +[HMDBackingStoreTransactionOptions defaultLocalOptions](HMDBackingStoreTransactionOptions, "defaultLocalOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastStagedWifiNetworkInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToNetworkInfo:", v6);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "wifiNetworkInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "lastStagedWifiNetworkInfo");
        v28 = v10;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v31 = v13;
        v32 = 2112;
        v33 = v6;
        v34 = 2112;
        v35 = v14;
        v36 = 2112;
        v37 = v15;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Updating WiFi network info to %@, lastCommitedWiFiInfo: %@, lastStagedWiFiInfo %@", buf, 0x2Au);

        v10 = v28;
      }

      objc_autoreleasePoolPop(v10);
      objc_msgSend(*(id *)(a1 + 32), "transactionWithObjectChangeType:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      objc_msgSend(v18, "setWifiNetworkInfo:", v6);
      objc_msgSend(*(id *)(a1 + 32), "lastStagedWifiNetworkInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "SSID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "SSID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = HMFEqualObjects();

      if ((v22 & 1) != 0)
      {
        v23 = CFSTR("HMDAppleMediaAccessoryWiFiMACLocalOnlyUpdateLabel");
      }
      else
      {
        +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
        v24 = objc_claimAutoreleasedReturnValue();

        v23 = CFSTR("HMDAppleMediaAccessoryWiFiNetworkInfoUpdateLabel");
        v7 = (void *)v24;
      }
      objc_msgSend(*(id *)(a1 + 32), "setLastStagedWifiNetworkInfo:", v6, v28);
      objc_msgSend(*(id *)(a1 + 32), "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "backingStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "transaction:options:", v23, v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "add:", v18);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __47__HMDAppleMediaAccessory_updateWiFiNetworkInfo__block_invoke_373;
      v29[3] = &unk_24E79BD80;
      v29[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v27, "run:", v29);

    }
  }

}

void __47__HMDAppleMediaAccessory_updateWiFiNetworkInfo__block_invoke_373(uint64_t a1, void *a2)
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
    v4 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "setLastStagedWifiNetworkInfo:", 0));
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Updating WiFi network info backing store transaction failed: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __53__HMDAppleMediaAccessory_handleSoftwareUpdateV2Scan___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@SoftwareUpdateV2Scan responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@SoftwareUpdateV2Scan responded", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v6);
  }

}

void __48__HMDAppleMediaAccessory__scanForSoftwareUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  os_log_type_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x227676638]();
  if (WeakRetained)
  {
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Received response for HMAccessorySoftwareUpdateControllerV2ScanMessage", (uint8_t *)&v33, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    if (v5)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = v9;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v15;
        v35 = 2112;
        v36 = v5;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@SRAISU: Scan message failed with error: %@", (uint8_t *)&v33, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v16 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "finishWithError:", v17);
      goto LABEL_22;
    }
    objc_msgSend(v6, "hmf_numberForKey:", *MEMORY[0x24BDD4FC8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;
    if (v20)
    {
      v21 = objc_msgSend(v20, "BOOLValue");
      v22 = (void *)MEMORY[0x227676638]();
      v23 = v9;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if (v21)
      {
        if (v25)
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543362;
          v34 = v26;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@SRAISU: scanResultFuture successfully found update", (uint8_t *)&v33, 0xCu);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
        goto LABEL_22;
      }
      if (!v25)
        goto LABEL_21;
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v27;
      v28 = "%{public}@SRAISU: scanResultFuture failed to find update";
      v29 = v24;
      v30 = OS_LOG_TYPE_INFO;
    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = v9;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        objc_autoreleasePoolPop(v22);
        v31 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "finishWithError:", v32);

LABEL_22:
        goto LABEL_23;
      }
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v27;
      v28 = "%{public}@SRAISU: Message did not contain required key in response: HMAccessorySoftwareUpdateControllerV2Mes"
            "sageKeyScanDidFindUpdate";
      v29 = v24;
      v30 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_2218F0000, v29, v30, v28, (uint8_t *)&v33, 0xCu);

    goto LABEL_21;
  }
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543362;
    v34 = v19;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Completing scan future with success because the accessory was deallocated", (uint8_t *)&v33, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
LABEL_23:

}

id __59__HMDAppleMediaAccessory__scanForSoftwareUpdateWithRetries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x227676638]();
  if (WeakRetained)
  {
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v8;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Scanning for software update with retryIntervalsRemaining: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "_scanForSoftwareUpdate");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Completing scan future with success because the accessory was deallocated", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v9;

  return v12;
}

void __61__HMDAppleMediaAccessory__applySoftwareUpdateWithDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      v12 = "%{public}@SRAISU: Failed to start software update with error: %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v13, v14, v12, (uint8_t *)&v16, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v11;
    v12 = "%{public}@SRAISU: Successfully started software update";
    v13 = v10;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

uint64_t __79__HMDAppleMediaAccessory_handleSoftwareUpdateDidBecomeAvailableWithDescriptor___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
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
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Handling software update did become available with descriptor: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  result = objc_msgSend(*(id *)(a1 + 32), "shouldApplySoftwareUpdateWhenFound");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_applySoftwareUpdateWithDescriptor:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "setShouldApplySoftwareUpdateWhenFound:", 0);
  }
  return result;
}

uint64_t __78__HMDAppleMediaAccessory_handleSoftwareUpdateV2ScanRepeatedlyAndApplyMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scanForSoftwareUpdateRepeatedlyAndInstallUpdate:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
}

void __84__HMDAppleMediaAccessory_updatePreferredMediaUserWithUUID_selectionType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 32);
      v17 = 138543874;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Updated preferred media user to %@ with error: %@", (uint8_t *)&v17, 0x20u);

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "setPreferredMediaUserUUID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredMediaUserSelectionTypeNumber:", v11);

    v6 = (void *)MEMORY[0x227676638]();
    v12 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "preferredMediaUserUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "preferredMediaUserSelectionTypeNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updated preferred media user UUID: %@, type: %@", (uint8_t *)&v17, 0x20u);

    }
  }

  objc_autoreleasePoolPop(v6);
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);

}

void __57__HMDAppleMediaAccessory_handleUpdatePreferredMediaUser___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Got preferred user update response %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = *(void **)(a1 + 40);
  if (v5)
    objc_msgSend(v11, "respondWithError:", v5);
  else
    objc_msgSend(v11, "respondWithSuccess");

}

void __57__HMDAppleMediaAccessory_handleDeleteSiriHistoryRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history relay responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Delete siri history relay responded", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", 0);
  }

}

void __57__HMDAppleMediaAccessory_handleDeleteSiriHistoryRequest___block_invoke_359(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1[4];
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
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history operation completed with error: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[5], "respondWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Delete siri history operation completed", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[5], "respondWithPayload:", 0);
  }

}

void __39__HMDAppleMediaAccessory__startUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a2;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitLogEvent:error:", *(_QWORD *)(a1 + 32), v6);

  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "responseHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v5)[2](v5, v6, 0);

  }
}

void __39__HMDAppleMediaAccessory__startUpdate___block_invoke_357(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v17 = 138543874;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      v11 = "%{public}@Failed to start update, %@, with error: %@";
      v12 = v8;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v12, v13, v11, (uint8_t *)&v17, v14);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v17 = 138543618;
    v18 = v9;
    v19 = 2112;
    v20 = v15;
    v11 = "%{public}@Successfully started update: %@";
    v12 = v8;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v5);
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "submitLogEvent:error:", *(_QWORD *)(a1 + 40), v3);

  objc_msgSend(*(id *)(a1 + 48), "respondWithPayload:error:", 0, v3);
}

void __51__HMDAppleMediaAccessory_postDeviceIRKIfDifferent___block_invoke(uint64_t a1, void *a2)
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
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Forwarded current device IRK error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

uint64_t __53__HMDAppleMediaAccessory_handleDeviceIsNotReachable___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification device is no longer reachable", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "setDeviceReachable:", 0);
}

uint64_t __50__HMDAppleMediaAccessory_handleDeviceIsReachable___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification device is reachable", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "setDeviceReachable:", 1);
}

void __67__HMDAppleMediaAccessory_handleInstallManagedConfigurationProfile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Remove managed configuration profile responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Remove managed configuration profile responded", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v6);
  }

}

void __67__HMDAppleMediaAccessory_handleInstallManagedConfigurationProfile___block_invoke_320(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    v5 = a2;
    objc_msgSend(v3, "respondWithError:", a3);
  }
  else
  {
    v8 = *MEMORY[0x24BDD4C58];
    v9[0] = a2;
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = a2;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "respondWithPayload:", v5);

  }
}

void __66__HMDAppleMediaAccessory_handleRemoveManagedConfigurationProfile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Remove managed configuration profile responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Remove managed configuration profile responded", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v6);
  }

}

uint64_t __66__HMDAppleMediaAccessory_handleRemoveManagedConfigurationProfile___block_invoke_319(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "respondWithError:", a2);
  else
    return objc_msgSend(v2, "respondWithSuccess");
}

void __66__HMDAppleMediaAccessory_handleFetchManagedConfigurationProfiles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Fetch managed configuration profiles responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetch managed configuration profiles responded", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v6);
  }

}

void __43__HMDAppleMediaAccessory_updateWithDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMCContext findAppleMediaAccessoryWithModelID:](HMCContext, "findAppleMediaAccessoryWithModelID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x227676638]();
    v7 = v3;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "category");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v20 = v10;
        v21 = 2112;
        v22 = v11;
        v23 = 2112;
        v24 = v12;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating category from: %@, to: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(MEMORY[0x24BDD7338], "categoryIdentifierForCategory:", *(_QWORD *)(a1 + 32));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAccessoryCategory:", v13);

      objc_msgSend(v7, "backingStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v15, "save:", &v18);

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        v21 = 2112;
        v22 = v17;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@MKF models do not exist for media accessory with UUID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
    }

  }
}

uint64_t __55__HMDAppleMediaAccessory_legacyLocationServicesEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("enabled"));

  return v3;
}

uint64_t __55__HMDAppleMediaAccessory_legacyLocationServicesEnabled__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("locationServices"));

  return v3;
}

void __56__HMDAppleMediaAccessory_autoConfigureTargetControllers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "supportsTargetController"))
  {
    v4 = v3;
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 ? v4 : 0;
    v6 = v5;

    if (v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "isCurrentAccessory");
        HMFBooleanToString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "isCurrentDeviceAvailableResident");
        HMFBooleanToString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v22 = v20;
        v23 = 2112;
        v24 = v10;
        v25 = 2112;
        v26 = v19;
        v27 = 2112;
        v28 = v18;
        v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding new target UUID: %@ to accessory: %@. isCurrentAccessory: %@ / isPrimaryResident: %@", buf, 0x34u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(v6, "targetUUIDs");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (void *)v12;
      else
        v14 = (void *)MEMORY[0x24BDBD1A8];
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObject:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "saveTargetUUIDs:", v17);

    }
  }

}

void __46__HMDAppleMediaAccessory__fixCloudKeyIfNeeded__block_invoke(uint64_t a1, void *a2)
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
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Fixed pairing identity", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);

}

void __50__HMDAppleMediaAccessory__fetchMultiUserLanguages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain supported multi-user languages. Error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetched multi-user languages %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "setSupportedMultiUserLanguageCodes:", v5);
  }

}

void __48__HMDAppleMediaAccessory_removeAudioDestination__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Audio destination removal transaction completed with error: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Audio destination removal transaction completed";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __86__HMDAppleMediaAccessory_legacyCreateAudioDestinationWithIdentifier_supportedOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Audio destination transaction completed with error: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Audio destination transaction completed";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __89__HMDAppleMediaAccessory_legacyCreateAudioDestinationControllerWithControllerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Upload audio destination controller finished with error: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Upload audio destination controller completed";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Failed to clean up multiple local store registrations: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Successfully cleaned up multiple local store registrations";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_249(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Failed to save initial audio analysis registration: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Successfully created initial audio analysis registration";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_253(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateSoftwareVersion:", v2);

}

void __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_261(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BDD17C8];
      HMFUptime();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%.3f"), v7 - *(double *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138546434;
      v27 = v5;
      v28 = 2114;
      v29 = CFSTR("accessoryConfigureDone");
      v30 = 2112;
      v31 = CFSTR("Configured accessory");
      v32 = 2114;
      v33 = CFSTR("state");
      v34 = 2112;
      v35 = CFSTR("end");
      v36 = 2114;
      v37 = CFSTR("duration");
      v38 = 2112;
      v39 = v8;
      v40 = 2114;
      v41 = CFSTR("homeUUID");
      v42 = 2112;
      v43 = v9;
      v44 = 2114;
      v45 = CFSTR("accessoryUUID");
      v46 = 2112;
      v47 = v10;
      v48 = 2114;
      v49 = CFSTR("accessoryType");
      v50 = 2112;
      v51 = v12;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x84u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v15 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%.3f"), v16 - *(double *)(a1 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v14, "initWithTag:data:", CFSTR("accessoryConfigureDone"), v22, CFSTR("state"), CFSTR("end"), CFSTR("duration"), v17, CFSTR("homeUUID"), v18, CFSTR("accessoryUUID"), v19, CFSTR("accessoryType"), v21);
    objc_msgSend(MEMORY[0x24BE3F138], "currentTagProcessorList");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitTaggedEvent:processorList:", v23, v24);

  }
  v25 = *(NSObject **)(a1 + 48);
  if (v25)
    dispatch_group_leave(v25);
}

id __30__HMDAppleMediaAccessory_init__block_invoke_2()
{
  return (id)_mediaRouteIdentifier;
}

id __30__HMDAppleMediaAccessory_init__block_invoke()
{
  return objc_alloc_init(MEMORY[0x24BE092B8]);
}

id __69__HMDAppleMediaAccessory_initWithTransaction_home_dependencyFactory___block_invoke_2()
{
  return (id)_mediaRouteIdentifier;
}

id __69__HMDAppleMediaAccessory_initWithTransaction_home_dependencyFactory___block_invoke()
{
  return objc_alloc_init(MEMORY[0x24BE092B8]);
}

+ (BOOL)shouldAcceptMessage:(id)a3 home:(id)a4 privilege:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isRemote"))
  {
    if ((objc_msgSend(v7, "isSecureRemote") & 1) != 0)
    {
      objc_msgSend(v7, "matchingRemoteIdentityUserForHome:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v8;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
LABEL_17:

      objc_autoreleasePoolPop(v16);
      objc_msgSend(v7, "responseHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "responseHandler");
        v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v22)[2](v22, v21, 0);

        v10 = 0;
      }
      goto LABEL_30;
    }
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543362;
    v33 = v19;
    v20 = "%{public}@Only secure clients may modify settings";
LABEL_16:
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, v20, (uint8_t *)&v32, 0xCu);

    goto LABEL_17;
  }
  if ((objc_msgSend(v7, "isEntitledForSPIAccess") & 1) == 0)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v8;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543362;
    v33 = v19;
    v20 = "%{public}@Only entitled clients may modify settings";
    goto LABEL_16;
  }
  objc_msgSend(v8, "currentUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = v9;
  if (!v9)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v23 = v8;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_28;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v14;
    v34 = 2112;
    v35 = v7;
    v15 = "%{public}@Unable to determine originator of message: %@";
    goto LABEL_27;
  }
  if (a5 != 3)
  {
    if (a5 == 4 && (objc_msgSend(v9, "isAdministrator") & 1) == 0)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = v8;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        goto LABEL_28;
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v14;
      v34 = 2112;
      v35 = v10;
      v15 = "%{public}@User does not have administrator privilege: %@";
      goto LABEL_27;
    }
LABEL_22:
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v8;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v27;
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Accepting message: %@", (uint8_t *)&v32, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    LOBYTE(v24) = 1;
    goto LABEL_31;
  }
  if ((objc_msgSend(v9, "isOwner") & 1) != 0)
    goto LABEL_22;
  v11 = (void *)MEMORY[0x227676638]();
  v28 = v8;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    goto LABEL_28;
  HMFGetLogIdentifier();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 138543618;
  v33 = v14;
  v34 = 2112;
  v35 = v10;
  v15 = "%{public}@User does not have owner privilege: %@";
LABEL_27:
  _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v32, 0x16u);

LABEL_28:
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v7, "responseHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 17, CFSTR("Insufficient privileges."), CFSTR("User has insufficient privileges for request."), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "responseHandler");
    v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v30)[2](v30, v29, 0);

LABEL_30:
    LOBYTE(v24) = 0;
  }
LABEL_31:

  return (char)v24;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t295 != -1)
    dispatch_once(&logCategory__hmf_once_t295, &__block_literal_global_431);
  return (id)logCategory__hmf_once_v296;
}

void __37__HMDAppleMediaAccessory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v296;
  logCategory__hmf_once_v296 = v0;

}

- (id)assistantObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id *v8;
  id *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id obj;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  void *v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _QWORD v81[2];
  _QWORD v82[2];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v76.receiver = self;
  v76.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory assistantObject](&v76, sel_assistantObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDAccessory category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDD49A0]);

  if ((v7 & 1) != 0)
  {
    v8 = (id *)MEMORY[0x24BE81FA0];
    v9 = (id *)MEMORY[0x24BE82050];
    goto LABEL_5;
  }
  objc_msgSend(v5, "categoryType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", *MEMORY[0x24BDD49E0]);

  if ((v11 & 1) != 0)
  {
    v8 = (id *)MEMORY[0x24BE81FE0];
    v9 = (id *)MEMORY[0x24BE82130];
LABEL_5:
    v12 = *v9;
    v13 = *v8;
    if (v12)
      v14 = v13 == 0;
    else
      v14 = 1;
    v61 = v13;
    if (!v14)
    {
      v81[0] = CFSTR("objectServiceType");
      v81[1] = CFSTR("objectServiceSubType");
      v82[0] = v12;
      v82[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addEntriesFromDictionary:", v15);

    }
    goto LABEL_13;
  }
  v16 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v84 = v18;
    v85 = 2112;
    v86 = v5;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Apple media accessory with invalid accessory category: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v12 = 0;
  v61 = 0;
LABEL_13:
  -[HMDAccessory home](self, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v19, "mediaSystems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  v63 = v19;
  v64 = v4;
  v62 = v5;
  if (v22)
  {
    v23 = v22;
    v24 = v12;
    v25 = *(_QWORD *)v73;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v73 != v25)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v27, "accessories");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "containsObject:", self);

        if (v29)
        {
          objc_msgSend(v27, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "urlString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      if (v23)
        continue;
      break;
    }
    v30 = 0;
    v31 = 0;
LABEL_23:
    v12 = v24;
    v19 = v63;
    v4 = v64;
  }
  else
  {
    v30 = 0;
    v31 = 0;
  }

  -[HMDAppleMediaAccessory audioDestinationController](self, "audioDestinationController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "data");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "destinationIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[HMDMediaAccessory name](self, "name");
    v35 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "urlString");
    v36 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v36;
    v31 = (void *)v35;
  }
  -[HMDAppleMediaAccessory audioDestination](self, "audioDestination");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (!v31 && v37)
  {
    v66 = (void *)v37;
    v67 = v30;
    v58 = v33;
    v59 = v32;
    v60 = v12;
    objc_msgSend(v19, "accessories");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "na_map:", &__block_literal_global_156334);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = v40;
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    if (v41)
    {
      v42 = v41;
      v43 = 0;
      v44 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v69 != v44)
            objc_enumerationMutation(obj);
          v46 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          objc_msgSend(v46, "audioDestinationController");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "data");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "destinationIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "uniqueIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v49, "hmf_isEqualToUUID:", v50);

          if (v51)
          {
            objc_msgSend(v46, "name");
            v52 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v47, "urlString");
            v53 = objc_claimAutoreleasedReturnValue();

            v67 = (void *)v53;
            v43 = (void *)v52;
          }

        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      }
      while (v42);
    }
    else
    {
      v43 = 0;
    }

    v19 = v63;
    v4 = v64;
    v32 = v59;
    v12 = v60;
    v38 = v66;
    v30 = v67;
    v33 = v58;
    v31 = v43;
  }
  if (v31 && v30)
  {
    v78 = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v78, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("objectGroups"));

    v77 = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("objectGroupIdentifiers"));

  }
  v56 = (void *)objc_msgSend(v4, "copy");

  return v56;
}

id __52__HMDAppleMediaAccessory_Assistant__assistantObject__block_invoke(uint64_t a1, void *a2)
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

- (id)languageValueList
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[HMDAppleMediaAccessory settingsController](self, "settingsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageValueList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1A8];
  v5 = v3;

  return v5;
}

- (void)configureAppleMediaAccessoryMessengerWithFactory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDAppleMediaAccessoryMessageRouter *v9;
  HMDAssistantSettingsConnection *v10;
  void *v11;
  HMDAssistantSettingsConnection *v12;
  HMDAppleMediaAccessoryLocalMessageHandler *v13;
  void *v14;
  void *v15;
  HMDAppleMediaAccessory *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessory uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory msgDispatcher](self, "msgDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  if (!v6)
    goto LABEL_10;
  v8 = (void *)v7;
  if (v7)
  {
    v9 = -[HMDAppleMediaAccessoryMessageRouter initWithIdentifier:messageDispatcher:]([HMDAppleMediaAccessoryMessageRouter alloc], "initWithIdentifier:messageDispatcher:", v5, v6);
    -[HMDAppleMediaAccessoryMessageRouter setDataSource:](v9, "setDataSource:", self);
    v10 = [HMDAssistantSettingsConnection alloc];
    objc_msgSend(MEMORY[0x24BE3F268], "defaultScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMDAssistantSettingsConnection initWithScheduler:](v10, "initWithScheduler:", v11);

    -[HMDAssistantSettingsConnection setDataSource:](v12, "setDataSource:", v12);
    v13 = -[HMDAppleMediaAccessoryLocalMessageHandler initWithIdentifier:assistantSettingsConnection:]([HMDAppleMediaAccessoryLocalMessageHandler alloc], "initWithIdentifier:assistantSettingsConnection:", v5, v12);
    -[HMDAppleMediaAccessoryLocalMessageHandler setDataSource:](v13, "setDataSource:", self);
    objc_msgSend(v4, "createAppleMediaAccessoryMessengerWithIdentifier:messageDispatcher:router:localHandler:", v5, v6, v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerForMessagesWithHome:", v8);
    -[HMDAppleMediaAccessory setMessenger:](self, "setMessenger:", v14);

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
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to configure apple media accessory due to no home on accessory", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (id)createAppleMediaAccessoryMessengerWithIdentifier:(id)a3 messageDispatcher:(id)a4 router:(id)a5 localHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  HMDAppleMediaAccessoryMessenger *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[HMDAppleMediaAccessoryMessenger initWithIdentifier:messageDispatcher:router:localHandler:]([HMDAppleMediaAccessoryMessenger alloc], "initWithIdentifier:messageDispatcher:router:localHandler:", v12, v11, v10, v9);

  return v13;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  void *v2;
  char v3;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDevicePrimaryResident");

  return v3;
}

@end
