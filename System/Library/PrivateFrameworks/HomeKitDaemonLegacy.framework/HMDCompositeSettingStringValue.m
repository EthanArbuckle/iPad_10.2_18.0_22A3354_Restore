@implementation HMDCompositeSettingStringValue

- (HMDCompositeSettingStringValue)initWithValue:(id)a3
{
  id v4;
  HMDCompositeSettingStringValue *v5;
  uint64_t v6;
  NSString *stringValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCompositeSettingStringValue;
  v5 = -[HMDCompositeSettingValue init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isEqualValue:(id)a3
{
  HMDCompositeSettingStringValue *v4;
  HMDCompositeSettingStringValue *v5;
  HMDCompositeSettingStringValue *v6;
  HMDCompositeSettingStringValue *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMDCompositeSettingStringValue *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    if (-[HMDCompositeSettingStringValue conformsToProtocol:](v4, "conformsToProtocol:", &unk_1EFAA0308))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    -[HMDCompositeSettingStringValue stringValue](v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCompositeSettingStringValue stringValue](self, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

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

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCompositeSettingStringValue stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("value"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
