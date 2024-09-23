@implementation HMDCompositeSettingBoolValue

- (HMDCompositeSettingBoolValue)initWithValue:(BOOL)a3
{
  HMDCompositeSettingBoolValue *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDCompositeSettingBoolValue;
  result = -[HMDCompositeSettingValue init](&v5, sel_init);
  if (result)
    result->_BOOLValue = a3;
  return result;
}

- (BOOL)isEqualValue:(id)a3
{
  HMDCompositeSettingBoolValue *v4;
  HMDCompositeSettingBoolValue *v5;
  HMDCompositeSettingBoolValue *v6;
  HMDCompositeSettingBoolValue *v7;
  HMDCompositeSettingBoolValue *v8;
  _BOOL4 v9;
  int v10;

  v4 = (HMDCompositeSettingBoolValue *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    if (-[HMDCompositeSettingBoolValue conformsToProtocol:](v4, "conformsToProtocol:", &unk_2557C9FF0))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    v8 = v7;
    if (v7)
    {
      v9 = -[HMDCompositeSettingBoolValue BOOLValue](v7, "BOOLValue");
      v10 = v9 ^ -[HMDCompositeSettingBoolValue BOOLValue](self, "BOOLValue") ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  return v10;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCompositeSettingBoolValue BOOLValue](self, "BOOLValue");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("value"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

@end
