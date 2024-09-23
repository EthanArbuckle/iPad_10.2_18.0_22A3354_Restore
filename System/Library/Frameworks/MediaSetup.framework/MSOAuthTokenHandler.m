@implementation MSOAuthTokenHandler

+ (id)tokenHandlerWithConfiguration:(id)a3 existingCredential:(id)a4 URLSessionConfiguration:(id)a5 parentNetworkActivity:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  MSOAuthTokenHandler *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[MSOAuthTokenHandler initWithConfiguration:existingCredential:URLSessionConfiguration:parentNetworkActivity:]([MSOAuthTokenHandler alloc], "initWithConfiguration:existingCredential:URLSessionConfiguration:parentNetworkActivity:", v12, v11, v10, v9);

  return v13;
}

- (MSOAuthTokenHandler)initWithConfiguration:(id)a3 existingCredential:(id)a4 URLSessionConfiguration:(id)a5 parentNetworkActivity:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MSOAuthTokenHandler *v15;
  MSOAuthTokenHandler *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MSOAuthTokenHandler;
  v15 = -[MSOAuthTokenHandler init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_authorizationConfiguration, a3);
    objc_storeStrong((id *)&v16->_authorizationCredential, a4);
    objc_storeStrong((id *)&v16->_URLSessionConfiguration, a5);
    objc_storeStrong((id *)&v16->_parentNetworkActivity, a6);
  }

  return v16;
}

- (void)performTokenFetchTaskWithSession:(id)a3 bodyString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v28 = a3;
  _MSLogingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v8;
    _os_log_impl(&dword_219CD8000, v10, OS_LOG_TYPE_INFO, "bodyString: %@", buf, 0xCu);
  }

  v11 = (void *)MEMORY[0x24BDD16B0];
  -[CMSAuthenticationConfiguration authorizationURL](self->_authorizationConfiguration, "authorizationURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestWithURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
  v14 = (void *)MEMORY[0x24BDD17C8];
  -[CMSAuthenticationConfiguration clientID](self->_authorizationConfiguration, "clientID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMSAuthenticationConfiguration clientSecret](self->_authorizationConfiguration, "clientSecret");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@:%@"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "dataUsingEncoding:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "base64EncodedStringWithOptions:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Basic %@"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", v20, CFSTR("Authorization"));
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v27 = v8;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHTTPBody:", v21);

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke;
  v29[3] = &unk_24DBD5420;
  v30 = v22;
  v31 = v9;
  v23 = v9;
  v24 = v22;
  objc_msgSend(v28, "dataTaskWithRequest:completionHandler:", v13, v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSOAuthTokenHandler networkActivity](self, "networkActivity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "associateWithTask:", v25);

  objc_msgSend(v25, "resume");
}

void __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  id v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  _MSLogingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v75 = v8;
    v76 = 2112;
    v77 = v7;
    v78 = 2112;
    v79 = v9;
    _os_log_impl(&dword_219CD8000, v10, OS_LOG_TYPE_INFO, "task complete: resp: %@ data: %@ error: %@", buf, 0x20u);
  }

  if (v9)
  {
    _MSLogingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_5();

  }
  v12 = 0;
  if (!v7 || !v8)
  {
    v19 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    goto LABEL_45;
  }
  v13 = v8;
  if (objc_msgSend(v13, "statusCode") == 200)
  {
    v63 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v63);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v14;
    v59 = v63;
    if (v14)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("token_type"));
      v15 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v57 = (void *)v15;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("access_token"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("scope"));
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            objc_opt_class();
            v61 = v17;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_19;
            _MSLogingFacility();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_3();

          }
          v61 = 0;
LABEL_19:
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("refresh_token"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v20 = v19;
              _MSLogingFacility();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_2();

              v19 = 0;
            }
          }
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("expires_in"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22 || (objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v22, "doubleValue"), v23 <= 0.0))
          {
            v31 = 0;
LABEL_42:

            if (v12)
            {
              v32 = v57;
              v33 = v61;
              +[CMSAuthenticationCredential authCredentialWithToken:tokenType:expirationDate:scope:refreshToken:](CMSAuthenticationCredential, "authCredentialWithToken:tokenType:expirationDate:scope:refreshToken:", v12, v57, v31, v61, v19);
              v34 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v34 = 0;
              v32 = v57;
              v33 = v61;
            }
            goto LABEL_45;
          }
          v24 = v23;
          objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("Date"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25)
            goto LABEL_29;
          v26 = objc_alloc_init(MEMORY[0x24BDD1500]);
          objc_msgSend(v26, "setDateFormat:", CFSTR("EE, dd LLL yyyy HH:mm:ss zz"));
          v54 = v9;
          v27 = v12;
          v28 = v19;
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US"));
          objc_msgSend(v26, "setLocale:", v29);

          v19 = v28;
          v12 = v27;
          v9 = v54;
          objc_msgSend(v26, "dateFromString:", v25);
          v55 = objc_claimAutoreleasedReturnValue();

          v30 = (id)v55;
          if (!v55)
