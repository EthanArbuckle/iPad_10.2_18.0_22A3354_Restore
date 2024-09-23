@implementation HMDHomeConfigurationModel

+ (id)properties
{
  if (properties_onceToken_187 != -1)
    dispatch_once(&properties_onceToken_187, &__block_literal_global_189_112155);
  return (id)properties__properties_188;
}

void __39__HMDHomeConfigurationModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("configurationVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_188;
  properties__properties_188 = v1;

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
