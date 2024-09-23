@implementation BCAuthenticationManager

- (BCAuthenticationManager)initWithAuthenticationRequest:(id)a3
{
  id v5;
  BCAuthenticationManager *v6;
  BCAuthenticationManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCAuthenticationManager;
  v6 = -[BCAuthenticationManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_authenticationRequest, a3);

  return v7;
}

- (void)fetchTokenWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  BCAuthenticationManager *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  NSObject *v33;
  void *v34;
  int v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  BCAuthenticationManager *v42;
  void *v43;
  int v44;
  NSObject *v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  id v52;
  BCAuthenticationManager *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  const __CFString *v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "baseURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v62 = v10;
    _os_log_impl(&dword_21C655000, v8, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: fetchToken for URL: %@", buf, 0xCu);

  }
  v11 = objc_alloc(MEMORY[0x24BDD1808]);
  objc_msgSend(v6, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithURL:resolvingAgainstBaseURL:", v12, 0);

  objc_msgSend(v13, "queryItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
    goto LABEL_44;
  objc_msgSend(v13, "queryItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[BCAuthenticationManager processQueryItems:completion:]((uint64_t)self, v16, v7);

  LogCategory_Daemon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "queryItems");
    v19 = self;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v62 = v20;
    v63 = 1024;
    v64 = v17;
    _os_log_impl(&dword_21C655000, v18, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: queryitems %@ processed: %d", buf, 0x12u);

    self = v19;
  }

  if ((v17 & 1) == 0)
  {
LABEL_44:
    v54 = v13;
    objc_msgSend(v6, "URL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL fragments](v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = v7;
    if (self)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      objc_msgSend(v22, "allKeys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, buf, 16);
      if (v25)
      {
        v26 = v25;
        v53 = self;
        v52 = v6;
        v27 = *(_QWORD *)v56;
LABEL_10:
        v28 = 0;
        while (1)
        {
          if (*(_QWORD *)v56 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v28);
          objc_msgSend(v22, "objectForKeyedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            if (objc_msgSend(v29, "isEqualToString:", CFSTR("code")))
            {
              self = v53;
              -[BCAuthenticationManager exchangeCode:completion:](v53, v30, v23);
LABEL_22:

              v31 = 1;
              v6 = v52;
              goto LABEL_23;
            }
            if (objc_msgSend(v29, "isEqualToString:", CFSTR("access_token")))
            {
              (*((void (**)(id, void *, _QWORD))v23 + 2))(v23, v30, 0);
              self = v53;
              goto LABEL_22;
            }
          }

          if (v26 == ++v28)
          {
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, buf, 16);
            if (v26)
              goto LABEL_10;
            v31 = 0;
            v6 = v52;
            self = v53;
            v13 = v54;
            goto LABEL_24;
          }
        }
      }
      v31 = 0;
LABEL_23:
      v13 = v54;
LABEL_24:

    }
    else
    {
      v31 = 0;
    }
    v32 = (void (**)(_QWORD, _QWORD, _QWORD))v23;

    LogCategory_Daemon();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v62) = v31;
      _os_log_impl(&dword_21C655000, v33, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: fragements processed: %d", buf, 8u);
    }

    if ((v31 & 1) == 0)
    {
      objc_msgSend(v6, "valueForHTTPHeaderField:", CFSTR("Content-Type"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("application/x-www-form-urlencoded"));

      if (v35)
      {
        objc_msgSend(v6, "HTTPBody");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          v37 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v6, "HTTPBody");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(v37, "initWithData:encoding:", v38, 4);

          v40 = objc_alloc_init(MEMORY[0x24BDD1808]);
          objc_msgSend(v40, "setQuery:", v39);
          objc_msgSend(v40, "queryItems");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = self;
          v43 = v41;
          v44 = -[BCAuthenticationManager processQueryItems:completion:]((uint64_t)v42, v41, v32);

          LogCategory_Daemon();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v62 = v39;
            v63 = 1024;
            v64 = v44;
            _os_log_impl(&dword_21C655000, v45, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: body %@ processed: %d", buf, 0x12u);
          }

          if ((v44 & 1) != 0)
            goto LABEL_40;
        }
        else
        {
          LogCategory_Daemon();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21C655000, v46, OS_LOG_TYPE_DEFAULT, "Request has Content-Type application/x-www-form-urlencoded but HTTPBody is empty.", buf, 2u);
          }

        }
      }
      v47 = objc_alloc(MEMORY[0x24BDD1540]);
      v59 = *MEMORY[0x24BDD0FC8];
      v60 = CFSTR("Missing access token from response");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)objc_msgSend(v47, "initWithDomain:code:userInfo:", CFSTR("com.apple.icloud.messages.business.authentication.error"), 0, v48);

      LogCategory_Daemon();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v49, "localizedDescription");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v62 = v51;
        _os_log_error_impl(&dword_21C655000, v50, OS_LOG_TYPE_ERROR, "BCAuthenticationManager: not enough information to process: %@", buf, 0xCu);

      }
      ((void (**)(_QWORD, _QWORD, void *))v32)[2](v32, 0, v49);

    }
  }
