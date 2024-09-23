@implementation HMDCameraProfileSettingsDerivedPropertiesModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_98 != -1)
    dispatch_once(&hmbProperties_onceToken_98, &__block_literal_global_100_101696);
  return (id)hmbProperties__properties_99;
}

void __63__HMDCameraProfileSettingsDerivedPropertiesModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("currentAccessModeField");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = CFSTR("currentAccessModeChangeReasonField");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v5[2] = CFSTR("currentAccessModeChangeDate");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)hmbProperties__properties_99;
  hmbProperties__properties_99 = v3;

}

- (void)setCurrentAccessMode:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsDerivedPropertiesModel setCurrentAccessModeField:](self, "setCurrentAccessModeField:", v4);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsDerivedPropertiesModel setCurrentAccessModeChangeDate:](self, "setCurrentAccessModeChangeDate:", v5);

}

- (unint64_t)currentAccessMode
{
  void *v2;
  unint64_t v3;

  -[HMDCameraProfileSettingsDerivedPropertiesModel currentAccessModeField](self, "currentAccessModeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setCurrentAccessModeChangeReason:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsDerivedPropertiesModel setCurrentAccessModeChangeReasonField:](self, "setCurrentAccessModeChangeReasonField:", v4);

}

- (int64_t)currentAccessModeChangeReason
{
  void *v2;
  int64_t v3;

  -[HMDCameraProfileSettingsDerivedPropertiesModel currentAccessModeChangeReasonField](self, "currentAccessModeChangeReasonField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

@end
