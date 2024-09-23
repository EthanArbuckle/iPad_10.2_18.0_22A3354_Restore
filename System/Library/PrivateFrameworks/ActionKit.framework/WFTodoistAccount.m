@implementation WFTodoistAccount

+ (id)serviceID
{
  return CFSTR("is.workflow.my.app.todoist");
}

+ (id)sessionManager
{
  WFTodoistOAuth2SessionManager *v3;
  void *v4;
  void *v5;
  WFTodoistOAuth2SessionManager *v6;

  v3 = [WFTodoistOAuth2SessionManager alloc];
  objc_msgSend(a1, "clientID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clientSecret");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFTodoistOAuth2SessionManager initWithClientID:clientSecret:](v3, "initWithClientID:clientSecret:", v4, v5);

  return v6;
}

+ (id)clientID
{
  return CFSTR("0283303307f94fe6bb1f199b9916a3e6");
}

+ (id)clientSecret
{
  return CFSTR("518d615e294341bdb44610392ce592be");
}

+ (id)serviceName
{
  return CFSTR("Todoist");
}

+ (id)localizedServiceName
{
  return WFLocalizedString(CFSTR("Todoist"));
}

+ (id)scopes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("data:read_write");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)redirectURI
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://workflow.is/api/todoist/callback"));
}

@end
