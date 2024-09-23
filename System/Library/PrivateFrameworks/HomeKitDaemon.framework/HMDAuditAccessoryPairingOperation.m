@implementation HMDAuditAccessoryPairingOperation

- (HMDAuditAccessoryPairingOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 homeUUIDWhereAccessoryWasPaired:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDAuditAccessoryPairingOperation *v12;
  HMDAuditAccessoryPairingOperation *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  if (!v9)
    goto LABEL_10;
  v11 = v10;
  if (v10)
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDAuditAccessoryPairingOperation;
    v12 = -[HMDAccessoryBackgroundOperation initWithAccessoryUUID:accessoryIdentifier:homeUUIDWhereAccessoryWasPaired:userData:](&v18, sel_initWithAccessoryUUID_accessoryIdentifier_homeUUIDWhereAccessoryWasPaired_userData_, v8, v9, v10, MEMORY[0x24BDBD1B8]);
    v13 = v12;
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v16;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create audit accessory pairing operation for %@/%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (BOOL)mainWithError:(id *)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  unint64_t v15;
  BOOL v16;
  char v17;
  void *v18;
  HMDAuditAccessoryPairingOperation *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v28;
  char v29;
  id *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[HMDBackgroundOperation homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDAccessoryBackgroundOperation accessoryOperationStatus](self, "accessoryOperationStatus");
  v7 = (void *)objc_opt_class();
  -[HMDAccessoryBackgroundOperation accessoryUUID](self, "accessoryUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findAccessoryUsing:homeManager:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v12 | v15)
    v16 = v6 == 0;
  else
    v16 = 1;
  v17 = v16;
  if (v16)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = v17;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryUUID](v19, "accessoryUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryIdentifier](v19, "accessoryIdentifier");
      v30 = a3;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation homeUUID](v19, "homeUUID");
      v28 = v18;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v32 = v21;
      v33 = 2112;
      v34 = v22;
      v35 = 2112;
      v36 = v23;
      v37 = 2112;
      v38 = v24;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to run audit operation on accessory : %@/%@, for Home: %@", buf, 0x2Au);

      v18 = v28;
      a3 = v30;

      v17 = v29;
    }

    objc_autoreleasePoolPop(v18);
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (v6 != 1)
  {
    if (v12)
    {
      -[HMDAuditAccessoryPairingOperation getPairingsFromAccessory:](self, "getPairingsFromAccessory:", v12);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v15)
      {
        v26 = 0;
        goto LABEL_25;
      }
      -[HMDAuditAccessoryPairingOperation getPairingsFromAirPlayAccessory:](self, "getPairingsFromAirPlayAccessory:", v15);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v26 = (void *)v25;
LABEL_25:
    -[HMDAuditAccessoryPairingOperation auditPairings:forAccessory:](self, "auditPairings:forAccessory:", v26, v13);

  }
  return v17 ^ 1;
}

