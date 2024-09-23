@implementation HMDAddAccessoryPairingOperation

- (HMDAddAccessoryPairingOperation)initWithAccessory:(id)a3 newPairingIdentity:(id)a4 asOwner:(BOOL)a5 asAdmin:(BOOL)a6 shouldUpdateKeyChainEntry:(BOOL)a7
{
  return -[HMDAddAccessoryPairingOperation initWithAccessory:newPairingIdentity:asOwner:asAdmin:shouldUpdateKeyChainEntry:userData:](self, "initWithAccessory:newPairingIdentity:asOwner:asAdmin:shouldUpdateKeyChainEntry:userData:", a3, a4, a5, a6, a7, MEMORY[0x24BDBD1B8]);
}

- (HMDAddAccessoryPairingOperation)initWithAccessory:(id)a3 newPairingIdentity:(id)a4 asOwner:(BOOL)a5 asAdmin:(BOOL)a6 shouldUpdateKeyChainEntry:(BOOL)a7 userData:(id)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _BOOL8 v22;
  void *v23;
  HMDAddAccessoryPairingOperation *v24;
  HMDAddAccessoryPairingOperation *v26;
  SEL v27;
  id v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;
  BOOL v33;
  uint64_t v34;
  BOOL v35;
  void *v36;

  v10 = a6;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a8;
  if (v14)
  {
    if (v15)
    {
      v17 = v16;
      objc_msgSend(v14, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "home");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uuid");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v10;
      v23 = (void *)v21;
      LOBYTE(v34) = a7;
      v24 = -[HMDAddAccessoryPairingOperation initWithAccessoryUUID:accessoryIdentifier:newPairingIdentity:homeUUIDWhereAccessoryWasPaired:asOwner:asAdmin:shouldUpdateKeyChainEntry:userData:](self, "initWithAccessoryUUID:accessoryIdentifier:newPairingIdentity:homeUUIDWhereAccessoryWasPaired:asOwner:asAdmin:shouldUpdateKeyChainEntry:userData:", v18, v19, v15, v21, v11, v22, v34, v17);

      return v24;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v26 = (HMDAddAccessoryPairingOperation *)_HMFPreconditionFailure();
  return -[HMDAddAccessoryPairingOperation initWithAccessoryUUID:accessoryIdentifier:newPairingIdentity:homeUUIDWhereAccessoryWasPaired:asOwner:asAdmin:shouldUpdateKeyChainEntry:userData:](v26, v27, v28, v29, v30, v31, v32, v33, v35, v36);
}

- (HMDAddAccessoryPairingOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 newPairingIdentity:(id)a5 homeUUIDWhereAccessoryWasPaired:(id)a6 asOwner:(BOOL)a7 asAdmin:(BOOL)a8 shouldUpdateKeyChainEntry:(BOOL)a9 userData:(id)a10
{
  _BOOL4 v10;
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAddAccessoryPairingOperation *v29;
  HMDAddAccessoryPairingOperation *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  HMDAddAccessoryPairingOperation *v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v10 = a8;
  v11 = a7;
  v43 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a10;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  v21 = v20;
  if (!v20)
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
  if (v19)
  {
    v22 = (void *)objc_msgSend(v20, "mutableCopy");
    objc_msgSend(v18, "identifier");
    v35 = self;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("newPairingIdentifier"));

    objc_msgSend(v18, "publicKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "data");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, CFSTR("newPairingPublicKey"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("IsOwnerUser"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, CFSTR("newPairingPermission"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, CFSTR("shouldUpdateKeyChainEntry"));

    v36.receiver = v35;
    v36.super_class = (Class)HMDAddAccessoryPairingOperation;
    v29 = -[HMDAccessoryBackgroundOperation initWithAccessoryUUID:accessoryIdentifier:homeUUIDWhereAccessoryWasPaired:userData:](&v36, sel_initWithAccessoryUUID_accessoryIdentifier_homeUUIDWhereAccessoryWasPaired_userData_, v16, v17, v19, v22);

    v30 = v29;
  }
  else
  {
    v31 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v33;
      v39 = 2112;
      v40 = v16;
      v41 = 2112;
      v42 = v17;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create add accessory pairing operation for accessory: %@/%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v31);
    v30 = 0;
  }

  return v30;
}

- (BOOL)mainWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unint64_t v18;
  id v19;
  void *v20;
  unint64_t v21;
  HMDAddAccessoryPairingOperation *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  HMDAddAccessoryPairingOperation *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v40;
  unsigned int v41;
  void *contexta;
  void *v44;
  _BYTE buf[12];
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryBackgroundOperation accessoryIdentifier](self, "accessoryIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation userData](self, "userData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("newPairingIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBackgroundOperation userData](self, "userData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("newPairingPublicKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBackgroundOperation userData](self, "userData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_numberForKey:", CFSTR("IsOwnerUser"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = -[HMDAccessoryBackgroundOperation accessoryOperationStatus](self, "accessoryOperationStatus");
  v12 = (void *)objc_opt_class();
  -[HMDAccessoryBackgroundOperation accessoryUUID](self, "accessoryUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation homeManager](self, "homeManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "findAccessoryUsing:homeManager:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  v19 = v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  if (v18 | v21 && v5 && v7 && v11)
  {
    if (v11 == 1)
    {
      contexta = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "home");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "uuid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v40;
        v46 = 2112;
        v47 = v24;
        v48 = 2112;
        v49 = v26;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Since the accessory [%@] is already added back to this home [%@], there is no way this operation can successfully run in the future as the required parameters will never be true. Hence marking this operation as finished.", buf, 0x20u);

      }
      objc_autoreleasePoolPop(contexta);
      v27 = 1;
    }
    else
    {
      -[HMDBackgroundOperation userData](self, "userData");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("newPairingPermission"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v10;
      v35 = objc_msgSend(v34, "unsignedIntValue");

      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F230]), "initWithPairingKeyData:", v7);
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BBB0]), "initWithIdentifier:publicKey:privateKey:permissions:", v5, v36, 0, v35);
      *(_QWORD *)buf = objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Add accessory pairing operation"));
      if (v18)
        v38 = -[HMDAddAccessoryPairingOperation addPairingToHAPAccessory:newPairingIdentity:permissions:error:](self, "addPairingToHAPAccessory:newPairingIdentity:permissions:error:", v18, v37, v35, a3);
      else
        v38 = -[HMDAddAccessoryPairingOperation addPairingToAirPlayAccessory:newPairingIdentity:isOwner:error:](self, "addPairingToAirPlayAccessory:newPairingIdentity:isOwner:error:", v21, v37, v41, a3);
      v27 = v38;
      __HMFActivityScopeLeave();

    }
  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryUUID](v29, "accessoryUUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v31;
      v46 = 2112;
      v47 = v32;
      v48 = 2112;
      v49 = v44;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Required parameters does not exist to properly execute this operation : [%@/%@]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v27 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
  }

  return v27;
}

