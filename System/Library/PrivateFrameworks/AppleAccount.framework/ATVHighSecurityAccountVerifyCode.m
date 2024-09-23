@implementation ATVHighSecurityAccountVerifyCode

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (ATVHighSecurityAccountVerifyCode)initWithAccount:(id)a3 device:(id)a4 hsaCode:(id)a5
{
  id v9;
  ATVHighSecurityAccountVerifyCode *v10;
  ATVHighSecurityAccountVerifyCode *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ATVHighSecurityAccountVerifyCode;
  v10 = -[ATVHighSecurityAccountSendCode initWithAccount:device:](&v13, sel_initWithAccount_device_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_hsaCode, a5);

  return v11;
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verifyCodeURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v30;
  id v31;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)ATVHighSecurityAccountVerifyCode;
  -[ATVHighSecurityAccountSendCode urlRequest](&v32, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)-[NSDictionary mutableCopy](self->super._device, "mutableCopy");
  objc_msgSend(v5, "setValue:forKey:", self->_hsaCode, CFSTR("hsaCode"));
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 100, 0, &v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v31;
  if (v6)
  {
    objc_msgSend(v4, "setHTTPBody:", v6);
  }
  else
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v9;
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
  }
  v30 = v7;
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11 = objc_retainAutorelease(v6);
  v12 = (void *)objc_msgSend(v10, "initWithBytes:length:encoding:", objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), 4);
  _AALogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v12;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  -[ACAccount aa_password](self->super.super._account, "aa_password");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14
    && (v15 = (void *)v14,
        -[ACAccount username](self->super.super._account, "username"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16))
  {
    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "Using password auth", buf, 2u);
    }

    v18 = (void *)MEMORY[0x1E0CB3940];
    -[ACAccount username](self->super.super._account, "username");
    v19 = objc_claimAutoreleasedReturnValue();
    -[ACAccount aa_password](self->super.super._account, "aa_password");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@:%@"), v19, v20, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 1;
  }
  else
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "ERROR: Missing account username or password", buf, 2u);
    }
    v22 = 0;
    v21 = 0;
  }

  objc_msgSend(v21, "dataUsingEncoding:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "base64EncodedStringWithOptions:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v25, CFSTR("Authorization"));
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("application/xml"), CFSTR("Content-Type"));
  _AALogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "Authorization: *redacted*", buf, 2u);
    }
  }
  else if (v27)
  {
    objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("Authorization"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v28;
    _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hsaCode, 0);
}

@end
