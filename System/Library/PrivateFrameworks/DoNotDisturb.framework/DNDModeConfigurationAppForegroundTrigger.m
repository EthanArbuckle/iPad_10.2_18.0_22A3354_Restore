@implementation DNDModeConfigurationAppForegroundTrigger

- (DNDModeConfigurationAppForegroundTrigger)initWithBundleIdentifier:(id)a3 enabledSetting:(unint64_t)a4
{
  id v6;
  DNDApplicationIdentifier *v7;
  DNDModeConfigurationAppForegroundTrigger *v8;

  v6 = a3;
  v7 = -[DNDApplicationIdentifier initWithBundleID:]([DNDApplicationIdentifier alloc], "initWithBundleID:", v6);

  v8 = -[DNDModeConfigurationAppForegroundTrigger initWithApplicationIdentifier:enabledSetting:](self, "initWithApplicationIdentifier:enabledSetting:", v7, a4);
  return v8;
}

- (DNDModeConfigurationAppForegroundTrigger)initWithApplicationIdentifier:(id)a3 enabledSetting:(unint64_t)a4
{
  id v6;
  DNDModeConfigurationAppForegroundTrigger *v7;
  uint64_t v8;
  DNDApplicationIdentifier *applicationIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDModeConfigurationAppForegroundTrigger;
  v7 = -[DNDModeConfigurationTrigger initWithEnabledSetting:](&v11, sel_initWithEnabledSetting_, a4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    applicationIdentifier = v7->_applicationIdentifier;
    v7->_applicationIdentifier = (DNDApplicationIdentifier *)v8;

  }
  return v7;
}

- (NSString)bundleIdentifier
{
  return -[DNDApplicationIdentifier bundleID](self->_applicationIdentifier, "bundleID");
}

- (BOOL)hasSecureData
{
  return 1;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DNDModeConfigurationAppForegroundTrigger;
  v3 = -[DNDModeConfigurationTrigger hash](&v5, sel_hash);
  return -[DNDApplicationIdentifier hash](self->_applicationIdentifier, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDModeConfigurationAppForegroundTrigger *v4;
  DNDModeConfigurationAppForegroundTrigger *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (DNDModeConfigurationAppForegroundTrigger *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v14.receiver = self;
      v14.super_class = (Class)DNDModeConfigurationAppForegroundTrigger;
      if (-[DNDModeConfigurationTrigger isEqual:](&v14, sel_isEqual_, v5))
      {
        -[DNDModeConfigurationAppForegroundTrigger applicationIdentifier](self, "applicationIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDModeConfigurationAppForegroundTrigger applicationIdentifier](v5, "applicationIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 == v7)
        {
          v12 = 1;
        }
        else
        {
          -[DNDModeConfigurationAppForegroundTrigger applicationIdentifier](self, "applicationIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            -[DNDModeConfigurationAppForegroundTrigger applicationIdentifier](v5, "applicationIdentifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              -[DNDModeConfigurationAppForegroundTrigger applicationIdentifier](self, "applicationIdentifier");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDModeConfigurationAppForegroundTrigger applicationIdentifier](v5, "applicationIdentifier");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v10, "isEqual:", v11);

            }
            else
            {
              v12 = 0;
            }

          }
          else
          {
            v12 = 0;
          }

        }
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[DNDModeConfigurationTrigger enabledSetting](self, "enabledSetting");
  -[DNDModeConfigurationAppForegroundTrigger applicationIdentifier](self, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; enabledSetting: %llu; applicationIdentifier: %@>"),
    v4,
    self,
    v5,
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeConfigurationAppForegroundTrigger)initWithCoder:(id)a3
{
  id v4;
  DNDModeConfigurationAppForegroundTrigger *v5;
  uint64_t v6;
  DNDApplicationIdentifier *applicationIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDModeConfigurationAppForegroundTrigger;
  v5 = -[DNDModeConfigurationTrigger initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (DNDApplicationIdentifier *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DNDModeConfigurationAppForegroundTrigger;
  v4 = a3;
  -[DNDModeConfigurationTrigger encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DNDModeConfigurationAppForegroundTrigger applicationIdentifier](self, "applicationIdentifier", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("applicationIdentifier"));

}

- (DNDApplicationIdentifier)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
