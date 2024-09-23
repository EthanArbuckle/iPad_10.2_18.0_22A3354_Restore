@implementation WFOAuth2WebAuthorizationSession

- (WFOAuth2WebAuthorizationSession)initWithSessionManager:(id)a3 authorizationURL:(id)a4 responseType:(id)a5 redirectURI:(id)a6 specifyRedirectURI:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL4 v9;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  WFOAuth2WebAuthorizationSession *v21;
  WFOAuth2WebAuthorizationSession *v22;
  uint64_t v23;
  NSString *responseType;
  uint64_t v25;
  NSURL *redirectURI;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSString *state;
  void *v32;
  id completionHandler;
  void *v34;
  uint64_t v35;
  NSString *responseKey;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSURL *authorizationURL;
  WFOAuth2WebAuthorizationSession *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  SEL v52;
  objc_super v53;
  _QWORD v54[2];
  _QWORD v55[3];

  v9 = a7;
  v55[2] = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2WebAuthorizationSession.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionManager"));

    if (v17)
    {
LABEL_3:
      if (v18)
        goto LABEL_4;
LABEL_15:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2WebAuthorizationSession.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("responseType"));

      if (v20)
        goto LABEL_5;
      goto LABEL_16;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2WebAuthorizationSession.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authorizationURL"));

  if (!v18)
    goto LABEL_15;
LABEL_4:
  if (v20)
    goto LABEL_5;
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOAuth2WebAuthorizationSession.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_5:
  v53.receiver = self;
  v53.super_class = (Class)WFOAuth2WebAuthorizationSession;
  v21 = -[WFOAuth2WebAuthorizationSession init](&v53, sel_init);
  v22 = v21;
  if (v21)
  {
    v52 = a2;
    objc_storeStrong((id *)&v21->_sessionManager, a3);
    v23 = objc_msgSend(v18, "copy");
    responseType = v22->_responseType;
    v22->_responseType = (NSString *)v23;

    v25 = objc_msgSend(v19, "copy");
    redirectURI = v22->_redirectURI;
    v22->_redirectURI = (NSURL *)v25;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_24F8BBA48);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lowercaseString");
    v30 = objc_claimAutoreleasedReturnValue();
    state = v22->_state;
    v22->_state = (NSString *)v30;

    v32 = _Block_copy(v20);
    completionHandler = v22->_completionHandler;
    v22->_completionHandler = v32;

    v54[0] = CFSTR("code");
    v54[1] = CFSTR("token");
    v55[0] = CFSTR("code");
    v55[1] = CFSTR("access_token");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", v18);
    v35 = objc_claimAutoreleasedReturnValue();
    responseKey = v22->_responseKey;
    v22->_responseKey = (NSString *)v35;

    if (!v22->_responseKey)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", v52, v22, CFSTR("WFOAuth2WebAuthorizationSession.m"), 69, CFSTR("Unknown response type \"%@\"), v18);

    }
    v37 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("response_type"), v18);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v38);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("state"), v22->_state);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v39);

    if (v19 && v9)
    {
      v40 = (void *)MEMORY[0x24BDD1838];
      objc_msgSend(v19, "absoluteString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "queryItemWithName:value:", CFSTR("redirect_uri"), v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addObject:", v42);

    }
    objc_msgSend(v17, "wfo_URLByAppendingQueryItems:", v37);
    v43 = objc_claimAutoreleasedReturnValue();
    authorizationURL = v22->_authorizationURL;
    v22->_authorizationURL = (NSURL *)v43;

    v45 = v22;
  }

  return v22;
}

