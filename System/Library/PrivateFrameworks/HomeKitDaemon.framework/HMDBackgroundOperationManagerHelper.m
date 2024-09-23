@implementation HMDBackgroundOperationManagerHelper

+ (id)homeManager
{
  void *v2;
  void *v3;

  +[HMDMainDriver driver](HMDMainDriver, "driver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)auditSharedUserEntriesInDatabase:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE3F268], "defaultScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabase___block_invoke;
  v8[3] = &unk_24E797C10;
  v9 = v4;
  v10 = a1;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "performWithQualityOfService:block:", 9, v8);

}

+ (void)auditSharedUserEntriesInDatabaseForAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  _BYTE buf[18];
  __int16 v18;
  __int128 *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(a1, "checkAndRaiseFaultIfHH2KeyIsMissing"))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = a1;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v4, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v16 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      v18 = 2096;
      v19 = &v16;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot audit shared user entries in Database for accessory : %{uuid_t}.16P due to missing HH2 key", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F268], "defaultScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __84__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForAccessory___block_invoke;
    v13[3] = &unk_24E797C10;
    v14 = v4;
    v15 = a1;
    v12 = (id)objc_msgSend(v11, "performWithQualityOfService:block:", 9, v13);

  }
}

+ (void)addPairingOnAllAccessoriesOfHome:(id)a3 forSharedUser:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isOwner"))
    _HMFPreconditionFailure();
  v8 = (void *)MEMORY[0x227676638]();
  v9 = a1;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v11;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Scheduling add accessory pairing operation for shared user: %@ / %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __86__HMDBackgroundOperationManagerHelper_addPairingOnAllAccessoriesOfHome_forSharedUser___block_invoke;
  v19 = &unk_24E795608;
  v20 = v7;
  v21 = v9;
  v13 = v7;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v16);

  objc_msgSend(v6, "homeManager", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bgOpsManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "evaluateOperations");

}

+ (void)removePairingOnAllAccessoriesOfHome:(id)a3 forSharedUser:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isAllowedToAddOrRemoveHAPPairingsOnAccessory") & 1) != 0)
  {
    if (objc_msgSend(v7, "isOwner"))
      _HMFPreconditionFailure();
    v8 = (void *)MEMORY[0x227676638]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v11;
      v33 = 2112;
      v34 = v7;
      v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Scheduling remove accessory pairing operation for shared user : %@ / %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contextWithHomeUUID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __89__HMDBackgroundOperationManagerHelper_removePairingOnAllAccessoriesOfHome_forSharedUser___block_invoke;
    v26 = &unk_24E795658;
    v15 = v6;
    v27 = v15;
    v30 = v9;
    v28 = v7;
    v29 = v14;
    v16 = v14;
    objc_msgSend(v16, "performBlockWithPinnedQueryGeneration:", &v23);
    objc_msgSend(v15, "homeManager", v23, v24, v25, v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bgOpsManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "evaluateOperations");

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v22;
      v33 = 2112;
      v34 = v6;
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Not allowed to remove pairings for all the accessories of the home: %@, sharedUser: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
  }

}

+ (void)auditSharedUserEntriesInDatabaseForHome:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "checkAndRaiseFaultIfHH2KeyIsMissing");
  v9 = (void *)MEMORY[0x227676638]();
  v10 = a1;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v16;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Going to audit shared user entries in database for home : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contextWithHomeUUID:", v18);
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke;
    v19[3] = &unk_24E7980F8;
    v20 = v6;
    v22 = v10;
    v21 = v7;
    objc_msgSend(v14, "performBlockWithPinnedQueryGeneration:", v19);

    v15 = v20;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v13;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot trigger audit for shared users for %@ due to missing HH2 controller key", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v14 = (void (**)(_QWORD, _QWORD))_Block_copy(v7);
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v14)[2](v14, v15);
LABEL_9:

  }
}

+ (void)dumpUsers:(id)a3 usingTag:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__HMDBackgroundOperationManagerHelper_dumpUsers_usingTag___block_invoke;
  v8[3] = &unk_24E7956D0;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);

}

+ (void)scheduleFullAuditForAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  HMDAuditAccessoryPairingOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAuditAccessoryPairingOperation *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(a1, "checkAndRaiseFaultIfHH2KeyIsMissing"))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = a1;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "modelID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v8;
      v27 = 2112;
      v28 = v9;
      v10 = "%{public}@Cannot audit shared user entries in Database for accessory : %@ due to missing HH2 key";
LABEL_9:
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v25, 0x16u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = a1;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v8;
      v27 = 2112;
      v28 = v9;
      v10 = "%{public}@Cannot audit the accessory with nil identifier. Ignoring audit for : %@";
      goto LABEL_9;
    }
LABEL_10:

    objc_autoreleasePoolPop(v5);
    goto LABEL_15;
  }
  v12 = [HMDAuditAccessoryPairingOperation alloc];
  objc_msgSend(v4, "modelID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "modelID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDAuditAccessoryPairingOperation initWithAccessoryUUID:accessoryIdentifier:homeUUIDWhereAccessoryWasPaired:](v12, "initWithAccessoryUUID:accessoryIdentifier:homeUUIDWhereAccessoryWasPaired:", v13, v14, v16);

  if (v17)
  {
    objc_msgSend(a1, "homeManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bgOpsManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addOperation:", v17);

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = a1;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "modelID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v23;
      v27 = 2112;
      v28 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audit pairing operation for : %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
  }

LABEL_15:
}

+ (void)scheduleAddPairingForAccessory:(id)a3 forSharedUser:(id)a4
{
  id v6;
  HMDAddAccessoryPairingSharedUserOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  HMDAddAccessoryPairingSharedUserOperation *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  HMDAddAccessoryPairingSharedUserOperation *v28;
  HMDAddAccessoryPairingSharedUserOperation *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  HMDAddAccessoryPairingSharedUserOperation *v36;
  const char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint32_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint32_t v43;
  HMDAddAccessoryPairingSharedUserOperation *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  id v49;
  uint64_t v50;
  HMDAddAccessoryPairingSharedUserOperation *v51;
  void *v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  HMDAddAccessoryPairingSharedUserOperation *v56;
  __int16 v57;
  HMDAddAccessoryPairingSharedUserOperation *v58;
  __int16 v59;
  HMDAddAccessoryPairingSharedUserOperation *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (HMDAddAccessoryPairingSharedUserOperation *)a4;
  objc_msgSend(v6, "castIfHAPAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && isBridgedAccessory(v8))
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v14 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v54 = v13;
      v55 = 2112;
      v56 = v14;
      v57 = 2112;
      v58 = v7;
      v15 = "%{public}@(a) Not scheduling add pairing operation for accessory: %@ and user: %@";
LABEL_17:
      v41 = v12;
      v42 = OS_LOG_TYPE_ERROR;
      v43 = 32;
LABEL_18:
      _os_log_impl(&dword_2218F0000, v41, v42, v15, buf, v43);
LABEL_19:

      goto LABEL_20;
    }
    goto LABEL_20;
  }
  -[HMDAddAccessoryPairingSharedUserOperation privilege](v7, "privilege");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  -[HMDAddAccessoryPairingSharedUserOperation privilege](v7, "privilege");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18 || v17 == 2)
  {

  }
  else
  {

    if (v17 != 3)
    {
      objc_msgSend(v6, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v10 = (void *)MEMORY[0x227676638]();
        v11 = a1;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          goto LABEL_20;
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "modelID");
        v14 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v44 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v54 = v13;
        v55 = 2112;
        v56 = v14;
        v57 = 2112;
        v58 = v44;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@(a) Cannot add pairing for mkfAccessory without critical data, modelID: %@ ... identifier: %@", buf, 0x20u);

        goto LABEL_19;
      }
      if (!+[HMDUser isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:](HMDUser, "isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:", v7))
      {
        v10 = (void *)MEMORY[0x227676638]();
        v11 = a1;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          goto LABEL_20;
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAddAccessoryPairingSharedUserOperation modelID](v7, "modelID");
        v14 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v13;
        v55 = 2112;
        v56 = v14;
        v15 = "%{public}@(a) Cannot create add pairing operation for user:%@ as not allowed by policy";
        v41 = v12;
        v42 = OS_LOG_TYPE_INFO;
        v43 = 22;
        goto LABEL_18;
      }
      -[HMDAddAccessoryPairingSharedUserOperation pairingIdentity](v7, "pairingIdentity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v45 = (void *)MEMORY[0x227676638]();
        v46 = a1;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v48;
          v55 = 2114;
          v56 = v7;
          _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_FAULT, "%{public}@(a) Cannot create add pairing operation for user %{public}@ with no pairingIdentity", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v45);
        goto LABEL_33;
      }
      v51 = [HMDAddAccessoryPairingSharedUserOperation alloc];
      objc_msgSend(v6, "modelID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAddAccessoryPairingSharedUserOperation modelID](v7, "modelID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "home");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "modelID");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v20;
      v27 = (void *)v25;
      v50 = v25;
      v28 = v51;
      v52 = v26;
      v29 = -[HMDAddAccessoryPairingSharedUserOperation initWithAccessoryUUID:accessoryIdentifier:forSharedUser:sharedUserPairingIdentity:asOwner:asSharedAdmin:homeUUIDWhereAccessoryWasPaired:](v28, "initWithAccessoryUUID:accessoryIdentifier:forSharedUser:sharedUserPairingIdentity:asOwner:asSharedAdmin:homeUUIDWhereAccessoryWasPaired:", v21, v22, v23, v50);

      if (v29)
      {
        objc_msgSend(a1, "homeManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "bgOpsManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addOperation:", v29);

        v32 = (void *)MEMORY[0x227676638]();
        v33 = a1;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v36 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v54 = v35;
          v55 = 2112;
          v56 = v7;
          v57 = 2112;
          v58 = v29;
          v59 = 2112;
          v60 = v36;
          v37 = "%{public}@(a) Scheduled add pairing operation for shared user : %@, %@, asSharedAdmin: %@";
          v38 = v34;
          v39 = OS_LOG_TYPE_INFO;
          v40 = 42;
LABEL_31:
          _os_log_impl(&dword_2218F0000, v38, v39, v37, buf, v40);

        }
      }
      else
      {
        v32 = (void *)MEMORY[0x227676638]();
        v49 = a1;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v36 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v54 = v35;
          v55 = 2112;
          v56 = v7;
          v57 = 2112;
          v58 = v36;
          v37 = "%{public}@(a) Failed to create add pairing operation for shared user : %@, asSharedAdmin: %@";
          v38 = v34;
          v39 = OS_LOG_TYPE_ERROR;
          v40 = 32;
          goto LABEL_31;
        }
      }
      v20 = v52;

      objc_autoreleasePoolPop(v32);
