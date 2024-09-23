@implementation AASetupAssistantSetupDelegatesRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AASetupAssistantSetupDelegatesRequest)initWithAccount:(id)a3 withSetupParameters:(id)a4 signingSession:(id)a5
{
  id v9;
  id v10;
  id v11;
  AASetupAssistantSetupDelegatesRequest *v12;
  AASetupAssistantSetupDelegatesRequest *v13;
  uint64_t v14;
  NSDictionary *setupParameters;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AASetupAssistantSetupDelegatesRequest;
  v12 = -[AASetupAssistantSetupDelegatesRequest init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    v14 = objc_msgSend(v10, "copy");
    setupParameters = v13->setupParameters;
    v13->setupParameters = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->signingSession, a5);
  }

  return v13;
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AASetupAssistantService urlConfiguration](AASetupAssistantService, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDelegateAccountsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSDictionary *setupParameters;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)AASetupAssistantSetupDelegatesRequest;
  -[AARequest urlRequest](&v28, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  setupParameters = self->setupParameters;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", setupParameters, 100, 0, &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;
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
      v30 = v9;
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
  }
  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[AARequest redactedBodyStringWithPropertyList:](self, "redactedBodyStringWithPropertyList:", self->setupParameters);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v11;
    _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "CreateDelegateAccounts request body: \n%@", buf, 0xCu);

  }
  +[AADeviceInfo udid](AADeviceInfo, "udid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v12, CFSTR("Device-UDID"));

  -[ACAccount aa_password](self->_account, "aa_password");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    goto LABEL_9;
  -[ACAccount aa_authToken](self->_account, "aa_authToken");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ACAccount username](self->_account, "username");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      -[ACAccount aa_personID](self->_account, "aa_personID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACAccount aa_authToken](self->_account, "aa_authToken");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@:%@"), v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "dataUsingEncoding:", 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "base64EncodedStringWithOptions:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-MobileMe-AuthToken %@"), v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addValue:forHTTPHeaderField:", v13, CFSTR("Authorization"));
      _AALogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "Using token auth", buf, 2u);
      }

LABEL_9:
    }
  }
  objc_msgSend(v4, "aa_signBodyData:withSigningSession:", v6, self->signingSession);
  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");
  _AALogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v15;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->signingSession, 0);
  objc_storeStrong((id *)&self->setupParameters, 0);
}

@end
