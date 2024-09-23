@implementation HMDHomeSettingsModel

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
    v15.super_class = (Class)HMDHomeSettingsModel;
    -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v15, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)modelNamespace
{
  if (modelNamespace_onceToken != -1)
    dispatch_once(&modelNamespace_onceToken, &__block_literal_global_217);
  return (id)modelNamespace_namespace;
}

+ (id)modelIDForHomeUUID:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCEC8];
  v4 = a3;
  objc_msgSend(v3, "dataWithLength:", 16);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  v6 = objc_alloc(MEMORY[0x24BDD1880]);
  +[HMDHomeSettingsModel modelNamespace](HMDHomeSettingsModel, "modelNamespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithNamespace:data:", v7, v5);

  return v8;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v4;
  HMDHomeSettingsModel *v5;
  void *v6;
  HMDHomeSettingsModel *v7;

  v4 = a3;
  v5 = [HMDHomeSettingsModel alloc];
  objc_msgSend(a1, "modelIDForHomeUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v4);

  -[HMDHomeSettingsModel setAutomaticSoftwareUpdateEnabled:](v7, "setAutomaticSoftwareUpdateEnabled:", MEMORY[0x24BDBD1C8]);
  -[HMDHomeSettingsModel setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:](v7, "setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:", MEMORY[0x24BDBD1C0]);
  return v7;
}

+ (id)properties
{
  if (properties_onceToken_221 != -1)
    dispatch_once(&properties_onceToken_221, &__block_literal_global_223_112191);
  return (id)properties__properties_222;
}

void __34__HMDHomeSettingsModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("automaticSoftwareUpdateEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("automaticThirdPartyAccessorySoftwareUpdateEnabled");
  v5[0] = v0;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)properties__properties_222;
  properties__properties_222 = v2;

}

void __38__HMDHomeSettingsModel_modelNamespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("56E19F0B-2058-4E17-998F-75A96A576767"));
  v1 = (void *)modelNamespace_namespace;
  modelNamespace_namespace = v0;

}

@end
