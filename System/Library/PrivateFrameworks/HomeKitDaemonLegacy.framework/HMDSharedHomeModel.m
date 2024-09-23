@implementation HMDSharedHomeModel

+ (id)properties
{
  if (properties_onceToken_165 != -1)
    dispatch_once(&properties_onceToken_165, &__block_literal_global_167_78468);
  return (id)properties__properties_166;
}

void __32__HMDSharedHomeModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("homeData");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("configurationVersion");
  v5[0] = v0;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)properties__properties_166;
  properties__properties_166 = v2;

}

- (BOOL)isReplayable
{
  return 0;
}

@end