LABEL_33:

      goto LABEL_21;
    }
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = a1;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAddAccessoryPairingSharedUserOperation privilege](v7, "privilege");
    v14 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v54 = v13;
    v55 = 2112;
    v56 = v7;
    v57 = 2112;
    v58 = v14;
    v15 = "%{public}@(a) Cannot create add pairing operation for user: %@ with privilege: %@";
    goto LABEL_17;
  }
LABEL_20:

  objc_autoreleasePoolPop(v10);
LABEL_21:

}

+ (void)scheduleAddPairingForAccessory:(id)a3 sharedUser:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  HMDAddAccessoryPairingSharedUserOperation *v16;
  HMDAddAccessoryPairingSharedUserOperation *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDAddAccessoryPairingSharedUserOperation *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  HMDAddAccessoryPairingSharedUserOperation *v34;
  HMDAddAccessoryPairingSharedUserOperation *v35;
  const char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint32_t v39;
  id v40;
  unsigned int v41;
  void *v42;
  HMDAddAccessoryPairingSharedUserOperation *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  HMDAddAccessoryPairingSharedUserOperation *v49;
  __int16 v50;
  HMDAddAccessoryPairingSharedUserOperation *v51;
  __int16 v52;
  HMDAddAccessoryPairingSharedUserOperation *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10 || (objc_msgSend(v10, "bridge"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    if ((objc_msgSend(v7, "isOwner") & 1) != 0 || objc_msgSend(v7, "isPending"))
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = a1;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v15;
      v46 = 2112;
      v47 = v7;
      v18 = "%{public}@(b) Failed to create add pairing operation for user: %@";
      v19 = v14;
      v20 = OS_LOG_TYPE_ERROR;
LABEL_12:
      _os_log_impl(&dword_2218F0000, v19, v20, v18, buf, 0x16u);
      goto LABEL_13;
    }
    if ((objc_msgSend(v7, "isAllowedToAddOrRemoveHAPPairingsOnAccessory") & 1) == 0)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = a1;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        goto LABEL_14;
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v15;
      v46 = 2112;
      v47 = v7;
      v18 = "%{public}@(b) Not allowed to add pairing for this user : %@";
      v19 = v14;
      v20 = OS_LOG_TYPE_INFO;
      goto LABEL_12;
    }
    v43 = [HMDAddAccessoryPairingSharedUserOperation alloc];
    objc_msgSend(v8, "uuid");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pairingIdentity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v7, "isAdministrator");
    objc_msgSend(v7, "home");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v22;
    v27 = -[HMDAddAccessoryPairingSharedUserOperation initWithAccessoryUUID:accessoryIdentifier:forSharedUser:sharedUserPairingIdentity:asOwner:asSharedAdmin:homeUUIDWhereAccessoryWasPaired:](v43, "initWithAccessoryUUID:accessoryIdentifier:forSharedUser:sharedUserPairingIdentity:asOwner:asSharedAdmin:homeUUIDWhereAccessoryWasPaired:", v42, v21, v22, v23, 0, v41, v25);

    if (v27)
    {
      objc_msgSend(a1, "homeManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bgOpsManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addOperation:", v27);

      v30 = (void *)MEMORY[0x227676638]();
      v31 = a1;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "isAdministrator");
        HMFBooleanToString();
        v34 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v35 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v45 = v33;
        v46 = 2112;
        v47 = v7;
        v48 = 2112;
        v49 = v27;
        v50 = 2112;
        v51 = v34;
        v52 = 2112;
        v53 = v35;
        v36 = "%{public}@(b) Scheduled add pairing operation for shared user : %@, %@, asSharedAdmin: %@, accessory: %@";
        v37 = v32;
        v38 = OS_LOG_TYPE_INFO;
        v39 = 52;
LABEL_24:
        _os_log_impl(&dword_2218F0000, v37, v38, v36, buf, v39);

      }
    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v40 = a1;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "isAdministrator");
        HMFBooleanToString();
        v34 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v35 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v45 = v33;
        v46 = 2112;
        v47 = v7;
        v48 = 2112;
        v49 = v34;
        v50 = 2112;
        v51 = v35;
        v36 = "%{public}@(b) Failed to create add pairing operation for shared user : %@, asSharedAdmin: %@, accessory: %@";
        v37 = v32;
        v38 = OS_LOG_TYPE_ERROR;
        v39 = 42;
        goto LABEL_24;
      }
    }

    objc_autoreleasePoolPop(v30);
    goto LABEL_15;
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = a1;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isAdministrator");
    HMFBooleanToString();
    v16 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v17 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v45 = v15;
    v46 = 2112;
    v47 = v7;
    v48 = 2112;
    v49 = v16;
    v50 = 2112;
    v51 = v17;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@(b) Not scheduling add pairing operation for shared user: %@, asSharedAdmin: %@, accessory: %@", buf, 0x2Au);

LABEL_13:
  }
LABEL_14:

  objc_autoreleasePoolPop(v12);
LABEL_15:

}

