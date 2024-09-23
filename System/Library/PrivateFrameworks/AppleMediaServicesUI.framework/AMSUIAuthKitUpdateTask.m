@implementation AMSUIAuthKitUpdateTask

- (AMSUIAuthKitUpdateTask)initWithAccount:(id)a3 presentingViewController:(id)a4 options:(id)a5
{
  id v9;
  AMSUIAuthKitUpdateTask *v10;
  AMSUIAuthKitUpdateTask *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIAuthKitUpdateTask;
  v10 = -[AMSAuthKitUpdateTask initWithAccount:options:](&v13, sel_initWithAccount_options_, a3, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_presentingViewController, a4);

  return v11;
}

- (AMSUIAuthKitUpdateTask)initWithAccount:(id)a3 presentingWindow:(id)a4 options:(id)a5
{
  id v9;
  AMSUIAuthKitUpdateTask *v10;
  AMSUIAuthKitUpdateTask *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIAuthKitUpdateTask;
  v10 = -[AMSAuthKitUpdateTask initWithAccount:options:](&v13, sel_initWithAccount_options_, a3, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_presentingWindow, a4);

  return v11;
}

- (unint64_t)_authenticationType
{
  void *v2;
  unint64_t v3;

  -[AMSAuthKitUpdateTask options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "authenticationType");

  return v3;
}

- (void)_configureAuthKitContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIAuthKitUpdateTask;
  -[AMSAuthKitUpdateTask _configureAuthKitContext:](&v15, sel__configureAuthKitContext_, v4);
  getAKAppleIDAuthenticationInAppContextClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "cancelButtonString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      AMSUILocalizedStringFromBundle(CFSTR("CANCEL"), 0, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCancelButtonString:", v8);

    }
    objc_msgSend(v5, "defaultButtonString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSUILocalizedStringFromBundle(CFSTR("SIGN_IN_BUTTON_TITLE"), 0, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDefaultButtonString:", v11);

    }
    -[AMSUIAuthKitUpdateTask presentingWindow](self, "presentingWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[AMSUIAuthKitUpdateTask presentingWindow](self, "presentingWindow");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rootViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPresentingViewController:", v14);

    }
    else
    {
      -[AMSUIAuthKitUpdateTask getPresentingViewController](self, "getPresentingViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPresentingViewController:", v13);
    }

    objc_msgSend(v5, "setDelegate:", self);
  }

}

- (id)_createAuthKitContext
{
  return objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass());
}

- (void)contextDidPresentLoginAlertController:(id)a3
{
  uint64_t v3;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[AMSAuthKitUpdateTask options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_opt_class();
    if (v10)
    {
      -[AMSAuthKitUpdateTask options](self, "options");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logKey");
      v3 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v12, v3, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@ "), v12, v13);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    v18 = 2114;
    v19 = v15;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@context: %{public}@", buf, 0x16u);
    if (v10)
    {

      v14 = (void *)v3;
    }

  }
}

- (void)contextWillDismissLoginAlertController:(id)a3
{
  uint64_t v3;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[AMSAuthKitUpdateTask options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_opt_class();
    if (v10)
    {
      -[AMSAuthKitUpdateTask options](self, "options");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logKey");
      v3 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v12, v3, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@ "), v12, v13);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    v18 = 2114;
    v19 = v15;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@context: %{public}@", buf, 0x16u);
    if (v10)
    {

      v14 = (void *)v3;
    }

  }
}

- (void)contextDidDismissLoginAlertController:(id)a3
{
  uint64_t v3;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[AMSAuthKitUpdateTask options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_opt_class();
    if (v10)
    {
      -[AMSAuthKitUpdateTask options](self, "options");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logKey");
      v3 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v12, v3, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@ "), v12, v13);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    v18 = 2114;
    v19 = v15;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@context: %{public}@", buf, 0x16u);
    if (v10)
    {

      v14 = (void *)v3;
    }

  }
}

- (void)contextWillBeginPresentingSecondaryUI:(id)a3
{
  uint64_t v3;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[AMSAuthKitUpdateTask options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_opt_class();
    if (v10)
    {
      -[AMSAuthKitUpdateTask options](self, "options");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logKey");
      v3 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v12, v3, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@ "), v12, v13);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    v18 = 2114;
    v19 = v15;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@context: %{public}@", buf, 0x16u);
    if (v10)
    {

      v14 = (void *)v3;
    }

  }
}

- (void)contextDidEndPresentingSecondaryUI:(id)a3
{
  uint64_t v3;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[AMSAuthKitUpdateTask options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_opt_class();
    if (v10)
    {
      -[AMSAuthKitUpdateTask options](self, "options");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logKey");
      v3 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v12, v3, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@ "), v12, v13);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    v18 = 2114;
    v19 = v15;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@context: %{public}@", buf, 0x16u);
    if (v10)
    {

      v14 = (void *)v3;
    }

  }
}

- (UIViewController)getPresentingViewController
{
  return self->_presentingViewController;
}

- (UIWindow)presentingWindow
{
  return self->_presentingWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingWindow, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end
