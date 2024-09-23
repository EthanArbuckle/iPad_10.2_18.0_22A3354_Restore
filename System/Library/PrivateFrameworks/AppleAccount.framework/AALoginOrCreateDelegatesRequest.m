@implementation AALoginOrCreateDelegatesRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AALoginOrCreateDelegatesRequest)initWithAccount:(id)a3 parameters:(id)a4 signingSession:(id)a5
{
  id v9;
  id v10;
  id v11;
  AALoginOrCreateDelegatesRequest *v12;
  AALoginOrCreateDelegatesRequest *v13;
  uint64_t v14;
  NSDictionary *parameters;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AALoginOrCreateDelegatesRequest;
  v12 = -[AALoginOrCreateDelegatesRequest init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    v14 = objc_msgSend(v10, "copy");
    parameters = v13->_parameters;
    v13->_parameters = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->_signingSession, a5);
  }

  return v13;
}

- (id)urlString
{
  int AppBooleanValue;
  void *v3;
  void *v4;
  void *v5;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("showSSOFlow"), CFSTR("com.apple.purplebuddy"), 0);
  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (AppBooleanValue)
    objc_msgSend(v3, "loginOrCreateDelegatesURL");
  else
    objc_msgSend(v3, "createDelegatesURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSDictionary *parameters;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)AALoginOrCreateDelegatesRequest;
  -[AARequest urlRequest](&v17, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  parameters = self->_parameters;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", parameters, 100, 0, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
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
      v19 = v9;
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
  }
  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[AARequest redactedBodyStringWithPropertyList:](self, "redactedBodyStringWithPropertyList:", self->_parameters);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v11;
    _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "LoginOrCreateAccount request body: \n%@", buf, 0xCu);

  }
  -[ACAccount aa_password](self->_account, "aa_password");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  objc_msgSend(v4, "aa_signBodyData:withSigningSession:", v6, self->_signingSession);
  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");
  objc_msgSend(v4, "aa_addAltDSIDAndRepairStateWithAccount:", self->_account);
  _AALogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v14;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingSession, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
