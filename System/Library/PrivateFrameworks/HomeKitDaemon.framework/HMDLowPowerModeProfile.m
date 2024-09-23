@implementation HMDLowPowerModeProfile

- (HMDLowPowerModeProfile)initWithAccessory:(id)a3 powerManagementservice:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMDLowPowerModeProfile *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *clientIdentifier;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (HMDLowPowerModeUUIDFromAccessory_onceToken != -1)
    dispatch_once(&HMDLowPowerModeUUIDFromAccessory_onceToken, &__block_literal_global_230_84903);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_retainAutorelease(v11);
  objc_msgSend(v12, "getUUIDBytes:", objc_msgSend(v13, "mutableBytes"));

  objc_msgSend(MEMORY[0x24BDD1880], "hmf_UUIDWithNamespace:data:", HMDLowPowerModeUUIDFromAccessory_namespace, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)HMDLowPowerModeProfile;
  v16 = -[HMDAccessoryProfile initWithAccessory:uniqueIdentifier:services:workQueue:](&v23, sel_initWithAccessory_uniqueIdentifier_services_workQueue_, v8, v14, v15, v10);

  if (v16)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@.HMDLowPowerMode.%@"), CFSTR("com.apple.HomeKitDaemon"), v19);
    v20 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v16->_clientIdentifier;
    v16->_clientIdentifier = (NSString *)v20;

    objc_storeWeak((id *)&v16->_delegate, v8);
    -[HMDLowPowerModeProfile _resetStateMachine](v16, "_resetStateMachine");
  }

  return v16;
}

- (void)registerForMessages
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDLowPowerModeProfile *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  HMDLowPowerModeProfile *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v13.receiver = self;
  v13.super_class = (Class)HMDLowPowerModeProfile;
  -[HMDAccessoryProfile registerForMessages](&v13, sel_registerForMessages);
  -[HMDAccessoryProfile accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v15 = v9;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering for messages with home: %@ for %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel_handleAccessoryCharacteristicsChanged_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel_handleAccessoryConfigurationChanged_, CFSTR("HMDAccessoryConnectedNotification"), v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel_handleAccessoryConfigurationChanged_, CFSTR("HMDAccessoryDisconnectedNotification"), v4);

}

- (void)handleInitialState
{
  NSObject *v3;
  objc_super v4;

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4.receiver = self;
  v4.super_class = (Class)HMDLowPowerModeProfile;
  -[HMDAccessoryProfile handleInitialState](&v4, sel_handleInitialState);
  -[HMDLowPowerModeProfile _readInitialRequiredCharacteristics](self, "_readInitialRequiredCharacteristics");
}

- (void)unconfigure
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDLowPowerModeProfile;
  -[HMDAccessoryProfile unconfigure](&v4, sel_unconfigure);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HMDLowPowerModeProfile _updateCharacteristicsNotifications:](self, "_updateCharacteristicsNotifications:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[HMDLowPowerModeProfile unconfigure](self, "unconfigure");
  v3.receiver = self;
  v3.super_class = (Class)HMDLowPowerModeProfile;
  -[HMDLowPowerModeProfile dealloc](&v3, sel_dealloc);
}

- (void)wakeSuspendedAccessoryWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  v7 = a3;
  -[HMDLowPowerModeProfile connectivityInfo](self, "connectivityInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "woWLANInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "wakeType") == 2;

  -[HMDLowPowerModeProfile wakeSuspendedAccessoryWithType:completion:](self, "wakeSuspendedAccessoryWithType:completion:", v6, v7);
}