- (void)associateNewControllerKeyWithAccessory:(id)a3 controllerKeyIdentifierToAssociate:(id)a4 permissions:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id);
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  HMDAddAccessoryPairingOperation *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, id))a6;
  v13 = objc_alloc(MEMORY[0x24BE1BBB0]);
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x24BE3F230]);
  objc_msgSend(v10, "publicKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithPairingKeyData:", v16);
  v18 = (void *)objc_msgSend(v13, "initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:", v14, v11, v17, 0, a5);

  v25 = 0;
  objc_msgSend(v10, "associateControllerKeyWithAccessory:error:", v18, &v25);
  v19 = v25;
  v20 = (void *)MEMORY[0x227676638]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v23;
    v28 = 2112;
    v29 = v24;
    v30 = 2112;
    v31 = v19;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating new pairing identity to key chain finished for accessory: %@ with error : %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v20);
  v12[2](v12, v19);

}

- (BOOL)addPairingToHAPAccessory:(id)a3 newPairingIdentity:(id)a4 permissions:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  dispatch_time_t v21;
  void *v22;
  HMDAddAccessoryPairingOperation *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  BOOL v30;
  void *v32;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD aBlock[5];
  id v39;
  id v40;
  NSObject *v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  dispatch_get_global_queue(-32768, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__130843;
  v48 = __Block_byref_object_dispose__130844;
  v13 = MEMORY[0x24BDAC760];
  v49 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__HMDAddAccessoryPairingOperation_addPairingToHAPAccessory_newPairingIdentity_permissions_error___block_invoke;
  aBlock[3] = &unk_24E787240;
  aBlock[4] = self;
  v14 = v10;
  v39 = v14;
  v15 = v9;
  v40 = v15;
  v16 = v12;
  v42 = &v44;
  v43 = a5;
  v41 = v16;
  v17 = _Block_copy(aBlock);
  v34[0] = v13;
  v34[1] = 3221225472;
  v34[2] = __97__HMDAddAccessoryPairingOperation_addPairingToHAPAccessory_newPairingIdentity_permissions_error___block_invoke_34;
  v34[3] = &unk_24E787268;
  v18 = v14;
  v35 = v18;
  v19 = v11;
  v36 = v19;
  v20 = v17;
  v37 = v20;
  objc_msgSend(v15, "performOperation:linkType:operationBlock:errorBlock:", 5, 0, v34, v20);
  v21 = dispatch_time(0, 120000000000);
  if (!dispatch_group_wait(v16, v21))
  {
    v29 = (void *)v45[5];
    if (!v29)
    {
      v30 = 1;
      goto LABEL_12;
    }
    if (a6)
    {
      v28 = objc_retainAutorelease(v29);
      goto LABEL_9;
    }
LABEL_10:
    v30 = 0;
    goto LABEL_12;
  }
  v22 = (void *)MEMORY[0x227676638]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v32 = v22;
    HMFGetLogIdentifier();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v51 = v25;
    v52 = 2112;
    v53 = v26;
    v54 = 2112;
    v55 = v27;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Could not add new pairing %@ to accessory %@", buf, 0x20u);

    v22 = v32;
  }

  objc_autoreleasePoolPop(v22);
  if (!a6)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 100);
  v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v30 = 0;
  *a6 = v28;