- (void)auditPairings:(id)a3 forAccessory:(id)a4
{
  HMDPersistAuditAccessoryResultOperation *v6;
  id v7;
  void *v8;
  void *v9;
  HMDAuditAccessoryPairingOperation *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  HMDPersistAuditAccessoryResultOperation *v18;
  id v19;
  HMDPersistAuditAccessoryResultOperation *v20;
  HMDPersistAuditAccessoryResultOperation *v21;
  HMDPersistAuditAccessoryResultOperation *v22;
  void *v23;
  void *v24;
  HMDAuditAccessoryPairingOperation *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  os_log_type_t v30;
  void *v31;
  HMDAuditAccessoryPairingOperation *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDAuditAccessoryPairingOperation *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  HMDPersistAuditAccessoryResultOperation *v46;
  HMDPersistAuditAccessoryResultOperation *v47;
  void *v48;
  void *v49;
  HMDAuditAccessoryPairingOperation *v50;
  NSObject *v51;
  void *v52;
  HMDPersistAuditAccessoryResultOperation *v53;
  void *v54;
  HMDAuditAccessoryPairingOperation *v55;
  NSObject *v56;
  void *v57;
  HMDPersistAuditAccessoryResultOperation *v58;
  HMDAuditAccessoryPairingOperation *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  HMDPersistAuditAccessoryResultOperation *v64;
  _QWORD v65[4];
  id v66;
  id v67;
  HMDAuditAccessoryPairingOperation *v68;
  HMDPersistAuditAccessoryResultOperation *v69;
  _QWORD v70[4];
  id v71;
  HMDAuditAccessoryPairingOperation *v72;
  id v73;
  _QWORD v74[4];
  id v75;
  HMDPersistAuditAccessoryResultOperation *v76;
  id v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  HMDPersistAuditAccessoryResultOperation *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v6 = (HMDPersistAuditAccessoryResultOperation *)a3;
  v7 = a4;
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v79 = v12;
    v80 = 2112;
    v81 = v6;
    v82 = 2112;
    v83 = v13;
    v84 = 2112;
    v85 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Going to audit HAP pairings: %@ on Accessory %@ for home: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v9);
  if (v8)
  {
    -[HMDBackgroundOperation bgOpsManager](v10, "bgOpsManager");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", -[HMDPersistAuditAccessoryResultOperation count](v6, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v74[0] = MEMORY[0x24BDAC760];
    v74[1] = 3221225472;
    v74[2] = __64__HMDAuditAccessoryPairingOperation_auditPairings_forAccessory___block_invoke;
    v74[3] = &unk_24E796C60;
    v17 = v8;
    v75 = v17;
    v18 = v15;
    v76 = v18;
    v19 = v14;
    v77 = v19;
    -[HMDPersistAuditAccessoryResultOperation hmf_enumerateWithAutoreleasePoolUsingBlock:](v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v74);
    -[HMDAuditAccessoryPairingOperation usersOnHomeWhosePairingsNeedsToBeAddedOrRemoved:](v10, "usersOnHomeWhosePairingsNeedsToBeAddedOrRemoved:", v17);
    v20 = (HMDPersistAuditAccessoryResultOperation *)objc_claimAutoreleasedReturnValue();
    v62 = v19;
    -[HMDPersistAuditAccessoryResultOperation minusSet:](v20, "minusSet:", v19);
    v64 = v6;
    if (!-[HMDPersistAuditAccessoryResultOperation hmf_isEmpty](v20, "hmf_isEmpty")
      || !-[HMDPersistAuditAccessoryResultOperation hmf_isEmpty](v18, "hmf_isEmpty"))
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = v10;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shortDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v79 = v34;
        v80 = 2112;
        v81 = v20;
        v82 = 2112;
        v83 = v35;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Going to add pairings [%@] on accessory [%@]", buf, 0x20u);

        v16 = MEMORY[0x24BDAC760];
      }

      objc_autoreleasePoolPop(v31);
      v36 = (void *)MEMORY[0x227676638]();
      v37 = v32;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shortDescription");
        v60 = v8;
        v40 = v16;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v79 = v39;
        v80 = 2112;
        v81 = v18;
        v82 = 2112;
        v83 = v41;
        _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Going to remove pairings [%@] from accessory [%@]", buf, 0x20u);

        v16 = v40;
        v8 = v60;

      }
      objc_autoreleasePoolPop(v36);
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[HMDPersistAuditAccessoryResultOperation count](v18, "count")+ -[HMDPersistAuditAccessoryResultOperation count](v20, "count"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = v16;
      v70[1] = 3221225472;
      v70[2] = __64__HMDAuditAccessoryPairingOperation_auditPairings_forAccessory___block_invoke_10;
      v70[3] = &unk_24E789EB0;
      v43 = v7;
      v71 = v43;
      v72 = v37;
      v44 = v42;
      v73 = v44;
      -[HMDPersistAuditAccessoryResultOperation hmf_enumerateWithAutoreleasePoolUsingBlock:](v20, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v70);
      v65[0] = v16;
      v65[1] = 3221225472;
      v65[2] = __64__HMDAuditAccessoryPairingOperation_auditPairings_forAccessory___block_invoke_14;
      v65[3] = &unk_24E789ED8;
      v45 = v43;
      v66 = v45;
      v67 = v17;
      v68 = v37;
      v22 = (HMDPersistAuditAccessoryResultOperation *)v44;
      v69 = v22;
      -[HMDPersistAuditAccessoryResultOperation hmf_enumerateWithAutoreleasePoolUsingBlock:](v18, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v65);
      v46 = [HMDPersistAuditAccessoryResultOperation alloc];
      v47 = -[HMDAccessoryBackgroundOperation initWithAccessory:userData:](v46, "initWithAccessory:userData:", v45, MEMORY[0x24BDBD1B8]);
      if (v47)
      {
        -[HMDPersistAuditAccessoryResultOperation addObject:](v22, "addObject:", v47);
        v48 = (void *)-[HMDPersistAuditAccessoryResultOperation copy](v22, "copy");
        -[HMDAuditAccessoryPairingOperation scheduleAuditOperations:](v37, "scheduleAuditOperations:", v48);

      }
      else
      {
        v54 = (void *)MEMORY[0x227676638]();
        v55 = v37;
        HMFGetOSLogHandle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v61 = v54;
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "shortDescription");
          v58 = (HMDPersistAuditAccessoryResultOperation *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v79 = v57;
          v80 = 2112;
          v81 = v58;
          _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audit pairing operation for accessory: %@", buf, 0x16u);

          v54 = v61;
        }

        objc_autoreleasePoolPop(v54);
      }

      v23 = v63;
      goto LABEL_26;
    }
    v21 = [HMDPersistAuditAccessoryResultOperation alloc];
    v22 = -[HMDAccessoryBackgroundOperation initWithAccessory:userData:](v21, "initWithAccessory:userData:", v7, MEMORY[0x24BDBD1B8]);
    if (v22)
    {
      v23 = v63;
      v24 = (void *)MEMORY[0x227676638](objc_msgSend(v63, "addOperation:", v22));
      v25 = v10;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = v27;
        v80 = 2112;
        v81 = v22;
        v28 = "%{public}@Added audit finished operation for accessory : %@";
        v29 = v26;
        v30 = OS_LOG_TYPE_INFO;
LABEL_24:
        _os_log_impl(&dword_2218F0000, v29, v30, v28, buf, 0x16u);

      }
    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v59 = v10;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      v23 = v63;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = v27;
        v80 = 2112;
        v81 = 0;
        v28 = "%{public}@Cannot create audit finished operation for accessory : %@";
        v29 = v26;
        v30 = OS_LOG_TYPE_ERROR;
        goto LABEL_24;
      }
    }

    objc_autoreleasePoolPop(v24);
