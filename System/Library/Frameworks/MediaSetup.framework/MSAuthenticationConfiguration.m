@implementation MSAuthenticationConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSAuthenticationConfiguration)initWithCoder:(id)a3
{
  id v4;
  MSAuthenticationConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CMSAuthenticationConfiguration *configuration;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSAuthenticationConfiguration;
  v5 = -[MSAuthenticationConfiguration init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthenticationConfigurationClientID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthenticationConfigurationClientSecret"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthenticationConfigurationAuthorizationURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthenticationConfigurationScope"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && v7 && v8)
    {
      +[CMSAuthenticationConfiguration authConfigurationWithClientID:clientSecret:authorizationURL:scope:](CMSAuthenticationConfiguration, "authConfigurationWithClientID:clientSecret:authorizationURL:scope:", v6, v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      configuration = v5->_configuration;
      v5->_configuration = (CMSAuthenticationConfiguration *)v10;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CMSAuthenticationConfiguration *configuration;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  configuration = self->_configuration;
  v5 = a3;
  -[CMSAuthenticationConfiguration clientID](configuration, "clientID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("CMSAuthenticationConfigurationClientID"));

  -[CMSAuthenticationConfiguration clientSecret](self->_configuration, "clientSecret");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("CMSAuthenticationConfigurationClientSecret"));

  -[CMSAuthenticationConfiguration authorizationURL](self->_configuration, "authorizationURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("CMSAuthenticationConfigurationAuthorizationURL"));

  -[CMSAuthenticationConfiguration scope](self->_configuration, "scope");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("CMSAuthenticationConfigurationScope"));

}

- (CMSAuthenticationConfiguration)configuration
{
  return (CMSAuthenticationConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
