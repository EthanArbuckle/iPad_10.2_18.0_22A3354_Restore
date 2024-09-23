@implementation HMDAuditProhibitedAccessoryForRestrictedGuestOperation

- (HMDAuditProhibitedAccessoryForRestrictedGuestOperation)initWithAccessory:(id)a3 restrictedGuest:(id)a4
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
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v16;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  objc_super v22;
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pairingIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("sharedUserUUIDKey");
    objc_msgSend(v7, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22.receiver = self;
    v22.super_class = (Class)HMDAuditProhibitedAccessoryForRestrictedGuestOperation;
    v16 = -[HMDRemoveAccessoryPairingOperation initWithAccessory:accessoryIdentifier:homeUUIDWhereAccessoryWasPaired:isOwnerIdentity:identityToRemove:userData:](&v22, sel_initWithAccessory_accessoryIdentifier_homeUUIDWhereAccessoryWasPaired_isOwnerIdentity_identityToRemove_userData_, v8, v9, v12, 0, v13, v15);

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
      v26 = v20;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
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
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v6;
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
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id *v33;
  id v34;
  void *v35;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v43;
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Performing audit for prohibited accessory [%@] for restricted guest [%@]", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  v13 = objc_alloc(MEMORY[0x24BE3F168]);
  dispatch_get_global_queue(21, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithQueue:", v14);

  v16 = (void *)MEMORY[0x24BE3F180];
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __72__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_mainWithError___block_invoke;
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
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Finished removing the restricted guest from [%@] resulted in outcome: [%@] with error: [%@]", buf, 0x34u);

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
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v5;
  SEL v6;
  id v7;
  id v8;

  -[HMDBackgroundOperation userData](self, "userData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sharedUserUUIDKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return (NSUUID *)v3;
  v5 = (HMDAuditProhibitedAccessoryForRestrictedGuestOperation *)_HMFPreconditionFailure();
  return (NSUUID *)-[HMDAuditProhibitedAccessoryForRestrictedGuestOperation executeOperationWithHomeManager:flow:](v5, v6, v7, v8);
}

- (id)executeOperationWithHomeManager:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  unint64_t v18;
  BOOL v19;
  void *v21;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  char v44;
  void *v45;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v78;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  uint64_t v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  void *v112;
  id v113;
  id v114;
  void *v115;
  _QWORD v116[4];
  id v117;
  _QWORD v118[4];
  id v119;
  _QWORD v120[4];
  id v121;
  _QWORD v122[4];
  id v123;
  uint8_t buf[4];
  void *v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  void *v129;
  __int16 v130;
  void *v131;
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDBackgroundOperation setHomeManager:](self, "setHomeManager:", v6);
  v8 = (void *)objc_opt_new();
  -[HMDBackgroundOperation userData](self, "userData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sharedUserUUIDKey"));
  v10 = objc_claimAutoreleasedReturnValue();

  v115 = (void *)v10;
  objc_msgSend((id)objc_opt_class(), "findUserWithUUID:fromHomeManager:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_class();
  -[HMDAccessoryBackgroundOperation accessoryUUID](self, "accessoryUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "findAccessoryUsing:homeManager:", v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  v18 = -[HMDAccessoryBackgroundOperation accessoryOperationStatus](self, "accessoryOperationStatus");
  if (v17)
    v19 = v11 == 0;
  else
    v19 = 1;
  if (v19 || v18 == 0)
  {
    v21 = (void *)MEMORY[0x227676638](v18);
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUID");
      v110 = v7;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryUUID](v22, "accessoryUUID");
      v104 = v17;
      v26 = v15;
      v27 = v6;
      v28 = v8;
      v29 = v11;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v125 = v24;
      v126 = 2112;
      v127 = v25;
      v128 = 2112;
      v129 = v30;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Required parameters does not exist to properly execute this operation : [%@]", buf, 0x20u);

      v11 = v29;
      v8 = v28;
      v6 = v27;
      v15 = v26;
      v17 = v104;

      v7 = v110;
    }

    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setError:", v31);

    objc_msgSend(v8, "setShouldReschedule:", 1);
    goto LABEL_32;
  }
  if (v18 != 1)
  {
    if ((objc_msgSend(v17, "supportsAnyInPersonAccess") & 1) == 0)
    {
      v66 = (void *)MEMORY[0x227676638]();
      v67 = self;
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUID");
        v113 = v7;
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shortDescription");
        v107 = v17;
        v71 = v15;
        v72 = v6;
        v73 = v8;
        v74 = v11;
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v125 = v69;
        v126 = 2112;
        v127 = v70;
        v128 = 2112;
        v129 = v75;
        _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory [%@] does not support features that enforce access directly. Hence marking this operation as finished.", buf, 0x20u);

        v11 = v74;
        v8 = v73;
        v6 = v72;
        v15 = v71;
        v17 = v107;

        v7 = v113;
      }

      objc_autoreleasePoolPop(v66);
      v42 = (void *)MEMORY[0x24BDD1540];
      v43 = 48;
      goto LABEL_31;
    }
    objc_msgSend(v17, "home");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (v103)
    {
      v44 = objc_msgSend(v11, "isRestrictedGuest");
      v45 = (void *)MEMORY[0x227676638]();
      v46 = self;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);
      if ((v44 & 1) != 0)
      {
        v112 = v7;
        if (v48)
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "UUID");
          v102 = v45;
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "shortDescription");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "shortDescription");
          v106 = v17;
          v52 = v11;
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v125 = v49;
          v126 = 2112;
          v127 = v50;
          v128 = 2112;
          v129 = v51;
          v130 = 2112;
          v131 = v53;
          _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] All checks are completed, now attempting to audit prohibited accessory [%@] with restricted guest [%@]", buf, 0x2Au);

          v11 = v52;
          v17 = v106;

          v7 = v112;
          v45 = v102;

        }
        objc_autoreleasePoolPop(v45);
        if ((objc_msgSend(v17, "supportsCHIP") & 1) != 0)
        {
          v54 = v17;
          v55 = v11;
          v56 = (void *)MEMORY[0x227676638]();
          v57 = v46;
          HMFGetOSLogHandle();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "UUID");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v125 = v59;
            v126 = 2112;
            v127 = v60;
            v128 = 2112;
            v129 = v54;
            _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Going to remove restricted guest from the matter accessory : %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v56);
          v61 = v103;
          v11 = v55;
          v62 = v55;
          v17 = v54;
          objc_msgSend(v103, "removeUser:fromAccessory:", v62, v54);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = MEMORY[0x24BDAC760];
          v118[0] = MEMORY[0x24BDAC760];
          v118[1] = 3221225472;
          v118[2] = __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke_28;
          v118[3] = &unk_24E7979F0;
          v119 = v8;
          v116[0] = v64;
          v116[1] = 3221225472;
          v116[2] = __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke_2_29;
          v116[3] = &unk_24E797A18;
          v117 = v119;
          objc_msgSend(v63, "then:orRecover:", v118, v116);
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = v112;
        }
        else
        {
          v61 = v103;
          -[HMDAuditProhibitedAccessoryForRestrictedGuestOperation _auditHAPAccessory:forRestrictedGuest:inHome:flow:](v46, "_auditHAPAccessory:forRestrictedGuest:inHome:flow:", v17, v11, v103, v7);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v17;
          v96 = v15;
          v97 = v6;
          v98 = v8;
          v99 = v11;
          v100 = v7;
          v101 = MEMORY[0x24BDAC760];
          v122[0] = MEMORY[0x24BDAC760];
          v122[1] = 3221225472;
          v122[2] = __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke;
          v122[3] = &unk_24E7979F0;
          v123 = v98;
          v120[0] = v101;
          v7 = v100;
          v11 = v99;
          v8 = v98;
          v6 = v97;
          v15 = v96;
          v17 = v95;
          v120[1] = 3221225472;
          v120[2] = __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke_2;
          v120[3] = &unk_24E797A18;
          v121 = v123;
          objc_msgSend(v94, "then:orRecover:", v122, v120);
          v65 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_41;
      }
      if (v48)
      {
        HMFGetLogIdentifier();
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUID");
        v109 = v17;
        v90 = v11;
        v91 = v7;
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v125 = v89;
        v126 = 2112;
        v127 = v92;
        v128 = 2112;
        v129 = v90;
        _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Cannot proceed with removing the user as it is not restricted guest. : %@", buf, 0x20u);

        v7 = v91;
        v11 = v90;
        v17 = v109;

      }
      objc_autoreleasePoolPop(v45);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setError:", v93);

    }
    else
    {
      v78 = (void *)MEMORY[0x227676638]();
      v79 = self;
      HMFGetOSLogHandle();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUID");
        v114 = v7;
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shortDescription");
        v108 = v17;
        v83 = v15;
        v84 = v6;
        v85 = v8;
        v86 = v11;
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v125 = v81;
        v126 = 2112;
        v127 = v82;
        v128 = 2112;
        v129 = v87;
        _os_log_impl(&dword_2218F0000, v80, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Accessory [%@] does not have a home", buf, 0x20u);

        v11 = v86;
        v8 = v85;
        v6 = v84;
        v15 = v83;
        v17 = v108;

        v7 = v114;
      }

      objc_autoreleasePoolPop(v78);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setError:", v88);

      objc_msgSend(v8, "setShouldReschedule:", 1);
    }
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v8);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v103;
LABEL_41:

    goto LABEL_33;
  }
  v32 = (void *)MEMORY[0x227676638]();
  v33 = self;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    v111 = v7;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortDescription");
    v105 = v17;
    v37 = v15;
    v38 = v6;
    v39 = v8;
    v40 = v11;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v125 = v35;
    v126 = 2112;
    v127 = v36;
    v128 = 2112;
    v129 = v41;
    _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@For the accessory [%@] with user [%@], this operation can never successfully run in the future. Hence marking this operation as finished.", buf, 0x20u);

    v11 = v40;
    v8 = v39;
    v6 = v38;
    v15 = v37;
    v17 = v105;

    v7 = v111;
  }

  objc_autoreleasePoolPop(v32);
  v42 = (void *)MEMORY[0x24BDD1540];
  v43 = 20;
