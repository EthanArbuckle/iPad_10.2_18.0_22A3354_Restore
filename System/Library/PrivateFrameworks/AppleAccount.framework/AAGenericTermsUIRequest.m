@implementation AAGenericTermsUIRequest

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
  objc_msgSend(v2, "genericTermsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AAGenericTermsUIRequest)initWithParameters:(id)a3
{
  return -[AAGenericTermsUIRequest initWithAccount:parameters:](self, "initWithAccount:parameters:", 0, a3);
}

- (AAGenericTermsUIRequest)initWithAccount:(id)a3 parameters:(id)a4
{
  return -[AAGenericTermsUIRequest initWithAccount:parameters:preferPassword:](self, "initWithAccount:parameters:preferPassword:", a3, a4, 1);
}

- (AAGenericTermsUIRequest)initWithAccount:(id)a3 parameters:(id)a4 preferPassword:(BOOL)a5
{
  id v9;
  id v10;
  AAGenericTermsUIRequest *v11;
  uint64_t v12;
  NSDictionary *requestDictionary;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AAGenericTermsUIRequest;
  v11 = -[AAGenericTermsUIRequest init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    requestDictionary = v11->_requestDictionary;
    v11->_requestDictionary = (NSDictionary *)v12;

    objc_storeStrong((id *)&v11->_account, a3);
    v11->_preferPassword = a5;
  }

  return v11;
}

- (AAGenericTermsUIRequest)initWithTermsEntries:(id)a3
{
  return -[AAGenericTermsUIRequest initWithAccount:termsEntries:](self, "initWithAccount:termsEntries:", 0, a3);
}

- (AAGenericTermsUIRequest)initWithAccount:(id)a3 termsEntries:(id)a4
{
  id v6;
  void *v7;
  AAGenericTermsUIRequest *v8;

  v6 = a3;
  -[AAGenericTermsUIRequest _requestParamsForTermsEntries:](self, "_requestParamsForTermsEntries:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AAGenericTermsUIRequest initWithAccount:parameters:](self, "initWithAccount:parameters:", v6, v7);

  return v8;
}

- (id)_requestParamsForTermsEntries:(id)a3
{
  return -[AAGenericTermsUIRequest _requestParamsForTermsEntries:additionalInfo:](self, "_requestParamsForTermsEntries:additionalInfo:", a3, 0);
}

- (id)_requestParamsForTermsEntries:(id)a3 additionalInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v19 = v5;
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "addObject:", CFSTR("iCloud"));
    if (objc_msgSend(v7, "containsObject:", CFSTR("iOSWarranty")))
      objc_msgSend(v7, "addObject:", CFSTR("iOS"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
          v15 = (void *)objc_opt_new();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("name"));
          objc_msgSend(v6, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v15, "addEntriesFromDictionary:", v16);
          objc_msgSend(v8, "addObject:", v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v11);
    }

    v24[0] = CFSTR("terms");
    v24[1] = CFSTR("format");
    v25[0] = v8;
    v25[1] = CFSTR("plist/buddyml");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v19;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSString *serverInfo;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  ACAccount *account;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
  void *v33;
  id v34;
  id v35;
  objc_super v36;
  uint8_t buf[4];
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)AAGenericTermsUIRequest;
  -[AARequest urlRequest](&v36, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  v5 = (void *)-[NSDictionary mutableCopy](self->_requestDictionary, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  serverInfo = self->_serverInfo;
  if (serverInfo)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", serverInfo, CFSTR("serverInfo"));
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 100, 0, &v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35;
  if (!v10)
  {
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    objc_msgSend(v11, "localizedDescription");
    v15 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v15;
    v16 = "No data body to set on HTTP request: %@";
    v17 = v14;
    goto LABEL_11;
  }
  objc_msgSend(v4, "setHTTPBody:", v10);
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v12, "initWithBytes:length:encoding:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 4);
  _AALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v14;
    v16 = "Request body:%@";
    v17 = v15;
LABEL_11:
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
  }

LABEL_13:
  account = self->_account;
  if (account)
  {
    if (!objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", account, self->_preferPassword))
    {
      v28 = 0;
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "aida_accountForAltDSID:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "credentialForAccount:serviceID:", v21, CFSTR("com.apple.gs.icloud.family.auth"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "token");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "aida_alternateDSID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_addGrandslamAuthorizationHeaderWithAltDSID:grandslamToken:", v25, v24);

  }
  -[AAGenericTermsUIRequest additionalHeaders](self, "additionalHeaders");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[AAGenericTermsUIRequest additionalHeaders](self, "additionalHeaders");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __37__AAGenericTermsUIRequest_urlRequest__block_invoke;
    v33 = &unk_1E416F1E0;
    v34 = v4;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", &v30);

  }
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("text/plist"), CFSTR("Content-Type"), v30, v31, v32, v33);
  v28 = v4;
LABEL_20:

  return v28;
}

uint64_t __37__AAGenericTermsUIRequest_urlRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (NSDictionary)requestDictionary
{
  return self->_requestDictionary;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_additionalHeaders, a3);
}

- (BOOL)preferPassword
{
  return self->_preferPassword;
}

- (void)setPreferPassword:(BOOL)a3
{
  self->_preferPassword = a3;
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
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_requestDictionary, 0);
}

@end
