@implementation HMDAppleAccessoryPairingHomeController

- (HMDAppleAccessoryPairingHomeController)initWithState:(id)a3 homeManager:(id)a4 dataSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDAppleAccessoryPairingHomeController *v12;
  HMDAppleAccessoryPairingHomeController *v13;
  uint64_t v14;
  HMFTimer *upgradeCheckTimer;
  void *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDAppleAccessoryPairingHomeController;
  v12 = -[HMDAppleAccessoryPairingHomeController init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_state, a3);
    objc_storeStrong((id *)&v13->_homeManager, a4);
    objc_storeStrong((id *)&v13->_dataSource, a5);
    objc_msgSend(v11, "timerWithInterval:options:", 12, 120.0);
    v14 = objc_claimAutoreleasedReturnValue();
    upgradeCheckTimer = v13->_upgradeCheckTimer;
    v13->_upgradeCheckTimer = (HMFTimer *)v14;

    -[HMFTimer setDelegate:](v13->_upgradeCheckTimer, "setDelegate:", v13);
    v13->_suppressedQueries = 0;
    objc_msgSend(v11, "notificationCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v13, sel__handleDeviceNotification_, CFSTR("HMDAppleAccountManagerResolved"), 0);

  }
  return v13;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDAppleAccessoryPairingHomeController upgradeCheckTimer](self, "upgradeCheckTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[HMDAppleAccessoryPairingHomeController checkDeviceVersionAndSendUpgrade](self, "checkDeviceVersionAndSendUpgrade");
}

- (BOOL)handleMessage:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAppleAccessoryPairingHomeController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  NSObject *v35;
  void *v37;
  _QWORD block[5];
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuidForKey:", CFSTR("kAccessoryUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("kAddAccessoryRequestKey"));

  if (v10)
  {
    -[HMDAppleAccessoryPairingHomeController state](self, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "isEqual:", v13);

    if (v14)
    {
      objc_msgSend(v7, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleAccessoryPairingHomeController state](self, "state");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHomeUUID:", v15);

      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleAccessoryPairingHomeController state](v18, "state");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "accessory");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uuid");
        v37 = v17;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v20;
        v42 = 2112;
        v43 = v23;
        v44 = 2112;
        v45 = v24;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Adding Legacy HomePod %@ To Home: %@", buf, 0x20u);

        v17 = v37;
      }

      objc_autoreleasePoolPop(v17);
      -[HMDAppleAccessoryPairingHomeController state](v18, "state");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setState:", 1);

      -[HMDAppleAccessoryPairingHomeController dataSource](v18, "dataSource");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleAccessoryPairingHomeController state](v18, "state");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "updatePairingAccessoryState:", v27);

    }
  }
  else
  {
    objc_msgSend(v6, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqual:", CFSTR("kRemoveAccessoryRequestKey"));

    if (v29)
    {
      -[HMDAppleAccessoryPairingHomeController state](self, "state");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "accessory");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "uuid");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v8, "isEqual:", v32);

      if (v33)
      {
        -[HMDAppleAccessoryPairingHomeController homeManager](self, "homeManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "workQueue");
        v35 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __61__HMDAppleAccessoryPairingHomeController_handleMessage_from___block_invoke;
        block[3] = &unk_24E79C268;
        block[4] = self;
        v39 = v8;
        dispatch_async(v35, block);

      }
    }
  }

  return 0;
}

- (void)startWithLocalZone:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAppleAccessoryPairingHomeController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!self->_localZone)
  {
    objc_storeStrong((id *)&self->_localZone, a3);
    -[HMDAppleAccessoryPairingHomeController localZone](self, "localZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserverForAllModels:", self);

    -[HMDAppleAccessoryPairingHomeController localZone](self, "localZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startUp");

    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleAccessoryPairingHomeController state](v9, "state");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cloudZoneID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v11;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Starting state machine for zone: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDAppleAccessoryPairingHomeController localZone](v9, "localZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mirror");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    v19 = (id)objc_msgSend(v18, "registerSubscriptionForExternalRecordType:", 0);
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Startup zone fetch"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "performCloudPullWithOptions:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __61__HMDAppleAccessoryPairingHomeController_startWithLocalZone___block_invoke;
    v27[3] = &unk_24E79BCF0;
    v27[4] = v9;
    v23 = (id)objc_msgSend(v21, "addSuccessBlock:", v27);

    objc_msgSend(v18, "startUp");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = v22;
    v26[1] = 3221225472;
    v26[2] = __61__HMDAppleAccessoryPairingHomeController_startWithLocalZone___block_invoke_85;
    v26[3] = &unk_24E79BCF0;
    v26[4] = v9;
    v25 = (id)objc_msgSend(v24, "addSuccessBlock:", v26);

  }
}