+ (void)scheduleRemovePairingForAccessory:(id)a3 forSharedUser:(id)a4
{
  id v6;
  HMDRemoveAccessoryPairingSharedUserOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  HMDRemoveAccessoryPairingSharedUserOperation *v14;
  void *v15;
  void *v16;
  HMDRemoveAccessoryPairingSharedUserOperation *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  HMDRemoveAccessoryPairingSharedUserOperation *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  HMDRemoveAccessoryPairingSharedUserOperation *v31;
  const char *v32;
  NSObject *v33;
  os_log_type_t v34;
  id v35;
  HMDRemoveAccessoryPairingSharedUserOperation *v36;
  void *v37;
  void *v38;
  HMDRemoveAccessoryPairingSharedUserOperation *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  HMDRemoveAccessoryPairingSharedUserOperation *v43;
  __int16 v44;
  HMDRemoveAccessoryPairingSharedUserOperation *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (HMDRemoveAccessoryPairingSharedUserOperation *)a4;
  objc_msgSend(v6, "castIfHAPAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || !isBridgedAccessory(v8))
  {
    objc_msgSend(v6, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (+[HMDUser isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:](HMDUser, "isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:", v7))
      {
        v38 = v9;
        -[HMDRemoveAccessoryPairingSharedUserOperation pairingIdentity](v7, "pairingIdentity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = [HMDRemoveAccessoryPairingSharedUserOperation alloc];
        objc_msgSend(v6, "modelID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[HMDRemoveAccessoryPairingSharedUserOperation isOwner](v7, "isOwner");
        v39 = v7;
        -[HMDRemoveAccessoryPairingSharedUserOperation modelID](v7, "modelID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "home");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "modelID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[HMDRemoveAccessoryPairingSharedUserOperation initWithAccessoryUUID:accessoryIdentifier:isOwnerIdentity:forSharedUser:sharedUserPairingIdentity:homeUUIDWhereAccessoryWasPaired:](v17, "initWithAccessoryUUID:accessoryIdentifier:isOwnerIdentity:forSharedUser:sharedUserPairingIdentity:homeUUIDWhereAccessoryWasPaired:", v18, v19, v20, v21, v16, v23);

        if (v24)
        {
          objc_msgSend(a1, "homeManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "bgOpsManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addOperation:", v24);

          v27 = (void *)MEMORY[0x227676638]();
          v28 = a1;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v41 = v30;
            v42 = 2112;
            v7 = v39;
            v43 = v39;
            v44 = 2112;
            v45 = v24;
            _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@(a) Scheduled remove pairing operation for shared user : %@, %@", buf, 0x20u);
LABEL_19:

LABEL_21:
            v9 = v38;

            objc_autoreleasePoolPop(v27);
            goto LABEL_22;
          }
        }
        else
        {
          v27 = (void *)MEMORY[0x227676638]();
          v35 = a1;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "modelID");
            v36 = (HMDRemoveAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "identifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v41 = v30;
            v42 = 2112;
            v7 = v39;
            v43 = v39;
            v44 = 2112;
            v45 = v36;
            v46 = 2112;
            v47 = v37;
            _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@(a) Failed to create remove pairing operation for shared user : %@, %@/%@", buf, 0x2Au);

            goto LABEL_19;
          }
        }
        v7 = v39;
        goto LABEL_21;
      }
      v10 = (void *)MEMORY[0x227676638]();
      v11 = a1;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugDescription");
      v14 = (HMDRemoveAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
      -[HMFObject debugDescription](v7, "debugDescription");
      v31 = (HMDRemoveAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v13;
      v42 = 2112;
      v43 = v14;
      v44 = 2112;
      v45 = v31;
      v32 = "%{public}@(a) Not allowed to remove pairing for mkfAccessory: %@, shared user: %@";
      v33 = v12;
      v34 = OS_LOG_TYPE_INFO;
    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = a1;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modelID");
      v14 = (HMDRemoveAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v31 = (HMDRemoveAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v13;
      v42 = 2112;
      v43 = v14;
      v44 = 2112;
      v45 = v31;
      v32 = "%{public}@(a) Cannot remove pairing for mkfAccessory without critical data, modelID: %@ ... identifier: %@";
      v33 = v12;
      v34 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_2218F0000, v33, v34, v32, buf, 0x20u);

    goto LABEL_15;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = a1;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v14 = (HMDRemoveAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v13;
    v42 = 2112;
    v43 = v14;
    v44 = 2112;
    v45 = v7;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@(a) Not scheduling remove pairing operation for accessory: %@ and shared user: %@", buf, 0x20u);
LABEL_15:

  }
LABEL_16:

  objc_autoreleasePoolPop(v10);
LABEL_22:

}

+ (void)scheduleRemovePairingForAccessory:(id)a3 sharedUser:(id)a4
{
  id v6;
  HMDRemoveAccessoryPairingSharedUserOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  HMDRemoveAccessoryPairingSharedUserOperation *v14;
  void *v15;
  HMDRemoveAccessoryPairingSharedUserOperation *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDRemoveAccessoryPairingSharedUserOperation *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint32_t v34;
  HMDRemoveAccessoryPairingSharedUserOperation *v35;
  id v36;
  void *v37;
  HMDRemoveAccessoryPairingSharedUserOperation *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  HMDRemoveAccessoryPairingSharedUserOperation *v42;
  __int16 v43;
  HMDRemoveAccessoryPairingSharedUserOperation *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (HMDRemoveAccessoryPairingSharedUserOperation *)a4;
  objc_msgSend(v6, "castIfHAPAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && isBridgedAccessory(v8))
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v14 = (HMDRemoveAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v13;
      v41 = 2112;
      v42 = v14;
      v43 = 2112;
      v44 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@(b) Not scheduling remove pairing operation for accessory: %@ and shared user: %@", buf, 0x20u);
LABEL_12:

LABEL_15:
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  objc_msgSend(v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if ((-[HMDRemoveAccessoryPairingSharedUserOperation isAllowedToAddOrRemoveHAPPairingsOnAccessory](v7, "isAllowedToAddOrRemoveHAPPairingsOnAccessory") & 1) == 0)
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
        v40 = v13;
        v41 = 2112;
        v42 = v7;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@(b) Cannot remove pairing for user as not allowed by policy: %@", buf, 0x16u);
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    v37 = v9;
    v16 = [HMDRemoveAccessoryPairingSharedUserOperation alloc];
    objc_msgSend(v6, "modelID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMDRemoveAccessoryPairingSharedUserOperation isOwner](v7, "isOwner");
    -[HMDRemoveAccessoryPairingSharedUserOperation uuid](v7, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v7;
    -[HMDRemoveAccessoryPairingSharedUserOperation pairingIdentity](v7, "pairingIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "modelID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HMDRemoveAccessoryPairingSharedUserOperation initWithAccessoryUUID:accessoryIdentifier:isOwnerIdentity:forSharedUser:sharedUserPairingIdentity:homeUUIDWhereAccessoryWasPaired:](v16, "initWithAccessoryUUID:accessoryIdentifier:isOwnerIdentity:forSharedUser:sharedUserPairingIdentity:homeUUIDWhereAccessoryWasPaired:", v17, v18, v19, v20, v21, v23);

    if (v24)
    {
      objc_msgSend(a1, "homeManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bgOpsManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addOperation:", v24);

      v27 = (void *)MEMORY[0x227676638]();
      v28 = a1;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v30;
        v41 = 2112;
        v7 = v38;
        v42 = v38;
        v43 = 2112;
        v44 = v24;
        v31 = "%{public}@(b) Scheduled remove pairing operation for shared user : %@, %@";
        v32 = v29;
        v33 = OS_LOG_TYPE_INFO;
        v34 = 32;
LABEL_19:
        _os_log_impl(&dword_2218F0000, v32, v33, v31, buf, v34);

LABEL_21:
        v9 = v37;

        objc_autoreleasePoolPop(v27);
        goto LABEL_22;
      }
    }
    else
    {
      v27 = (void *)MEMORY[0x227676638]();
      v36 = a1;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v30;
        v41 = 2112;
        v7 = v38;
        v42 = v38;
        v31 = "%{public}@(b) Failed to create remove pairing operation for shared user : %@";
        v32 = v29;
        v33 = OS_LOG_TYPE_ERROR;
        v34 = 22;
        goto LABEL_19;
      }
    }
    v7 = v38;
    goto LABEL_21;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = a1;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelID");
    v14 = (HMDRemoveAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v35 = (HMDRemoveAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v13;
    v41 = 2112;
    v42 = v14;
    v43 = 2112;
    v44 = v35;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@(b) Cannot remove pairing for mkfAccessory without critical data, modelID: %@ ... identifier: %@", buf, 0x20u);

    goto LABEL_12;
  }
LABEL_16:

  objc_autoreleasePoolPop(v10);
LABEL_22:

}

+ (void)_scheduleRemovePairingForAccessory:(id)a3 usingPairingIdentity:(id)a4
{
  id v6;
  HMDRemoveAccessoryPairingSharedUserOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  HMDRemoveAccessoryPairingSharedUserOperation *v14;
  void *v15;
  HMDRemoveAccessoryPairingSharedUserOperation *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDRemoveAccessoryPairingSharedUserOperation *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  HMDRemoveAccessoryPairingSharedUserOperation *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (HMDRemoveAccessoryPairingSharedUserOperation *)a4;
  objc_msgSend(v6, "castIfHAPAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && isBridgedAccessory(v8))
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v14 = (HMDRemoveAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v13;
      v34 = 2112;
      v35 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@(c) Not scheduling remove pairing operation for accessory: %@", (uint8_t *)&v32, 0x16u);
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  objc_msgSend(v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = [HMDRemoveAccessoryPairingSharedUserOperation alloc];
    objc_msgSend(v6, "modelID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "modelID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HMDRemoveAccessoryPairingSharedUserOperation initWithAccessoryUUID:accessoryIdentifier:isOwnerIdentity:forSharedUser:sharedUserPairingIdentity:homeUUIDWhereAccessoryWasPaired:](v16, "initWithAccessoryUUID:accessoryIdentifier:isOwnerIdentity:forSharedUser:sharedUserPairingIdentity:homeUUIDWhereAccessoryWasPaired:", v17, v18, 0, 0, v7, v20);

    if (v21)
    {
      objc_msgSend(a1, "homeManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bgOpsManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addOperation:", v21);

      v24 = (void *)MEMORY[0x227676638]();
      v25 = a1;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543618;
        v33 = v27;
        v34 = 2112;
        v35 = v21;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@(c) Scheduled remove pairing operation for pairing identity : %@", (uint8_t *)&v32, 0x16u);
LABEL_15:

      }
    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v29 = a1;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "modelID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138544130;
        v33 = v27;
        v34 = 2112;
        v35 = v7;
        v36 = 2112;
        v37 = v30;
        v38 = 2112;
        v39 = v31;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@(c) Failed to create remove pairing operation for pairing identity : %@, %@/%@", (uint8_t *)&v32, 0x2Au);

        goto LABEL_15;
      }
    }

    objc_autoreleasePoolPop(v24);
    goto LABEL_17;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = a1;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelID");
    v14 = (HMDRemoveAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543874;
    v33 = v13;
    v34 = 2112;
    v35 = v14;
    v36 = 2112;
    v37 = v28;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@(c) Cannot remove pairing for mkfAccessory without critical data, modelID: %@ ... identifier: %@", (uint8_t *)&v32, 0x20u);

    goto LABEL_11;
  }
LABEL_12:

  objc_autoreleasePoolPop(v10);
LABEL_17:

}

+ (BOOL)didAuditTimeExpiredOnThisAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "lastPairingAuditTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "lastPairingAuditTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[HMDBackgroundOperationManagerHelper shouldWeAuditFromLastAudit:](HMDBackgroundOperationManagerHelper, "shouldWeAuditFromLastAudit:", v5);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

+ (void)removeAllUsersFromAccessory:(id)a3 withCompletionHandler:(id)a4
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
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  v10 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v9)
  {
    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(CFSTR("MatterTTU"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)|| _os_feature_enabled_impl())
    {
      objc_msgSend(v9, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(25, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F168]), "initWithQueue:", v28);
      v15 = (void *)MEMORY[0x227676638]();
      v16 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = v13;
        v18 = v12;
        v19 = v7;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v20;
        v36 = 2112;
        v37 = v21;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Removing Matter users from accessory: %@", buf, 0x16u);

        v7 = v19;
        v12 = v18;
        v13 = v27;
      }

      objc_autoreleasePoolPop(v15);
      objc_msgSend(v13, "removeUsersFromAccessory:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __89__HMDBackgroundOperationManagerHelper_removeAllUsersFromAccessory_withCompletionHandler___block_invoke;
      v29[3] = &unk_24E7956F8;
      v33 = v16;
      v30 = v10;
      v31 = v9;
      v32 = v7;
      v23 = (id)objc_msgSend(v22, "inContext:then:", v14, v29);

    }
    else
    {
      +[HMDBackgroundOperationManagerHelper removeAllUsersFromHAPAccessory:withCompletionHandler:](HMDBackgroundOperationManagerHelper, "removeAllUsersFromHAPAccessory:withCompletionHandler:", v9, v7);
    }
  }
  else if (v12)
  {
    +[HMDBackgroundOperationManagerHelper removeAllUsersFromAirPlayAccessory:withCompletionHandler:](HMDBackgroundOperationManagerHelper, "removeAllUsersFromAirPlayAccessory:withCompletionHandler:", v12, v7);
  }
  else
  {
    v24 = v7;
    v25 = _Block_copy(v7);
    v26 = v25;
    if (v25)
      (*((void (**)(void *))v25 + 2))(v25);

    v7 = v24;
  }

}

+ (void)removeAllUsersFromHAPAccessory:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t (*v19)(uint64_t, uint64_t);
  BOOL v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void *v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *contexta;
  void *context;
  _QWORD v44[4];
  id v45;
  id v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  id v48;
  id v49;
  _QWORD aBlock[4];
  id v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  id v53;
  _QWORD *v54;
  _BYTE *v55;
  id v56;
  uint64_t v57;
  _QWORD v58[4];
  _BYTE buf[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "bridge");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Not scheduling any remove pairing operation for accessory: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v17 = (uint64_t (*)(uint64_t, uint64_t))_Block_copy(v7);
    v18 = v17;
    if (v17)
      (*((void (**)(uint64_t (*)(uint64_t, uint64_t)))v17 + 2))(v17);
  }
  else
  {
    objc_msgSend(v10, "home");
    v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    v18 = v19;
    if (v10)
      v20 = v19 == 0;
    else
      v20 = 1;
    if (v20)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = a1;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "shortDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2112;
        v60 = v18;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid instance of accessory: %@ or Home: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      v26 = _Block_copy(v7);
      v28 = v26;
      if (v26)
        (*((void (**)(void *))v26 + 2))(v26);
    }
    else
    {
      objc_msgSend(v19, "users");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "na_filter:", &__block_literal_global_224362);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_msgSend(v28, "count");
      if (v29)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v60 = __Block_byref_object_copy__224349;
        v61 = __Block_byref_object_dispose__224350;
        v62 = 0;
        v58[0] = 0;
        v58[1] = v58;
        v58[2] = 0x2020000000;
        v58[3] = 0;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke_45;
        aBlock[3] = &unk_24E795760;
        v54 = v58;
        v55 = buf;
        v56 = a1;
        v57 = v29;
        v30 = v8;
        v51 = v30;
        v31 = v18;
        v52 = v31;
        v53 = v7;
        v41 = _Block_copy(aBlock);
        objc_msgSend(v28, "sortedArrayUsingComparator:", &__block_literal_global_57_224351);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "reverseObjectEnumerator");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "allObjects");
        contexta = (void *)objc_claimAutoreleasedReturnValue();

        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke_48;
        v44[3] = &unk_24E7957B0;
        v49 = a1;
        v45 = v30;
        v46 = v10;
        v47 = v31;
        v34 = v41;
        v48 = v34;
        objc_msgSend(contexta, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v44);

        _Block_object_dispose(v58, 8);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        context = (void *)MEMORY[0x227676638]();
        v35 = a1;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "shortDescription");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v38;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@No admin users exist on this home. Not scheduling any remove pairing operation for accessory: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        v39 = _Block_copy(v7);
        v40 = v39;
        if (v39)
          (*((void (**)(void *))v39 + 2))(v39);

      }
    }

  }
}

+ (BOOL)didAuditTimeExpiredOnThisAirPlayAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "lastPairingAuditTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "lastPairingAuditTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[HMDBackgroundOperationManagerHelper shouldWeAuditFromLastAudit:](HMDBackgroundOperationManagerHelper, "shouldWeAuditFromLastAudit:", v5);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

+ (void)removeAllUsersFromAirPlayAccessory:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t (*v11)(uint64_t, uint64_t);
  BOOL v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id aBlock;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  id v44;
  _QWORD *v45;
  _BYTE *v46;
  id v47;
  uint64_t v48;
  _QWORD v49[4];
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  aBlock = a4;
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "home");
  v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription", aBlock);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2112;
      v51 = v11;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Invalid instance of airplay accessory: %@ or Home: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v18 = _Block_copy(aBlock);
    v20 = v18;
    if (v18)
      (*((void (**)(void *))v18 + 2))(v18);
  }
  else
  {
    objc_msgSend(v10, "users");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "na_filter:", &__block_literal_global_52_224347);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "count");
    if (v21)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v51 = __Block_byref_object_copy__224349;
      v52 = __Block_byref_object_dispose__224350;
      v53 = 0;
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x2020000000;
      v49[3] = 0;
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __96__HMDBackgroundOperationManagerHelper_removeAllUsersFromAirPlayAccessory_withCompletionHandler___block_invoke_53;
      v41[3] = &unk_24E795760;
      v45 = v49;
      v46 = buf;
      v47 = a1;
      v48 = v21;
      v22 = v7;
      v42 = v22;
      v43 = v11;
      v44 = aBlock;
      v23 = _Block_copy(v41);
      objc_msgSend(v20, "sortedArrayUsingComparator:", &__block_literal_global_57_224351);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "reverseObjectEnumerator");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "allObjects");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __96__HMDBackgroundOperationManagerHelper_removeAllUsersFromAirPlayAccessory_withCompletionHandler___block_invoke_54;
      v36[3] = &unk_24E7957F8;
      v40 = a1;
      v37 = v22;
      v38 = v9;
      v27 = v23;
      v39 = v27;
      objc_msgSend(v26, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v36);

      _Block_object_dispose(v49, 8);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = a1;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "shortDescription", aBlock);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v32;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@No admin users exist on this home. Not scheduling any remove pairing operation for accessory: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      v33 = _Block_copy(aBlock);
      v34 = v33;
      if (v33)
        (*((void (**)(void *))v33 + 2))(v33);

    }
  }

}

