@implementation HMDPersistentStore

+ (id)_writeData:(id)a3 toStorePath:(id)a4 dataLabel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v37 = *MEMORY[0x24BDD0CC8];
  v38[0] = &unk_24E96B1C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "createFileAtPath:contents:attributes:", v9, 0, v11) & 1) == 0)
    objc_msgSend(v12, "setAttributes:ofItemAtPath:error:", v11, v9, 0);
  v28 = 0;
  objc_msgSend(v8, "writeToFile:options:error:", v9, 1073741825, &v28);
  v13 = v28;
  if (v13)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v8;
      v18 = objc_msgSend(v13, "code");
      objc_msgSend(v13, "localizedDescription");
      v26 = v14;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v30 = v17;
      v31 = 2112;
      v32 = v10;
      v33 = 2048;
      v34 = v18;
      v8 = v25;
      v35 = 2112;
      v36 = v19;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Archive %@ error %ld:%@", buf, 0x2Au);

      v14 = v26;
    }

    objc_autoreleasePoolPop(v14);
  }
  v27 = 0;
  objc_msgSend(v12, "attributesOfItemAtPath:error:", v9, &v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = objc_msgSend(v20, "fileSize");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)readDataFromPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v4, 2, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v11;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to load data store from file path %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }

  return v5;
}

+ (id)writeData:(id)a3 toStorePath:(id)a4 dataLabel:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc(MEMORY[0x24BE3F138]);
  MEMORY[0x227675180](a1, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithName:", v13);

  objc_msgSend(a1, "_writeData:toStorePath:dataLabel:", v9, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __HMFActivityScopeLeave();

  return v14;
}

+ (BOOL)writeDictionary:(id)a3 toStorePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  if (!v6 || !v7)
  {
    v10 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@### Failed to save dictionary %@ to path %@", buf, 0x20u);

    }
    goto LABEL_10;
  }
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v18);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v18;
  if (!v9)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v16;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@### Failed to save dictionary %@ to path %@ error %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    v9 = 0;
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  v11 = -[NSObject writeToFile:atomically:](v9, "writeToFile:atomically:", v7, 1);
LABEL_11:

  objc_autoreleasePoolPop(v8);
  return v11;
}

+ (BOOL)deserializeHomeData:(id *)a3 localStorage:(BOOL)a4 fromData:(id)a5
{
  uint64_t v5;
  id v7;

  v5 = a4;
  v7 = a5;
  LOBYTE(v5) = objc_msgSend((id)objc_opt_class(), "deserializeHomeData:usingLocalStorage:fromData:forHH2Migration:", a3, v5, v7, 0);

  return v5;
}

