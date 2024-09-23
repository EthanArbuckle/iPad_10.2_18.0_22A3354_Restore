@implementation HMDAppleAccessoryPairingController

- (HMDAppleAccessoryPairingController)initWithHomeManager:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  HMDAppleAccessoryPairingController *v8;
  HMDAppleAccessoryPairingController *v9;
  uint64_t v10;
  NSMutableDictionary *pairingHomes;
  HMDMutableHomeData *v12;
  HMDMutableHomeData *homeData;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDAppleAccessoryPairingController;
  v8 = -[HMDAppleAccessoryPairingController init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_homeManager, v6);
    objc_storeStrong((id *)&v9->_dataSource, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    pairingHomes = v9->_pairingHomes;
    v9->_pairingHomes = (NSMutableDictionary *)v10;

    v12 = objc_alloc_init(HMDMutableHomeData);
    homeData = v9->_homeData;
    v9->_homeData = v12;

  }
  return v9;
}

- (void)start
{
  void *v3;
  void *v4;
  HMDAppleAccessoryPairingController *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  HMDLegacyCloudDatabase *v13;
  void *v14;
  void *v15;
  HMDLegacyCloudDatabase *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[HMDAppleAccessoryPairingController legacyCloudDatabase](self, "legacyCloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Legacy Pairing Controller has already started up.", buf, 0xCu);

    }
  }
  else
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "supportsKeychainSync");

    if ((v9 & 1) != 0)
    {
      v10 = objc_alloc(MEMORY[0x24BDB9038]);
      v11 = (void *)objc_msgSend(v10, "initWithContainerIdentifier:environment:", CFSTR("com.apple.willow.config"), cloudKitContainerEnvironment);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4ECE8]), "initWithContainerID:", v11);
      objc_msgSend(v12, "setSubscriptionPushRegistrationAction:", 1);
      v13 = [HMDLegacyCloudDatabase alloc];
      +[HMDDatabase defaultDatabase](HMDDatabase, "defaultDatabase");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localDatabase");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HMDLegacyCloudDatabase initWithLocalDatabase:configuration:](v13, "initWithLocalDatabase:configuration:", v15, v12);
      -[HMDAppleAccessoryPairingController setLegacyCloudDatabase:](self, "setLegacyCloudDatabase:", v16);

      -[HMDAppleAccessoryPairingController legacyCloudDatabase](self, "legacyCloudDatabase");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v17, "registerPrivateSubscriptionForExternalRecordType:", 0);

      -[HMDAppleAccessoryPairingController legacyCloudDatabase](self, "legacyCloudDatabase");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(v19, "registerSharedSubscriptionForExternalRecordType:", 0);

      objc_initWeak((id *)buf, self);
      -[HMDAppleAccessoryPairingController legacyCloudDatabase](self, "legacyCloudDatabase");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "performInitialCloudSync");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __43__HMDAppleAccessoryPairingController_start__block_invoke;
      v25[3] = &unk_24E794410;
      objc_copyWeak(&v26, (id *)buf);
      v23 = (id)objc_msgSend(v22, "addSuccessBlock:", v25);

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);

      return;
    }
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v24;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Device cannot support keychain sync, no way we could pair an Apple accessory.", buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v4);
}

- (BOOL)handleMessage:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDAppleAccessoryPairingController pairingHomes](self, "pairingHomes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  os_unfair_lock_unlock(p_lock);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__HMDAppleAccessoryPairingController_handleMessage_from___block_invoke;
  v15[3] = &unk_24E77B548;
  v12 = v6;
  v16 = v12;
  v13 = v7;
  v17 = v13;
  v18 = &v19;
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);
  LOBYTE(p_lock) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)p_lock;
}

