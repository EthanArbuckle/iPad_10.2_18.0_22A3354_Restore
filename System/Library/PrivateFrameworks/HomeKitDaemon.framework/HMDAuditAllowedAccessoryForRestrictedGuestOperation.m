@implementation HMDAuditAllowedAccessoryForRestrictedGuestOperation

- (HMDAuditAllowedAccessoryForRestrictedGuestOperation)initWithAccessory:(id)a3 restrictedGuest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v16;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  char v22;
  objc_super v23;
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pairingIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CFSTR("sharedUserUUIDKey");
    objc_msgSend(v7, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23.receiver = self;
    v23.super_class = (Class)HMDAuditAllowedAccessoryForRestrictedGuestOperation;
    v22 = 0;
    v16 = -[HMDAddAccessoryPairingOperation initWithAccessoryUUID:accessoryIdentifier:newPairingIdentity:homeUUIDWhereAccessoryWasPaired:asOwner:asAdmin:shouldUpdateKeyChainEntry:userData:](&v23, sel_initWithAccessoryUUID_accessoryIdentifier_newPairingIdentity_homeUUIDWhereAccessoryWasPaired_asOwner_asAdmin_shouldUpdateKeyChainEntry_userData_, v8, v9, v12, v13, 0, 0, v22, v15);

    v17 = v16;
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v20;
      v28 = 2112;
      v29 = v8;
      v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create add accessory pairing operation for accessory: %@/%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
  }

  return v17;
}

- (BOOL)mainWithError:(id *)a3
{
  void *v4;
  void *v5;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id *v33;
  id v34;
  void *v35;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v48;
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBackgroundOperation accessoryUUID](v6, "accessoryUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackgroundOperation userData](v6, "userData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sharedUserUUIDKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v55 = v8;
    v56 = 2112;
    v57 = v9;
    v58 = 2112;
    v59 = v10;
    v60 = 2112;
    v61 = v12;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Performing audit for allowed accessory [%@] for restricted guest [%@]", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  v13 = objc_alloc(MEMORY[0x24BE3F168]);
  dispatch_get_global_queue(21, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithQueue:", v14);

  v16 = (void *)MEMORY[0x24BE3F180];
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __69__HMDAuditAllowedAccessoryForRestrictedGuestOperation_mainWithError___block_invoke;
  v52[3] = &unk_24E79B238;
  v52[4] = v6;
  v17 = v4;
  v53 = v17;
  objc_msgSend(v16, "inContext:perform:", v15, v52);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = 0;
  v19 = objc_msgSend(v18, "waitForResult:orError:withTimeout:", &v51, &v50, 1.2e11);
  v20 = (void *)MEMORY[0x227676638]();
  v21 = v6;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v48 = v18;
    v23 = v15;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBackgroundOperation accessoryUUID](v21, "accessoryUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v55 = v24;
    v56 = 2112;
    v57 = v25;
    v58 = 2112;
    v59 = v26;
    v60 = 2112;
    v61 = v27;
    v62 = 2112;
    v63 = v50;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Finished adding the user from [%@] resulted in outcome: [%@] with error: [%@]", buf, 0x34u);

    v15 = v23;
    v18 = v48;
  }

  objc_autoreleasePoolPop(v20);
  if ((v19 & 1) == 0)
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = v21;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v38;
      v56 = 2112;
      v57 = v39;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Operation timed out", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    v33 = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 8);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_16:
    LOBYTE(v40) = 0;
    goto LABEL_24;
  }
  if (v50)
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = v21;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v55 = v31;
      v56 = 2112;
      v57 = v32;
      v58 = 2112;
      v59 = v50;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Operation should not have resulted in a rejected promise. File a radar. Operation failed to succeed with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);
    v33 = a3;
    if (a3)
    {
      v34 = objc_retainAutorelease(v50);
LABEL_15:
      LOBYTE(v40) = 0;
      *v33 = v34;
      goto LABEL_24;
    }
    goto LABEL_16;
  }
  objc_msgSend(v51, "error");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v42 = (void *)MEMORY[0x227676638]();
    v43 = v21;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v55 = v45;
      v56 = 2112;
      v57 = v46;
      v58 = 2112;
      v59 = v50;
      _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Operation failed to succeed with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v42);
    if (a3)
      *a3 = objc_retainAutorelease(v50);
    v40 = objc_msgSend(v51, "shouldReschedule") ^ 1;
  }
  else
  {
    LOBYTE(v40) = 1;
  }