+ (BOOL)deserializeHomeData:(id *)a3 usingLocalStorage:(BOOL)a4 fromData:(id)a5 forHH2Migration:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  HMDMutableHomeData *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  HMDApplicationData *v61;
  void *v62;
  HMDApplicationData *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  _BOOL4 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  id v85;
  uint8_t v86[128];
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  id v92;
  _QWORD v93[20];

  v6 = a6;
  v7 = a4;
  v93[17] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = v10;
  isKindOfClass = 0;
  if (a3 && v10)
  {
    v79 = v7;
    *a3 = 0;
    v13 = (void *)MEMORY[0x24BDBCF20];
    v93[0] = objc_opt_class();
    v93[1] = objc_opt_class();
    v93[2] = objc_opt_class();
    v93[3] = objc_opt_class();
    v93[4] = objc_opt_class();
    v93[5] = objc_opt_class();
    v93[6] = objc_opt_class();
    v93[7] = objc_opt_class();
    v93[8] = objc_opt_class();
    v93[9] = objc_opt_class();
    v93[10] = objc_opt_class();
    v93[11] = objc_opt_class();
    v93[12] = objc_opt_class();
    v93[13] = objc_opt_class();
    v93[14] = objc_opt_class();
    v93[15] = objc_opt_class();
    v93[16] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = 0;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v11, &v85);
    v17 = v85;
    objc_msgSend(v16, "_allowDecodingCyclesInSecureMode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v16, CFSTR("HMDHH2MigrationInProgressAssociationKey"), v18, (void *)0x301);

    objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("HMDUserManagementOperation"));
    v19 = *MEMORY[0x24BDD0E88];
    v84 = v17;
    objc_msgSend(v16, "decodeTopLevelObjectOfClasses:forKey:error:", v15, v19, &v84);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v84;

    if (v20)
    {
      v77 = v21;
      v78 = v20;
      v22 = v20;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
      v24 = v23;

      if ((isKindOfClass & 1) != 0)
      {
        v75 = v15;
        v25 = objc_alloc_init(HMDMutableHomeData);
        objc_msgSend(v22, "hmf_arrayForKey:", CFSTR("kAccessoriesDataBlobKey"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeData setAccessories:](v25, "setAccessories:", v26);

        objc_msgSend(v22, "hmf_arrayForKey:", CFSTR("kHomesDataBlobKey"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v81;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v81 != v30)
                objc_enumerationMutation(v27);
              objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * i), "_removeCorruptAccessories", v75);
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
          }
          while (v29);
        }
        -[HMDHomeData setHomes:](v25, "setHomes:", v27, v75);
        objc_msgSend(v24, "hmf_UUIDForKey:", CFSTR("kPrimaryHomeUUIDKey"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeData setPrimaryHomeUUID:](v25, "setPrimaryHomeUUID:", v32);

        objc_msgSend(v24, "hmf_UUIDForKey:", CFSTR("kLastCurrentHomeUUIDKey"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeData setLastCurrentHomeUUID:](v25, "setLastCurrentHomeUUID:", v33);

        if (v79)
        {
          objc_msgSend(v24, "hmf_arrayForKey:", CFSTR("kUuidsOfRemovedHomesKey"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomeData setUUIDsOfRemovedHomes:](v25, "setUUIDsOfRemovedHomes:", v34);

          objc_msgSend(v24, "hmf_arrayForKey:", CFSTR("kIncomingHomeInvitationsKey"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomeData setIncomingInvitations:](v25, "setIncomingInvitations:", v35);

        }
        objc_msgSend(v24, "hmf_dictionaryForKey:", CFSTR("kZonesInformationKey"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          +[HMDCloudZoneInformation cloudZonesWithDictionary:](HMDCloudZoneInformation, "cloudZonesWithDictionary:", v36);
        else
          objc_msgSend(v24, "hmf_arrayForKey:", CFSTR("kCloudZonesInformationKey"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeData setCloudZones:](v25, "setCloudZones:", v50);

        objc_msgSend(v24, "hmf_numberForKey:", CFSTR("kHomeSchemaVersionKey"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        if (v51)
          -[HMDHomeData setSchemaVersion:](v25, "setSchemaVersion:", objc_msgSend(v51, "integerValue"));

        objc_msgSend(v24, "hmf_numberForKey:", CFSTR("kHomeDataVersionKey"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (v53)
          -[HMDHomeData setDataVersion:](v25, "setDataVersion:", objc_msgSend(v53, "integerValue"));

        objc_msgSend(v24, "hmf_numberForKey:", CFSTR("kHomeRecoveryVersionKey"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (v55)
          -[HMDHomeData setRecoveryVersion:](v25, "setRecoveryVersion:", objc_msgSend(v55, "integerValue"));

        objc_msgSend(v24, "hmf_UUIDForKey:", CFSTR("kHomeDataTagKey"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          -[HMDHomeData setDataTag:](v25, "setDataTag:", v57);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomeData setDataTag:](v25, "setDataTag:", v58);

        }
        objc_msgSend(v24, "hmf_arrayForKey:", CFSTR("kUserManagementUnprocessedOperationModelsKey"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeData setUnprocessedOperationIdentifiers:](v25, "setUnprocessedOperationIdentifiers:", v59);

        objc_msgSend(v24, "hmf_dictionaryForKey:", CFSTR("kApplicationDataKey"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = [HMDApplicationData alloc];
        v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
        v63 = -[HMDApplicationData initWithDictionary:parentUUID:](v61, "initWithDictionary:parentUUID:", v60, v62);

        -[HMDHomeData setApplicationData:](v25, "setApplicationData:", v63);
        buf[0] = 0;
        v64 = objc_msgSend(v24, "hmf_BOOLForKey:isPresent:", CFSTR("kResidentEnabledKey"), buf);
        v65 = 1;
        if (v64)
          v65 = 2;
        if (buf[0])
          v66 = v65;
        else
          v66 = 0;
        -[HMDHomeData setResidentEnabledState:](v25, "setResidentEnabledState:", v66);
        if (v79)
        {
          objc_msgSend(v24, "objectForKey:", CFSTR("HM.appleAccount"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomeData setAccount:](v25, "setAccount:", v67);

          objc_msgSend(v24, "hmf_arrayForKey:", CFSTR("HM.remoteAccounts"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomeData setRemoteAccounts:](v25, "setRemoteAccounts:", v68);

          objc_msgSend(v24, "objectForKey:", CFSTR("HM.primaryAccountHandle"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomeData setPrimaryAccountHandle:](v25, "setPrimaryAccountHandle:", v69);

        }
        objc_msgSend(v24, "objectForKey:", CFSTR("HM.currentDevice"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeData setCurrentDevice:](v25, "setCurrentDevice:", v70);

        objc_msgSend(v24, "objectForKey:", CFSTR("HM.savedReasonsKey"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeData setPendingReasonSaved:](v25, "setPendingReasonSaved:", v71);

        buf[0] = 0;
        v72 = objc_msgSend(v24, "hmf_BOOLForKey:isPresent:", CFSTR("HM.accessAllowedWhenLocked"), buf);
        v21 = v77;
        v20 = v78;
        if (!buf[0])
          v72 = isiOSDevice();
        -[HMDHomeData setAccessAllowedWhenLocked:](v25, "setAccessAllowedWhenLocked:", v72);
        objc_msgSend(v24, "objectForKey:", CFSTR("HM.demoAccessories"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeData setDemoAccessories:](v25, "setDemoAccessories:", v73);

        -[HMDHomeData setDemoFinalized:](v25, "setDemoFinalized:", objc_msgSend(v24, "hmf_BOOLForKey:", CFSTR("HM.demoFinalized")));
        *a3 = (id)-[HMDMutableHomeData copy](v25, "copy");

        v15 = v76;
      }
      else
      {
        v43 = (void *)MEMORY[0x227676638]();
        v44 = a1;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = v15;
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v88 = v47;
          v89 = 2112;
          v90 = v48;
          v91 = 2112;
          v92 = v22;
          v49 = v48;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Object was not of expected class NSDictionary (class=%@): %@", buf, 0x20u);

          v15 = v46;
        }

        objc_autoreleasePoolPop(v43);
        v21 = v77;
        v20 = v78;
      }

    }
    else
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = a1;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v41 = v21;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v88 = v40;
        v89 = 2112;
        v90 = v42;
        v91 = 2112;
        v92 = v41;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive home data from keyed archive: HH2 Migration: %@ / error: %@", buf, 0x20u);

        v21 = v41;
      }

      objc_autoreleasePoolPop(v37);
      isKindOfClass = 0;
    }

  }
  return isKindOfClass & 1;
}

+ (BOOL)removeLegacyHomeArchive:(id *)a3
{
  void *v4;
  id v5;
  int v6;
  void *v7;
  id v8;
  char v9;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)configProtectedDataStorePath;
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (!v6)
    return 1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)configProtectedDataStorePath;
  v9 = objc_msgSend(v7, "removeItemAtPath:error:", v8, a3);

  return v9;
}

+ (id)unarchiveHomeData:(id *)a3 decryptionFailed:(BOOL *)a4 successfulKeyUserName:(id *)a5
{
  return (id)objc_msgSend((id)objc_opt_class(), "unarchiveHomeData:decryptionFailed:fromLocation:successfulKeyUserName:forHH2Migration:", a3, a4, 0, a5, 0);
}

+ (id)unarchiveHomeData:(id *)a3 decryptionFailed:(BOOL *)a4 fromLocation:(id)a5 successfulKeyUserName:(id *)a6 forHH2Migration:(BOOL)a7
{
  uint64_t v7;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  unsigned int v35;
  id *v36;
  id v37;
  id v38;
  id v39;
  unint64_t v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v7 = a7;
  v48 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = v12;
  if (a4)
    *a4 = 0;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    v14 = (id)configProtectedDataStorePath;
    if (!v14)
    {
      v31 = objc_alloc(MEMORY[0x24BDD1540]);
      v17 = (void *)objc_msgSend(v31, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 258, 0);
      goto LABEL_30;
    }
  }
  v41 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v14, 2, &v41);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v41;
  v17 = v16;
  if (v15)
  {
    v36 = a3;
    v39 = 0;
    v40 = 0;
    v38 = v16;
    objc_msgSend(a1, "decryptDataWithControllerKey:totalKeysFound:deleteExtraKeys:allowControllerIdentifierToChange:controllerIdentifierChanged:successfulKeyUserName:error:", v15, &v40, 0, 1, 0, &v39, &v38);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v39;
    v37 = v38;

    if (v18)
    {
      if (v40 >= 2)
      {
        v35 = v7;
        v20 = (id)serverTokenDataStorePath;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v20;
        LODWORD(v20) = objc_msgSend(v21, "fileExistsAtPath:", v20);

        if ((_DWORD)v20)
        {
          v22 = (void *)MEMORY[0x227676638]();
          v23 = a1;
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v33 = v22;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v43 = v25;
            v44 = 2048;
            v45 = v40;
            _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@We have %lu controller keys on boot, nuking server token data to help autocorrect on next fetch", buf, 0x16u);

            v22 = v33;
          }

          objc_autoreleasePoolPop(v22);
          v26 = (id)objc_msgSend(v23, "archiveCloudServerTokenData:", 0);
        }
        else if (a6 && v40 == 1)
        {
          *a6 = objc_retainAutorelease(v19);
        }

        v7 = v35;
      }

      if ((objc_msgSend(a1, "deserializeHomeData:usingLocalStorage:fromData:forHH2Migration:", v36, 1, v18, v7) & 1) != 0)
      {
        v17 = 0;
      }
      else
      {
        if (a4)
          *a4 = 1;
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 52, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (a4)
        *a4 = 1;

      v18 = 0;
      v17 = v37;
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = a1;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v30;
      v44 = 2112;
      v45 = (unint64_t)v14;
      v46 = 2112;
      v47 = v17;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to load data store from file path %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    v18 = 0;
  }

LABEL_30:
  return v17;
}

+ (void)cleanupKeysInStore
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@-[%@ %@] no-op because cloud sync disabled", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
}

+ (void)resetConfiguration:(unint64_t)a3
{
  +[HMDResetConfigPostCleanup writePostCleanupRecordWithReason:steps:](HMDResetConfigPostCleanup, "writePostCleanupRecordWithReason:steps:");
  +[HMDHH2FrameworkSwitch setHH2EnablementPreferenceKey:](HMDHH2FrameworkSwitch, "setHH2EnablementPreferenceKey:", 0);
}

+ (id)serializeHomeData:(id)a3 localStorage:(BOOL)a4 remoteDeviceOnSameAccount:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
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
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  void *v27;
  id v28;
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
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _BOOL8 v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _BOOL4 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v5 = a5;
  v6 = a4;
  v75 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "homes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("kHomesDataBlobKey"));

  }
  objc_msgSend(v7, "primaryHomeUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "primaryHomeUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("kPrimaryHomeUUIDKey"));

  }
  objc_msgSend(v7, "lastCurrentHomeUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v7, "lastCurrentHomeUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("kLastCurrentHomeUUIDKey"));

  }
  objc_msgSend(v7, "accessories");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v69 = v6;
    v18 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v7, "accessories");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend(v7, "accessories");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v71 != v24)
            objc_enumerationMutation(v21);
          v26 = *(id *)(*((_QWORD *)&v70 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v27 = v26;
          else
            v27 = 0;
          v28 = v27;

          if (v28)
            objc_msgSend(v20, "addObject:", v28);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      }
      while (v23);
    }

    v29 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, CFSTR("kAccessoriesDataBlobKey"));

    v6 = v69;
  }
  objc_msgSend(v7, "currentDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v7, "currentDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("HM.currentDevice"));

  }
  objc_msgSend(v7, "pendingReasonSaved");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v7, "pendingReasonSaved");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, CFSTR("HM.savedReasonsKey"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "dataVersion"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v34, CFSTR("kHomeDataVersionKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "schemaVersion"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v35, CFSTR("kHomeSchemaVersionKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "recoveryVersion"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v36, CFSTR("kHomeRecoveryVersionKey"));

  objc_msgSend(v7, "dataTag");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "UUIDString");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v38, CFSTR("kHomeDataTagKey"));

  if (v6 || v5)
  {
    objc_msgSend(v7, "applicationData");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v7, "applicationData");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "dictionary");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v43, CFSTR("kApplicationDataKey"));

    }
    if (v6)
    {
      objc_msgSend(v7, "cloudZones");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        objc_msgSend(v7, "cloudZones");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v45, CFSTR("kCloudZonesInformationKey"));

      }
      objc_msgSend(v7, "UUIDsOfRemovedHomes");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "count");

      if (v47)
      {
        objc_msgSend(v7, "UUIDsOfRemovedHomes");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v48, CFSTR("kUuidsOfRemovedHomesKey"));

      }
      objc_msgSend(v7, "incomingInvitations");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count");

      if (v50)
      {
        objc_msgSend(v7, "incomingInvitations");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v51, CFSTR("kIncomingHomeInvitationsKey"));

      }
      objc_msgSend(v7, "pendingUserManagementOperations");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        objc_msgSend(v7, "pendingUserManagementOperations");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v53, CFSTR("HM.userManagementPendingOperationsKey"));

      }
      objc_msgSend(v7, "unprocessedOperationIdentifiers");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        objc_msgSend(v7, "unprocessedOperationIdentifiers");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v55, CFSTR("kUserManagementUnprocessedOperationModelsKey"));

      }
      objc_msgSend(v7, "account");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
      {
        objc_msgSend(v7, "account");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v57, CFSTR("HM.appleAccount"));

        objc_msgSend(v7, "primaryAccountHandle");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v58, CFSTR("HM.primaryAccountHandle"));

      }
      objc_msgSend(v7, "remoteAccounts");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        objc_msgSend(v7, "remoteAccounts");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v60, CFSTR("HM.remoteAccounts"));

      }
      if (objc_msgSend(v7, "residentEnabledState"))
      {
        v61 = objc_msgSend(v7, "residentEnabledState") == 2;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v62, CFSTR("kResidentEnabledKey"));

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "accessAllowedWhenLocked"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v63, CFSTR("HM.accessAllowedWhenLocked"));

      objc_msgSend(v7, "demoAccessories");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        objc_msgSend(v7, "demoAccessories");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v65, CFSTR("HM.demoAccessories"));

      }
      if (objc_msgSend(v7, "demoFinalized"))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "demoFinalized"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v66, CFSTR("HM.demoFinalized"));

      }
      v39 = (void *)objc_msgSend(v8, "copy");
      encodeRootObject();
      v40 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = (void *)objc_msgSend(v8, "copy");
      encodeRootObjectForRemoteDeviceOnSameAccountMigrateToHH2(v39, 0, 0);
      v40 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v39 = (void *)objc_msgSend(v8, "copy");
    encodeRootObjectForRemote(v39, 0, 0);
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v67 = (void *)v40;

  return v67;
}