LABEL_31:
  objc_msgSend(v42, "hmErrorWithCode:", v43);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setError:", v76);

LABEL_32:
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v8);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v65;
}

- (id)_auditHAPAccessory:(id)a3 forRestrictedGuest:(id)a4 inHome:(id)a5 flow:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v15;
  NSObject *v16;
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
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v46;
  NSObject *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v58;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v65;
  HMDAuditProhibitedAccessoryForRestrictedGuestOperation *v66;
  void *v67;
  _QWORD block[5];
  id v69;
  id v70;
  id v71;
  _QWORD v72[5];
  id v73;
  _BYTE buf[12];
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
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
    v65 = v15;
    v19 = v13;
    v20 = v11;
    v21 = v12;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v17;
    v75 = 2112;
    v76 = v18;
    v77 = 2112;
    v78 = v22;
    v79 = 2112;
    v80 = v23;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to remove restricted guest [%@] from the HAP accessory [%@]", buf, 0x2Au);

    v12 = v21;
    v11 = v20;
    v13 = v19;
    v15 = v65;

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "supportsAccessCode"))
    goto LABEL_9;
  objc_msgSend(v11, "accessCode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    goto LABEL_9;
  v26 = (void *)MEMORY[0x227676638]();
  v27 = v15;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUID");
    v66 = v15;
    v30 = v10;
    v31 = v13;
    v32 = v11;
    v33 = v12;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v29;
    v75 = 2112;
    v76 = v34;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Starting audit access code removal", buf, 0x16u);

    v12 = v33;
    v11 = v32;
    v13 = v31;
    v10 = v30;
    v15 = v66;

  }
  objc_autoreleasePoolPop(v26);
  objc_msgSend(v12, "accessCodeManager");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)v35;
    objc_msgSend(v11, "accessCode");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeAccessCode:fromHAPAccessory:", v67, v10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __108__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke;
    v72[3] = &unk_24E7932C8;
    v72[4] = v27;
    v73 = v13;
    objc_msgSend(v37, "flatMap:", v72);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "hmfFuture");
    v39 = v15;
    v40 = v10;
    v41 = v13;
    v42 = v11;
    v43 = v12;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v44);

    v12 = v43;
    v11 = v42;
    v13 = v41;
    v10 = v40;
    v15 = v39;

