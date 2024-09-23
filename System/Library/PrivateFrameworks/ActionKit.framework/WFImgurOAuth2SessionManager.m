@implementation WFImgurOAuth2SessionManager

- (WFImgurOAuth2SessionManager)initWithClientID:(id)a3 clientSecret:(id)a4
{
  return -[WFImgurOAuth2SessionManager initWithSessionConfiguration:clientID:clientSecret:](self, "initWithSessionConfiguration:clientID:clientSecret:", 0, a3, a4);
}

- (WFImgurOAuth2SessionManager)initWithSessionConfiguration:(id)a3 clientID:(id)a4 clientSecret:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  WFImgurOAuth2SessionManager *v14;

  v8 = (void *)MEMORY[0x24BDBCF48];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "URLWithString:", CFSTR("https://api.imgur.com/oauth2/token"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://api.imgur.com/oauth2/authorize"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFOAuth2SessionManager initWithSessionConfiguration:tokenURL:authorizationURL:authenticationMethod:clientID:clientSecret:](self, "initWithSessionConfiguration:tokenURL:authorizationURL:authenticationMethod:clientID:clientSecret:", v11, v12, v13, CFSTR("client_secret_post"), v10, v9);

  return v14;
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
  -[WFOAuth2SessionManager authorizationSessionWithAuthorizationURL:responseType:scopes:redirectURI:specifyRedirectURI:completionHandler:](self, "authorizationSessionWithAuthorizationURL:responseType:scopes:redirectURI:specifyRedirectURI:completionHandler:", v14, v13, v12, v11, 0, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)sendRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v8[1] = 3221225472;
  v8[2] = __61__WFImgurOAuth2SessionManager_sendRequest_completionHandler___block_invoke;
  v8[3] = &unk_24F8B5AA0;
  v9 = a4;
  v7.receiver = self;
  v7.super_class = (Class)WFImgurOAuth2SessionManager;
  v8[0] = MEMORY[0x24BDAC760];
  v6 = v9;
  -[WFOAuth2SessionManager sendRequest:completionHandler:](&v7, sel_sendRequest_completionHandler_, a3, v8);

}

void __61__WFImgurOAuth2SessionManager_sendRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("error"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v15 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (!v9 && v17)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0FC8];
    v21[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("WFOAuth2ErrorDomain"), -1, v19);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
