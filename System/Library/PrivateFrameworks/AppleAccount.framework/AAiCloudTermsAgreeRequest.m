@implementation AAiCloudTermsAgreeRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAiCloudTermsAgreeRequest)initWithURLString:(id)a3 account:(id)a4
{
  id v7;
  AAiCloudTermsAgreeRequest *v8;
  AAiCloudTermsAgreeRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AAiCloudTermsAgreeRequest;
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
  v22.super_class = (Class)AAiCloudTermsAgreeRequest;
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

  -[AAiCloudTermsAgreeRequest additionalHeaders](self, "additionalHeaders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AAiCloudTermsAgreeRequest additionalHeaders](self, "additionalHeaders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __39__AAiCloudTermsAgreeRequest_urlRequest__block_invoke;
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
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "Terms Agree Request is: %@", buf, 0xCu);

  }
  return v4;
}

uint64_t __39__AAiCloudTermsAgreeRequest_urlRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (void)performRequestWithHandler:(id)a3
{
  id v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__AAiCloudTermsAgreeRequest_performRequestWithHandler___block_invoke;
  v7[3] = &unk_1E416F208;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)AAiCloudTermsAgreeRequest;
  -[AARequest performRequestWithHandler:](&v6, sel_performRequestWithHandler_, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __55__AAiCloudTermsAgreeRequest_performRequestWithHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD *WeakRetained;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "acceptedTermsInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "slaVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    _AALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __55__AAiCloudTermsAgreeRequest_performRequestWithHandler___block_invoke_cold_1(v13);

    v14 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(WeakRetained, "slaVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("SLAVersion"));

    v16 = objc_msgSend(v14, "copy");
    v10 = (void *)v16;
  }
  if (objc_msgSend(v8, "statusCode") >= 200 && objc_msgSend(v8, "statusCode") <= 299 && v10)
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "saveTermsAcceptance:forAccount:", v10, WeakRetained[8]);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

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

- (void)urlRequest
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  OUTLINED_FUNCTION_10();
}

void __55__AAiCloudTermsAgreeRequest_performRequestWithHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19EACA000, log, OS_LOG_TYPE_DEBUG, "SLAVersion available.", v1, 2u);
}

@end
