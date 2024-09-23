@implementation AMSUIWebLoadingPageModel

- (AMSUIWebLoadingPageModel)initWithContext:(id)a3
{
  id v5;
  AMSUIWebLoadingPageModel *v6;
  AMSUIWebLoadingPageModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIWebLoadingPageModel;
  v6 = -[AMSUIWebLoadingPageModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (AMSUIWebLoadingPageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebLoadingPageModel *v8;
  AMSUIWebLoadingPageModel *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *backgroundColor;
  void *v14;
  void *v15;
  uint64_t v16;
  AMSMetricsEvent *impressionEvent;
  void *v18;
  NSString *v19;
  NSString *message;
  uint64_t v21;
  AMSUIWebNavigationBarModel *navigationBar;
  CGFloat v23;
  CGFloat v24;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9 = -[AMSUIWebLoadingPageModel init](self, "init");
    if (v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("animateFadeIn"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("animateFadeIn"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9->_animateFadeIn = objc_msgSend(v11, "BOOLValue");

      }
      else
      {
        v9->_animateFadeIn = 1;
      }

      +[AMSUIWebModel backgroundColorFromPageModel:](AMSUIWebModel, "backgroundColorFromPageModel:", v6);
      v12 = objc_claimAutoreleasedReturnValue();
      backgroundColor = v9->_backgroundColor;
      v9->_backgroundColor = (NSString *)v12;

      objc_storeStrong((id *)&v9->_context, a4);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disableDelay"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disableDelay"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9->_disableDelay = objc_msgSend(v15, "BOOLValue");

      }
      else
      {
        v9->_disableDelay = 0;
      }

      +[AMSUIWebModel impressionEventFromPageModel:context:](AMSUIWebModel, "impressionEventFromPageModel:context:", v6, v7);
      v16 = objc_claimAutoreleasedReturnValue();
      impressionEvent = v9->_impressionEvent;
      v9->_impressionEvent = (AMSMetricsEvent *)v16;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("message"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;

      message = v9->_message;
      v9->_message = v19;

      +[AMSUIWebModel navigationBarFromPageModel:context:](AMSUIWebModel, "navigationBarFromPageModel:context:", v6, v7);
      v21 = objc_claimAutoreleasedReturnValue();
      navigationBar = v9->_navigationBar;
      v9->_navigationBar = (AMSUIWebNavigationBarModel *)v21;

      +[AMSUIWebModel windowSizeFromPageModel:](AMSUIWebModel, "windowSizeFromPageModel:", v6);
      v9->_windowSize.width = v23;
      v9->_windowSize.height = v24;
    }
    self = v9;
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
  _QWORD v19[4];
  _QWORD v20[5];
  CGSize v21;

  v20[4] = *MEMORY[0x24BDAC8D0];
  v19[0] = CFSTR("disableReappearPlaceholder");
  if (-[AMSUIWebLoadingPageModel disableReappearPlaceholder](self, "disableReappearPlaceholder"))
    v3 = CFSTR("true");
  else
    v3 = CFSTR("false");
  v20[0] = v3;
  v19[1] = CFSTR("animateFadeIn");
  if (-[AMSUIWebLoadingPageModel animateFadeIn](self, "animateFadeIn"))
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  v20[1] = v4;
  v19[2] = CFSTR("disableDelay");
  if (-[AMSUIWebLoadingPageModel disableDelay](self, "disableDelay"))
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  v20[2] = v5;
  v19[3] = CFSTR("windowSize");
  -[AMSUIWebLoadingPageModel windowSize](self, "windowSize");
  NSStringFromCGSize(v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[AMSUIWebLoadingPageModel backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSUIWebLoadingPageModel backgroundColor](self, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("backgroundColor"));

  }
  -[AMSUIWebLoadingPageModel impressionEvent](self, "impressionEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AMSUIWebLoadingPageModel impressionEvent](self, "impressionEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("impressionEvent"));

  }
  -[AMSUIWebLoadingPageModel message](self, "message");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[AMSUIWebLoadingPageModel message](self, "message");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("message"));

  }
  -[AMSUIWebLoadingPageModel navigationBar](self, "navigationBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[AMSUIWebLoadingPageModel navigationBar](self, "navigationBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("navigationBar"));

  }
  objc_msgSend(v8, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (id)createViewControllerForContainer:(id)a3
{
  AMSUIWebPlaceholderViewController *v4;
  void *v5;
  AMSUIWebPlaceholderViewController *v6;

  v4 = [AMSUIWebPlaceholderViewController alloc];
  -[AMSUIWebLoadingPageModel context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AMSUIWebPlaceholderViewController initWithModel:context:appearance:](v4, "initWithModel:context:appearance:", self, v5, 0);

  -[AMSUIWebPlaceholderViewController setAnimateFadeIn:](v6, "setAnimateFadeIn:", -[AMSUIWebLoadingPageModel animateFadeIn](self, "animateFadeIn"));
  return v6;
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

- (BOOL)animateFadeIn
{
  return self->_animateFadeIn;
}

- (void)setAnimateFadeIn:(BOOL)a3
{
  self->_animateFadeIn = a3;
}

- (BOOL)disableDelay
{
  return self->_disableDelay;
}

- (void)setDisableDelay:(BOOL)a3
{
  self->_disableDelay = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
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
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
