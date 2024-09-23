@implementation HMDApplicationDataModel

+ (id)schemaHashRoot
{
  return CFSTR("3510B4A9-09DF-435C-B6C8-2B7A90888CE7");
}

+ (id)properties
{
  if (properties_onceToken_11392 != -1)
    dispatch_once(&properties_onceToken_11392, &__block_literal_global_122);
  return (id)properties__properties_11393;
}

void __37__HMDApplicationDataModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("appDataDictionary");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_11393;
  properties__properties_11393 = v1;

}

@end
