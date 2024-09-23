@implementation AASetupAssistantUpgradeStatusRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AASetupAssistantUpgradeStatusRequest)initWithAccount:(id)a3
{
  id v5;
  AASetupAssistantUpgradeStatusRequest *v6;
  AASetupAssistantUpgradeStatusRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AASetupAssistantUpgradeStatusRequest;
  v6 = -[AASetupAssistantUpgradeStatusRequest init](&v9, sel_init);
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
  objc_msgSend(v2, "upgradeStatusURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)AASetupAssistantUpgradeStatusRequest;
  -[AARequest urlRequest](&v16, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[ACAccount aa_personID](self->_account, "aa_personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount aa_authToken](self->_account, "aa_authToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-MobileMe-AuthToken %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v11, CFSTR("Authorization"));
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Using token auth", buf, 2u);
  }

  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("application/xml"), CFSTR("Content-Type"));
  _AALogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v14;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