+ (BOOL)shouldWeAuditFromLastAudit:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;

  return v7 >= 604800.0;
}

+ (BOOL)checkAndRaiseFaultIfHH2KeyIsMissing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bgOpsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getHH2ControllerKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Missing HH2 Controller Key. Please Debug!!!", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
  return v5 == 0;
}

+ (void)makeSureToCreateBackUpOfHH2KeysIfNecessary:(id)a3
{
  HMDAuditHH2KeysForBackupOperation *v3;
  HMDAuditHH2KeysForBackupOperation *v4;
  id v5;

  v5 = a3;
  if (+[HMDAuditHH2KeysForBackupOperation shouldWeScheduleHH2KeyBackupOperation](HMDAuditHH2KeysForBackupOperation, "shouldWeScheduleHH2KeyBackupOperation"))
  {
    v3 = [HMDAuditHH2KeysForBackupOperation alloc];
    v4 = -[HMDBackgroundOperation initWithUserData:](v3, "initWithUserData:", MEMORY[0x24BDBD1B8]);
    objc_msgSend(v5, "addOperation:", v4);
    objc_msgSend(v5, "evaluateOperations");

  }
}

+ (void)auditAllRestrictedGuestAccessoriesForHome:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _BYTE *v17;
  id v18;
  _BYTE buf[24];
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isRestrictedGuestEnabled"))
  {
    objc_msgSend(v4, "restrictedGuests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hmf_isEmpty");

    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v10)
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@The home does not have any restricted guests", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      if (v10)
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v4;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting the full audit for accessories which are restricted for the home: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v20 = 0;
      objc_msgSend(v4, "backingStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __81__HMDBackgroundOperationManagerHelper_auditAllRestrictedGuestAccessoriesForHome___block_invoke;
      v15[3] = &unk_24E7955E0;
      v16 = v4;
      v17 = buf;
      v18 = v8;
      objc_msgSend(v14, "performBlockWithPinnedQueryGeneration:", v15);

      _Block_object_dispose(buf, 8);
    }
  }

}

+ (id)auditAllowedAccessToRestrictedGuest:(id)a3 forAccessories:(id)a4 shouldRemoveScheduledOperations:(BOOL)a5 parentFlow:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  if (v7)
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke;
    v31[3] = &unk_24E795860;
    v32 = v10;
    objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v31);

  }
  v15 = (void *)MEMORY[0x24BE3F180];
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2;
  v26[3] = &unk_24E7958B0;
  v27 = v13;
  v28 = v12;
  v29 = v10;
  v30 = a1;
  v16 = v10;
  v17 = v12;
  v18 = v13;
  objc_msgSend(v11, "na_map:", v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allSettled:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_70;
  v24[3] = &unk_24E797000;
  v25 = v11;
  v21 = v11;
  objc_msgSend(v20, "then:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)auditProhibitedAccessToRestrictedGuest:(id)a3 forAccessories:(id)a4 shouldRemoveScheduledOperations:(BOOL)a5 parentFlow:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  if (v7)
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke;
    v31[3] = &unk_24E795860;
    v32 = v10;
    objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v31);

  }
  v15 = (void *)MEMORY[0x24BE3F180];
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2;
  v26[3] = &unk_24E7958B0;
  v27 = v13;
  v28 = v12;
  v29 = v10;
  v30 = a1;
  v16 = v10;
  v17 = v12;
  v18 = v13;
  objc_msgSend(v11, "na_map:", v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allSettled:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_76;
  v24[3] = &unk_24E797000;
  v25 = v11;
  v21 = v11;
  objc_msgSend(v20, "then:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (void)removeAllScheduledOperationsForGuest:(id)a3 forAccessoryUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isRestrictedGuest"))
  {
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "homeManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bgOpsManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __93__HMDBackgroundOperationManagerHelper_removeAllScheduledOperationsForGuest_forAccessoryUUID___block_invoke;
    v11[3] = &unk_24E795928;
    v12 = v6;
    objc_msgSend(v10, "removeOperationsForAccessoryIdentifier:operationKind:withBlock:", v7, v8, v11);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t114 != -1)
    dispatch_once(&logCategory__hmf_once_t114, &__block_literal_global_79_224301);
  return (id)logCategory__hmf_once_v115;
}

