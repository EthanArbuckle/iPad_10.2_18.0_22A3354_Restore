@implementation AMSUIWebErrorPageModel

- (AMSUIWebErrorPageModel)initWithError:(id)a3 context:(id)a4 actionBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  AMSUIWebErrorPageModel *v15;
  AMSUIWebErrorPageModel *v16;
  void *v17;
  id actionBlock;
  uint64_t v19;
  NSBundle *bundle;
  AMSUIAirplaneModeInquiry *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *errorTitle;
  uint64_t v30;
  NSString *errorMessage;
  NSString *v32;
  uint64_t v33;
  NSString *v34;
  objc_super v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("errorPageModel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  if (v14)
  {
    v15 = -[AMSUIWebErrorPageModel initWithJSObject:context:](self, "initWithJSObject:context:", v14, v10);
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)AMSUIWebErrorPageModel;
    v15 = -[AMSUIWebErrorPageModel init](&v36, sel_init);
  }
  v16 = v15;
  if (v15)
  {
    v17 = _Block_copy(v11);
    actionBlock = v16->_actionBlock;
    v16->_actionBlock = v17;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    v19 = objc_claimAutoreleasedReturnValue();
    bundle = v16->_bundle;
    v16->_bundle = (NSBundle *)v19;

    objc_storeStrong((id *)&v16->_error, a3);
    objc_storeStrong((id *)&v16->_context, a4);
    v21 = objc_alloc_init(AMSUIAirplaneModeInquiry);
    v22 = -[AMSUIAirplaneModeInquiry isEnabled](v21, "isEnabled");
    objc_msgSend(v9, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;

    if (!v25)
      goto LABEL_16;
    objc_msgSend(v25, "domain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26 != (void *)*MEMORY[0x24BDB7680])
      v22 = 0;

    if (v22)
    {
      -[AMSUIWebErrorPageModel bundle](v16, "bundle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("WIFI_AIRPLANE_MODE_ERROR"), &stru_24CB5A078, 0);
      v28 = objc_claimAutoreleasedReturnValue();
      errorTitle = v16->_errorTitle;
      v16->_errorTitle = (NSString *)v28;

      objc_msgSend((id)objc_opt_class(), "_messageFromError:", v9);
      v30 = objc_claimAutoreleasedReturnValue();
      errorMessage = v16->_errorMessage;
      v16->_errorMessage = (NSString *)v30;

    }
    else
    {
LABEL_16:
      if (!v14)
      {
        v32 = v16->_errorTitle;
        v16->_errorTitle = 0;

        objc_msgSend((id)objc_opt_class(), "_messageFromError:", v9);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v16->_errorMessage;
        v16->_errorMessage = (NSString *)v33;

        v16->_errorMessageInternalOnly = 1;
      }
    }

  }
  return v16;
}

- (AMSUIWebErrorPageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebErrorPageModel *v8;
  AMSUIWebErrorPageModel *v9;
  void *v10;
  id v11;
  uint64_t v12;
  AMSUIWebActionRunnable *action;
  uint64_t v14;
  NSString *backgroundColor;
  uint64_t v16;
  AMSMetricsEvent *impressionEvent;
  uint64_t v18;
  AMSUIWebNavigationBarModel *navigationBar;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  NSString *v23;
  NSString *actionButtonTitle;
  void *v25;
  NSString *v26;
  NSString *errorMessage;
  void *v28;
  NSString *v29;
  NSString *errorTitle;
  void *v31;
  void *v32;
  objc_super v34;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v34.receiver = self;
    v34.super_class = (Class)AMSUIWebErrorPageModel;
    v9 = -[AMSUIWebErrorPageModel init](&v34, sel_init);
    if (v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("action"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;

      +[AMSUIWebActionMapper actionFromJSObject:context:](AMSUIWebActionMapper, "actionFromJSObject:context:", v11, v7);
      v12 = objc_claimAutoreleasedReturnValue();
      action = v9->_action;
      v9->_action = (AMSUIWebActionRunnable *)v12;

      +[AMSUIWebModel backgroundColorFromPageModel:](AMSUIWebModel, "backgroundColorFromPageModel:", v6);
      v14 = objc_claimAutoreleasedReturnValue();
      backgroundColor = v9->_backgroundColor;
      v9->_backgroundColor = (NSString *)v14;

      +[AMSUIWebModel impressionEventFromPageModel:context:](AMSUIWebModel, "impressionEventFromPageModel:context:", v6, v7);
      v16 = objc_claimAutoreleasedReturnValue();
      impressionEvent = v9->_impressionEvent;
      v9->_impressionEvent = (AMSMetricsEvent *)v16;

      +[AMSUIWebModel navigationBarFromPageModel:context:](AMSUIWebModel, "navigationBarFromPageModel:context:", v6, v7);
      v18 = objc_claimAutoreleasedReturnValue();
      navigationBar = v9->_navigationBar;
      v9->_navigationBar = (AMSUIWebNavigationBarModel *)v18;

      +[AMSUIWebModel windowSizeFromPageModel:](AMSUIWebModel, "windowSizeFromPageModel:", v6);
      v9->_windowSize.width = v20;
      v9->_windowSize.height = v21;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionButtonTitle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;

      actionButtonTitle = v9->_actionButtonTitle;
      v9->_actionButtonTitle = v23;

      objc_storeStrong((id *)&v9->_context, a4);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorMessage"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;

      errorMessage = v9->_errorMessage;
      v9->_errorMessage = v26;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorTitle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;

      errorTitle = v9->_errorTitle;
      v9->_errorTitle = v29;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorMessageInternalOnly"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorMessageInternalOnly"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v9->_errorMessageInternalOnly = objc_msgSend(v32, "BOOLValue");

      }
      else
      {
        v9->_errorMessageInternalOnly = 0;
      }

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

- (NSString)errorMessage
{
  NSString *v3;
  uint64_t v4;

  v3 = self->_errorMessage;
  if (-[AMSUIWebErrorPageModel errorMessageInternalOnly](self, "errorMessageInternalOnly"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INTERNAL ONLY: %@"), v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (NSString *)v4;
  }
  return v3;
}

- (NSString)description
{
  const __CFString *v3;
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
  _QWORD v24[3];
  _QWORD v25[4];
  CGSize v26;

  v25[3] = *MEMORY[0x24BDAC8D0];
  v24[0] = CFSTR("disableReappearPlaceholder");
  if (-[AMSUIWebErrorPageModel disableReappearPlaceholder](self, "disableReappearPlaceholder"))
    v3 = CFSTR("true");
  else
    v3 = CFSTR("false");
  v25[0] = v3;
  v24[1] = CFSTR("errorMessageInternalOnly");
  if (-[AMSUIWebErrorPageModel errorMessageInternalOnly](self, "errorMessageInternalOnly"))
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  v25[1] = v4;
  v24[2] = CFSTR("windowSize");
  -[AMSUIWebErrorPageModel windowSize](self, "windowSize");
  NSStringFromCGSize(v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[AMSUIWebErrorPageModel action](self, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSUIWebErrorPageModel action](self, "action");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("action"));

  }
  -[AMSUIWebErrorPageModel actionButtonTitle](self, "actionButtonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSUIWebErrorPageModel actionButtonTitle](self, "actionButtonTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("actionButtonTitle"));

  }
  -[AMSUIWebErrorPageModel backgroundColor](self, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AMSUIWebErrorPageModel backgroundColor](self, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("backgroundColor"));

  }
  -[AMSUIWebErrorPageModel errorMessage](self, "errorMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AMSUIWebErrorPageModel errorMessage](self, "errorMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v15, CFSTR("errorMessage"));

  }
  -[AMSUIWebErrorPageModel errorTitle](self, "errorTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AMSUIWebErrorPageModel errorTitle](self, "errorTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v17, CFSTR("errorTitle"));

  }
  -[AMSUIWebErrorPageModel impressionEvent](self, "impressionEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AMSUIWebErrorPageModel impressionEvent](self, "impressionEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v19, CFSTR("impressionEvent"));

  }
  -[AMSUIWebErrorPageModel navigationBar](self, "navigationBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[AMSUIWebErrorPageModel navigationBar](self, "navigationBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v21, CFSTR("navigationBar"));

  }
  objc_msgSend(v7, "description");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v22;
}