LABEL_26:

    v6 = v64;
    goto LABEL_27;
  }
  v49 = (void *)MEMORY[0x227676638]();
  v50 = v10;
  HMFGetOSLogHandle();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v53 = (HMDPersistAuditAccessoryResultOperation *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v79 = v52;
    v80 = 2112;
    v81 = v53;
    _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@Cannot process audit HAP pairings operation as home is nil : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v49);
LABEL_27:

}

- (void)scheduleAuditOperations:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  HMDAuditAccessoryPairingOperation *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDBackgroundOperation bgOpsManager](self, "bgOpsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "scheduleOperationsWithDependenciesOnEachOtherFromArray:", v4);
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryUUID](v8, "accessoryUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryIdentifier](v8, "accessoryIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v11;
      v19 = 2112;
      v20 = v4;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v14 = "%{public}@Successfully added the operations to the BGOperationManager : %@ for accessory: %@/%@";
      v15 = v10;
      v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v15, v16, v14, (uint8_t *)&v17, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBackgroundOperation accessoryUUID](v8, "accessoryUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBackgroundOperation accessoryIdentifier](v8, "accessoryIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v11;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v14 = "%{public}@Unable to schedule all the audit operations : %@ for accessory: %@/%@. Removing them";
    v15 = v10;
    v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

- (id)getPairingsFromAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDAuditAccessoryPairingOperation *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  dispatch_time_t v16;
  void *v17;
  HMDAuditAccessoryPairingOperation *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  _QWORD v25[5];
  id v26;
  NSObject *v27;
  _QWORD v28[5];
  id v29;
  NSObject *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v8;
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Get pairings from accessory : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __62__HMDAuditAccessoryPairingOperation_getPairingsFromAccessory___block_invoke;
  v28[3] = &unk_24E789F00;
  v28[4] = v6;
  v29 = v4;
  v30 = v10;
  v13 = v11;
  v31 = v13;
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __62__HMDAuditAccessoryPairingOperation_getPairingsFromAccessory___block_invoke_20;
  v25[3] = &unk_24E799FD0;
  v25[4] = v6;
  v14 = v29;
  v26 = v14;
  v15 = v30;
  v27 = v15;
  objc_msgSend(v14, "performOperation:linkType:operationBlock:errorBlock:", 7, 0, v28, v25);
  v16 = dispatch_time(0, 120000000000);
  if (dispatch_group_wait(v15, v16))
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v6;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v20;
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Timed out while getting list of pairings from the accessory : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }
  v22 = v27;
  v23 = v13;

  return v23;
}

- (id)getPairingsFromAirPlayAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDAuditAccessoryPairingOperation *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  dispatch_time_t v15;
  intptr_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  HMDAuditAccessoryPairingOperation *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *, void *);
  void *v34;
  HMDAuditAccessoryPairingOperation *v35;
  id v36;
  id v37;
  NSObject *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v8;
    v41 = 2112;
    v42 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Get pairings from accessory : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = MEMORY[0x24BDAC760];
  v32 = 3221225472;
  v33 = __69__HMDAuditAccessoryPairingOperation_getPairingsFromAirPlayAccessory___block_invoke;
  v34 = &unk_24E7951D0;
  v35 = v6;
  v12 = v4;
  v36 = v12;
  v13 = v11;
  v37 = v13;
  v14 = v10;
  v38 = v14;
  objc_msgSend(v12, "pairingsWithCompletionHandler:", &v31);
  v15 = dispatch_time(0, 120000000000);
  v16 = dispatch_group_wait(v14, v15);
  if (v16)
  {
    v23 = (void *)MEMORY[0x227676638](v16, v17, v18, v19, v20, v21, v22);
    v24 = v6;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription", v31, v32, v33, v34, v35, v36, v37);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v26;
      v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Timed out while getting list of pairings from the accessory : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
  }
  v28 = v38;
  v29 = v13;

  return v29;
}

- (id)usersOnHomeWhosePairingsNeedsToBeAddedOrRemoved:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "users");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_152781);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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

uint64_t __85__HMDAuditAccessoryPairingOperation_usersOnHomeWhosePairingsNeedsToBeAddedOrRemoved___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isOwner") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isAllowedToAddOrRemoveHAPPairingsOnAccessory");

  return v3;
}

