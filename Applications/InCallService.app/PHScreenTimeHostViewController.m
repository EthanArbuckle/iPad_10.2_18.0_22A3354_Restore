@implementation PHScreenTimeHostViewController

- (PHScreenTimeHostViewController)initWithRequest:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PHScreenTimeHostViewController *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  STLockoutViewController *lockoutViewController;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PHScreenTimeHostViewController;
  v8 = -[PHScreenTimeHostViewController init](&v26, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    if (objc_msgSend(v9, "length"))
    {
      v10 = objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForBundleIdentifier:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForBundleIdentifier:", v9));
      v11 = objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v10);
      objc_storeWeak((id *)&v8->_delegate, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sanitizedHandles"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactNamesByHandleWithContactsDataSource:", v11));
      v15 = objc_claimAutoreleasedReturnValue(+[STLockoutViewController lockoutViewControllerWithBundleIdentifier:contactsHandles:contactNameByHandle:](STLockoutViewController, "lockoutViewControllerWithBundleIdentifier:contactsHandles:contactNameByHandle:", v9, v13, v14));
      lockoutViewController = v8->_lockoutViewController;
      v8->_lockoutViewController = (STLockoutViewController *)v15;

      -[STLockoutViewController setViewControllerDelegate:](v8->_lockoutViewController, "setViewControllerDelegate:", v8);
      -[STLockoutViewController setOkButtonAction:](v8->_lockoutViewController, "setOkButtonAction:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[STLockoutViewController view](v8->_lockoutViewController, "view"));
      objc_msgSend(v17, "setAutoresizingMask:", 18);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenTimeHostViewController lockoutViewController](v8, "lockoutViewController"));
      objc_msgSend(v18, "willMoveToParentViewController:", v8);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenTimeHostViewController lockoutViewController](v8, "lockoutViewController"));
      -[PHScreenTimeHostViewController addChildViewController:](v8, "addChildViewController:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenTimeHostViewController view](v8, "view"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenTimeHostViewController lockoutViewController](v8, "lockoutViewController"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
      objc_msgSend(v20, "addSubview:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenTimeHostViewController lockoutViewController](v8, "lockoutViewController"));
      objc_msgSend(v23, "didMoveToParentViewController:", v8);

    }
    else
    {
      v24 = sub_1000C5588();
      v10 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1001A8440((uint64_t)v6, v10);
    }

  }
  return v8;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHScreenTimeHostViewController;
  -[PHScreenTimeHostViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  if (-[PHScreenTimeHostViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenTimeHostViewController delegate](self, "delegate"));
    objc_msgSend(v4, "didDismissAlertFromHostViewController");

  }
}

- (void)lockoutViewControllerDidFinishDismissing:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHScreenTimeHostViewController delegate](self, "delegate", a3));
  objc_msgSend(v3, "didDismissAlertFromHostViewController");

}

- (void)dismissAlert
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PHScreenTimeHostViewController lockoutViewController](self, "lockoutViewController"));
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, &stru_1002852C8);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (STLockoutViewController)lockoutViewController
{
  return self->_lockoutViewController;
}

- (void)setLockoutViewController:(id)a3
{
  objc_storeStrong((id *)&self->_lockoutViewController, a3);
}

- (PHScreenTimeHostViewControllerDelegate)delegate
{
  return (PHScreenTimeHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lockoutViewController, 0);
}

@end
