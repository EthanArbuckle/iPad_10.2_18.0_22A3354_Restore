@implementation HMDHomeManagerModel

+ (id)properties
{
  if (properties_onceToken_135143 != -1)
    dispatch_once(&properties_onceToken_135143, &__block_literal_global_135144);
  return (id)properties__properties_135145;
}

void __33__HMDHomeManagerModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("controllerKeyIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = CFSTR("primaryHomeUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v5[2] = CFSTR("cloudZoneInformation");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_135145;
  properties__properties_135145 = v3;

}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("primaryHomeUUID")))
  {
    objc_msgSend(v8, "primaryHome");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "homeUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = (void *)*MEMORY[0x24BDBD430];
    if (v14)
      v16 = (void *)v14;
    v17 = v16;

  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("cloudZoneInformation")) & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDHomeManagerModel;
    -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v19, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v20;
  HMDHomeManagerModel *v21;
  NSObject *v22;
  void *v23;
  HMDAssertionLogEvent *v24;
  void *v25;
  objc_super v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("primaryHome")))
  {
    v26.receiver = self;
    v26.super_class = (Class)HMDHomeManagerModel;
    -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v26, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v16 = (void *)v18;
    goto LABEL_14;
  }
  if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("primaryHomeUUID")))
  {
    v16 = 0;
    goto LABEL_14;
  }
  -[HMDHomeManagerModel primaryHomeUUID](self, "primaryHomeUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v12 = objc_alloc(MEMORY[0x24BDD1880]);
  -[HMDHomeManagerModel primaryHomeUUID](self, "primaryHomeUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithUUIDString:", v13);

  if (v14)
  {
    +[HMDHomeManagerHomeModel deriveUUIDFromHomeUUID:](HMDHomeManagerHomeModel, "deriveUUIDFromHomeUUID:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofModelType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofModelType:error:", v15, objc_opt_class(), &v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v27;

    if (!v16 || v17)
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v23;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = v17;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Unable to find NSManagedObject for home manager home with UUID %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      v24 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Unable to find NSManagedObject for home manager home with UUID %@: %@"), v14, v17);
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "submitLogEvent:", v24);

    }
  }
  else
  {
    v16 = 0;
  }

LABEL_14:
  return v16;
}

+ (NSString)cd_parentReferenceName
{
  return 0;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end
