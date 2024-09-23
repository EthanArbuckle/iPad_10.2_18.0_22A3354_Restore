@implementation HMDSoftwareUpdateModel

+ (id)properties
{
  if (properties_onceToken_117645 != -1)
    dispatch_once(&properties_onceToken_117645, &__block_literal_global_252);
  return (id)properties__properties_117646;
}

void __36__HMDSoftwareUpdateModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];
  _QWORD v10[8];

  v10[7] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("softwareVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v0;
  v9[1] = CFSTR("displayableSoftwareVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v1;
  v9[2] = CFSTR("state");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v2;
  v9[3] = CFSTR("downloadSize");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v3;
  v9[4] = CFSTR("installDuration");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v4;
  v9[5] = CFSTR("documentationMetadata");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v5;
  v9[6] = CFSTR("releaseDate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[6] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)properties__properties_117646;
  properties__properties_117646 = v7;

}

- (id)cd_fetchManagedObjectInContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDSoftwareUpdateModel *v11;
  NSObject *v12;
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
  HMDSoftwareUpdateModel *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDBackingStoreModelObject managedObject](self, "managedObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBackingStoreModelObject uuid](v11, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBackingStoreModelObject parentUUID](v11, "parentUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v30 = v13;
        v31 = 2112;
        v32 = v8;
        v33 = 2112;
        v34 = v14;
        v35 = 2112;
        v36 = v15;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_FAULT, "%{public}@Managed object context appears to be reset on this object %@, someone did something very bad: %@/%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v10);
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "cd_entityClass"), "fetchRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD1758];
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predicateWithFormat:", CFSTR("%K.%K == %@"), CFSTR("accessory"), CFSTR("modelID"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v19);

    objc_msgSend(v16, "execute:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = v20;
      if ((unint64_t)objc_msgSend(v20, "count") >= 2)
        _HMFPreconditionFailure();
      objc_msgSend(v21, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreModelObject setManagedObject:](self, "setManagedObject:", v8);

    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBackingStoreModelObject parentUUID](v23, "parentUUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *a4;
        *(_DWORD *)buf = 138543874;
        v30 = v25;
        v31 = 2112;
        v32 = v26;
        v33 = 2112;
        v34 = v27;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Fetch of software update model with parent UUID : %@ failed: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v22);

      v8 = 0;
    }
  }

  return v8;
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("accessory");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end
