@implementation AMSUICommonErrorViewController

- (AMSUICommonErrorViewController)initWithError:(id)a3 logKey:(id)a4 bag:(id)a5 retryAction:(id)a6 cancelAction:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  AMSUICommonErrorViewController *v18;
  AMSUICommonErrorViewController *v19;
  void *v20;
  id retryAction;
  void *v22;
  id cancelAction;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)AMSUICommonErrorViewController;
  v18 = -[AMSUICommonErrorViewController initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, 0, 0);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_error, a3);
    objc_storeStrong((id *)&v19->_logKey, a4);
    objc_storeStrong((id *)&v19->_bag, a5);
    v20 = _Block_copy(v16);
    retryAction = v19->_retryAction;
    v19->_retryAction = v20;

    v22 = _Block_copy(v17);
    cancelAction = v19->_cancelAction;
    v19->_cancelAction = v22;

  }
  return v19;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUICommonErrorViewController;
  -[AMSUICommonViewController loadView](&v5, sel_loadView);
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_defaultPlatformBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_setBackgroundColor:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUICommonErrorViewController;
  -[AMSUICommonErrorViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[AMSUICommonErrorViewController _enqueuePageEventIfNeeded](self, "_enqueuePageEventIfNeeded");
  -[AMSUICommonErrorViewController _setup](self, "_setup");
}

- (void)_enqueuePageEventIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[3];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[AMSUICommonErrorViewController engagementMetrics](self, "engagementMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v6;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing engagement display event.", buf, 0x16u);

    }
    -[AMSUICommonErrorViewController engagementMetrics](self, "engagementMetrics", CFSTR("eventType"), CFSTR("pageType"), CFSTR("engagementMetrics"), CFSTR("page"), CFSTR("AMSError"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x24BE08148]);
    -[AMSUICommonErrorViewController bag](self, "bag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithBag:", v11);
    v13 = (id)objc_msgSend(v12, "enqueueData:", v9);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AMSUICommonErrorViewController;
  -[AMSUICommonErrorViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUICommonErrorViewController errorView](self, "errorView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (id)navigationItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[AMSUICommonErrorViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_navigationItemViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AMSUICommonErrorViewController;
    -[AMSUICommonErrorViewController navigationItem](&v9, sel_navigationItem);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)_setupNavigationItem
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[AMSUICommonErrorViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "ams_configureWithTransparentBackground");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "OSLogObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543874;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      v11 = 2114;
      v12 = objc_opt_class();
      _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Unexpected navigation item of %{public}@ class", (uint8_t *)&v7, 0x20u);

    }
  }

}

- (void)_showCancelButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEBD410]);
  -[AMSUICommonErrorViewController bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("CANCEL"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v6, 0, self, sel__cancelButtonAction);
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonErrorViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItems:", v8);

}

- (void)_cancelButtonAction
{
  void (**v2)(void);

  -[AMSUICommonErrorViewController cancelAction](self, "cancelAction");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (void)_setup
{
  AMSUIErrorView *v3;
  AMSUIErrorView *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  __CFString *v16;
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
  AMSUIErrorView *errorView;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  NSString *logKey;
  void *v35;
  void *v36;
  void *v37;
  AMSUIAirplaneModeInquiry *v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = [AMSUIErrorView alloc];
  v4 = -[AMSUIErrorView initWithFrame:title:](v3, "initWithFrame:title:", &stru_24CB5A078, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AMSUICommonErrorViewController setErrorView:](self, "setErrorView:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_defaultPlatformBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonErrorViewController errorView](self, "errorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_setBackgroundColor:", v5);

  v38 = objc_alloc_init(AMSUIAirplaneModeInquiry);
  v7 = -[AMSUIAirplaneModeInquiry isEnabled](v38, "isEnabled");
  -[AMSUICommonErrorViewController error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  if (v11
    && ((objc_msgSend(v11, "domain"),
         v12 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 == (void *)*MEMORY[0x24BDB7680])
      ? (v13 = v7)
      : (v13 = 0),
        v12,
        v13))
  {
    -[AMSUICommonErrorViewController bag](self, "bag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("WIFI_AIRPLANE_MODE_ERROR");
  }
  else
  {
    -[AMSUICommonErrorViewController bag](self, "bag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("DEFAULT_ERROR_TITLE");
  }
  AMSUILocalizedStringFromBundle(v16, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 && objc_msgSend(v17, "length"))
  {
    -[AMSUICommonErrorViewController errorView](self, "errorView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v17);

  }
  if (os_variant_has_internal_content())
  {
    -[AMSUICommonErrorViewController error](self, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ams_message");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUICommonErrorViewController errorView](self, "errorView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMessage:", v20);
  }
  else
  {
    -[AMSUICommonErrorViewController bag](self, "bag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    AMSUILocalizedStringFromBundle(CFSTR("DEFAULT_ERROR_MESSAGE"), v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUICommonErrorViewController errorView](self, "errorView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMessage:", v21);

  }
  -[AMSUICommonErrorViewController bag](self, "bag");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("DEFAULT_ERROR_BUTTON"), v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonErrorViewController errorView](self, "errorView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setButtonTitle:", v25);

  errorView = self->_errorView;
  -[AMSUICommonErrorViewController retryAction](self, "retryAction");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIErrorView setButtonAction:](errorView, "setButtonAction:", v28);

  -[AMSUICommonViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonErrorViewController errorView](self, "errorView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", v30);

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v31, "OSLogObject");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v33 = (id)objc_opt_class();
    logKey = self->_logKey;
    v35 = logKey;
    if (!logKey)
    {
      AMSLogKey();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSUIErrorView title](self->_errorView, "title");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIErrorView message](self->_errorView, "message");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v40 = v33;
    v41 = 2114;
    v42 = v35;
    v43 = 2114;
    v44 = v36;
    v45 = 2114;
    v46 = v37;
    _os_log_impl(&dword_211102000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error page displayed. Title: %{public}@, Message: %{public}@", buf, 0x2Au);

    if (!logKey)
  }

  -[AMSUICommonErrorViewController _setupNavigationItem](self, "_setupNavigationItem");
  -[AMSUICommonErrorViewController _showCancelButton](self, "_showCancelButton");

}

- (NSDictionary)engagementMetrics
{
  return self->_engagementMetrics;
}

- (void)setEngagementMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_engagementMetrics, a3);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (id)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (AMSUIErrorView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
  objc_storeStrong((id *)&self->_errorView, a3);
}

- (id)retryAction
{
  return self->_retryAction;
}

- (void)setRetryAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retryAction, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_engagementMetrics, 0);
}

@end