+ (id)archiveHomeDataForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    objc_msgSend(a1, "serializeHomeData:localStorage:remoteDeviceOnSameAccount:", v4, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)archiveHomeDataLegacy:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = (id)configProtectedDataStorePath;
  objc_msgSend(a1, "archiveHomeDataLegacy:toLocation:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)archiveHomeDataLegacy:(id)a3 toLocation:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v6 = (id)configProtectedDataStorePath;
  objc_msgSend(v5, "archiveHomeData:toLocation:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)archiveHomeData:(id)a3 toLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = (void *)MEMORY[0x227676638]();
    objc_msgSend(a1, "serializeHomeData:localStorage:remoteDeviceOnSameAccount:", v6, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      && (v15 = 0,
          objc_msgSend(a1, "encryptDataWithControllerKey:error:", v11, &v15),
          (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)v12;
      objc_msgSend(a1, "_writeData:toStorePath:dataLabel:", v12, v8, CFSTR("home data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

    objc_autoreleasePoolPop(v10);
  }

  return v9;
}

+ (void)archiveVendorStore:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (id)configVendorIDStorePath;
  v6 = (void *)MEMORY[0x227676638]();
  if (v5)
  {
    v21 = CFSTR("kApplicationVendorIDStoreDataKey");
    v22[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    encodeRootObject();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v12;
      v17 = 2048;
      v18 = -[NSObject length](v8, "length");
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Saving data file of length %tu at path %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = (id)objc_msgSend(v10, "_writeData:toStorePath:dataLabel:", v8, v5, CFSTR("vendor id store"));
  }
  else
  {
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Unable to determine vendor store path", (uint8_t *)&v15, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v6);
}

+ (id)unarchiveVendorStore
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  id v13;
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
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  _QWORD v40[4];

  v40[3] = *MEMORY[0x24BDAC8D0];
  v3 = (id)configVendorIDStorePath;
  if (v3)
  {
    objc_msgSend(a1, "readDataFromPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)MEMORY[0x24BDBCF20];
      v40[0] = objc_opt_class();
      v40[1] = objc_opt_class();
      v40[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setWithArray:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v7, v4, &v33);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v33;
      if (v8)
      {
        v10 = v8;
        objc_opt_class();
        v11 = objc_opt_isKindOfClass() & 1;
        if (v11)
          v12 = v10;
        else
          v12 = 0;
        v13 = v12;

        if (v11)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kApplicationVendorIDStoreDataKey"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = v14;
          else
            v15 = 0;
          v16 = v15;

        }
        else
        {
          v25 = (void *)MEMORY[0x227676638]();
          v26 = a1;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v32 = v25;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v35 = v28;
            v36 = 2112;
            v37 = v29;
            v38 = 2112;
            v39 = v10;
            v30 = v29;
            _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Object was not of expected class NSDictionary (class=%@): %@", buf, 0x20u);

            v25 = v32;
          }

          objc_autoreleasePoolPop(v25);
          v16 = 0;
        }

      }
      else
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = a1;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v24;
          v36 = 2112;
          v37 = v9;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive info dictionary from data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = a1;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Unable to determine vendor store path", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v16 = 0;
  }

  return v16;
}

+ (id)loadPlainMetadataDictionary
{
  id v2;
  void *v3;

  v2 = (id)configPlainMetadataPath;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)loadBuiltinPlainMetadataDictionary
{
  id v2;
  void *v3;

  v2 = (id)builtinConfigMetadataDictionaryPath;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (BOOL)archiveMetadata:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE1BD80]),
        (v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = (void *)v6,
        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE1BD50]),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v9 = (id)configPlainMetadataPath;
    v10 = objc_msgSend(a1, "writeDictionary:toStorePath:", v5, v9);

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = a1;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive metadata dictionary %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

+ (void)removeServerTokenDataFile
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (id)serverTokenDataStorePath;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v7 = objc_msgSend(v6, "removeItemAtPath:error:", v3, &v13);
    v8 = v13;

    if ((v7 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = a1;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v15 = v12;
        v16 = 2112;
        v17 = v3;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete file %@ due to error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
    }

  }
}

