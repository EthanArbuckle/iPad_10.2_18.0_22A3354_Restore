@implementation HMDCloudSharedGroupRootRecordModelObject

+ (id)properties
{
  if (properties_onceToken_74 != -1)
    dispatch_once(&properties_onceToken_74, &__block_literal_global_76_16645);
  return (id)properties__properties_75;
}

void __54__HMDCloudSharedGroupRootRecordModelObject_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("recordNames");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_75;
  properties__properties_75 = v1;

}

@end
