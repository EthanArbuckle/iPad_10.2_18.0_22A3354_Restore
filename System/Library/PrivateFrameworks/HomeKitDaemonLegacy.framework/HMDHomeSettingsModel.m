@implementation HMDHomeSettingsModel

+ (id)modelNamespace
{
  if (modelNamespace_onceToken != -1)
    dispatch_once(&modelNamespace_onceToken, &__block_literal_global_180);
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

  v3 = (void *)MEMORY[0x1E0C99DF0];
  v4 = a3;
  objc_msgSend(v3, "dataWithLength:", 16);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
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

  -[HMDHomeSettingsModel setAutomaticSoftwareUpdateEnabled:](v7, "setAutomaticSoftwareUpdateEnabled:", MEMORY[0x1E0C9AAB0]);
  -[HMDHomeSettingsModel setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:](v7, "setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:", MEMORY[0x1E0C9AAA0]);
  return v7;
}

+ (id)properties
{
  if (properties_onceToken_184 != -1)
    dispatch_once(&properties_onceToken_184, &__block_literal_global_186_78488);
  return (id)properties__properties_185;
}

void __34__HMDHomeSettingsModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("automaticSoftwareUpdateEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("automaticThirdPartyAccessorySoftwareUpdateEnabled");
  v5[0] = v0;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)properties__properties_185;
  properties__properties_185 = v2;

}

void __38__HMDHomeSettingsModel_modelNamespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("56E19F0B-2058-4E17-998F-75A96A576767"));
  v1 = (void *)modelNamespace_namespace;
  modelNamespace_namespace = v0;

}

@end
