@implementation HMDCompositeSettingNumberValue

- (HMDCompositeSettingNumberValue)initWithValue:(id)a3
{
  id v4;
  HMDCompositeSettingNumberValue *v5;
  uint64_t v6;
  NSNumber *numberValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCompositeSettingNumberValue;
  v5 = -[HMDCompositeSettingValue init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    numberValue = v5->_numberValue;
    v5->_numberValue = (NSNumber *)v6;

  }
  return v5;
}

- (BOOL)isEqualValue:(id)a3
{
  HMDCompositeSettingNumberValue *v4;
  HMDCompositeSettingNumberValue *v5;
  HMDCompositeSettingNumberValue *v6;
  HMDCompositeSettingNumberValue *v7;
  HMDCompositeSettingNumberValue *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMDCompositeSettingNumberValue *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    if (-[HMDCompositeSettingNumberValue conformsToProtocol:](v4, "conformsToProtocol:", &unk_2557CA1E8))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    v8 = v7;
    if (v7)
    {
      -[HMDCompositeSettingNumberValue numberValue](v7, "numberValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCompositeSettingNumberValue numberValue](self, "numberValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
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
  -[HMDCompositeSettingNumberValue numberValue](self, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("value"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)numberValue
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberValue, 0);
}

@end
