@implementation AMSUIWebCameraReaderPageModel

- (AMSUIWebCameraReaderPageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebCameraReaderPageModel *v8;
  AMSUIWebCameraReaderPageModel *v9;
  uint64_t v10;
  NSString *backgroundColor;
  uint64_t v12;
  AMSMetricsEvent *impressionEvent;
  uint64_t v14;
  AMSUIWebNavigationBarModel *navigationBar;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSString *v21;
  NSString *bottomLinkLabel;
  void *v23;
  id v24;
  uint64_t v25;
  AMSUIWebActionRunnable *bottomLinkAction;
  void *v27;
  NSString *v28;
  NSString *primaryLabel;
  void *v30;
  NSString *v31;
  NSString *secondaryLabel;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSString *v42;
  NSString *textFieldPlaceholder;
  objc_super v45;

  v6 = a3;
  v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)AMSUIWebCameraReaderPageModel;
  v8 = -[AMSUIWebCameraReaderPageModel init](&v45, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_context, a4);
    +[AMSUIWebModel backgroundColorFromPageModel:](AMSUIWebModel, "backgroundColorFromPageModel:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v9->_backgroundColor;
    v9->_backgroundColor = (NSString *)v10;

    +[AMSUIWebModel impressionEventFromPageModel:context:](AMSUIWebModel, "impressionEventFromPageModel:context:", v6, v7);
    v12 = objc_claimAutoreleasedReturnValue();
    impressionEvent = v9->_impressionEvent;
    v9->_impressionEvent = (AMSMetricsEvent *)v12;

    +[AMSUIWebModel navigationBarFromPageModel:context:](AMSUIWebModel, "navigationBarFromPageModel:context:", v6, v7);
    v14 = objc_claimAutoreleasedReturnValue();
    navigationBar = v9->_navigationBar;
    v9->_navigationBar = (AMSUIWebNavigationBarModel *)v14;

    +[AMSUIWebModel windowSizeFromPageModel:](AMSUIWebModel, "windowSizeFromPageModel:", v6);
    v9->_windowSize.width = v16;
    v9->_windowSize.height = v17;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pageType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = objc_msgSend(v18, "integerValue");
    else
      v19 = 0;
    v9->_pageType = v19;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bottomLinkLabel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    bottomLinkLabel = v9->_bottomLinkLabel;
    v9->_bottomLinkLabel = v21;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bottomLinkAction"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    +[AMSUIWebActionMapper actionFromJSObject:context:](AMSUIWebActionMapper, "actionFromJSObject:context:", v24, v7);
    v25 = objc_claimAutoreleasedReturnValue();
    bottomLinkAction = v9->_bottomLinkAction;
    v9->_bottomLinkAction = (AMSUIWebActionRunnable *)v25;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("primaryLabel"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;

    primaryLabel = v9->_primaryLabel;
    v9->_primaryLabel = v28;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("secondaryLabel"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;

    secondaryLabel = v9->_secondaryLabel;
    v9->_secondaryLabel = v31;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fullScreen"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fullScreen"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_fullScreen = objc_msgSend(v34, "BOOLValue");

    }
    else
    {
      v9->_fullScreen = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allowsCameraToggle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allowsCameraToggle"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_allowsCameraToggle = objc_msgSend(v36, "BOOLValue");

    }
    else
    {
      v9->_allowsCameraToggle = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allowsTextEntry"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allowsTextEntry"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_allowsTextEntry = objc_msgSend(v38, "BOOLValue");

    }
    else
    {
      v9->_allowsTextEntry = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("prefersSessionTeardown"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("prefersSessionTeardown"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_prefersSessionTeardown = objc_msgSend(v40, "BOOLValue");

    }
    else
    {
      v9->_prefersSessionTeardown = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("textFieldPlaceholder"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = v41;
    else
      v42 = 0;

    textFieldPlaceholder = v9->_textFieldPlaceholder;
    v9->_textFieldPlaceholder = v42;

  }
  return v9;
}

- (id)createViewControllerForContainer:(id)a3
{
  AMSUIWebCameraReaderViewController *v4;
  void *v5;
  AMSUIWebCameraReaderViewController *v6;

  v4 = [AMSUIWebCameraReaderViewController alloc];
  -[AMSUIWebCameraReaderPageModel context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AMSUIWebCameraReaderViewController initWithContext:](v4, "initWithContext:", v5);

  return v6;
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
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[7];
  _QWORD v31[8];
  CGSize v32;

  v31[7] = *MEMORY[0x24BDAC8D0];
  v30[0] = CFSTR("allowsCameraToggle");
  if (-[AMSUIWebCameraReaderPageModel allowsCameraToggle](self, "allowsCameraToggle"))
    v3 = CFSTR("true");
  else
    v3 = CFSTR("false");
  v31[0] = v3;
  v30[1] = CFSTR("allowsTextEntry");
  if (-[AMSUIWebCameraReaderPageModel allowsTextEntry](self, "allowsTextEntry"))
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  v31[1] = v4;
  v30[2] = CFSTR("disableReappearPlaceholder");
  if (-[AMSUIWebCameraReaderPageModel disableReappearPlaceholder](self, "disableReappearPlaceholder"))
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  v31[2] = v5;
  v30[3] = CFSTR("fullScreen");
  if (-[AMSUIWebCameraReaderPageModel isFullScreen](self, "isFullScreen"))
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  v31[3] = v6;
  v30[4] = CFSTR("prefersSessionTeardown");
  if (-[AMSUIWebCameraReaderPageModel prefersSessionTeardown](self, "prefersSessionTeardown"))
    v7 = CFSTR("true");
  else
    v7 = CFSTR("false");
  v31[4] = v7;
  v30[5] = CFSTR("pageType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[AMSUIWebCameraReaderPageModel pageType](self, "pageType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v8;
  v30[6] = CFSTR("windowSize");
  -[AMSUIWebCameraReaderPageModel windowSize](self, "windowSize");
  NSStringFromCGSize(v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[AMSUIWebCameraReaderPageModel bottomLinkLabel](self, "bottomLinkLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AMSUIWebCameraReaderPageModel bottomLinkLabel](self, "bottomLinkLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("bottomLinkLabel"));

  }
  -[AMSUIWebCameraReaderPageModel bottomLinkAction](self, "bottomLinkAction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AMSUIWebCameraReaderPageModel bottomLinkAction](self, "bottomLinkAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("bottomLinkAction"));

  }
  -[AMSUIWebCameraReaderPageModel backgroundColor](self, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AMSUIWebCameraReaderPageModel backgroundColor](self, "backgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("backgroundColor"));

  }
  -[AMSUIWebCameraReaderPageModel impressionEvent](self, "impressionEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AMSUIWebCameraReaderPageModel impressionEvent](self, "impressionEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v19, CFSTR("impressionEvent"));

  }
  -[AMSUIWebCameraReaderPageModel navigationBar](self, "navigationBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[AMSUIWebCameraReaderPageModel navigationBar](self, "navigationBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v21, CFSTR("navigationBar"));

  }
  -[AMSUIWebCameraReaderPageModel primaryLabel](self, "primaryLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[AMSUIWebCameraReaderPageModel primaryLabel](self, "primaryLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v23, CFSTR("primaryLabel"));

  }
  -[AMSUIWebCameraReaderPageModel secondaryLabel](self, "secondaryLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[AMSUIWebCameraReaderPageModel secondaryLabel](self, "secondaryLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v25, CFSTR("secondaryLabel"));

  }
  -[AMSUIWebCameraReaderPageModel textFieldPlaceholder](self, "textFieldPlaceholder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[AMSUIWebCameraReaderPageModel textFieldPlaceholder](self, "textFieldPlaceholder");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v27, CFSTR("textFieldPlaceholder"));

  }
  objc_msgSend(v11, "description");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v28;
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

- (BOOL)allowsCameraToggle
{
  return self->_allowsCameraToggle;
}

- (void)setAllowsCameraToggle:(BOOL)a3
{
  self->_allowsCameraToggle = a3;
}

- (BOOL)allowsTextEntry
{
  return self->_allowsTextEntry;
}

- (void)setAllowsTextEntry:(BOOL)a3
{
  self->_allowsTextEntry = a3;
}

- (NSString)bottomLinkLabel
{
  return self->_bottomLinkLabel;
}

- (void)setBottomLinkLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLinkLabel, a3);
}

- (AMSUIWebActionRunnable)bottomLinkAction
{
  return self->_bottomLinkAction;
}

- (void)setBottomLinkAction:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLinkAction, a3);
}

- (BOOL)isFullScreen
{
  return self->_fullScreen;
}

- (void)setFullScreen:(BOOL)a3
{
  self->_fullScreen = a3;
}

- (int64_t)pageType
{
  return self->_pageType;
}

- (void)setPageType:(int64_t)a3
{
  self->_pageType = a3;
}

- (BOOL)prefersSessionTeardown
{
  return self->_prefersSessionTeardown;
}

- (void)setPrefersSessionTeardown:(BOOL)a3
{
  self->_prefersSessionTeardown = a3;
}

- (NSString)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (NSString)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (NSString)textFieldPlaceholder
{
  return self->_textFieldPlaceholder;
}

- (void)setTextFieldPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_textFieldPlaceholder, a3);
}

- (AMSUIWebActionRunnable)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (UIViewController)presentedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentedViewController);
}

- (void)setPresentedViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentedViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_textFieldPlaceholder, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_bottomLinkAction, 0);
  objc_storeStrong((id *)&self->_bottomLinkLabel, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