+ (id)archiveCloudServerTokenData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("kServerTokenDataBlobKey"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("kServerTokenDataBlobKey"));

  }
  v8 = (id)serverTokenDataStorePath;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_writeData:toStorePath:dataLabel:", v9, v8, CFSTR("server token"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)removeTransactionJournal
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (id)transactionJournalDataStorePath;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v7 = objc_msgSend(v6, "removeItemAtPath:error:", v3, &v13);
    v8 = v13;

    if ((v7 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = a1;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v15 = v12;
        v16 = 2112;
        v17 = v3;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete file %@ due to error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
    }

  }
}

+ (id)archiveIDSDataSyncJournal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("kTransactionJournalKey"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("kTransactionJournalKey"));

  }
  v9 = (id)idsDataSyncJournalDataStorePath;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_writeData:toStorePath:dataLabel:", v10, v9, CFSTR("transactions journal"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v11;
}

+ (id)unarchiveIDSDataSyncJournal
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  _QWORD v57[7];

  v57[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x227676638]();
  v4 = (id)idsDataSyncJournalDataStorePath;
  objc_msgSend(a1, "readDataFromPath:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v57[0] = objc_opt_class();
    v57[1] = objc_opt_class();
    v57[2] = objc_opt_class();
    v57[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = 0;
    v43 = (void *)v5;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v8, v5, &v49);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v49;
    if (v9)
    {
      v10 = v9;
      objc_opt_class();
      v11 = objc_opt_isKindOfClass() & 1;
      if (v11)
        v12 = v10;
      else
        v12 = 0;
      v13 = v12;

      if (v11)
      {
        objc_msgSend(v10, "hmf_dictionaryForKey:", CFSTR("kTransactionJournalKey"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v40 = v13;
          v41 = v3;
          v10 = v14;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v46 != v17)
                  objc_enumerationMutation(v10);
                v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v20 = v19;
                  objc_msgSend(v10, "objectForKeyedSubscript:", v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v21);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "setObject:forKeyedSubscript:", v22, v20);

                  }
                }
              }
              v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
            }
            while (v16);
          }

          v23 = 0;
          v3 = v41;
          v13 = v40;
        }
        else
        {
          v10 = 0;
          v23 = 0;
        }
      }
      else
      {
        v30 = v3;
        v31 = (void *)MEMORY[0x227676638]();
        v32 = a1;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = v13;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v52 = v35;
          v53 = 2112;
          v54 = v36;
          v55 = 2112;
          v56 = v10;
          v37 = v36;
          _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Object was not of expected class NSDictionary (class=%@): %@", buf, 0x20u);

          v13 = v34;
        }

        objc_autoreleasePoolPop(v31);
        v23 = 1;
        v3 = v30;
      }

      v27 = v42;
    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = a1;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v42;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = v3;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v29;
        v53 = 2112;
        v54 = v42;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive info dictionary from data: %@", buf, 0x16u);

        v3 = v28;
      }

      objc_autoreleasePoolPop(v24);
      v23 = 1;
    }

    objc_autoreleasePoolPop(v3);
    if (!v23)
    {
      v38 = v44;
      goto LABEL_32;
    }
  }
  else
  {
    objc_autoreleasePoolPop(v3);
  }
  v38 = 0;