LABEL_29:
            v30 = *(id *)(a1 + 32);
          v56 = v30;
          objc_msgSend(v30, "dateByAddingTimeInterval:", v24);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_41:
          goto LABEL_42;
        }
        v53 = (void *)MEMORY[0x24BDD1540];
        v72 = CFSTR("MSUserInfoErrorStringKey");
        v73 = CFSTR("No access_token in response data");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.errorDomain"), 8, v22);
        v42 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v31 = 0;
        v19 = 0;
LABEL_40:
        v25 = (void *)v9;
        v9 = v42;
        goto LABEL_41;
      }
      v43 = (void *)MEMORY[0x24BDD1540];
      v70 = CFSTR("MSUserInfoErrorStringKey");
      v71 = CFSTR("No token_type in response data");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.errorDomain"), 8, v22);
      v42 = objc_claimAutoreleasedReturnValue();
      v61 = 0;
    }
    else
    {
      _MSLogingFacility();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_1();

      v41 = (void *)MEMORY[0x24BDD1540];
      v68 = CFSTR("MSUserInfoErrorStringKey");
      v69 = CFSTR("unable to parse json data");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.errorDomain"), 8, v22);
      v42 = objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v57 = 0;
    }
    v31 = 0;
    v19 = 0;
    v12 = 0;
    goto LABEL_40;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("non-200 status code: %ld"), objc_msgSend(v13, "statusCode"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  _MSLogingFacility();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_4(v13, v36);

  v37 = (void *)MEMORY[0x24BDD1540];
  v66 = CFSTR("MSUserInfoErrorStringKey");
  v67 = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.errorDomain"), 8, v38);
  v39 = objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v19 = 0;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v9 = v39;
  v31 = 0;
LABEL_45:
  if (!(v34 | v9))
  {
    v60 = (void *)MEMORY[0x24BDD1540];
    v62 = v31;
    v64 = CFSTR("MSUserInfoErrorStringKey");
    v65 = CFSTR("could not create credential from response data");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v44 = v12;
    v45 = v19;
    v46 = v33;
    v47 = v32;
    v48 = v8;
    v49 = v7;
    v50 = a1;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.errorDomain"), 8, v51);
    v52 = objc_claimAutoreleasedReturnValue();

    a1 = v50;
    v7 = v49;
    v8 = v48;
    v32 = v47;
    v33 = v46;
    v19 = v45;
    v12 = v44;
    v9 = v52;
    v31 = v62;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)performTokenGrantRequestWithSession:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = (void *)MEMORY[0x24BDD16A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "string");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendString:", CFSTR("grant_type=client_credentials"));
  -[CMSAuthenticationConfiguration scope](self->_authorizationConfiguration, "scope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CMSAuthenticationConfiguration scope](self->_authorizationConfiguration, "scope");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "formEncodedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", CFSTR("&scope=%@"), v11);

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSOAuthTokenHandler performTokenFetchTaskWithSession:bodyString:completionHandler:](self, "performTokenFetchTaskWithSession:bodyString:completionHandler:", v8, v12, v7);

}

- (void)performTokenRefreshWithSession:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = (void *)MEMORY[0x24BDD16A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "string");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendString:", CFSTR("grant_type=refresh_token"));
  -[CMSAuthenticationCredential refreshToken](self->_authorizationCredential, "refreshToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formEncodedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendFormat:", CFSTR("&refresh_token=%@"), v10);

  -[CMSAuthenticationCredential scope](self->_authorizationCredential, "scope");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CMSAuthenticationCredential scope](self->_authorizationCredential, "scope");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "formEncodedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendFormat:", CFSTR("&scope=%@"), v13);

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSOAuthTokenHandler performTokenFetchTaskWithSession:bodyString:completionHandler:](self, "performTokenFetchTaskWithSession:bodyString:completionHandler:", v8, v14, v7);

}

