@implementation HMDObsoleteUserModel

+ (id)properties
{
  if (properties_onceToken_154996 != -1)
    dispatch_once(&properties_onceToken_154996, &__block_literal_global_154997);
  return (id)properties__properties_154998;
}

void __34__HMDObsoleteUserModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("changeTag");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_154998;
  properties__properties_154998 = v1;

}

@end
