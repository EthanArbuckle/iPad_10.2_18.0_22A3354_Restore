@implementation HMDAccountHandleModel

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("account");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)schemaHashRoot
{
  return (id)objc_msgSend(CFSTR("538177E8-3459-4DE2-BE82-B72A8633498C"), "copy");
}

+ (id)properties
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("idsURI");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("local");
  v7[0] = v2;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
