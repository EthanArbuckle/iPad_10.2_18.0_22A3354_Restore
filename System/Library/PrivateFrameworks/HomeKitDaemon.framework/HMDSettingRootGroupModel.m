@implementation HMDSettingRootGroupModel

- (HMDSettingRootGroupModel)initWithModelID:(id)a3 parentModelID:(id)a4
{
  HMDSettingRootGroupModel *v4;
  HMDSettingRootGroupModel *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDSettingRootGroupModel;
  v4 = -[HMBModel initWithModelID:parentModelID:](&v8, sel_initWithModelID_parentModelID_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HMDSettingRootGroupModel setName:](v4, "setName:", CFSTR("root"));
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSettingRootGroupModel setConflictResolutionToken:](v5, "setConflictResolutionToken:", v6);

  }
  return v5;
}

- (id)copyWithNewParentModelID:(id)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ProtocolMethodNotImplemented"), CFSTR("Root group should never change it's parent model ID"));
  return self;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_224535 != -1)
    dispatch_once(&hmbProperties_onceToken_224535, &__block_literal_global_224536);
  return (id)hmbProperties__properties_224537;
}

void __41__HMDSettingRootGroupModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("conflictResolutionToken");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("name");
  v5[0] = v0;
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)hmbProperties__properties_224537;
  hmbProperties__properties_224537 = v2;

}

@end
