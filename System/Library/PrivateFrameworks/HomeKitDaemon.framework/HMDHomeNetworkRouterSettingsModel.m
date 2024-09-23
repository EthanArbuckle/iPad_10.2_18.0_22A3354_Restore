@implementation HMDHomeNetworkRouterSettingsModel

- (id)dependentUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[HMDHomeNetworkRouterSettingsModel activeNetworkRouterAccessoryUUID](self, "activeNetworkRouterAccessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDD1880]);
    -[HMDHomeNetworkRouterSettingsModel activeNetworkRouterAccessoryUUID](self, "activeNetworkRouterAccessoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);
    objc_msgSend(v3, "addObject:", v9);

  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

+ (id)modelNamespace
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("F71A2DE4-C7D9-411D-B156-88C2E88A9673"));
}

+ (id)modelIDForHomeUUID:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCEC8];
  v4 = a3;
  objc_msgSend(v3, "dataWithLength:", 16);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  v6 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend((id)objc_opt_class(), "modelNamespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v4;
  HMDHomeNetworkRouterSettingsModel *v5;
  void *v6;
  HMDHomeNetworkRouterSettingsModel *v7;

  v4 = a3;
  v5 = [HMDHomeNetworkRouterSettingsModel alloc];
  objc_msgSend(a1, "modelIDForHomeUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v4);

  return v7;
}

+ (id)properties
{
  if (properties_onceToken_260 != -1)
    dispatch_once(&properties_onceToken_260, &__block_literal_global_262_112235);
  return (id)properties__properties_261;
}

void __47__HMDHomeNetworkRouterSettingsModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("activeNetworkRouterAccessoryUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v6[1] = CFSTR("activeNetworkRouterInitialSetupNeededUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v6[2] = CFSTR("minimumNetworkRouterSupportHomeKitVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v6[3] = CFSTR("minHomeKitVersionForAccessoryNetworkProtectionChange");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)properties__properties_261;
  properties__properties_261 = v4;

}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("activeNetworkRouterAccessoryUUID")))
  {
    objc_msgSend(v10, "networkAccessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "modelID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = (void *)*MEMORY[0x24BDBD430];
    if (v13)
      v15 = (void *)v13;
    v16 = v15;

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDHomeNetworkRouterSettingsModel;
    -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v18, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v10, v8, v9);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("networkAccessory")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("home")))
    {
      v14 = (void *)objc_opt_class();
      -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cd_getHomeFromUUID:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v18.receiver = self;
    v18.super_class = (Class)HMDHomeNetworkRouterSettingsModel;
    -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v18, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v15 = (void *)v16;
    goto LABEL_12;
  }
  if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("activeNetworkRouterAccessoryUUID")))
  {
    v15 = 0;
    goto LABEL_12;
  }
  -[HMDHomeNetworkRouterSettingsModel activeNetworkRouterAccessoryUUID](self, "activeNetworkRouterAccessoryUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[HMDHomeNetworkRouterSettingsModel activeNetworkRouterAccessoryUUID](self, "activeNetworkRouterAccessoryUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccessoryTransaction cd_getMKFAccessoryFromAccessoryUUID:](HMDAccessoryTransaction, "cd_getMKFAccessoryFromAccessoryUUID:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v15 = (void *)v13;

LABEL_12:
  return v15;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end