void __50__HMDBackgroundOperationManagerHelper_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v115;
  logCategory__hmf_once_v115 = v0;

}

uint64_t __93__HMDBackgroundOperationManagerHelper_removeAllScheduledOperationsForGuest_forAccessoryUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = v5;
  if ((v5 || (v9 = v8) != 0) && (objc_msgSend(v9, "guestUUID"), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDBackgroundOperationManagerHelper removeAllScheduledOperationsForGuest:forAccessoryUUID:](HMDBackgroundOperationManagerHelper, "removeAllScheduledOperationsForGuest:forAccessoryUUID:", *(_QWORD *)(a1 + 32), a2);
}

id __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v43;
  uint64_t v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "findAccessoryUsing:fromHome:", v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v46 = v24;
      v47 = 2112;
      v48 = v3;
      v49 = 2112;
      v50 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Did not find the accessory with UUID : %@ in home: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    v26 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2020);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "futureWithError:", v9);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v6 = v4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  if ((isKindOfClass & 1) == 0 || (objc_msgSend(v6, "supportsAnyInPersonAccess") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v19 = (void *)v20;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "UUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "shortDescription");
    v37 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v46 = v36;
    v47 = 2112;
    v48 = v35;
    v49 = 2112;
    v50 = v13;
    v51 = 2112;
    v52 = v14;
    v53 = 2112;
    v54 = v15;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[ChildFlow: %@ Parent: %@] auditProhibitedAccessToRestrictedGuest with accessory: %@ and restricted guest:%@", buf, 0x34u);

    v10 = v37;
  }

  objc_autoreleasePoolPop(v10);
  v16 = -[HMDAuditProhibitedAccessoryForRestrictedGuestOperation initWithAccessory:restrictedGuest:]([HMDAuditProhibitedAccessoryForRestrictedGuestOperation alloc], "initWithAccessory:restrictedGuest:", v6, *(_QWORD *)(a1 + 48));
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 56), "homeManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAuditProhibitedAccessoryForRestrictedGuestOperation executeOperationWithHomeManager:flow:](v16, "executeOperationWithHomeManager:flow:", v17, v38);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_74;
    v39[3] = &unk_24E795900;
    v44 = *(_QWORD *)(a1 + 56);
    v40 = v38;
    v41 = v3;
    v42 = *(id *)(a1 + 48);
    v43 = v16;
    objc_msgSend(v18, "then:", v39);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "UUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "uuid");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v31;
      v47 = 2112;
      v48 = v32;
      v49 = 2112;
      v50 = v3;
      v51 = 2112;
      v52 = v33;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create audit prohibited accessory restricted guest operation for accessory: %@ and restricted guest: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v28);
    v34 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "futureWithError:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_16:
  return v19;
}

uint64_t __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_76(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2_77;
  v12 = &unk_24E7958D8;
  v13 = v6;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v9);

  v7 = (id)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return 1;
}

void __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2_77(uint64_t a1, void *a2, uint64_t a3)
{
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v8 && (isKindOfClass & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

  }
}

uint64_t __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_74(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138544130;
      v27 = v8;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Audit Prohibited restricted guest operation for accessory: %@ and restricted guest: %@ failed.", (uint8_t *)&v26, 0x2Au);

    }
    objc_autoreleasePoolPop(v5);
    if (objc_msgSend(v3, "shouldReschedule"))
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = *(id *)(a1 + 64);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "UUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138544130;
        v27 = v15;
        v28 = 2112;
        v29 = v16;
        v30 = 2112;
        v31 = v17;
        v32 = 2112;
        v33 = v18;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Resulted in an unexpected failure, will schedule work for accessory: %@ and guest %@.", (uint8_t *)&v26, 0x2Au);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(*(id *)(a1 + 64), "homeManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bgOpsManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addOperation:", *(_QWORD *)(a1 + 56));

    }
    objc_msgSend(v3, "error");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v24 = 2;
  }
  else
  {
    v24 = 1;
  }

  return v24;
}

uint64_t __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDBackgroundOperationManagerHelper removeAllScheduledOperationsForGuest:forAccessoryUUID:](HMDBackgroundOperationManagerHelper, "removeAllScheduledOperationsForGuest:forAccessoryUUID:", *(_QWORD *)(a1 + 32), a2);
}

id __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v43;
  uint64_t v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "findAccessoryUsing:fromHome:", v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v46 = v24;
      v47 = 2112;
      v48 = v3;
      v49 = 2112;
      v50 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Did not find the accessory with UUID : %@ in home: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    v26 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2020);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "futureWithError:", v9);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v6 = v4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  if ((isKindOfClass & 1) == 0 || (objc_msgSend(v6, "supportsAnyInPersonAccess") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v19 = (void *)v20;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "UUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "shortDescription");
    v37 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v46 = v36;
    v47 = 2112;
    v48 = v35;
    v49 = 2112;
    v50 = v13;
    v51 = 2112;
    v52 = v14;
    v53 = 2112;
    v54 = v15;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[ChildFlow: %@ Parent: %@] auditAllowedAccessToRestrictedGuest with accessory: %@ and restricted guest:%@", buf, 0x34u);

    v10 = v37;
  }

  objc_autoreleasePoolPop(v10);
  v16 = -[HMDAuditAllowedAccessoryForRestrictedGuestOperation initWithAccessory:restrictedGuest:]([HMDAuditAllowedAccessoryForRestrictedGuestOperation alloc], "initWithAccessory:restrictedGuest:", v6, *(_QWORD *)(a1 + 48));
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 56), "homeManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAuditAllowedAccessoryForRestrictedGuestOperation executeOperationWithHomeManager:flow:](v16, "executeOperationWithHomeManager:flow:", v17, v38);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_67;
    v39[3] = &unk_24E795888;
    v44 = *(_QWORD *)(a1 + 56);
    v40 = v38;
    v41 = v3;
    v42 = *(id *)(a1 + 48);
    v43 = v16;
    objc_msgSend(v18, "then:", v39);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "UUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "uuid");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v31;
      v47 = 2112;
      v48 = v32;
      v49 = 2112;
      v50 = v3;
      v51 = 2112;
      v52 = v33;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create audit allowed accessory restricted guest operation for accessory: %@ and restricted guest: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v28);
    v34 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "futureWithError:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_16:
  return v19;
}

uint64_t __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_70(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2_72;
  v12 = &unk_24E7958D8;
  v13 = v6;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v9);

  v7 = (id)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return 1;
}

void __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2_72(uint64_t a1, void *a2, uint64_t a3)
{
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v8 && (isKindOfClass & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

  }
}

uint64_t __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_67(uint64_t a1, void *a2)
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
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 64);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "credentialsRemoved");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 40);
    v33 = 138544130;
    v34 = v7;
    v35 = 2112;
    v36 = v8;
    v37 = 2112;
    v38 = v9;
    v39 = 2112;
    v40 = v10;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Audit allowed accessory operation had an end state for credentials to be removed as %@ for accessory: %@", (uint8_t *)&v33, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138544130;
      v34 = v15;
      v35 = 2112;
      v36 = v16;
      v37 = 2112;
      v38 = v17;
      v39 = 2112;
      v40 = v18;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Audit Allowed restricted guest operation for accessory: %@ and restricted guest: %@ failed.", (uint8_t *)&v33, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    if (objc_msgSend(v3, "shouldReschedule"))
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 64);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138544130;
        v34 = v22;
        v35 = 2112;
        v36 = v23;
        v37 = 2112;
        v38 = v24;
        v39 = 2112;
        v40 = v25;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Resulted in an unexpected failure, will schedule work for accessory: %@ and guest %@.", (uint8_t *)&v33, 0x2Au);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(*(id *)(a1 + 64), "homeManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bgOpsManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addOperation:", *(_QWORD *)(a1 + 56));

    }
    objc_msgSend(v3, "error");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      v30 = v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v31 = 2;
  }
  else
  {
    v31 = 1;
  }

  return v31;
}

