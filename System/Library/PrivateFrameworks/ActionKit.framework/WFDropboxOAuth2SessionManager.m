@implementation WFDropboxOAuth2SessionManager

- (id)authorizationSessionWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = (void *)MEMORY[0x24BDBCF48];
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  -[WFOAuth2SessionManager clientID](self, "clientID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("db-%@://2/token"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)WFDropboxOAuth2SessionManager;
  -[WFOAuth2SessionManager authorizationSessionWithResponseType:scopes:redirectURI:completionHandler:](&v12, sel_authorizationSessionWithResponseType_scopes_redirectURI_completionHandler_, CFSTR("token"), 0, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)appAuthorizationSessionWithCompletionHandler:(id)a3
{
  id v4;
  WFDropboxAppAuthorizationSession *v5;
  void *v6;
  WFDropboxAppAuthorizationSession *v7;

  v4 = a3;
  v5 = [WFDropboxAppAuthorizationSession alloc];
  -[WFOAuth2SessionManager clientID](self, "clientID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFDropboxAppAuthorizationSession initWithClientID:completionHandler:](v5, "initWithClientID:completionHandler:", v6, v4);

  return v7;
}

- (void)authenticateWithLegacyAccessToken:(id)a3 accessTokenSecret:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  WFDropboxOAuth2SessionManager *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _QWORD v56[4];

  v56[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDropboxOAuth2SessionManager.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessToken"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDropboxOAuth2SessionManager.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessTokenSecret"));

LABEL_3:
  v48 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDropboxOAuth2SessionManager.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://api.dropboxapi.com/1/oauth2/token_from_oauth1"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB7458], "requestWithURL:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setNonAppInitiated:", 1);
  v45 = v12;
  objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
  -[WFOAuth2SessionManager clientSecret](self, "clientSecret");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v13;
  v56[1] = v10;
  v49 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR("&"));
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("oauth_version"), CFSTR("1.0"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

  v18 = (void *)MEMORY[0x24BDD1838];
  v47 = self;
  -[WFOAuth2SessionManager clientID](self, "clientID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "queryItemWithName:value:", CFSTR("oauth_consumer_key"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v20);

  v50 = v9;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("oauth_token"), v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v21);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("oauth_signature_method"), CFSTR("PLAINTEXT"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v22);

  v44 = (void *)v15;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("oauth_signature"), v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v23);

  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");

  objc_msgSend(v25, "addCharactersInString:", CFSTR("-_.~"));
  v26 = (void *)objc_opt_new();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v27 = v16;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v52 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v32, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringByAddingPercentEncodingWithAllowedCharacters:", v25);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "value");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringByAddingPercentEncodingWithAllowedCharacters:", v25);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"), v34, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v37);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v29);
  }

  v38 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v26, "componentsJoinedByString:", CFSTR(","));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("OAuth %@"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "setValue:forHTTPHeaderField:", v40, CFSTR("Authorization"));
  -[WFOAuth2SessionManager authenticateWithRequest:refreshToken:completionHandler:](v47, "authenticateWithRequest:refreshToken:completionHandler:", v45, 0, v48);

}

- (WFDropboxOAuth2SessionManager)initWithClientID:(id)a3 clientSecret:(id)a4
{
  return -[WFDropboxOAuth2SessionManager initWithSessionConfiguration:clientID:clientSecret:](self, "initWithSessionConfiguration:clientID:clientSecret:", 0, a3, a4);
}

- (WFDropboxOAuth2SessionManager)initWithSessionConfiguration:(id)a3 clientID:(id)a4 clientSecret:(id)a5
{
  void *v8;
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
  void *v19;
  WFDropboxOAuth2SessionManager *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDBCF48];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "URLWithString:", CFSTR("https://www.dropbox.com/1/oauth2/authorize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("disable_signup"), CFSTR("true"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("locale"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://api.dropboxapi.com/1/oauth2/token"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wfo_URLByAppendingQueryItems:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[WFOAuth2SessionManager initWithSessionConfiguration:tokenURL:authorizationURL:authenticationMethod:clientID:clientSecret:](self, "initWithSessionConfiguration:tokenURL:authorizationURL:authenticationMethod:clientID:clientSecret:", v11, v18, v19, CFSTR("client_secret_post"), v10, v9);

  return v20;
}

- (void)revokeCredential:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDropboxOAuth2SessionManager.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("credential"));

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://api.dropboxapi.com/1/disable_access_token"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB7458], "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setNonAppInitiated:", 1);
  objc_msgSend(v10, "wfo_setAuthorizationWithCredential:", v7);
  -[WFOAuth2SessionManager session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__WFDropboxOAuth2SessionManager_revokeCredential_completionHandler___block_invoke;
  v15[3] = &unk_24F8BB3E0;
  v16 = v8;
  v12 = v8;
  objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v10, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");

}

void __68__WFDropboxOAuth2SessionManager_revokeCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v7 = a2;
  v8 = a4;
  v9 = objc_msgSend(a3, "statusCode");
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 200, 100);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsIndex:", v9);

  if (objc_msgSend(v7, "length"))
  {
    v18 = v8;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;

    v11 = objc_msgSend(v12, "count") == 0;
    WFRFC6749Section5_2ErrorFromResponse(v12);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = v13;
    v8 = v16;

  }
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    (*(void (**)(uint64_t, uint64_t, id))(v17 + 16))(v17, v11, v8);

}

@end
