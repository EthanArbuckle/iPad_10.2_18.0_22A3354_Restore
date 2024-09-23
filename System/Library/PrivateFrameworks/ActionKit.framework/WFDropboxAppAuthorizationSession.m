@implementation WFDropboxAppAuthorizationSession

- (WFDropboxAppAuthorizationSession)initWithClientID:(id)a3 completionHandler:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFDropboxAppAuthorizationSession *v11;
  WFDropboxAppAuthorizationSession *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *state;
  void *v19;
  void *v20;
  uint64_t v21;
  NSURL *successURI;
  void *v23;
  void *v24;
  uint64_t v25;
  NSURL *cancelURI;
  void *v27;
  id completionHandler;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSArray *authorizationURLs;
  WFDropboxAppAuthorizationSession *v41;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  _QWORD v52[5];

  v52[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDropboxAppAuthorizationSession.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientID"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDropboxAppAuthorizationSession.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  v50.receiver = self;
  v50.super_class = (Class)WFDropboxAppAuthorizationSession;
  v11 = -[WFDropboxAppAuthorizationSession init](&v50, sel_init);
  v12 = v11;
  if (v11)
  {
    v45 = v8;
    objc_storeStrong((id *)&v11->_clientID, a3);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_24F8BBA48);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("oauth2:"), "stringByAppendingString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    state = v12->_state;
    v12->_state = (NSString *)v17;

    v19 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("db-%@://1/connect"), v12->_clientID);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URLWithString:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    successURI = v12->_successURI;
    v12->_successURI = (NSURL *)v21;

    v23 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("db-%@://1/cancel"), v12->_clientID);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLWithString:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    cancelURI = v12->_cancelURI;
    v12->_cancelURI = (NSURL *)v25;

    v27 = _Block_copy(v10);
    completionHandler = v12->_completionHandler;
    v12->_completionHandler = v27;

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("k"), v12->_clientID);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v29;
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("s"), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v30;
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("state"), v12->_state);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)objc_opt_new();
    objc_msgSend(v33, "setHost:", CFSTR("1"));
    objc_msgSend(v33, "setPath:", CFSTR("/connect"));
    objc_msgSend(v33, "setQueryItems:", v32);
    v34 = (NSArray *)objc_opt_new();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v35 = objc_msgSend(&unk_24F93C240, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v47;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v47 != v37)
            objc_enumerationMutation(&unk_24F93C240);
          objc_msgSend(v33, "setScheme:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v38));
          objc_msgSend(v33, "URL");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v34, "addObject:", v39);

          ++v38;
        }
        while (v36 != v38);
        v36 = objc_msgSend(&unk_24F93C240, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v36);
    }
    authorizationURLs = v12->_authorizationURLs;
    v12->_authorizationURLs = v34;

    v41 = v12;
    v8 = v45;
  }

  return v12;
}

- (BOOL)resumeSessionWithURL:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  WFOAuth2Credential *v22;
  void *v23;
  WFOAuth2Credential *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  const __CFString *v43;
  const __CFString *v44;
  void *v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  const __CFString *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFDropboxAppAuthorizationSession completionHandler](self, "completionHandler");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_16;
  -[WFDropboxAppAuthorizationSession successURI](self, "successURI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "wfo_isEqualToRedirectURI:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v37 = v8;
    objc_msgSend(v8, "queryItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v15, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setValue:forKey:", v16, v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v12);
    }

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("state"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDropboxAppAuthorizationSession state](self, "state");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqualToString:", v19);

    if ((v20 & 1) == 0)
    {
      v30 = (void *)MEMORY[0x24BDD1540];
      v48 = *MEMORY[0x24BDD0FC8];
      v49 = CFSTR("The state parameter on the received callback was invalid.");
      v29 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("WFOAuth2ErrorDomain"), 200, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v32);

      goto LABEL_19;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("oauth_token_secret"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v21, "length"))
    {
      v33 = (void *)MEMORY[0x24BDD1540];
      v46 = *MEMORY[0x24BDD0FC8];
      v47 = CFSTR("The \"oauth_token_secret\" parameter on the received callback was missing.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("WFOAuth2ErrorDomain"), 200, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v35);

      v29 = 1;
      goto LABEL_19;
    }
    v22 = [WFOAuth2Credential alloc];
    v44 = CFSTR("access_token");
    v45 = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[WFOAuth2Credential initWithResponseObject:](v22, "initWithResponseObject:", v23);
    ((void (**)(_QWORD, WFOAuth2Credential *, _QWORD))v5)[2](v5, v24, 0);

    v25 = v37;
    goto LABEL_15;
  }
  -[WFDropboxAppAuthorizationSession cancelURI](self, "cancelURI");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v4, "wfo_isEqualToRedirectURI:", v26);

  if (!v27)
  {
LABEL_16:
    v29 = 0;
    goto LABEL_19;
  }
  v28 = (void *)MEMORY[0x24BDD1540];
  v42 = *MEMORY[0x24BDD0FC8];
  v43 = CFSTR("The user cancelled the request.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("WFOAuth2ErrorDomain"), 106, v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v9);
LABEL_15:

  -[WFDropboxAppAuthorizationSession setCompletionHandler:](self, "setCompletionHandler:", 0);
  v29 = 1;
LABEL_19:

  return v29;
}

- (NSArray)authorizationURLs
{
  return self->_authorizationURLs;
}

- (NSURL)successURI
{
  return self->_successURI;
}

- (NSURL)cancelURI
{
  return self->_cancelURI;
}

- (NSString)clientID
{
  return self->_clientID;
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_cancelURI, 0);
  objc_storeStrong((id *)&self->_successURI, 0);
  objc_storeStrong((id *)&self->_authorizationURLs, 0);
}

@end