- (void)wakeSuspendedAccessoryWithType:(unint64_t)a3 completion:(id)a4
{
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDLowPowerModeProfile *v16;
  NSObject *v17;
  void *v18;
  HMDLowPowerModeProfile *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HMDLowPowerModeProfile *v23;
  NSObject *v24;
  void *v25;
  HMDLowPowerModeProfile *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDLowPowerModeProfile *v33;
  NSObject *v34;
  HMDLowPowerModeProfile *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  HMDLowPowerModeProfile *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  HMDLowPowerModeProfile *v55;
  NSObject *v56;
  HMDLowPowerModeProfile *v57;
  HMDLowPowerModeProfile *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  HMDLowPowerModeProfile *v66;
  void *v67;
  HMDLowPowerModeProfile *v68;
  void *v69;
  void *v70;
  HMDLowPowerModeProfile *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  _QWORD v77[4];
  id v78;
  HMDLowPowerModeProfile *v79;
  id v80;
  void (**v81)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  HMDLowPowerModeProfile *v85;
  __int16 v86;
  HMDLowPowerModeProfile *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_alloc(MEMORY[0x24BE3F138]);
  v10 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@, %s:%ld"), v11, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/PowerManagement/WakeOnLAN/HMDLowPowerModeProfile.m", 177);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithName:", v12);

  -[HMDLowPowerModeProfile suspendedAccessory](self, "suspendedAccessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLowPowerModeProfile suspendedAccessory](v16, "suspendedAccessory");
      v19 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v83 = v18;
      v84 = 2112;
      v85 = v16;
      v86 = 2112;
      v87 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Wake operation is in progress for %@ with suspended accessory: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = 15;
LABEL_9:
    objc_msgSend(v20, "hmErrorWithCode:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v27);
    goto LABEL_10;
  }
  if (a3 >= 2)
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v26 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v83 = v25;
      v84 = 2112;
      v85 = v26;
      v86 = 2112;
      v87 = v23;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Invalid wake type is used '%@' for accessory %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = 3;
    goto LABEL_9;
  }
  -[HMDLowPowerModeProfile connectivityInfo](self, "connectivityInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "woWLANInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = -[HMDLowPowerModeProfile newHAPSuspendedAccessoryFromAccessoryConnectivityInfoWithType:](self, "newHAPSuspendedAccessoryFromAccessoryConnectivityInfoWithType:", a3);
  -[HMDAccessoryProfile accessory](self, "accessory");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "home");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "availableBSPsCount");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v31, "unsignedIntegerValue");

  v32 = (void *)MEMORY[0x227676638]();
  v33 = self;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  v75 = v29;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier");
    v66 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v70 = v32;
    v35 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v27, "version"));
    v68 = v33;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v27, "wakePacketType"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v76);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v83 = v72;
    v84 = 2112;
    v85 = v66;
    v86 = 2112;
    v87 = v35;
    v88 = 2112;
    v89 = v36;
    v90 = 2112;
    v91 = v37;
    v92 = 2112;
    v93 = v38;
    _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Waking suspended accessory: %@, wakeType: %@, version: %@, wakePacketType: %@, numBSP: %@", buf, 0x3Eu);

    v29 = v75;
    v33 = v68;

    v32 = v70;
  }

  objc_autoreleasePoolPop(v32);
  v73 = v13;
  v39 = v13;
  objc_msgSend(v29, "uuid");

  v40 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v41 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v27, "version"));
  v42 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v27, "wakePacketType"));
  v43 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v76);

  -[HMDLowPowerModeProfile hapAccessory](v33, "hapAccessory");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLowPowerModeProfile hapAccessory](v33, "hapAccessory");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "identifier");
  v46 = v29;
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "matchingHAPAccessoryWithServerIdentifier:linkType:", v47, 1);
  v48 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();

  v71 = v48;
  -[HMDLowPowerModeProfile server](v48, "server");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v49, "wakeNumber"))
  {
    v50 = v39;
    objc_msgSend(v46, "uuid");

    v51 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v52 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v76);

    v53 = v74;
    v54 = (void *)MEMORY[0x227676638](objc_msgSend(v49, "setSuspendedAccessory:", v74));
    v55 = v33;
    HMFGetOSLogHandle();
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = v71;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "identifier");
      v69 = v49;
      v58 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v76);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v83 = v67;
      v84 = 2112;
      v85 = v58;
      v86 = 2112;
      v87 = v71;
      v88 = 2112;
      v89 = v74;
      v90 = 2112;
      v91 = v59;
      v92 = 2112;
      v93 = v60;
      _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_INFO, "%{public}@Found accessory server for %@. Returning the HAPAccessory: %@. Wake will be via suspended accessory: %@, wakeType: %@, numBSP: %@", buf, 0x3Eu);

      v49 = v69;
      v53 = v74;

    }
    objc_autoreleasePoolPop(v54);
    ((void (**)(id, HMDLowPowerModeProfile *, void *))v7)[2](v7, v71, 0);
    v13 = v73;
  }
  else
  {
    v53 = v74;
    -[HMDLowPowerModeProfile setSuspendedAccessory:](v33, "setSuspendedAccessory:", v74);
    -[HMDLowPowerModeProfile hapAccessory](v33, "hapAccessory");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "home");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "accessoryBrowser");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDLowPowerModeProfile hapAccessory](v33, "hapAccessory");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "identifier");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = MEMORY[0x24BDAC760];
    v77[1] = 3221225472;
    v77[2] = __68__HMDLowPowerModeProfile_wakeSuspendedAccessoryWithType_completion___block_invoke;
    v77[3] = &unk_24E781618;
    v78 = v74;
    v79 = v33;
    v80 = v39;
    v81 = v7;
    objc_msgSend(v63, "currentlyFoundHAPAccessoryServerWithIdentifier:linkType:completion:", v65, 1, v77);

    v57 = v71;
    v13 = v73;
  }

LABEL_10:
}

- (void)_wakeSuspendedAccessory:(id)a3 activity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  id v23;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_initWeak(&location, self);
  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__HMDLowPowerModeProfile__wakeSuspendedAccessory_activity_completion___block_invoke;
  aBlock[3] = &unk_24E799B20;
  objc_copyWeak(&v23, &location);
  v13 = v8;
  v21 = v13;
  v14 = v10;
  v22 = v14;
  v15 = _Block_copy(aBlock);
  -[HMDLowPowerModeProfile setPendingWakeBlock:](self, "setPendingWakeBlock:", v15);
  objc_msgSend(v9, "markWithReason:", CFSTR("Waking Suspended Accessory"));
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __70__HMDLowPowerModeProfile__wakeSuspendedAccessory_activity_completion___block_invoke_42;
  v17[3] = &unk_24E797698;
  objc_copyWeak(&v19, &location);
  v16 = v15;
  v18 = v16;
  objc_msgSend(v13, "wakeWithCompletion:", v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)_runStateMachine
{
  NSObject *v3;
  void *v4;
  HMDLowPowerModeProfile *v5;
  NSObject *v6;
  void *v7;
  HMDLowPowerModeProfile *v8;
  HMDLowPowerModeProfile *v9;
  uint64_t v10;
  void *v11;
  HMDLowPowerModeProfile *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDLowPowerModeProfile *v16;
  NSObject *v17;
  void *v18;
  HMDLowPowerModeProfile *v19;
  int v20;
  void *v21;
  __int16 v22;
  HMDLowPowerModeProfile *v23;
  __int16 v24;
  HMDLowPowerModeProfile *v25;
  __int16 v26;
  HMDLowPowerModeProfile *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HMDLowPowerModeStateMachineDescription(v5->_internalOldState);
    v8 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
    HMDLowPowerModeStateMachineDescription(v5->_internalState);
    v9 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@LPM running state: '%@' -> '%@' for %@", (uint8_t *)&v20, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  if (v5->_internalState)
  {
    v10 = -[HMDLowPowerModeProfile _shouldManageAccessoryLPM](v5, "_shouldManageAccessoryLPM");
    if ((v10 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = v5;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v14;
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Skipping processing state machine update since a resident is present for %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v10 = -[HMDLowPowerModeProfile _enterState:](v12, "_enterState:", 0);
    }
    switch(v5->_internalState)
    {
      case 0uLL:
        goto LABEL_9;
      case 1uLL:
        -[HMDLowPowerModeProfile _stateMachine_readAccessoryConfiguration](v5, "_stateMachine_readAccessoryConfiguration");
        break;
      case 2uLL:
        -[HMDLowPowerModeProfile _stateMachine_configureAccessory](v5, "_stateMachine_configureAccessory");
        break;
      case 3uLL:
        -[HMDLowPowerModeProfile _stateMachine_unconfigureAccessory](v5, "_stateMachine_unconfigureAccessory");
        break;
      case 4uLL:
        -[HMDLowPowerModeProfile _stateMachine_backoffOperation](v5, "_stateMachine_backoffOperation");
        break;
      default:
        v15 = (void *)MEMORY[0x227676638](v10);
        v16 = v5;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5->_internalState);
          v19 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
          v20 = 138543874;
          v21 = v18;
          v22 = 2112;
          v23 = v19;
          v24 = 2112;
          v25 = v16;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Invalid LPM state: %@ for %@", (uint8_t *)&v20, 0x20u);

        }
        objc_autoreleasePoolPop(v15);
        break;
    }
  }
  else
  {
LABEL_9:
    -[HMDLowPowerModeProfile _stateMachine_Idle](v5, "_stateMachine_Idle");
  }
}

