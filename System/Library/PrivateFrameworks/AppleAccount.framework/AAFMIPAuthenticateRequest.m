@implementation AAFMIPAuthenticateRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fmipAuthenticate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AAFMIPAuthenticateRequest)initWithAccount:(id)a3
{
  id v5;
  AAFMIPAuthenticateRequest *v6;
  AAFMIPAuthenticateRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAFMIPAuthenticateRequest;
  v6 = -[AAFMIPAuthenticateRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  ACAccount *account;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)AAFMIPAuthenticateRequest;
  -[AARequest urlRequest](&v15, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("GET"));
  account = self->_account;
  if (!account)
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "ERROR: FMIP authentiate does not have an account set, bailing";
      goto LABEL_11;
    }
LABEL_12:

    v11 = 0;
    goto LABEL_13;
  }
  -[ACAccount aa_password](account, "aa_password");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        -[ACAccount username](self->_account, "username"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "ERROR: Account does not contain a password. Password is required for FMIP authenticate";
LABEL_11:
      _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[ACAccount username](self->_account, "username");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "fmipAuthenticate with password auth using username: %@", buf, 0xCu);

  }
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 1);
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("text/plist"), CFSTR("Content-Type"));
  v11 = v4;
LABEL_13:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
