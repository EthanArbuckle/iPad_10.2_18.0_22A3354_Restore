@implementation MSAuthenticationCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSAuthenticationCredential)initWithCoder:(id)a3
{
  id v4;
  MSAuthenticationCredential *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CMSAuthenticationCredential *credential;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSAuthenticationCredential;
  v5 = -[MSAuthenticationCredential init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthenticationCredentialAuthToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthenticationCredentialTokenType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthenticationCredentialAuthTokenExpiration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthenticationCredentialScope"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthenticationCredentialRefreshToken"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[CMSAuthenticationCredential authCredentialWithToken:tokenType:expirationDate:scope:refreshToken:](CMSAuthenticationCredential, "authCredentialWithToken:tokenType:expirationDate:scope:refreshToken:", v6, v7, v8, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      credential = v5->_credential;
      v5->_credential = (CMSAuthenticationCredential *)v11;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CMSAuthenticationCredential *credential;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  credential = self->_credential;
  v5 = a3;
  -[CMSAuthenticationCredential authToken](credential, "authToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("MSAuthenticationCredentialAuthToken"));

  -[CMSAuthenticationCredential tokenType](self->_credential, "tokenType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("MSAuthenticationCredentialTokenType"));

  -[CMSAuthenticationCredential authTokenExpiration](self->_credential, "authTokenExpiration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("MSAuthenticationCredentialAuthTokenExpiration"));

  -[CMSAuthenticationCredential scope](self->_credential, "scope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("MSAuthenticationCredentialScope"));

  -[CMSAuthenticationCredential refreshToken](self->_credential, "refreshToken");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("MSAuthenticationCredentialRefreshToken"));

}

- (CMSAuthenticationCredential)credential
{
  return (CMSAuthenticationCredential *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
