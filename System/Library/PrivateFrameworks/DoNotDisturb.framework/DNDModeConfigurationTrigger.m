@implementation DNDModeConfigurationTrigger

- (DNDModeConfigurationTrigger)init
{
  return -[DNDModeConfigurationTrigger initWithEnabledSetting:](self, "initWithEnabledSetting:", 0);
}

- (DNDModeConfigurationTrigger)initWithEnabledSetting:(unint64_t)a3
{
  DNDModeConfigurationTrigger *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DNDModeConfigurationTrigger;
  result = -[DNDModeConfigurationTrigger init](&v5, sel_init);
  if (result)
    result->_enabledSetting = a3;
  return result;
}

- (BOOL)isEnabled
{
  return self->_enabledSetting != 1;
}

- (BOOL)hasSecureData
{
  return 0;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_enabledSetting);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_compatibilityVersion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  DNDModeConfigurationTrigger *v4;
  DNDModeConfigurationTrigger *v5;
  unint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  BOOL v11;

  v4 = (DNDModeConfigurationTrigger *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DNDModeConfigurationTrigger enabledSetting](self, "enabledSetting");
      v7 = -[DNDModeConfigurationTrigger enabledSetting](v5, "enabledSetting");
      v8 = -[DNDModeConfigurationTrigger compatibilityVersion](self, "compatibilityVersion");
      v9 = -[DNDModeConfigurationTrigger compatibilityVersion](v5, "compatibilityVersion");

      v11 = v6 == v7 && v8 == v9;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
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
  DNDEnabledSettingToString(-[DNDModeConfigurationTrigger enabledSetting](self, "enabledSetting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[DNDModeConfigurationTrigger compatibilityVersion](self, "compatibilityVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; enabledSetting: %llu (%@); compatibilityVersion: %@>"),
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

- (DNDModeConfigurationTrigger)initWithCoder:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  self->_enabledSetting = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("enabledSetting"));
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("compatibilityVersion"));

  self->_compatibilityVersion = v5;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeConfigurationTrigger enabledSetting](self, "enabledSetting"), CFSTR("enabledSetting"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeConfigurationTrigger compatibilityVersion](self, "compatibilityVersion"), CFSTR("compatibilityVersion"));

}

- (unint64_t)enabledSetting
{
  return self->_enabledSetting;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

@end
