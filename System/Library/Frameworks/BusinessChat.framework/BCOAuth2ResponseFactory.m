@implementation BCOAuth2ResponseFactory

+ (id)makeResponseObjectWithDictionary:(id)a3 version:(int64_t)a4
{
  id v5;
  BCNativeOAuth2Response *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  BCError *v25;
  NSArray *errors;
  NSString *token;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a4 < 2)
  {
    v6 = [BCNativeOAuth2Response alloc];
    v7 = v5;
    if (v6)
    {
      v35.receiver = v6;
      v35.super_class = (Class)BCNativeOAuth2Response;
      v6 = objc_msgSendSuper2(&v35, sel_init);
      if (v6)
      {
        LogCategory_Daemon();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "description");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v37 = v9;
          _os_log_impl(&dword_21C655000, v8, OS_LOG_TYPE_DEFAULT, "BCAuthenticationResponse: initWithDictionary %@", buf, 0xCu);

        }
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("errors"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11)
        {
          v12 = 0;
        }
        else
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("errors"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("token"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 == v14)
        {
          v15 = 0;
        }
        else
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("token"));
          v15 = objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("status"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 == v17)
        {
          v18 = 0;
        }
        else
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("status"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (v12)
        {
          v29 = v18;
          v30 = v15;
          v19 = (NSArray *)objc_opt_new();
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v20 = v12;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, buf, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v32 != v23)
                  objc_enumerationMutation(v20);
                v25 = -[BCError initWithDictionary:]([BCError alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
                if (v25)
                  -[NSArray addObject:](v19, "addObject:", v25);

              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, buf, 16);
            }
            while (v22);
          }

          errors = v6->_errors;
          v6->_errors = v19;

          v15 = v30;
          v18 = v29;
        }
        token = v6->_token;
        v6->_token = (NSString *)v15;

        v6->_status = NativeAuthStatusFromNSString(v18);
      }
    }

  }
  else
  {
    v6 = -[BCServerSideOAuth2Response _initWithDictionary:]([BCServerSideOAuth2Response alloc], "_initWithDictionary:", v5);
  }

  return v6;
}

+ (id)makeResponseObjectWithRedirectURI:(id)a3
{
  id v3;
  BCServerSideOAuth2Response *v4;

  v3 = a3;
  v4 = -[BCServerSideOAuth2Response initWithRedirectURI:]([BCServerSideOAuth2Response alloc], "initWithRedirectURI:", v3);

  return v4;
}

@end
