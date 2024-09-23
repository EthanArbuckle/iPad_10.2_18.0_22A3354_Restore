@implementation NEContentFilter

- (NEContentFilter)init
{
  NEContentFilter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEContentFilter;
  result = -[NEContentFilter init](&v3, sel_init);
  if (result)
    result->_grade = 1;
  return result;
}

- (NEContentFilter)initWithCoder:(id)a3
{
  id v4;
  NEContentFilter *v5;
  uint64_t v6;
  NEFilterProviderConfiguration *provider;
  uint64_t v8;
  NEPerApp *perApp;
  uint64_t v10;

  v4 = a3;
  v5 = -[NEContentFilter init](self, "init");
  if (v5)
  {
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Enabled"));
    v5->_disableEncryptedDNSSettings = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableEncryptedDNSSettings"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Provider"));
    v6 = objc_claimAutoreleasedReturnValue();
    provider = v5->_provider;
    v5->_provider = (NEFilterProviderConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PerApp"));
    v8 = objc_claimAutoreleasedReturnValue();
    perApp = v5->_perApp;
    v5->_perApp = (NEPerApp *)v8;

    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FilterGrade"));
    if ((unint64_t)(v10 - 1) <= 1)
      v5->_grade = v10;
    v5->_enableManualMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnableManualMode"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEContentFilter isEnabled](self, "isEnabled"), CFSTR("Enabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEContentFilter disableEncryptedDNSSettings](self, "disableEncryptedDNSSettings"), CFSTR("DisableEncryptedDNSSettings"));
  -[NEContentFilter provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Provider"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[NEContentFilter grade](self, "grade"), CFSTR("FilterGrade"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEContentFilter enableManualMode](self, "enableManualMode"), CFSTR("EnableManualMode"));
  -[NEContentFilter perApp](self, "perApp");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("PerApp"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEContentFilter *v4;
  void *v5;
  void *v6;

  v4 = -[NEContentFilter init](+[NEContentFilter allocWithZone:](NEContentFilter, "allocWithZone:", a3), "init");
  -[NEContentFilter setEnabled:](v4, "setEnabled:", -[NEContentFilter isEnabled](self, "isEnabled"));
  -[NEContentFilter setDisableEncryptedDNSSettings:](v4, "setDisableEncryptedDNSSettings:", -[NEContentFilter disableEncryptedDNSSettings](self, "disableEncryptedDNSSettings"));
  -[NEContentFilter provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEContentFilter setProvider:](v4, "setProvider:", v5);

  -[NEContentFilter setGrade:](v4, "setGrade:", -[NEContentFilter grade](self, "grade"));
  -[NEContentFilter setEnableManualMode:](v4, "setEnableManualMode:", -[NEContentFilter enableManualMode](self, "enableManualMode"));
  -[NEContentFilter perApp](self, "perApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEContentFilter setPerApp:](v4, "setPerApp:", v6);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  -[NEContentFilter provider](self, "provider");
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEContentFilter provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v6, "checkValidityAndCollectErrors:", v4);

  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing plugin"), v4);
  }
  if (-[NEContentFilter grade](self, "grade") < 1 || -[NEContentFilter grade](self, "grade") >= 3)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    NEResourcesCopyLocalizedNSString(CFSTR("CONTENT_FILTER_INVALID_GRADE"), CFSTR("CONTENT_FILTER_INVALID_GRADE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "initWithFormat:", v8, -[NEContentFilter grade](self, "grade"));
    objc_msgSend(v4, "addObject:", v5);

    LOBYTE(v5) = 0;
  }
  -[NEContentFilter perApp](self, "perApp");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[NEContentFilter perApp](self, "perApp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "checkValidityAndCollectErrors:", v4);

    LOBYTE(v5) = v12 & v5;
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEContentFilter isEnabled](self, "isEnabled"), CFSTR("enabled"), v5, a4);
  if (-[NEContentFilter disableEncryptedDNSSettings](self, "disableEncryptedDNSSettings"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEContentFilter disableEncryptedDNSSettings](self, "disableEncryptedDNSSettings"), CFSTR("disableEncryptedDNSSettings"), v5, a4);
  -[NEContentFilter provider](self, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("provider"), v5, a4);

  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEContentFilter grade](self, "grade"), CFSTR("filter-grade"), v5, a4);
  -[NEContentFilter perApp](self, "perApp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("per-app"), v5, a4);

  return v7;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)disableEncryptedDNSSettings
{
  return self->_disableEncryptedDNSSettings;
}

- (void)setDisableEncryptedDNSSettings:(BOOL)a3
{
  self->_disableEncryptedDNSSettings = a3;
}

- (NEFilterProviderConfiguration)provider
{
  return (NEFilterProviderConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProvider:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NEPerApp)perApp
{
  return (NEPerApp *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPerApp:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (int64_t)grade
{
  return self->_grade;
}

- (void)setGrade:(int64_t)a3
{
  self->_grade = a3;
}

- (BOOL)enableManualMode
{
  return self->_enableManualMode;
}

- (void)setEnableManualMode:(BOOL)a3
{
  self->_enableManualMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perApp, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
