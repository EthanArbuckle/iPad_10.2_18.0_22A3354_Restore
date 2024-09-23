@implementation AMSUIEngagementWrapperViewController

- (AMSUIEngagementWrapperViewController)initWithViewController:(id)a3
{
  id v5;
  AMSUIEngagementWrapperViewController *v6;
  AMSUIEngagementWrapperViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIEngagementWrapperViewController;
  v6 = -[AMSUIEngagementWrapperViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewController, a3);
    -[AMSUIEngagementWrapperViewController _setup](v7, "_setup");
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *v5;
  void (**v6)(void);
  objc_super v7;
  uint8_t buf[16];

  -[AMSUIEngagementWrapperViewController dismissBlock](self, "dismissBlock");
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
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEBUG, "dismissing via dealloc", buf, 2u);
    }

    -[AMSUIEngagementWrapperViewController dismissBlock](self, "dismissBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    -[AMSUIEngagementWrapperViewController setDismissBlock:](self, "setDismissBlock:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)AMSUIEngagementWrapperViewController;
  -[AMSUICommonViewController dealloc](&v7, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUIEngagementWrapperViewController;
  -[AMSUICommonViewController loadView](&v5, sel_loadView);
  -[AMSUIEngagementWrapperViewController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)AMSUIEngagementWrapperViewController;
  -[AMSUICommonViewController setChildViewController:](&v4, sel_setChildViewController_, v3);

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
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMSUIEngagementWrapperViewController;
  -[AMSUIEngagementWrapperViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUIEngagementWrapperViewController viewController](self, "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIEngagementWrapperViewController;
  -[AMSUIEngagementWrapperViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIEngagementWrapperViewController;
  -[AMSUIEngagementWrapperViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void (**v19)(void);
  objc_super v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v22 = -[AMSUIEngagementWrapperViewController isBeingDismissed](self, "isBeingDismissed");
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEBUG, "dismissal isBeingDismissed %d", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[AMSUIEngagementWrapperViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isBeingDismissed");
    *(_DWORD *)buf = 67109120;
    v22 = v10;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEBUG, "dismissal navigationController isBeingDismissed %d", buf, 8u);

  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = -[AMSUIEngagementWrapperViewController isMovingFromParentViewController](self, "isMovingFromParentViewController");
    *(_DWORD *)buf = 67109120;
    v22 = v13;
    _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEBUG, "dismissal isMovingFromParentViewController %d", buf, 8u);
  }

  if ((-[AMSUIEngagementWrapperViewController isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
  {
    -[AMSUIEngagementWrapperViewController navigationController](self, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isBeingDismissed"))
    {

    }
    else
    {
      v15 = -[AMSUIEngagementWrapperViewController isMovingFromParentViewController](self, "isMovingFromParentViewController");

      if (!v15)
        goto LABEL_23;
    }
  }
  -[AMSUIEngagementWrapperViewController dismissBlock](self, "dismissBlock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211102000, v18, OS_LOG_TYPE_DEBUG, "dismissing from view did disappear", buf, 2u);
    }

    -[AMSUIEngagementWrapperViewController dismissBlock](self, "dismissBlock");
    v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v19[2]();

    -[AMSUIEngagementWrapperViewController setDismissBlock:](self, "setDismissBlock:", 0);
  }
LABEL_23:
  v20.receiver = self;
  v20.super_class = (Class)AMSUIEngagementWrapperViewController;
  -[AMSUIEngagementWrapperViewController viewDidDisappear:](&v20, sel_viewDidDisappear_, v3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void (**v7)(void);
  uint8_t v8[16];

  -[AMSUIEngagementWrapperViewController dismissBlock](self, "dismissBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEBUG, "dismissing from presentation controller did dismiss.", v8, 2u);
    }

    -[AMSUIEngagementWrapperViewController dismissBlock](self, "dismissBlock");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();

    -[AMSUIEngagementWrapperViewController setDismissBlock:](self, "setDismissBlock:", 0);
  }
}

- (id)dismissBlock
{
  return self->_dismissBlock;
}

- (void)setDismissBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_dismissBlock, 0);
}

@end
