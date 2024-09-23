@implementation VSIdentityProviderInfoQueryResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[VSIdentityProviderInfoQueryResult identityProvider](self, "identityProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderInfoQueryResult designatedAppBundleIdentifier](self, "designatedAppBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<VSSetTopBoxInfoQueryResult: %p idenityProvider=%@ designatedAppBundleIdentifier=%@>"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)designatedAppBundleIdentifier
{
  return self->_designatedAppBundleIdentifier;
}

- (void)setDesignatedAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_designatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identityProvider, 0);
}

@end
