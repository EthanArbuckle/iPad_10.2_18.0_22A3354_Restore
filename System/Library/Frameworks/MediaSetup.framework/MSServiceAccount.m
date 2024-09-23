@implementation MSServiceAccount

- (MSServiceAccount)initWithServiceName:(NSString *)serviceName accountName:(NSString *)accountName
{
  NSString *v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  MSServiceAccount *v14;
  objc_super v16;

  v7 = serviceName;
  v8 = accountName;
  v16.receiver = self;
  v16.super_class = (Class)MSServiceAccount;
  -[MSServiceAccount self](&v16, sel_self);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (!v7 || !v8)
    {
      NSLog(CFSTR("Failed to initialize MSServiceAccount"));
      v14 = 0;
      goto LABEL_7;
    }
    objc_storeStrong((id *)(v9 + 8), serviceName);
    objc_storeStrong((id *)(v9 + 16), accountName);
    +[MSAssistantPreferences intentExamples](MSAssistantPreferences, "intentExamples");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(v9 + 72);
    *(_QWORD *)(v9 + 72) = v10;

    +[MSAssistantPreferences supportedMediaIntents](MSAssistantPreferences, "supportedMediaIntents");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(v9 + 80);
    *(_QWORD *)(v9 + 80) = v12;

  }
  v14 = (MSServiceAccount *)(id)v9;
LABEL_7:

  return v14;
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceName, CFSTR("serviceName"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_accountName, CFSTR("accountName"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_clientID, CFSTR("clientID"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_clientSecret, CFSTR("clientSecret"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceID, CFSTR("serviceID"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_configurationURL, CFSTR("configurationURL"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_authorizationTokenURL, CFSTR("authorizationTokenURL"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_authorizationScope, CFSTR("authorizationScope"));
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *serviceName;
  id v5;

  serviceName = self->_serviceName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceName, CFSTR("MSSCServiceNameEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountName, CFSTR("MSSCAccountNameEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorizationScope, CFSTR("MSSCAuthorizationScope"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorizationTokenURL, CFSTR("MSSCAuthorizationTokenURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientID, CFSTR("MSSCClientIDEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientSecret, CFSTR("MSSCClientSecretEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configurationURL, CFSTR("MSSCconfigURLEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceID, CFSTR("MSSCServiceIDEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentExamples, CFSTR("MSSCIntentExamplesEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedMediaIntents, CFSTR("MSSCSupportedMediaIntentsEncodedKey"));

}

- (MSServiceAccount)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *serviceName;
  NSString *v7;
  NSString *accountName;
  MSServiceAccount *v9;
  uint64_t v10;
  NSString *authorizationScope;
  uint64_t v12;
  NSURL *authorizationTokenURL;
  uint64_t v14;
  NSString *clientID;
  uint64_t v16;
  NSString *clientSecret;
  uint64_t v18;
  NSURL *configurationURL;
  uint64_t v20;
  NSUUID *serviceID;
  uint64_t v22;
  NSArray *intentExamples;
  uint64_t v24;
  NSSet *supportedMediaIntents;
  MSServiceAccount *v26;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSCServiceNameEncodedKey"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceName = self->_serviceName;
  self->_serviceName = v5;

  if (self->_serviceName
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSCAccountNameEncodedKey")),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        accountName = self->_accountName,
        self->_accountName = v7,
        accountName,
        self->_accountName))
  {
    v9 = -[MSServiceAccount initWithServiceName:accountName:](self, "initWithServiceName:accountName:", self->_serviceName);
    if (v9)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSCAuthorizationScope"));
      v10 = objc_claimAutoreleasedReturnValue();
      authorizationScope = v9->_authorizationScope;
      v9->_authorizationScope = (NSString *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSCAuthorizationTokenURL"));
      v12 = objc_claimAutoreleasedReturnValue();
      authorizationTokenURL = v9->_authorizationTokenURL;
      v9->_authorizationTokenURL = (NSURL *)v12;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSCClientIDEncodedKey"));
      v14 = objc_claimAutoreleasedReturnValue();
      clientID = v9->_clientID;
      v9->_clientID = (NSString *)v14;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSCClientSecretEncodedKey"));
      v16 = objc_claimAutoreleasedReturnValue();
      clientSecret = v9->_clientSecret;
      v9->_clientSecret = (NSString *)v16;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSCconfigURLEncodedKey"));
      v18 = objc_claimAutoreleasedReturnValue();
      configurationURL = v9->_configurationURL;
      v9->_configurationURL = (NSURL *)v18;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSCServiceIDEncodedKey"));
      v20 = objc_claimAutoreleasedReturnValue();
      serviceID = v9->_serviceID;
      v9->_serviceID = (NSUUID *)v20;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSCIntentExamplesEncodedKey"));
      v22 = objc_claimAutoreleasedReturnValue();
      intentExamples = v9->_intentExamples;
      v9->_intentExamples = (NSArray *)v22;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSCSupportedMediaIntentsEncodedKey"));
      v24 = objc_claimAutoreleasedReturnValue();
      supportedMediaIntents = v9->_supportedMediaIntents;
      v9->_supportedMediaIntents = (NSSet *)v24;

    }
    self = v9;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)accountName
{
  return self->_accountName;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(NSString *)clientID
{
  objc_setProperty_nonatomic_copy(self, a2, clientID, 24);
}

- (NSString)clientSecret
{
  return self->_clientSecret;
}

- (void)setClientSecret:(NSString *)clientSecret
{
  objc_setProperty_nonatomic_copy(self, a2, clientSecret, 32);
}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (void)setConfigurationURL:(NSURL *)configurationURL
{
  objc_setProperty_nonatomic_copy(self, a2, configurationURL, 40);
}

- (NSURL)authorizationTokenURL
{
  return self->_authorizationTokenURL;
}

- (void)setAuthorizationTokenURL:(NSURL *)authorizationTokenURL
{
  objc_setProperty_nonatomic_copy(self, a2, authorizationTokenURL, 48);
}

- (NSString)authorizationScope
{
  return self->_authorizationScope;
}

- (void)setAuthorizationScope:(NSString *)authorizationScope
{
  objc_setProperty_nonatomic_copy(self, a2, authorizationScope, 56);
}

- (NSUUID)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)intentExamples
{
  return self->_intentExamples;
}

- (NSSet)supportedMediaIntents
{
  return self->_supportedMediaIntents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedMediaIntents, 0);
  objc_storeStrong((id *)&self->_intentExamples, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_authorizationScope, 0);
  objc_storeStrong((id *)&self->_authorizationTokenURL, 0);
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_clientSecret, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