LABEL_12:

  _Block_object_dispose(&v44, 8);
  return v30;
}

- (BOOL)addPairingToAirPlayAccessory:(id)a3 newPairingIdentity:(id)a4 isOwner:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  dispatch_time_t v15;
  HMDAddAccessoryPairingOperation *v16;
  NSObject *v17;
  id *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  void *context;
  _QWORD v27[5];
  id v28;
  NSObject *v29;
  uint64_t *v30;
  id v31;
  id location;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v7 = a5;
  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__130843;
  v37 = __Block_byref_object_dispose__130844;
  v38 = 0;
  objc_initWeak(&location, v10);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __97__HMDAddAccessoryPairingOperation_addPairingToAirPlayAccessory_newPairingIdentity_isOwner_error___block_invoke;
  v27[3] = &unk_24E787290;
  objc_copyWeak(&v31, &location);
  v27[4] = self;
  v13 = v11;
  v28 = v13;
  v30 = &v33;
  v14 = v12;
  v29 = v14;
  objc_msgSend(v10, "addUserPairingIdentity:isOwner:completionHandler:", v13, v7, v27);
  v15 = dispatch_time(0, 120000000000);
  if (!dispatch_group_wait(v14, v15))
  {
    v23 = (void *)v34[5];
    if (!v23)
    {
      v24 = 1;
      goto LABEL_12;
    }
    if (a6)
    {
      v22 = objc_retainAutorelease(v23);
      goto LABEL_9;
    }
LABEL_10:
    v24 = 0;
    goto LABEL_12;
  }
  context = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = a6;
    HMFGetLogIdentifier();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v19;
    v41 = 2112;
    v42 = v20;
    v43 = 2112;
    v44 = v21;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not add new pairing %@ to accessory %@", buf, 0x20u);

    a6 = v18;
  }

  objc_autoreleasePoolPop(context);
  if (!a6)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 100);
  v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v24 = 0;
  *a6 = v22;
LABEL_12:

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v33, 8);

  return v24;
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

void __97__HMDAddAccessoryPairingOperation_addPairingToAirPlayAccessory_newPairingIdentity_isOwner_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v3;
      v12 = "%{public}@Unable to add new pairing %@ to accessory %@ with error: %@";
      v13 = v8;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 42;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v13, v14, v12, (uint8_t *)&v19, v15);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    v12 = "%{public}@Successfully added new pairing %@ to accessory %@.";
    v13 = v8;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v5);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v3;
  v18 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __97__HMDAddAccessoryPairingOperation_addPairingToHAPAccessory_newPairingIdentity_permissions_error___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  id v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v7;
      v36 = 2112;
      v37 = v8;
      v38 = 2112;
      v39 = (uint64_t)v9;
      v40 = 2112;
      v41 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to add new pairing %@ to accessory %@ with error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "userData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hmf_BOOLForKey:", CFSTR("shouldUpdateKeyChainEntry"));

    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "shortDescription");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = CFSTR("Will not");
      *(_DWORD *)buf = 138544130;
      v35 = v15;
      if (v11)
        v19 = CFSTR("Will");
      v36 = 2112;
      v37 = v16;
      v38 = 2112;
      v39 = v17;
      v40 = 2112;
      v41 = v19;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Successfully added new pairing %@ to accessory %@. %@ update the keychain entry", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    if (v11)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
      v20 = *(_QWORD *)(a1 + 48);
      v21 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 72);
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __97__HMDAddAccessoryPairingOperation_addPairingToHAPAccessory_newPairingIdentity_permissions_error___block_invoke_32;
      v30[3] = &unk_24E79C1D0;
      v24 = *(void **)(a1 + 40);
      v30[4] = *(_QWORD *)(a1 + 32);
      v31 = v24;
      v32 = *(id *)(a1 + 48);
      v29 = *(_OWORD *)(a1 + 56);
      v25 = (id)v29;
      v33 = v29;
      objc_msgSend(v21, "associateNewControllerKeyWithAccessory:controllerKeyIdentifierToAssociate:permissions:withCompletion:", v20, v22, v23, v30);

    }
  }
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v3;
  v28 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __97__HMDAddAccessoryPairingOperation_addPairingToHAPAccessory_newPairingIdentity_permissions_error___block_invoke_34(_QWORD *a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "server");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addPairing:completionQueue:completionHandler:", a1[4], a1[5], a1[6]);

}

void __97__HMDAddAccessoryPairingOperation_addPairingToHAPAccessory_newPairingIdentity_permissions_error___block_invoke_32(uint64_t a1, void *a2)
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
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Could not store new pairing identity [%@] for accessory [%@] to keychain. [%@]", (uint8_t *)&v13, 0x2Au);

    }
    objc_autoreleasePoolPop(v4);
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v3;
  v12 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_130894 != -1)
    dispatch_once(&logCategory__hmf_once_t16_130894, &__block_literal_global_130895);
  return (id)logCategory__hmf_once_v17_130896;
}

void __46__HMDAddAccessoryPairingOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17_130896;
  logCategory__hmf_once_v17_130896 = v0;

}

@end
