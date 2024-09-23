@implementation HMBCloudZoneRebuilderModel

- (HMBCloudZoneRebuilderModel)init
{
  void *v3;
  void *v4;
  HMBCloudZoneRebuilderModel *v5;
  objc_super v7;

  objc_msgSend((id)objc_opt_class(), "sentinelUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sentinelUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)HMBCloudZoneRebuilderModel;
  v5 = -[HMBModel initWithModelID:parentModelID:](&v7, sel_initWithModelID_parentModelID_, v3, v4);

  return v5;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_2588 != -1)
    dispatch_once(&hmbProperties_onceToken_2588, &__block_literal_global_2589);
  return (id)hmbProperties__properties_2590;
}

+ (NSUUID)sentinelUUID
{
  if (sentinelUUID_onceToken != -1)
    dispatch_once(&sentinelUUID_onceToken, &__block_literal_global_9_2584);
  return (NSUUID *)(id)sentinelUUID__sentinelUUID;
}

void __42__HMBCloudZoneRebuilderModel_sentinelUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("4C636B6B-9784-4D02-9E47-5A5259B3BAF2"));
  v1 = (void *)sentinelUUID__sentinelUUID;
  sentinelUUID__sentinelUUID = v0;

}

void __43__HMBCloudZoneRebuilderModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("uniqueToken");
  +[HMBModelField fieldWithClass:](HMBModelField, "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("hasCompleted");
  v5[0] = v0;
  +[HMBModelField fieldWithClass:](HMBModelField, "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)hmbProperties__properties_2590;
  hmbProperties__properties_2590 = v2;

}

@end