- (id)authenticationSessionWithPresentationAnchor:(id)a3
{
  id v4;
  ASWebAuthenticationSession *authenticationSession;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  WFWebAuthenticationSessionPresentationContext *v15;
  void *v16;
  void *v17;
  ASWebAuthenticationSession *v18;
  _QWORD aBlock[4];
  id v21;
  id location;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  authenticationSession = self->_authenticationSession;
  if (!authenticationSession)
  {
    objc_initWeak(&location, self);
    v6 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__WFOAuth2WebAuthorizationSession_authenticationSessionWithPresentationAnchor___block_invoke;
    aBlock[3] = &unk_24F8B9750;
    objc_copyWeak(&v21, &location);
    v7 = _Block_copy(aBlock);
    -[WFOAuth2WebAuthorizationSession redirectURI](self, "redirectURI");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scheme");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[__CFString caseInsensitiveCompare:](v9, "caseInsensitiveCompare:", CFSTR("http"))
      || !-[__CFString caseInsensitiveCompare:](v9, "caseInsensitiveCompare:", CFSTR("https")))
    {

      v9 = CFSTR("workflow");
    }
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v10 = (void *)getASWebAuthenticationSessionClass_softClass;
    v27 = getASWebAuthenticationSessionClass_softClass;
    if (!getASWebAuthenticationSessionClass_softClass)
    {
      v23[0] = v6;
      v23[1] = 3221225472;
      v23[2] = __getASWebAuthenticationSessionClass_block_invoke;
      v23[3] = &unk_24F8BB430;
      v23[4] = &v24;
      __getASWebAuthenticationSessionClass_block_invoke((uint64_t)v23);
      v10 = (void *)v25[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v24, 8);
    v12 = [v11 alloc];
    -[WFOAuth2WebAuthorizationSession authorizationURL](self, "authorizationURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithURL:callbackURLScheme:completionHandler:", v13, v9, v7);
    -[WFOAuth2WebAuthorizationSession setAuthenticationSession:](self, "setAuthenticationSession:", v14);

    v15 = -[WFWebAuthenticationSessionPresentationContext initWithPresentationAnchor:]([WFWebAuthenticationSessionPresentationContext alloc], "initWithPresentationAnchor:", v4);
    -[WFOAuth2WebAuthorizationSession setPresentationContext:](self, "setPresentationContext:", v15);

    -[WFOAuth2WebAuthorizationSession presentationContext](self, "presentationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOAuth2WebAuthorizationSession authenticationSession](self, "authenticationSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPresentationContextProvider:", v16);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    authenticationSession = self->_authenticationSession;
  }
  v18 = authenticationSession;

  return v18;
}

- (BOOL)resumeSessionWithResponseObject:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  WFOAuth2Credential *v26;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFOAuth2WebAuthorizationSession completionHandler](self, "completionHandler");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[WFOAuth2WebAuthorizationSession setCompletionHandler:](self, "setCompletionHandler:", 0);
  if (v5)
  {
    -[ASWebAuthenticationSession cancel](self->_authenticationSession, "cancel");
    WFRFC6749Section5_2ErrorFromResponse(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v6);
LABEL_18:

      goto LABEL_19;
    }
    -[WFOAuth2WebAuthorizationSession state](self, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length")
      && (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", v7),
          v8,
          (v9 & 1) == 0))
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BDD0FC8];
      v34[0] = CFSTR("The state parameter on the received callback was invalid.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("WFOAuth2ErrorDomain"), 200, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v11);
    }
    else
    {
      -[WFOAuth2WebAuthorizationSession responseKey](self, "responseKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length"))
      {
        -[WFOAuth2WebAuthorizationSession responseType](self, "responseType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("code")))
        {
          -[WFOAuth2WebAuthorizationSession sessionManager](self, "sessionManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFOAuth2WebAuthorizationSession redirectURI](self, "redirectURI");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "authenticateWithCode:redirectURI:completionHandler:", v11, v14, v5);
        }
        else
        {
          if (!objc_msgSend(v12, "isEqualToString:", CFSTR("token")))
          {
LABEL_16:

            goto LABEL_17;
          }
          v28 = v12;
          WFRFC6749Section5_2ErrorFromResponse(v4);
          v29 = objc_claimAutoreleasedReturnValue();
          v14 = v4;
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("expires_in"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "invertedSet");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v20;
          v23 = objc_msgSend(v20, "rangeOfCharacterFromSet:", v22);

          if (v23 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v24 = (void *)objc_msgSend(v14, "mutableCopy");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v30, "longLongValue"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("expires_in"));

            v14 = v24;
          }
          v26 = -[WFOAuth2Credential initWithResponseObject:]([WFOAuth2Credential alloc], "initWithResponseObject:", v14);
          v13 = (void *)v29;
          ((void (**)(_QWORD, WFOAuth2Credential *, uint64_t))v5)[2](v5, v26, v29);

          v12 = v28;
        }

        goto LABEL_16;
      }
      v16 = (void *)MEMORY[0x24BDD1540];
      v31 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The \"%@\" parameter on the received callback was missing."), v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("WFOAuth2ErrorDomain"), 200, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v19);

    }
LABEL_17:

    goto LABEL_18;
  }
LABEL_19:

  return v5 != 0;
}

- (BOOL)resumeSessionWithURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  id v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v4, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setValue:forKey:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "fragment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invertedSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "rangeOfCharacterFromSet:", v16);

  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v38 = v3;
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setPercentEncodedQuery:", v14);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v18, "queryItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v41 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          objc_msgSend(v24, "value", v38);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setValue:forKey:", v25, v26);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v21);
    }

    v3 = v38;
  }
  -[WFOAuth2WebAuthorizationSession redirectURI](self, "redirectURI", v38);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v27)
  {
    -[WFOAuth2WebAuthorizationSession responseKey](self, "responseKey");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33
      && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("state")),
          (v34 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("error"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      if (!v36)
        goto LABEL_26;
    }
LABEL_30:
    v35 = -[WFOAuth2WebAuthorizationSession resumeSessionWithResponseObject:](self, "resumeSessionWithResponseObject:", v5);
    goto LABEL_31;
  }
  objc_msgSend(v27, "host");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "isEqualToString:", CFSTR("workflow.is")))
  {
    objc_msgSend(v3, "scheme");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("workflow"));

  }
  else
  {
    v31 = 0;
  }

  if ((objc_msgSend(v3, "wfo_isEqualToRedirectURI:", v28) & 1) != 0 || (v31 & 1) != 0)
    goto LABEL_30;
LABEL_26:
  v35 = 0;
LABEL_31:

  return v35;
}

- (NSURL)authorizationURL
{
  return self->_authorizationURL;
}

- (NSURL)redirectURI
{
  return self->_redirectURI;
}

- (WFOAuth2SessionManager)sessionManager
{
  return self->_sessionManager;
}

- (NSString)responseType
{
  return self->_responseType;
}

- (NSString)state
{
  return self->_state;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ASWebAuthenticationSession)authenticationSession
{
  return self->_authenticationSession;
}

- (void)setAuthenticationSession:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationSession, a3);
}

- (WFWebAuthenticationSessionPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_presentationContext, a3);
}

- (NSString)responseKey
{
  return self->_responseKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseKey, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_authenticationSession, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_responseType, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_redirectURI, 0);
  objc_storeStrong((id *)&self->_authorizationURL, 0);
}

void __79__WFOAuth2WebAuthorizationSession_authenticationSessionWithPresentationAnchor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (!v9 || v5)
  {
    objc_msgSend(WeakRetained, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompletionHandler:", 0);
    if (v8)
      ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v5);

  }
  else
  {
    objc_msgSend(WeakRetained, "resumeSessionWithURL:", v9);
  }

}

@end