LABEL_24:

  return v40;
}

- (NSUUID)guestUUID
{
  void *v2;
  void *v3;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v5;
  SEL v6;
  id v7;
  id v8;

  -[HMDBackgroundOperation userData](self, "userData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sharedUserUUIDKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return (NSUUID *)v3;
  v5 = (HMDAuditAllowedAccessoryForRestrictedGuestOperation *)_HMFPreconditionFailure();
  return (NSUUID *)-[HMDAuditAllowedAccessoryForRestrictedGuestOperation executeOperationWithHomeManager:flow:](v5, v6, v7, v8);
}

- (id)executeOperationWithHomeManager:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  BOOL v20;
  BOOL v21;
  void *v22;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  char v46;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v47;
  NSObject *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v71;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  void *contexta;
  void *contextb;
  void *context;
  void *contextc;
  id v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  void *v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDBackgroundOperation setHomeManager:](self, "setHomeManager:", v6);
  v8 = (void *)objc_opt_new();
  -[HMDBackgroundOperation userData](self, "userData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sharedUserUUIDKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "findUserWithUUID:fromHomeManager:", v10, v6);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_class();
  -[HMDAccessoryBackgroundOperation accessoryUUID](self, "accessoryUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "findAccessoryUsing:homeManager:", v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v14;
  v16 = (void *)v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v15;
  else
    v17 = 0;
  v18 = v17;

  v19 = -[HMDAccessoryBackgroundOperation accessoryOperationStatus](self, "accessoryOperationStatus");
  if (v18)
    v20 = v11 == 0;
  else
    v20 = 1;
  v21 = v20 || v19 == 0;
  v102 = v18;
  if (v21)
  {
    v22 = (void *)MEMORY[0x227676638](v19);
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUID");
      v97 = v10;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryUUID](v23, "accessoryUUID");
      contexta = v8;
      v92 = v6;
      v27 = v7;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryIdentifier](v23, "accessoryIdentifier");
      v29 = v15;
      v30 = v16;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v104 = v25;
      v105 = 2112;
      v106 = v26;
      v107 = 2112;
      v108 = v28;
      v109 = 2112;
      v110 = v31;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Required parameters does not exist to properly execute this operation : [%@/%@]", buf, 0x2Au);

      v16 = v30;
      v15 = v29;

      v7 = v27;
      v8 = contexta;
      v6 = v92;

      v10 = v97;
    }

    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setError:", v32);

    objc_msgSend(v8, "setShouldReschedule:", 1);
    goto LABEL_30;
  }
  if (v19 != 1)
  {
    if ((objc_msgSend(v18, "supportsAnyInPersonAccess") & 1) == 0)
    {
      v58 = (void *)MEMORY[0x227676638]();
      v59 = self;
      HMFGetOSLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUID");
        v95 = v16;
        v100 = v10;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shortDescription");
        v63 = v15;
        v64 = v6;
        v65 = v8;
        v66 = v7;
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v104 = v61;
        v105 = 2112;
        v106 = v62;
        v107 = 2112;
        v108 = v67;
        _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory [%@] does not support features that enforce access directly. Hence marking this operation as finished.", buf, 0x20u);

        v7 = v66;
        v8 = v65;
        v6 = v64;
        v15 = v63;

        v16 = v95;
        v10 = v100;

      }
      objc_autoreleasePoolPop(v58);
      v43 = (void *)MEMORY[0x24BDD1540];
      v44 = 48;
      goto LABEL_29;
    }
    objc_msgSend(v18, "home");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v46 = objc_msgSend(v16, "isRestrictedGuest");
      context = (void *)MEMORY[0x227676638]();
      v47 = self;
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
      if ((v46 & 1) != 0)
      {
        v94 = v16;
        if (v49)
        {
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "UUID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "shortDescription");
          v99 = v10;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "shortDescription");
          v86 = v15;
          v53 = v6;
          v54 = v8;
          v55 = v7;
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v104 = v50;
          v105 = 2112;
          v106 = v51;
          v107 = 2112;
          v108 = v52;
          v109 = 2112;
          v110 = v56;
          _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] All checks are completed, now attempting to audit allowed accessory [%@] with restricted guest [%@]", buf, 0x2Au);

          v7 = v55;
          v8 = v54;
          v6 = v53;
          v15 = v86;

          v10 = v99;
        }

        objc_autoreleasePoolPop(context);
        v57 = v102;
        v16 = v94;
        if (objc_msgSend(v102, "supportsCHIP"))
          -[HMDAuditAllowedAccessoryForRestrictedGuestOperation _auditMatterAccessory:forRestrictedGuest:inHome:flow:](v47, "_auditMatterAccessory:forRestrictedGuest:inHome:flow:", v102, v94, v45, v7);
        else
          -[HMDAuditAllowedAccessoryForRestrictedGuestOperation _auditHAPAccessory:forRestrictedGuest:inHome:flow:](v47, "_auditHAPAccessory:forRestrictedGuest:inHome:flow:", v102, v94, v45, v7);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
      if (v49)
      {
        HMFGetLogIdentifier();
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUID");
        v87 = v15;
        v83 = v10;
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v104 = v82;
        v105 = 2112;
        v106 = v84;
        v107 = 2112;
        v108 = v16;
        _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Cannot proceed with removing the user as it is not restricted guest. : %@", buf, 0x20u);

        v10 = v83;
        v15 = v87;

      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setError:", v85);

    }
    else
    {
      v71 = (void *)MEMORY[0x227676638]();
      v72 = self;
      HMFGetOSLogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        contextc = v71;
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUID");
        v96 = v16;
        v101 = v10;
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shortDescription");
        v76 = v15;
        v77 = v6;
        v78 = v8;
        v79 = v7;
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v104 = v74;
        v105 = 2112;
        v106 = v75;
        v107 = 2112;
        v108 = v80;
        _os_log_impl(&dword_2218F0000, v73, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Accessory [%@] does not have a home", buf, 0x20u);

        v7 = v79;
        v8 = v78;
        v6 = v77;
        v15 = v76;

        v16 = v96;
        v10 = v101;

        v71 = contextc;
      }

      objc_autoreleasePoolPop(v71);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setError:", v81);

      objc_msgSend(v8, "setShouldReschedule:", 1);
    }
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v8);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v102;
LABEL_41:

    goto LABEL_31;
  }
  v33 = (void *)MEMORY[0x227676638]();
  v34 = self;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v98 = v10;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    contextb = v8;
    v93 = v6;
    v38 = v7;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shortDescription");
    v40 = v15;
    v41 = v16;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v104 = v36;
    v105 = 2112;
    v106 = v37;
    v107 = 2112;
    v108 = v39;
    v109 = 2112;
    v110 = v42;
    _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] For the accessory [%@] with user [%@], this operation can never successfully run in the future. Hence marking this operation as finished.", buf, 0x2Au);

    v16 = v41;
    v15 = v40;

    v7 = v38;
    v8 = contextb;
    v6 = v93;

    v10 = v98;
  }

  objc_autoreleasePoolPop(v33);
  v43 = (void *)MEMORY[0x24BDD1540];
  v44 = 23;
