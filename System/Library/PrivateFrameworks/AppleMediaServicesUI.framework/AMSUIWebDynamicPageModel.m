@implementation AMSUIWebDynamicPageModel

- (AMSUIWebDynamicPageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebDynamicPageModel *v8;
  void *v9;
  uint64_t v10;
  ACAccount *account;
  uint64_t v12;
  NSString *backgroundColor;
  uint64_t v14;
  AMSMetricsEvent *impressionEvent;
  uint64_t v16;
  AMSUIWebNavigationBarModel *navigationBar;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  NSDictionary *v21;
  NSDictionary *clientOptions;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  uint64_t v34;
  NSURL *URL;
  objc_super v37;

  v6 = a3;
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)AMSUIWebDynamicPageModel;
  v8 = -[AMSUIWebDynamicPageModel init](&v37, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iTunesAccountFromJSAccount:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    account = v8->_account;
    v8->_account = (ACAccount *)v10;

    +[AMSUIWebModel backgroundColorFromPageModel:](AMSUIWebModel, "backgroundColorFromPageModel:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = (NSString *)v12;

    +[AMSUIWebModel impressionEventFromPageModel:context:](AMSUIWebModel, "impressionEventFromPageModel:context:", v6, v7);
    v14 = objc_claimAutoreleasedReturnValue();
    impressionEvent = v8->_impressionEvent;
    v8->_impressionEvent = (AMSMetricsEvent *)v14;

    +[AMSUIWebModel navigationBarFromPageModel:context:](AMSUIWebModel, "navigationBarFromPageModel:context:", v6, v7);
    v16 = objc_claimAutoreleasedReturnValue();
    navigationBar = v8->_navigationBar;
    v8->_navigationBar = (AMSUIWebNavigationBarModel *)v16;

    +[AMSUIWebModel windowSizeFromPageModel:](AMSUIWebModel, "windowSizeFromPageModel:", v6);
    v8->_windowSize.width = v18;
    v8->_windowSize.height = v19;
    objc_storeStrong((id *)&v8->_context, a4);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientOptions"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    clientOptions = v8->_clientOptions;
    v8->_clientOptions = v21;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("metricsOverlay"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    v25 = (void *)MEMORY[0x24BDBD1B8];
    if (v24)
      v25 = v24;
    v26 = v25;

    objc_msgSend(v7, "metricsOverlay");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = (void *)objc_msgSend(v26, "mutableCopy");
      objc_msgSend(v7, "metricsOverlay");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addEntriesFromDictionary:", v29);

      v26 = v28;
    }
    objc_storeStrong((id *)&v8->_metricsOverlay, v26);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;

    v32 = &stru_24CB5A078;
    if (v31)
      v32 = v31;
    v33 = v32;

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v33);
    v34 = objc_claimAutoreleasedReturnValue();

    URL = v8->_URL;
    v8->_URL = (NSURL *)v34;

  }
  return v8;
}

- (id)createViewControllerForContainer:(id)a3
{
  AMSUIWebDynamicViewController *v4;
  void *v5;
  void *v6;
  AMSUIWebDynamicViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = [AMSUIWebDynamicViewController alloc];
  -[AMSUIWebDynamicPageModel context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebDynamicPageModel URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSUIWebDynamicViewController initWithContext:URL:](v4, "initWithContext:URL:", v5, v6);

  -[AMSUIWebDynamicPageModel account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIDynamicViewController setAccount:](v7, "setAccount:", v8);

  -[AMSUIWebDynamicPageModel context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIDynamicViewController setClientInfo:](v7, "setClientInfo:", v10);

  -[AMSUIWebDynamicPageModel clientOptions](self, "clientOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIDynamicViewController setClientOptions:](v7, "setClientOptions:", v11);

  -[AMSUIWebDynamicPageModel metricsOverlay](self, "metricsOverlay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIDynamicViewController setMetricsOverlay:](v7, "setMetricsOverlay:", v12);

  -[AMSUIDynamicViewController setDelegate:](v7, "setDelegate:", v7);
  return v7;
}

- (BOOL)disableReappearPlaceholder
{
  return 1;
}

- (id)loadPage
{
  return (id)objc_msgSend(MEMORY[0x24BE08078], "promiseWithSuccess");
}

- (NSString)description
{
  _BOOL4 v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];
  _QWORD v26[4];
  CGSize v27;

  v26[3] = *MEMORY[0x24BDAC8D0];
  v25[0] = CFSTR("disableReappearPlaceholder");
  v3 = -[AMSUIWebDynamicPageModel disableReappearPlaceholder](self, "disableReappearPlaceholder");
  v4 = CFSTR("false");
  if (v3)
    v4 = CFSTR("true");
  v26[0] = v4;
  v25[1] = CFSTR("URL");
  -[AMSUIWebDynamicPageModel URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v6;
  v25[2] = CFSTR("windowSize");
  -[AMSUIWebDynamicPageModel windowSize](self, "windowSize");
  NSStringFromCGSize(v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[AMSUIWebDynamicPageModel account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSUIWebDynamicPageModel account](self, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "username");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("account"));

  }
  -[AMSUIWebDynamicPageModel backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[AMSUIWebDynamicPageModel backgroundColor](self, "backgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("backgroundColor"));

  }
  -[AMSUIWebDynamicPageModel clientOptions](self, "clientOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[AMSUIWebDynamicPageModel clientOptions](self, "clientOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v16, CFSTR("clientOptions"));

  }
  -[AMSUIWebDynamicPageModel impressionEvent](self, "impressionEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[AMSUIWebDynamicPageModel impressionEvent](self, "impressionEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v18, CFSTR("impressionEvent"));

  }
  -[AMSUIWebDynamicPageModel metricsOverlay](self, "metricsOverlay");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[AMSUIWebDynamicPageModel metricsOverlay](self, "metricsOverlay");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v20, CFSTR("metricsOverlay"));

  }
  -[AMSUIWebDynamicPageModel navigationBar](self, "navigationBar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[AMSUIWebDynamicPageModel navigationBar](self, "navigationBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v22, CFSTR("navigationBar"));

  }
  objc_msgSend(v9, "description");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v23;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (AMSMetricsEvent)impressionEvent
{
  return self->_impressionEvent;
}

- (AMSUIWebNavigationBarModel)navigationBar
{
  return self->_navigationBar;
}

- (CGSize)windowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_windowSize.width;
  height = self->_windowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSDictionary)clientOptions
{
  return self->_clientOptions;
}

- (void)setClientOptions:(id)a3
{
  objc_storeStrong((id *)&self->_clientOptions, a3);
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_metricsOverlay, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_clientOptions, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
