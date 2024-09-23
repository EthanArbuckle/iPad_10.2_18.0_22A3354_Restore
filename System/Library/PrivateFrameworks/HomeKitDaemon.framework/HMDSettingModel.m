@implementation HMDSettingModel

- (BOOL)setSettingValue:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  switch(objc_msgSend(v4, "type"))
  {
    case 1:
      objc_msgSend(v4, "dataValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSettingModel setDataValue:](self, "setDataValue:", v5);
      goto LABEL_7;
    case 2:
      objc_msgSend(v4, "numberValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSettingModel setNumberValue:](self, "setNumberValue:", v5);
      goto LABEL_7;
    case 3:
      objc_msgSend(v4, "stringValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSettingModel setStringValue:](self, "setStringValue:", v5);
      goto LABEL_7;
    case 4:
      objc_msgSend(v4, "selectionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSettingModel setSelectionIdentifier:](self, "setSelectionIdentifier:", v7);

      objc_msgSend(v4, "selectionValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSettingModel setSelectionValue:](self, "setSelectionValue:", v5);
LABEL_7:

      goto LABEL_8;
    case 5:
LABEL_8:
      v6 = 1;
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (id)copyWithNewParentModelID:(id)a3
{
  id v4;
  HMDSettingModel *v5;
  void *v6;
  HMDSettingModel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = [HMDSettingModel alloc];
  -[HMBModel hmbModelID](self, "hmbModelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBModel initWithModelID:parentModelID:](v5, "initWithModelID:parentModelID:", v6, v4);

  -[HMDSettingModel type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingModel setType:](v7, "setType:", v8);

  -[HMDSettingModel properties](self, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingModel setProperties:](v7, "setProperties:", v9);

  -[HMDSettingModel name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingModel setName:](v7, "setName:", v10);

  -[HMDSettingModel numberValue](self, "numberValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingModel setNumberValue:](v7, "setNumberValue:", v11);

  -[HMDSettingModel stringValue](self, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingModel setStringValue:](v7, "setStringValue:", v12);

  -[HMDSettingModel dataValue](self, "dataValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingModel setDataValue:](v7, "setDataValue:", v13);

  -[HMDSettingModel selectionIdentifier](self, "selectionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingModel setSelectionIdentifier:](v7, "setSelectionIdentifier:", v14);

  -[HMDSettingModel selectionValue](self, "selectionValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingModel setSelectionValue:](v7, "setSelectionValue:", v15);

  return v7;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_56496 != -1)
    dispatch_once(&hmbProperties_onceToken_56496, &__block_literal_global_56497);
  return (id)hmbProperties__properties_56498;
}

void __32__HMDSettingModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[8];
  _QWORD v11[9];

  v11[8] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v0;
  v10[1] = CFSTR("properties");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v1;
  v10[2] = CFSTR("name");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v2;
  v10[3] = CFSTR("numberValue");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v3;
  v10[4] = CFSTR("stringValue");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v4;
  v10[5] = CFSTR("dataValue");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v5;
  v10[6] = CFSTR("selectionIdentifier");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v6;
  v10[7] = CFSTR("selectionValue");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[7] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)hmbProperties__properties_56498;
  hmbProperties__properties_56498 = v8;

}

@end
