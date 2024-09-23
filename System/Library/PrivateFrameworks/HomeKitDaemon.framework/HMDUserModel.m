@implementation HMDUserModel

- (id)cd_fetchManagedObjectInContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDUserModel *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDUserModel *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[HMDBackingStoreModelObject managedObject](self, "managedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBackingStoreModelObject uuid](v10, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBackingStoreModelObject parentUUID](v10, "parentUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138544130;
        v26 = v12;
        v27 = 2112;
        v28 = v7;
        v29 = 2112;
        v30 = v13;
        v31 = 2112;
        v32 = v14;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_FAULT, "%{public}@[User/Guest] Managed object context appears to be reset on this object %@, someone did something very bad: %@/%@", (uint8_t *)&v25, 0x2Au);

      }
      objc_autoreleasePoolPop(v9);
    }
  }
  else
  {
    -[HMDBackingStoreModelObject uuid](self, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFHome findHomeMemberWithUUID:context:](_MKFHome, "findHomeMemberWithUUID:context:", v15, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "castIfMemberIsUser");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v16, "castIfMemberIsUser");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBackingStoreModelObject setManagedObject:](self, "setManagedObject:", v7);
      }
      else
      {
        objc_msgSend(v16, "castIfMemberIsGuest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v16, "castIfMemberIsGuest");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          HMDCastIfManagedObjectBSORepresentable(v19);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDBackingStoreModelObject setManagedObject:](self, "setManagedObject:", v7);

        }
        else
        {
          v20 = (void *)MEMORY[0x227676638]();
          v21 = self;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138543362;
            v26 = v23;
            _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Got the home member which is neither User nor Guest.", (uint8_t *)&v25, 0xCu);

          }
          objc_autoreleasePoolPop(v20);
          v7 = 0;
        }
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("pairingIdentity")))
  {
    v11 = v8;
    v12 = v11;
    if (self)
    {
      objc_msgSend(v11, "pairingIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v12, "pairingIdentity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hmd_dictionaryEncoding");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

    v22 = (void *)*MEMORY[0x24BDBD430];
    if (v15)
      v22 = v15;
    v20 = v22;

  }
  else
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("photosPersonDataZoneUUIDString")))
    {
      objc_msgSend(v8, "photosPersonDataZoneUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = (void *)*MEMORY[0x24BDBD430];
      if (v17)
        v19 = (void *)v17;
      v20 = v19;

    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("reverseShareToken")))
      {
        v24.receiver = self;
        v24.super_class = (Class)HMDUserModel;
        -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v24, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      v21 = (void *)objc_opt_class();
      objc_msgSend(v8, "reverseShareToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "keyedArchiveToken:", v16);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_17:

  return v20;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  HMDUserModel *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDUserModel *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  objc_super v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("pairingIdentity")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("photosPersonDataZoneUUID")))
    {
      if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("photosPersonDataZoneUUIDString")))
      {
        -[HMDUserModel photosPersonDataZoneUUIDString](self, "photosPersonDataZoneUUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);
        else
          v14 = 0;
        v22 = (void *)*MEMORY[0x24BDBD430];
        if (v14)
          v22 = v14;
        v11 = v22;

        goto LABEL_28;
      }
LABEL_15:
      v11 = 0;
      goto LABEL_29;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("reverseShareToken")))
    {
      if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("reverseShareToken")))
      {
        v15 = (void *)objc_opt_class();
        -[HMDUserModel reverseShareToken](self, "reverseShareToken");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shareTokenFromKeyedArchiveData:", v12);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        v18 = (void *)*MEMORY[0x24BDBD430];
        if (v16)
          v18 = (void *)v16;
        v11 = v18;

        goto LABEL_21;
      }
      goto LABEL_15;
    }
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("ownedHome")))
    {
      v40.receiver = self;
      v40.super_class = (Class)HMDUserModel;
      -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v40, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("privilege")))
    {
      -[HMDUserModel privilege](self, "privilege");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntegerValue");

      if (v20 != 3)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_23:
        v11 = (id)v21;
        goto LABEL_29;
      }
