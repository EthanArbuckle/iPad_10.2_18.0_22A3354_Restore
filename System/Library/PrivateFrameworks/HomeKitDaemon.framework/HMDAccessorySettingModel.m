@implementation HMDAccessorySettingModel

+ (id)schemaHashRoot
{
  return (id)objc_msgSend(CFSTR("C405A892-9917-4445-9F23-21BB5BAEAD2F"), "copy");
}

+ (id)properties
{
  if (properties_onceToken_235151 != -1)
    dispatch_once(&properties_onceToken_235151, &__block_literal_global_236_235152);
  return (id)properties__properties_235153;
}

void __38__HMDAccessorySettingModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("type");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("properties");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("name");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("value");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = CFSTR("configurationVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)properties__properties_235153;
  properties__properties_235153 = v5;

}

@end
