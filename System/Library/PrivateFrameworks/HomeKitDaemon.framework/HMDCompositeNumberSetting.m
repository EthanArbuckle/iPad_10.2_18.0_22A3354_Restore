@implementation HMDCompositeNumberSetting

- (HMDCompositeNumberSetting)initWithValue:(id)a3 readVersion:(id)a4 writeVersion:(id)a5
{
  id v8;
  HMDCompositeNumberSetting *v9;
  uint64_t v10;
  NSNumber *numberValue;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCompositeNumberSetting;
  v9 = -[HMDCompositeSetting initWithReadVersion:writeVersion:](&v13, sel_initWithReadVersion_writeVersion_, a4, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    numberValue = v9->_numberValue;
    v9->_numberValue = (NSNumber *)v10;

  }
  return v9;
}

- (BOOL)isEqualValue:(id)a3
{
  HMDCompositeNumberSetting *v4;
  HMDCompositeNumberSetting *v5;
  HMDCompositeNumberSetting *v6;
  HMDCompositeNumberSetting *v7;
  HMDCompositeNumberSetting *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMDCompositeNumberSetting *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    if (-[HMDCompositeNumberSetting conformsToProtocol:](v4, "conformsToProtocol:", &unk_2557CA1E8))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    v8 = v7;
    if (v7)
    {
      -[HMDCompositeNumberSetting numberValue](v7, "numberValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCompositeNumberSetting numberValue](self, "numberValue");
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

- (BOOL)isEqual:(id)a3
{
  HMDCompositeNumberSetting *v4;
  HMDCompositeNumberSetting *v5;
  HMDCompositeNumberSetting *v6;
  HMDCompositeNumberSetting *v7;
  BOOL v8;
  objc_super v10;

  v4 = (HMDCompositeNumberSetting *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6 && -[HMDCompositeNumberSetting isEqualValue:](v6, "isEqualValue:", self))
    {
      v10.receiver = self;
      v10.super_class = (Class)HMDCompositeNumberSetting;
      v8 = -[HMDCompositeSetting isEqual:](&v10, sel_isEqual_, v7);
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)HMDCompositeNumberSetting;
  -[HMDCompositeSetting attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCompositeNumberSetting numberValue](self, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("value"), v5);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSNumber)numberValue
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberValue, 0);
}

@end
