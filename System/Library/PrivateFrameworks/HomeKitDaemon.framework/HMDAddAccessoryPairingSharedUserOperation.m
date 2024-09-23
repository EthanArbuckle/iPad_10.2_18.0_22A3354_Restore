@implementation HMDAddAccessoryPairingSharedUserOperation

- (HMDAddAccessoryPairingSharedUserOperation)initWithAccessory:(id)a3 forSharedUser:(id)a4 sharedUserPairingIdentity:(id)a5 asOwner:(BOOL)a6 asSharedAdmin:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BOOL8 v21;
  void *v22;
  HMDAddAccessoryPairingSharedUserOperation *v23;
  HMDAddAccessoryPairingSharedUserOperation *v25;
  SEL v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  BOOL v32;
  void *v33;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  if (!v13)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v12, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uuid");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v7;
    v22 = (void *)v20;
    v23 = -[HMDAddAccessoryPairingSharedUserOperation initWithAccessoryUUID:accessoryIdentifier:forSharedUser:sharedUserPairingIdentity:asOwner:asSharedAdmin:homeUUIDWhereAccessoryWasPaired:](self, "initWithAccessoryUUID:accessoryIdentifier:forSharedUser:sharedUserPairingIdentity:asOwner:asSharedAdmin:homeUUIDWhereAccessoryWasPaired:", v16, v17, v18, v15, v8, v21, v20);

    return v23;
  }
LABEL_7:
  v25 = (HMDAddAccessoryPairingSharedUserOperation *)_HMFPreconditionFailure();
  return -[HMDAddAccessoryPairingSharedUserOperation initWithAccessoryUUID:accessoryIdentifier:forSharedUser:sharedUserPairingIdentity:asOwner:asSharedAdmin:homeUUIDWhereAccessoryWasPaired:](v25, v26, v27, v28, v29, v30, v31, v32, v33);
}

- (HMDAddAccessoryPairingSharedUserOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 forSharedUser:(id)a5 sharedUserPairingIdentity:(id)a6 asOwner:(BOOL)a7 asSharedAdmin:(BOOL)a8 homeUUIDWhereAccessoryWasPaired:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  HMDAddAccessoryPairingSharedUserOperation *v22;
  HMDAddAccessoryPairingSharedUserOperation *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v9 = a8;
  v10 = a7;
  v31 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v16)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v17)
  {
LABEL_13:
    _HMFPreconditionFailure();
LABEL_14:
    _HMFPreconditionFailure();
  }
  if (!v18)
    goto LABEL_14;
  v20 = v19;
  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, CFSTR("sharedUserUUIDKey"));
    v28.receiver = self;
    v28.super_class = (Class)HMDAddAccessoryPairingSharedUserOperation;
    v22 = -[HMDAddAccessoryPairingOperation initWithAccessoryUUID:accessoryIdentifier:newPairingIdentity:homeUUIDWhereAccessoryWasPaired:asOwner:asAdmin:shouldUpdateKeyChainEntry:userData:](&v28, sel_initWithAccessoryUUID_accessoryIdentifier_newPairingIdentity_homeUUIDWhereAccessoryWasPaired_asOwner_asAdmin_shouldUpdateKeyChainEntry_userData_, v15, v16, v18, v20, v10, v9, 0, v21);

    v23 = v22;
  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create add accessory pairing shared user operation", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    v23 = 0;
  }

  return v23;
}

- (BOOL)mainWithError:(id *)a3
{
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAddAccessoryPairingSharedUserOperation *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  id v23;
  _QWORD v25[5];
  id v26;
  id v27;
  _BYTE *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  objc_super v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  _BYTE v37[20];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)HMDAddAccessoryPairingSharedUserOperation;
  v5 = -[HMDAddAccessoryPairingOperation mainWithError:](&v34, sel_mainWithError_);
  -[HMDBackgroundOperation userData](self, "userData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sharedUserUUIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryUUID](v9, "accessoryUUID");
      v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryIdentifier](v9, "accessoryIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      v36 = v13;
      *(_WORD *)v37 = 2112;
      *(_QWORD *)&v37[2] = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully added pairing for the shared user: %@ on the accessory : %@/%@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v36 = __Block_byref_object_copy__229357;
    *(_QWORD *)v37 = __Block_byref_object_dispose__229358;
    *(_QWORD *)&v37[8] = 0;
    +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBackgroundOperation homeUUID](v9, "homeUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contextWithHomeUUID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __59__HMDAddAccessoryPairingSharedUserOperation_mainWithError___block_invoke;
    v25[3] = &unk_24E7989B8;
    v25[4] = v9;
    v28 = buf;
    v26 = v7;
    v29 = &v30;
    v18 = v17;
    v27 = v18;
    objc_msgSend(v18, "unsafeSynchronousBlock:", v25);
    if (a3)
      *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v19 = *((_BYTE *)v31 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryUUID](v9, "accessoryUUID");
      v21 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryIdentifier](v9, "accessoryIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *a3;
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      v36 = v21;
      *(_WORD *)v37 = 2112;
      *(_QWORD *)&v37[2] = v22;
      *(_WORD *)&v37[10] = 2112;
      *(_QWORD *)&v37[12] = v23;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to add pairing for shared user : %@ for accessory: %@/%@, error: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v8);
    v19 = 0;
  }

  return v19;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)HMDAddAccessoryPairingSharedUserOperation;
  -[HMDAccessoryBackgroundOperation attributeDescriptions](&v11, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBackgroundOperation userData](self, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("sharedUserUUIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("sharedUserUUID"), v6);
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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

void __59__HMDAddAccessoryPairingSharedUserOperation_mainWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id obj;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findAccessoryWithModelID:](HMCContext, "findAccessoryWithModelID:", v2);
  v3 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v3, "castIfHAPAccessory");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "castIfAirPlayAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 | v3)
  {
    +[HMCContext findUserWithModelID:](HMCContext, "findUserWithModelID:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)v4;
      if (v4 || (v8 = v5) != 0)
        objc_msgSend(v8, "addPairedUsersObject:", v7);
      v9 = *(void **)(a1 + 48);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      obj = *(id *)(v10 + 40);
      v11 = objc_msgSend(v9, "save:", &obj);
      objc_storeStrong((id *)(v10 + 40), obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
        || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v12 = (void *)MEMORY[0x227676638]();
        v13 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          *(_DWORD *)buf = 138543874;
          v35 = v15;
          v36 = 2112;
          v37 = v3;
          v38 = 2112;
          v39 = v16;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to save after adding user pairings on accessory : %@, %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v12);
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
        v29 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v35 = v28;
        v36 = 2112;
        v37 = v29;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the mkfUser with model id: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v32 = *(void **)(v31 + 40);
      *(_QWORD *)(v31 + 40) = v30;

      v7 = 0;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessoryIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v20;
      v36 = 2112;
      v37 = (uint64_t)v21;
      v38 = 2112;
      v39 = v22;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the mkfHAPAccessory or mkfAccessory with model id: %@/%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_229381 != -1)
    dispatch_once(&logCategory__hmf_once_t6_229381, &__block_literal_global_229382);
  return (id)logCategory__hmf_once_v7_229383;
}

void __56__HMDAddAccessoryPairingSharedUserOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_229383;
  logCategory__hmf_once_v7_229383 = v0;

}

@end