LABEL_29:
  objc_msgSend(v43, "hmErrorWithCode:", v44);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setError:", v68);

LABEL_30:
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v8);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v102;
LABEL_31:

  return v69;
}

- (id)_auditMatterAccessory:(id)a3 forRestrictedGuest:(id)a4 inHome:(id)a5 flow:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(v13, "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B998], "shortDescription");
    v33 = v14;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v46 = v17;
    v47 = 2112;
    v48 = v18;
    v49 = 2112;
    v50 = v19;
    v51 = 2112;
    v52 = v20;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to add restricted guest [%@] to matter accessory [%@]", buf, 0x2Au);

    v14 = v33;
  }

  objc_autoreleasePoolPop(v14);
  v21 = (void *)objc_opt_new();
  objc_msgSend(v10, "waitForDoorLockClusterObjectWithFlow:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke;
  v38[3] = &unk_24E783E50;
  v39 = v10;
  v40 = v11;
  v41 = v12;
  v42 = v13;
  v43 = v15;
  v24 = v21;
  v44 = v24;
  v25 = v10;
  v26 = v11;
  v27 = v12;
  v28 = v13;
  objc_msgSend(v22, "then:", v38);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v23;
  v36[1] = 3221225472;
  v36[2] = __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke_66;
  v36[3] = &unk_24E783E78;
  v37 = v24;
  v34[0] = v23;
  v34[1] = 3221225472;
  v34[2] = __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke_2_68;
  v34[3] = &unk_24E797A18;
  v35 = v37;
  v30 = v37;
  objc_msgSend(v29, "then:orRecover:", v36, v34);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)loadConfiguredCredentialsOnMatterAccessory:(id)a3 forUser:(id)a4 inHome:(id)a5 flow:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v67;
  void *v68;
  void *v69;
  _QWORD v70[5];
  id v71;
  void *v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v67 = v15;
  v69 = v10;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortDescription");
    v20 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v22 = v13;
    v23 = v12;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v74 = v17;
    v75 = 2112;
    v76 = v18;
    v77 = 2112;
    v78 = v19;
    v79 = 2112;
    v80 = v21;
    v81 = 2112;
    v82 = v24;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] loadConfiguredCredentialsOnMatterAccessory with accessory: %@, forUser: %@, inHome: %@", buf, 0x34u);

    v12 = v23;
    v13 = v22;

    v11 = v20;
    v10 = v69;

    v15 = v67;
  }

  objc_autoreleasePoolPop(v14);
  objc_msgSend(v11, "accessCode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "supportsMatterAccessCode");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27 && v25)
  {
    v65 = v26;
    v28 = v11;
    v29 = (void *)MEMORY[0x227676638]();
    v30 = v15;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUID");
      v59 = v29;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v62 = v25;
      v34 = v12;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v74 = v32;
      v75 = 2112;
      v76 = v33;
      v77 = 2112;
      v78 = v35;
      v79 = 2112;
      v80 = v36;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to add RG's [%@] access code to accessory [%@]", buf, 0x2Au);

      v12 = v34;
      v25 = v62;

      v29 = v59;
    }
    v61 = v12;

    objc_autoreleasePoolPop(v29);
    objc_msgSend(v12, "accessCodeManager");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7300]), "initWithStringValue:", v25);
    v60 = v28;
    objc_msgSend(v28, "uuid");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "uuid");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v39;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v72, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "addNewAccessCode:forUserWithUUID:toAccessoriesWithUUIDs:withRetries:", v37, v38, v40, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "hmfFuture");
    v42 = v25;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x24BDAC760];
    v70[1] = 3221225472;
    v70[2] = __118__HMDAuditAllowedAccessoryForRestrictedGuestOperation_loadConfiguredCredentialsOnMatterAccessory_forUser_inHome_flow___block_invoke;
    v70[3] = &unk_24E783EA0;
    v70[4] = v30;
    v71 = v13;
    objc_msgSend(v43, "then:", v70);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v65;
    objc_msgSend(v65, "addObject:", v44);

    v25 = v42;
    v12 = v61;

    v10 = v69;
    v11 = v60;

    v15 = v67;
  }
  if (objc_msgSend(v10, "supportsWalletKey"))
  {
    v64 = v13;
    v45 = (void *)MEMORY[0x227676638]();
    v46 = v15;
    HMFGetOSLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "UUID");
      v68 = v45;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortDescription");
      v66 = v26;
      v51 = v25;
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v74 = v48;
      v75 = 2112;
      v76 = v49;
      v77 = 2112;
      v78 = v50;
      v79 = 2112;
      v80 = v52;
      _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to add RG's [%@] issuer key to accessory [%@]", buf, 0x2Au);

      v25 = v51;
      v26 = v66;

      v45 = v68;
    }

    objc_autoreleasePoolPop(v45);
    objc_msgSend(v12, "nfcReaderKeyManager");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "accessoryManager");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v64;
    objc_msgSend(v54, "addIssuerKeyForUser:toMatterAccessory:flow:", v11, v10, v64);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "hmfFuture");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v56);

  }
  +[HMDAuditProhibitedAccessoryForRestrictedGuestOperation awaitForAllSettledFutures:](HMDAuditProhibitedAccessoryForRestrictedGuestOperation, "awaitForAllSettledFutures:", v26);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

