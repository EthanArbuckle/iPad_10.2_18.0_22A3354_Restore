@implementation AMSUIWebPageModel

- (AMSUIWebPageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebPageModel *v8;
  AMSUIWebPageModel *v9;
  AMSUIWebPageModel *v10;
  uint64_t v11;
  NSString *backgroundColor;
  uint64_t v13;
  AMSMetricsEvent *impressionEvent;
  uint64_t v15;
  AMSUIWebNavigationBarModel *navigationBar;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  AMSUIWebToolbarModel *v25;
  AMSUIWebToolbarModel *toolbar;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v28.receiver = self;
    v28.super_class = (Class)AMSUIWebPageModel;
    v9 = -[AMSUIWebPageModel init](&v28, sel_init);
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
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ignoreBottomSafeArea"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ignoreBottomSafeArea"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v10->_ignoreBottomSafeArea = objc_msgSend(v20, "BOOLValue");

      }
      else
      {
        v10->_ignoreBottomSafeArea = 0;
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ignoreTopSafeArea"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ignoreTopSafeArea"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v10->_ignoreTopSafeArea = objc_msgSend(v22, "BOOLValue");

      }
      else
      {
        v10->_ignoreTopSafeArea = 0;
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("toolbar"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;

      if (v24)
      {
        v25 = -[AMSUIWebToolbarModel initWithJSObject:context:]([AMSUIWebToolbarModel alloc], "initWithJSObject:context:", v24, v7);
        toolbar = v10->_toolbar;
        v10->_toolbar = v25;

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

- (id)createViewControllerForContainer:(id)a3
{
  void *v3;
  void *v4;

  -[AMSUIWebPageModel context](self, "context", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webPage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)disableReappearPlaceholder
{
  return 0;
}

- (id)loadPage
{
  return (id)objc_msgSend(MEMORY[0x24BE08078], "promiseWithSuccess");
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
  _QWORD v19[4];
  _QWORD v20[5];
  CGSize v21;

  v20[4] = *MEMORY[0x24BDAC8D0];
  v19[0] = CFSTR("disableReappearPlaceholder");
  if (-[AMSUIWebPageModel disableReappearPlaceholder](self, "disableReappearPlaceholder"))
    v3 = CFSTR("true");
  else
    v3 = CFSTR("false");
  v20[0] = v3;
  v19[1] = CFSTR("ignoreBottomSafeArea");
  if (-[AMSUIWebPageModel ignoreBottomSafeArea](self, "ignoreBottomSafeArea"))
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  v20[1] = v4;
  v19[2] = CFSTR("ignoreTopSafeArea");
  if (-[AMSUIWebPageModel ignoreTopSafeArea](self, "ignoreTopSafeArea"))
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  v20[2] = v5;
  v19[3] = CFSTR("windowSize");
  -[AMSUIWebPageModel windowSize](self, "windowSize");
  NSStringFromCGSize(v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[AMSUIWebPageModel backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSUIWebPageModel backgroundColor](self, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("backgroundColor"));

  }
  -[AMSUIWebPageModel impressionEvent](self, "impressionEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AMSUIWebPageModel impressionEvent](self, "impressionEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("impressionEvent"));

  }
  -[AMSUIWebPageModel navigationBar](self, "navigationBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[AMSUIWebPageModel navigationBar](self, "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("navigationBar"));

  }
  -[AMSUIWebPageModel toolbar](self, "toolbar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[AMSUIWebPageModel toolbar](self, "toolbar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("toolbar"));

  }
  objc_msgSend(v8, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (AMSMetricsEvent)impressionEvent
{
  return self->_impressionEvent;
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

- (AMSUIWebNavigationBarModel)navigationBar
{
  return self->_navigationBar;
}

- (BOOL)ignoreBottomSafeArea
{
  return self->_ignoreBottomSafeArea;
}

- (void)setIgnoreBottomSafeArea:(BOOL)a3
{
  self->_ignoreBottomSafeArea = a3;
}

- (BOOL)ignoreTopSafeArea
{
  return self->_ignoreTopSafeArea;
}

- (void)setIgnoreTopSafeArea:(BOOL)a3
{
  self->_ignoreTopSafeArea = a3;
}

- (AMSUIWebToolbarModel)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
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
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
