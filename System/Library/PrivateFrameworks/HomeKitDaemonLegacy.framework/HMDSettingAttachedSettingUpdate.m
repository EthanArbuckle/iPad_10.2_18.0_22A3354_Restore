@implementation HMDSettingAttachedSettingUpdate

- (HMDSettingAttachedSettingUpdate)initWithKeyPath:(id)a3 settingValue:(id)a4
{
  id v7;
  id v8;
  HMDSettingAttachedSettingUpdate *v9;
  HMDSettingAttachedSettingUpdate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDSettingAttachedSettingUpdate;
  v9 = -[HMDSettingAttachedSettingUpdate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPath, a3);
    objc_storeStrong((id *)&v10->_settingValue, a4);
  }

  return v10;
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMSettingValue)settingValue
{
  return (HMSettingValue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingValue, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
