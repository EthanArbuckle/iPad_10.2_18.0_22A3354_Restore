@implementation WFInstapaperAccessResource

+ (void)initialize
{
  if (initialize_onceToken_34785 != -1)
    dispatch_once(&initialize_onceToken_34785, &__block_literal_global_34786);
}

+ (NSString)instapaperUsername
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFInstapaperUsername"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (void)setInstapaperUsername:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a3;
  objc_msgSend(v3, "workflowUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("WFInstapaperUsername"));

}

+ (NSString)instapaperToken
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFInstapaperToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (void)setInstapaperToken:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a3;
  objc_msgSend(v3, "workflowUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("WFInstapaperToken"));

}

+ (id)keychain
{
  WFKeychain *v2;

  v2 = [WFKeychain alloc];
  return -[WFKeychain initWithService:accessGroup:](v2, "initWithService:accessGroup:", CFSTR("is.workflow.my.app.instapaper.%@tokenSecret"), *MEMORY[0x24BE19960]);
}

+ (NSString)instapaperTokenSecret
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "instapaperToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "keychain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

+ (void)setInstapaperTokenSecret:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "instapaperToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "keychain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setData:forKey:", v5, v4);

  }
}

+ (id)userInterfaceProtocol
{
  return &unk_255DFD468;
}

+ (id)userInterfaceClasses
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE19938];
  v4[0] = *MEMORY[0x24BE19950];
  v4[1] = v2;
  v5[0] = CFSTR("WFInstapaperAccessResourceUserInterface");
  v5[1] = CFSTR("WFInstapaperAccessResourceUserInterface");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __40__WFInstapaperAccessResource_initialize__block_invoke()
{
  return +[IKEngine setOAuthConsumerKey:andConsumerSecret:](IKEngine, "setOAuthConsumerKey:andConsumerSecret:", CFSTR("682e860c444040369c400e6ebdc9ec50"), CFSTR("ad023926d2fd402c8186da34500e943b"));
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.marcoarment.instapaperpro");
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("your Instapaper account"), CFSTR("your Instapaper account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)status
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "instapaperToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "instapaperTokenSecret");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      v4 = 4;
    else
      v4 = 1;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__WFInstapaperAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke;
  v8[3] = &unk_24F8B8FC0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "authorizeWithCompletionHandler:", v8);

}

- (id)resourceName
{
  return WFLocalizedString(CFSTR("Instapaper"));
}

- (id)username
{
  return (id)objc_msgSend((id)objc_opt_class(), "instapaperUsername");
}

- (BOOL)canLogOut
{
  return 1;
}

- (void)logOut
{
  objc_msgSend((id)objc_opt_class(), "setInstapaperTokenSecret:", 0);
  objc_msgSend((id)objc_opt_class(), "setInstapaperUsername:", 0);
  objc_msgSend((id)objc_opt_class(), "setInstapaperToken:", 0);
  -[WFResource refreshAvailabilityWithNotification](self, "refreshAvailabilityWithNotification");
}

void __81__WFInstapaperAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "refreshAvailabilityWithForcedNotification");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
