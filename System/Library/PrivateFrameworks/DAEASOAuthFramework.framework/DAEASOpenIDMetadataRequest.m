@implementation DAEASOpenIDMetadataRequest

+ (id)openIDrequestURLFor:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x24BDD1808];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  v6 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v6, "setScheme:", CFSTR("https"));
  objc_msgSend(v5, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHost:", v7);

  objc_msgSend(v6, "setPath:", CFSTR("/common/v2.0/.well-known/openid-configuration"));
  v8 = (void *)MEMORY[0x24BDD1840];
  objc_msgSend(v6, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