- (id)workContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__HMDAppleAccessoryPairingHomeController_workContext__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  if (workContext__hmf_once_t20 != -1)
    dispatch_once(&workContext__hmf_once_t20, block);
  return (id)workContext__hmf_once_v21;
}

- (void)cleanupLegacyZone
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[HMDAppleAccessoryPairingHomeController upgradeCheckTimer](self, "upgradeCheckTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDAppleAccessoryPairingHomeController homeManager](self, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HMDAppleAccessoryPairingHomeController_cleanupLegacyZone__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)postNotificationOfDeviceUpdated
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
  id v14;

  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPostedSoftwareUpdateDescriptor");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "setStatus:", 2);
    -[HMDAppleAccessoryPairingHomeController postSoftwareUpdateEventForDescriptor:](self, "postSoftwareUpdateEventForDescriptor:", v14);
  }
  -[HMDAppleAccessoryPairingHomeController homeManager](self, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_homeWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryWithUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDAppleAccessoryPairingHomeController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bulletinBoard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertHH2SoftwareUpdateCompleteEventBulletinForAccessory:", v11);

  }
}

- (void)checkDeviceVersionAndSendUpgrade
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
  void *v13;
  void *v14;
  HMDHomeKitVersion *v15;
  int v16;
  void *v17;
  HMDAppleAccessoryPairingHomeController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDAppleAccessoryPairingHomeController *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDAppleAccessoryPairingHomeController *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[5];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    goto LABEL_4;
  }
  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_4:
    -[HMDAppleAccessoryPairingHomeController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleAccessoryPairingHomeController state](self, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceForIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_10;
    objc_msgSend(v11, "version");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_10;
    v13 = (void *)v12;
    objc_msgSend(v11, "version");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("10.0"));
    v16 = objc_msgSend(v14, "isAtLeastVersion:", v15);

    if (v16)
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v20;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Previously legacy HomePod has been updated to a HH2.0 viable HomeKit", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDAppleAccessoryPairingHomeController postNotificationOfDeviceUpdated](v18, "postNotificationOfDeviceUpdated");
      -[HMDAppleAccessoryPairingHomeController cleanupLegacyZone](v18, "cleanupLegacyZone");
    }
    else
    {
LABEL_10:
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v24;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Querying HomePod to determine if it has upgradable software.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      -[HMDAppleAccessoryPairingHomeController workContext](v22, "workContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke;
      v30[3] = &unk_24E79C240;
      v30[4] = v22;
      objc_msgSend(v25, "performBlock:", v30);

    }
    return;
  }
  v26 = (void *)MEMORY[0x227676638]();
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v29;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to query HomePod for update status (no device).", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v26);
}

