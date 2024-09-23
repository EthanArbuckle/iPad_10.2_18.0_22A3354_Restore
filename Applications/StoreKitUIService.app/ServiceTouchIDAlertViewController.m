@implementation ServiceTouchIDAlertViewController

- (void)dealloc
{
  objc_super v3;

  -[ServiceAlertProxy setDelegate:](self->_remoteAlertProxy, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ServiceTouchIDAlertViewController;
  -[ServiceTouchIDAlertViewController dealloc](&v3, "dealloc");
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceAlertQueue defaultQueue](ServiceAlertQueue, "defaultQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100011CA4;
  v12[3] = &unk_100049758;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "getNextAlertForClassName:completionBlock:", CFSTR("ServiceTouchIDAlertViewController"), v12);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTouchIDAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v7 = (objc_class *)objc_opt_class(self);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v6, "setIdleTimerDisabled:forReason:", 1, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTouchIDAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v10, "setDesiredHardwareButtonEvents:", 16);

  v11.receiver = self;
  v11.super_class = (Class)ServiceTouchIDAlertViewController;
  -[ServiceTouchIDAlertViewController viewDidAppear:](&v11, "viewDidAppear:", v3);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  ServiceAlertProxy *remoteAlertProxy;
  ServiceAlertProxy *v6;
  objc_super v7;

  v3 = a3;
  remoteAlertProxy = self->_remoteAlertProxy;
  if (remoteAlertProxy)
  {
    -[ServiceAlertProxy setDelegate:](remoteAlertProxy, "setDelegate:", 0);
    -[ServiceAlertProxy invalidate](self->_remoteAlertProxy, "invalidate");
    v6 = self->_remoteAlertProxy;
    self->_remoteAlertProxy = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)ServiceTouchIDAlertViewController;
  -[ServiceTouchIDAlertViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
}

- (void)_willAppearInRemoteViewController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "setAllowsAlertStacking:", 1);
  objc_msgSend(v4, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v4, "setShouldDismissOnUILock:", 1);
  v5.receiver = self;
  v5.super_class = (Class)ServiceTouchIDAlertViewController;
  -[ServiceTouchIDAlertViewController _willAppearInRemoteViewController:](&v5, "_willAppearInRemoteViewController:", v4);

}

- (void)alertProxy:(id)a3 didReceiveMessage:(id)a4
{
  int64_t int64;
  uint64_t v6;
  void *v7;
  id v8;
  ServiceTouchIDAlertHeaderView *headerView;
  void *v10;
  ServiceTouchIDAlertHeaderView *v11;
  void *v12;
  xpc_object_t xdict;

  xdict = a4;
  int64 = xpc_dictionary_get_int64(xdict, "0");
  if (int64 == 3002)
  {
    v6 = objc_opt_class(NSDictionary);
    v7 = (void *)SSXPCDictionaryCopyCFObjectWithClass(xdict, "1", v6);
    v8 = objc_msgSend(objc_alloc((Class)SSDialog), "initWithDialogDictionary:", v7);
    headerView = self->_headerView;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "message"));
    -[ServiceTouchIDAlertHeaderView setMessage:](headerView, "setMessage:", v10);

    v11 = self->_headerView;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    -[ServiceTouchIDAlertHeaderView setTitle:](v11, "setTitle:", v12);

    if (xpc_dictionary_get_BOOL(xdict, "2"))
      -[ServiceTouchIDAlertHeaderView shakeTitleView](self->_headerView, "shakeTitleView");

  }
  else if (int64 == 3001)
  {
    -[ServiceTouchIDAlertViewController _dismissAlertController](self, "_dismissAlertController");
  }

}

- (void)_dismissAlertController
{
  ServiceAlertProxy *remoteAlertProxy;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;

  -[UIAlertController dismissViewControllerAnimated:completion:](self->_alertController, "dismissViewControllerAnimated:completion:", 1, 0);
  -[ServiceAlertProxy setDelegate:](self->_remoteAlertProxy, "setDelegate:", 0);
  remoteAlertProxy = self->_remoteAlertProxy;
  self->_remoteAlertProxy = 0;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ServiceTouchIDAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v7, "setIdleTimerDisabled:forReason:", 0, v6);

  objc_msgSend(v7, "dismiss");
}

