@implementation AAiCloudTermsDisagreeRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAiCloudTermsDisagreeRequest)initWithURLString:(id)a3 account:(id)a4
{
  id v7;
  AAiCloudTermsDisagreeRequest *v8;
  AAiCloudTermsDisagreeRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AAiCloudTermsDisagreeRequest;
  v8 = -[AARequest initWithURLString:](&v11, sel_initWithURLString_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_account, a4);
    v9->_preferPassword = 1;
  }

  return v9;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *serverInfo;
  NSObject *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)AAiCloudTermsDisagreeRequest;
  -[AARequest urlRequest](&v22, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("application/xml"), CFSTR("Content-Type"));
  objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", self->_account, self->_preferPassword);
  if (self->_account)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aida_accountForAltDSID:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "credentialForAccount:serviceID:", v7, CFSTR("com.apple.gs.icloud.family.auth"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "token");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject aida_alternateDSID](v7, "aida_alternateDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_addGrandslamAuthorizationHeaderWithAltDSID:grandslamToken:", v11, v10);

  }
  else
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AAiCloudTermsAgreeRequest urlRequest].cold.1();
  }

  -[AAiCloudTermsDisagreeRequest additionalHeaders](self, "additionalHeaders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AAiCloudTermsDisagreeRequest additionalHeaders](self, "additionalHeaders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __42__AAiCloudTermsDisagreeRequest_urlRequest__block_invoke;
    v20[3] = &unk_1E416F1E0;
    v21 = v4;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v20);

  }
  v14 = (void *)objc_opt_new();
  v15 = v14;
  serverInfo = self->_serverInfo;
  if (serverInfo)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", serverInfo, CFSTR("serverInfo"));
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v4, "aa_setBodyWithParameters:", v15);
  _AALogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v18;
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "Terms Disagree Request is: %@", buf, 0xCu);

  }
  return v4;
}

uint64_t __42__AAiCloudTermsDisagreeRequest_urlRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (BOOL)preferPassword
{
  return self->_preferPassword;
}

- (void)setPreferPassword:(BOOL)a3
{
  self->_preferPassword = a3;
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_additionalHeaders, a3);
}

- (NSNumber)slaVersion
{
  return self->_slaVersion;
}

- (void)setSlaVersion:(id)a3
{
  objc_storeStrong((id *)&self->_slaVersion, a3);
}

- (NSString)serverInfo
{
  return self->_serverInfo;
}

- (void)setServerInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInfo, 0);
  objc_storeStrong((id *)&self->_slaVersion, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