- (void)_resetStateMachine
{
  self->_internalState = 0;
  self->_internalOldState = 0;
  self->_retryCount = 0;
}

- (BOOL)_canEnterNewState:(unint64_t)a3
{
  NSObject *v5;
  unsigned int v6;
  _BOOL4 v7;

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  switch(self->_internalState)
  {
    case 0uLL:
      if (a3 < 2)
        goto LABEL_12;
      goto LABEL_13;
    case 1uLL:
      if (a3 >= 5)
        goto LABEL_13;
      v6 = 29;
      goto LABEL_10;
    case 2uLL:
      if (a3 >= 5)
        goto LABEL_13;
      LOBYTE(v7) = (a3 & 1) == 0;
      return v7;
    case 3uLL:
      if (a3 >= 5)
        goto LABEL_13;
      v6 = 25;
LABEL_10:
      v7 = (v6 >> a3) & 1;
      break;
    case 4uLL:
      if (a3 - 1 >= 3)
        goto LABEL_13;
LABEL_12:
      LOBYTE(v7) = 1;
      break;
    default:
LABEL_13:
      LOBYTE(v7) = 0;
      break;
  }
  return v7;
}

- (void)enterState:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__HMDLowPowerModeProfile_enterState___block_invoke;
  v6[3] = &unk_24E797C10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)_enterState:(unint64_t)a3
{
  NSObject *v5;
  unint64_t internalState;
  void *v7;
  void *v8;
  void *v9;
  unint64_t retryCount;
  void *v11;
  HMDLowPowerModeProfile *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDLowPowerModeProfile *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  HMDLowPowerModeProfile *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDLowPowerModeProfile _canEnterNewState:](self, "_canEnterNewState:", a3))
  {
    if (a3 == 4 || (internalState = self->_internalState, internalState == a3))
    {
      ++self->_retryCount;
      internalState = self->_internalState;
    }
    self->_internalOldState = internalState;
    self->_internalState = a3;
    if (self->_internalOldState == 4)
      self->_internalOldState = 0;
    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceForKey:", CFSTR("lowPowerModeRetryCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    retryCount = self->_retryCount;
    if (retryCount > objc_msgSend(v9, "unsignedIntegerValue"))
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_retryCount - 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HMDLowPowerModeStateMachineDescription(a3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138544130;
        v24 = v14;
        v25 = 2112;
        v26 = v15;
        v27 = 2112;
        v28 = v16;
        v29 = 2112;
        v30 = v12;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Resetting state machine. Tried '%@' times for operation: '%@' for %@", (uint8_t *)&v23, 0x2Au);

      }
      objc_autoreleasePoolPop(v11);
      self->_retryCount = 0;
      -[HMDLowPowerModeProfile _resetStateMachine](v12, "_resetStateMachine");
    }
    -[HMDLowPowerModeProfile _runStateMachine](self, "_runStateMachine");

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
      HMDLowPowerModeStateMachineDescription(v18->_internalState);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      HMDLowPowerModeStateMachineDescription(a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v20;
      v25 = 2112;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Invalid machine state: %@ -> %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }
}

- (void)_stateMachine_backoffOperation
{
  NSObject *v3;

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDLowPowerModeProfile _startTimerForType:](self, "_startTimerForType:", 1);
}

- (void)_stateMachine_Idle
{
  NSObject *v3;

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDLowPowerModeProfile _stopBackoffTimerForType:](self, "_stopBackoffTimerForType:", 1);
}

