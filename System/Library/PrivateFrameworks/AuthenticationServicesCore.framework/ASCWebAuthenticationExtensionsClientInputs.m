@implementation ASCWebAuthenticationExtensionsClientInputs

- (ASCWebAuthenticationExtensionsClientInputs)init
{
  return -[ASCWebAuthenticationExtensionsClientInputs initWithAppID:isGoogleLegacyAppIDSupport:](self, "initWithAppID:isGoogleLegacyAppIDSupport:", 0, 0);
}

- (ASCWebAuthenticationExtensionsClientInputs)initWithAppID:(id)a3 isGoogleLegacyAppIDSupport:(BOOL)a4
{
  id v7;
  ASCWebAuthenticationExtensionsClientInputs *v8;
  ASCWebAuthenticationExtensionsClientInputs *v9;
  ASCWebAuthenticationExtensionsClientInputs *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASCWebAuthenticationExtensionsClientInputs;
  v8 = -[ASCWebAuthenticationExtensionsClientInputs init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appID, a3);
    v9->_isGoogleLegacyAppIDSupport = a4;
    v10 = v9;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[ASCWebAuthenticationExtensionsClientInputs appID](self, "appID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAppID:isGoogleLegacyAppIDSupport:", v5, -[ASCWebAuthenticationExtensionsClientInputs isGoogleLegacyAppIDSupport](self, "isGoogleLegacyAppIDSupport"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCWebAuthenticationExtensionsClientInputs)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  ASCWebAuthenticationExtensionsClientInputs *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isGoogleLegacyAppIDSupport"));

  v7 = -[ASCWebAuthenticationExtensionsClientInputs initWithAppID:isGoogleLegacyAppIDSupport:](self, "initWithAppID:isGoogleLegacyAppIDSupport:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ASCWebAuthenticationExtensionsClientInputs appID](self, "appID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("appID"));

  objc_msgSend(v5, "encodeBool:forKey:", -[ASCWebAuthenticationExtensionsClientInputs isGoogleLegacyAppIDSupport](self, "isGoogleLegacyAppIDSupport"), CFSTR("isGoogleLegacyAppIDSupport"));
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isGoogleLegacyAppIDSupport
{
  return self->_isGoogleLegacyAppIDSupport;
}

- (void)setIsGoogleLegacyAppIDSupport:(BOOL)a3
{
  self->_isGoogleLegacyAppIDSupport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appID, 0);
}

@end
