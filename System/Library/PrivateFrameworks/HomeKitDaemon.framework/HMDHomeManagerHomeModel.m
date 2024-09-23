@implementation HMDHomeManagerHomeModel

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("homeManager");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)deriveUUIDFromHomeUUID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1880], "hm_deriveUUIDFromBaseUUID:withSalts:", a3, &unk_24E970DA8);
}

+ (id)properties
{
  if (properties_onceToken_75528 != -1)
    dispatch_once(&properties_onceToken_75528, &__block_literal_global_75529);
  return (id)properties__properties_75530;
}

+ (id)modelForHomeUUID:(id)a3
{
  id v3;
  HMDHomeManagerHomeModel *v4;
  void *v5;
  void *v6;
  HMDHomeManagerHomeModel *v7;
  HMDHomeManagerHomeHandle *v8;
  void *v9;
  HMDHomeManagerHomeHandle *v10;

  v3 = a3;
  v4 = [HMDHomeManagerHomeModel alloc];
  +[HMDHomeManagerHomeModel deriveUUIDFromHomeUUID:](HMDHomeManagerHomeModel, "deriveUUIDFromHomeUUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  v7 = -[HMDBackingStoreModelObject initWithUUID:parentUUID:](v4, "initWithUUID:parentUUID:", v5, v6);

  v8 = [HMDHomeManagerHomeHandle alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDHomeManagerHomeHandle initWithBackingStoreUUID:homeUUID:](v8, "initWithBackingStoreUUID:homeUUID:", v9, v3);

  -[HMDHomeManagerHomeModel setHandle:](v7, "setHandle:", v10);
  return v7;
}

void __37__HMDHomeManagerHomeModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("handle");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_75530;
  properties__properties_75530 = v1;

}

@end