- (void)_stateMachine_readAccessoryConfiguration
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__HMDLowPowerModeProfile__stateMachine_readAccessoryConfiguration__block_invoke;
  v4[3] = &unk_24E781640;
  objc_copyWeak(&v5, &location);
  -[HMDLowPowerModeProfile _readAccessorySelectedConfigWithCompletion:](self, "_readAccessorySelectedConfigWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_stateMachine_configureAccessory
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__HMDLowPowerModeProfile__stateMachine_configureAccessory__block_invoke;
  v4[3] = &unk_24E781668;
  objc_copyWeak(&v5, &location);
  -[HMDLowPowerModeProfile _configureAccessoryWithCompletion:](self, "_configureAccessoryWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_stateMachine_unconfigureAccessory
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__HMDLowPowerModeProfile__stateMachine_unconfigureAccessory__block_invoke;
  v4[3] = &unk_24E781640;
  objc_copyWeak(&v5, &location);
  -[HMDLowPowerModeProfile _unconfigureAccessoryWithCompletion:](self, "_unconfigureAccessoryWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_readAccessorySelectedConfigWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__HMDLowPowerModeProfile__readAccessorySelectedConfigWithCompletion___block_invoke;
  v7[3] = &unk_24E781690;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[HMDLowPowerModeProfile _queryAccessoryWithOperation:completion:](self, "_queryAccessoryWithOperation:completion:", 1, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_configureAccessoryWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  -[HMDLowPowerModeProfile supportedSleepConfigurationCharacteristic](self, "supportedSleepConfigurationCharacteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__HMDLowPowerModeProfile__configureAccessoryWithCompletion___block_invoke;
  v8[3] = &unk_24E7816E0;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  -[HMDLowPowerModeProfile _readFromCharacteristic:completion:](self, "_readFromCharacteristic:completion:", v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_unconfigureAccessoryWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__HMDLowPowerModeProfile__unconfigureAccessoryWithCompletion___block_invoke;
  v7[3] = &unk_24E781708;
  v8 = v4;
  v6 = v4;
  -[HMDLowPowerModeProfile _queryAccessoryWithOperation:completion:](self, "_queryAccessoryWithOperation:completion:", 3, v7);

}

- (void)_queryAccessoryWithOperation:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, id, _QWORD);
  NSObject *v7;
  HMDSelectedSleepConfigurationTLV *v8;
  HMDSelectedSleepConfigurationTLV *v9;
  HMDSleepConfigurationOperationTypeWrapper *v10;
  void *v11;
  HMDSelectedSleepConfigurationTLV *v12;
  id v13;
  HMDLowPowerModeProfile *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDLowPowerModeProfile *v21;
  NSObject *v22;
  void *v23;
  HMDSelectedSleepConfigurationTLV *v24;
  void *v25;
  HMDLowPowerModeProfile *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  HMDSelectedSleepConfigurationTLV *v30;
  void *v31;
  HMDLowPowerModeProfile *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDSelectedSleepConfigurationTLV *v36;
  void *v37;
  HMDLowPowerModeProfile *v38;
  void *v39;
  _QWORD aBlock[4];
  void (**v41)(id, id, _QWORD);
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  HMDSelectedSleepConfigurationTLV *v46;
  __int16 v47;
  HMDLowPowerModeProfile *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, id, _QWORD))a4;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if ((unint64_t)(a3 - 1) >= 3)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      HMDLowPowerModeOperationTypeDescription(a3);
      v24 = (HMDSelectedSleepConfigurationTLV *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v23;
      v45 = 2112;
      v46 = v24;
      v47 = 2112;
      v48 = v21;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Received invalid operation type: '%@' for %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v12 = (HMDSelectedSleepConfigurationTLV *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12, 0);
    goto LABEL_22;
  }
  v8 = objc_alloc_init(HMDSelectedSleepConfigurationTLV);
  if (v8)
  {
    v9 = v8;
    v10 = -[HMDSleepConfigurationOperationTypeWrapper initWithValue:]([HMDSleepConfigurationOperationTypeWrapper alloc], "initWithValue:", a3);
    -[HMDSelectedSleepConfigurationTLV setOperationType:](v9, "setOperationType:", v10);

    -[HMDLowPowerModeProfile selectedSleepConfigurationCharacteristic](self, "selectedSleepConfigurationCharacteristic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    if (-[HMDSelectedSleepConfigurationTLV conformsToProtocol:](v12, "conformsToProtocol:", &unk_2557A2E18))
    {
      v42 = 0;
      -[HMDSelectedSleepConfigurationTLV serializeWithError:](v12, "serializeWithError:", &v42);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (HMDLowPowerModeProfile *)v42;
      if (v14 || !v13)
      {
        v15 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = v11;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v44 = v18;
          v45 = 2112;
          v46 = v12;
          v47 = 2112;
          v48 = v14;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize object: %@ with error: %@", buf, 0x20u);

          v11 = v17;
        }

        objc_autoreleasePoolPop(v15);
        v19 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      v13 = 0;
    }
    v13 = v13;
    v19 = v13;
LABEL_14:

    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v19)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        HMDLowPowerModeOperationTypeDescription(a3);
        v30 = (HMDSelectedSleepConfigurationTLV *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryProfile accessory](v26, "accessory");
        v39 = v11;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "identifier");
        v32 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v29;
        v45 = 2112;
        v46 = v30;
        v47 = 2112;
        v48 = v32;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Requesting response to operation type: '%@' from accessory: %@", buf, 0x20u);

        v11 = v39;
      }

      objc_autoreleasePoolPop(v25);
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__HMDLowPowerModeProfile__queryAccessoryWithOperation_completion___block_invoke;
      aBlock[3] = &unk_24E781730;
      v41 = v6;
      v33 = _Block_copy(aBlock);
      -[HMDLowPowerModeProfile _writeToCharacteristic:value:completion:](v26, "_writeToCharacteristic:value:completion:", v11, v19, v33);

      v34 = v41;
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "instanceID");
        v36 = (HMDSelectedSleepConfigurationTLV *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "type");
        v37 = v11;
        v38 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v35;
        v45 = 2112;
        v46 = v36;
        v47 = 2112;
        v48 = v38;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize selected sleep configuration value for charactersitic %@/%@", buf, 0x20u);

        v11 = v37;
      }

      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v34, 0);
    }

LABEL_22:
  }

}

- (void)_processSupportedSleepConfigurationParametersWithCharacteristic:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDLowPowerModeProfile *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  HMDLowPowerModeProfile *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDLowPowerModeProfile *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  HMDLowPowerModeProfile *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDLowPowerModeProfile _shouldManageAccessoryLPM](self, "_shouldManageAccessoryLPM"))
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    v9 = (objc_class *)objc_opt_class();
    deserializeObject(v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v15;
        v23 = 2112;
        v24 = v12;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Processing supported sleep configuration for %@.", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      if (!-[HMDLowPowerModeProfile internalState](v12, "internalState"))
        -[HMDLowPowerModeProfile _enterState:](v12, "_enterState:", 1);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v20;
        v23 = 2112;
        v24 = v8;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse supported sleep configuration with data: %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Skipping processing characteristic update since a resident is present for %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)_processSelectedSleepConfigurationParametersWithCharacteristic:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  HMDLowPowerModeProfile *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDLowPowerModeProfile *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  HMDLowPowerModeProfile *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (objc_class *)objc_opt_class();
  deserializeObject(v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "operationStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "value");

    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HMDLowPowerModeOperationStatusDescription(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543874;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v15;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Processing selected sleep configuration with status: '%@' for %@", (uint8_t *)&v24, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    if (v13 <= 2)
    {
      -[HMDLowPowerModeProfile delegate](v15, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v19, "profile:didUpdateAccessoryState:", v15, v13);

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
      v24 = 138543618;
      v25 = v23;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse selected sleep configuration with data: %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (void)_writeToCharacteristic:(id)a3 value:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v8, v10, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDLowPowerModeProfile hapAccessory](self, "hapAccessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __66__HMDLowPowerModeProfile__writeToCharacteristic_value_completion___block_invoke;
  v18[3] = &unk_24E798148;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v13, "writeCharacteristicValues:source:queue:completionHandler:", v14, 7, v15, v18);

}

- (void)_readFromCharacteristic:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLowPowerModeProfile hapAccessory](self, "hapAccessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__HMDLowPowerModeProfile__readFromCharacteristic_completion___block_invoke;
  v15[3] = &unk_24E798148;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v10, "readCharacteristicValues:source:queue:completionHandler:", v11, 7, v12, v15);

}