- (void)postSoftwareUpdateEventForSoftwareUpdate:(id)a3
{
  id v4;
  uint64_t v5;
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
  HMDAppleAccessoryPairingHomeController *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  HMDAppleAccessoryPairingHomeController *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  switch(objc_msgSend(v4, "state"))
  {
    case 0:
      v21 = self;
      v5 = 3;
      goto LABEL_8;
    case 1:
      v21 = self;
      v5 = 14;
      goto LABEL_8;
    case 2:
      v21 = self;
      v5 = 15;
      goto LABEL_8;
    case 3:
      v21 = self;
      v5 = 9;
      goto LABEL_8;
    case 4:
      v21 = self;
      v5 = 2;
LABEL_8:
      v20 = v5;
      goto LABEL_9;
    case 5:
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@HMSoftwareUpdateRequested is not supported for HomePod in the HH1 shim", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      goto LABEL_15;
    default:
      v20 = 0;
      v21 = self;
LABEL_9:
      v28 = objc_alloc(MEMORY[0x24BDD79E0]);
      v34 = objc_msgSend(v4, "downloadSize");
      if (v34)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "downloadSize"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35 = 0;
      }
      objc_msgSend(v4, "documentationMetadata");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "URL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "absoluteURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "documentationMetadata");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "digest");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "algorithm");
      HMFDigestAlgorithmToString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "documentationMetadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "digest");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "value");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "version");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v24, "majorVersion"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "version");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "minorVersion"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "version");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "updateVersion"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "version");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "buildVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "initWithStatus:downloadSize:humanReadableUpdateName:rampEnabled:errorCode:serverAssetURL:serverAssetAlgorithm:serverAssetMeasurement:majorVersion:minorVersion:updateVersion:buildVersion:", v20, v35, 0, 0, 0, v25, v22, v23, v7, v10, v13, v15);

      if (v34)
      -[HMDAppleAccessoryPairingHomeController postSoftwareUpdateEventForDescriptor:](v21, "postSoftwareUpdateEventForDescriptor:", v29);

LABEL_15:
      return;
  }
}

- (void)postSoftwareUpdateEventForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
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
  void *v22;
  void *v23;
  void *v24;
  HMDAppleAccessoryPairingHomeController *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDAppleAccessoryPairingHomeController *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDAppleAccessoryPairingHomeController *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDD79E8]);
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v10 = (void *)objc_msgSend(v9, "initWithDescriptor:eventSource:eventTimestamp:", v4, v8);
    -[HMDAppleAccessoryPairingHomeController state](self, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAppleAccessoryPairingHomeController homeManager](self, "homeManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleAccessoryPairingHomeController state](self, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "homeUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_homeWithUUID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "uuid");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v13 && v18)
    {
      objc_msgSend(MEMORY[0x24BDD73A0], "topicFromSuffixID:homeUUID:accessoryUUID:", *MEMORY[0x24BDD4BD0], v18, v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        -[HMDAppleAccessoryPairingHomeController state](self, "state");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setLastPostedSoftwareUpdateDescriptor:", v4);

        -[HMDAppleAccessoryPairingHomeController homeManager](self, "homeManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "eventForwarder");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "forwardEvent:topic:completion:", v10, v20, 0);

      }
      else
      {
        v32 = (void *)MEMORY[0x227676638]();
        v33 = self;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = v32;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v35;
          v39 = 2112;
          v40 = v19;
          v41 = 2112;
          v42 = v13;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to get SU topic with homeUUID: %@, accessoryUUID: %@", buf, 0x20u);

          v32 = v36;
        }

        objc_autoreleasePoolPop(v32);
      }

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
        *(_DWORD *)buf = 138543874;
        v38 = v31;
        v39 = 2112;
        v40 = v19;
        v41 = 2112;
        v42 = v13;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil value in homeUUID: %@, accessoryUUID: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
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
      *(_DWORD *)buf = 138543362;
      v38 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Event source was nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
  }

}

- (void)_handleDeviceNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAppleAccessoryPairingHomeController *v6;
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
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Got device notification.", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAppleAccessoryPairingHomeController checkDeviceVersionAndSendUpgrade](v6, "checkDeviceVersionAndSendUpgrade");

}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAppleAccessoryPairingHomeController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertToHMDModelObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "debugString:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Got Legacy Pairing creation:\n%@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  v15 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
    -[HMDAppleAccessoryPairingHomeController processHMDResidentDeviceModel:](v11, "processHMDResidentDeviceModel:", v17);

  return 0;
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAppleAccessoryPairingHomeController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HMDAppleAccessoryPairingHomeController *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertToHMDModelObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "debugString:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Got Legacy Pairing deletion:\n%@", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(v9, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleAccessoryPairingHomeController state](v11, "state");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v15, "hmf_isEqualToUUID:", v18);

  if (v19)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v11;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Got Legacy Pairing deletion for accessory that is being setup removing HH1 zone", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDAppleAccessoryPairingHomeController cleanupLegacyZone](v21, "cleanupLegacyZone");
  }

  return 0;
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAppleAccessoryPairingHomeController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertToHMDModelObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "debugString:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Got Legacy Pairing update:\n%@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  v15 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
    -[HMDAppleAccessoryPairingHomeController processHMDAppleMediaAccessoryModel:](v11, "processHMDAppleMediaAccessoryModel:", v17);
  v18 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  if (v20)
    -[HMDAppleAccessoryPairingHomeController processHMDResidentDeviceModel:](v11, "processHMDResidentDeviceModel:", v20);

  return 0;
}

