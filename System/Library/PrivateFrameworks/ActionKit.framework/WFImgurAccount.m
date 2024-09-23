@implementation WFImgurAccount

- (void)refreshWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFImgurAccount *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __47__WFImgurAccount_refreshWithCompletionHandler___block_invoke;
  v5[3] = &unk_24F8B7158;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFImgurAccount;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFOAuth2Account refreshWithCompletionHandler:](&v4, sel_refreshWithCompletionHandler_, v5);

}

void __47__WFImgurAccount_refreshWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("WFOAuth2ErrorDomain"));

  if (v4)
    +[WFAccount deleteAccount:](WFAccount, "deleteAccount:", *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 40);
  v6 = v7;
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
    v6 = v7;
  }

}

+ (id)serviceID
{
  return CFSTR("is.workflow.my.app.imgur");
}

+ (id)serviceName
{
  return CFSTR("Imgur");
}

+ (id)localizedServiceName
{
  return WFLocalizedString(CFSTR("Imgur"));
}

+ (id)sessionManager
{
  WFImgurOAuth2SessionManager *v3;
  void *v4;
  void *v5;
  WFImgurOAuth2SessionManager *v6;

  v3 = [WFImgurOAuth2SessionManager alloc];
  objc_msgSend(a1, "clientID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clientSecret");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFImgurOAuth2SessionManager initWithClientID:clientSecret:](v3, "initWithClientID:clientSecret:", v4, v5);

  return v6;
}

+ (id)clientID
{
  return CFSTR("520dd4dcbe12c2a");
}

+ (id)clientSecret
{
  return CFSTR("c78e0833cf4acb2e8a0602152526a970921129c0");
}

+ (id)redirectURI
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("workflow://imgur_auth"));
}

+ (id)responseType
{
  __CFString *v2;

  v2 = CFSTR("token");
  return CFSTR("token");
}

@end
