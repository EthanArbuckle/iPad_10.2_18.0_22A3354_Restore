@implementation AAUpdateProvisioningRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAUpdateProvisioningRequest)initWithAccount:(id)a3
{
  id v4;
  AAUpdateProvisioningRequest *v5;
  AAUpdateProvisioningRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AAUpdateProvisioningRequest;
  v5 = -[AAUpdateProvisioningRequest init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AAUpdateProvisioningRequest setAccount:](v5, "setAccount:", v4);

  return v6;
}

- (AAUpdateProvisioningRequest)initWithAccount:(id)a3 token:(id)a4
{
  id v6;
  id v7;
  AAUpdateProvisioningRequest *v8;
  AAUpdateProvisioningRequest *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AAUpdateProvisioningRequest;
  v8 = -[AAUpdateProvisioningRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AAUpdateProvisioningRequest setAccount:](v8, "setAccount:", v6);
    -[AAUpdateProvisioningRequest setAuthToken:](v9, "setAuthToken:", v7);
  }

  return v9;
}

- (AAUpdateProvisioningRequest)initWithURLString:(id)a3 account:(id)a4
{
  id v6;
  AAUpdateProvisioningRequest *v7;
  AAUpdateProvisioningRequest *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AAUpdateProvisioningRequest;
  v7 = -[AARequest initWithURLString:](&v10, sel_initWithURLString_, a3);
  v8 = v7;
  if (v7)
    -[AAUpdateProvisioningRequest setAccount:](v7, "setAccount:", v6);

  return v8;
}

- (id)urlCredential
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C92C60];
  -[AAUpdateProvisioningRequest account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUpdateProvisioningRequest account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_authToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "credentialWithUser:password:persistence:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchAccountSettingsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *serverInfo;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)AAUpdateProvisioningRequest;
  -[AARequest urlRequest](&v20, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AARequest bodyDictionary](self, "bodyDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  serverInfo = self->_serverInfo;
  if (serverInfo)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", serverInfo, CFSTR("serverInfo"));
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 100, 0, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  if (v8)
  {
    objc_msgSend(v4, "setHTTPBody:", v8);
  }
  else
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
  }
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13 = objc_retainAutorelease(v8);
  v14 = (void *)objc_msgSend(v12, "initWithBytes:length:encoding:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 4);
  _AALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v4, "aa_addDeviceIDHeader");
  -[AAUpdateProvisioningRequest account](self, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUpdateProvisioningRequest authToken](self, "authToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:authToken:", v16, v17);

  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("application/xml"), CFSTR("Content-Type"));
  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");

  return v4;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
