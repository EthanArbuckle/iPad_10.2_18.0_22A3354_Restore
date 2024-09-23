@implementation HMDHomeNetworkRouterManagingDeviceSettingsModel

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
  -[HMDHomeNetworkRouterManagingDeviceSettingsModel primaryNetworkRouterManagingDeviceUUID](self, "primaryNetworkRouterManagingDeviceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDD1880]);
    -[HMDHomeNetworkRouterManagingDeviceSettingsModel primaryNetworkRouterManagingDeviceUUID](self, "primaryNetworkRouterManagingDeviceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);
    objc_msgSend(v3, "addObject:", v9);

  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

+ (id)modelNamespace
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("EAB77D3E-35C9-4473-8ACE-C2AFC1895F9E"));
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
  HMDHomeNetworkRouterManagingDeviceSettingsModel *v5;
  void *v6;
  HMDHomeNetworkRouterManagingDeviceSettingsModel *v7;

  v4 = a3;
  v5 = [HMDHomeNetworkRouterManagingDeviceSettingsModel alloc];
  objc_msgSend(a1, "modelIDForHomeUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v4);

  return v7;
}

+ (id)properties
{
  if (properties_onceToken_252 != -1)
    dispatch_once(&properties_onceToken_252, &__block_literal_global_254);
  return (id)properties__properties_253;
}

void __61__HMDHomeNetworkRouterManagingDeviceSettingsModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("primaryNetworkRouterManagingDeviceUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_253;
  properties__properties_253 = v1;

}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("home")))
  {
    v11 = (void *)objc_opt_class();
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cd_getHomeFromUUID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDHomeNetworkRouterManagingDeviceSettingsModel;
    -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v15, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end