LABEL_33:
      -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v28, objc_opt_class(), &v41);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v14 = v41;

      if (v11)
      {
        v29 = v11;
      }
      else
      {
        v35 = (void *)MEMORY[0x227676638]();
        v36 = self;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDBackingStoreModelObject parentUUID](v36, "parentUUID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v44 = v38;
          v45 = 2112;
          v46 = v39;
          v47 = 2112;
          v48 = v14;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFHome with UUID %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v35);
      }

      goto LABEL_28;
    }
    -[HMDBackingStoreModelObject uuid](self, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v24, objc_opt_class(), &v42);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v42;

    if (v25)
    {
      objc_msgSend(v25, "privilege");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "unsignedIntegerValue");

      if (v27 == 3)
      {

        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBackingStoreModelObject uuid](v31, "uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v33;
        v45 = 2112;
        v46 = v34;
        v47 = 2112;
        v48 = v14;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFUser with UUID %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      v11 = 0;
    }

LABEL_28:
    goto LABEL_29;
  }
  v11 = 0;
  if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("pairingIdentity")) && self)
  {
    -[HMDUserModel pairingIdentity](self, "pairingIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BE1BBB0], "hmd_pairingIdentityWithDictionary:", v12);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
LABEL_21:

  }
LABEL_29:

  return v11;
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("home");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)cd_getMKFUserFromUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v16 = 0;
  +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v4, objc_opt_class(), &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v14 = v6;
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
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find mkfUser with UUID %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = 0;
  }

  return v14;
}

+ (id)cd_getHMDUserFromMKFUser:(id)a3
{
  id v4;
  void *v5;
  HMDUserModel *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMDUserModel *v10;
  id v11;
  HMDUser *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  HMDUser *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v6 = [HMDUserModel alloc];
  objc_msgSend(v5, "modelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "modelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDBackingStoreModelObject initWithUUID:parentUUID:](v6, "initWithUUID:parentUUID:", v7, v9);

  v19 = 0;
  LOBYTE(v8) = -[HMDBackingStoreModelObject cd_populateFromManagedObject:error:](v10, "cd_populateFromManagedObject:error:", v5, &v19);
  v11 = v19;
  if ((v8 & 1) != 0)
  {
    v12 = -[HMDUser initWithModelObject:]([HMDUser alloc], "initWithModelObject:", v10);
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v16;
      v22 = 2112;
      v23 = v5;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to populate HMDUserModel from %@, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = (HMDUser *)(id)*MEMORY[0x24BDBD430];
  }
  v17 = v12;

  return v17;
}

+ (id)keyedArchiveToken:(id)a3
{
  if (!a3)
    return 0;
  encodeRootObject();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)shareTokenFromKeyedArchiveData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v5, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v6, v4, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;

    if (v7)
    {
      v9 = v7;
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
        v17 = v13;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive share token : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)properties
{
  if (properties_onceToken_1359 != -1)
    dispatch_once(&properties_onceToken_1359, &__block_literal_global_1361);
  return (id)properties__properties_1360;
}