LABEL_32:

  return v38;
}

+ (void)archiveBulletinBoard:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x227676638]();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)bulletinBoardDataStorePath;
  v7 = (id)objc_msgSend(a1, "_writeData:toStorePath:dataLabel:", v5, v6, CFSTR("bulletin board"));

  objc_autoreleasePoolPop(v4);
}

+ (id)unarchiveBulletinBoard
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](a1, a2);
  v4 = (id)bulletinBoardDataStorePath;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(a1, "readDataFromPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v16);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v16;
      if (v7)
      {
        v9 = 0;
      }
      else
      {
        v10 = (void *)MEMORY[0x227676638]();
        v11 = a1;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v18 = v13;
          v19 = 2112;
          v20 = v8;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive bulletin board from data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        v9 = 1;
      }

    }
    else
    {
      v7 = 0;
      v9 = 1;
    }

    objc_autoreleasePoolPop(v3);
    if (!v9)
    {
      v7 = v7;
      v14 = v7;
      goto LABEL_14;
    }
  }
  else
  {
    objc_autoreleasePoolPop(v3);
    v7 = 0;
  }
  v14 = 0;
LABEL_14:

  return v14;
}

+ (id)encryptData:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ccsha512_di();
  objc_msgSend(v6, "length");
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "bytes");

  cchkdf();
  RandomBytes();
  ccsha512_di();
  cchkdf();
  v9 = objc_msgSend(v7, "length", &v15);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v9 + 28);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "mutableBytes");
  v12 = v16;
  *(_QWORD *)v11 = v15;
  *(_DWORD *)(v11 + 8) = v12;
  v13 = objc_retainAutorelease(v7);
  objc_msgSend(v13, "bytes");

  chacha20_poly1305_encrypt_all_96x32();
  return v10;
}