- (id)_auditHAPAccessory:(id)a3 forRestrictedGuest:(id)a4 inHome:(id)a5 flow:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v57;
  NSObject *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD block[4];
  id v83;
  id v84;
  id v85;
  HMDAuditAllowedAccessoryForRestrictedGuestOperation *v86;
  _QWORD v87[5];
  id v88;
  void *v89;
  _BYTE buf[12];
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v75 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v19 = v11;
    v20 = v10;
    v21 = v12;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v16;
    v91 = 2112;
    v92 = v17;
    v93 = 2112;
    v94 = v18;
    v95 = 2112;
    v96 = v22;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to add restricted guest [%@] from the HAP accessory [%@]", buf, 0x2Au);

    v12 = v21;
    v10 = v20;
    v11 = v19;

  }
  objc_autoreleasePoolPop(v13);
  v23 = (void *)objc_opt_new();
  objc_msgSend(v11, "restrictedGuestAccessSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "schedule");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x227676638]();
  v27 = v14;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
  if (v25)
  {
    if (v29)
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "description");
      v73 = v23;
      v32 = v27;
      v33 = v11;
      v34 = v12;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v30;
      v91 = 2112;
      v92 = v31;
      v93 = 2112;
      v94 = v35;
      v95 = 2112;
      v96 = v36;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Restricted Guest [%@] schedule is restricted so no credentials should be on the HAP accessory [%@]. Attempting to remove.", buf, 0x2Au);

      v12 = v34;
      v11 = v33;
      v27 = v32;
      v23 = v73;

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(v23, "setCredentialsRemoved:", 1);
    v37 = -[HMDAuditProhibitedAccessoryForRestrictedGuestOperation initWithAccessory:restrictedGuest:]([HMDAuditProhibitedAccessoryForRestrictedGuestOperation alloc], "initWithAccessory:restrictedGuest:", v10, v11);
    objc_msgSend(v75, "homeManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAuditProhibitedAccessoryForRestrictedGuestOperation executeOperationWithHomeManager:flow:](v37, "executeOperationWithHomeManager:flow:", v38, v12);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x24BDAC760];
    v76[1] = 3221225472;
    v76[2] = __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_83;
    v76[3] = &unk_24E783EC8;
    v77 = v23;
    objc_msgSend(v39, "then:", v76);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v29)
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v41;
      v91 = 2112;
      v92 = v42;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Schedule is unrestricted, attempt to add credentials", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v37 = (HMDAuditProhibitedAccessoryForRestrictedGuestOperation *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "supportsAccessCode"))
    {
      objc_msgSend(v11, "accessCode");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        v72 = v12;
        v74 = v23;
        v44 = (void *)MEMORY[0x227676638]();
        v45 = v27;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "UUID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v47;
          v91 = 2112;
          v92 = v48;
          _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Adding access codes if not on the accessory already", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v44);
        objc_msgSend(v75, "accessCodeManager");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_alloc(MEMORY[0x24BDD7300]);
        objc_msgSend(v11, "accessCode");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)objc_msgSend(v49, "initWithStringValue:", v71);
        objc_msgSend(v11, "uuid");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v69;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addNewAccessCode:forUserWithUUID:toAccessoriesWithUUIDs:withRetries:", v68, v50, v51, 1);
        v52 = v45;
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "hmfFuture");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v87[0] = MEMORY[0x24BDAC760];
        v87[1] = 3221225472;
        v87[2] = __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke;
        v87[3] = &unk_24E783EA0;
        v87[4] = v52;
        v88 = v72;
        objc_msgSend(v54, "then:", v87);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAuditProhibitedAccessoryForRestrictedGuestOperation addObject:](v37, "addObject:", v55);

        v12 = v72;
        v23 = v74;
      }
    }
    if (objc_msgSend(v10, "supportsWalletKey"))
    {
      v56 = (void *)MEMORY[0x227676638]();
      v57 = v27;
      HMFGetOSLogHandle();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUID");
        v60 = v11;
        v61 = v10;
        v62 = v12;
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v59;
        v91 = 2112;
        v92 = v63;
        _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Starting add pairing key audit", buf, 0x16u);

        v12 = v62;
        v10 = v61;
        v11 = v60;

      }
      objc_autoreleasePoolPop(v56);
      *(_QWORD *)buf = 0;
      objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAuditProhibitedAccessoryForRestrictedGuestOperation addObject:](v37, "addObject:", v64);

      dispatch_get_global_queue(0, 0);
      v65 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_75;
      block[3] = &unk_24E79A910;
      v83 = v10;
      v84 = v12;
      v85 = *(id *)buf;
      v86 = v57;
      dispatch_async(v65, block);

    }
    +[HMDAuditProhibitedAccessoryForRestrictedGuestOperation awaitForAllSettledFutures:](HMDAuditProhibitedAccessoryForRestrictedGuestOperation, "awaitForAllSettledFutures:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = MEMORY[0x24BDAC760];
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_80;
    v80[3] = &unk_24E7979F0;
    v81 = v23;
    v78[0] = v66;
    v78[1] = 3221225472;
    v78[2] = __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_2_82;
    v78[3] = &unk_24E797A18;
    v79 = v81;
    objc_msgSend(v38, "then:orRecover:", v80, v78);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v81;
  }

  return v40;
}

