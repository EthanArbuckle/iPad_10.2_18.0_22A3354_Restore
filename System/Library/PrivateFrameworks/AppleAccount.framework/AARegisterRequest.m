@implementation AARegisterRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AARegisterRequest)initWithURLString:(id)a3 username:(id)a4 password:(id)a5
{
  id v8;
  id v9;
  AARegisterRequest *v10;
  AARegisterRequest *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AARegisterRequest;
  v10 = -[AARequest initWithURLString:](&v13, sel_initWithURLString_, a3);
  v11 = v10;
  if (v10)
  {
    -[AAAuthenticateRequest setUsername:](v10, "setUsername:", v8);
    -[AAAuthenticateRequest setPassword:](v11, "setPassword:", v9);
  }

  return v11;
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signInURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addCookieHeaders:(id)a3
{
  id v4;
  NSMutableDictionary *additionalCookieHeaders;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  id v8;

  v4 = a3;
  additionalCookieHeaders = self->_additionalCookieHeaders;
  v8 = v4;
  if (!additionalCookieHeaders)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_additionalCookieHeaders;
    self->_additionalCookieHeaders = v6;

    v4 = v8;
    additionalCookieHeaders = self->_additionalCookieHeaders;
  }
  -[NSMutableDictionary addEntriesFromDictionary:](additionalCookieHeaders, "addEntriesFromDictionary:", v4);

}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)AARegisterRequest;
  -[AAAuthenticateRequest urlRequest](&v31, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AARequest bodyDictionary](self, "bodyDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_setXMLBodyWithParameters:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = objc_retainAutorelease(v6);
  v9 = (void *)objc_msgSend(v7, "initWithBytes:length:encoding:", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), 4);
  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v9;
    _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v11 = (void *)-[NSMutableDictionary copy](self->_additionalCookieHeaders, "copy");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v17, (_QWORD)v27);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setValue:forHTTPHeaderField:", v18, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v14);
  }

  +[AADeviceInfo udid](AADeviceInfo, "udid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v19, CFSTR("Device-UDID"));

  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v21;
    _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  _AALogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_opt_class();
    objc_msgSend(v4, "allHTTPHeaderFields");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "redactedHeadersFromHTTPHeaders:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v25;
    _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "HTTP Headers: %@", buf, 0xCu);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalCookieHeaders, 0);
}

@end
