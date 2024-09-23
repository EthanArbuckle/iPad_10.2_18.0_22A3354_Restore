@implementation ServiceStorePageViewController

- (void)dealloc
{
  objc_super v3;

  -[SKUIStorePageViewController setDelegate:](self->_storePageViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ServiceStorePageViewController;
  -[ServiceStorePageViewController dealloc](&v3, "dealloc");
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKUIServiceStorePageViewController);
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKUIClientStorePageViewController);
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init((Class)UIView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceStorePageViewController _storePageViewController](self, "_storePageViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));

  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v5, "addSubview:", v4);
  -[ServiceStorePageViewController setView:](self, "setView:", v5);

}

- (void)_willAppearInRemoteViewController
{
  __int128 v3;

  -[ServiceStorePageViewController _hostAuditToken](self, "_hostAuditToken");
  self->_isEntitled = sub_10000F240(&v3, CFSTR("com.apple.ios.StoreKit.store-page"));
}

- (void)loadPageWithURLBagKey:(id)a3
{
  id v4;
  SSURLBag *v5;
  SSURLBag *urlBag;
  void *v7;
  SSURLBag *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  void *v19;
  _WORD v20[8];

  v4 = a3;
  if (!self->_isEntitled)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "OSLogObject"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      v15 = v13;
    else
      v15 = v13 & 2;
    if ((_DWORD)v15)
    {
      v20[0] = 0;
      v16 = (void *)_os_log_send_and_compose_impl(v15, 0, 0, 0, &_mh_execute_header, v14, 0, "[StorePage]: Denying load for unentitled client", v20, 2);

      if (!v16)
      {
LABEL_15:

        v9 = (id)objc_claimAutoreleasedReturnValue(-[ServiceStorePageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
        v17 = SSError(SSErrorDomain, 107, 0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v17);
        objc_msgSend(v9, "didFinishWithResult:error:", &__kCFBooleanFalse, v10);
        goto LABEL_16;
      }
      v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4));
      free(v16);
      SSFileLog(v11, CFSTR("%@"));
    }

    goto LABEL_15;
  }
  if (!self->_urlBag)
  {
    v5 = (SSURLBag *)objc_alloc_init((Class)SSURLBag);
    urlBag = self->_urlBag;
    self->_urlBag = v5;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", self));
  v8 = self->_urlBag;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100026474;
  v18[3] = &unk_1000498F8;
  v19 = v7;
  v9 = v7;
  -[SSURLBag loadValueForKey:completionBlock:](v8, "loadValueForKey:completionBlock:", v4, v18);
  v10 = v19;
LABEL_16:

}

- (void)loadPageWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  void *v17;
  _WORD v18[8];

  v4 = a3;
  if (!self->_isEntitled)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "OSLogObject"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      v13 = v11;
    else
      v13 = v11 & 2;
    if ((_DWORD)v13)
    {
      v18[0] = 0;
      v14 = (void *)_os_log_send_and_compose_impl(v13, 0, 0, 0, &_mh_execute_header, v12, 0, "[StorePage]: Denying load for unentitled client", v18, 2);

      if (!v14)
      {
LABEL_13:

        v7 = (id)objc_claimAutoreleasedReturnValue(-[ServiceStorePageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
        v15 = SSError(SSErrorDomain, 107, 0, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
        objc_msgSend(v7, "didFinishWithResult:error:", &__kCFBooleanFalse, v8);
        goto LABEL_14;
      }
      v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4));
      free(v14);
      SSFileLog(v9, CFSTR("%@"));
    }

    goto LABEL_13;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceStorePageViewController _storePageViewController](self, "_storePageViewController"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000267C0;
  v16[3] = &unk_100049EB0;
  v17 = v5;
  v7 = v5;
  objc_msgSend(v6, "loadURL:withCompletionBlock:", v4, v16);

  v8 = v17;
LABEL_14:

}

- (void)storePage:(id)a3 showProductPageForItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ServiceStorePageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  v6 = objc_msgSend(v5, "itemIdentifier");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v6));
  objc_msgSend(v8, "showProductPageWithItemIdentifier:", v7);

}

- (void)storePage:(id)a3 showStorePageForURL:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v5, "openURL:", v4);

}

- (void)_finishLoadWithResult:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  if (!v6 && !v4)
  {
    v7 = SSError(SSErrorDomain, 100, 0, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue(v7);
  }
  v10 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceStorePageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(v8, "didFinishWithResult:error:", v9, v10);

}

- (id)_storePageViewController
{
  SKUIClientContext *v3;
  SKUIClientContext *clientContext;
  SKUIStorePageViewController *storePageViewController;
  SKUIStorePageViewController *v6;
  SKUIStorePageViewController *v7;

  if (!self->_clientContext)
  {
    v3 = (SKUIClientContext *)objc_claimAutoreleasedReturnValue(+[SKUIClientContext defaultContext](SKUIClientContext, "defaultContext"));
    clientContext = self->_clientContext;
    self->_clientContext = v3;

  }
  storePageViewController = self->_storePageViewController;
  if (!storePageViewController)
  {
    v6 = (SKUIStorePageViewController *)objc_alloc_init((Class)SKUIStorePageViewController);
    v7 = self->_storePageViewController;
    self->_storePageViewController = v6;

    -[SKUIStorePageViewController setClientContext:](self->_storePageViewController, "setClientContext:", self->_clientContext);
    -[SKUIStorePageViewController setDelegate:](self->_storePageViewController, "setDelegate:", self);
    -[ServiceStorePageViewController addChildViewController:](self, "addChildViewController:", self->_storePageViewController);
    storePageViewController = self->_storePageViewController;
  }
  return storePageViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_storePageViewController, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