- (void)processHMDResidentDeviceModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  objc_msgSend(a3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDevice:", v4);

  -[HMDAppleAccessoryPairingHomeController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatePairingAccessoryState:", v7);

  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqual:", v12);

  if (v13)
  {
    -[HMDAppleAccessoryPairingHomeController upgradeCheckTimer](self, "upgradeCheckTimer");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fire");

  }
}

- (void)processHMDAppleMediaAccessoryModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAppleAccessoryPairingHomeController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAppleAccessoryPairingHomeController *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  HMDAppleAccessoryPairingHomeController *v26;
  NSObject *v27;
  _BOOL4 v28;
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
  HMDAppleAccessoryPairingHomeController *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  HMDAppleAccessoryPairingHomeController *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  HMDAppleAccessoryPairingHomeController *v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  __int16 v73;
  id v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v4, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 138543618;
        v72 = v18;
        v73 = 2112;
        v74 = v4;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory model does not yet have a device identifier: %@", (uint8_t *)&v71, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      goto LABEL_46;
    }
  }
  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleAccessoryPairingHomeController state](v9, "state");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deviceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 138543874;
      v72 = v11;
      v73 = 2112;
      v74 = v13;
      v75 = 2112;
      v76 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Already have a device identifier %@ for %@", (uint8_t *)&v71, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    objc_msgSend(v4, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      objc_msgSend(v4, "deviceUUID");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;

    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v28)
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleAccessoryPairingHomeController state](v26, "state");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "accessory");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "uuid");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 138543874;
        v72 = v29;
        v73 = 2112;
        v74 = v32;
        v75 = 2112;
        v76 = v24;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Looks like deviceIdentifier for %@ is: %@", (uint8_t *)&v71, 0x20u);

      }
      objc_autoreleasePoolPop(v25);
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v24);
      -[HMDAppleAccessoryPairingHomeController state](v26, "state");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setDeviceIdentifier:", v33);

      -[HMDAppleAccessoryPairingHomeController dataSource](v26, "dataSource");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleAccessoryPairingHomeController state](v26, "state");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "updatePairingAccessoryState:", v36);

    }
    else
    {
      if (v28)
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 138543618;
        v72 = v37;
        v73 = 2112;
        v74 = v4;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Still don't have a device identifier for %@", (uint8_t *)&v71, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
    }

  }
  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "device");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v40 = (void *)MEMORY[0x227676638]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleAccessoryPairingHomeController state](v41, "state");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "device");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 138543874;
      v72 = v43;
      v73 = 2112;
      v74 = v45;
      v75 = 2112;
      v76 = v4;
      _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Already have a device %@ for %@", (uint8_t *)&v71, 0x20u);

    }
    objc_autoreleasePoolPop(v40);
  }
  else
  {
    objc_msgSend(v4, "device");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v47 = (void *)MEMORY[0x227676638]();
      v48 = self;
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 138543618;
        v72 = v50;
        v73 = 2112;
        v74 = v46;
        _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@And we have a device representation: %@", (uint8_t *)&v71, 0x16u);

      }
      objc_autoreleasePoolPop(v47);
      -[HMDAppleAccessoryPairingHomeController state](v48, "state");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setDevice:", v46);

      -[HMDAppleAccessoryPairingHomeController dataSource](v48, "dataSource");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleAccessoryPairingHomeController state](v48, "state");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "updatePairingAccessoryState:", v53);

    }
  }
  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "device");
  v55 = objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v56 = (void *)v55;