void __69__HMDAuditAccessoryPairingOperation_getPairingsFromAirPlayAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@AirPlay list pairing operation finished with: %@ for accessory: %@, error: %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  v12 = *(void **)(a1 + 48);
  if (v12)
    objc_msgSend(v12, "addObjectsFromArray:", v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __62__HMDAuditAccessoryPairingOperation_getPairingsFromAccessory___block_invoke(id *a1, void *a2)
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
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    dispatch_get_global_queue(-32768, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __62__HMDAuditAccessoryPairingOperation_getPairingsFromAccessory___block_invoke_17;
    v12[3] = &unk_24E7951D0;
    v6 = a1[5];
    v12[4] = a1[4];
    v13 = v6;
    v14 = a1[7];
    v15 = a1[6];
    objc_msgSend(v4, "listPairingsWithCompletionQueue:completionHandler:", v5, v12);

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to list pairing as there is no accessory server for accessory : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    dispatch_group_leave((dispatch_group_t)a1[6]);
  }

}

void __62__HMDAuditAccessoryPairingOperation_getPairingsFromAccessory___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to list pairings for accessory : %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __62__HMDAuditAccessoryPairingOperation_getPairingsFromAccessory___block_invoke_17(uint64_t a1, void *a2, void *a3)
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
  __int16 v16;
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
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v10;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@HAP list pairing operation finished with: %@ for accessory: %@, error: %@", (uint8_t *)&v12, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __64__HMDAuditAccessoryPairingOperation_auditPairings_forAccessory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userWithPairingIdentity:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 48);
    v5 = v3;
  }
  else
  {
    v4 = *(void **)(a1 + 40);
    v5 = v6;
  }
  objc_msgSend(v4, "addObject:", v5);

}

void __64__HMDAuditAccessoryPairingOperation_auditPairings_forAccessory___block_invoke_10(id *a1, void *a2)
{
  id v3;
  HMDAddAccessoryPairingSharedUserOperation *v4;
  id v5;
  void *v6;
  HMDAddAccessoryPairingSharedUserOperation *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
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
  if ((objc_msgSend(v3, "isPending") & 1) != 0
    || (v4 = [HMDAddAccessoryPairingSharedUserOperation alloc],
        v5 = a1[4],
        objc_msgSend(v3, "pairingIdentity"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = -[HMDAddAccessoryPairingSharedUserOperation initWithAccessory:forSharedUser:sharedUserPairingIdentity:asOwner:asSharedAdmin:](v4, "initWithAccessory:forSharedUser:sharedUserPairingIdentity:asOwner:asSharedAdmin:", v5, v3, v6, objc_msgSend(v3, "isOwner"), objc_msgSend(v3, "isAdministrator")), v6, !v7))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = a1[5];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "privilege"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pairingIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544386;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create add pairing operation for pairing identity : %@ (Pv: %@)/%@ of accessory: %@", (uint8_t *)&v16, 0x34u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    objc_msgSend(a1[6], "addObject:", v7);

  }
}

void __64__HMDAuditAccessoryPairingOperation_auditPairings_forAccessory___block_invoke_14(id *a1, void *a2)
{
  id v3;
  HMDRemoveAccessoryPairingSharedUserOperation *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDRemoveAccessoryPairingSharedUserOperation *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = [HMDRemoveAccessoryPairingSharedUserOperation alloc];
  objc_msgSend(a1[4], "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDRemoveAccessoryPairingSharedUserOperation initWithAccessoryUUID:accessoryIdentifier:isOwnerIdentity:forSharedUser:sharedUserPairingIdentity:homeUUIDWhereAccessoryWasPaired:](v4, "initWithAccessoryUUID:accessoryIdentifier:isOwnerIdentity:forSharedUser:sharedUserPairingIdentity:homeUUIDWhereAccessoryWasPaired:", v5, v6, 0, 0, v3, v7);

  if (v8)
  {
    objc_msgSend(a1[7], "addObject:", v8);
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1[6];
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 2112;
      v17 = v3;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remove pairing operation for pairing identity : %@ of accessory: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_152825 != -1)
    dispatch_once(&logCategory__hmf_once_t24_152825, &__block_literal_global_24_152826);
  return (id)logCategory__hmf_once_v25_152827;
}

void __48__HMDAuditAccessoryPairingOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_152827;
  logCategory__hmf_once_v25_152827 = v0;

}

@end
