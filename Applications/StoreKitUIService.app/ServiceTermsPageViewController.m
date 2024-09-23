@implementation ServiceTermsPageViewController

- (void)dealloc
{
  objc_super v3;

  -[ServiceAlertProxy setDelegate:](self->_remoteAlertProxy, "setDelegate:", 0);
  -[SKTermsPageViewController setDelegate:](self->_underlyingViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ServiceTermsPageViewController;
  -[ServiceTermsPageViewController dealloc](&v3, "dealloc");
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
  v12[2] = sub_100010DC0;
  v12[3] = &unk_100049758;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "getNextAlertForClassName:completionBlock:", CFSTR("ServiceTermsPageViewController"), v12);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTermsPageViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v7 = (objc_class *)objc_opt_class(self);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v6, "setIdleTimerDisabled:forReason:", 1, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTermsPageViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v10, "setDesiredHardwareButtonEvents:", 16);

  v11.receiver = self;
  v11.super_class = (Class)ServiceTermsPageViewController;
  -[ServiceTermsPageViewController viewDidAppear:](&v11, "viewDidAppear:", v3);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTermsPageViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5.receiver = self;
  v5.super_class = (Class)ServiceTermsPageViewController;
  -[ServiceTermsPageViewController viewDidLoad](&v5, "viewDidLoad");
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    v9 = v7;
  else
    v9 = v7 & 2;
  if (!(_DWORD)v9)
    goto LABEL_10;
  v11 = 138412290;
  v12 = v4;
  v10 = (void *)_os_log_send_and_compose_impl(v9, 0, 0, 0, &_mh_execute_header, v8, 1, "%@: View service did terminate.", &v11, 12);

  if (v10)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4));
    free(v10);
    SSFileLog(v5, CFSTR("%@"));
LABEL_10:

  }
  -[ServiceTermsPageViewController _dismissClientViewController](self, "_dismissClientViewController");

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
  v7.super_class = (Class)ServiceTermsPageViewController;
  -[ServiceTermsPageViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
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
  v5.super_class = (Class)ServiceTermsPageViewController;
  -[ServiceTermsPageViewController _willAppearInRemoteViewController:](&v5, "_willAppearInRemoteViewController:", v4);

}

- (void)alertProxyDidCancel:(id)a3
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig", a3));
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    LODWORD(v6) = v5 | 2;
  else
    LODWORD(v6) = v5;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "OSLogObject"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    v6 = v6;
  else
    v6 &= 2u;
  if (!(_DWORD)v6)
    goto LABEL_10;
  v10 = 138412290;
  v11 = (id)objc_opt_class(self);
  v8 = v11;
  v9 = (void *)_os_log_send_and_compose_impl(v6, 0, 0, 0, &_mh_execute_header, v7, 1, "%@: Alert proxy did cancel.", &v10, 12);

  if (v9)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4));
    free(v9);
    SSFileLog(v4, CFSTR("%@"));
LABEL_10:

  }
  -[ServiceTermsPageViewController _dismissClientViewController](self, "_dismissClientViewController");
}

- (void)termsPageViewControllerDidFinish:(id)a3 withAcceptance:(BOOL)a4
{
  -[ServiceTermsPageViewController _dismissWithAcceptance:](self, "_dismissWithAcceptance:", a4);
}