- (void)_finishWithButtonIndex:(int64_t)a3
{
  id v5;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "1", a3);
  -[ServiceAlertProxy finishWithResponse:](self->_remoteAlertProxy, "finishWithResponse:", v5);
  -[ServiceTouchIDAlertViewController _dismissAlertController](self, "_dismissAlertController");

}

- (id)_remoteViewControllerProxy
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ServiceTouchIDAlertViewController;
  v2 = -[ServiceTouchIDAlertViewController _remoteViewControllerProxy](&v4, "_remoteViewControllerProxy");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)_showAlertForAlertProxy:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  ServiceTouchIDAlertHeaderView *v10;
  ServiceTouchIDAlertHeaderView *headerView;
  ServiceTouchIDAlertHeaderView *v12;
  void *v13;
  ServiceTouchIDAlertHeaderView *v14;
  void *v15;
  ServiceTouchIDAlertHeaderView *v16;
  void *v17;
  NSBundle *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIAlertController *v23;
  UIAlertController *alertController;
  id v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  ServiceTouchIDAlertViewController *v30;
  id v31;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_remoteAlertProxy, a3);
  -[ServiceAlertProxy setDelegate:](self->_remoteAlertProxy, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "options"));
  v7 = (void *)SSXPCCreateCFObjectFromXPCObject();

  v8 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = objc_msgSend(objc_alloc((Class)SSDialog), "initWithDialogDictionary:", v7);
    if (!self->_headerView)
    {
      v10 = objc_alloc_init(ServiceTouchIDAlertHeaderView);
      headerView = self->_headerView;
      self->_headerView = v10;

      v12 = self->_headerView;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[ServiceTouchIDAlertHeaderView setBackgroundColor:](v12, "setBackgroundColor:", v13);

      v14 = self->_headerView;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "message"));
      -[ServiceTouchIDAlertHeaderView setMessage:](v14, "setMessage:", v15);

      v16 = self->_headerView;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
      -[ServiceTouchIDAlertHeaderView setTitle:](v16, "setTitle:", v17);

      v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(ServiceTouchIDAlertViewController));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("MesaGlyph"), v19));

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_flatImageWithColor:", v21));

      -[ServiceTouchIDAlertHeaderView setImage:](self->_headerView, "setImage:", v22);
    }
    if (!self->_alertController)
    {
      v23 = (UIAlertController *)objc_alloc_init((Class)UIAlertController);
      alertController = self->_alertController;
      self->_alertController = v23;

      -[UIAlertController setPreferredStyle:](self->_alertController, "setPreferredStyle:", 1);
      v25 = objc_alloc_init((Class)UIViewController);
      -[ServiceTouchIDAlertHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", 272.0, 1.79769313e308);
      objc_msgSend(v25, "setPreferredContentSize:");
      objc_msgSend(v25, "setView:", self->_headerView);
      -[UIAlertController setContentViewController:](self->_alertController, "setContentViewController:", v25);
      objc_initWeak(&location, self);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buttons"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100012430;
      v28[3] = &unk_1000497C8;
      v29 = v9;
      v30 = self;
      objc_copyWeak(&v31, &location);
      objc_msgSend(v26, "enumerateObjectsUsingBlock:", v28);

      -[ServiceTouchIDAlertViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_alertController, 1, 0);
      objc_destroyWeak(&v31);

      objc_destroyWeak(&location);
    }

  }
  else
  {
    v27 = objc_opt_class(self);
    NSLog(CFSTR("[%@]: Invalid alert proxy, dismissing"), v27);
    -[ServiceTouchIDAlertViewController _dismissAlertController](self, "_dismissAlertController");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertProxy, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
