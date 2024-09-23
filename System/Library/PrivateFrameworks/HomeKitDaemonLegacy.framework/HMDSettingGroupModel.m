@implementation HMDSettingGroupModel

- (id)copyWithNewParentModelID:(id)a3
{
  id v4;
  HMDSettingGroupModel *v5;
  void *v6;
  HMDSettingGroupModel *v7;
  void *v8;

  v4 = a3;
  v5 = [HMDSettingGroupModel alloc];
  -[HMBModel hmbModelID](self, "hmbModelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBModel initWithModelID:parentModelID:](v5, "initWithModelID:parentModelID:", v6, v4);

  -[HMDSettingGroupModel name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingGroupModel setName:](v7, "setName:", v8);

  return v7;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_5658 != -1)
    dispatch_once(&hmbProperties_onceToken_5658, &__block_literal_global_5659);
  return (id)hmbProperties__properties;
}

void __37__HMDSettingGroupModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hmbProperties__properties;
  hmbProperties__properties = v1;

}

@end