- (BOOL)_anyModificationsFailedExcludingAlreadyExistsError:(id)a3 responseError:(id *)a4
{
  id v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v5 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__107488;
  v13 = __Block_byref_object_dispose__107489;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __120__HMDAuditAllowedAccessoryForRestrictedGuestOperation__anyModificationsFailedExcludingAlreadyExistsError_responseError___block_invoke;
  v8[3] = &unk_24E7883C0;
  v8[4] = &v9;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
  v6 = (void *)v10[5];
  if (v6)
    *a4 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v9, 8);

  return v6 != 0;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDBackgroundOperation operationUUID](self, "operationUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __120__HMDAuditAllowedAccessoryForRestrictedGuestOperation__anyModificationsFailedExcludingAlreadyExistsError_responseError___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "error");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v15, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "code") == 2602)
    {
      objc_msgSend(v15, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD5BD8]);

      if ((v11 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
    objc_msgSend(v15, "error");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a4 = 1;
  }
LABEL_7:

}

uint64_t __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v20 = 0;
  v5 = objc_msgSend(v4, "_anyModificationsFailedExcludingAlreadyExistsError:responseError:", v3, &v20);
  v6 = v20;
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
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] At least one modification response had an error [%@] that isn't HMErrorCodePrivateAccessCodeDuplicate, so operation did not succeed.", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = v6;
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v18 = 2;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Access code has been added to the accessory", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v18 = 1;
  }

  return v18;
}