- (BOOL)pairAccessory:(id)a3
{
  void *v4;
  HMDAppleAccessoryPairingController *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  HMDAppleAccessoryPairingController *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  HMDAppleAccessoryPairingHomeController *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  HMDAppleAccessoryPairingController *v41;
  NSObject *v42;
  id v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  HMDAppleAccessoryPairingController *v67;
  NSObject *v68;
  void *v69;
  void *v71;
  HMDAppleAccessoryPairingController *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  HMDAppleAccessoryPairingController *v76;
  NSObject *v77;
  void *v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  HMDAppleAccessoryPairingHomeState *v88;
  id v89;
  void *v90;
  _QWORD v91[4];
  id v92;
  HMDAppleAccessoryPairingController *v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  _QWORD v100[4];
  id v101;
  _BYTE *v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  id v104;
  uint8_t v105[4];
  id v106;
  __int16 v107;
  const __CFString *v108;
  __int16 v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  _BYTE buf[24];
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  HMDAppleAccessoryPairingHomeController *v114;
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v89 = a3;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v89;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Starting legacy pairing for accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAppleAccessoryPairingController legacyCloudDatabase](v5, "legacyCloudDatabase");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    -[HMDAppleAccessoryPairingController homeManagerZone](v5, "homeManagerZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (v9)
    {
      -[HMDAppleAccessoryPairingController dataSource](v5, "dataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hh1ControllerIdentity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = 0;
      objc_msgSend(v90, "createLegacyZone:controllerIdentity:delegate:error:", CFSTR("1411CE6C-B4DE-4622-A49D-F66FE296D6B5"), v17, 0, &v104);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (uint64_t (*)(uint64_t, uint64_t))v104;
      -[HMDAppleAccessoryPairingController setHomeManagerZone:](v5, "setHomeManagerZone:", v18);

      -[HMDAppleAccessoryPairingController homeManagerZone](v5, "homeManagerZone");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = v19 == 0;

      if ((_DWORD)v17)
      {
        v71 = (void *)MEMORY[0x227676638]();
        v72 = v5;
        HMFGetOSLogHandle();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v74;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = CFSTR("1411CE6C-B4DE-4622-A49D-F66FE296D6B5");
          *(_WORD *)&buf[22] = 2112;
          v112 = v10;
          _os_log_impl(&dword_2218F0000, v73, OS_LOG_TYPE_ERROR, "%{public}@Unable to create legacy zone %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v71);
        v15 = 0;
        goto LABEL_45;
      }
      -[HMDAppleAccessoryPairingController homeManagerZone](v5, "homeManagerZone");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startUp");

    }
    else
    {
      v10 = 0;
    }
    -[HMDAppleAccessoryPairingController blobZone](v5, "blobZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 == 0;

    if (v22)
    {
      -[HMDAppleAccessoryPairingController dataSource](v5, "dataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hh1ControllerIdentity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = v10;
      objc_msgSend(v90, "createLegacyZone:controllerIdentity:delegate:error:", CFSTR("HomeDataBlobZone"), v25, 0, &v103);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v103;

      -[HMDAppleAccessoryPairingController setBlobZone:](v5, "setBlobZone:", v26);
      -[HMDAppleAccessoryPairingController blobZone](v5, "blobZone");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v26) = v27 == 0;

      if ((_DWORD)v26)
      {
        v75 = (void *)MEMORY[0x227676638]();
        v76 = v5;
        HMFGetOSLogHandle();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v78;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = CFSTR("1411CE6C-B4DE-4622-A49D-F66FE296D6B5");
          *(_WORD *)&buf[22] = 2112;
          v112 = v23;
          _os_log_impl(&dword_2218F0000, v77, OS_LOG_TYPE_ERROR, "%{public}@Unable to create legacy zone %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v75);
        v15 = 0;
        goto LABEL_44;
      }
      -[HMDAppleAccessoryPairingController blobZone](v5, "blobZone");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "startUp");

    }
    else
    {
      v23 = v10;
    }
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHome zoneIDFromHomeUUID:](HMDHome, "zoneIDFromHomeUUID:", v84);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "UUIDString");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDLegacyCloudDatabase recordZoneIDForLegacyName:](HMDLegacyCloudDatabase, "recordZoneIDForLegacyName:", v86);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_alloc(MEMORY[0x24BE4EC70]);
    objc_msgSend(v90, "containerID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = (void *)objc_msgSend(v29, "initWithContainerID:scope:zoneID:", v30, 2, v82);

    v88 = -[HMDAppleAccessoryPairingHomeState initWithCloudZoneID:accessory:]([HMDAppleAccessoryPairingHomeState alloc], "initWithCloudZoneID:accessory:", v85, v89);
    -[HMDAppleAccessoryPairingController homeManager](v5, "homeManager");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleAccessoryPairingController dataSource](v5, "dataSource");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "updatePairingAccessoryState:", v88);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v112 = __Block_byref_object_copy__44358;
    v113 = __Block_byref_object_dispose__44359;
    v32 = [HMDAppleAccessoryPairingHomeController alloc];
    -[HMDAppleAccessoryPairingController dataSource](v5, "dataSource");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = -[HMDAppleAccessoryPairingHomeController initWithState:homeManager:dataSource:](v32, "initWithState:homeManager:dataSource:", v88, v87, v33);

    os_unfair_lock_lock_with_options();
    -[HMDAppleAccessoryPairingController pairingHomes](v5, "pairingHomes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "allValues");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "copy");

    v100[0] = MEMORY[0x24BDAC760];
    v100[1] = 3221225472;
    v100[2] = __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke;
    v100[3] = &unk_24E77B570;
    v80 = v89;
    v101 = v80;
    v102 = buf;
    v37 = objc_msgSend(v36, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v100);
    v38 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    if (v38)
    {
      -[HMDAppleAccessoryPairingController pairingHomes](v5, "pairingHomes");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v85);

    }
    else
    {
      v40 = (void *)MEMORY[0x227676638](v37);
      v41 = v5;
      HMFGetOSLogHandle();
      v42 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v43 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "uuid");
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v105 = 138543618;
        v106 = v43;
        v107 = 2112;
        v108 = v44;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@A pairing controller for accessory %@ already exists.", v105, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
    }

    os_unfair_lock_unlock(&v5->_lock);
    if (v38)
    {
      -[HMDAppleAccessoryPairingController dataSource](v5, "dataSource");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "hh1ControllerIdentity");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = v23;
      objc_msgSend(v90, "createLegacyZone:controllerIdentity:delegate:error:", v86, v46, 0, &v99);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v99;

      v15 = v47 != 0;
      if (v47)
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "startWithLocalZone:", v47);
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleAccessoryPairingController blobZone](v5, "blobZone");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "mirror");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v51 = v50;
        else
          v51 = 0;
        v52 = v51;

        objc_msgSend(v52, "startUp");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
          objc_msgSend(v48, "addObject:", v53);
        -[HMDAppleAccessoryPairingController homeManagerZone](v5, "homeManagerZone", v79);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "mirror");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v56 = v55;
        else
          v56 = 0;
        v57 = v56;

        objc_msgSend(v57, "startUp");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
          objc_msgSend(v48, "addObject:", v58);
        objc_msgSend(v47, "mirror");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v60 = v59;
        else
          v60 = 0;
        v61 = v60;

        objc_msgSend(v61, "startUp");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62)
          objc_msgSend(v48, "addObject:", v62);
        -[HMDAppleAccessoryPairingController cleanUpBadHomeManagerRecordsForHomeManager:](v5, "cleanUpBadHomeManagerRecordsForHomeManager:", v87);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addObject:", v63);

        objc_msgSend(MEMORY[0x24BE6B608], "chainFutures:", v48);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v91[0] = MEMORY[0x24BDAC760];
        v91[1] = 3221225472;
        v91[2] = __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_17;
        v91[3] = &unk_24E77B598;
        v92 = v80;
        v93 = v5;
        v94 = v87;
        v95 = v84;
        v96 = v81;
        v97 = v83;
        v98 = v47;
        v65 = (id)objc_msgSend(v64, "addSuccessBlock:", v91);

      }
      else
      {
        v66 = (void *)MEMORY[0x227676638]();
        v67 = v5;
        HMFGetOSLogHandle();
        v68 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v105 = 138543874;
          v106 = v69;
          v107 = 2112;
          v108 = CFSTR("1411CE6C-B4DE-4622-A49D-F66FE296D6B5");
          v109 = 2112;
          v110 = v79;
          _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_ERROR, "%{public}@Unable to create legacy zone %@: %@", v105, 0x20u);

        }
        objc_autoreleasePoolPop(v66);
      }

      v23 = v79;
    }
    else
    {
      v15 = 0;
    }
    _Block_object_dispose(buf, 8);

