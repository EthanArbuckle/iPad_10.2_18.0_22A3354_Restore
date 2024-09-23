@implementation AMSUIWebRoutePageModel

- (AMSUIWebRoutePageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebRoutePageModel *v8;
  AMSUIWebRoutePageModel *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  NSURL *URL;
  void *v16;
  NSDictionary *v17;
  NSDictionary *clientOptions;
  void *v19;
  NSDictionary *v20;
  NSDictionary *headers;
  void *v22;
  void *v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)AMSUIWebRoutePageModel;
  v8 = -[AMSUIWebRoutePageModel init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v7);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    v12 = &stru_24CB5A078;
    if (v11)
      v12 = v11;
    v13 = v12;

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    URL = v9->_URL;
    v9->_URL = (NSURL *)v14;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientOptions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    clientOptions = v9->_clientOptions;
    v9->_clientOptions = v17;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("headers"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;

    headers = v9->_headers;
    v9->_headers = v20;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("loadUsingWebKit"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("loadUsingWebKit"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_loadUsingWebKit = objc_msgSend(v23, "BOOLValue");

    }
    else
    {
      v9->_loadUsingWebKit = 0;
    }

  }
  return v9;
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
  _QWORD v20[3];
  _QWORD v21[4];
  CGSize v22;

  v21[3] = *MEMORY[0x24BDAC8D0];
  v20[0] = CFSTR("disableReappearPlaceholder");
  v3 = -[AMSUIWebRoutePageModel disableReappearPlaceholder](self, "disableReappearPlaceholder");
  v4 = CFSTR("false");
  if (v3)
    v4 = CFSTR("true");
  v21[0] = v4;
  v20[1] = CFSTR("URL");
  -[AMSUIWebRoutePageModel URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v6;
  v20[2] = CFSTR("windowSize");
  -[AMSUIWebRoutePageModel windowSize](self, "windowSize");
  NSStringFromCGSize(v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[AMSUIWebRoutePageModel backgroundColor](self, "backgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSUIWebRoutePageModel backgroundColor](self, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("backgroundColor"));

  }
  -[AMSUIWebRoutePageModel clientOptions](self, "clientOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AMSUIWebRoutePageModel clientOptions](self, "clientOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("clientOptions"));

  }
  -[AMSUIWebRoutePageModel impressionEvent](self, "impressionEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AMSUIWebRoutePageModel impressionEvent](self, "impressionEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v15, CFSTR("impressionEvent"));

  }
  -[AMSUIWebRoutePageModel navigationBar](self, "navigationBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AMSUIWebRoutePageModel navigationBar](self, "navigationBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v17, CFSTR("navigationBar"));

  }
  objc_msgSend(v9, "description");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (BOOL)disableReappearPlaceholder
{
  return 1;
}

- (id)loadPage
{
  return (id)objc_msgSend(MEMORY[0x24BE08078], "promiseWithSuccess");
}

- (id)_webPageViewController
{
  void *v3;
  AMSUIWebWrapperViewController *v4;
  id v5;
  AMSUIWebWrapperViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  -[AMSUIWebRoutePageModel viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIWebRoutePageModel viewController](self, "viewController");
    v4 = (AMSUIWebWrapperViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (id)AMSSetLogKey();
    v6 = [AMSUIWebWrapperViewController alloc];
    -[AMSUIWebRoutePageModel context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[AMSUIWebWrapperViewController initWithContext:](v6, "initWithContext:", v7);

    -[AMSUIWebRoutePageModel context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "metricsOverlay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebViewController setMetricsOverlay:](v4, "setMetricsOverlay:", v9);

    -[AMSUIWebRoutePageModel clientOptions](self, "clientOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebViewController setClientOptions:](v4, "setClientOptions:", v10);

    -[AMSUIWebViewController setLoadUsingWebKit:](v4, "setLoadUsingWebKit:", -[AMSUIWebRoutePageModel loadUsingWebKit](self, "loadUsingWebKit"));
    v11 = objc_alloc(MEMORY[0x24BDD16B0]);
    -[AMSUIWebRoutePageModel URL](self, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithURL:", v12);

    -[AMSUIWebRoutePageModel headers](self, "headers");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = v14;
    else
      v16 = MEMORY[0x24BDBD1B8];
    objc_msgSend(v13, "setAllHTTPHeaderFields:", v16);

    v17 = -[AMSUIWebViewController loadRequest:](v4, "loadRequest:", v13);
    -[AMSUIWebRoutePageModel setViewController:](self, "setViewController:", v4);

  }
  return v4;
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

- (NSDictionary)clientOptions
{
  return self->_clientOptions;
}

- (AMSUIWebClientContext)context
{
  return (AMSUIWebClientContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (BOOL)loadUsingWebKit
{
  return self->_loadUsingWebKit;
}

- (NSURL)URL
{
  return self->_URL;
}

- (AMSUIWebWrapperViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_clientOptions, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
