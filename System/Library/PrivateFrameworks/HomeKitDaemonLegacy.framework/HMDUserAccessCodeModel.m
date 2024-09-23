@implementation HMDUserAccessCodeModel

+ (id)properties
{
  if (properties_onceToken_129096 != -1)
    dispatch_once(&properties_onceToken_129096, &__block_literal_global_129097);
  return (id)properties__properties_129098;
}

+ (id)modelUUIDWithUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("9DB6E60C-3E4F-44A3-94F6-14DB51D3E800"));
  v6 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v4, "hm_convertToData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __36__HMDUserAccessCodeModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("value");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:logging:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:logging:", objc_opt_class(), 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("changedByUserUUID");
  v5[0] = v0;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)properties__properties_129098;
  properties__properties_129098 = v2;

}

- (HMDUserAccessCodeModel)initWithUserUUID:(id)a3
{
  id v4;
  void *v5;
  HMDUserAccessCodeModel *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "modelUUIDWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](self, "initWithObjectChangeType:uuid:parentUUID:", 1, v5, v4);

  return v6;
}

@end