LABEL_44:
    v10 = v23;
LABEL_45:

    goto LABEL_46;
  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = v5;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@HMDAppleAccessoryPairingController has not been started.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  v15 = 0;
LABEL_46:

  return v15;
}

- (id)cleanUpBadHomeManagerRecordsForHomeManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAppleAccessoryPairingController *v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAppleAccessoryPairingController homeManagerZone](self, "homeManagerZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v5, "fetchModelWithModelID:ofType:error:", v6, +[HMDLegacyV4Model hmbModelClassForHMDModelClass:](HMDLegacyV4Model, "hmbModelClassForHMDModelClass:", objc_opt_class()), &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;

  if (!v7)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error fetching existing home manager model for cleanup: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    goto LABEL_7;
  }
  objc_msgSend(v7, "hmbParentModelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "hmf_zeroUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);

  if (v11)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[HMDAppleAccessoryPairingController homeManagerZone](self, "homeManagerZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmbParentModelID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Legacy Pairing Home Manager Record Cleanup"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeModelsWithParentModelID:options:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "flatMap:", &__block_literal_global_44346);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v16;
}

- (void)generateModelChangesForHomeManager:(id)a3 homeName:(id)a4 pairingHomeUUID:(id)a5 defaultRoomUUID:(id)a6 homeZoneUUID:(id)a7 accessory:(id)a8 outBlobChanges:(id *)a9 outLegacyChanges:(id *)a10 outHomeManagerChanges:(id *)a11
{
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDAppleAccessoryPairingController *v23;
  NSObject *v24;
  void *v25;
  HMDHomeManagerModel *v26;
  HMDHomeManagerModel *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDUser *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  HMDHome *v43;
  HMDCloudZoneInformation *v44;
  void *v45;
  HMDCloudZoneInformation *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  HMDCloudZoneInformationModel *v51;
  void *v52;
  HMDCloudZoneInformationModel *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  HMDLegacyV3Model *v68;
  HMDLegacyV0Model *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  HMDHome *v78;
  void *v79;
  HMDCloudZoneInformation *v80;
  HMDCloudZoneInformationModel *v81;
  void *v82;
  HMDHomeManagerModel *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  _QWORD v93[2];
  _QWORD v94[2];
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  id v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v91 = a4;
  v18 = a5;
  v90 = a6;
  v89 = a7;
  v88 = a8;
  -[HMDAppleAccessoryPairingController homeManagerZone](self, "homeManagerZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0;
  objc_msgSend(v19, "fetchModelWithModelID:ofType:error:", v20, +[HMDLegacyV4Model hmbModelClassForHMDModelClass:](HMDLegacyV4Model, "hmbModelClassForHMDModelClass:", objc_opt_class()), &v92);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v92;

  if (!v21)
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v96 = v25;
      v97 = 2112;
      v98 = v87;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Error fetching home manager model: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
  }
  v84 = v21;
  objc_msgSend(v21, "convertToHMDModelObject");
  v26 = (HMDHomeManagerModel *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    v27 = [HMDHomeManagerModel alloc];
    objc_msgSend(v17, "uuid");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "hmf_zeroUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HMDBackingStoreModelObject initWithUUID:parentUUID:](v27, "initWithUUID:parentUUID:", v28, v29);

    -[HMDAppleAccessoryPairingController dataSource](self, "dataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "hh1ControllerIdentity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeManagerModel setControllerKeyIdentifier:](v26, "setControllerKeyIdentifier:", v32);

    objc_msgSend(v18, "UUIDString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeManagerModel setPrimaryHomeUUID:](v26, "setPrimaryHomeUUID:", v33);

  }
  v34 = [HMDUser alloc];
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "account");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "primaryHandle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleAccessoryPairingController dataSource](self, "dataSource");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "hh1ControllerIdentity");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[HMDUser initWithAccountHandle:homeUUID:pairingIdentity:privilege:](v34, "initWithAccountHandle:homeUUID:pairingIdentity:privilege:", v37, v18, v39, 3);
  v41 = v18;
  v42 = (void *)v40;

  v85 = v41;
  v86 = v17;
  v43 = -[HMDHome initWithName:uuid:defaultRoomUUID:owner:homeManager:presenceAuth:]([HMDHome alloc], "initWithName:uuid:defaultRoomUUID:owner:homeManager:presenceAuth:", v91, v41, v90, v42, v17, 0);
  v44 = [HMDCloudZoneInformation alloc];
  objc_msgSend(v42, "pairingUsername");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[HMDCloudZoneInformation initWithOwnerName:uuid:](v44, "initWithOwnerName:uuid:", v45, v89);

  -[HMDCloudZoneInformation setFetchFailed:](v46, "setFetchFailed:", 0);
  -[HMDCloudZoneInformation setFirstFetch:](v46, "setFirstFetch:", 0);
  -[HMDCloudZoneInformation setZoneCreated:](v46, "setZoneCreated:", 1);
  -[HMDHomeManagerModel cloudZoneInformation](v26, "cloudZoneInformation");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCloudZoneInformation cloudZonesWithDictionary:](HMDCloudZoneInformation, "cloudZonesWithDictionary:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = v46;
  objc_msgSend(v48, "addObject:", v46);
  v49 = v48;
  +[HMDCloudZoneInformation cloudZoneInformationWithCloudZones:](HMDCloudZoneInformation, "cloudZoneInformationWithCloudZones:", v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeManagerModel setCloudZoneInformation:](v26, "setCloudZoneInformation:", v50);

  v51 = [HMDCloudZoneInformationModel alloc];
  v83 = v26;
  -[HMDBackingStoreModelObject uuid](v26, "uuid");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[HMDBackingStoreModelObject initWithUUID:parentUUID:](v51, "initWithUUID:parentUUID:", v89, v52);

  v82 = v42;
  objc_msgSend(v42, "pairingUsername");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v53;
  -[HMDCloudZoneInformationModel setOwnerName:](v53, "setOwnerName:", v54);

  -[HMDAppleAccessoryPairingController homeData](self, "homeData");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "homes");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v56, "mutableCopy");
  v58 = v57;
  if (v57)
  {
    v59 = v57;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v59 = (id)objc_claimAutoreleasedReturnValue();
  }
  v60 = v59;

  objc_msgSend(v60, "addObject:", v43);
  -[HMDAppleAccessoryPairingController homeData](self, "homeData");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setHomes:", v60);

  -[HMDAppleAccessoryPairingController homeData](self, "homeData");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v49;
  objc_msgSend(v62, "setCloudZones:", v49);

  -[HMDHome backingStoreObjects:](v43, "backingStoreObjects:", 4);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v63, "mutableCopy");

  objc_msgSend(v88, "addTransactionForHome:", v43);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addObject:", v65);

  -[HMDAppleAccessoryPairingController homeData](self, "homeData");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDPersistentStore serializeHomeData:localStorage:remoteDeviceOnSameAccount:](HMDPersistentStore, "serializeHomeData:localStorage:remoteDeviceOnSameAccount:", v66, 0, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = objc_alloc_init(HMDLegacyV3Model);
  -[HMDLegacyV3Model setCloudBlob:](v68, "setCloudBlob:", v67);
  v69 = objc_alloc_init(HMDLegacyV0Model);
  -[HMDLegacyV0Model setCloudBlob:](v69, "setCloudBlob:", v67);
  -[HMDLegacyV0Model setCloudBlobV2:](v69, "setCloudBlobV2:", v67);
  -[HMDLegacyV0Model setCloudBlobsReadOnly:](v69, "setCloudBlobsReadOnly:", MEMORY[0x24BDBD1C8]);
  v78 = v43;
  v70 = (void *)MEMORY[0x24BDBCF20];
  v94[0] = v69;
  v94[1] = v68;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setWithArray:", v71);
  *a9 = (id)objc_claimAutoreleasedReturnValue();

  v72 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v64, "na_map:", &__block_literal_global_44_44340);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setWithArray:", v73);
  *a10 = (id)objc_claimAutoreleasedReturnValue();

  v74 = (void *)MEMORY[0x24BDBCF20];
  -[HMDBackingStoreModelObject convertToLegacyV4](v83, "convertToLegacyV4");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v75;
  -[HMDBackingStoreModelObject convertToLegacyV4](v81, "convertToLegacyV4");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v76;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 2);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setWithArray:", v77);
  *a11 = (id)objc_claimAutoreleasedReturnValue();

}

