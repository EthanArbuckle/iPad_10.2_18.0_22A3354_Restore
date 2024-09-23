@implementation WFOAuth2SessionManager

- (WFOAuth2SessionManager)initWithSessionConfiguration:(id)a3 tokenURL:(id)a4 authorizationURL:(id)a5 authenticationMethod:(id)a6 clientID:(id)a7 clientSecret:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  WFOAuth2SessionManager *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSURLSession *session;
  uint64_t v26;
  NSURL *tokenURL;
  uint64_t v28;
  NSURL *authorizationURL;
  uint64_t v30;
  NSString *authenticationMethod;
  uint64_t v32;
  NSString *clientID;
  uint64_t v34;
  NSString *clientSecret;
  WFOAuth2SessionManager *v36;
  void *v38;
  void *v39;
  objc_super v40;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v18)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2SessionManager.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authenticationMethod"));

    if (v19)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2SessionManager.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientID"));

LABEL_3:
  v40.receiver = self;
  v40.super_class = (Class)WFOAuth2SessionManager;
  v21 = -[WFOAuth2SessionManager init](&v40, sel_init);
  if (v21)
  {
    v22 = (void *)MEMORY[0x24BDB74B0];
    v23 = v15;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDB74B8], "wf_defaultSessionConfiguration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "sessionWithConfiguration:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    session = v21->_session;
    v21->_session = (NSURLSession *)v24;

    if (!v15)
    v26 = objc_msgSend(v16, "copy");
    tokenURL = v21->_tokenURL;
    v21->_tokenURL = (NSURL *)v26;

    v28 = objc_msgSend(v17, "copy");
    authorizationURL = v21->_authorizationURL;
    v21->_authorizationURL = (NSURL *)v28;

    v30 = objc_msgSend(v18, "copy");
    authenticationMethod = v21->_authenticationMethod;
    v21->_authenticationMethod = (NSString *)v30;

    v32 = objc_msgSend(v19, "copy");
    clientID = v21->_clientID;
    v21->_clientID = (NSString *)v32;

    v34 = objc_msgSend(v20, "copy");
    clientSecret = v21->_clientSecret;
    v21->_clientSecret = (NSString *)v34;

    v36 = v21;
  }

  return v21;
}

- (void)authenticateWithScopes:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD1838];
  v8 = a3;
  objc_msgSend(v7, "queryItemWithName:value:", CFSTR("grant_type"), CFSTR("client_credentials"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "combinedScopeFromScopes:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("scope"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObject:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  -[WFOAuth2SessionManager authenticateWithParameters:completionHandler:](self, "authenticateWithParameters:completionHandler:", v10, v6);

}

- (void)authenticateWithUsername:(id)a3 password:(id)a4 scopes:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2SessionManager.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("password"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2SessionManager.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("username"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2SessionManager.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("grant_type"), CFSTR("password"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("username"), v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v16;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("password"), v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "combinedScopeFromScopes:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("scope"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayByAddingObject:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v21;
  }
  -[WFOAuth2SessionManager authenticateWithParameters:completionHandler:](self, "authenticateWithParameters:completionHandler:", v18, v14);

}

- (void)authenticateWithCode:(id)a3 redirectURI:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2SessionManager.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("code"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2SessionManager.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("grant_type"), CFSTR("authorization_code"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("code"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v16 = (void *)MEMORY[0x24BDD1838];
    objc_msgSend(v10, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "queryItemWithName:value:", CFSTR("redirect_uri"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObject:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v19;
  }
  -[WFOAuth2SessionManager authenticateWithParameters:completionHandler:](self, "authenticateWithParameters:completionHandler:", v15, v12);

}

- (void)authenticateWithRefreshCredential:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "refreshToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2SessionManager.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("refreshCredential.refreshToken"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2SessionManager.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("grant_type"), CFSTR("refresh_token"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v11 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v8, "refreshToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "queryItemWithName:value:", CFSTR("refresh_token"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOAuth2SessionManager authenticateWithParameters:completionHandler:](self, "authenticateWithParameters:completionHandler:", v14, v7);

}

- (void)authenticateWithParameters:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2SessionManager.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2SessionManager.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  v10 = (void *)MEMORY[0x24BDB7458];
  -[WFOAuth2SessionManager tokenURL](self, "tokenURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestWithURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_setNonAppInitiated:", 1);
  objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
  -[WFOAuth2SessionManager authenticationMethod](self, "authenticationMethod");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("client_secret_basic")))
  {
    -[WFOAuth2SessionManager clientID](self, "clientID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOAuth2SessionManager clientSecret](self, "clientSecret");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wfo_setAuthorizationWithUsername:password:", v14, v15);
  }
  else
  {
    if (!objc_msgSend(v13, "isEqualToString:", CFSTR("client_secret_post")))
      goto LABEL_10;
    v16 = (void *)MEMORY[0x24BDD1838];
    -[WFOAuth2SessionManager clientID](self, "clientID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "queryItemWithName:value:", CFSTR("client_id"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFOAuth2SessionManager clientSecret](self, "clientSecret");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "length"))
    {
      v7 = v19;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("client_secret"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayByAddingObject:", v15);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

LABEL_10:
  objc_msgSend(v12, "wfo_setBodyWithQueryItems:", v7);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = v7;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v21)
  {
    v22 = v21;
    v31 = v13;
    v32 = v9;
    v23 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v25, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("refresh_token"));

        if (v27)
        {
          objc_msgSend(v25, "value");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v22)
        continue;
      break;
    }
    v28 = 0;
LABEL_20:
    v13 = v31;
    v9 = v32;
  }
  else
  {
    v28 = 0;
  }

  -[WFOAuth2SessionManager authenticateWithRequest:refreshToken:completionHandler:](self, "authenticateWithRequest:refreshToken:completionHandler:", v12, v28, v9);
}

- (void)authenticateWithRequest:(id)a3 refreshToken:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __81__WFOAuth2SessionManager_authenticateWithRequest_refreshToken_completionHandler___block_invoke;
  v12[3] = &unk_24F8BAA00;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[WFOAuth2SessionManager sendRequest:completionHandler:](self, "sendRequest:completionHandler:", a3, v12);

}

- (void)sendRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[WFOAuth2SessionManager session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__WFOAuth2SessionManager_sendRequest_completionHandler___block_invoke;
  v11[3] = &unk_24F8BB3E0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v7, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "resume");
}

