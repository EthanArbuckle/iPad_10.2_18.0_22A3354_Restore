@implementation AALoginAccountRequest

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
  objc_msgSend(v2, "loginAccountURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AALoginAccountRequest)initWithAccount:(id)a3 delegates:(id)a4
{
  id v7;
  id v8;
  AALoginAccountRequest *v9;
  AALoginAccountRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AALoginAccountRequest;
  v9 = -[AALoginAccountRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_delegatesInfo, a4);
  }

  return v10;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *serverInfo;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)AALoginAccountRequest;
  -[AARequest urlRequest](&v20, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  v19.receiver = self;
  v19.super_class = (Class)AALoginAccountRequest;
  -[AARequest bodyDictionary](&v19, sel_bodyDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setValue:forKey:", self->_delegatesInfo, CFSTR("delegates"));
  serverInfo = self->_serverInfo;
  if (serverInfo)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", serverInfo, CFSTR("serverInfo"));
  v8 = (id)objc_msgSend(v4, "aa_setXMLBodyWithParameters:", v6);
  objc_msgSend(v4, "aa_addDeviceIDHeader");
  +[AADeviceInfo udid](AADeviceInfo, "udid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v9, CFSTR("Device-UDID"));

  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 1);
  objc_msgSend(v4, "aa_addDeviceProvisioningInfoHeadersWithAccount:", self->_account);
  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");
  objc_msgSend(v4, "ak_addDeviceConfigurationModeHeader");
  -[ACAccount _aa_appProvidedContext](self->_account, "_aa_appProvidedContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ACAccount _aa_appProvidedContext](self->_account, "_aa_appProvidedContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ak_addAppProvidedContext:", v11);

    -[ACAccount _aa_setAppProvidedContext:](self->_account, "_aa_setAppProvidedContext:", 0);
  }
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_class();
    objc_msgSend(v4, "allHTTPHeaderFields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "redactedHeadersFromHTTPHeaders:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AARequest redactedBodyStringWithPropertyList:](self, "redactedBodyStringWithPropertyList:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = v13;
    v23 = 2112;
    v24 = v16;
    v25 = 2112;
    v26 = v17;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "AALoginAccountRequest %@\nHTTP Headers: %@\nBody: \n%@", buf, 0x20u);

  }
  return v4;
}

- (NSString)serverInfo
{
  return self->_serverInfo;
}

- (void)setServerInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInfo, 0);
  objc_storeStrong((id *)&self->_delegatesInfo, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
