@implementation CMSAuthenticationCredential

+ (id)authCredentialWithToken:(id)a3 tokenType:(id)a4 expirationDate:(id)a5 scope:(id)a6 refreshToken:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  CMSAuthenticationCredential *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[CMSAuthenticationCredential initWithToken:tokenType:expirationDate:scope:refreshToken:]([CMSAuthenticationCredential alloc], "initWithToken:tokenType:expirationDate:scope:refreshToken:", v15, v14, v13, v12, v11);

  return v16;
}

- (CMSAuthenticationCredential)initWithToken:(id)a3 tokenType:(id)a4 expirationDate:(id)a5 scope:(id)a6 refreshToken:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CMSAuthenticationCredential *v17;
  CMSAuthenticationCredential *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CMSAuthenticationCredential;
  v17 = -[CMSAuthenticationCredential init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_authToken, a3);
    objc_storeStrong((id *)&v18->_tokenType, a4);
    objc_storeStrong((id *)&v18->_authTokenExpiration, a5);
    objc_storeStrong((id *)&v18->_scope, a6);
    objc_storeStrong((id *)&v18->_refreshToken, a7);
  }

  return v18;
}

- (id)description
{
  void *v2;
  void *v3;

  -[CMSAuthenticationCredential basicPropertiesDictionary](self, "basicPropertiesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CMSAuthenticationCredential basicPropertiesDictionary](self, "basicPropertiesDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v3);
  v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("MM-dd-yyyy HH:mm"));
  objc_msgSend(v5, "stringFromDate:", self->_authTokenExpiration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("expirationDate"));

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSAuthenticationCredential)initWithCoder:(id)a3
{
  id v4;
  CMSAuthenticationCredential *v5;
  uint64_t v6;
  NSString *authToken;
  uint64_t v8;
  NSString *tokenType;
  uint64_t v10;
  NSDate *authTokenExpiration;
  uint64_t v12;
  NSString *scope;
  uint64_t v14;
  NSString *refreshToken;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CMSAuthenticationCredential;
  v5 = -[CMSAuthenticationCredential init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSAuthenticationCredentialAuthToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    authToken = v5->_authToken;
    v5->_authToken = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSAuthenticationCredentialTokenType"));
    v8 = objc_claimAutoreleasedReturnValue();
    tokenType = v5->_tokenType;
    v5->_tokenType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSAuthenticationCredentialAuthTokenExpiration"));
    v10 = objc_claimAutoreleasedReturnValue();
    authTokenExpiration = v5->_authTokenExpiration;
    v5->_authTokenExpiration = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSAuthenticationCredentialScope"));
    v12 = objc_claimAutoreleasedReturnValue();
    scope = v5->_scope;
    v5->_scope = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSAuthenticationCredentialRefreshToken"));
    v14 = objc_claimAutoreleasedReturnValue();
    refreshToken = v5->_refreshToken;
    v5->_refreshToken = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *authToken;
  id v5;

  authToken = self->_authToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", authToken, CFSTR("CMSAuthenticationCredentialAuthToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tokenType, CFSTR("CMSAuthenticationCredentialTokenType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authTokenExpiration, CFSTR("CMSAuthenticationCredentialAuthTokenExpiration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scope, CFSTR("CMSAuthenticationCredentialScope"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_refreshToken, CFSTR("CMSAuthenticationCredentialRefreshToken"));

}

+ (id)authCredentialFromMSAuthData:(id)a3
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
    objc_msgSend(v5, "credential");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)authHeader
{
  CMSAuthenticationCredential *v2;
  uint64_t v4;
  NSString *authHeader;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_authHeader
    && v2->_authToken
    && -[NSString caseInsensitiveCompare:](v2->_tokenType, "caseInsensitiveCompare:", CFSTR("Bearer")) == NSOrderedSame)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bearer %@"), v2->_authToken);
    v4 = objc_claimAutoreleasedReturnValue();
    authHeader = v2->_authHeader;
    v2->_authHeader = (NSString *)v4;

  }
  objc_sync_exit(v2);

  return v2->_authHeader;
}

- (id)basicPropertiesDictionary
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_authToken, CFSTR("authToken"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_tokenType, CFSTR("tokenType"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_authTokenExpiration, CFSTR("expirationDate"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_scope, CFSTR("scope"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_refreshToken, CFSTR("refreshToken"));
  return v3;
}

- (NSString)authToken
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)tokenType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)authTokenExpiration
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)scope
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)refreshToken
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_authTokenExpiration, 0);
  objc_storeStrong((id *)&self->_tokenType, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_authHeader, 0);
}

@end