+ (id)decryptData:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  id *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  _BYTE v33[32];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "length");
  v10 = v9 - 28;
  if (v9 > 0x1C)
  {
    ccsha512_di();
    objc_msgSend(v8, "length");
    objc_msgSend(objc_retainAutorelease(v8), "bytes");
    cchkdf();
    objc_msgSend(objc_retainAutorelease(v7), "bytes", v33);
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v10);
    v18 = (id *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v18, "mutableBytes");
    v19 = chacha20_poly1305_decrypt_all_96x32();
    if (v19)
    {
      if (a5)
      {
        v20 = (void *)MEMORY[0x24BDD1540];
        v21 = *MEMORY[0x24BDD1100];
        v22 = v19;
        v29 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        v25 = CFSTR("?");
        if (v23)
          v25 = (const __CFString *)v23;
        v30 = v25;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, v26);
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a5 = v27;

        a5 = 0;
      }
    }
    else
    {
      a5 = v18;
      v18 = a5;
    }
  }
  else
  {
    if (a5)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = *MEMORY[0x24BDD1100];
      v31 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("?");
      if (v13)
        v15 = (const __CFString *)v13;
      v32 = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -6743, v16);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v17;

      a5 = 0;
    }
    v18 = 0;
  }

  return a5;
}

+ (id)encryptDataWithControllerKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = 0;
  v8 = objc_msgSend(v7, "getControllerPublicKey:secretKey:username:allowCreation:error:", 0, &v18, &v17, 0, a4);
  v9 = v18;
  v10 = v17;

  if (v8)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = a1;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v14;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Using key [%@] to encrypt the homedata and store it: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v12, "encryptData:withKey:error:", v6, v9, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)decryptDataWithControllerKey:(id)a3 totalKeysFound:(unint64_t *)a4 deleteExtraKeys:(BOOL)a5 allowControllerIdentifierToChange:(BOOL)a6 controllerIdentifierChanged:(BOOL *)a7 successfulKeyUserName:(id *)a8 error:(id *)a9
{
  _BOOL4 v9;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  id *v17;
  BOOL v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  void *v53;
  id v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  char v74;
  id *v75;
  void *v76;
  id v77;
  NSObject *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  id *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id *v88;
  void *v89;
  void *v90;
  id v91;
  NSObject *v92;
  void *v93;
  void *v94;
  char v95;
  void *v96;
  id v97;
  NSObject *v98;
  void *v99;
  void *v100;
  id v101;
  NSObject *v102;
  void *v103;
  void *v104;
  id v105;
  NSObject *v106;
  void *v107;
  _BOOL4 v109;
  _BOOL4 v110;
  id v111;
  id v112;
  id v113;
  void *v114;
  id v116;
  id v117;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  _BOOL4 obj;
  id obja;
  id *v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  id v132;
  id v133;
  id v134;
  id v135;
  uint8_t v136[128];
  uint8_t buf[4];
  void *v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  id *v142;
  __int16 v143;
  id *v144;
  uint64_t v145;

  obj = a6;
  v9 = a5;
  v145 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = 0;
  v135 = 0;
  v133 = 0;
  v14 = objc_msgSend(v13, "getAllAvailableControllerPublicKeys:secretKeys:userNames:error:", 0, &v135, &v134, &v133);
  v15 = v135;
  v16 = v134;
  v17 = (id *)v133;

  if (v14)
    v18 = v15 == 0;
  else
    v18 = 1;
  v19 = v18 || v16 == 0;
  if (v19 || (v20 = objc_msgSend(v16, "count"), v20 != objc_msgSend(v15, "count")))
  {
    v36 = (void *)MEMORY[0x227676638]();
    v37 = a1;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v138 = v39;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Unable to get controller public keys", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v36);
    v35 = a9;
    if (a9)
    {
      v17 = objc_retainAutorelease(v17);
      v34 = 0;
      v35 = 0;
      *a9 = v17;
    }
    else
    {
      v34 = 0;
    }
    goto LABEL_82;
  }
  if (a7)
    *a7 = 0;
  if (a4)
    *a4 = objc_msgSend(v15, "count");
  if (!obj)
  {
    objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activeControllerPairingIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");

    if (!v23)
    {
      v40 = (void *)MEMORY[0x227676638]();
      v41 = a1;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v138 = v43;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Cannot find controller key because active controller pairing identifier is not set", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v40);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (a9)
        *a9 = objc_retainAutorelease(v44);

      v34 = 0;
      v35 = 0;
      goto LABEL_82;
    }
    v109 = v9;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v16, "indexOfObject:", v23);
    if (v26 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v112 = v15;
      v116 = v16;
      v27 = v11;
      v28 = (void *)MEMORY[0x227676638]();
      v29 = a1;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v138 = v31;
        v139 = 2112;
        v140 = v23;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Cannot find controller key for active controller pairing identifier, %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (a9)
        *a9 = objc_retainAutorelease(v32);

      v34 = 0;
      v35 = 0;
      v11 = v27;
      v16 = v116;
      v15 = v112;
      goto LABEL_82;
    }
    v46 = v26;
    objc_msgSend(v16, "objectAtIndexedSubscript:", v26);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v47);

    objc_msgSend(v15, "objectAtIndexedSubscript:", v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v48);

    v49 = objc_msgSend(v24, "copy");
    v50 = objc_msgSend(v25, "copy");

    v16 = (id)v50;
    v15 = (id)v49;
    v9 = v109;
  }
  if (!objc_msgSend(v15, "count"))
  {
    v34 = 0;
    v51 = 0;
    if (!objc_msgSend(v12, "count"))
      goto LABEL_75;
LABEL_72:
    v100 = (void *)MEMORY[0x227676638]();
    v101 = a1;
    HMFGetOSLogHandle();
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v138 = v103;
      _os_log_impl(&dword_2218F0000, v102, OS_LOG_TYPE_INFO, "%{public}@Data has not been decrypted, not deleting extra keys", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v100);
    v51 = 0;
LABEL_75:
    if (a9 && !v51)
    {
      v17 = objc_retainAutorelease(v17);
      *a9 = v17;
    }
    goto LABEL_81;
  }
  v110 = v9;
  v51 = 0;
  v34 = 0;
  v52 = 0;
  v114 = v12;
  v117 = v11;
  do
  {
    if (v51)
    {
      v119 = v51;
      v53 = (void *)MEMORY[0x227676638]();
      v54 = a1;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v56 = v34;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v52);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v138 = v57;
        v139 = 2112;
        v140 = v58;
        _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, "%{public}@Data has already been decrypted, adding controller key: %@", buf, 0x16u);

        v11 = v117;
        v34 = v56;
        v12 = v114;
      }

      objc_autoreleasePoolPop(v53);
      objc_msgSend(v16, "objectAtIndexedSubscript:", v52);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v59);
      v51 = v119;
      goto LABEL_50;
    }

    objc_msgSend(v15, "objectAtIndexedSubscript:", v52);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = 0;
    objc_msgSend(a1, "decryptData:withKey:error:", v11, v60, &v132);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id *)v132;

    if (v17 || !v61)
    {
      v76 = (void *)MEMORY[0x227676638]();
      v77 = a1;
      HMFGetOSLogHandle();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v52);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v52);
        v121 = v76;
        v81 = v15;
        v82 = v16;
        v83 = (id *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v138 = v79;
        v139 = 2114;
        v140 = v80;
        v141 = 2114;
        v142 = v83;
        v143 = 2114;
        v144 = v17;
        _os_log_impl(&dword_2218F0000, v78, OS_LOG_TYPE_INFO, "%{public}@Decryption failed with controller key: %{public}@, key:%{public}@ with error: %{public}@", buf, 0x2Au);

        v16 = v82;
        v15 = v81;
        v76 = v121;

        v12 = v114;
      }

      objc_autoreleasePoolPop(v76);
      objc_msgSend(v16, "objectAtIndexedSubscript:", v52);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v59);
      v51 = 0;
      v34 = v61;
      v11 = v117;
      goto LABEL_50;
    }
    v34 = v61;
    v17 = a8;
    if (obj)
    {
      v62 = (void *)MEMORY[0x227676638]();
      v63 = a1;
      HMFGetOSLogHandle();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v52);
        v120 = v62;
        v66 = v11;
        v67 = v15;
        v68 = v16;
        v69 = v12;
        v70 = v34;
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v138 = v65;
        v139 = 2112;
        v140 = v71;
        _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_INFO, "%{public}@Updating active controller identifier to %@", buf, 0x16u);

        v34 = v70;
        v12 = v69;
        v16 = v68;
        v15 = v67;
        v11 = v66;
        v62 = v120;

        v17 = a8;
      }

      objc_autoreleasePoolPop(v62);
      objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v52);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v72, "updateActiveControllerPairingIdentifier:", v73);

      if (a7)
        *a7 = v74;
    }
    if (v17)
    {
      v75 = v17;
      objc_msgSend(v16, "objectAtIndexedSubscript:", v52);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      *v75 = (id)objc_msgSend(v59, "copy");
      v51 = v34;
LABEL_50:

      goto LABEL_51;
    }
    v51 = v34;
