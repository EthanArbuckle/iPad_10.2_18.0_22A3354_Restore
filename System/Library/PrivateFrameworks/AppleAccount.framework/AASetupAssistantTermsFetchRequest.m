@implementation AASetupAssistantTermsFetchRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AASetupAssistantTermsFetchRequest)initWithAccount:(id)a3
{
  id v5;
  AASetupAssistantTermsFetchRequest *v6;
  AASetupAssistantTermsFetchRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AASetupAssistantTermsFetchRequest;
  v6 = -[AASetupAssistantTermsFetchRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AASetupAssistantService urlConfiguration](AASetupAssistantService, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "upgradeIOSTermsUI");
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
  void *v8;
  void *v9;
  void *v10;
  ACAccount *account;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v26;
  void *v27;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)AASetupAssistantTermsFetchRequest;
  -[AARequest urlRequest](&v29, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  -[ACAccount username](self->_account, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[ACAccount username](self->_account, "username");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  -[ACAccount aa_password](self->_account, "aa_password");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  account = self->_account;
  if (v9)
    v12 = v8 == 0;
  else
    v12 = 1;
  if (v12)
  {
    -[ACAccount aa_personID](account, "aa_personID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount aa_authToken](self->_account, "aa_authToken");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@"), v13, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-MobileMe-AuthToken %@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addValue:forHTTPHeaderField:", v23, CFSTR("Authorization"));
    _AALogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v16 = "Using token auth";
    v17 = v24;
    v18 = 2;
    goto LABEL_13;
  }
  -[ACAccount aa_password](account, "aa_password");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@"), v8, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "dataUsingEncoding:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v23, CFSTR("Authorization"));
  _AALogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v8;
    v16 = "Using password auth - username: %@";
    v17 = v24;
    v18 = 12;
LABEL_13:
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
  }
LABEL_14:

  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("application/xml"), CFSTR("Content-Type"));
  _AALogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v27;
    _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