- (void)removeControllerForZone:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDAppleAccessoryPairingController pairingHomes](self, "pairingHomes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    -[HMDAppleAccessoryPairingController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deletePairingAccessoryState:", v10);

    os_unfair_lock_lock_with_options();
    -[HMDAppleAccessoryPairingController pairingHomes](self, "pairingHomes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v12);

    os_unfair_lock_unlock(p_lock);
  }

}

- (HMDAppleAccessoryPairingControllerDataSource)dataSource
{
  return (HMDAppleAccessoryPairingControllerDataSource *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (HMDLegacyCloudDatabase)legacyCloudDatabase
{
  return (HMDLegacyCloudDatabase *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLegacyCloudDatabase:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (HMBLocalZone)homeManagerZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHomeManagerZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMBLocalZone)blobZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBlobZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)pairingHomes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPairingHomes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (HMDMutableHomeData)homeData
{
  return (HMDMutableHomeData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHomeData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeData, 0);
  objc_storeStrong((id *)&self->_pairingHomes, 0);
  objc_storeStrong((id *)&self->_blobZone, 0);
  objc_storeStrong((id *)&self->_homeManagerZone, 0);
  objc_storeStrong((id *)&self->_legacyCloudDatabase, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

uint64_t __191__HMDAppleAccessoryPairingController_generateModelChangesForHomeManager_homeName_pairingHomeUUID_defaultRoomUUID_homeZoneUUID_accessory_outBlobChanges_outLegacyChanges_outHomeManagerChanges___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "convertToLegacyV4");
}

id __81__HMDAppleAccessoryPairingController_cleanUpBadHomeManagerRecordsForHomeManager___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "mirrorOutputResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "mirrorOutputResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flatMap:", &__block_literal_global_33_44348);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __81__HMDAppleAccessoryPairingController_cleanUpBadHomeManagerRecordsForHomeManager___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

void __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(a2, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

    *a4 = 1;
  }
}

void __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_17(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("PairingHomeFor-%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v27 = 0;
  v28 = 0;
  v26 = 0;
  objc_msgSend(v9, "generateModelChangesForHomeManager:homeName:pairingHomeUUID:defaultRoomUUID:homeZoneUUID:accessory:outBlobChanges:outLegacyChanges:outHomeManagerChanges:", v5, v4, v6, v7, v8, v10, &v28, &v27, &v26);
  v11 = v28;
  v12 = v27;
  v13 = v26;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "blobZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addModels:options:", v11, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v17);

  objc_msgSend(*(id *)(a1 + 80), "addModels:options:", v12, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v18);

  objc_msgSend(*(id *)(a1 + 40), "homeManagerZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addModels:options:", v13, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v20);

  v21 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(MEMORY[0x24BE6B628], "globalAsyncScheduler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "combineAllFutures:ignoringErrors:scheduler:", v14, 0, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_2;
  v25[3] = &unk_24E792720;
  v25[4] = *(_QWORD *)(a1 + 40);
  v24 = (id)objc_msgSend(v23, "addSuccessBlock:", v25);

}

void __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a2;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_3;
  v13[3] = &unk_24E7958D8;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v7 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);

  v8 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(MEMORY[0x24BE6B628], "globalAsyncScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "combineAllFutures:ignoringErrors:scheduler:", v7, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_25;
  v12[3] = &unk_24E792720;
  v12[4] = *(_QWORD *)(a1 + 32);
  v11 = (id)objc_msgSend(v10, "addSuccessBlock:", v12);

}

void __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v9;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to process models: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v10 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "mirrorOutputResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = *(void **)(a1 + 40);
      objc_msgSend(v12, "mirrorOutputResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v19;
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Model update did not create mirror output result: %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
    }

  }
}

