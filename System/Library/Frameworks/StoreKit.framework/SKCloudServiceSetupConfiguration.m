@implementation SKCloudServiceSetupConfiguration

- (SKCloudServiceSetupConfiguration)init
{
  SKCloudServiceSetupConfiguration *v2;
  SKCloudServiceSetupConfiguration *v3;
  NSString *applicationIdentifier;
  NSString *applicationVersion;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKCloudServiceSetupConfiguration;
  v2 = -[SKCloudServiceSetupConfiguration init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    applicationIdentifier = v2->_applicationIdentifier;
    v2->_applicationIdentifier = (NSString *)&stru_1E5B2D460;

    applicationVersion = v3->_applicationVersion;
    v3->_applicationVersion = (NSString *)&stru_1E5B2D460;

  }
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_applicationIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR("; applicationIdentifier = \"%@\"), self->_applicationIdentifier);
  if (self->_applicationVersion)
    objc_msgSend(v6, "appendFormat:", CFSTR("; applicationVersion = \"%@\"), self->_applicationVersion);
  if (self->_targetsFinanceApplication)
    objc_msgSend(v6, "appendFormat:", CFSTR("; targetsFinanceApplication = %@"), CFSTR("YES"));
  if (self->_forPublicSDK)
    objc_msgSend(v6, "appendFormat:", CFSTR("; forPublicSDK = %@"), CFSTR("YES"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_applicationIdentifier, "hash");
  return -[NSString hash](self->_applicationVersion, "hash") ^ v3 ^ self->_targetsFinanceApplication ^ (unint64_t)self->_forPublicSDK;
}

- (BOOL)isEqual:(id)a3
{
  SKCloudServiceSetupConfiguration *v4;
  SKCloudServiceSetupConfiguration *v5;
  NSString *applicationIdentifier;
  NSString *applicationVersion;
  BOOL v8;

  v4 = (SKCloudServiceSetupConfiguration *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      applicationIdentifier = self->_applicationIdentifier;
      v8 = (applicationIdentifier == v5->_applicationIdentifier
         || -[NSString isEqual:](applicationIdentifier, "isEqual:"))
        && ((applicationVersion = self->_applicationVersion, applicationVersion == v5->_applicationVersion)
         || -[NSString isEqualToString:](applicationVersion, "isEqualToString:"))
        && self->_targetsFinanceApplication == v5->_targetsFinanceApplication
        && self->_forPublicSDK == v5->_forPublicSDK;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSString copy](self->_applicationIdentifier, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_applicationVersion, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  *((_BYTE *)v4 + 8) = self->_targetsFinanceApplication;
  *((_BYTE *)v4 + 9) = self->_forPublicSDK;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKCloudServiceSetupConfiguration)initWithCoder:(id)a3
{
  id v4;
  SKCloudServiceSetupConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *applicationIdentifier;
  void *v9;
  uint64_t v10;
  NSString *applicationVersion;

  v4 = a3;
  v5 = -[SKCloudServiceSetupConfiguration init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    applicationVersion = v5->_applicationVersion;
    v5->_applicationVersion = (NSString *)v10;

    v5->_targetsFinanceApplication = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("targetsFinanceApplication"));
    v5->_forPublicSDK = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forPublicSDK"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *applicationIdentifier;
  id v5;

  applicationIdentifier = self->_applicationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", applicationIdentifier, CFSTR("applicationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationVersion, CFSTR("applicationVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_targetsFinanceApplication, CFSTR("targetsFinanceApplication"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forPublicSDK, CFSTR("forPublicSDK"));

}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)targetsFinanceApplication
{
  return self->_targetsFinanceApplication;
}

- (void)setTargetsFinanceApplication:(BOOL)a3
{
  self->_targetsFinanceApplication = a3;
}

- (BOOL)forPublicSDK
{
  return self->_forPublicSDK;
}

- (void)setForPublicSDK:(BOOL)a3
{
  self->_forPublicSDK = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