void __81__HMDBackgroundOperationManagerHelper_auditAllRestrictedGuestAccessoriesForHome___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v53;
  id v54;
  void *v55;
  int v56;
  void *v57;
  id v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  os_log_type_t v65;
  const char *v66;
  void *v67;
  id v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  void *v82;
  void *v83;
  __int128 v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id obj;
  uint64_t v91;
  uint64_t v92;
  void *context;
  uint64_t v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint8_t buf[4];
  void *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  void *v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _QWORD v122[5];

  v1 = a1;
  v122[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v122[0] = objc_opt_class();
    v122[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v122, 2);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 32), "homeManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bgOpsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    objc_msgSend(v3, "accessories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
    if (!v92)
      goto LABEL_57;
    v7 = *(_QWORD *)v108;
    *(_QWORD *)&v6 = 138544130;
    v84 = v6;
    v94 = v1;
    v88 = v3;
    v89 = v5;
    v85 = *(_QWORD *)v108;
    while (1)
    {
      for (i = 0; i != v92; ++i)
      {
        if (*(_QWORD *)v108 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
        context = (void *)MEMORY[0x227676638]();
        if (objc_msgSend(v9, "hasRGCapableService"))
        {
          objc_msgSend(v9, "lastPairingAuditTimeForRG");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
            goto LABEL_10;
          v11 = (void *)v10;
          objc_msgSend(v9, "lastPairingAuditTimeForRG");
          v12 = v9;
          v13 = i;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = +[HMDBackgroundOperationManagerHelper shouldWeAuditFromLastAudit:](HMDBackgroundOperationManagerHelper, "shouldWeAuditFromLastAudit:", v14);

          i = v13;
          v9 = v12;

          if (v15)
          {
LABEL_10:
            v91 = i;
            objc_msgSend(v9, "modelID", v84);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "removeOperationsForAccessoryIdentifier:operationKind:", v16, v86);

            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "modelID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDBackgroundOperationManager findAccessoryUsing:fromHome:](HMDBackgroundOperationManager, "findAccessoryUsing:fromHome:", v17, *(_QWORD *)(v1 + 32));
            v18 = objc_claimAutoreleasedReturnValue();

            v98 = (void *)v18;
            if (v18)
            {
              v105 = 0u;
              v106 = 0u;
              v103 = 0u;
              v104 = 0u;
              v87 = v9;
              objc_msgSend(v9, "allowedGuests");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
              if (v20)
              {
                v21 = v20;
                v22 = *(id *)v104;
                v96 = *(id *)v104;
                do
                {
                  for (j = 0; j != v21; ++j)
                  {
                    if (*(id *)v104 != v22)
                      objc_enumerationMutation(v19);
                    v24 = *(void **)(v1 + 32);
                    objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * j), "modelID");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "userWithUUID:", v25);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v26 && objc_msgSend(v26, "isRestrictedGuest"))
                    {
                      v27 = (void *)MEMORY[0x227676638]();
                      v28 = *(id *)(v1 + 48);
                      HMFGetOSLogHandle();
                      v29 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "uuid");
                        v31 = v19;
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v98, "uuid");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        v112 = v30;
                        v113 = 2112;
                        v114 = v32;
                        v115 = 2112;
                        v116 = v33;
                        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Making sure guest's %@ credentials is on accessory %@", buf, 0x20u);

                        v19 = v31;
                        v22 = v96;

                        v1 = v94;
                      }

                      objc_autoreleasePoolPop(v27);
                      v34 = -[HMDAuditAllowedAccessoryForRestrictedGuestOperation initWithAccessory:restrictedGuest:]([HMDAuditAllowedAccessoryForRestrictedGuestOperation alloc], "initWithAccessory:restrictedGuest:", v98, v26);
                      if (v34)
                        objc_msgSend(v95, "addObject:", v34);

                    }
                  }
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
                }
                while (v21);
              }

              objc_msgSend(v88, "guests");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "asSet");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "allowedGuests");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "asSet");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "na_setByRemovingObjectsFromSet:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              v101 = 0u;
              v102 = 0u;
              v99 = 0u;
              v100 = 0u;
              v97 = v39;
              v40 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v99, v119, 16);
              if (v40)
              {
                v41 = v40;
                v42 = *(_QWORD *)v100;
                do
                {
                  for (k = 0; k != v41; ++k)
                  {
                    if (*(_QWORD *)v100 != v42)
                      objc_enumerationMutation(v97);
                    v44 = *(void **)(v1 + 32);
                    objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * k), "modelID");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "userWithUUID:", v45);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v46 && objc_msgSend(v46, "isRestrictedGuest"))
                    {
                      v47 = (void *)MEMORY[0x227676638]();
                      v48 = *(id *)(v1 + 48);
                      HMFGetOSLogHandle();
                      v49 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v46, "uuid");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v98, "uuid");
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        v112 = v50;
                        v113 = 2112;
                        v114 = v51;
                        v115 = 2112;
                        v116 = v52;
                        _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_INFO, "%{public}@Making sure guest's %@ credentials isn't on accessory %@", buf, 0x20u);

                        v1 = v94;
                      }

                      objc_autoreleasePoolPop(v47);
                      v53 = -[HMDAuditProhibitedAccessoryForRestrictedGuestOperation initWithAccessory:restrictedGuest:]([HMDAuditProhibitedAccessoryForRestrictedGuestOperation alloc], "initWithAccessory:restrictedGuest:", v98, v46);
                      if (v53)
                        objc_msgSend(v95, "addObject:", v53);

                    }
                  }
                  v41 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v99, v119, 16);
                }
                while (v41);
              }

              v54 = -[HMDPersistAuditAccessoryResultOperation initForRestrictedGuestWithAccessory:]([HMDPersistAuditAccessoryResultOperation alloc], "initForRestrictedGuestWithAccessory:", v98);
              if (v54)
              {
                objc_msgSend(v95, "addObject:", v54);
                v55 = (void *)objc_msgSend(v95, "copy");
                v56 = objc_msgSend(v89, "scheduleOperationsWithDependenciesOnEachOtherFromArray:", v55);

                v57 = (void *)MEMORY[0x227676638]();
                v58 = *(id *)(v1 + 48);
                HMFGetOSLogHandle();
                v59 = objc_claimAutoreleasedReturnValue();
                v60 = v59;
                i = v91;
                if (v56)
                {
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v98, "uuid");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v98, "identifier");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v84;
                    v112 = v61;
                    v113 = 2112;
                    v114 = v95;
                    v115 = 2112;
                    v116 = v62;
                    v117 = 2112;
                    v118 = v63;
                    v64 = v60;
                    v65 = OS_LOG_TYPE_INFO;
                    v66 = "%{public}@[RG] Successfully added the operations to the BGOperationManager : %@ for accessory: %@/%@";
                    goto LABEL_51;
                  }
                }
                else if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v98, "uuid");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v98, "identifier");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v84;
                  v112 = v61;
                  v113 = 2112;
                  v114 = v95;
                  v115 = 2112;
                  v116 = v62;
                  v117 = 2112;
                  v118 = v63;
                  v64 = v60;
                  v65 = OS_LOG_TYPE_ERROR;
                  v66 = "%{public}@[RG] Unable to schedule all the audit operations : %@ for accessory: %@/%@. Removing them";
LABEL_51:
                  _os_log_impl(&dword_2218F0000, v64, v65, v66, buf, 0x2Au);

                  v1 = v94;
                }

                objc_autoreleasePoolPop(v57);
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
              }
              else
              {
                v74 = (void *)MEMORY[0x227676638]();
                v75 = *(id *)(v1 + 48);
                HMFGetOSLogHandle();
                v76 = objc_claimAutoreleasedReturnValue();
                i = v91;
                if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v98, "shortDescription");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v112 = v77;
                  v113 = 2112;
                  v114 = v78;
                  _os_log_impl(&dword_2218F0000, v76, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audit pairing operation for accessory: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v74);
              }
              v3 = v88;

              v5 = v89;
              v7 = v85;
            }
            else
            {
              v67 = (void *)MEMORY[0x227676638]();
              v68 = *(id *)(v1 + 48);
              HMFGetOSLogHandle();
              v69 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v70 = objc_claimAutoreleasedReturnValue();
                v71 = v9;
                v72 = (void *)v70;
                objc_msgSend(v71, "debugDescription");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v112 = v72;
                v113 = 2112;
                v114 = v73;
                _os_log_impl(&dword_2218F0000, v69, OS_LOG_TYPE_ERROR, "%{public}@Strange: Couldn't find the accessory in the memory but exist in working store : %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v67);
              v5 = v89;
              v7 = v85;
              i = v91;
            }

          }
        }
        objc_autoreleasePoolPop(context);
      }
      v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
      if (!v92)
      {
LABEL_57:

        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24))
          objc_msgSend(v5, "evaluateOperations");

        goto LABEL_63;
      }
    }
  }
  v79 = (void *)MEMORY[0x227676638]();
  v80 = *(id *)(v1 + 48);
  HMFGetOSLogHandle();
  v81 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 32), "uuid");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v112 = v82;
    v113 = 2112;
    v114 = v83;
    _os_log_impl(&dword_2218F0000, v81, OS_LOG_TYPE_ERROR, "%{public}@Could not start audit for home as it was not found inside working store: %@", buf, 0x16u);

    v3 = 0;
  }

  objc_autoreleasePoolPop(v79);
LABEL_63:

}

void __96__HMDBackgroundOperationManagerHelper_removeAllUsersFromAirPlayAccessory_withCompletionHandler___block_invoke_53(uint64_t a1, void *a2)
{
  id *v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  id *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = v4;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v4)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(_QWORD *)(v6 + 40);
    v4 = (id *)(v6 + 40);
    if (!v7)
      objc_storeStrong(v4, a2);
  }
  v8 = (void *)MEMORY[0x227676638](v4);
  v9 = *(id *)(a1 + 72);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138544386;
    v35 = v11;
    v36 = 2112;
    v37 = v5;
    v38 = 2112;
    v39 = v12;
    v40 = 2112;
    v41 = v13;
    v42 = 2112;
    v43 = v14;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removed accessory pairing finished with error: %@, pairingsRemoved: (%@/%@), accessory: %@", (uint8_t *)&v34, 0x34u);

  }
  objc_autoreleasePoolPop(v8);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == *(_QWORD *)(a1 + 80))
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 72);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v19 = (id *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(*(id *)(a1 + 40), "users");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138544130;
      v35 = v18;
      v36 = 2112;
      v37 = v19;
      v38 = 2112;
      v39 = v22;
      v40 = 2112;
      v41 = v23;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Removed all pairings (%@/%@) from accessory %@", (uint8_t *)&v34, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    v24 = _Block_copy(*(const void **)(a1 + 48));
    v25 = v24;
    if (v24)
      (*((void (**)(void *))v24 + 2))(v24);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = *(id *)(a1 + 72);
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "shortDescription");
        v30 = (id *)objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v34 = 138543874;
        v35 = v29;
        v36 = 2112;
        v37 = v30;
        v38 = 2112;
        v39 = v31;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Since we could not remove all the pairings from the accessory: %@, let's schedule database audit on the database: %@", (uint8_t *)&v34, 0x20u);

      }
      objc_autoreleasePoolPop(v26);
      v32 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "homeManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "auditSharedUserEntriesInDatabase:", v33);

    }
  }

}

