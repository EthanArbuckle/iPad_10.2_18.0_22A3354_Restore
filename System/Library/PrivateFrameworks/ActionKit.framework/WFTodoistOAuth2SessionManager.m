@implementation WFTodoistOAuth2SessionManager

+ (id)combinedScopeFromScopes:(id)a3
{
  return (id)objc_msgSend(a3, "componentsJoinedByString:", CFSTR(","));
}

- (WFTodoistOAuth2SessionManager)initWithClientID:(id)a3 clientSecret:(id)a4
{
  return -[WFTodoistOAuth2SessionManager initWithSessionConfiguration:clientID:clientSecret:](self, "initWithSessionConfiguration:clientID:clientSecret:", 0, a3, a4);
}

- (WFTodoistOAuth2SessionManager)initWithSessionConfiguration:(id)a3 clientID:(id)a4 clientSecret:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  WFTodoistOAuth2SessionManager *v14;

  v8 = (void *)MEMORY[0x24BDBCF48];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "URLWithString:", CFSTR("https://todoist.com/oauth/access_token"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://todoist.com/oauth/authorize"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFOAuth2SessionManager initWithSessionConfiguration:tokenURL:authorizationURL:authenticationMethod:clientID:clientSecret:](self, "initWithSessionConfiguration:tokenURL:authorizationURL:authenticationMethod:clientID:clientSecret:", v11, v12, v13, CFSTR("client_secret_post"), v10, v9);

  return v14;
}

- (void)revokeCredential:(id)a3 completionHandler:(id)a4
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
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTodoistOAuth2SessionManager.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("credential"));

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://todoist.com/api/access_tokens/revoke"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB7458], "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setNonAppInitiated:", 1);
  objc_msgSend(v10, "setHTTPMethod:", CFSTR("POST"));
  v11 = (void *)objc_opt_new();
  -[WFOAuth2SessionManager clientID](self, "clientID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("client_id"));

  objc_msgSend(v7, "accessToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("access_token"));

  -[WFOAuth2SessionManager clientSecret](self, "clientSecret");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[WFOAuth2SessionManager clientSecret](self, "clientSecret");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("client_secret"));

  }
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v11, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHTTPBody:", v16);

  objc_msgSend(v10, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Typee"));
  -[WFOAuth2SessionManager session](self, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __68__WFTodoistOAuth2SessionManager_revokeCredential_completionHandler___block_invoke;
  v21[3] = &unk_24F8BB3E0;
  v22 = v8;
  v18 = v8;
  objc_msgSend(v17, "dataTaskWithRequest:completionHandler:", v10, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resume");

}

void __68__WFTodoistOAuth2SessionManager_revokeCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v17 = v9;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;

    WFRFC6749Section5_2ErrorFromResponse(v10);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = v11;
    v9 = v14;

  }
  v15 = objc_msgSend(v8, "statusCode");
  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    (*(void (**)(uint64_t, BOOL, id))(v16 + 16))(v16, v15 == 204, v9);

}

@end
