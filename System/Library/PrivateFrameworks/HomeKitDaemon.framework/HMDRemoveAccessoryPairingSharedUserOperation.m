@implementation HMDRemoveAccessoryPairingSharedUserOperation

- (HMDRemoveAccessoryPairingSharedUserOperation)initWithAccessory:(id)a3 isOwnerIdentity:(BOOL)a4 sharedUser:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDRemoveAccessoryPairingSharedUserOperation *v18;
  HMDRemoveAccessoryPairingSharedUserOperation *v20;
  SEL v21;
  id v22;
  id v23;
  BOOL v24;
  id v25;
  id v26;
  id v27;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  objc_msgSend(v9, "pairingIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pairingIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMDRemoveAccessoryPairingSharedUserOperation initWithAccessoryUUID:accessoryIdentifier:isOwnerIdentity:forSharedUser:sharedUserPairingIdentity:homeUUIDWhereAccessoryWasPaired:](self, "initWithAccessoryUUID:accessoryIdentifier:isOwnerIdentity:forSharedUser:sharedUserPairingIdentity:homeUUIDWhereAccessoryWasPaired:", v12, v13, v6, v14, v15, v17);

    return v18;
  }
LABEL_7:
  v20 = (HMDRemoveAccessoryPairingSharedUserOperation *)_HMFPreconditionFailure();
  return -[HMDRemoveAccessoryPairingSharedUserOperation initWithAccessoryUUID:accessoryIdentifier:isOwnerIdentity:forSharedUser:sharedUserPairingIdentity:homeUUIDWhereAccessoryWasPaired:](v20, v21, v22, v23, v24, v25, v26, v27);
}

- (HMDRemoveAccessoryPairingSharedUserOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 isOwnerIdentity:(BOOL)a5 forSharedUser:(id)a6 sharedUserPairingIdentity:(id)a7 homeUUIDWhereAccessoryWasPaired:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  HMDRemoveAccessoryPairingSharedUserOperation *v21;
  HMDRemoveAccessoryPairingSharedUserOperation *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v11 = a5;
  v30 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v15)
  {
LABEL_11:
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  if (!v17)
    goto LABEL_12;
  v19 = v18;
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, CFSTR("sharedUserUUIDKey"));
    v27.receiver = self;
    v27.super_class = (Class)HMDRemoveAccessoryPairingSharedUserOperation;
    v21 = -[HMDRemoveAccessoryPairingOperation initWithAccessory:accessoryIdentifier:homeUUIDWhereAccessoryWasPaired:isOwnerIdentity:identityToRemove:userData:](&v27, sel_initWithAccessory_accessoryIdentifier_homeUUIDWhereAccessoryWasPaired_isOwnerIdentity_identityToRemove_userData_, v14, v15, v19, v11, v17, v20);

    v22 = v21;
  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create remove accessory pairing shared user operation", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v22 = 0;
  }

  return v22;
}

- (BOOL)mainWithError:(id *)a3
{
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  HMDRemoveAccessoryPairingSharedUserOperation *v9;
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
  _QWORD v24[5];
  id v25;
  id v26;
  _BYTE *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  objc_super v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)HMDRemoveAccessoryPairingSharedUserOperation;
  v5 = -[HMDRemoveAccessoryPairingOperation mainWithError:](&v33, sel_mainWithError_);
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
      v35 = v13;
      LOWORD(v36) = 2112;
      *(_QWORD *)((char *)&v36 + 2) = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully removed pairing for the shared user: %@ on the accessory : %@/%@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v35 = __Block_byref_object_copy__238236;
    *(_QWORD *)&v36 = __Block_byref_object_dispose__238237;
    *((_QWORD *)&v36 + 1) = 0;
    +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBackgroundOperation homeUUID](v9, "homeUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contextWithHomeUUID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __62__HMDRemoveAccessoryPairingSharedUserOperation_mainWithError___block_invoke;
    v24[3] = &unk_24E7989B8;
    v24[4] = v9;
    v27 = buf;
    v25 = v7;
    v28 = &v29;
    v18 = v17;
    v26 = v18;
    objc_msgSend(v18, "unsafeSynchronousBlock:", v24);
    if (a3)
      *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v19 = *((_BYTE *)v30 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v29, 8);
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
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      v35 = v21;
      LOWORD(v36) = 2112;
      *(_QWORD *)((char *)&v36 + 2) = v22;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove pairing for shared user : %@ for accessory: %@/%@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    v19 = 0;
  }

  return v19;
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

