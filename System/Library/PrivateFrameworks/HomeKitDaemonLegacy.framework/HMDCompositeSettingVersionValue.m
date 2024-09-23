@implementation HMDCompositeSettingVersionValue

- (HMDCompositeSettingVersionValue)initWithVersion:(id)a3 type:(int64_t)a4
{
  id v7;
  void *v8;
  HMDCompositeSettingVersionValue *v9;
  HMDCompositeSettingVersionValue *v10;
  HMDCompositeSettingVersionValue *v12;
  SEL v13;
  objc_super v14;

  v7 = a3;
  if (v7)
  {
    v8 = v7;
    v14.receiver = self;
    v14.super_class = (Class)HMDCompositeSettingVersionValue;
    v9 = -[HMDCompositeSettingValue init](&v14, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_version, a3);
      v10->_type = a4;
    }

    return v10;
  }
  else
  {
    v12 = (HMDCompositeSettingVersionValue *)_HMFPreconditionFailure();
    return (HMDCompositeSettingVersionValue *)-[HMDCompositeSettingVersionValue attributeDescriptions](v12, v13);
  }
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCompositeSettingVersionValue version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("version"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCompositeSettingVersionValue type](self, "type");
  HMSettingVersionValueTypeAsString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("type"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMFVersion)version
{
  return (HMFVersion *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
}

@end