- (id)authorizationSessionWithResponseType:(id)a3 scopes:(id)a4 redirectURI:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[WFOAuth2SessionManager authorizationURL](self, "authorizationURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOAuth2SessionManager authorizationSessionWithAuthorizationURL:responseType:scopes:redirectURI:specifyRedirectURI:completionHandler:](self, "authorizationSessionWithAuthorizationURL:responseType:scopes:redirectURI:specifyRedirectURI:completionHandler:", v14, v13, v12, v11, 1, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)authorizationSessionWithAuthorizationURL:(id)a3 responseType:(id)a4 scopes:(id)a5 redirectURI:(id)a6 specifyRedirectURI:(BOOL)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  WFOAuth2WebAuthorizationSession *v24;
  void *v25;
  WFOAuth2WebAuthorizationSession *v26;
  _BOOL4 v28;

  v28 = a7;
  v13 = a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend((id)objc_opt_class(), "combinedScopeFromScopes:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  v20 = (void *)MEMORY[0x24BDD1838];
  -[WFOAuth2SessionManager clientID](self, "clientID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "queryItemWithName:value:", CFSTR("client_id"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v22);

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("scope"), v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v23);

  }
  v24 = [WFOAuth2WebAuthorizationSession alloc];
  objc_msgSend(v17, "wfo_URLByAppendingQueryItems:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[WFOAuth2WebAuthorizationSession initWithSessionManager:authorizationURL:responseType:redirectURI:specifyRedirectURI:completionHandler:](v24, "initWithSessionManager:authorizationURL:responseType:redirectURI:specifyRedirectURI:completionHandler:", self, v25, v16, v14, v28, v13);
  return v26;
}

- (NSURL)tokenURL
{
  return self->_tokenURL;
}

- (NSURL)authorizationURL
{
  return self->_authorizationURL;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)clientSecret
{
  return self->_clientSecret;
}

- (NSString)authenticationMethod
{
  return self->_authenticationMethod;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_authenticationMethod, 0);
  objc_storeStrong((id *)&self->_clientSecret, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_authorizationURL, 0);
  objc_storeStrong((id *)&self->_tokenURL, 0);
}

void __56__WFOAuth2SessionManager_sendRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v31 = v9;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v31;

    if (!v10)
    {
      v12 = (void *)objc_opt_new();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
      objc_msgSend(v12, "setQuery:", v13);

      objc_msgSend(v12, "queryItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        v25 = v12;
        v26 = a1;
        v15 = (void *)objc_opt_new();
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v24 = v14;
        v16 = v14;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v28 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
              objc_msgSend(v21, "value");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "name");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setValue:forKey:", v22, v23);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          }
          while (v18);
        }

        v10 = (void *)objc_msgSend(v15, "copy");
        v11 = 0;
        v12 = v25;
        a1 = v26;
        v14 = v24;
      }
      else
      {
        v10 = 0;
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v9 = v11;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __81__WFOAuth2SessionManager_authenticateWithRequest_refreshToken_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  WFOAuth2Credential *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v6 = a4;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("refresh_token"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (*(_QWORD *)(a1 + 32))
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v10 = (void *)objc_msgSend(v15, "mutableCopy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("refresh_token"));
    v11 = objc_msgSend(v10, "copy");

    v15 = (id)v11;
  }
  v12 = -[WFOAuth2Credential initWithResponseObject:]([WFOAuth2Credential alloc], "initWithResponseObject:", v15);
  v13 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, WFOAuth2Credential *, id))(v13 + 16))(v13, v12, v6);
  }
  else
  {
    WFRFC6749Section5_2ErrorFromResponse(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, WFOAuth2Credential *, void *))(v13 + 16))(v13, v12, v14);

  }
}

+ (id)combinedScopeFromScopes:(id)a3
{
  return (id)objc_msgSend(a3, "componentsJoinedByString:", CFSTR(" "));
}

@end
