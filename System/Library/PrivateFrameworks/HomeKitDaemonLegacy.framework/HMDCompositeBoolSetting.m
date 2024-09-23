@implementation HMDCompositeBoolSetting

- (HMDCompositeBoolSetting)initWithValue:(BOOL)a3 readVersion:(id)a4 writeVersion:(id)a5
{
  HMDCompositeBoolSetting *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDCompositeBoolSetting;
  result = -[HMDCompositeSetting initWithReadVersion:writeVersion:](&v7, sel_initWithReadVersion_writeVersion_, a4, a5);
  if (result)
    result->_BOOLValue = a3;
  return result;
}

- (BOOL)isEqualValue:(id)a3
{
  HMDCompositeBoolSetting *v4;
  HMDCompositeBoolSetting *v5;
  HMDCompositeBoolSetting *v6;
  HMDCompositeBoolSetting *v7;
  HMDCompositeBoolSetting *v8;
  _BOOL4 v9;
  int v10;

  v4 = (HMDCompositeBoolSetting *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    if (-[HMDCompositeBoolSetting conformsToProtocol:](v4, "conformsToProtocol:", &unk_1EFAA0278))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    v8 = v7;
    if (v7)
    {
      v9 = -[HMDCompositeBoolSetting BOOLValue](v7, "BOOLValue");
      v10 = v9 ^ -[HMDCompositeBoolSetting BOOLValue](self, "BOOLValue") ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HMDCompositeBoolSetting *v4;
  HMDCompositeBoolSetting *v5;
  HMDCompositeBoolSetting *v6;
  HMDCompositeBoolSetting *v7;
  BOOL v8;
  objc_super v10;

  v4 = (HMDCompositeBoolSetting *)a3;
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
    if (v6 && -[HMDCompositeBoolSetting isEqualValue:](v6, "isEqualValue:", self))
    {
      v10.receiver = self;
      v10.super_class = (Class)HMDCompositeBoolSetting;
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

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)HMDCompositeBoolSetting;
  -[HMDCompositeSetting attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCompositeBoolSetting BOOLValue](self, "BOOLValue");
  HMFBooleanToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("value"), v5);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

@end