- (void)_readInitialRequiredCharacteristics
{
  NSObject *v3;
  void *v4;
  id v5;

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDLowPowerModeProfile supportedSleepConfigurationCharacteristic](self, "supportedSleepConfigurationCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[HMDLowPowerModeProfile _processSupportedSleepConfigurationParametersWithCharacteristic:](self, "_processSupportedSleepConfigurationParametersWithCharacteristic:", v5);
  -[HMDLowPowerModeProfile selectedSleepConfigurationCharacteristic](self, "selectedSleepConfigurationCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[HMDLowPowerModeProfile _processSelectedSleepConfigurationParametersWithCharacteristic:](self, "_processSelectedSleepConfigurationParametersWithCharacteristic:", v4);
  -[HMDLowPowerModeProfile _updateCharacteristicsNotifications:](self, "_updateCharacteristicsNotifications:", 1);

}

- (void)_updateCharacteristicsNotifications:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x24BDAC8D0];
  -[HMDLowPowerModeProfile selectedSleepConfigurationCharacteristic](self, "selectedSleepConfigurationCharacteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDLowPowerModeProfile hapAccessory](self, "hapAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLowPowerModeProfile clientIdentifier](self, "clientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", v3, v7, v8);

  }
}

- (BOOL)_shouldManageAccessoryLPM
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "residentDeviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryResidentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (__51__HMDLowPowerModeProfile__shouldManageAccessoryLPM__block_invoke(v5))
  {
    v6 = objc_msgSend(v5, "isCurrentDevice");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "residentDeviceManager", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "residentDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (__51__HMDLowPowerModeProfile__shouldManageAccessoryLPM__block_invoke(v13))
          {
            v6 = objc_msgSend(v13, "isCurrentDevice");
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }
    v6 = 1;
LABEL_13:

  }
  return v6;
}

- (void)handleAccessoryCharacteristicsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDLowPowerModeProfile *v9;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMDLowPowerModeProfile_handleAccessoryCharacteristicsChanged___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAccessoryConfigurationChanged:(id)a3
{
  id v4;
  void *v5;
  HMDLowPowerModeProfile *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD *v14;
  void *v15;
  int v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  HMDLowPowerModeProfile *v24;
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
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling notification: %@ received by %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("HMDAccessoryConnectedNotification"));

  if (v11)
  {
    -[HMDAccessoryProfile workQueue](v6, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __62__HMDLowPowerModeProfile_handleAccessoryConfigurationChanged___block_invoke;
    v18[3] = &unk_24E79C240;
    v18[4] = v6;
    v14 = v18;
LABEL_7:
    dispatch_async(v12, v14);

    goto LABEL_8;
  }
  objc_msgSend(v4, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("HMDAccessoryDisconnectedNotification"));

  if (v16)
  {
    -[HMDAccessoryProfile workQueue](v6, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __62__HMDLowPowerModeProfile_handleAccessoryConfigurationChanged___block_invoke_2;
    v17[3] = &unk_24E79C240;
    v17[4] = v6;
    v14 = v17;
    goto LABEL_7;
  }
LABEL_8:

}

- (id)hapAccessory
{
  void *v2;
  void *v3;
  id v4;

  -[HMDAccessoryProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)connectivityInfo
{
  void *v2;
  void *v3;

  -[HMDLowPowerModeProfile hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectivityInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)powerManagementService
{
  return -[HMDAccessoryProfile findServiceWithType:](self, "findServiceWithType:", CFSTR("00000221-0000-1000-8000-0026BB765291"));
}

- (id)selectedSleepConfigurationCharacteristic
{
  void *v2;
  void *v3;

  -[HMDLowPowerModeProfile powerManagementService](self, "powerManagementService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("00000252-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)supportedSleepConfigurationCharacteristic
{
  void *v2;
  void *v3;

  -[HMDLowPowerModeProfile powerManagementService](self, "powerManagementService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("00000251-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)suspendedState
{
  void *v2;
  unint64_t v3;

  -[HMDLowPowerModeProfile hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suspendedState");

  return v3;
}

- (id)newHAPSuspendedAccessoryFromAccessoryConnectivityInfoWithType:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDLowPowerModeProfile *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = self;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[HMDLowPowerModeProfile connectivityInfo](self, "connectivityInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "woWLANInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (a3 != 2 || objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "wakeType") == 2)
        {
          v12 = objc_alloc(MEMORY[0x24BE1B9E8]);
          v13 = objc_msgSend(v11, "wakePort");
          objc_msgSend(v11, "wakeAddressString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "wakePattern");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v12, "initWithPort:wakeAddress:wakePattern:", v13, v14, v15);

          if (v16)
            objc_msgSend(v26, "addObject:", v16);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v26, "count"))
  {
    v17 = objc_alloc(MEMORY[0x24BE1BC00]);
    -[HMDLowPowerModeProfile hapAccessory](v25, "hapAccessory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLowPowerModeProfile hapAccessory](v25, "hapAccessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryProfile workQueue](v25, "workQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v17, "initWithName:identifier:wakeTuples:queue:", v19, v21, v26, v22);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HMDAccessoryProfile accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLowPowerModeProfile suspendedState](self, "suspendedState");
  HAPAccessorySuspendedStateDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLowPowerModeStateMachineDescription(-[HMDLowPowerModeProfile internalState](self, "internalState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<LPM ID: %@/%@, Suspended State: '%@', Internal State: '%@'>"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)_startTimerForType:(unint64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  HMDLowPowerModeProfile *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  HMDLowPowerModeProfile *v18;
  int v19;
  void *v20;
  __int16 v21;
  HMDLowPowerModeProfile *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (a3 == 1)
  {
    v6 = CFSTR("lowPowerModeRetryInterval");
  }
  else
  {
    if (a3 != 2)
      return;
    v6 = CFSTR("lowPowerModeWaitForWakeInterval");
  }
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 1, v10);
    objc_msgSend(v11, "setDelegate:", self);
    -[HMDAccessoryProfile workQueue](self, "workQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegateQueue:", v12);

    if (a3 == 2)
    {
      v13 = (void *)MEMORY[0x227676638](-[HMDLowPowerModeProfile setWaitForWakeTimer:](self, "setWaitForWakeTimer:", v11));
      v18 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v16;
        v21 = 2112;
        v22 = v18;
        v17 = "%{public}@Starting wait for wake timer for %@";
        goto LABEL_11;
      }
    }
    else
    {
      v13 = (void *)MEMORY[0x227676638](-[HMDLowPowerModeProfile setBackoffTimer:](self, "setBackoffTimer:", v11));
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v16;
        v21 = 2112;
        v22 = v14;
        v17 = "%{public}@Starting backoff timer for %@";
LABEL_11:
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v19, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v13);
    objc_msgSend(v11, "resume");

  }
}

- (void)_stopBackoffTimerForType:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  HMDLowPowerModeProfile *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDLowPowerModeProfile *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  HMDLowPowerModeProfile *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (a3 == 2)
  {
    -[HMDLowPowerModeProfile waitForWakeTimer](self, "waitForWakeTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v16;
        v20 = 2112;
        v21 = v14;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Stopping wait for wake timer for %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      -[HMDLowPowerModeProfile waitForWakeTimer](v14, "waitForWakeTimer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "suspend");

      -[HMDLowPowerModeProfile setWaitForWakeTimer:](v14, "setWaitForWakeTimer:", 0);
    }
  }
  else if (a3 == 1)
  {
    -[HMDLowPowerModeProfile backoffTimer](self, "backoffTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v10;
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Stopping backoff timer for %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDLowPowerModeProfile backoffTimer](v8, "backoffTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "suspend");

      -[HMDLowPowerModeProfile setBackoffTimer:](v8, "setBackoffTimer:", 0);
    }
  }
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HMDLowPowerModeProfile *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  HMDLowPowerModeProfile *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDLowPowerModeProfile backoffTimer](self, "backoffTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v11 = -[HMDLowPowerModeProfile _stopBackoffTimerForType:](self, "_stopBackoffTimerForType:", 1);
    if (self->_internalState == 4)
    {
      v12 = (void *)MEMORY[0x227676638](v11);
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HMDLowPowerModeStateMachineDescription(v13->_internalOldState);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543874;
        v18 = v15;
        v19 = 2112;
        v20 = v16;
        v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Resuming a backed-off state: %@ for %@", (uint8_t *)&v17, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDLowPowerModeProfile _enterState:](v13, "_enterState:", v13->_internalOldState);
    }
  }
  else
  {
    -[HMDLowPowerModeProfile waitForWakeTimer](self, "waitForWakeTimer");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      -[HMDLowPowerModeProfile _stopBackoffTimerForType:](self, "_stopBackoffTimerForType:", 2);
      -[HMDLowPowerModeProfile pendingWakeBlock](self, "pendingWakeBlock");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[HMDLowPowerModeProfile suspendedAccessory](self, "suspendedAccessory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 24);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v8)[2](v8, v10);

        }
      }
      -[HMDLowPowerModeProfile setPendingWakeBlock:](self, "setPendingWakeBlock:", 0);

    }
  }

}

- (id)pendingWakeBlock
{
  return self->_pendingWakeBlock;
}

- (void)setPendingWakeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (unint64_t)internalState
{
  return self->_internalState;
}

- (void)setInternalState:(unint64_t)a3
{
  self->_internalState = a3;
}

- (unint64_t)internalOldState
{
  return self->_internalOldState;
}

- (void)setInternalOldState:(unint64_t)a3
{
  self->_internalOldState = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (HMFTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setBackoffTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backoffTimer, a3);
}

- (HMDLowPowerModeProfileDelegate)delegate
{
  return (HMDLowPowerModeProfileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HAPSuspendedAccessory)suspendedAccessory
{
  return self->_suspendedAccessory;
}

- (void)setSuspendedAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_suspendedAccessory, a3);
}

- (HMFTimer)waitForWakeTimer
{
  return self->_waitForWakeTimer;
}

- (void)setWaitForWakeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_waitForWakeTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForWakeTimer, 0);
  objc_storeStrong((id *)&self->_suspendedAccessory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong(&self->_pendingWakeBlock, 0);
}

uint64_t __62__HMDLowPowerModeProfile_handleAccessoryConfigurationChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readInitialRequiredCharacteristics");
}

void __62__HMDLowPowerModeProfile_handleAccessoryConfigurationChanged___block_invoke_2(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "suspendedState") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "profile:didUpdateAccessoryState:", *(_QWORD *)(a1 + 32), 3);

  }
}

void __64__HMDLowPowerModeProfile_handleAccessoryCharacteristicsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  findMatchingCharacteristic(CFSTR("00000251-0000-1000-8000-0026BB765291"), v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "_processSupportedSleepConfigurationParametersWithCharacteristic:", v3);
  findMatchingCharacteristic(CFSTR("00000252-0000-1000-8000-0026BB765291"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "_processSelectedSleepConfigurationParametersWithCharacteristic:", v4);

}