- (void)fetchTokens:(id)a3
{
  id v4;
  NSURLSessionConfiguration *URLSessionConfiguration;
  NSURLSessionConfiguration *v6;
  NSURLSessionConfiguration *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  CMSAuthenticationCredential *authorizationCredential;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  void *v25;
  _QWORD v26[5];
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v4 = a3;
  URLSessionConfiguration = self->_URLSessionConfiguration;
  if (URLSessionConfiguration)
  {
    v6 = URLSessionConfiguration;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
    v6 = (NSURLSessionConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __35__MSOAuthTokenHandler_fetchTokens___block_invoke;
  v29[3] = &unk_24DBD5448;
  v10 = v4;
  v31 = v10;
  v11 = v8;
  v30 = v11;
  v12 = (void *)MEMORY[0x220733AC8](v29);
  authorizationCredential = self->_authorizationCredential;
  if (authorizationCredential
    && (-[CMSAuthenticationCredential refreshToken](authorizationCredential, "refreshToken"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    v15 = objc_alloc(MEMORY[0x24BE17978]);
    -[MSOAuthTokenHandler parentNetworkActivity](self, "parentNetworkActivity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithLabel:parentActivity:", 2, v16);
    -[MSOAuthTokenHandler setNetworkActivity:](self, "setNetworkActivity:", v17);

    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __35__MSOAuthTokenHandler_fetchTokens___block_invoke_2;
    v26[3] = &unk_24DBD5498;
    v18 = &v28;
    v26[4] = self;
    v28 = v12;
    v27 = v11;
    v19 = v12;
    -[MSOAuthTokenHandler performTokenRefreshWithSession:completionHandler:](self, "performTokenRefreshWithSession:completionHandler:", v27, v26);

  }
  else
  {
    v20 = objc_alloc(MEMORY[0x24BE17978]);
    -[MSOAuthTokenHandler parentNetworkActivity](self, "parentNetworkActivity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithLabel:parentActivity:", 1, v21);
    -[MSOAuthTokenHandler setNetworkActivity:](self, "setNetworkActivity:", v22);

    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __35__MSOAuthTokenHandler_fetchTokens___block_invoke_4;
    v24[3] = &unk_24DBD5470;
    v18 = &v25;
    v24[4] = self;
    v25 = v12;
    v23 = v12;
    -[MSOAuthTokenHandler performTokenGrantRequestWithSession:completionHandler:](self, "performTokenGrantRequestWithSession:completionHandler:", v11, v24);
  }

}

uint64_t __35__MSOAuthTokenHandler_fetchTokens___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidateAndCancel");
}

void __35__MSOAuthTokenHandler_fetchTokens___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "networkActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "completeActivity:", 2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BE17978]);
    objc_msgSend(*(id *)(a1 + 32), "networkActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithLabel:parentActivity:", 1, v9);

    objc_msgSend(*(id *)(a1 + 32), "networkActivity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "completeActivity:", 3);

    objc_msgSend(*(id *)(a1 + 32), "setNetworkActivity:", v10);
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __35__MSOAuthTokenHandler_fetchTokens___block_invoke_3;
    v14[3] = &unk_24DBD5470;
    v14[4] = v12;
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v12, "performTokenGrantRequestWithSession:completionHandler:", v13, v14);

  }
}

void __35__MSOAuthTokenHandler_fetchTokens___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v9 = a2;
  objc_msgSend(v5, "networkActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v8 = 2;
  else
    v8 = 3;
  objc_msgSend(v7, "completeActivity:", v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __35__MSOAuthTokenHandler_fetchTokens___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v9 = a2;
  objc_msgSend(v5, "networkActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v8 = 2;
  else
    v8 = 3;
  objc_msgSend(v7, "completeActivity:", v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (CMSAuthenticationConfiguration)authorizationConfiguration
{
  return (CMSAuthenticationConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (CMSAuthenticationCredential)authorizationCredential
{
  return (CMSAuthenticationCredential *)objc_getProperty(self, a2, 16, 1);
}

- (NSURLSessionConfiguration)URLSessionConfiguration
{
  return (NSURLSessionConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (CMSNetworkActivity)parentNetworkActivity
{
  return self->_parentNetworkActivity;
}

- (CMSNetworkActivity)networkActivity
{
  return self->_networkActivity;
}

- (void)setNetworkActivity:(id)a3
{
  objc_storeStrong((id *)&self->_networkActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong((id *)&self->_parentNetworkActivity, 0);
  objc_storeStrong((id *)&self->_URLSessionConfiguration, 0);
  objc_storeStrong((id *)&self->_authorizationCredential, 0);
  objc_storeStrong((id *)&self->_authorizationConfiguration, 0);
}

void __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, v0, v1, "unable to parse json data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, v0, v1, "Unusable refresh_token %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, v0, v1, "Unusable scope %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_4(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "statusCode");
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_219CD8000, a2, OS_LOG_TYPE_ERROR, "non-200 status code: %ld", v3, 0xCu);
}

void __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, v0, v1, "Task failed: Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
