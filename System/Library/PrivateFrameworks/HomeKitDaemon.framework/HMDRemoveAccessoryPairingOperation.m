@implementation HMDRemoveAccessoryPairingOperation

- (HMDRemoveAccessoryPairingOperation)initWithAccessory:(id)a3 isOwnerIdentity:(BOOL)a4 identityToRemove:(id)a5
{
  return -[HMDRemoveAccessoryPairingOperation initWithAccessory:isOwnerIdentity:identityToRemove:userData:](self, "initWithAccessory:isOwnerIdentity:identityToRemove:userData:", a3, a4, a5, MEMORY[0x24BDBD1B8]);
}

- (HMDRemoveAccessoryPairingOperation)initWithAccessory:(id)a3 isOwnerIdentity:(BOOL)a4 identityToRemove:(id)a5 userData:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDRemoveAccessoryPairingOperation *v18;
  HMDRemoveAccessoryPairingOperation *v20;
  SEL v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;
  id v26;
  id v27;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  if (!v11)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v10, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMDRemoveAccessoryPairingOperation initWithAccessory:accessoryIdentifier:homeUUIDWhereAccessoryWasPaired:isOwnerIdentity:identityToRemove:userData:](self, "initWithAccessory:accessoryIdentifier:homeUUIDWhereAccessoryWasPaired:isOwnerIdentity:identityToRemove:userData:", v14, v15, v17, v8, v11, v13);

    return v18;
  }
LABEL_7:
  v20 = (HMDRemoveAccessoryPairingOperation *)_HMFPreconditionFailure();
  return -[HMDRemoveAccessoryPairingOperation initWithAccessory:accessoryIdentifier:homeUUIDWhereAccessoryWasPaired:isOwnerIdentity:identityToRemove:userData:](v20, v21, v22, v23, v24, v25, v26, v27);
}

- (HMDRemoveAccessoryPairingOperation)initWithAccessory:(id)a3 accessoryIdentifier:(id)a4 homeUUIDWhereAccessoryWasPaired:(id)a5 isOwnerIdentity:(BOOL)a6 identityToRemove:(id)a7 userData:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDRemoveAccessoryPairingOperation *v25;
  HMDRemoveAccessoryPairingOperation *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v10 = a6;
  v34 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v15)
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
  v19 = v18;
  if (!v18)
    goto LABEL_14;
  if (v16)
  {
    v20 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v17, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("PairingIdentifierToRemove"));

    objc_msgSend(v17, "publicKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "data");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("PairingPublicKeyToRemove"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("IsOwnerUser"));

    v31.receiver = self;
    v31.super_class = (Class)HMDRemoveAccessoryPairingOperation;
    v25 = -[HMDAccessoryBackgroundOperation initWithAccessoryUUID:accessoryIdentifier:homeUUIDWhereAccessoryWasPaired:userData:](&v31, sel_initWithAccessoryUUID_accessoryIdentifier_homeUUIDWhereAccessoryWasPaired_userData_, v14, v15, v16, v20);

    v26 = v25;
  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v29;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create remove accessory pairing operation", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    v26 = 0;
  }

  return v26;
}