- (id)createViewControllerForContainer:(id)a3
{
  AMSUIWebErrorViewController *v4;
  void *v5;
  AMSUIWebErrorViewController *v6;

  v4 = [AMSUIWebErrorViewController alloc];
  -[AMSUIWebErrorPageModel context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AMSUIWebErrorViewController initWithContext:](v4, "initWithContext:", v5);

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

+ (id)_messageFromError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("[%ld]"), objc_msgSend(v3, "code"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_3;
  objc_msgSend(v3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_3:
    objc_msgSend(v4, "appendFormat:", CFSTR(" %@"), v5);

    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  objc_msgSend(v3, "ams_message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_6;
  objc_msgSend(v3, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ams_message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_6:
    if ((v8 & 1) == 0)
      objc_msgSend(v4, "appendString:", CFSTR(":"));
    objc_msgSend(v4, "appendFormat:", CFSTR(" %@"), v9);

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

- (AMSUIWebActionRunnable)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)actionButtonTitle
{
  return self->_actionButtonTitle;
}

- (void)setActionButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonTitle, a3);
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)errorMessageInternalOnly
{
  return self->_errorMessageInternalOnly;
}

- (void)setErrorMessageInternalOnly:(BOOL)a3
{
  self->_errorMessageInternalOnly = a3;
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (void)setErrorTitle:(id)a3
{
  objc_storeStrong((id *)&self->_errorTitle, a3);
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
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
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