LABEL_51:
    ++v52;
  }
  while (v52 < objc_msgSend(v15, "count"));
  if (!objc_msgSend(v12, "count"))
    goto LABEL_75;
  if (!v51)
    goto LABEL_72;
  if (v110)
  {
    v122 = v51;
    v111 = v34;
    v113 = v15;
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    obja = v12;
    v84 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
    if (v84)
    {
      v85 = v84;
      v86 = *(_QWORD *)v129;
      do
      {
        v87 = 0;
        v88 = v17;
        do
        {
          if (*(_QWORD *)v129 != v86)
            objc_enumerationMutation(obja);
          v89 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v87);
          v90 = (void *)MEMORY[0x227676638]();
          v91 = a1;
          HMFGetOSLogHandle();
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v138 = v93;
            v139 = 2112;
            v140 = v89;
            _os_log_impl(&dword_2218F0000, v92, OS_LOG_TYPE_INFO, "%{public}@Deleting extra key corresponding to username: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v90);
          objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v127 = v88;
          v95 = objc_msgSend(v94, "removeControllerKeyPairForIdentifier:leaveTombstone:error:", v89, 1, &v127);
          v17 = v127;

          if ((v95 & 1) == 0)
          {
            v96 = (void *)MEMORY[0x227676638]();
            v97 = v91;
            HMFGetOSLogHandle();
            v98 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v138 = v99;
              v139 = 2112;
              v140 = v89;
              v141 = 2112;
              v142 = v17;
              _os_log_impl(&dword_2218F0000, v98, OS_LOG_TYPE_INFO, "%{public}@Failed to delete extra key for username: %@ due to error: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v96);
          }
          ++v87;
          v88 = v17;
        }
        while (v85 != v87);
        v85 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
      }
      while (v85);
    }

    v11 = v117;
    v12 = v114;
    v34 = v111;
    v15 = v113;
    v51 = v122;
    goto LABEL_75;
  }
  v104 = (void *)MEMORY[0x227676638]();
  v105 = a1;
  HMFGetOSLogHandle();
  v106 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v123 = v51;
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v138 = v107;
    _os_log_impl(&dword_2218F0000, v106, OS_LOG_TYPE_INFO, "%{public}@Not deleting extra keys as it has not been requested", buf, 0xCu);

    v51 = v123;
  }

  objc_autoreleasePoolPop(v104);