LABEL_40:

}

- (uint64_t)processQueryItems:(void *)a3 completion:
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_20;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C655000, v7, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: process query items", buf, 2u);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (!v9)
  {
    a1 = 0;
    goto LABEL_19;
  }
  v10 = v9;
  v20 = (void *)a1;
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  v22 = v5;
  v11 = *(_QWORD *)v24;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v24 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_msgSend(v13, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v13, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("code"));

        if (v16)
        {
          v6 = v21;
          -[BCAuthenticationManager exchangeCode:completion:](v20, v14, v21);
        }
        else
        {
          objc_msgSend(v13, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("access_token"));

          if (!v18)
            goto LABEL_12;
          v6 = v21;
          ((void (**)(_QWORD, void *, _QWORD))v21)[2](v21, v14, 0);
        }

        a1 = 1;
        v5 = v22;
        goto LABEL_19;
      }
LABEL_12:

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
      continue;
    break;
  }
  a1 = 0;
  v6 = v21;
  v5 = v22;
LABEL_19:

LABEL_20:
  return a1;
}

- (void)exchangeCode:(void *)a3 completion:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, void *);
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  objc_msgSend(a1, "authenticationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oauth2");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "tokenExchangeURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v11;
    _os_log_impl(&dword_21C655000, v10, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: exchange code url: %@", buf, 0xCu);

  }
  objc_msgSend(v8, "tokenExchangeBodyWithCode:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v9);
  objc_msgSend(v14, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v14, "setHTTPBody:", v13);
  objc_msgSend(v14, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));
  v15 = (void *)MEMORY[0x24BDD1850];
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sessionWithConfiguration:delegate:delegateQueue:", v16, a1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __51__BCAuthenticationManager_exchangeCode_completion___block_invoke;
  v23 = &unk_24E064FF8;
  v18 = v5;
  v24 = a1;
  v25 = v18;
  objc_msgSend(v17, "dataTaskWithRequest:completionHandler:", v14, &v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resume", v20, v21, v22, v23);

}

void __51__BCAuthenticationManager_exchangeCode_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void (**v13)(id, _QWORD, id);
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C655000, v8, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: exchange code response received", buf, 2u);
  }

  if (v7)
  {
    LogCategory_Daemon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v7;
      _os_log_impl(&dword_21C655000, v9, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: failed to retrieve token: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v6)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v12 = v6;
    v13 = v10;
    if (v11)
    {
      LogCategory_Daemon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v12;
        _os_log_impl(&dword_21C655000, v14, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: access token for data: %@", buf, 0xCu);
      }

      v30 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v12, 1, &v30);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v30;
      if (v16)
      {
        LogCategory_Daemon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "localizedDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v36 = v18;
          _os_log_impl(&dword_21C655000, v17, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: error serializing data to JSON: %@", buf, 0xCu);

        }
        v13[2](v13, 0, v16);
      }
      else
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("access_token"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          ((void (**)(id, void *, id))v13)[2](v13, v23, 0);
        }
        else
        {
          v24 = objc_alloc(MEMORY[0x24BDD1540]);
          v33 = *MEMORY[0x24BDD0FC8];
          v34 = CFSTR("Missing access token from response");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v24, "initWithDomain:code:userInfo:", CFSTR("com.apple.icloud.messages.business.authentication.error"), 2, v25);

          LogCategory_Daemon();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v26, "localizedDescription");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v36 = v29;
            _os_log_error_impl(&dword_21C655000, v27, OS_LOG_TYPE_ERROR, "BCAuthenticationManager: cannot parse access_token: %@", buf, 0xCu);

          }
          v13[2](v13, 0, v26);

        }
      }

    }
  }
  else
  {
    v19 = objc_alloc(MEMORY[0x24BDD1540]);
    v31 = *MEMORY[0x24BDD0FC8];
    v32 = CFSTR("Empty data received");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", CFSTR("com.apple.icloud.messages.business.authentication.error"), 0, v20);

    LogCategory_Daemon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v21, "localizedDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_error_impl(&dword_21C655000, v22, OS_LOG_TYPE_ERROR, "BCAuthenticationManager: cannot parse access_token: %@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  void (**v9)(id, _QWORD, void *);

  v9 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(a4, "protectionSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "serverTrust");

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1818]), "initWithTrust:", v7);
    v9[2](v9, 0, v8);

  }
  else
  {
    v9[2](v9, 0, 0);
  }

}

- (BCOAuth2RequestProtocol)authenticationRequest
{
  return self->_authenticationRequest;
}

- (void)setAuthenticationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationRequest, 0);
}

@end
