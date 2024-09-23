@implementation BCServerSideOAuth2Response

- (BCServerSideOAuth2Response)initWithRedirectURI:(id)a3
{
  id v4;
  BCServerSideOAuth2Response *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  BCError *v37;
  uint64_t v38;
  BCError *error;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BCServerSideOAuth2Response;
  v5 = -[BCServerSideOAuth2Response init](&v47, sel_init);
  if (!v5)
    goto LABEL_34;
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_status = 0;
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {

    goto LABEL_33;
  }
  v41 = v4;
  v42 = v6;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (!v11)
    goto LABEL_16;
  v12 = v11;
  v13 = *(_QWORD *)v49;
LABEL_5:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v49 != v13)
      objc_enumerationMutation(v10);
    v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v14);
    objc_msgSend(v15, "name", v41);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("status")))
      break;
    objc_msgSend(v15, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("error_code"));

    if (v18)
      goto LABEL_11;
LABEL_14:
    if (v12 == ++v14)
    {
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (!v12)
      {
LABEL_16:

        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v42, "queryItems");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (!v25)
          goto LABEL_28;
        v26 = v25;
        v27 = *(_QWORD *)v44;
        while (1)
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v44 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v29, "name", v41);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("status"));

            if (v31)
            {
              objc_msgSend(v29, "value");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v5->_status = ServerSideAuthStatusFromNSString(v32);
            }
            else
            {
              objc_msgSend(v29, "name");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("error_code"));

              if (!v34)
                continue;
              objc_msgSend(v29, "value");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "integerValue");

              v37 = [BCError alloc];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v36);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = -[BCError initWithCode:domain:message:](v37, "initWithCode:domain:message:", v32, CFSTR("com.apple.messages.business.oauth2"), CFSTR("OAuth Error"));
              error = v5->_error;
              v5->_error = (BCError *)v38;

            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (!v26)
          {
LABEL_28:

            goto LABEL_32;
          }
        }
      }
      goto LABEL_5;
    }
  }

LABEL_11:
  objc_msgSend(v15, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "length"))
  {
    objc_msgSend(v15, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      goto LABEL_31;
    objc_msgSend(v15, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, v23);

    goto LABEL_14;
  }

LABEL_31:
LABEL_32:
  v4 = v41;
  v6 = v42;
LABEL_33:

LABEL_34:
  return v5;
}

- (id)_initWithDictionary:(id)a3
{
  id v4;
  BCServerSideOAuth2Response *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *error;
  uint64_t v12;
  void *v13;
  void *v14;
  BCError *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BCServerSideOAuth2Response;
  v5 = -[BCServerSideOAuth2Response init](&v17, sel_init);
  if (v5)
  {
    LogCategory_Daemon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl(&dword_21C655000, v6, OS_LOG_TYPE_DEFAULT, "BCAuthenticationResponse: initWithDictionary %@", buf, 0xCu);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
    {
      v5->_status = ServerSideAuthStatusFromNSString(0);
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_status = ServerSideAuthStatusFromNSString(v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error_code"));
    error = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = objc_claimAutoreleasedReturnValue();
    if (error == (void *)v12)
    {
      v14 = error;
      goto LABEL_11;
    }
    v13 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error_code"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = -[BCError initWithCode:domain:message:]([BCError alloc], "initWithCode:domain:message:", v14, CFSTR("com.apple.messages.business.oauth2"), CFSTR("OAuth Error"));
      error = v5->_error;
      v5->_error = v15;
LABEL_11:

    }
  }

  return v5;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  NSStringFromServerSideAuthStatus(-[BCServerSideOAuth2Response status](self, "status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("status"));

  -[BCServerSideOAuth2Response error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "code");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[BCServerSideOAuth2Response error](self, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "code");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("error_code"));

  }
  return (NSDictionary *)v3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BCError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
