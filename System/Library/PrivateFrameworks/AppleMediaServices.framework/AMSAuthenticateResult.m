@implementation AMSAuthenticateResult

- (AMSAuthenticateResult)initWithAccount:(id)a3
{
  id v5;
  AMSAuthenticateResult *v6;
  AMSAuthenticateResult *v7;
  uint64_t v8;
  NSDictionary *serverResponse;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSAuthenticateResult;
  v6 = -[AMSAuthenticateResult init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    objc_msgSend(v5, "ams_lastAuthenticationServerResponse");
    v8 = objc_claimAutoreleasedReturnValue();
    serverResponse = v7->_serverResponse;
    v7->_serverResponse = (NSDictionary *)v8;

  }
  return v7;
}

- (NSDictionary)authenticationResults
{
  void *v2;
  void *v3;

  -[AMSAuthenticateResult authKitUpdateResult](self, "authKitUpdateResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authenticationResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[AMSAuthenticateResult account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSAuthenticateResult account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("kCodingKeyAccount"));

  }
  -[AMSAuthenticateResult authKitUpdateResult](self, "authKitUpdateResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSAuthenticateResult authKitUpdateResult](self, "authKitUpdateResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("kCodingKeyAuthKitUpdateResult"));

  }
  -[AMSAuthenticateResult serverResponse](self, "serverResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSAuthenticateResult serverResponse](self, "serverResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("kCodingKeyServerResponse"));

  }
}

- (AMSAuthenticateResult)initWithCoder:(id)a3
{
  id v4;
  AMSAuthenticateResult *v5;
  uint64_t v6;
  ACAccount *account;
  uint64_t v8;
  AMSAuthKitUpdateResult *authKitUpdateResult;
  void *v10;
  uint64_t v11;
  NSDictionary *serverResponse;

  v4 = a3;
  v5 = -[AMSAuthenticateResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyAccount"));
    v6 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyAuthKitUpdateResult"));
    v8 = objc_claimAutoreleasedReturnValue();
    authKitUpdateResult = v5->_authKitUpdateResult;
    v5->_authKitUpdateResult = (AMSAuthKitUpdateResult *)v8;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kCodingKeyServerResponse"));
    v11 = objc_claimAutoreleasedReturnValue();
    serverResponse = v5->_serverResponse;
    v5->_serverResponse = (NSDictionary *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSAuthenticateResult account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, CFSTR("account"));

  -[AMSAuthenticateResult authKitUpdateResult](self, "authKitUpdateResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, CFSTR("authKitUpdateResult"));

  -[AMSAuthenticateResult serverResponse](self, "serverResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, CFSTR("serverResponse"));

  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)serverResponse
{
  return self->_serverResponse;
}

- (AMSAuthKitUpdateResult)authKitUpdateResult
{
  return self->_authKitUpdateResult;
}

- (void)setAuthKitUpdateResult:(id)a3
{
  objc_storeStrong((id *)&self->_authKitUpdateResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authKitUpdateResult, 0);
  objc_storeStrong((id *)&self->_serverResponse, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
