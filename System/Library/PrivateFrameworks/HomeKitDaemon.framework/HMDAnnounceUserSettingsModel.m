@implementation HMDAnnounceUserSettingsModel

- (id)modelIDForUser:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a3;
  v5 = [v3 alloc];
  +[HMDAnnounceUserSettingsModel modelIDNamespace](HMDAnnounceUserSettingsModel, "modelIDNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithNamespace:data:", v6, v8);

  return v9;
}

- (HMDAnnounceUserSettingsModel)initWithUserUUID:(id)a3
{
  id v4;
  HMDAnnounceUserSettingsModel *v5;
  void *v6;
  HMDAnnounceUserSettingsModel *v7;

  v4 = a3;
  v5 = [HMDAnnounceUserSettingsModel alloc];
  -[HMDAnnounceUserSettingsModel modelIDForUser:](self, "modelIDForUser:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithUUID:parentUUID:](v5, "initWithUUID:parentUUID:", v6, v4);

  return v7;
}

+ (id)modelIDNamespace
{
  if (modelIDNamespace_onceToken != -1)
    dispatch_once(&modelIDNamespace_onceToken, &__block_literal_global_29434);
  return (id)modelIDNamespace_modelIDNamespace;
}

+ (id)properties
{
  if (properties_onceToken_29427 != -1)
    dispatch_once(&properties_onceToken_29427, &__block_literal_global_2);
  return (id)properties__properties_29428;
}

void __42__HMDAnnounceUserSettingsModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("announceNotificationModeForCurrentDevice");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_29428;
  properties__properties_29428 = v1;

}

void __48__HMDAnnounceUserSettingsModel_modelIDNamespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("cf5e2c56-ea81-4471-88d4-0a0a0063000c"));
  v1 = (void *)modelIDNamespace_modelIDNamespace;
  modelIDNamespace_modelIDNamespace = v0;

}

@end