LABEL_34:
    -[HMDAppleAccessoryPairingHomeController dataSource](self, "dataSource");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "hh1ControllerIdentity");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = (void *)MEMORY[0x227676638]();
    v60 = self;
    HMFGetOSLogHandle();
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v58)
    {
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 138543874;
        v72 = v63;
        v73 = 2112;
        v74 = v56;
        v75 = 2112;
        v76 = v58;
        _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@Updated pairing identity for device %@: %@", (uint8_t *)&v71, 0x20u);

      }
      objc_autoreleasePoolPop(v59);
      +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "registerIdentity:device:object:", v58, v56, v60);

    }
    else
    {
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 138543362;
        v72 = v65;
        _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_ERROR, "%{public}@No Pairing Identity. This will cause issues.", (uint8_t *)&v71, 0xCu);

      }
      objc_autoreleasePoolPop(v59);
    }

    goto LABEL_42;
  }
  objc_msgSend(v4, "device");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
    goto LABEL_34;
LABEL_42:
  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "device");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {

LABEL_45:
    -[HMDAppleAccessoryPairingHomeController upgradeCheckTimer](self, "upgradeCheckTimer");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "fire");

    goto LABEL_46;
  }
  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "deviceIdentifier");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
    goto LABEL_45;
LABEL_46:

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDAppleAccessoryPairingHomeController state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 8, 1);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_getProperty(self, a2, 16, 1);
}

- (HMFTimer)upgradeCheckTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (HMDAppleAccessoryPairingHomeState)state
{
  return self->_state;
}

- (HMDAppleAccessoryPairingControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (HMFFuture)queryFuture
{
  return self->_queryFuture;
}

- (void)setQueryFuture:(id)a3
{
  objc_storeStrong((id *)&self->_queryFuture, a3);
}

- (unint64_t)suppressedQueries
{
  return self->_suppressedQueries;
}

- (void)setSuppressedQueries:(unint64_t)a3
{
  self->_suppressedQueries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryFuture, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_upgradeCheckTimer, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
}

void __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  uint64_t v20;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "queryFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "suppressedQueries"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v6;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Outstanding query request to HomePod, suppressing query (suppressed %@ so far)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "setSuppressedQueries:", objc_msgSend(*(id *)(a1 + 32), "suppressedQueries") + 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setSuppressedQueries:", 0);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __sendMessageWithFutureResult(v8, v11, (void *)*MEMORY[0x24BDD6DD8], MEMORY[0x24BDBD1B8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "workContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke_93;
    v21[3] = &unk_24E78DFE0;
    v21[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "inContext:then:", v13, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "workContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = 3221225472;
    v19[2] = __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke_99;
    v19[3] = &unk_24E78DFE0;
    v20 = *(_QWORD *)(a1 + 32);
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke_100;
    v18[3] = &unk_24E797A18;
    v18[4] = v20;
    v19[0] = v14;
    objc_msgSend(v15, "inContext:then:orRecover:", v16, v19, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setQueryFuture:", v17);

  }
}

uint64_t __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke_93(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setSuppressedQueries:", 0);
  v4 = *MEMORY[0x24BDD6DF8];
  objc_msgSend(v3, "hmf_dataForKey:", *MEMORY[0x24BDD6DF8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v30 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v30);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v30;
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v12;
        v35 = 2112;
        v36 = v6;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting device update to: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(*(id *)(a1 + 32), "postSoftwareUpdateEventForSoftwareUpdate:", v6);
      v31 = v4;
      v32 = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v14, "state");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "accessory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      __sendMessageWithFutureResult(v14, v17, (void *)*MEMORY[0x24BDD6DE8], v13);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (!v18)
        _HMFPreconditionFailure();
      v19 = v18;

      v20 = 3;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v27;
        v35 = 2112;
        v36 = v7;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update from software update data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v28 = v7;
      if (v28)
      {
        v13 = v28;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
        objc_claimAutoreleasedReturnValue();
        v13 = 0;
      }
      v20 = 2;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x227676638]();
    v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v25;
      v35 = 2112;
      v36 = v21;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Payload did not have software update status: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v26 = v21;
    if (v26)
    {
      v6 = v26;
      v20 = 2;
      v7 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
      v6 = 0;
      v7 = 0;
      v20 = 2;
    }
  }

  return v20;
}

