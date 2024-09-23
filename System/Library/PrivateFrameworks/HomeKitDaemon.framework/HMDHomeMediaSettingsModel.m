@implementation HMDHomeMediaSettingsModel

+ (id)modelNamespace
{
  if (modelNamespace_onceToken_233 != -1)
    dispatch_once(&modelNamespace_onceToken_233, &__block_literal_global_234);
  return (id)modelNamespace_namespace_232;
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
  +[HMDHomeMediaSettingsModel modelNamespace](HMDHomeMediaSettingsModel, "modelNamespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithNamespace:data:", v7, v5);

  return v8;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v4;
  HMDHomeMediaSettingsModel *v5;
  void *v6;
  HMDHomeMediaSettingsModel *v7;

  v4 = a3;
  v5 = [HMDHomeMediaSettingsModel alloc];
  objc_msgSend(a1, "modelIDForHomeUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v4);

  -[HMDHomeMediaSettingsModel setMinimumMediaUserPrivilege:](v7, "setMinimumMediaUserPrivilege:", &unk_24E96B420);
  -[HMDHomeMediaSettingsModel setMediaPeerToPeerEnabled:](v7, "setMediaPeerToPeerEnabled:", MEMORY[0x24BDBD1C0]);
  -[HMDHomeMediaSettingsModel setMediaPassword:](v7, "setMediaPassword:", 0);
  return v7;
}

+ (id)properties
{
  if (properties_onceToken_237 != -1)
    dispatch_once(&properties_onceToken_237, &__block_literal_global_239);
  return (id)properties__properties_238;
}

void __39__HMDHomeMediaSettingsModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("minimumMediaUserPrivilege");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = CFSTR("mediaPeerToPeerEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v5[2] = CFSTR("mediaPassword");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_238;
  properties__properties_238 = v3;

}

void __43__HMDHomeMediaSettingsModel_modelNamespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("CF85C76F-270E-41CF-8984-258A00E81134"));
  v1 = (void *)modelNamespace_namespace_232;
  modelNamespace_namespace_232 = v0;

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
    v15.super_class = (Class)HMDHomeMediaSettingsModel;
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
