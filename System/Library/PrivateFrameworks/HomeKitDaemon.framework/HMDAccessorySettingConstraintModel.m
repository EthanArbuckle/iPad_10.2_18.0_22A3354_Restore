@implementation HMDAccessorySettingConstraintModel

+ (id)schemaHashRoot
{
  return (id)objc_msgSend(CFSTR("DAE24BE8-9E89-4F27-AFBB-B40F7C0FE2A2"), "copy");
}

+ (id)properties
{
  if (properties_onceToken_60029 != -1)
    dispatch_once(&properties_onceToken_60029, &__block_literal_global_60030);
  return (id)properties__properties_60031;
}

void __48__HMDAccessorySettingConstraintModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("type");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("value");
  v5[0] = v0;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)properties__properties_60031;
  properties__properties_60031 = v2;

}

@end
