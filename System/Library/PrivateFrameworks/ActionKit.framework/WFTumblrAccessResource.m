@implementation WFTumblrAccessResource

+ (NSString)tumblrOAuthToken
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFTumblrOAuthToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (void)setTumblrOAuthToken:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("WFTumblrOAuthToken"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("WFTumblrOAuthToken"));

}

+ (NSString)tumblrOAuthTokenSecret
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "tumblrOAuthToken");
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

+ (id)keychain
{
  void *v2;
  WFKeychain *v3;
  WFKeychain *v4;

  objc_msgSend(CFSTR("is.workflow.my.app.tumblr.%@"), "stringByAppendingString:", CFSTR("secret"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [WFKeychain alloc];
  v4 = -[WFKeychain initWithService:accessGroup:](v3, "initWithService:accessGroup:", v2, *MEMORY[0x24BE19960]);

  return v4;
}

+ (void)setTumblrOAuthTokenSecret:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "tumblrOAuthToken");
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
  return &unk_255DFD9B0;
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
  v5[0] = CFSTR("WFTumblrAccessResourceUserInterface");
  v5[1] = CFSTR("WFTumblrAccessResourceUserInterface");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.tumblr.tumblr");
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("your Tumblr account"), CFSTR("your Tumblr account"));
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

  objc_msgSend((id)objc_opt_class(), "tumblrOAuthToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "tumblrOAuthTokenSecret");
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
  v8[2] = __77__WFTumblrAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke;
  v8[3] = &unk_24F8B8FC0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "authorizeWithCompletionHandler:", v8);

}

- (id)resourceName
{
  return CFSTR("Tumblr");
}

- (id)username
{
  return 0;
}

- (BOOL)canLogOut
{
  return 1;
}

- (void)logOut
{
  objc_msgSend((id)objc_opt_class(), "setTumblrOAuthTokenSecret:", 0);
  objc_msgSend((id)objc_opt_class(), "setTumblrOAuthToken:", 0);
  -[WFResource refreshAvailabilityWithNotification](self, "refreshAvailabilityWithNotification");
}

- (NSString)OAuthToken
{
  return self->_OAuthToken;
}

- (void)setOAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)OAuthTokenSecret
{
  return self->_OAuthTokenSecret;
}

- (void)setOAuthTokenSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OAuthTokenSecret, 0);
  objc_storeStrong((id *)&self->_OAuthToken, 0);
}

void __77__WFTumblrAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "refreshAvailabilityWithForcedNotification");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
