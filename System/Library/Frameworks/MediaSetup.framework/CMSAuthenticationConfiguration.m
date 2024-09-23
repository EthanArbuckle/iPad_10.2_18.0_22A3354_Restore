@implementation CMSAuthenticationConfiguration

+ (id)authConfigurationWithClientID:(id)a3 clientSecret:(id)a4 authorizationURL:(id)a5 scope:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CMSAuthenticationConfiguration *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[CMSAuthenticationConfiguration initWithClientID:clientSecret:authorizationURL:scope:]([CMSAuthenticationConfiguration alloc], "initWithClientID:clientSecret:authorizationURL:scope:", v12, v11, v10, v9);

  return v13;
}

- (CMSAuthenticationConfiguration)initWithClientID:(id)a3 clientSecret:(id)a4 authorizationURL:(id)a5 scope:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CMSAuthenticationConfiguration *v15;
  CMSAuthenticationConfiguration *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CMSAuthenticationConfiguration;
  v15 = -[CMSAuthenticationConfiguration init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_clientID, a3);
    objc_storeStrong((id *)&v16->_clientSecret, a4);
    objc_storeStrong((id *)&v16->_authorizationURL, a5);
    objc_storeStrong((id *)&v16->_scope, a6);
  }

  return v16;
}

- (id)description
{
  void *v2;
  void *v3;

  -[CMSAuthenticationConfiguration basicPropertiesDictionary](self, "basicPropertiesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSAuthenticationConfiguration)initWithCoder:(id)a3
{
  id v4;
  CMSAuthenticationConfiguration *v5;
  uint64_t v6;
  NSString *clientID;
  uint64_t v8;
  NSString *clientSecret;
  uint64_t v10;
  NSURL *authorizationURL;
  uint64_t v12;
  NSString *scope;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CMSAuthenticationConfiguration;
  v5 = -[CMSAuthenticationConfiguration init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSAuthenticationConfigurationClientID"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSAuthenticationConfigurationClientSecret"));
    v8 = objc_claimAutoreleasedReturnValue();
    clientSecret = v5->_clientSecret;
    v5->_clientSecret = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSAuthenticationConfigurationAuthorizationURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    authorizationURL = v5->_authorizationURL;
    v5->_authorizationURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSAuthenticationConfigurationScope"));
    v12 = objc_claimAutoreleasedReturnValue();
    scope = v5->_scope;
    v5->_scope = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientID;
  id v5;

  clientID = self->_clientID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clientID, CFSTR("CMSAuthenticationConfigurationClientID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientSecret, CFSTR("CMSAuthenticationConfigurationClientSecret"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorizationURL, CFSTR("CMSAuthenticationConfigurationAuthorizationURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scope, CFSTR("CMSAuthenticationConfigurationScope"));

}

+ (id)authConfigurationFromMSAuthData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1620];
  v4 = a3;
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)basicPropertiesDictionary
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NSURL absoluteString](self->_authorizationURL, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeSetObject:forKey:", v4, CFSTR("authorizationURL"));

  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_clientID, CFSTR("clientIdentifier"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_clientSecret, CFSTR("clientSecret"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_scope, CFSTR("scope"));
  return v3;
}

- (NSString)clientID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)clientSecret
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)authorizationURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)scope
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_authorizationURL, 0);
  objc_storeStrong((id *)&self->_clientSecret, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
