@implementation CNDataMapperConfiguration

- (OS_tcc_identity)assumedIdentity
{
  return self->_assumedIdentity;
}

- (CNContactsEnvironment)environment
{
  return self->_environment;
}

- (BOOL)isContactProvider
{
  return self->_isContactProvider;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (int64_t)identifierAuditMode
{
  return self->_identifierAuditMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactProviderManager, 0);
  objc_storeStrong((id *)&self->_authorizationContext, 0);
  objc_storeStrong((id *)&self->_assumedIdentity, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (CNDataMapperConfiguration)initWithContactStoreConfiguration:(id)a3
{
  id v4;
  CNDataMapperConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  CNDataMapperConfiguration *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNDataMapperConfiguration;
  v5 = -[CNDataMapperConfiguration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDataMapperConfiguration setEnvironment:](v5, "setEnvironment:", v6);

    objc_msgSend(v4, "managedConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDataMapperConfiguration setManagedConfiguration:](v5, "setManagedConfiguration:", v7);

    objc_msgSend(v4, "assumedIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDataMapperConfiguration setAssumedIdentity:](v5, "setAssumedIdentity:", v8);

    -[CNDataMapperConfiguration setIsContactProvider:](v5, "setIsContactProvider:", objc_msgSend(v4, "isContactProvider"));
    v9 = v5;
  }

  return v5;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (void)setIsContactProvider:(BOOL)a3
{
  self->_isContactProvider = a3;
}

- (void)setAssumedIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_assumedIdentity, a3);
}

- (void)setIdentifierAuditMode:(int64_t)a3
{
  self->_identifierAuditMode = a3;
}

- (CNContactProviderSupportManager)contactProviderManager
{
  return self->_contactProviderManager;
}

- (void)setContactProviderManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactProviderManager, a3);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_environment, CFSTR("environment"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_managedConfiguration, CFSTR("managedConfiguration"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_assumedIdentity, CFSTR("assumedIdentity"));
  v7 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("identifierAuditMode"), self->_identifierAuditMode);
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_authorizationContext, CFSTR("authorizationContext"));
  v9 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("isContactProvider"), self->_isContactProvider);
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", self->_contactProviderManager, CFSTR("contactProviderManager"));
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (CNAuthorizationContext)authorizationContext
{
  return self->_authorizationContext;
}

- (void)setAuthorizationContext:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationContext, a3);
}

@end