- (BOOL)_checkEntitlementsWithError:(id *)a3
{
  id v4;
  BOOL v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  -[ServiceTermsPageViewController _hostAuditToken](self, "_hostAuditToken");
  v8 = v10;
  v9 = v11;
  if (sub_10000F240(&v8, CFSTR("com.apple.ios.StoreKit.terms-page"))
    || (v8 = v10, v9 = v11, sub_10000F240(&v8, kSSITunesStorePrivateEntitlement)))
  {
    v4 = 0;
    v5 = 1;
  }
  else
  {
    v7 = SSError(SSErrorDomain, 107, 0, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(v7);
    if (a3)
    {
      v4 = objc_retainAutorelease(v4);
      v5 = 0;
      *a3 = v4;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)_dismiss
{
  ServiceAlertProxy *remoteAlertProxy;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;

  -[ServiceAlertProxy setDelegate:](self->_remoteAlertProxy, "setDelegate:", 0);
  remoteAlertProxy = self->_remoteAlertProxy;
  self->_remoteAlertProxy = 0;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ServiceTermsPageViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v7, "setIdleTimerDisabled:forReason:", 0, v6);

  objc_msgSend(v7, "dismiss");
}

- (void)_dismissClientViewController
{
  _QWORD block[5];

  if (self->_underlyingViewController)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011490;
    block[3] = &unk_1000490B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_dismissWithAcceptance:(BOOL)a3
{
  id v5;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v5, "1", a3);
  -[ServiceAlertProxy finishWithResponse:](self->_remoteAlertProxy, "finishWithResponse:", v5);
  -[ServiceTermsPageViewController _dismiss](self, "_dismiss");

}

- (id)_remoteViewControllerProxy
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ServiceTermsPageViewController;
  v2 = -[ServiceTermsPageViewController _remoteViewControllerProxy](&v4, "_remoteViewControllerProxy");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)_showViewControllerForAlertProxy:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;
  id v10;
  SKTermsPageViewController *underlyingViewController;
  id v12;
  void *v13;
  SKTermsPageViewController *v14;
  SKTermsPageViewController *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  id v30;
  int v31;
  id v32;

  v5 = a3;
  objc_storeStrong((id *)&self->_remoteAlertProxy, a3);
  -[ServiceAlertProxy setDelegate:](self->_remoteAlertProxy, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "options"));
  v7 = (void *)SSXPCCreateCFObjectFromXPCObject();

  v8 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v30 = 0;
    v9 = -[ServiceTermsPageViewController _checkEntitlementsWithError:](self, "_checkEntitlementsWithError:", &v30);
    v10 = v30;
    if ((v9 & 1) != 0)
    {
      underlyingViewController = self->_underlyingViewController;
      if (underlyingViewController)
        goto LABEL_5;
      v12 = objc_alloc((Class)SKTermsPageViewController);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("terms")));
      v14 = (SKTermsPageViewController *)objc_msgSend(v12, "initWithTerms:", v13);
      v15 = self->_underlyingViewController;
      self->_underlyingViewController = v14;

      -[SKTermsPageViewController setDelegate:](self->_underlyingViewController, "setDelegate:", self);
      underlyingViewController = self->_underlyingViewController;
      if (underlyingViewController)
      {
LABEL_5:
        -[ServiceTermsPageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", underlyingViewController, 1, 0);
LABEL_29:

        goto LABEL_30;
      }
LABEL_28:
      -[ServiceTermsPageViewController _dismiss](self, "_dismiss", v29);
      goto LABEL_29;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v23 = objc_msgSend(v22, "shouldLog");
    if (objc_msgSend(v22, "shouldLogToDisk"))
      LODWORD(v24) = v23 | 2;
    else
      LODWORD(v24) = v23;
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "OSLogObject"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      v24 = v24;
    else
      v24 &= 2u;
    if ((_DWORD)v24)
    {
      v26 = (void *)objc_opt_class(self);
      v31 = 138412290;
      v32 = v26;
      v27 = v26;
      v28 = (void *)_os_log_send_and_compose_impl(v24, 0, 0, 0, &_mh_execute_header, v25, 0, "[%@]: Denying terms sheet for unentitled client.", &v31, 12);

      if (!v28)
      {
LABEL_27:

        goto LABEL_28;
      }
      v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4));
      free(v28);
      v29 = v25;
      SSFileLog(v22, CFSTR("%@"));
    }

    goto LABEL_27;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v17 = objc_msgSend(v16, "shouldLog");
  if (objc_msgSend(v16, "shouldLogToDisk"))
    LODWORD(v18) = v17 | 2;
  else
    LODWORD(v18) = v17;
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "OSLogObject"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    v18 = v18;
  else
    v18 &= 2u;
  if (!(_DWORD)v18)
    goto LABEL_15;
  v31 = 138412290;
  v32 = (id)objc_opt_class(self);
  v20 = v32;
  v21 = (void *)_os_log_send_and_compose_impl(v18, 0, 0, 0, &_mh_execute_header, v19, 0, "[%@]: Invalid alert proxy, dismissing.", &v31, 12);

  if (v21)
  {
    v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4));
    free(v21);
    SSFileLog(v16, CFSTR("%@"));
LABEL_15:

  }
  -[ServiceTermsPageViewController _dismiss](self, "_dismiss");
LABEL_30:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingViewController, 0);
  objc_storeStrong((id *)&self->_remoteAlertProxy, 0);
}

@end
