@implementation HMDCompositeStringSetting

- (HMDCompositeStringSetting)initWithValue:(id)a3 readVersion:(id)a4 writeVersion:(id)a5
{
  id v8;
  HMDCompositeStringSetting *v9;
  uint64_t v10;
  NSString *stringValue;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCompositeStringSetting;
  v9 = -[HMDCompositeSetting initWithReadVersion:writeVersion:](&v13, sel_initWithReadVersion_writeVersion_, a4, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    stringValue = v9->_stringValue;
    v9->_stringValue = (NSString *)v10;

  }
  return v9;
}

- (BOOL)isEqualValue:(id)a3
{
  HMDCompositeStringSetting *v4;
  HMDCompositeStringSetting *v5;
  HMDCompositeStringSetting *v6;
  HMDCompositeStringSetting *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMDCompositeStringSetting *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    if (-[HMDCompositeStringSetting conformsToProtocol:](v4, "conformsToProtocol:", &unk_2557CA0F8))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    -[HMDCompositeStringSetting stringValue](v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCompositeStringSetting stringValue](self, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HMDCompositeStringSetting *v4;
  HMDCompositeStringSetting *v5;
  HMDCompositeStringSetting *v6;
  HMDCompositeStringSetting *v7;
  BOOL v8;
  objc_super v10;

  v4 = (HMDCompositeStringSetting *)a3;
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
    if (v6 && -[HMDCompositeStringSetting isEqualValue:](v6, "isEqualValue:", self))
    {
      v10.receiver = self;
      v10.super_class = (Class)HMDCompositeStringSetting;
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
  v10.super_class = (Class)HMDCompositeStringSetting;
  -[HMDCompositeSetting attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCompositeStringSetting stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("value"), v5);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
