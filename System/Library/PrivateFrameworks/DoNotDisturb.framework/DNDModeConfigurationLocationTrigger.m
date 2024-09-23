@implementation DNDModeConfigurationLocationTrigger

- (DNDModeConfigurationLocationTrigger)initWithRegion:(id)a3 detail:(id)a4 enabledSetting:(unint64_t)a5
{
  id v9;
  id v10;
  DNDModeConfigurationLocationTrigger *v11;
  DNDModeConfigurationLocationTrigger *v12;
  uint64_t v13;
  NSString *detail;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DNDModeConfigurationLocationTrigger;
  v11 = -[DNDModeConfigurationTrigger initWithEnabledSetting:](&v16, sel_initWithEnabledSetting_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_region, a3);
    v13 = objc_msgSend(v10, "copy");
    detail = v12->_detail;
    v12->_detail = (NSString *)v13;

  }
  return v12;
}

- (BOOL)hasSecureData
{
  return 1;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DNDModeConfigurationLocationTrigger;
  v3 = -[DNDModeConfigurationTrigger hash](&v6, sel_hash);
  v4 = -[CLCircularRegion hash](self->_region, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_detail, "hash");
}

- (BOOL)isEqual:(id)a3
{
  DNDModeConfigurationLocationTrigger *v4;
  DNDModeConfigurationLocationTrigger *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v4 = (DNDModeConfigurationLocationTrigger *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v27.receiver = self;
      v27.super_class = (Class)DNDModeConfigurationLocationTrigger;
      if (!-[DNDModeConfigurationTrigger isEqual:](&v27, sel_isEqual_, v5))
      {
        v13 = 0;
LABEL_27:

        goto LABEL_28;
      }
      -[DNDModeConfigurationLocationTrigger region](self, "region");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeConfigurationLocationTrigger region](v5, "region");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDModeConfigurationLocationTrigger region](self, "region");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v13 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v9 = (void *)v8;
        -[DNDModeConfigurationLocationTrigger region](v5, "region");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_25:

          goto LABEL_26;
        }
        -[DNDModeConfigurationLocationTrigger region](self, "region");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDModeConfigurationLocationTrigger region](v5, "region");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v23 = v12;
        v24 = v11;
        v25 = v10;
        v26 = v9;
      }
      -[DNDModeConfigurationLocationTrigger detail](self, "detail");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeConfigurationLocationTrigger detail](v5, "detail");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[DNDModeConfigurationLocationTrigger detail](self, "detail");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          -[DNDModeConfigurationLocationTrigger detail](v5, "detail");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            -[DNDModeConfigurationLocationTrigger detail](self, "detail");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDModeConfigurationLocationTrigger detail](v5, "detail");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v22, "isEqual:", v20);

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {

          v13 = 0;
        }
      }
      v10 = v25;
      v9 = v26;
      v12 = v23;
      v11 = v24;
      if (v6 == v7)
        goto LABEL_26;
      goto LABEL_24;
    }
    v13 = 0;
  }
LABEL_28:

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[DNDModeConfigurationTrigger enabledSetting](self, "enabledSetting");
  -[DNDModeConfigurationLocationTrigger region](self, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeConfigurationLocationTrigger detail](self, "detail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; enabledSetting: %llu; region: %@; detail: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeConfigurationLocationTrigger)initWithCoder:(id)a3
{
  id v4;
  DNDModeConfigurationLocationTrigger *v5;
  uint64_t v6;
  CLCircularRegion *region;
  uint64_t v8;
  NSString *detail;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDModeConfigurationLocationTrigger;
  v5 = -[DNDModeConfigurationTrigger initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
    v6 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (CLCircularRegion *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detail"));
    v8 = objc_claimAutoreleasedReturnValue();
    detail = v5->_detail;
    v5->_detail = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DNDModeConfigurationLocationTrigger;
  v4 = a3;
  -[DNDModeConfigurationTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[DNDModeConfigurationLocationTrigger region](self, "region", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("region"));

  -[DNDModeConfigurationLocationTrigger detail](self, "detail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("detail"));

}

- (CLCircularRegion)region
{
  return self->_region;
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
