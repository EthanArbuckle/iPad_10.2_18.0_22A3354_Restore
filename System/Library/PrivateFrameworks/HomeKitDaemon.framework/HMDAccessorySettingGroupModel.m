@implementation HMDAccessorySettingGroupModel

+ (id)schemaHashRoot
{
  return (id)objc_msgSend(CFSTR("4E347E70-4576-4D21-B00D-A0054A1889A4"), "copy");
}

+ (id)properties
{
  if (properties_onceToken_197530 != -1)
    dispatch_once(&properties_onceToken_197530, &__block_literal_global_174_197531);
  return (id)properties__properties_197532;
}

void __43__HMDAccessorySettingGroupModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("name");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_197532;
  properties__properties_197532 = v1;

}

@end