LABEL_81:
  v35 = v51;
LABEL_82:

  return v35;
}

+ (BOOL)hasControllerKeyWithUsername:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  BOOL v11;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = 0;
  v8 = objc_msgSend(v7, "getAllAvailableControllerPublicKeys:secretKeys:userNames:error:", 0, 0, &v25, &v24);
  v9 = v25;
  v10 = v24;

  if (v8)
    v11 = v10 == 0;
  else
    v11 = 0;
  if (!v11 || v9 == 0)
  {
    if (v10)
    {
      if (a4)
      {
        v13 = objc_retainAutorelease(v10);
LABEL_20:
        v18 = 0;
        *a4 = v13;
        goto LABEL_22;
      }
LABEL_21:
      v18 = 0;
      goto LABEL_22;
    }
LABEL_16:
    v19 = (void *)MEMORY[0x227676638]();
    v20 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Did not find controller key for given username.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (!objc_msgSend(v9, "containsObject:", v6))
    goto LABEL_16;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = a1;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v17;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Found controller key for username", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  v18 = 1;
LABEL_22:

  return v18;
}

+ (id)controllerUsernameForPairingIdentity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  BOOL v11;
  BOOL v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = 0;
  v8 = objc_msgSend(v7, "getAllAvailableControllerPublicKeys:secretKeys:userNames:error:", &v29, 0, &v28, a4);
  v9 = v29;
  v10 = v28;

  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  v12 = v11 || v10 == 0;
  if (v12 || (v13 = objc_msgSend(v10, "count"), v13 != objc_msgSend(v9, "count")))
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = a1;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
LABEL_16:

      objc_autoreleasePoolPop(v20);
      v19 = 0;
      goto LABEL_17;
    }
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v23;
    v24 = "%{public}@Unable to get controller public keys";
    v25 = v22;
    v26 = OS_LOG_TYPE_INFO;
LABEL_15:
    _os_log_impl(&dword_2218F0000, v25, v26, v24, buf, 0xCu);

    goto LABEL_16;
  }
  if (objc_msgSend(v10, "count") != 1)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = a1;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v23;
    v24 = "%{public}@Found multiple controller keys.";
    v25 = v22;
    v26 = OS_LOG_TYPE_ERROR;
    goto LABEL_15;
  }
  v14 = objc_alloc(MEMORY[0x24BE3F230]);
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithPairingKeyData:", v15);

  objc_msgSend(v6, "publicKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  v19 = 0;
  if (v18)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_17:
  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t49_87877 != -1)
    dispatch_once(&logCategory__hmf_once_t49_87877, &__block_literal_global_87878);
  return (id)logCategory__hmf_once_v50_87879;
}

void __33__HMDPersistentStore_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v50_87879;
  logCategory__hmf_once_v50_87879 = v0;

}

- (id)writeData:(id)a3 toStorePath:(id)a4 dataLabel:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "writeData:toStorePath:dataLabel:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)archiveDictionary:(id)a3 withPath:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDPersistentStore *v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v23;
  void *context;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  context = (void *)MEMORY[0x227676638]();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v10);

  }
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("archive data with path: %@"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_writeData:toStorePath:dataLabel:", v14, v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = v8;
    v20 = v10;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v21;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@HMDPersistentStore %@ with size: %@", buf, 0x20u);

    v10 = v20;
    v8 = v23;
  }

  objc_autoreleasePoolPop(v17);
  objc_autoreleasePoolPop(context);

  return v16;
}

- (id)unarchiveDictionaryWithPath:(id)a3 allowedClasses:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  objc_msgSend((id)objc_opt_class(), "readDataFromPath:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || objc_msgSend(0, "length"))
  {
    -[HMDPersistentStore unarchiveDictionaryFromData:allowedClasses:forKey:](self, "unarchiveDictionaryFromData:allowedClasses:forKey:", v12, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_autoreleasePoolPop(v11);

  return v13;
}

- (id)unarchiveDictionaryFromData:(id)a3 allowedClasses:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMDPersistentStore *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  HMDPersistentStore *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v12, v8, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  if (!v13)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2112;
      v27 = v14;
      v20 = "%{public}@Failed to unarchive data: %@";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v16);
    v15 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v13, "objectForKey:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
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
      v25 = v19;
      v26 = 2112;
      v27 = v9;
      v20 = "%{public}@Key %@ not found in unarchived data";
LABEL_7:
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v15;
}

@end