uint64_t __51__HMDLowPowerModeProfile__shouldManageAccessoryLPM__block_invoke(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "isReachable") && objc_msgSend(v1, "isEnabled"))
  {
    objc_msgSend(v1, "capabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "supportsWakeOnLAN");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __61__HMDLowPowerModeProfile__readFromCharacteristic_completion___block_invoke(uint64_t a1, void *a2)
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
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "instanceID");
      v16 = v3;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "type");
      v17 = v9;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Reading from characteristic: %@/%@ failed with error: %@", buf, 0x2Au);

      v9 = v17;
      v3 = v16;

    }
    objc_autoreleasePoolPop(v9);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __66__HMDLowPowerModeProfile__writeToCharacteristic_value_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "instanceID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "type");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138544130;
        v17 = v11;
        v18 = 2112;
        v19 = v12;
        v20 = 2112;
        v21 = v13;
        v22 = 2112;
        v23 = v5;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Writing to the characteristic: %@/%@ failed with error: %@", (uint8_t *)&v16, 0x2Au);

      }
      objc_autoreleasePoolPop(v8);
    }
    else
    {
      objc_msgSend(v3, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "value");
      v15 = objc_claimAutoreleasedReturnValue();

      v5 = 0;
      v7 = (void *)v15;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __66__HMDLowPowerModeProfile__queryAccessoryWithOperation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  deserializeObject(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __62__HMDLowPowerModeProfile__unconfigureAccessoryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 32), a2, 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    objc_msgSend(a3, "operationStatus");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, objc_msgSend(v4, "value"));

  }
}

void __60__HMDLowPowerModeProfile__configureAccessoryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *context;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = (objc_class *)objc_opt_class();
    deserializeObject(v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      HMDLowPowerModeWoWLANInfoForSupportedSleepConfiguration(v9);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = objc_msgSend(v11, "version") > 1;
        context = (void *)MEMORY[0x227676638]();
        v14 = WeakRetained;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v13)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = (void *)MEMORY[0x24BDD16E0];
            v19 = objc_msgSend(v12, "version");
            v20 = v18;
            v21 = (void *)v17;
            objc_msgSend(v20, "numberWithUnsignedChar:", v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v43 = v21;
            v44 = 2112;
            v45 = v22;
            v46 = 2112;
            v47 = &unk_24E96B198;
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Accessory's supported LPM version: %@ is greater than the current version: %@.", buf, 0x20u);

          }
          objc_autoreleasePoolPop(context);
          v23 = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, _QWORD, uint64_t))(v23 + 16))(v23, v24, 0, 0x7FFFFFFFFFFFFFFFLL);

        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "connectivityInfo");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "woWLANInfos");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v43 = v34;
            v44 = 2112;
            v45 = v33;
            v46 = 2112;
            v47 = v37;
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Attempting to update WoWLANInfo: '%@' -> '%@'", buf, 0x20u);

          }
          objc_autoreleasePoolPop(context);
          v38[0] = MEMORY[0x24BDAC760];
          v38[1] = 3221225472;
          v38[2] = __60__HMDLowPowerModeProfile__configureAccessoryWithCompletion___block_invoke_53;
          v38[3] = &unk_24E7816B8;
          objc_copyWeak(&v41, (id *)(a1 + 40));
          v40 = *(id *)(a1 + 32);
          v39 = v37;
          objc_msgSend(v14, "_queryAccessoryWithOperation:completion:", 2, v38);

          objc_destroyWeak(&v41);
        }
      }
      else
      {
        v27 = (void *)MEMORY[0x227676638]();
        v28 = WeakRetained;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v30;
          v44 = 2112;
          v45 = v10;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to create WoWLANInfo from supported sleep config: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
        v31 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD, uint64_t))(v31 + 16))(v31, v32, 0, 0x7FFFFFFFFFFFFFFFLL);

      }
    }
    else
    {
      v25 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD, uint64_t))(v25 + 16))(v25, v26, 0, 0x7FFFFFFFFFFFFFFFLL);

    }
  }

}

void __60__HMDLowPowerModeProfile__configureAccessoryWithCompletion___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v9 = a1 + 32;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v9 + 8);
    if (v11)
    {
      (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v11, v7, 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      objc_msgSend(v5, "operationStatus");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 16))(v8, 0, v7, objc_msgSend(v10, "value"));

    }
  }

}

void __69__HMDLowPowerModeProfile__readAccessorySelectedConfigWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v9, 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      objc_msgSend(v5, "operationStatus");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 16))(v7, 0, objc_msgSend(v8, "value"));

    }
  }

}

void __60__HMDLowPowerModeProfile__stateMachine_unconfigureAccessory__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _BYTE v25[24];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMDLowPowerModeOperationStatusDescription(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v25 = 138544130;
      *(_QWORD *)&v25[4] = v10;
      *(_WORD *)&v25[12] = 2112;
      *(_QWORD *)&v25[14] = v8;
      *(_WORD *)&v25[22] = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Did unconfigure %@ with status: '%@' and error: %@", v25, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v8, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      if (a3 == 3)
      {
        v13 = (void *)MEMORY[0x227676638]();
        v14 = v8;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
LABEL_14:
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v14, "retryCount"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v25 = 138543874;
          *(_QWORD *)&v25[4] = v16;
          *(_WORD *)&v25[12] = 2112;
          *(_QWORD *)&v25[14] = v14;
          *(_WORD *)&v25[22] = 2112;
          v26 = v17;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Need to backoff and retry unconfiguring of %@. Retry count: %@", v25, 0x20u);

        }
LABEL_15:

        objc_autoreleasePoolPop(v13);
        v18 = 4;
LABEL_20:
        objc_msgSend(v8, "enterState:", v18, *(_OWORD *)v25, *(_QWORD *)&v25[16], v26);

        goto LABEL_21;
      }
      if (a3 == 1)
      {
        v13 = (void *)MEMORY[0x227676638]();
        v14 = v8;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          goto LABEL_14;
        goto LABEL_15;
      }
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v8;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        HMDLowPowerModeOperationStatusDescription(a3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        HMDLowPowerModeOperationTypeDescription(2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v25 = 138544130;
        *(_QWORD *)&v25[4] = v22;
        *(_WORD *)&v25[12] = 2112;
        *(_QWORD *)&v25[14] = v23;
        *(_WORD *)&v25[22] = 2112;
        v26 = v24;
        v27 = 2112;
        v28 = v5;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Received invalid status: %@ to operation: %@ with error: %@", v25, 0x2Au);

      }
      objc_autoreleasePoolPop(v19);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v12, "profile:didUpdateWoWLANInfos:", v8, 0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v12, "profile:didUpdateAccessoryState:", v8, 0);
    }
    v18 = 0;
    goto LABEL_20;
  }
LABEL_21:

}

