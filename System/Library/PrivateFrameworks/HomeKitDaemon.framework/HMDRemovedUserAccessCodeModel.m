@implementation HMDRemovedUserAccessCodeModel

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
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("removedUserInfoData")))
  {
    v11 = objc_alloc(MEMORY[0x24BDD7910]);
    objc_msgSend(v8, "userName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userModelID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateRemoved");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v11, "initWithName:userUUID:userID:dateRemoved:", v12, v13, v14, v15);

    encodeRootObject();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDRemovedUserAccessCodeModel;
    -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v19, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("dateRemoved")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("userID")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("userModelID")) & 1) == 0
    && !objc_msgSend(v9, "isEqualToString:", CFSTR("userName")))
  {
LABEL_19:
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("home")))
    {
      -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDHomeModel cd_getHomeFromUUID:](HMDHomeModel, "cd_getHomeFromUUID:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("modelID")))
    {
      -[HMDBackingStoreModelObject uuid](self, "uuid");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)HMDRemovedUserAccessCodeModel;
      -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v18, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_9;
  }
  if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("removedUserInfoData")))
  {
    -[HMDBackingStoreModelObject valueForKey:](self, "valueForKey:", CFSTR("removedUserInfoData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemovedUserAccessCodeModel unarchiveRemovedUserInfo:](self, "unarchiveRemovedUserInfo:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("dateRemoved")))
    {
      objc_msgSend(v12, "dateRemoved");
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v15 = (void *)v13;

      goto LABEL_17;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("userID")))
    {
      objc_msgSend(v12, "userID");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("userModelID")))
    {
      objc_msgSend(v12, "userUUID");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("userName")))
    {
      objc_msgSend(v12, "name");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }

    goto LABEL_19;
  }
  v14 = (id)*MEMORY[0x24BDBD430];
LABEL_9:
  v15 = v14;
LABEL_17:

  return v15;
}

- (id)unarchiveRemovedUserInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  HMDRemovedUserAccessCodeModel *v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v11;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive removedUserInfoData: %@, with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }

  return v5;
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("home");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

- (HMDRemovedUserAccessCodeModel)initWithRemovedUserInfo:(id)a3 accessCode:(id)a4 homeUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDRemovedUserAccessCodeModel *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[HMDRemovedUserAccessCodeModel modelUUIDForHomeUUID:removedUserInfo:accessCode:](HMDRemovedUserAccessCodeModel, "modelUUIDForHomeUUID:removedUserInfo:accessCode:", v10, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](self, "initWithObjectChangeType:uuid:parentUUID:", 1, v11, v10);

  if (v12)
  {
    encodeRootObject();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemovedUserAccessCodeModel setRemovedUserInfoData:](v12, "setRemovedUserInfoData:", v13);

    v14 = (void *)objc_msgSend(v9, "copy");
    -[HMDRemovedUserAccessCodeModel setAccessCode:](v12, "setAccessCode:", v14);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemovedUserAccessCodeModel setHh2ModelID:](v12, "setHh2ModelID:", v15);

  }
  return v12;
}

- (HMRemovedUserInfo)removedUserInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  HMDRemovedUserAccessCodeModel *v11;
  NSObject *v12;
  void *v13;
  void *v15;
  HMDRemovedUserAccessCodeModel *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[HMDRemovedUserAccessCodeModel removedUserInfoData](self, "removedUserInfoData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1620];
    v5 = objc_opt_class();
    -[HMDRemovedUserAccessCodeModel removedUserInfoData](self, "removedUserInfoData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v6, &v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;

    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDRemovedUserAccessCodeModel removedUserInfoData](v16, "removedUserInfoData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v18;
        v23 = 2112;
        v24 = v19;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive removedUserInfoData: %@, with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
    }

    return (HMRemovedUserInfo *)v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@removedUserInfoData was nil, this should never happen", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    return (HMRemovedUserInfo *)0;
  }
}

+ (id)properties
{
  if (properties_onceToken_252471 != -1)
    dispatch_once(&properties_onceToken_252471, &__block_literal_global_252472);
  return (id)properties__properties_252473;
}

+ (id)modelUUIDForHomeUUID:(id)a3 removedUserInfo:(id)a4 accessCode:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = (void *)MEMORY[0x24BDD1880];
  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "userUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hm_convertToData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_UUIDWithNamespace:data:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "hmf_UUIDWithNamespace:data:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __43__HMDRemovedUserAccessCodeModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("removedUserInfoData");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = CFSTR("accessCode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:logging:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:logging:", objc_opt_class(), 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v5[2] = CFSTR("hh2ModelID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_252473;
  properties__properties_252473 = v3;

}

@end