void __96__HMDBackgroundOperationManagerHelper_removeAllUsersFromAirPlayAccessory_withCompletionHandler___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pairingIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to perform remove pairing operation of accessory: %@ for user:  %@ / %@", (uint8_t *)&v11, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "removeUser:completionHandler:", v3, *(_QWORD *)(a1 + 48));

}

uint64_t __96__HMDBackgroundOperationManagerHelper_removeAllUsersFromAirPlayAccessory_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAdministrator");
}

void __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke_45(uint64_t a1, void *a2)
{
  id *v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  id *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = v4;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v4)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(_QWORD *)(v6 + 40);
    v4 = (id *)(v6 + 40);
    if (!v7)
      objc_storeStrong(v4, a2);
  }
  v8 = (void *)MEMORY[0x227676638](v4);
  v9 = *(id *)(a1 + 72);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138544386;
    v35 = v11;
    v36 = 2112;
    v37 = v5;
    v38 = 2112;
    v39 = v12;
    v40 = 2112;
    v41 = v13;
    v42 = 2112;
    v43 = v14;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Remove accessory pairing finished with error: %@, pairingsRemoved: (%@/%@), accessory: %@", (uint8_t *)&v34, 0x34u);

  }
  objc_autoreleasePoolPop(v8);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == *(_QWORD *)(a1 + 80))
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 72);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v19 = (id *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(*(id *)(a1 + 40), "users");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138544130;
      v35 = v18;
      v36 = 2112;
      v37 = v19;
      v38 = 2112;
      v39 = v22;
      v40 = 2112;
      v41 = v23;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Removed all pairings (%@/%@) from accessory %@", (uint8_t *)&v34, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    v24 = _Block_copy(*(const void **)(a1 + 48));
    v25 = v24;
    if (v24)
      (*((void (**)(void *))v24 + 2))(v24);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = *(id *)(a1 + 72);
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "shortDescription");
        v30 = (id *)objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v34 = 138543874;
        v35 = v29;
        v36 = 2112;
        v37 = v30;
        v38 = 2112;
        v39 = v31;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Since we could not remove all the pairings from the accessory: %@, let's schedule database audit on the database: %@", (uint8_t *)&v34, 0x20u);

      }
      objc_autoreleasePoolPop(v26);
      v32 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "homeManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "auditSharedUserEntriesInDatabase:", v33);

    }
  }

}

void __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke_48(uint64_t a1, void *a2)
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
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 64);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pairingIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to perform remove pairing operation of accessory: %@ for user:  %@ / %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke_49;
  v14[3] = &unk_24E795788;
  v19 = *(_QWORD *)(a1 + 64);
  v15 = v3;
  v11 = *(void **)(a1 + 40);
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = v3;
  objc_msgSend(v11, "performOperation:linkType:operationBlock:errorBlock:", 6, 0, v14, v12);

}

void __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke_49(uint64_t a1, void *a2)
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
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 64);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pairingIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138544130;
    v27 = v7;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to remove pairing %@ for user : %@ from accessory: %@", (uint8_t *)&v26, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "server");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isCurrentUser"))
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "pairingIdentity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v16;
      v28 = 2112;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Going to remove pairing for current user: %@ from accessory: %@", (uint8_t *)&v26, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 48), "workQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removePairingForCurrentControllerOnQueue:completion:", v20, *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "pairingIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pairingIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "publicKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "workQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removePairingIdentifier:pairingPublicKey:completionQueue:completionHandler:", v21, v24, v25, *(_QWORD *)(a1 + 56));

  }
}

uint64_t __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAdministrator");
}

uint64_t __89__HMDBackgroundOperationManagerHelper_removeAllUsersFromAccessory_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Finished removing Matter users from accessory: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  +[HMDBackgroundOperationManagerHelper removeAllUsersFromHAPAccessory:withCompletionHandler:](HMDBackgroundOperationManagerHelper, "removeAllUsersFromHAPAccessory:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  return 1;
}

void __58__HMDBackgroundOperationManagerHelper_dumpUsers_usingTag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "userID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "privilege");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@%@ : %@ (%@)", (uint8_t *)&v11, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);

}

void __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_17;
    v18 = &unk_24E795630;
    v20 = *(_QWORD *)(a1 + 48);
    v19 = v3;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v15);

    objc_msgSend(*(id *)(a1 + 32), "homeManager", v15, v16, v17, v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bgOpsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "evaluateOperations");

    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Did not find the home with model id : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  }
}

void __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  NSObject *v20;
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
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  os_log_type_t v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  id v60;
  uint64_t v61;
  _QWORD v62[4];
  id v63;
  id v64;
  uint64_t v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "castIfHAPAccessory");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "castIfAirPlayAccessory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5 | v4 && (!v4 || (isBridgedAccessory((void *)v4) & 1) == 0))
  {
    objc_msgSend((id)v4, "needsPairingAudit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
    {

LABEL_8:
      v8 = (void *)MEMORY[0x227676638]();
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v4, "needsPairingAudit");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "BOOLValue");
        HMFBooleanToString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v67 = v11;
        v68 = 2112;
        v69 = v4;
        v70 = 2112;
        v71 = v13;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory needs full audit: [%@] [needsAudit: %@]", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      v14 = *(void **)(a1 + 40);
      v15 = v4;
LABEL_19:
      objc_msgSend(v14, "scheduleFullAuditForAccessory:", v15);
      goto LABEL_20;
    }
    if (v4)
    {
      v7 = objc_msgSend(*(id *)(a1 + 40), "didAuditTimeExpiredOnThisAccessory:", v4);

      if ((v7 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_msgSend((id)v5, "needsPairingAudit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "BOOLValue") & 1) != 0)
    {

LABEL_16:
      v18 = (void *)MEMORY[0x227676638]();
      v19 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v5, "needsPairingAudit");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "BOOLValue");
        HMFBooleanToString();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v67 = v21;
        v68 = 2112;
        v69 = v5;
        v70 = 2112;
        v71 = v23;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Accessory needs full audit: [%@] [needsAudit: %@]", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v14 = *(void **)(a1 + 40);
      v15 = v5;
      goto LABEL_19;
    }
    if (v5)
    {
      v17 = objc_msgSend(*(id *)(a1 + 40), "didAuditTimeExpiredOnThisAirPlayAccessory:", v5);

      if ((v17 & 1) != 0)
        goto LABEL_16;
    }
    else
    {

    }
    v24 = (void *)MEMORY[0x227676638]();
    v25 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(*(id *)(a1 + 32), "users");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v26);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v27 = (void *)MEMORY[0x24BDBCEF0];
      v28 = (void *)v4;
    }
    else
    {
      if (!v5)
      {
        v30 = 0;
        goto LABEL_27;
      }
      v27 = (void *)MEMORY[0x24BDBCEF0];
      v28 = (void *)v5;
    }
    objc_msgSend(v28, "pairedUsers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
    objc_msgSend(*(id *)(a1 + 40), "dumpUsers:usingTag:", v53, CFSTR("Home users list"));
    objc_msgSend(*(id *)(a1 + 40), "dumpUsers:usingTag:", v30, CFSTR("paired users list"));
    v31 = (void *)objc_msgSend(v53, "mutableCopy");
    objc_msgSend(v31, "minusSet:", v30);
    objc_msgSend(*(id *)(a1 + 40), "dumpUsers:usingTag:", v31, CFSTR("Users to add"));
    v32 = (void *)objc_msgSend(v30, "mutableCopy");
    objc_msgSend(v32, "minusSet:", v53);
    objc_msgSend(*(id *)(a1 + 40), "dumpUsers:usingTag:", v32, CFSTR("Users to remove"));
    if (objc_msgSend(v31, "count") || objc_msgSend(v32, "count"))
    {
      if (!objc_msgSend(v31, "isEqualToSet:", v32))
      {
        v62[0] = MEMORY[0x24BDAC760];
        v62[1] = 3221225472;
        v62[2] = __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_27;
        v62[3] = &unk_24E795680;
        v41 = (id)v4;
        v42 = *(_QWORD *)(a1 + 40);
        v63 = v41;
        v65 = v42;
        v52 = v24;
        v43 = (id)v5;
        v64 = v43;
        objc_msgSend(v31, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v62);
        v58[0] = MEMORY[0x24BDAC760];
        v58[1] = 3221225472;
        v58[2] = __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_2;
        v58[3] = &unk_24E795680;
        v44 = v41;
        v45 = *(_QWORD *)(a1 + 40);
        v59 = v44;
        v61 = v45;
        v46 = v43;
        v60 = v46;
        objc_msgSend(v32, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v58);
        objc_msgSend(v44, "pairingsToRemove");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_3;
        v54[3] = &unk_24E7956A8;
        v48 = v44;
        v49 = *(_QWORD *)(a1 + 40);
        v55 = v48;
        v57 = v49;
        v50 = v46;
        v24 = v52;
        v56 = v50;
        objc_msgSend(v47, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v54);

LABEL_38:
        objc_autoreleasePoolPop(v24);
        goto LABEL_20;
      }
      v33 = (void *)MEMORY[0x227676638]();
      v34 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v51 = v33;
        v36 = v24;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v67 = v37;
        v68 = 2112;
        v69 = (uint64_t)v31;
        v70 = 2112;
        v71 = v32;
        v38 = "%{public}@Users to add & remove cannot be same : [Add: %@] [Remove: %@]";
        v39 = v35;
        v40 = OS_LOG_TYPE_ERROR;
LABEL_36:
        _os_log_impl(&dword_2218F0000, v39, v40, v38, buf, 0x20u);

        v24 = v36;
        v33 = v51;
      }
    }
    else
    {
      v33 = (void *)MEMORY[0x227676638]();
      v34 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v51 = v33;
        v36 = v24;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v67 = v37;
        v68 = 2112;
        v69 = (uint64_t)v31;
        v70 = 2112;
        v71 = v32;
        v38 = "%{public}@No users to add & remove : [Add: %@] [Remove: %@]";
        v39 = v35;
        v40 = OS_LOG_TYPE_INFO;
        goto LABEL_36;
      }
    }

    objc_autoreleasePoolPop(v33);
    goto LABEL_38;
  }
