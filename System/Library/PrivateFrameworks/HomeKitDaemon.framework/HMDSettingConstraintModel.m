@implementation HMDSettingConstraintModel

- (NSString)nameForKeyPath
{
  void *v2;
  HMDSettingConstraintModel *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = self;
  -[HMDSettingConstraintModel type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "integerValue");
  HMSettingConstraintTypeToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDSettingConstraintModel type](v3, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == 4)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    -[HMDSettingConstraintModel numberValue](v3, "numberValue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v11 = 0;
      v12 = (const __CFString *)v9;
    }
    else
    {
      -[HMDSettingConstraintModel stringValue](v3, "stringValue");
      v13 = objc_claimAutoreleasedReturnValue();
      v2 = (void *)v13;
      if (v13)
      {
        v11 = 0;
        v12 = (const __CFString *)v13;
      }
      else
      {
        -[HMDSettingConstraintModel dataValue](v3, "dataValue");
        v14 = objc_claimAutoreleasedReturnValue();
        v3 = (HMDSettingConstraintModel *)v14;
        v12 = CFSTR("unknown");
        if (v14)
          v12 = (const __CFString *)v14;
        v11 = 1;
      }
    }
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.%@"), v5, v12);
    v15 = objc_claimAutoreleasedReturnValue();

    if (v11)
    if (!v10)

    v5 = (void *)v15;
  }
  return (NSString *)v5;
}

- (id)copyWithNewParentModelID:(id)a3
{
  id v4;
  HMDSettingConstraintModel *v5;
  void *v6;
  HMDSettingConstraintModel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = [HMDSettingConstraintModel alloc];
  -[HMBModel hmbModelID](self, "hmbModelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBModel initWithModelID:parentModelID:](v5, "initWithModelID:parentModelID:", v6, v4);

  -[HMDSettingConstraintModel type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingConstraintModel setType:](v7, "setType:", v8);

  -[HMDSettingConstraintModel numberValue](self, "numberValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingConstraintModel setNumberValue:](v7, "setNumberValue:", v9);

  -[HMDSettingConstraintModel stringValue](self, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingConstraintModel setStringValue:](v7, "setStringValue:", v10);

  -[HMDSettingConstraintModel dataValue](self, "dataValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingConstraintModel setDataValue:](v7, "setDataValue:", v11);

  return v7;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_76484 != -1)
    dispatch_once(&hmbProperties_onceToken_76484, &__block_literal_global_76485);
  return (id)hmbProperties__properties_76486;
}

void __42__HMDSettingConstraintModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v6[1] = CFSTR("numberValue");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v6[2] = CFSTR("stringValue");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v6[3] = CFSTR("dataValue");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)hmbProperties__properties_76486;
  hmbProperties__properties_76486 = v4;

}

@end
