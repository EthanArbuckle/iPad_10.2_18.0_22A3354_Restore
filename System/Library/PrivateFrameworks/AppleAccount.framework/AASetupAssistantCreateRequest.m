@implementation AASetupAssistantCreateRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AASetupAssistantCreateRequest)initWithAccount:(id)a3 withAppleIDParameters:(id)a4 signingSession:(id)a5
{
  id v9;
  id v10;
  id v11;
  AASetupAssistantCreateRequest *v12;
  AASetupAssistantCreateRequest *v13;
  uint64_t v14;
  NSDictionary *appleIDParameters;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AASetupAssistantCreateRequest;
  v12 = -[AASetupAssistantCreateRequest init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    v14 = objc_msgSend(v10, "copy");
    appleIDParameters = v13->appleIDParameters;
    v13->appleIDParameters = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->signingSession, a5);
  }

  return v13;
}

- (id)bodyDictionary
{
  return self->appleIDParameters;
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AASetupAssistantService urlConfiguration](AASetupAssistantService, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createAppleIDURL");
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
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v31;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)AASetupAssistantCreateRequest;
  -[AARequest urlRequest](&v32, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  v5 = (void *)MEMORY[0x1E0CB38B0];
  -[AASetupAssistantCreateRequest bodyDictionary](self, "bodyDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v5, "dataWithPropertyList:format:options:error:", v6, 100, 0, &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;

  if (v7)
  {
    objc_msgSend(v4, "setHTTPBody:", v7);
  }
  else
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v10;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
  }
  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[AASetupAssistantCreateRequest bodyDictionary](self, "bodyDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AARequest redactedBodyStringWithPropertyList:](self, "redactedBodyStringWithPropertyList:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v13;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "CreateAppleID request body: \n%@", buf, 0xCu);

  }
  +[AADeviceInfo udid](AADeviceInfo, "udid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v14, CFSTR("Device-UDID"));

  -[ACAccount aa_authToken](self->_account, "aa_authToken");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[ACAccount username](self->_account, "username");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      -[ACAccount aa_personID](self->_account, "aa_personID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACAccount aa_authToken](self->_account, "aa_authToken");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@:%@"), v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "dataUsingEncoding:", 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "base64EncodedStringWithOptions:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addValue:forHTTPHeaderField:", v24, CFSTR("Authorization"));
      _AALogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EACA000, v25, OS_LOG_TYPE_DEFAULT, "Using token auth", buf, 2u);
      }

    }
  }
  objc_msgSend(v4, "aa_signBodyData:withSigningSession:", v7, self->signingSession);
  _AALogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v27;
    _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);

  }
  _AALogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v29;
    _os_log_impl(&dword_19EACA000, v28, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->signingSession, 0);
  objc_storeStrong((id *)&self->appleIDParameters, 0);
}

@end
