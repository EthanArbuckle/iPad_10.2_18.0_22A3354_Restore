@implementation HMDHomeThreadNetworkModel

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("home")))
  {
    v11 = (void *)objc_opt_class();
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cd_getHomeFromUUID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDHomeThreadNetworkModel;
    -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v15, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("home");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)modelIDForHome:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "modelIDForHomeUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)modelIDForHomeUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(CFSTR("HMDHomeThreadNetworkModel"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "hmf_UUIDWithNamespace:data:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)defaultModelForHome:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "defaultModelForHomeUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v4;
  HMDHomeThreadNetworkModel *v5;
  void *v6;
  HMDHomeThreadNetworkModel *v7;

  v4 = a3;
  v5 = [HMDHomeThreadNetworkModel alloc];
  objc_msgSend(a1, "modelIDForHomeUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v4);

  return v7;
}

+ (id)properties
{
  if (properties_onceToken_275 != -1)
    dispatch_once(&properties_onceToken_275, &__block_literal_global_277_112251);
  return (id)properties__properties_276;
}

void __39__HMDHomeThreadNetworkModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("threadNetworkID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_276;
  properties__properties_276 = v1;

}

@end