void __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_75(id *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  unsigned __int8 v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  objc_super v26;
  id v27;
  _QWORD v28[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  +[HMDAuditProhibitedAccessoryForRestrictedGuestOperation getPairingsFromAccessory:flow:](HMDAuditProhibitedAccessoryForRestrictedGuestOperation, "getPairingsFromAccessory:flow:", a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v11 = a1[6];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rejectWithError:", v12);
LABEL_16:

    goto LABEL_17;
  }
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_2;
  v28[3] = &unk_24E796B98;
  v28[4] = a1[7];
  v4 = objc_msgSend(v2, "na_any:", v28);
  v5 = (void *)MEMORY[0x227676638]();
  v6 = a1[7];
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v4)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = a1[4];
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to add user pairing to the HAP accessory : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v26.receiver = a1[7];
    v26.super_class = (Class)HMDAuditAllowedAccessoryForRestrictedGuestOperation;
    v27 = 0;
    v15 = objc_msgSendSuper2(&v26, sel_mainWithError_, &v27);
    v12 = v27;
    if ((v15 & 1) == 0)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = a1[7];
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v19;
        v31 = 2112;
        v32 = v20;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pairing with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(a1[6], "rejectWithError:", v12);
    }
    v21 = (void *)MEMORY[0x227676638]();
    v22 = a1[7];
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v24;
      v31 = 2112;
      v32 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added pairing", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(a1[6], "fulfillWithNoValue");
    goto LABEL_16;
  }
  if (v8)
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@User's pairing is already on the Accessory: %@, nothing to add.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(a1[6], "fulfillWithNoValue");
LABEL_17:

}