void __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to push models: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

uint64_t __57__HMDAppleAccessoryPairingController_handleMessage_from___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "handleMessage:from:", a1[4], a1[5]);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __43__HMDAppleAccessoryPairingController_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inProgressPairingAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__HMDAppleAccessoryPairingController_start__block_invoke_2;
  v8[3] = &unk_24E77B520;
  objc_copyWeak(&v9, v4);
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
  objc_destroyWeak(&v9);

}

void __43__HMDAppleAccessoryPairingController_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  HMDAppleAccessoryPairingHomeController *v13;
  void *v14;
  void *v15;
  HMDAppleAccessoryPairingHomeController *v16;
  void *v17;
  void *v18;
  void *v19;
  os_unfair_lock_s *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  os_unfair_lock_s *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "cloudZoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[os_unfair_lock_s legacyCloudDatabase](WeakRetained, "legacyCloudDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[os_unfair_lock_s dataSource](WeakRetained, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hh1ControllerIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v7, "mirrorLegacyZone:controllerIdentity:delegate:error:", v8, v10, 0, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;

  if (v11)
  {
    v13 = [HMDAppleAccessoryPairingHomeController alloc];
    -[os_unfair_lock_s homeManager](WeakRetained, "homeManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_unfair_lock_s dataSource](WeakRetained, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDAppleAccessoryPairingHomeController initWithState:homeManager:dataSource:](v13, "initWithState:homeManager:dataSource:", v3, v14, v15);

    os_unfair_lock_lock_with_options();
    -[os_unfair_lock_s pairingHomes](WeakRetained, "pairingHomes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cloudZoneID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v16, v18);

    os_unfair_lock_unlock(WeakRetained + 2);
    v19 = (void *)MEMORY[0x227676638](-[HMDAppleAccessoryPairingHomeController startWithLocalZone:](v16, "startWithLocalZone:", v11));
    v20 = WeakRetained;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v22;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@LEGACY CLOUD ZONE OPEN: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = WeakRetained;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v26;
      v30 = 2112;
      v31 = v6;
      v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@LEGACY CLOUD ZONE OPEN %@ FAILED: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26_44390 != -1)
    dispatch_once(&logCategory__hmf_once_t26_44390, &__block_literal_global_46);
  return (id)logCategory__hmf_once_v27_44391;
}

void __49__HMDAppleAccessoryPairingController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v27_44391;
  logCategory__hmf_once_v27_44391 = v0;

}

@end
