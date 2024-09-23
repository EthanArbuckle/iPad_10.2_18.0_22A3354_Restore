@implementation HMDLocationEventModel

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HMDLocationEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_18108 != -1)
    dispatch_once(&properties_onceToken_18108, block);
  return (id)properties__properties_18109;
}

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "hm_regionFromDataForKey:", CFSTR("kLocationEventRegionKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((HMIsValidRegion() & 1) != 0)
  {
    +[HMDEventModel eventModelWithDictionary:home:eventTriggerUUID:className:message:](HMDEventModel, "eventModelWithDictionary:home:eventTriggerUUID:className:message:", v9, v10, v11, objc_opt_class(), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObject();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRegion:", v15);

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Provided region is invalid", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v14 = 0;
  }

  return v14;
}

void __35__HMDLocationEventModel_properties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDBCED8];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HMDLocationEventModel;
  objc_msgSendSuper2(&v9, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_18109;
  properties__properties_18109 = v3;

  v5 = (void *)properties__properties_18109;
  v10[0] = CFSTR("region");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("userUUID");
  v11[0] = v6;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v8);

}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("region")))
  {
    objc_msgSend(v8, "region");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0);
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("userUUID")))
  {
    objc_msgSend(v8, "user");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modelID");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = (void *)*MEMORY[0x24BDBD430];
    if (v12)
      v14 = (void *)v12;
    v15 = v14;

    goto LABEL_11;
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDLocationEventModel;
  -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v17, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v15;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  HMDLocationEventModel *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDLocationEventModel *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  objc_super v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("region")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("region")))
    {
      -[HMDLocationEventModel region](self, "region");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v29 = 0;
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v29;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v31 = v20;
            v32 = 2112;
            v33 = v13;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode region: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v17);
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_21:

      goto LABEL_22;
    }
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("user")))
    {
      v27.receiver = self;
      v27.super_class = (Class)HMDLocationEventModel;
      -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v27, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("userUUID")))
    {
      -[HMDLocationEventModel userUUID](self, "userUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v15, objc_opt_class(), &v28);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v28;

      if (v12)
      {
        v16 = v12;
      }
      else
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDLocationEventModel userUUID](v22, "userUUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v24;
          v32 = 2112;
          v33 = v25;
          v34 = 2112;
          v35 = v11;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFUser with UUID %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v21);
      }

      goto LABEL_21;
    }
  }
  v12 = 0;
LABEL_22:

  return v12;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end
