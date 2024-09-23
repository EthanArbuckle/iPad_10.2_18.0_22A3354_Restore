@implementation WFDropboxAccount

+ (id)serviceID
{
  return CFSTR("is.workflow.my.app.dropbox");
}

+ (id)sessionManager
{
  WFDropboxOAuth2SessionManager *v3;
  void *v4;
  void *v5;
  WFDropboxOAuth2SessionManager *v6;

  v3 = [WFDropboxOAuth2SessionManager alloc];
  objc_msgSend(a1, "clientID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clientSecret");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFDropboxOAuth2SessionManager initWithClientID:clientSecret:](v3, "initWithClientID:clientSecret:", v4, v5);

  return v6;
}

+ (id)serviceName
{
  return CFSTR("Dropbox");
}

+ (id)localizedServiceName
{
  return WFLocalizedString(CFSTR("Dropbox"));
}

+ (id)clientID
{
  return CFSTR("i0cvbg4s5rzbeys");
}

+ (id)clientSecret
{
  return CFSTR("1cht7oafrslos09");
}

+ (id)redirectURI
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDBCF48];
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "clientID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("db-%@://2/token"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)responseType
{
  __CFString *v2;

  v2 = CFSTR("token");
  return CFSTR("token");
}

@end
