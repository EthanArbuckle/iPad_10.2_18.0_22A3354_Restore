@implementation AAAuthenticateRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAAuthenticateRequest)initWithAccount:(id)a3
{
  id v4;
  AAAuthenticateRequest *v5;
  AAAuthenticateRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AAAuthenticateRequest;
  v5 = -[AAAuthenticateRequest init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AAAuthenticateRequest setAccount:](v5, "setAccount:", v4);

  return v6;
}

- (AAAuthenticateRequest)initWithUsername:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  AAAuthenticateRequest *v8;
  AAAuthenticateRequest *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AAAuthenticateRequest;
  v8 = -[AAAuthenticateRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AAAuthenticateRequest setUsername:](v8, "setUsername:", v6);
    -[AAAuthenticateRequest setPassword:](v9, "setPassword:", v7);
  }

  return v9;
}

- (AAAuthenticateRequest)initWithURLString:(id)a3 username:(id)a4 password:(id)a5
{
  id v8;
  id v9;
  AAAuthenticateRequest *v10;
  AAAuthenticateRequest *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AAAuthenticateRequest;
  v10 = -[AARequest initWithURLString:](&v13, sel_initWithURLString_, a3);
  v11 = v10;
  if (v10)
  {
    -[AAAuthenticateRequest setUsername:](v10, "setUsername:", v8);
    -[AAAuthenticateRequest setPassword:](v11, "setPassword:", v9);
  }

  return v11;
}

- (id)urlString
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AAAuthenticateRequest;
  -[AARequest urlString](&v9, sel_urlString);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authenticateURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v6);
      objc_msgSend(v7, "string");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (id)urlCredential
{
  return (id)objc_msgSend(MEMORY[0x1E0C92C60], "credentialWithUser:password:persistence:", self->_username, self->_password, 0);
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSString *password;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)AAAuthenticateRequest;
  -[AARequest urlRequest](&v14, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  if (self->_account)
  {
    -[AAAuthenticateRequest account](self, "account");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", v5, 0);
  }
  else if (self->_username && (password = self->_password) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), self->_username, password);
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject dataUsingEncoding:](v5, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", v13, CFSTR("Authorization"));

  }
  else
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Error! No account or username/password for AAAuthenticateRequest!", buf, 2u);
    }
  }

  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("application/xml"), CFSTR("Content-Type"));
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Authorization: *redacted*", buf, 2u);
  }

  return v4;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