void __62__HMDRemoveAccessoryPairingSharedUserOperation_mainWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  char v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  _QWORD v48[4];
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findAccessoryWithModelID:](HMCContext, "findAccessoryWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "castIfHAPAccessory");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "castIfAirPlayAccessory");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;
  if (v4 | v5)
  {
    if (!*(_QWORD *)(a1 + 40)
      || (+[HMCContext findUserWithModelID:](HMCContext, "findUserWithModelID:"),
          (v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "pairingIdentifierToRemove");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x227676638]();
      v21 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      v46 = v3;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (void *)v4;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v19;
        v25 = *(void **)(a1 + 40);
        objc_msgSend(v45, "pairingsToRemove");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v52 = v23;
        v53 = 2112;
        v54 = v25;
        v19 = v24;
        v55 = 2112;
        v56 = v24;
        v57 = 2112;
        v58 = v26;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Unable to find the mkfUser with model id: %@, %@, [%@]", buf, 0x2Au);

        v4 = (uint64_t)v45;
      }

      objc_autoreleasePoolPop(v20);
      if (v4)
      {
        objc_msgSend((id)v4, "pairingsToRemove");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 1;
      }
      else
      {
        objc_msgSend((id)v5, "pairingsToRemove");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v28 = (void *)objc_msgSend(v27, "mutableCopy");
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __62__HMDRemoveAccessoryPairingSharedUserOperation_mainWithError___block_invoke_16;
      v48[3] = &unk_24E798990;
      v29 = v19;
      v49 = v29;
      v30 = v28;
      v50 = v30;
      v31 = objc_msgSend(v27, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v48);
      if (v6)
      {
        if (v4)
          v32 = (void *)v4;
        else
          v32 = (void *)v5;
        v31 = objc_msgSend(v32, "setPairingsToRemove:", v30);
      }
      v33 = (void *)MEMORY[0x227676638](v31);
      v34 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v52 = v36;
        v53 = 2112;
        v54 = v29;
        v55 = 2112;
        v56 = v30;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Removed pairing : [%@], new list: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v33);

      v8 = 0;
      v3 = v46;
      goto LABEL_25;
    }
    v8 = (void *)v7;
    if (v4)
    {
      v9 = (void *)v4;
    }
    else
    {
      if (!v5)
      {
LABEL_25:
        v37 = *(void **)(a1 + 48);
        v38 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        obj = *(id *)(v38 + 40);
        v39 = objc_msgSend(v37, "save:", &obj);
        objc_storeStrong((id *)(v38 + 40), obj);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v39;
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
          || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          v40 = (void *)MEMORY[0x227676638]();
          v41 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            *(_DWORD *)buf = 138543874;
            v52 = v43;
            v53 = 2112;
            v54 = v3;
            v55 = 2112;
            v56 = v44;
            _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Unable to save after removing user pairings on the accessory : %@, %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v40);
        }
        goto LABEL_30;
      }
      v9 = (void *)v5;
    }
    objc_msgSend(v9, "removePairedUsersObject:", v8);
    goto LABEL_25;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessoryIdentifier");
    v15 = v3;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v52 = v13;
    v53 = 2112;
    v54 = v14;
    v55 = 2112;
    v56 = v16;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the mkfHAPAccessory or mkfAirPlayAccessory with model id: %@/%@", buf, 0x20u);

    v3 = v15;
  }

  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;
LABEL_30:

}

void __62__HMDRemoveAccessoryPairingSharedUserOperation_mainWithError___block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = HMFEqualObjects();

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_238263 != -1)
    dispatch_once(&logCategory__hmf_once_t7_238263, &__block_literal_global_238264);
  return (id)logCategory__hmf_once_v8_238265;
}

void __59__HMDRemoveAccessoryPairingSharedUserOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_238265;
  logCategory__hmf_once_v8_238265 = v0;

}

@end