void __26__HMDUserModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v34;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[50];
  _QWORD v53[52];

  v53[50] = *MEMORY[0x24BDAC8D0];
  v52[0] = CFSTR("accountHandle");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v51;
  v52[1] = CFSTR("accountIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v50;
  v52[2] = CFSTR("pairingIdentity");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v49;
  v52[3] = CFSTR("privilege");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v48;
  v52[4] = CFSTR("remoteAccessAllowed");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v47;
  v52[5] = CFSTR("presenceAuthorizationStatus");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v46;
  v52[6] = CFSTR("changeTag");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v45;
  v52[7] = CFSTR("userID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:logging:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:logging:", objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v44;
  v52[8] = CFSTR("camerasAccessLevel");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v43;
  v52[9] = CFSTR("announceAccessAllowed");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v53[9] = v42;
  v52[10] = CFSTR("announceAccessLevel");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53[10] = v41;
  v52[11] = CFSTR("analysisAccessSelection");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53[11] = v40;
  v52[12] = CFSTR("matterCASEAuthenticatedTagID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53[12] = v39;
  v52[13] = CFSTR("matCredIPKExternalRepresentation");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53[13] = v38;
  v52[14] = CFSTR("uniqueIDForAccessories");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v53[14] = v37;
  v52[15] = CFSTR("idsMergeIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53[15] = v36;
  v52[16] = CFSTR("reverseShareID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53[16] = v35;
  v52[17] = CFSTR("reverseShareToken");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v53[17] = v34;
  v52[18] = CFSTR("allowExplicitContent");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53[18] = v33;
  v52[19] = CFSTR("allowiTunesAccount");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53[19] = v32;
  v52[20] = CFSTR("dolbyAtmosEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53[20] = v31;
  v52[21] = CFSTR("losslessMusicEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[21] = v30;
  v52[22] = CFSTR("playbackInfluencesEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[22] = v29;
  v52[23] = CFSTR("siriIdentifyVoiceEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[23] = v28;
  v52[24] = CFSTR("ownerAddSceneButtonPresentedCount");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[24] = v27;
  v52[25] = CFSTR("ownerCompletedSwitchingHomesOnboardingUI");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53[25] = v26;
  v52[26] = CFSTR("ownerDismissed2024EnergyOnboarding");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53[26] = v25;
  v52[27] = CFSTR("ownerDismissedAccessCodeOnboarding");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[27] = v24;
  v52[28] = CFSTR("ownerDismissedAccessoryFirmwareUpdateOnboarding");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v53[28] = v23;
  v52[29] = CFSTR("ownerDismissedAnnounceOnboarding");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v53[29] = v22;
  v52[30] = CFSTR("ownerDismissedCameraRecordingOnboarding");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53[30] = v21;
  v52[31] = CFSTR("ownerDismissedCameraRecordingSetupBanner");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53[31] = v20;
  v52[32] = CFSTR("ownerDismissedCameraUpgradeOfferBanner");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v53[32] = v19;
  v52[33] = CFSTR("ownerDismissedHomeTheaterOnboarding");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53[33] = v18;
  v52[34] = CFSTR("ownerDismissedIdentifyVoiceOnboarding");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53[34] = v17;
  v52[35] = CFSTR("ownerDismissedIdentifyVoiceSetupBanner");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v53[35] = v16;
  v52[36] = CFSTR("ownerDismissedNaturalLightingOnboarding");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[36] = v15;
  v52[37] = CFSTR("ownerDismissedTVViewingProfileOnboarding");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[37] = v14;
  v52[38] = CFSTR("ownerDismissedTVViewingProfileSetupBanner");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53[38] = v13;
  v52[39] = CFSTR("ownerDismissedUserSplitMediaAccountWarning");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v53[39] = v12;
  v52[40] = CFSTR("ownerDismissedWalletKeyExpressModeOnboarding");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v53[40] = v11;
  v52[41] = CFSTR("ownerDismissedWelcomeUI");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v53[41] = v0;
  v52[42] = CFSTR("ownerHasUserSeenRMVNewLanguageNotification");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v53[42] = v1;
  v52[43] = CFSTR("activityNotificationsEnabledForPersonalRequests");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v53[43] = v2;
  v52[44] = CFSTR("accessoriesWithPersonalRequestsEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v53[44] = v3;
  v52[45] = CFSTR("accessoriesWithMediaContentProfileEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v53[45] = v4;
  v52[46] = CFSTR("accessoriesWithListeningHistoryEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v53[46] = v5;
  v52[47] = CFSTR("photosPersonDataZoneUUIDString");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53[47] = v6;
  v52[48] = CFSTR("sharePhotosFaceClassifications");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53[48] = v7;
  v52[49] = CFSTR("ownerCharacteristicAuthorizationData");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53[49] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 50);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)properties__properties_1360;
  properties__properties_1360 = v9;

}

@end
