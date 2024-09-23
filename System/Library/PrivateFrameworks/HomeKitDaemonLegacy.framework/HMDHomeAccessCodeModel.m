@implementation HMDHomeAccessCodeModel

- (HMDHomeAccessCodeModel)initWithHomeUUID:(id)a3 value:(id)a4 label:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHomeAccessCodeModel *v12;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  +[HMDHomeAccessCodeModel modelUUIDForHomeUUID:accessCodeValue:](HMDHomeAccessCodeModel, "modelUUIDForHomeUUID:accessCodeValue:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](self, "initWithObjectChangeType:uuid:parentUUID:", 1, v11, v10);

  if (v12)
  {
    -[HMDHomeAccessCodeModel setValue:](v12, "setValue:", v8);
    -[HMDHomeAccessCodeModel setLabel:](v12, "setLabel:", v9);
  }

  return v12;
}

+ (id)properties
{
  if (properties_onceToken_106600 != -1)
    dispatch_once(&properties_onceToken_106600, &__block_literal_global_106601);
  return (id)properties__properties_106602;
}

+ (id)modelUUIDForHomeUUID:(id)a3 accessCodeValue:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3A28];
  v6 = a3;
  objc_msgSend(a4, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDWithNamespace:data:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __36__HMDHomeAccessCodeModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("label");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:logging:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:logging:", objc_opt_class(), 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("value");
  v5[0] = v0;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:logging:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:logging:", objc_opt_class(), 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)properties__properties_106602;
  properties__properties_106602 = v2;

}

@end
