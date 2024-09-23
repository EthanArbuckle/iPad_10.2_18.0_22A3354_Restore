@implementation AALoginDelegatesRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AALoginDelegatesRequest)initWithAccount:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  AALoginDelegatesRequest *v9;
  uint64_t v10;
  NSDictionary *loginParameters;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AALoginDelegatesRequest;
  v9 = -[AALoginDelegatesRequest init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    loginParameters = v9->_loginParameters;
    v9->_loginParameters = (NSDictionary *)v10;

    objc_storeStrong((id *)&v9->_account, a3);
  }

  return v9;
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loginDelegatesURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)AALoginDelegatesRequest;
  -[AARequest urlRequest](&v16, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setValue:forKey:", self->_loginParameters, CFSTR("delegates"));
  -[ACAccount username](self->_account, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("apple-id"));

  -[ACAccount credential](self->_account, "credential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "password");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v8, CFSTR("password"));

  +[AADeviceInfo appleIDClientIdentifier](AADeviceInfo, "appleIDClientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("client-id"));

  +[AADeviceInfo udid](AADeviceInfo, "udid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v10, CFSTR("Device-UDID"));

  objc_msgSend(v4, "aa_setBodyWithParameters:", v5);
  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[AARequest redactedBodyStringWithPropertyList:](self, "redactedBodyStringWithPropertyList:", self->_loginParameters);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v12;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "LoginDelegates request body: \n%@", buf, 0xCu);

  }
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("text/plist"), CFSTR("Content-Type"));
  objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", self->_account, 1);
  objc_msgSend(v4, "aa_addAltDSIDAndRepairStateWithAccount:", self->_account);
  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");
  objc_msgSend(v4, "ak_addDeviceConfigurationModeHeader");
  if (objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild"))
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("x-internal"));
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
  objc_storeStrong((id *)&self->_loginParameters, 0);
}

@end