LABEL_9:
    if (objc_msgSend(v10, "supportsWalletKey"))
    {
      v45 = (void *)MEMORY[0x227676638]();
      v46 = v15;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUID");
        v49 = v10;
        v50 = v13;
        v51 = v11;
        v52 = v12;
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v48;
        v75 = 2112;
        v76 = v53;
        _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Starting audit removal of pairing key", buf, 0x16u);

        v12 = v52;
        v11 = v51;
        v13 = v50;
        v10 = v49;

      }
      objc_autoreleasePoolPop(v45);
      *(_QWORD *)buf = 0;
      objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v54);

      dispatch_get_global_queue(0, 0);
      v55 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __108__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_33;
      block[3] = &unk_24E79A910;
      block[4] = v46;
      v69 = v10;
      v70 = v13;
      v71 = *(id *)buf;
      dispatch_async(v55, block);

    }
    objc_msgSend((id)objc_opt_class(), "awaitForAllSettledFutures:", v24);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v58 = (void *)MEMORY[0x227676638]();
  v59 = v27;
  HMFGetOSLogHandle();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUID");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v61;
    v75 = 2112;
    v76 = v62;
    _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Cannot attempt to remove access code because accessCodeManager is nil", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v58);
  v63 = (void *)MEMORY[0x24BE3F180];
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "futureWithError:", v64);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v56;
}

