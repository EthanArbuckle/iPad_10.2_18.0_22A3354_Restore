@implementation HMDPersistAuditAccessoryResultOperation

- (id)initForRestrictedGuestWithAccessory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HMDPersistAuditAccessoryResultOperation *v7;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = CFSTR("HMDBackgroundOpsUpdateAuditTimeForRestrictedGuestKey");
  v11[0] = MEMORY[0x24BDBD1C8];
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)HMDPersistAuditAccessoryResultOperation;
  v7 = -[HMDAccessoryBackgroundOperation initWithAccessory:userData:](&v9, sel_initWithAccessory_userData_, v5, v6);

  return v7;
}

- (BOOL)mainWithError:(id *)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  unint64_t v14;
  BOOL v15;
  void *v16;
  HMDPersistAuditAccessoryResultOperation *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  void *v23;
  HMDPersistAuditAccessoryResultOperation *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v40[4];
  id v41;
  HMDPersistAuditAccessoryResultOperation *v42;
  id v43;
  _BYTE *v44;
  uint64_t *v45;
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = -[HMDAccessoryBackgroundOperation accessoryOperationStatus](self, "accessoryOperationStatus");
  v5 = (void *)objc_opt_class();
  -[HMDAccessoryBackgroundOperation accessoryUUID](self, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation homeManager](self, "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findAccessoryUsing:homeManager:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (!v4)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryUUID](v17, "accessoryUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryIdentifier](v17, "accessoryIdentifier");
      v21 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation homeUUID](v17, "homeUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      v52 = v21;
      LOWORD(v53) = 2112;
      *(_QWORD *)((char *)&v53 + 2) = v22;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to run audit operation on accessory : %@/%@, for Home: %@ due to invalid status", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v16);
    if (a3)
      goto LABEL_18;
    goto LABEL_19;
  }
  if (!(v11 | v14))
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryUUID](v24, "accessoryUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryIdentifier](v24, "accessoryIdentifier");
      v28 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation homeUUID](v24, "homeUUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2112;
      v52 = v28;
      LOWORD(v53) = 2112;
      *(_QWORD *)((char *)&v53 + 2) = v29;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to run audit operation on nil accessory : %@/%@, for Home: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v23);
    if (a3)
    {
LABEL_18:
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v15 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
LABEL_19:
    v15 = 0;
    goto LABEL_23;
  }
  if (v4 == 1)
  {
    v15 = 1;
  }
  else
  {
    -[HMDBackgroundOperation userData](self, "userData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("HMDBackgroundOpsUpdateAuditTimeForRestrictedGuestKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "BOOLValue");

    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v52 = __Block_byref_object_copy__49709;
    *(_QWORD *)&v53 = __Block_byref_object_dispose__49710;
    *((_QWORD *)&v53 + 1) = 0;
    +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "uuid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "contextWithHomeUUID:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __57__HMDPersistAuditAccessoryResultOperation_mainWithError___block_invoke;
    v40[3] = &unk_24E77C750;
    v41 = v12;
    v42 = self;
    v46 = v32;
    v44 = buf;
    v45 = &v47;
    v37 = v36;
    v43 = v37;
    objc_msgSend(v37, "unsafeSynchronousBlock:", v40);
    if (a3)
      *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v15 = *((_BYTE *)v48 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v47, 8);
  }
LABEL_23:

  return v15;
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

void __57__HMDPersistAuditAccessoryResultOperation_mainWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id obj;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findAccessoryWithModelID:](HMCContext, "findAccessoryWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "castIfHAPAccessory");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "castIfAirPlayAccessory");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 | v5)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v4, "setLastPairingAuditTimeForRG:", v7);
    }
    else
    {
      if (v4)
      {
        objc_msgSend((id)v4, "setNeedsPairingAudit:", MEMORY[0x24BDBD1C0]);
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)v4;
      }
      else
      {
        if (!v5)
        {
LABEL_13:
          v17 = *(void **)(a1 + 48);
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          obj = *(id *)(v18 + 40);
          v19 = objc_msgSend(v17, "save:", &obj);
          objc_storeStrong((id *)(v18 + 40), obj);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v19;
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
            || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
          {
            v20 = (void *)MEMORY[0x227676638]();
            v21 = *(id *)(a1 + 40);
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
              *(_DWORD *)buf = 138543874;
              v27 = v23;
              v28 = 2112;
              v29 = v4;
              v30 = 2112;
              v31 = v24;
              _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to save needsAudit & lastAuditTime on the accessory : %@, %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v20);
          }
          goto LABEL_18;
        }
        objc_msgSend((id)v5, "setNeedsPairingAudit:", MEMORY[0x24BDBD1C0]);
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v6;
      }
      objc_msgSend(v16, "setLastPairingAuditTime:", v7);
    }

    goto LABEL_13;
  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v11;
    v28 = 2112;
    v29 = (uint64_t)v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the mkfHAPAccessory or mkfAirPlayAccessory with model id: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

LABEL_18:
}

+ (id)predicate
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_49723 != -1)
    dispatch_once(&logCategory__hmf_once_t8_49723, &__block_literal_global_49724);
  return (id)logCategory__hmf_once_v9_49725;
}

void __54__HMDPersistAuditAccessoryResultOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_49725;
  logCategory__hmf_once_v9_49725 = v0;

}

@end
