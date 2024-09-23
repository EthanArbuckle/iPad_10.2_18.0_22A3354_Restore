@implementation HMDHomeConfigurationModel

+ (id)properties
{
  if (properties_onceToken_150 != -1)
    dispatch_once(&properties_onceToken_150, &__block_literal_global_152_78453);
  return (id)properties__properties_151;
}

void __39__HMDHomeConfigurationModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("configurationVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_151;
  properties__properties_151 = v1;

}

- (BOOL)homeHasLocalChanges
{
  return self->_homeHasLocalChanges;
}

- (void)setHomeHasLocalChanges:(BOOL)a3
{
  self->_homeHasLocalChanges = a3;
}

@end