uint64_t __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_80(uint64_t a1)
{

  return 1;
}

uint64_t __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_2_82(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setShouldReschedule:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setError:", v4);

  return 1;
}

uint64_t __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setShouldReschedule:", objc_msgSend(v3, "shouldReschedule"));
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setError:", v4);
  return 1;
}

uint64_t __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("newPairingIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

uint64_t __118__HMDAuditAllowedAccessoryForRestrictedGuestOperation_loadConfiguredCredentialsOnMatterAccessory_forUser_inHome_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v20 = 0;
  v5 = objc_msgSend(v4, "_anyModificationsFailedExcludingAlreadyExistsError:responseError:", v3, &v20);
  v6 = v20;
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
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] At least one modification response had an error [%@] that isn't HMErrorCodePrivateAccessCodeDuplicate, so operation did not succeed.", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = v6;
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v18 = 2;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Access code has been added to the accessory", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v18 = 1;
  }

  return v18;
}

uint64_t __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = a1[4];
  objc_msgSend(a1[5], "restrictedGuestAccessSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "schedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "supportsConfiguredSchedule:", v6);

  if (!(_DWORD)v4)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1[8];
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[7], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = a1[4];
      *(_DWORD *)buf = 138543874;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to remove user from the matter accessory : %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(a1[9], "setCredentialsRemoved:", 1);
    objc_msgSend(a1[6], "removeUser:fromAccessory:", a1[5], a1[4]);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v7 = v16;

      goto LABEL_8;
    }
LABEL_9:
    _HMFPreconditionFailure();
  }
  objc_msgSend(a1[6], "findOrAddUser:onAccessory:flow:", a1[5], a1[4], a1[7]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke_2;
  v18[3] = &unk_24E783E28;
  v18[4] = a1[8];
  v19 = a1[4];
  v20 = a1[5];
  v21 = a1[6];
  v22 = a1[7];
  objc_msgSend(v7, "then:", v18);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_9;
  v9 = v8;

LABEL_8:
  return 3;
}

uint64_t __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke_66(uint64_t a1)
{

  return 1;
}

uint64_t __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke_2_68(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setShouldReschedule:", 1);
  return 1;
}

uint64_t __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "loadConfiguredCredentialsOnMatterAccessory:forUser:inHome:flow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __69__HMDAuditAllowedAccessoryForRestrictedGuestOperation_mainWithError___block_invoke(v7);
  }
}

uint64_t __69__HMDAuditAllowedAccessoryForRestrictedGuestOperation_mainWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v7;
  SEL v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeOperationWithHomeManager:flow:", v3, *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = (void *)_HMFPreconditionFailure();
    return (uint64_t)+[HMDAuditAllowedAccessoryForRestrictedGuestOperation logCategory](v7, v8);
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34_107547 != -1)
    dispatch_once(&logCategory__hmf_once_t34_107547, &__block_literal_global_107548);
  return (id)logCategory__hmf_once_v35_107549;
}

void __66__HMDAuditAllowedAccessoryForRestrictedGuestOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v35_107549;
  logCategory__hmf_once_v35_107549 = v0;

}

@end