- (BOOL)mainWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  id v18;
  void *v19;
  unint64_t v20;
  void *v21;
  HMDRemoveAccessoryPairingOperation *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  HMDRemoveAccessoryPairingOperation *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  dispatch_time_t v39;
  void *v40;
  HMDRemoveAccessoryPairingOperation *v41;
  NSObject *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  HMDRemoveAccessoryPairingOperation *v50;
  NSObject *v51;
  id v52;
  void *v53;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  _QWORD aBlock[5];
  id v68;
  id v69;
  NSObject *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  id v78;
  uint8_t buf[4];
  id v80;
  __int16 v81;
  id v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryBackgroundOperation accessoryIdentifier](self, "accessoryIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation userData](self, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PairingIdentifierToRemove"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBackgroundOperation userData](self, "userData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PairingPublicKeyToRemove"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBackgroundOperation userData](self, "userData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_numberForKey:", CFSTR("IsOwnerUser"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = -[HMDAccessoryBackgroundOperation accessoryOperationStatus](self, "accessoryOperationStatus");
  v11 = (void *)objc_opt_class();
  -[HMDAccessoryBackgroundOperation accessoryUUID](self, "accessoryUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation homeManager](self, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "findAccessoryUsing:homeManager:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  v18 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  v58 = (void *)v20;
  if (v17 | v20 && v61 && v60 && v10)
  {
    if (v10 == 1)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "shortDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "home");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v80 = v24;
        v81 = 2112;
        v82 = v25;
        v83 = 2112;
        v84 = v27;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Since the accessory [%@] is already added back to this home [%@], there is no way this operation can successfully run in the future as the required parameters will never be true. Hence marking this operation as finished.", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      v28 = 1;
      goto LABEL_42;
    }
    v78 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Remove accessory pairing operation"));
    dispatch_get_global_queue(-32768, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = dispatch_group_create();
    dispatch_group_enter(v35);
    v72 = 0;
    v73 = &v72;
    v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__255177;
    v76 = __Block_byref_object_dispose__255178;
    v36 = MEMORY[0x24BDAC760];
    v77 = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__HMDRemoveAccessoryPairingOperation_mainWithError___block_invoke;
    aBlock[3] = &unk_24E79C1D0;
    aBlock[4] = self;
    v56 = v61;
    v68 = v56;
    v55 = v18;
    v69 = v55;
    v71 = &v72;
    v37 = v35;
    v70 = v37;
    v57 = _Block_copy(aBlock);
    if (v17)
    {
      v62[0] = v36;
      v62[1] = 3221225472;
      v62[2] = __52__HMDRemoveAccessoryPairingOperation_mainWithError___block_invoke_23;
      v62[3] = &unk_24E79C1F8;
      v63 = v56;
      v64 = v60;
      v65 = v34;
      v66 = v57;
      objc_msgSend((id)v17, "performOperation:linkType:operationBlock:errorBlock:", 6, 0, v62, v66);

      v38 = v63;
    }
    else
    {
      if (!v20)
      {
LABEL_22:
        v39 = dispatch_time(0, 120000000000);
        if (dispatch_group_wait(v37, v39))
        {
          v40 = (void *)MEMORY[0x227676638]();
          v41 = self;
          HMFGetOSLogHandle();
          v42 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v43 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "shortDescription");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v80 = v43;
            v81 = 2112;
            v82 = v56;
            v83 = 2112;
            v84 = v44;
            _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Could not remove accessory pairing %@ from accessory %@ as the operation timed out", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v40);
          if (a3)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 100);
            v45 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:
            v28 = 0;
            *a3 = v45;
            goto LABEL_41;
          }
        }
        else
        {
          v48 = (void *)v73[5];
          if (!v48)
          {
            v28 = 1;
LABEL_41:

            _Block_object_dispose(&v72, 8);
            __HMFActivityScopeLeave();

            goto LABEL_42;
          }
          if (a3)
          {
            v45 = objc_retainAutorelease(v48);
            goto LABEL_39;
          }
        }
LABEL_40:
        v28 = 0;
        goto LABEL_41;
      }
      v46 = objc_alloc(MEMORY[0x24BE1BBB0]);
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F230]), "initWithPairingKeyData:", v60);
      v38 = (void *)objc_msgSend(v46, "initWithIdentifier:publicKey:privateKey:", v56, v47, 0);

      if (!v38)
      {
        v49 = (void *)MEMORY[0x227676638]();
        v50 = self;
        HMFGetOSLogHandle();
        v51 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v52 = (id)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryBackgroundOperation accessoryUUID](v50, "accessoryUUID");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v80 = v52;
          v81 = 2112;
          v82 = v56;
          v83 = 2112;
          v84 = v60;
          v85 = 2112;
          v86 = v53;
          v87 = 2112;
          v88 = v59;
          _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@Unable to create pairing identity from %@/%@ for operation : [%@/%@]", buf, 0x34u);

        }
        objc_autoreleasePoolPop(v49);
        if (a3)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
          v45 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_39;
        }
        goto LABEL_40;
      }
      objc_msgSend(v58, "removeUserPairingIdentity:isOwner:completionHandler:", v38, v9, v57);
    }

    goto LABEL_22;
  }
  v29 = (void *)MEMORY[0x227676638]();
  v30 = self;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBackgroundOperation accessoryUUID](v30, "accessoryUUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v80 = v32;
    v81 = 2112;
    v82 = v33;
    v83 = 2112;
    v84 = v59;
    _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Required parameters does not exist to properly execute this operation : [%@/%@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v29);
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v28 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
LABEL_42:

  return v28;
}

- (NSString)pairingIdentifierToRemove
{
  void *v2;
  void *v3;
  HMDRemoveAccessoryPairingOperation *v5;
  SEL v6;

  -[HMDBackgroundOperation userData](self, "userData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PairingIdentifierToRemove"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return (NSString *)v3;
  v5 = (HMDRemoveAccessoryPairingOperation *)_HMFPreconditionFailure();
  return (NSString *)-[HMDRemoveAccessoryPairingOperation logIdentifier](v5, v6);
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

void __52__HMDRemoveAccessoryPairingOperation_mainWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v3;
      v11 = "%{public}@Unable to remove pairing %@ from accessory %@ with error: %@";
      v12 = v7;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 42;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v12, v13, v11, (uint8_t *)&v19, v14);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v8;
    v21 = 2112;
    v22 = v15;
    v23 = 2112;
    v24 = v10;
    v11 = "%{public}@Successfully removed pairing %@ from accessory %@";
    v12 = v7;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v3;
  v18 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __52__HMDRemoveAccessoryPairingOperation_mainWithError___block_invoke_23(_QWORD *a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "server");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removePairingIdentifier:pairingPublicKey:completionQueue:completionHandler:", a1[4], a1[5], a1[6], a1[7]);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_255205 != -1)
    dispatch_once(&logCategory__hmf_once_t12_255205, &__block_literal_global_255206);
  return (id)logCategory__hmf_once_v13_255207;
}

void __49__HMDRemoveAccessoryPairingOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v13_255207;
  logCategory__hmf_once_v13_255207 = v0;

}

@end