uint64_t __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke_99(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setSuppressedQueries:", 0);
  v4 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "setQueryFuture:", 0));
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Message update response: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

  return 1;
}

uint64_t __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke_100(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setQueryFuture:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "suppressedQueries"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setSuppressedQueries:", 0);
    objc_msgSend(*(id *)(a1 + 32), "checkDeviceVersionAndSendUpgrade");
  }
  return 1;
}

void __59__HMDAppleAccessoryPairingHomeController_cleanupLegacyZone__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  objc_msgSend(*(id *)(a1 + 32), "localZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeZone:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__HMDAppleAccessoryPairingHomeController_cleanupLegacyZone__block_invoke_2;
  v10[3] = &unk_24E79BCF0;
  v10[4] = *(_QWORD *)(a1 + 32);
  v7 = (id)objc_msgSend(v5, "addSuccessBlock:", v10);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __59__HMDAppleAccessoryPairingHomeController_cleanupLegacyZone__block_invoke_89;
  v9[3] = &unk_24E79BD80;
  v9[4] = *(_QWORD *)(a1 + 32);
  v8 = (id)objc_msgSend(v5, "addFailureBlock:", v9);

}

void __59__HMDAppleAccessoryPairingHomeController_cleanupLegacyZone__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Successfully removed legacy pairing zone.", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "legacyAccessoryPairingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cloudZoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeControllerForZone:", v11);

}

void __59__HMDAppleAccessoryPairingHomeController_cleanupLegacyZone__block_invoke_89(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove temporary pairing zone: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __53__HMDAppleAccessoryPairingHomeController_workContext__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x24BE3F168]);
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithQueue:", v3);
  v5 = (void *)workContext__hmf_once_v21;
  workContext__hmf_once_v21 = v4;

}

void __61__HMDAppleAccessoryPairingHomeController_startWithLocalZone___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Initial zone fetch completed, checking for update.", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "upgradeCheckTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

}

void __61__HMDAppleAccessoryPairingHomeController_startWithLocalZone___block_invoke_85(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudZoneID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v7;
    v44 = 2112;
    v45 = v10;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@State machine completely started for zone: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v11, "fetchModelWithModelID:error:", v14, &v41);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v41;

  if (v15)
  {
    v17 = v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    objc_msgSend(v19, "convertToHMDModelObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = v20;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
      v24 = v23;

      if (v24)
      {
        objc_msgSend(*(id *)(a1 + 32), "processHMDAppleMediaAccessoryModel:", v24);
      }
      else
      {
        v36 = (void *)MEMORY[0x227676638]();
        v37 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = v36;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v39;
          v44 = 2112;
          v45 = v22;
          _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Expected a HMDAppleMediaAccessory but %@ does not look like one.", buf, 0x16u);

          v36 = v40;
        }

        objc_autoreleasePoolPop(v36);
      }

    }
    else
    {
      v32 = (void *)MEMORY[0x227676638]();
      v33 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v35;
        v44 = 2112;
        v45 = v17;
        _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to extract a HMDBSO from %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
    }

  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "state");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "accessory");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "uuid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v28;
      v44 = 2112;
      v45 = v31;
      v46 = 2112;
      v47 = v16;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch extant HMDMediaAccessoryModel for %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
  }

}

void __61__HMDAppleAccessoryPairingHomeController_handleMessage_from___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "localZone");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Accessory Remove"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "removeModelIDs:options:", v2, v3);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t54_182066 != -1)
    dispatch_once(&logCategory__hmf_once_t54_182066, &__block_literal_global_182067);
  return (id)logCategory__hmf_once_v55_182068;
}

void __53__HMDAppleAccessoryPairingHomeController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v55_182068;
  logCategory__hmf_once_v55_182068 = v0;

}

@end
