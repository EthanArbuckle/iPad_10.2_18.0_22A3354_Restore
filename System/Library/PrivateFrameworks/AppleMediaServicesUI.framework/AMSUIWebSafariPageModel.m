@implementation AMSUIWebSafariPageModel

- (AMSUIWebSafariPageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebSafariPageModel *v8;
  AMSUIWebSafariPageModel *v9;
  AMSUIWebSafariPageModel *v10;
  uint64_t v11;
  NSString *backgroundColor;
  uint64_t v13;
  AMSMetricsEvent *impressionEvent;
  uint64_t v15;
  AMSUIWebNavigationBarModel *navigationBar;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  NSString *v20;
  NSString *callbackScheme;
  void *v22;
  NSDictionary *v23;
  NSDictionary *data;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  AMSUIWebLoadingPageModel *v29;
  AMSUIWebLoadingPageModel *loadingModel;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  NSURL *URL;
  objc_super v38;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v38.receiver = self;
    v38.super_class = (Class)AMSUIWebSafariPageModel;
    v9 = -[AMSUIWebSafariPageModel init](&v38, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_context, a4);
      +[AMSUIWebModel backgroundColorFromPageModel:](AMSUIWebModel, "backgroundColorFromPageModel:", v6);
      v11 = objc_claimAutoreleasedReturnValue();
      backgroundColor = v10->_backgroundColor;
      v10->_backgroundColor = (NSString *)v11;

      +[AMSUIWebModel impressionEventFromPageModel:context:](AMSUIWebModel, "impressionEventFromPageModel:context:", v6, v7);
      v13 = objc_claimAutoreleasedReturnValue();
      impressionEvent = v10->_impressionEvent;
      v10->_impressionEvent = (AMSMetricsEvent *)v13;

      +[AMSUIWebModel navigationBarFromPageModel:context:](AMSUIWebModel, "navigationBarFromPageModel:context:", v6, v7);
      v15 = objc_claimAutoreleasedReturnValue();
      navigationBar = v10->_navigationBar;
      v10->_navigationBar = (AMSUIWebNavigationBarModel *)v15;

      +[AMSUIWebModel windowSizeFromPageModel:](AMSUIWebModel, "windowSizeFromPageModel:", v6);
      v10->_windowSize.width = v17;
      v10->_windowSize.height = v18;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("callbackScheme"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;

      callbackScheme = v10->_callbackScheme;
      v10->_callbackScheme = v20;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;

      data = v10->_data;
      v10->_data = v23;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hideToolbar"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hideToolbar"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v10->_hideToolBar = objc_msgSend(v26, "BOOLValue");

      }
      else
      {
        v10->_hideToolBar = 0;
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("loadingPage"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v28 = v27;
      else
        v28 = 0;

      v29 = -[AMSUIWebLoadingPageModel initWithJSObject:context:]([AMSUIWebLoadingPageModel alloc], "initWithJSObject:context:", v28, v7);
      loadingModel = v10->_loadingModel;
      v10->_loadingModel = v29;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hideShareButton"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hideShareButton"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v10->_showShareButton = objc_msgSend(v32, "BOOLValue") ^ 1;

      }
      else
      {
        v10->_showShareButton = 1;
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;

      if (v34)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v34);
        v35 = objc_claimAutoreleasedReturnValue();
        URL = v10->_URL;
        v10->_URL = (NSURL *)v35;

      }
    }
    self = v10;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
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
  void *v24;
  _QWORD v26[4];
  _QWORD v27[5];
  CGSize v28;

  v27[4] = *MEMORY[0x24BDAC8D0];
  v26[0] = CFSTR("disableReappearPlaceholder");
  if (-[AMSUIWebSafariPageModel disableReappearPlaceholder](self, "disableReappearPlaceholder"))
    v3 = CFSTR("true");
  else
    v3 = CFSTR("false");
  v27[0] = v3;
  v26[1] = CFSTR("hideToolBar");
  if (-[AMSUIWebSafariPageModel hideToolBar](self, "hideToolBar"))
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  v27[1] = v4;
  v26[2] = CFSTR("showShareButton");
  if (-[AMSUIWebSafariPageModel showShareButton](self, "showShareButton"))
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  v27[2] = v5;
  v26[3] = CFSTR("windowSize");
  -[AMSUIWebSafariPageModel windowSize](self, "windowSize");
  NSStringFromCGSize(v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[AMSUIWebSafariPageModel backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSUIWebSafariPageModel backgroundColor](self, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("backgroundColor"));

  }
  -[AMSUIWebSafariPageModel callbackScheme](self, "callbackScheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AMSUIWebSafariPageModel callbackScheme](self, "callbackScheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("callbackScheme"));

  }
  -[AMSUIWebSafariPageModel data](self, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[AMSUIWebSafariPageModel data](self, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("data"));

  }
  -[AMSUIWebSafariPageModel impressionEvent](self, "impressionEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[AMSUIWebSafariPageModel impressionEvent](self, "impressionEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("impressionEvent"));

  }
  -[AMSUIWebSafariPageModel loadingModel](self, "loadingModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[AMSUIWebSafariPageModel loadingModel](self, "loadingModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v18, CFSTR("loadingModel"));

  }
  -[AMSUIWebSafariPageModel navigationBar](self, "navigationBar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[AMSUIWebSafariPageModel navigationBar](self, "navigationBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v20, CFSTR("navigationBar"));

  }
  -[AMSUIWebSafariPageModel URL](self, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[AMSUIWebSafariPageModel URL](self, "URL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "absoluteString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v23, CFSTR("URL"));

  }
  objc_msgSend(v8, "description");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v24;
}

- (id)createViewControllerForContainer:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  AMSUIWebSafariViewController *v13;
  AMSUIWebSafariViewController *v14;
  void *v15;

  objc_msgSend(a3, "containedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (!v5)
    goto LABEL_8;
  objc_msgSend(v5, "originalURL");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_8;
  v7 = (void *)v6;
  -[AMSUIWebSafariPageModel URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originalURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (v12)
  {
    v13 = (AMSUIWebSafariViewController *)v5;
  }
  else
  {
LABEL_8:
    v14 = [AMSUIWebSafariViewController alloc];
    -[AMSUIWebSafariPageModel context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AMSUIWebSafariViewController initWithContext:](v14, "initWithContext:", v15);

  }
  return v13;
}

- (BOOL)disableReappearPlaceholder
{
  return 0;
}

- (id)loadPage
{
  return (id)objc_msgSend(MEMORY[0x24BE08078], "promiseWithSuccess");
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

- (NSString)callbackScheme
{
  return self->_callbackScheme;
}

- (void)setCallbackScheme:(id)a3
{
  objc_storeStrong((id *)&self->_callbackScheme, a3);
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (BOOL)hideToolBar
{
  return self->_hideToolBar;
}

- (void)setHideToolBar:(BOOL)a3
{
  self->_hideToolBar = a3;
}

- (AMSUIWebLoadingPageModel)loadingModel
{
  return self->_loadingModel;
}

- (void)setLoadingModel:(id)a3
{
  objc_storeStrong((id *)&self->_loadingModel, a3);
}

- (BOOL)showShareButton
{
  return self->_showShareButton;
}

- (void)setShowShareButton:(BOOL)a3
{
  self->_showShareButton = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_loadingModel, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_callbackScheme, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
