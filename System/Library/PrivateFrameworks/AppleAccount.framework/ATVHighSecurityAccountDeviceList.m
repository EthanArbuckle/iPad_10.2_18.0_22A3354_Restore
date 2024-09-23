@implementation ATVHighSecurityAccountDeviceList

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
  objc_msgSend(v2, "deviceListURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)ATVHighSecurityAccountDeviceList;
  -[AARequest urlRequest](&v21, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  -[ACAccount aa_password](self->super._account, "aa_password");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACAccount username](self->super._account, "username"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Using password auth", buf, 2u);
    }

    v9 = (void *)MEMORY[0x1E0CB3940];
    -[ACAccount username](self->super._account, "username");
    v10 = objc_claimAutoreleasedReturnValue();
    -[ACAccount aa_password](self->super._account, "aa_password");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@:%@"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 1;
  }
  else
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "ERROR: Missing account username or password", buf, 2u);
    }
    v13 = 0;
    v12 = 0;
  }

  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v16, CFSTR("Authorization"));
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("application/xml"), CFSTR("Content-Type"));
  _AALogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "Authorization: *redacted*", buf, 2u);
    }
  }
  else if (v18)
  {
    objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("Authorization"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v19;
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  return v4;
}

@end
