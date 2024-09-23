@implementation AMSUIUserNotificationViewController

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AMSUIUserNotificationViewController;
  -[AMSUIUserNotificationViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  -[AMSUIUserNotificationViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIUserNotificationViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[AMSUIUserNotificationViewController contentViewController](self, "contentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUIUserNotificationViewController;
  -[AMSUIUserNotificationViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[AMSUIUserNotificationViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaPause");

}

+ (id)userNotificationFromNotification:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE08430];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUNNotification:", v4);

  return v5;
}

- (void)openNotification
{
  id v2;

  -[AMSUIUserNotificationViewController extensionContext](self, "extensionContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performNotificationDefaultAction");

}

- (void)renderUserNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AMSUIUserNotificationContentViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  AMSUIUserNotificationViewController *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedUserNotificationConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "logKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Will render notification", buf, 0x16u);

  }
  objc_msgSend(v4, "createUNNotificationActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AMSUIUserNotificationViewController extensionContext](self, "extensionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNotificationActions:", v8);

  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIUserNotificationViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = -[AMSUIUserNotificationContentViewController initWithNotification:delegate:]([AMSUIUserNotificationContentViewController alloc], "initWithNotification:delegate:", v4, self);
  -[AMSUIUserNotificationViewController setContentViewController:](self, "setContentViewController:", v12);

  -[AMSUIUserNotificationViewController contentViewController](self, "contentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  -[AMSUIUserNotificationViewController contentViewController](self, "contentViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setModalPresentationStyle:", 0);

  -[AMSUIUserNotificationViewController contentViewController](self, "contentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "expectedContentSize");
  -[AMSUIUserNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  -[AMSUIUserNotificationViewController contentViewController](self, "contentViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __62__AMSUIUserNotificationViewController_renderUserNotification___block_invoke;
  v17[3] = &unk_24CB4F0E8;
  v17[4] = self;
  -[AMSUIUserNotificationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 0, v17);

}

void __62__AMSUIUserNotificationViewController_renderUserNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSize");
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)didReceiveNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "userNotificationFromNotification:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUIUserNotificationViewController renderUserNotification:](self, "renderUserNotification:", v5);
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x24BE08418], "isRunningUnitTests");
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6)
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v14 = 138543362;
        v15 = (id)objc_opt_class();
        v10 = v15;
        _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_ERROR, "%{public}@: didReceiveNotification: received for a notification that did not originate from an AMS", (uint8_t *)&v14, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v11, 0);

    }
    else
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v14 = 138543362;
        v15 = (id)objc_opt_class();
        v13 = v15;
        _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_FAULT, "%{public}@: didReceiveNotification: received for a notification that did not originate from an AMS", (uint8_t *)&v14, 0xCu);

      }
    }

  }
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, uint64_t))a4 + 2))(a4, 2);
}

- (AMSUIUserNotificationContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