- (BOOL)_anyModificationsFailedExcludingDoesNotExistError:(id)a3 responseError:(id *)a4
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
  v12 = __Block_byref_object_copy__140599;
  v13 = __Block_byref_object_dispose__140600;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __122__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__anyModificationsFailedExcludingDoesNotExistError_responseError___block_invoke;
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

void __122__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__anyModificationsFailedExcludingDoesNotExistError_responseError___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD5BD8]) & 1) != 0)
    {
      objc_msgSend(v15, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "code");

      if (v11 == 2606)
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

id __108__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v18 = 0;
  v5 = objc_msgSend(v4, "_anyModificationsFailedExcludingDoesNotExistError:responseError:", v3, &v18);
  v6 = v18;
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
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] At least one modification response had an error [%@] that isn't HMErrorCodePrivateAccessCodeIdentifierDoesNotExist, so operation did not succeed.", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v6);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Access code has been removed on accessory", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v13;

  return v16;
}

void __108__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_33(id *a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  id v29;
  _QWORD v30[5];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "getPairingsFromAccessory:flow:", a1[5], a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v24 = a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rejectWithError:", v13);
LABEL_13:

    goto LABEL_17;
  }
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __108__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_2;
  v30[3] = &unk_24E796B98;
  v30[4] = a1[4];
  v4 = objc_msgSend(v2, "na_any:", v30);
  v5 = (void *)MEMORY[0x227676638]();
  v6 = a1[4];
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if ((v4 & 1) != 0)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[5];
      *(_DWORD *)buf = 138543874;
      v32 = v9;
      v33 = 2112;
      v34 = v10;
      v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to remove restricted guest pairing from the HAP accessory : %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    v28.receiver = a1[4];
    v28.super_class = (Class)HMDAuditProhibitedAccessoryForRestrictedGuestOperation;
    v29 = 0;
    v12 = objc_msgSendSuper2(&v28, sel_mainWithError_, &v29);
    v13 = v29;
    if ((v12 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = a1[4];
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "UUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v32 = v17;
        v33 = 2112;
        v34 = v18;
        v35 = 2112;
        v36 = v13;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove pairing with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(a1[7], "rejectWithError:", v13);
    }
    v19 = (void *)MEMORY[0x227676638]();
    v20 = a1[4];
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "UUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v22;
      v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully removed pairing", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(a1[7], "fulfillWithNoValue");
    goto LABEL_13;
  }
  if (v8)
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "shortDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v25;
    v33 = 2112;
    v34 = v26;
    v35 = 2112;
    v36 = v27;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Restricted guest's pairing is not on the Accessory: %@, nothing to remove.", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(a1[7], "fulfillWithNoValue");
