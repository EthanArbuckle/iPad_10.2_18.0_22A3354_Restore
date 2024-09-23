@implementation HMDHomeMediaSettingsModel

+ (id)modelNamespace
{
  if (modelNamespace_onceToken_196 != -1)
    dispatch_once(&modelNamespace_onceToken_196, &__block_literal_global_197_78514);
  return (id)modelNamespace_namespace_195;
}

+ (id)modelIDForHomeUUID:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99DF0];
  v4 = a3;
  objc_msgSend(v3, "dataWithLength:", 16);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
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

  -[HMDHomeMediaSettingsModel setMinimumMediaUserPrivilege:](v7, "setMinimumMediaUserPrivilege:", &unk_1E8B33378);
  -[HMDHomeMediaSettingsModel setMediaPeerToPeerEnabled:](v7, "setMediaPeerToPeerEnabled:", MEMORY[0x1E0C9AAA0]);
  -[HMDHomeMediaSettingsModel setMediaPassword:](v7, "setMediaPassword:", 0);
  return v7;
}

+ (id)properties
{
  if (properties_onceToken_200 != -1)
    dispatch_once(&properties_onceToken_200, &__block_literal_global_202);
  return (id)properties__properties_201;
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

  v6[3] = *MEMORY[0x1E0C80C00];
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
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_201;
  properties__properties_201 = v3;

}

void __43__HMDHomeMediaSettingsModel_modelNamespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("CF85C76F-270E-41CF-8984-258A00E81134"));
  v1 = (void *)modelNamespace_namespace_195;
  modelNamespace_namespace_195 = v0;

}

@end