LABEL_20:

}

void __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (+[HMDUser isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:](HMDUser, "isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3 || (v3 = *(_QWORD *)(a1 + 40)) != 0)
      objc_msgSend(*(id *)(a1 + 48), "scheduleAddPairingForAccessory:forSharedUser:", v3, v4);
  }

}

void __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (+[HMDUser isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:](HMDUser, "isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3 || (v3 = *(_QWORD *)(a1 + 40)) != 0)
      objc_msgSend(*(id *)(a1 + 48), "scheduleRemovePairingForAccessory:forSharedUser:", v3, v4);
  }

}

void __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 || (v4 = *(_QWORD *)(a1 + 40)) != 0)
  {
    v5 = v3;
    objc_msgSend(*(id *)(a1 + 48), "_scheduleRemovePairingForAccessory:usingPairingIdentity:", v4, v3);
    v3 = v5;
  }

}

void __89__HMDBackgroundOperationManagerHelper_removePairingOnAllAccessoriesOfHome_forSharedUser___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __89__HMDBackgroundOperationManagerHelper_removePairingOnAllAccessoriesOfHome_forSharedUser___block_invoke_14;
    v25[3] = &unk_24E795630;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 56);
    v26 = v5;
    v27 = v6;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v25);

    v7 = *(void **)(a1 + 48);
    v24 = 0;
    v8 = objc_msgSend(v7, "save:", &v24);
    v9 = v24;
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v8 || v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v29 = v14;
        v30 = 2112;
        v31 = v23;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the pairingsToRemove on accessories for home : %@", buf, 0x16u);
        goto LABEL_11;
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "pairingIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v29 = v14;
      v30 = 2112;
      v31 = v16;
      v32 = 2112;
      v33 = v17;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully added [%@] to pairingsToRemove on all accessories of the home : %@", buf, 0x20u);

LABEL_11:
    }

    objc_autoreleasePoolPop(v10);
    goto LABEL_13;
  }
  v18 = (void *)MEMORY[0x227676638]();
  v19 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v21;
    v30 = 2112;
    v31 = v22;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Did not find the home with model id : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
LABEL_13:

}

void __89__HMDBackgroundOperationManagerHelper_removePairingOnAllAccessoriesOfHome_forSharedUser___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "castIfHAPAccessory");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "castIfAirPlayAccessory");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!(v3 | v4))
    goto LABEL_12;
  if (v3)
  {
    v6 = isBridgedAccessory((void *)v3);
    v4 = v3;
    if ((v6 & 1) != 0)
      goto LABEL_12;
  }
  else if (!v4)
  {
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend((id)v4, "pairingsToRemove");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "pairingIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  if (v3)
    v10 = (void *)v3;
  else
    v10 = v5;
  objc_msgSend(v10, "setPairingsToRemove:", v8);
  objc_msgSend(*(id *)(a1 + 40), "scheduleRemovePairingForAccessory:sharedUser:", v11, *(_QWORD *)(a1 + 32));

LABEL_12:
}

void __86__HMDBackgroundOperationManagerHelper_addPairingOnAllAccessoriesOfHome_forSharedUser___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (!v5)
  {
    if (!v8)
      goto LABEL_16;
    v16 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v17 = v8;
LABEL_15:
    objc_msgSend(v15, "scheduleAddPairingForAccessory:sharedUser:", v17, v16);
    goto LABEL_16;
  }
  objc_msgSend(v5, "bridge");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v17 = v5;
    goto LABEL_15;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v13;
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Not scheduling add pairing operation for accessory: %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
LABEL_16:

}

void __84__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  int v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _BYTE *v32;
  uint64_t v33;
  uint8_t v34[4];
  id v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  uint64_t v39;
  _BYTE buf[24];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isCurrentDeviceConfirmedPrimaryResident") & 1) == 0)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2112;
      v41 = v14;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Invalid home or this device is not a resident for home: %@. Not auditing the shared users for accessory: %@", buf, 0x20u);

    }
    goto LABEL_8;
  }
  v3 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "bridge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Not scheduling any audit pairing operation for accessory: %@", buf, 0x16u);

    }
LABEL_8:

    objc_autoreleasePoolPop(v7);
    goto LABEL_19;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v41) = 0;
  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contextWithHomeUUID:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __84__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForAccessory___block_invoke_5;
  v30[3] = &unk_24E7955E0;
  v18 = *(id *)(a1 + 32);
  v19 = *(_QWORD *)(a1 + 40);
  v31 = v18;
  v32 = buf;
  v33 = v19;
  v20 = (void *)MEMORY[0x227676638](objc_msgSend(v17, "performBlockWithPinnedQueryGeneration:", v30));
  v21 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v27 = &stru_24E79DB48;
    *(_DWORD *)v34 = 138543874;
    v35 = v23;
    v36 = 2112;
    if (!v24)
      v27 = CFSTR("NOT ");
    v37 = v27;
    v38 = 2112;
    v39 = v25;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@%@Going to audit pairings for accessory: %@", v34, 0x20u);

  }
  objc_autoreleasePoolPop(v20);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    objc_msgSend(v2, "homeManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bgOpsManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "evaluateOperations");

  }
  _Block_object_dispose(buf, 8);
LABEL_19:

}

void __84__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForAccessory___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHAPAccessoryWithModelID:](HMCContext, "findHAPAccessoryWithModelID:", v2);
  v3 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findAirPlayAccessoryWithModelID:](HMCContext, "findAirPlayAccessoryWithModelID:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v3 | v5)
  {
    if (v3)
    {
      v6 = (id)v3;
      objc_msgSend(v6, "needsPairingAudit");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "BOOLValue") & 1) != 0)
        v8 = 1;
      else
        v8 = objc_msgSend(*(id *)(a1 + 48), "didAuditTimeExpiredOnThisAccessory:", v6);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;

      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "shortDescription");
        v29 = v17;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "needsPairingAudit");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "BOOLValue");
        HMFBooleanToString();
        v31 = v16;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastPairingAuditTime");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v34 = v19;
        v35 = 2112;
        v36 = v20;
        v37 = 2112;
        v38 = (uint64_t)v22;
        v39 = 2112;
        v40 = v23;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Checking shared user entries audit for accessory: %@ [needsAudit: %@ - lastPairingAuditTime: %@]", buf, 0x2Au);

        v17 = v29;
        v16 = v31;

      }
    }
    else
    {
      if (!v5)
      {
        v6 = 0;
LABEL_19:
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          objc_msgSend(*(id *)(a1 + 48), "scheduleFullAuditForAccessory:", v6);

        goto LABEL_22;
      }
      v6 = (id)v5;
      objc_msgSend(v6, "needsPairingAudit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "BOOLValue") & 1) != 0)
        v15 = 1;
      else
        v15 = objc_msgSend(*(id *)(a1 + 48), "didAuditTimeExpiredOnThisAirPlayAccessory:", v6);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v15;

      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "needsPairingAudit");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v16;
        objc_msgSend(v30, "BOOLValue");
        HMFBooleanToString();
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastPairingAuditTime");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v34 = v28;
        v35 = 2112;
        v36 = v24;
        v37 = 2112;
        v38 = v25;
        v27 = (void *)v25;
        v39 = 2112;
        v40 = v26;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Checking shared user entries audit for airplay accessory: %@ [needsAudit: %@ - lastPairingAuditTime: %@]", buf, 0x2Au);

        v16 = v32;
      }
    }

    objc_autoreleasePoolPop(v16);
    goto LABEL_19;
  }
  v9 = (void *)MEMORY[0x227676638]();
  v10 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v12;
    v35 = 2112;
    v36 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Did not find the accessory model for %@ to audit", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
LABEL_22:

}

void __72__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[HMDBackgroundOperationManager findHomeWhereThisDeviceIsConfirmedPrimaryResident:](HMDBackgroundOperationManager, "findHomeWhereThisDeviceIsConfirmedPrimaryResident:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v2;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@This device is primary resident on home: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 40), "auditSharedUserEntriesInDatabaseForHome:withCompletionHandler:", v2, 0);
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@This device is not a resident on any home. Not auditing the shared users in database", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }

}

@end