LABEL_17:

}

uint64_t __108__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pairingIdentifierToRemove");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke(uint64_t a1)
{

  return 1;
}

uint64_t __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setShouldReschedule:", 1);

  return 1;
}

uint64_t __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke_28(uint64_t a1)
{

  return 1;
}

uint64_t __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke_2_29(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setShouldReschedule:", 1);

  return 1;
}

uint64_t __72__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_mainWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v7;
  SEL v8;
  id v9;
  id v10;

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
    return (uint64_t)+[HMDAuditProhibitedAccessoryForRestrictedGuestOperation getPairingsFromAccessory:flow:](v7, v8, v9, v10);
  }
}

+ (id)getPairingsFromAccessory:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  dispatch_time_t v20;
  intptr_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, void *);
  void *v39;
  id v40;
  id v41;
  NSObject *v42;
  _BYTE *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  NSObject *v48;
  _BYTE *v49;
  id v50;
  uint8_t v51[4];
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = a1;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v58 = v13;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Get pairings from accessory : %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v58 = __Block_byref_object_copy__140599;
  v59 = __Block_byref_object_dispose__140600;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v60 = v15;
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __88__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_getPairingsFromAccessory_flow___block_invoke;
  v45[3] = &unk_24E788410;
  v50 = v9;
  v46 = v7;
  v47 = v6;
  v48 = v14;
  v49 = buf;
  v36 = v16;
  v37 = 3221225472;
  v38 = __88__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_getPairingsFromAccessory_flow___block_invoke_42;
  v39 = &unk_24E788438;
  v44 = v9;
  v17 = v46;
  v40 = v17;
  v18 = v47;
  v41 = v18;
  v43 = buf;
  v19 = v48;
  v42 = v19;
  objc_msgSend(v18, "performOperation:linkType:operationBlock:errorBlock:", 7, 0, v45, &v36);
  v20 = dispatch_time(0, 120000000000);
  v21 = dispatch_group_wait(v19, v20);
  if (v21)
  {
    v27 = (void *)MEMORY[0x227676638](v21, v22, v23, v24, v25, v26);
    v28 = v9;
    HMFGetOSLogHandle();
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUID", v36, v37, v38, v39, v40, v41);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "shortDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v51 = 138543874;
      v52 = v30;
      v53 = 2112;
      v54 = v31;
      v55 = 2112;
      v56 = v32;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Timed out while getting list of pairings from the accessory : %@", v51, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    v33 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;

  }
  v34 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v34;
}

+ (id)awaitForAllSettledFutures:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE3F180], "allSettled:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "then:", &__block_literal_global_140651);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t32_140646 != -1)
    dispatch_once(&logCategory__hmf_once_t32_140646, &__block_literal_global_47_140647);
  return (id)logCategory__hmf_once_v33_140648;
}

void __69__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v33_140648;
  logCategory__hmf_once_v33_140648 = v0;

}

uint64_t __84__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_awaitForAllSettledFutures___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "na_firstObjectPassingTest:", &__block_literal_global_46_140652);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v2;
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

uint64_t __84__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_awaitForAllSettledFutures___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __88__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_getPairingsFromAccessory_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    dispatch_get_global_queue(-32768, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __88__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_getPairingsFromAccessory_flow___block_invoke_39;
    v15[3] = &unk_24E7883E8;
    v19 = *(_QWORD *)(a1 + 64);
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    v14 = *(_OWORD *)(a1 + 48);
    v6 = (id)v14;
    v18 = v14;
    objc_msgSend(v4, "listPairingsWithCompletionQueue:completionHandler:", v5, v15);

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unable to list pairing as there is no accessory server for accessory : %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;
  }

}

void __88__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_getPairingsFromAccessory_flow___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 64);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unable to list pairings for accessory : %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __88__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_getPairingsFromAccessory_flow___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 64);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544386;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] HAP list pairing operation finished with: %@ for accessory: %@, error: %@", (uint8_t *)&v13, 0x34u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

@end