void __58__HMDLowPowerModeProfile__stateMachine_configureAccessory__block_invoke(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = WeakRetained;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMDLowPowerModeOperationStatusDescription(a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v13;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v14;
      v36 = 2112;
      v37 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Did configure %@ with status: '%@' and error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v11, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      if (a4 == 3)
      {
        v16 = 4;
LABEL_19:
        objc_msgSend(v11, "enterState:", v16);

        goto LABEL_20;
      }
      if (a4 != 1)
      {
        v22 = (void *)MEMORY[0x227676638]();
        v23 = v11;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          HMDLowPowerModeOperationStatusDescription(a4);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          HMDLowPowerModeOperationTypeDescription(2);
          v29 = v22;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v31 = v25;
          v32 = 2112;
          v33 = v26;
          v34 = 2112;
          v35 = v27;
          v36 = 2112;
          v37 = v7;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received invalid status: %@ to operation: %@ with error: %@", buf, 0x2Au);

          v22 = v29;
        }

        objc_autoreleasePoolPop(v22);
        v16 = 0;
        goto LABEL_19;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v15, "profile:didUpdateWoWLANInfos:", v11, v8);
      v16 = 0;
    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v11;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v17;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v18, "retryCount"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v20;
        v32 = 2112;
        v33 = v18;
        v34 = 2112;
        v35 = v21;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Need to backoff and retry configuring of %@. Retry count: %@", buf, 0x20u);

        v17 = v28;
      }

      objc_autoreleasePoolPop(v17);
      v16 = 4;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "profile:didUpdateAccessoryState:", v11, a4);
    goto LABEL_19;
  }
LABEL_20:

}

void __66__HMDLowPowerModeProfile__stateMachine_readAccessoryConfiguration__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  id WeakRetained;
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
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMDLowPowerModeOperationStatusDescription(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138544130;
      v39 = v10;
      v40 = 2112;
      v41 = v8;
      v42 = 2112;
      v43 = v11;
      v44 = 2112;
      v45 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Did read configuration of %@ with status: '%@' and error: %@", (uint8_t *)&v38, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
    if (a3 == 3)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v8;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v20, "retryCount"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543874;
        v39 = v22;
        v40 = 2112;
        v41 = v20;
        v42 = 2112;
        v43 = v23;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Need to backoff and retry reading configuration for %@. Retry count: %@", (uint8_t *)&v38, 0x20u);

      }
      objc_autoreleasePoolPop(v19);
      v18 = 4;
    }
    else if (a3 == 1)
    {
      objc_msgSend(v8, "connectivityInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "woWLANInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v18 = 0;
      }
      else
      {
        v32 = (void *)MEMORY[0x227676638]();
        v33 = v8;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "accessory");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138543874;
          v39 = v35;
          v40 = 2112;
          v41 = v37;
          v42 = 2112;
          v43 = 0;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Need to reconfigure the accessory: %@. Accessory has stale WoWLANInfo: %@.", (uint8_t *)&v38, 0x20u);

        }
        objc_autoreleasePoolPop(v32);
        v18 = 2;
      }

    }
    else if (a3)
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = v8;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        HMDLowPowerModeOperationStatusDescription(a3);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        HMDLowPowerModeOperationTypeDescription(2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138544130;
        v39 = v29;
        v40 = 2112;
        v41 = v30;
        v42 = 2112;
        v43 = v31;
        v44 = 2112;
        v45 = v5;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Received invalid status: '%@' to operation: '%@' with error: %@", (uint8_t *)&v38, 0x2Au);

      }
      objc_autoreleasePoolPop(v26);
      v18 = 0;
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = v8;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "accessory");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543618;
        v39 = v15;
        v40 = 2112;
        v41 = v17;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Need to configure the accessory: %@. Accessory is unconfigured.", (uint8_t *)&v38, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v18 = 2;
    }
    objc_msgSend(v8, "enterState:", v18);
  }

}

uint64_t __37__HMDLowPowerModeProfile_enterState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", *(_QWORD *)(a1 + 40));
}

void __70__HMDLowPowerModeProfile__wakeSuspendedAccessory_activity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pendingWakeBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "setSuspendedAccessory:", 0);
      objc_msgSend(v5, "setPendingWakeBlock:", 0);
      v7 = (void *)MEMORY[0x227676638](objc_msgSend(v5, "_stopBackoffTimerForType:", 2));
      v8 = v5;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 32);
        v12 = 138543874;
        v13 = v10;
        v14 = 2112;
        v15 = v3;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Pending wake block was called with error: %@ for %@", (uint8_t *)&v12, 0x20u);

      }
      objc_autoreleasePoolPop(v7);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

void __70__HMDLowPowerModeProfile__wakeSuspendedAccessory_activity_completion___block_invoke_42(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    objc_msgSend(WeakRetained, "_startTimerForType:", 2);

}

void __68__HMDLowPowerModeProfile_wakeSuspendedAccessoryWithType_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int8x16_t v9;
  _QWORD block[4];
  int8x16_t v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (objc_msgSend(v5, "wakeNumber"))
  {
    v14 = 0;
    objc_msgSend(v5, "getBonjourDeviceDNSName:", &v14);
    v6 = v14;
    objc_msgSend(a1[4], "setDnsName:", v6);

  }
  objc_msgSend(a1[5], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDLowPowerModeProfile_wakeSuspendedAccessoryWithType_completion___block_invoke_2;
  block[3] = &unk_24E79B3F0;
  v9 = *((int8x16_t *)a1 + 2);
  v8 = (id)v9.i64[0];
  v11 = vextq_s8(v9, v9, 8uLL);
  v12 = a1[6];
  v13 = a1[7];
  dispatch_async(v7, block);

}

uint64_t __68__HMDLowPowerModeProfile_wakeSuspendedAccessoryWithType_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_wakeSuspendedAccessory:activity:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t46 != -1)
    dispatch_once(&logCategory__hmf_once_t46, &__block_literal_global_68_84915);
  return (id)logCategory__hmf_once_v47;
}

+ (id)WoWLANInfoForSupportedSleepConfiguration:(id)a3
{
  return HMDLowPowerModeWoWLANInfoForSupportedSleepConfiguration(a3);
}

void __37__HMDLowPowerModeProfile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v47;
  logCategory__hmf_once_v47 = v0;

}

@end
