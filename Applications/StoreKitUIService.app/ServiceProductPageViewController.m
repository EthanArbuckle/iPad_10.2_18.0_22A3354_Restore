@implementation ServiceProductPageViewController

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKUIServiceProductPageViewController);
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKUIClientProductPageViewController);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (ServiceProductPageViewController)init
{
  ServiceProductPageViewController *v2;
  NSMutableArray *v3;
  NSMutableArray *configurationActions;
  ServiceCardContainerViewController *v5;
  ServiceCardContainerViewController *cardContainerViewController;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *logKey;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ServiceProductPageViewController;
  v2 = -[ServiceProductPageViewController init](&v13, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    configurationActions = v2->_configurationActions;
    v2->_configurationActions = v3;

    v5 = objc_alloc_init(ServiceCardContainerViewController);
    cardContainerViewController = v2->_cardContainerViewController;
    v2->_cardContainerViewController = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("-")));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    logKey = v2->_logKey;
    v2->_logKey = (NSString *)v10;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSString *logKey;
  id v9;
  void *v10;
  objc_super v11;
  int v12;
  void *v13;
  __int16 v14;
  NSString *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    LODWORD(v5) = v4 | 2;
  else
    LODWORD(v5) = v4;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "OSLogObject"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 = v5;
  else
    v5 &= 2u;
  if (!(_DWORD)v5)
    goto LABEL_10;
  v7 = (void *)objc_opt_class(self);
  logKey = self->_logKey;
  v12 = 138543618;
  v13 = v7;
  v14 = 2114;
  v15 = logKey;
  v9 = v7;
  v10 = (void *)_os_log_send_and_compose_impl(v5, 0, 0, 0, &_mh_execute_header, v6, 0, "[%{public}@][%{public}@]: Dealloc.", &v12, 22);

  if (v10)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4));
    free(v10);
    SSFileLog(v3, CFSTR("%@"));
LABEL_10:

  }
  -[ServiceProductPageViewController _cleanUpExtension](self, "_cleanUpExtension");
  v11.receiver = self;
  v11.super_class = (Class)ServiceProductPageViewController;
  -[ServiceProductPageViewController dealloc](&v11, "dealloc");
}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init((Class)UIView);
  objc_msgSend(v4, "setAutoresizingMask:", 40);
  -[ServiceProductPageViewController setView:](self, "setView:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController errorViewController](self, "errorViewController"));

  if (!v3)
    -[ServiceProductPageViewController loadPlaceholder](self, "loadPlaceholder");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ServiceProductPageViewController;
  -[ServiceProductPageViewController viewDidAppear:](&v19, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_rootSheetPresentationController"));
  objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController desiredPresentationStyle](self, "desiredPresentationStyle"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController desiredPresentationStyle](self, "desiredPresentationStyle"));
    v9 = objc_msgSend(v8, "integerValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
    objc_msgSend(v10, "setModalPresentationStyle:", v9);

  }
  else
  {
    if (self->_preview)
      v11 = 0;
    else
      v11 = -2;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
    objc_msgSend(v8, "setModalPresentationStyle:", v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentationController"));

  objc_msgSend(v13, "setDelegate:", self);
  v14 = objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
  if (v14)
  {
    v15 = (void *)v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "presentingViewController"));

    if (!v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
      -[ServiceProductPageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, !self->_preview, 0);

    }
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", SKUIVideoPreviewDismissNotification, 0);

  v6 = objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentingViewController"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);

    }
  }
  v11.receiver = self;
  v11.super_class = (Class)ServiceProductPageViewController;
  -[ServiceProductPageViewController viewDidDisappear:](&v11, "viewDidDisappear:", v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ServiceProductPageViewController;
  -[ServiceProductPageViewController viewWillAppear:](&v3, "viewWillAppear:", a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ServiceProductPageViewController;
  -[ServiceProductPageViewController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[ServiceProductPageViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 1);
}

- (void)_willAppearInRemoteViewController
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  id v18;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  id v22[2];
  _BYTE location[12];
  __int16 v24;
  NSString *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  unsigned int v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier"));
  v4 = -[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    LODWORD(v7) = v6 | 2;
  else
    LODWORD(v7) = v6;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    v7 = v7;
  else
    v7 &= 2u;
  if ((_DWORD)v7)
  {
    v9 = (void *)objc_opt_class(self);
    logKey = self->_logKey;
    *(_DWORD *)location = 138544130;
    *(_QWORD *)&location[4] = v9;
    v24 = 2114;
    v25 = logKey;
    v26 = 2112;
    v27 = v3;
    v28 = 1024;
    v29 = v4;
    v11 = v9;
    v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Appearing in client: %@, entitled: %d", location, 38);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v5, CFSTR("%@"));

    }
  }
  else
  {

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v3));
  v15 = objc_msgSend(v14, "profileValidated");
  objc_initWeak((id *)location, self);
  v16 = -[NSString copy](self->_logKey, "copy");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100019F8C;
  v20[3] = &unk_100049A10;
  objc_copyWeak(v22, (id *)location);
  v17 = (void *)v15;
  v18 = v16;
  v21 = v18;
  v22[1] = v17;
  -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v20);
  v19.receiver = self;
  v19.super_class = (Class)ServiceProductPageViewController;
  -[ServiceProductPageViewController _willAppearInRemoteViewController](&v19, "_willAppearInRemoteViewController");

  objc_destroyWeak(v22);
  objc_destroyWeak((id *)location);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ServiceProductPageViewController;
  -[ServiceProductPageViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v4, "willTransitionToTraitCollection:withTransitionCoordinator:", a3, a4);
}

- (void)productPageRemoteViewController:(id)a3 finishWithResult:(unint64_t)a4 completion:(id)a5
{
  uint64_t v5;

  if (a4 > 3)
    v5 = 1;
  else
    v5 = qword_100034B68[a4];
  -[ServiceProductPageViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", v5);
}

- (void)productPageRemoteViewControllerLoadDidFinish:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, BOOL);
  void (**v10)(id, BOOL);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController remoteContainerViewController](self, "remoteContainerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
  objc_msgSend(v7, "setRemoteViewController:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController remoteContainerViewController](self, "remoteContainerViewController"));
  -[ServiceProductPageViewController _setupChildViewController:animated:](self, "_setupChildViewController:animated:", v8, 0);

  v9 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController remoteLoadDidFinishCompletion](self, "remoteLoadDidFinishCompletion"));
  if (v9)
  {
    v10 = v9;
    -[ServiceProductPageViewController setRemoteLoadDidFinishCompletion:](self, "setRemoteLoadDidFinishCompletion:", 0);
    v10[2](v10, a3 == 0);
    v9 = v10;
    if (!a3)
    {
      -[ServiceProductPageViewController _cleanUpExtension](self, "_cleanUpExtension");
      v9 = v10;
    }
  }

}

- (void)productPageRemoteViewController:(id)a3 userDidInteractWithProduct:(unint64_t)a4
{
  id v6;
  NSString *logKey;
  void *v8;
  void *v9;
  int v10;
  ServiceProductPageViewController *v11;
  __int16 v12;
  NSString *v13;

  v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = logKey;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Product page user did interact with product.", (uint8_t *)&v10, 0x16u);
  }
  if (a4 >= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100029BF8((uint64_t)self, a4);
  }
  else if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    objc_msgSend(v8, "userDidInteractWithProduct:", v9);

  }
}

- (void)productPageRemoteViewController:(id)a3 didTerminateWithError:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController remoteContainerViewController](self, "remoteContainerViewController"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteViewController"));

  if (v7 == v5)
    -[ServiceProductPageViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 1);
}

- (void)finishImmediately
{
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
    -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", &stru_100049A50);
  else
    -[ServiceProductPageViewController _sendUnentitledErrorResponse](self, "_sendUnentitledErrorResponse");
}

- (void)dismissViewControllerAnimated:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
  v6 = objc_msgSend(v4, "BOOLValue");

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A574;
  v7[3] = &unk_1000490B8;
  v7[4] = self;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v6, v7);

}

- (void)finishStarRatingPromptWithRating:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001A61C;
  v5[3] = &unk_100049A78;
  v6 = a3;
  v4 = v6;
  -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v5);

}

- (void)loadPlaceholder
{
  id v3;
  dispatch_time_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  ServiceProductPageViewController *v13;
  id v14;

  if (!self->_isRemoteViewControllerReady && !self->_storeProductViewController)
  {
    v3 = objc_msgSend(objc_alloc((Class)SKUILoadingViewController), "initWithClientContext:", 0);
    v4 = dispatch_time(0, 3000000000);
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_10001A748;
    v12 = &unk_100049590;
    v13 = self;
    v14 = v3;
    v5 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, &v9);
    v6 = objc_alloc((Class)UINavigationController);
    v7 = objc_msgSend(v6, "initWithRootViewController:", v5, v9, v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));
    objc_msgSend(v8, "setAccessibilityIgnoresInvertColors:", 1);

    -[ServiceProductPageViewController setPlaceholderViewController:](self, "setPlaceholderViewController:", v7);
    -[ServiceProductPageViewController _setupChildViewController:animated:](self, "_setupChildViewController:animated:", v7, 0);

  }
}

- (void)loadProductWithPageDictionary:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001A8E4;
    v5[3] = &unk_100049A78;
    v6 = v4;
    -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v5);

  }
  else
  {
    -[ServiceProductPageViewController _sendUnentitledErrorResponse](self, "_sendUnentitledErrorResponse");
  }

}

- (void)loadProductWithParameters:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    LODWORD(v7) = v6 | 2;
  else
    LODWORD(v7) = v6;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    v7 = v7;
  else
    v7 &= 2u;
  if ((_DWORD)v7)
  {
    v9 = (void *)objc_opt_class(self);
    logKey = self->_logKey;
    v18 = 138543874;
    v19 = v9;
    v20 = 2114;
    v21 = logKey;
    v22 = 2112;
    v23 = v4;
    v11 = v9;
    v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 0, "[%{public}@][%{public}@]: Loading product with parameters: %@", &v18, 32);

    if (!v12)
      goto LABEL_11;
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
    free(v12);
    v17 = v8;
    SSFileLog(v5, CFSTR("%@"));
  }

LABEL_11:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", SKStoreProductParameterITunesItemIdentifier));
  if (v13
    && ((v14 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v13, v14) & 1) == 0)
     || objc_msgSend(v13, "length"))
    && ((v15 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v13, v15) & 1) == 0)
     || objc_msgSend(v13, "integerValue")))
  {
    v16 = objc_msgSend(v4, "mutableCopy", v17);
    objc_msgSend(v16, "removeObjectForKey:", SKStoreProductParameterITunesItemIdentifier);
    -[ServiceProductPageViewController _loadProductWithIdentifier:parameters:](self, "_loadProductWithIdentifier:parameters:", v13, v16);

  }
  else
  {
    -[ServiceProductPageViewController _respondWithSuccess:](self, "_respondWithSuccess:", 0, v17);
  }

}

- (void)_loadProductWithIdentifier:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001AC34;
  v10[3] = &unk_100049AA0;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[ServiceProductPageViewController _loadProductWithIdentifier:parameters:completion:](self, "_loadProductWithIdentifier:parameters:completion:", v8, v9, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_showLegacyControllerForProductID:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSString *logKey;
  id v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    LODWORD(v10) = v9 | 2;
  else
    LODWORD(v10) = v9;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "OSLogObject"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    v10 = v10;
  else
    v10 &= 2u;
  if (!(_DWORD)v10)
    goto LABEL_10;
  v12 = (void *)objc_opt_class(self);
  logKey = self->_logKey;
  v18 = 138543874;
  v19 = v12;
  v20 = 2114;
  v21 = logKey;
  v22 = 2114;
  v23 = v6;
  v14 = v12;
  v15 = (void *)_os_log_send_and_compose_impl(v10, 0, 0, 0, &_mh_execute_header, v11, 0, "[%{public}@][%{public}@]: Attempting to load item %{public}@ with the legacy controller.", &v18, 32);

  if (v15)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4));
    free(v15);
    SSFileLog(v8, CFSTR("%@"));
LABEL_10:

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController _setupProductPageViewController](self, "_setupProductPageViewController"));
  v17 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v7);

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v6, SKStoreProductParameterITunesItemIdentifier);
  objc_msgSend(v16, "loadProductWithParameters:", v17);

}

- (void)loadProductWithRequest:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    objc_initWeak(&location, self);
    v5 = -[NSString copy](self->_logKey, "copy");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001B0E4;
    v7[3] = &unk_100049AC8;
    objc_copyWeak(&v10, &location);
    v6 = v5;
    v8 = v6;
    v9 = v4;
    -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    -[ServiceProductPageViewController _sendUnentitledErrorResponse](self, "_sendUnentitledErrorResponse");
  }

}

- (void)loadProductWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSString *logKey;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  int v37;
  void *v38;
  __int16 v39;
  NSString *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invertedSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7));

    if (!objc_msgSend(v8, "length"))
    {
      -[ServiceProductPageViewController _respondWithSuccess:](self, "_respondWithSuccess:", 0);
      goto LABEL_25;
    }
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v4, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "queryItems"));
    v12 = objc_msgSend(v11, "count");

    v32 = v10;
    if (v12)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "queryItems"));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "value"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
            objc_msgSend(v9, "setObject:forKey:", v19, v20);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        }
        while (v15);
      }

      v10 = v32;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v22 = objc_msgSend(v21, "shouldLog");
    if (objc_msgSend(v21, "shouldLogToDisk"))
      v23 = v22 | 2;
    else
      v23 = v22;
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "OSLogObject"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      v25 = v23;
    else
      v25 = v23 & 2;
    if ((_DWORD)v25)
    {
      v26 = (void *)objc_opt_class(self);
      v27 = v8;
      logKey = self->_logKey;
      v31 = v26;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
      v37 = 138544130;
      v38 = v26;
      v10 = v32;
      v39 = 2114;
      v40 = logKey;
      v8 = v27;
      v41 = 2112;
      v42 = v29;
      v43 = 2112;
      v44 = v9;
      v30 = (void *)_os_log_send_and_compose_impl(v25, 0, 0, 0, &_mh_execute_header, v24, 0, "[%{public}@][%{public}@]: Requested product with URL: %@. Parameters: %@", &v37, 42);

      if (!v30)
      {
LABEL_22:

        -[ServiceProductPageViewController _loadProductWithIdentifier:parameters:](self, "_loadProductWithIdentifier:parameters:", v8, v9);
LABEL_25:

        goto LABEL_26;
      }
      v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4));
      free(v30);
      SSFileLog(v21, CFSTR("%@"));
    }

    goto LABEL_22;
  }
  -[ServiceProductPageViewController _sendUnentitledErrorResponse](self, "_sendUnentitledErrorResponse");
LABEL_26:

}

- (void)setAdditionalBuyParameters:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v9 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = logKey;
      v19 = 2112;
      v20 = v4;
      v11 = v9;
      v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting additional buy parameters: %@", &v15, 32);

      if (!v12)
      {
LABEL_12:

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10001B834;
        v13[3] = &unk_100049A78;
        v14 = v4;
        -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v13);

        goto LABEL_13;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setAffiliateIdentifier:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v9 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = logKey;
      v19 = 2112;
      v20 = v4;
      v11 = v9;
      v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting affiliateID: %@", &v15, 32);

      if (!v12)
      {
LABEL_12:

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10001BA28;
        v13[3] = &unk_100049A78;
        v14 = v4;
        -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v13);

        goto LABEL_13;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setAskToBuy:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  int v16;
  void *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  id v21;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v9 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      v16 = 138543874;
      v17 = v9;
      v18 = 2114;
      v19 = logKey;
      v20 = 2112;
      v21 = v4;
      v11 = v9;
      v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting ask to buy: %@", &v16, 32);

      if (!v12)
      {
LABEL_12:

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001BC34;
        v14[3] = &unk_100049A78;
        v13 = v4;
        v15 = v13;
        -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v14);
        -[ServiceProductPageViewController setIsAskToBuy:](self, "setIsAskToBuy:", objc_msgSend(v13, "BOOLValue"));

        goto LABEL_13;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setCancelButtonTitle:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v9 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = logKey;
      v19 = 2112;
      v20 = v4;
      v11 = v9;
      v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting cancel button title: %@", &v15, 32);

      if (!v12)
      {
LABEL_12:

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10001BE60;
        v13[3] = &unk_100049A78;
        v14 = v4;
        -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v13);

        goto LABEL_13;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v9 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = logKey;
      v19 = 2112;
      v20 = v4;
      v11 = v9;
      v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting clientID: %@", &v15, 32);

      if (!v12)
      {
LABEL_12:

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10001C054;
        v13[3] = &unk_100049A78;
        v14 = v4;
        -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v13);

        goto LABEL_13;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setHostBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSString *logKey;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  id v19;

  v5 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      LODWORD(v8) = v7 | 2;
    else
      LODWORD(v8) = v7;
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "OSLogObject"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      v8 = v8;
    else
      v8 &= 2u;
    if ((_DWORD)v8)
    {
      v10 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      v14 = 138543874;
      v15 = v10;
      v16 = 2114;
      v17 = logKey;
      v18 = 2112;
      v19 = v5;
      v12 = v10;
      v13 = (void *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v9, 2, "[%{public}@][%{public}@]: Setting hostBundleIdentifier: %@", &v14, 32);

      if (!v13)
      {
LABEL_12:

        objc_storeStrong((id *)&self->_hostApplicationBundleIdentifierOverride, a3);
        goto LABEL_13;
      }
      v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4));
      free(v13);
      SSFileLog(v6, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setProductPageStyle:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v9 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = logKey;
      v19 = 2112;
      v20 = v4;
      v11 = v9;
      v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting page style: %@", &v15, 32);

      if (!v12)
      {
LABEL_12:

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10001C408;
        v13[3] = &unk_100049A78;
        v14 = v4;
        -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v13);

        goto LABEL_13;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setPromptString:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v9 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = logKey;
      v19 = 2112;
      v20 = v4;
      v11 = v9;
      v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting prompt string: %@", &v15, 32);

      if (!v12)
      {
LABEL_12:

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10001C5FC;
        v13[3] = &unk_100049A78;
        v14 = v4;
        -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v13);

        goto LABEL_13;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setRightBarButtonTitle:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v9 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = logKey;
      v19 = 2112;
      v20 = v4;
      v11 = v9;
      v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting right bar button title: %@", &v15, 32);

      if (!v12)
      {
LABEL_12:

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10001C7F0;
        v13[3] = &unk_100049A78;
        v14 = v4;
        -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v13);

        goto LABEL_13;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setScriptContextDictionary:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v9 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = logKey;
      v19 = 2112;
      v20 = v4;
      v11 = v9;
      v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting context dictionary: %@", &v15, 32);

      if (!v12)
      {
LABEL_12:

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10001C9E4;
        v13[3] = &unk_100049A78;
        v14 = v4;
        -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v13);

        goto LABEL_13;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setPreview:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  int v16;
  void *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    LODWORD(v7) = v6 | 2;
  else
    LODWORD(v7) = v6;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    v7 = v7;
  else
    v7 &= 2u;
  if (!(_DWORD)v7)
    goto LABEL_10;
  v9 = (void *)objc_opt_class(self);
  logKey = self->_logKey;
  v16 = 138543874;
  v17 = v9;
  v18 = 2114;
  v19 = logKey;
  v20 = 2112;
  v21 = v4;
  v11 = v9;
  v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting preview mode: %@", &v16, 32);

  if (v12)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
    free(v12);
    SSFileLog(v5, CFSTR("%@"));
LABEL_10:

  }
  self->_preview = objc_msgSend(v4, "BOOLValue");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001CBE4;
  v14[3] = &unk_100049A78;
  v15 = v4;
  v13 = v4;
  -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v14);

}

- (void)setPresentationStyle:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    LODWORD(v7) = v6 | 2;
  else
    LODWORD(v7) = v6;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    v7 = v7;
  else
    v7 &= 2u;
  if (!(_DWORD)v7)
    goto LABEL_10;
  v9 = (void *)objc_opt_class(self);
  logKey = self->_logKey;
  v13 = 138543874;
  v14 = v9;
  v15 = 2114;
  v16 = logKey;
  v17 = 2112;
  v18 = v4;
  v11 = v9;
  v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting presentation style: %@", &v13, 32);

  if (v12)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
    free(v12);
    SSFileLog(v5, CFSTR("%@"));
LABEL_10:

  }
  -[ServiceProductPageViewController setDesiredPresentationStyle:](self, "setDesiredPresentationStyle:", v4);

}

- (void)setUsageContext:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v9 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = logKey;
      v19 = 2112;
      v20 = v4;
      v11 = v9;
      v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting usageContext: %@", &v15, 32);

      if (!v12)
      {
LABEL_12:

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10001CF78;
        v13[3] = &unk_100049A78;
        v14 = v4;
        -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v13);

        goto LABEL_13;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setShowsRightBarButton:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v9 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = logKey;
      v19 = 2112;
      v20 = v4;
      v11 = v9;
      v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting shows right button: %@", &v15, 32);

      if (!v12)
      {
LABEL_12:

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10001D16C;
        v13[3] = &unk_100049A78;
        v14 = v4;
        -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v13);

        goto LABEL_13;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setShowsStoreButton:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  if (-[ServiceProductPageViewController _isClientEntitled](self, "_isClientEntitled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v9 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = logKey;
      v19 = 2112;
      v20 = v4;
      v11 = v9;
      v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 2, "[%{public}@][%{public}@]: Setting shows store button: %@", &v15, 32);

      if (!v12)
      {
LABEL_12:

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10001D398;
        v13[3] = &unk_100049A78;
        v14 = v4;
        -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v13);

        goto LABEL_13;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setVisibleInClientWindow:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  objc_storeStrong((id *)&self->_visibleInClientWindow, a3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D478;
  v7[3] = &unk_100049A78;
  v8 = v5;
  v6 = v5;
  -[ServiceProductPageViewController _addConfigurationAction:](self, "_addConfigurationAction:", v7);

}

- (void)_cancelButtonAction:(id)a3
{
  -[ServiceProductPageViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", -[ServiceProductPageViewController isAskToBuy](self, "isAskToBuy", a3));
}

- (void)_loadProductWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = -[NSString copy](self->_logKey, "copy");
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001D694;
  v24[3] = &unk_100049B40;
  objc_copyWeak(&v29, &location);
  v12 = v9;
  v25 = v12;
  v13 = v10;
  v28 = v13;
  v14 = v11;
  v26 = v14;
  v15 = v8;
  v27 = v15;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001DA84;
  v19[3] = &unk_100049B68;
  objc_copyWeak(&v23, &location);
  v16 = v14;
  v20 = v16;
  v17 = v15;
  v21 = v17;
  v18 = v13;
  v22 = v18;
  -[ServiceProductPageViewController _lookupItemWithIdentifier:success:failure:](self, "_lookupItemWithIdentifier:success:failure:", v17, v24, v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
}

- (void)_lookupItemWithIdentifier:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSString *logKey;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _BYTE location[12];
  __int16 v39;
  NSString *v40;
  __int16 v41;
  id v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v12 = objc_msgSend(v11, "shouldLog");
  if (objc_msgSend(v11, "shouldLogToDisk"))
    LODWORD(v13) = v12 | 2;
  else
    LODWORD(v13) = v12;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "OSLogObject"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    v13 = v13;
  else
    v13 &= 2u;
  if ((_DWORD)v13)
  {
    v15 = (void *)objc_opt_class(self);
    logKey = self->_logKey;
    *(_DWORD *)location = 138543874;
    *(_QWORD *)&location[4] = v15;
    v39 = 2114;
    v40 = logKey;
    v41 = 2114;
    v42 = v8;
    v17 = v15;
    v18 = (void *)_os_log_send_and_compose_impl(v13, 0, 0, 0, &_mh_execute_header, v14, 0, "[%{public}@][%{public}@]: Performing lookup for %{public}@", location, 32);

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4));
      free(v18);
      SSFileLog(v11, CFSTR("%@"));

    }
  }
  else
  {

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", CFSTR("appstored"), CFSTR("1")));
  if (-[ServiceProductPageViewController isAskToBuy](self, "isAskToBuy"))
    v21 = CFSTR("product-dv");
  else
    v21 = CFSTR("lockup-dv");
  v22 = objc_msgSend(objc_alloc((Class)AMSLookup), "initWithBag:caller:keyProfile:", v20, CFSTR("com.apple.appstored"), v21);
  objc_msgSend(v22, "setPlatform:", CFSTR("omni"));
  v23 = objc_msgSend(objc_alloc((Class)AMSProcessInfo), "initWithBundleIdentifier:", CFSTR("com.apple.appstored"));
  objc_msgSend(v22, "setClientInfo:", v23);
  v37 = v8;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "performLookupWithBundleIdentifiers:itemIdentifiers:", 0, v24));

  v26 = -[NSString copy](self->_logKey, "copy");
  objc_initWeak((id *)location, self);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10001E148;
  v31[3] = &unk_100049B90;
  objc_copyWeak(&v36, (id *)location);
  v27 = v26;
  v32 = v27;
  v28 = v8;
  v33 = v28;
  v29 = v10;
  v34 = v29;
  v30 = v9;
  v35 = v30;
  objc_msgSend(v25, "addFinishBlock:", v31);

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)location);

}

- (void)_requestRemoteViewControllerForItem:(id)a3 withParameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location;
  uint64_t v27;
  const __CFString *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ServiceProductPageViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &stru_100049BD0, 3.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController remoteContainerViewController](self, "remoteContainerViewController"));

  if (v11)
  {
    -[ServiceProductPageViewController _cleanUpExtension](self, "_cleanUpExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController remoteContainerViewController](self, "remoteContainerViewController"));
    objc_msgSend(v12, "invalidate");

    -[ServiceProductPageViewController setRemoteContainerViewController:](self, "setRemoteContainerViewController:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController visibleInClientWindow](self, "visibleInClientWindow"));
    -[ServiceProductPageViewController setVisibleInClientWindow:](self, "setVisibleInClientWindow:", v13);

  }
  v14 = -[NSString copy](self->_logKey, "copy");
  objc_initWeak(&location, self);
  v27 = NSExtensionPointName;
  v28 = CFSTR("com.apple.storekit.product-page");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001E718;
  v20[3] = &unk_100049C70;
  objc_copyWeak(&v25, &location);
  v16 = v10;
  v24 = v16;
  v17 = v8;
  v21 = v17;
  v18 = v14;
  v22 = v18;
  v19 = v9;
  v23 = v19;
  +[NSExtension extensionsWithMatchingAttributes:completion:](NSExtension, "extensionsWithMatchingAttributes:completion:", v15, v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (void)_didReceiveRemoteViewController:(id)a3 forItem:(id)a4 withParameters:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v15, "setDelegate:", self);
  -[ServiceProductPageViewController _endDelayingPresentation](self, "_endDelayingPresentation");
  self->_isRemoteViewControllerReady = 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier"));
  v11 = objc_msgSend(CFSTR("com.apple.Spotlight"), "isEqualToString:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v11 && v13 == (id)1)
    objc_msgSend(v15, "_setViewClipsToBounds:", 0);
  -[ServiceProductPageViewController _executeConfigurationActionsWithServiceProductPage:](self, "_executeConfigurationActionsWithServiceProductPage:", v15);
  if (v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serviceViewControllerProxy"));
    objc_msgSend(v14, "clientLookupItemDidLoad:parameters:", v8, v9);

  }
}

- (id)_setupErrorViewController
{
  ServiceErrorViewController *v3;
  void *v4;
  void *v5;

  v3 = -[ServiceErrorViewController initWithActionBlock:]([ServiceErrorViewController alloc], "initWithActionBlock:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceErrorViewController view](v3, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[ServiceProductPageViewController _setupChildViewController:animated:](self, "_setupChildViewController:animated:", v3, 0);
  -[ServiceProductPageViewController setErrorViewController:](self, "setErrorViewController:", v3);
  return v3;
}

- (void)_setupChildViewController:(id)a3 animated:(BOOL)a4
{
  void *v5;
  char IsDescendent;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
  IsDescendent = SKUIViewControllerIsDescendent(v9, v5);

  if ((IsDescendent & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController errorViewController](self, "errorViewController"));

    if (v7)
      -[ServiceProductPageViewController setErrorViewController:](self, "setErrorViewController:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
    objc_msgSend(v8, "setChildViewController:", v9);

  }
}

- (void)_addConfigurationAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *configurationActions;
  void *v8;
  id v9;
  id v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (self->_storeProductViewController)
  {
    (*((void (**)(id))v4 + 2))(v4);
LABEL_7:
    v8 = v11;
    goto LABEL_8;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceResilientRemoteViewContainerViewController remoteViewController](self->_remoteContainerViewController, "remoteViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceResilientRemoteViewContainerViewController remoteViewController](self->_remoteContainerViewController, "remoteViewController"));
    (*((void (**)(id, void *))v11 + 2))(v11, v6);

    goto LABEL_7;
  }
  configurationActions = self->_configurationActions;
  v8 = v11;
  if (configurationActions)
  {
    v9 = objc_msgSend(v11, "copy");
    v10 = objc_retainBlock(v9);
    -[NSMutableArray addObject:](configurationActions, "addObject:", v10);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)_executeConfigurationActionsWithServiceProductPage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController configurationActions](self, "configurationActions"));
  v6 = objc_alloc_init((Class)NSMutableArray);
  -[ServiceProductPageViewController setConfigurationActions:](self, "setConfigurationActions:", v6);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)_isClientEntitled
{
  __int128 v3;

  -[ServiceProductPageViewController _hostAuditToken](self, "_hostAuditToken");
  return sub_10000F240(&v3, kSSITunesStorePrivateEntitlement);
}

- (id)_hostApplicationBundleIdentifier
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController hostApplicationBundleIdentifierOverride](self, "hostApplicationBundleIdentifierOverride"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController hostApplicationBundleIdentifierOverride](self, "hostApplicationBundleIdentifierOverride"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ServiceProductPageViewController;
    v5 = -[ServiceProductPageViewController _hostApplicationBundleIdentifier](&v7, "_hostApplicationBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  return v4;
}

- (void)_sendDidFinishWithResult:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001F740;
  v6[3] = &unk_100049C98;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

}

- (void)_respondWithSuccess:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
    objc_msgSend(v5, "loadDidFinishWithResult:error:", &__kCFBooleanTrue, 0);
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SKErrorDomain, 5, 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
    objc_msgSend(v4, "loadDidFinishWithResult:error:", &__kCFBooleanFalse, v5);

  }
}

- (void)_sendUnentitledErrorResponse
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSString *logKey;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    LODWORD(v5) = v4 | 2;
  else
    LODWORD(v5) = v4;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "OSLogObject"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 = v5;
  else
    v5 &= 2u;
  if (!(_DWORD)v5)
    goto LABEL_10;
  v7 = (void *)objc_opt_class(self);
  logKey = self->_logKey;
  v9 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier"));
  v14 = 138543874;
  v15 = v7;
  v16 = 2114;
  v17 = logKey;
  v18 = 2112;
  v19 = v10;
  v11 = (void *)_os_log_send_and_compose_impl(v5, 0, 0, 0, &_mh_execute_header, v6, 0, "[%{public}@][%{public}@]: Rejecting unentitled request from client: %@", &v14, 32);

  if (v11)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4));
    free(v11);
    SSFileLog(v3, CFSTR("%@"));
LABEL_10:

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SKErrorDomain, 5, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  objc_msgSend(v13, "loadDidFinishWithResult:error:", &__kCFBooleanFalse, v12);

}

- (BOOL)_shouldLayoutAsOverlayWithTraitCollection:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = (unint64_t)objc_msgSend(v4, "userInterfaceIdiom");

  v6 = (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 && objc_msgSend(v3, "horizontalSizeClass") == (id)2;
  return v6;
}

- (void)_cleanUpExtension
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  NSObject *v7;
  uint64_t v8;
  NSString *logKey;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  ServiceProductPageViewController *v16;
  __int16 v17;
  NSString *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController extension](self, "extension"));

  if (!v3)
    return;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "OSLogObject"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (!(_DWORD)v8)
    goto LABEL_11;
  logKey = self->_logKey;
  v15 = 138543618;
  v16 = self;
  v17 = 2114;
  v18 = logKey;
  v10 = (void *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v7, 0, "[%{public}@][%{public}@]: Cleanup duties performed.", &v15, 22);

  if (v10)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4));
    free(v10);
    v14 = v7;
    SSFileLog(v4, CFSTR("%@"));
LABEL_11:

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController extensionRequest](self, "extensionRequest"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController extension](self, "extension"));
    objc_msgSend(v12, "cancelExtensionRequestWithIdentifier:", self->_extensionRequest);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController extension](self, "extension", v14));
  objc_msgSend(v13, "_kill:", 9);

  -[ServiceProductPageViewController setExtension:](self, "setExtension:", 0);
}

- (void)_makeItemKindEventForItem:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSString *logKey;
  id v14;
  void *v15;
  _TtC17StoreKitUIService18ProductLookupEvent *v16;
  int v17;
  void *v18;
  __int16 v19;
  NSString *v20;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    LODWORD(v10) = v9 | 2;
  else
    LODWORD(v10) = v9;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "OSLogObject"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    v10 = v10;
  else
    v10 &= 2u;
  if (!(_DWORD)v10)
    goto LABEL_10;
  v12 = (void *)objc_opt_class(self);
  logKey = self->_logKey;
  v17 = 138543618;
  v18 = v12;
  v19 = 2114;
  v20 = logKey;
  v14 = v12;
  v15 = (void *)_os_log_send_and_compose_impl(v10, 0, 0, 0, &_mh_execute_header, v11, 2, "[%{public}@][%{public}@]: Sending analytics event.", &v17, 22);

  if (v15)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4));
    free(v15);
    SSFileLog(v8, CFSTR("%@"));
LABEL_10:

  }
  v16 = objc_alloc_init(_TtC17StoreKitUIService18ProductLookupEvent);
  -[ProductLookupEvent configureWithItem:compatibleExtension:](v16, "configureWithItem:compatibleExtension:", v7, v6);

  +[objc_AnalyticsManager sendEvent:](_TtC17StoreKitUIService21objc_AnalyticsManager, "sendEvent:", v16);
}

- (id)_setupProductPageViewController
{
  ServiceStoreProductViewController *v3;
  ServiceStoreProductViewController *storeProductViewController;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[ServiceStoreProductViewController initWithNibName:bundle:]([ServiceStoreProductViewController alloc], "initWithNibName:bundle:", 0, 0);
  storeProductViewController = self->_storeProductViewController;
  self->_storeProductViewController = v3;

  -[ServiceStoreProductViewController setShouldShowOnboarding:](self->_storeProductViewController, "setShouldShowOnboarding:", 1);
  -[ServiceProductPageViewController _executeConfigurationActionsWithServiceProductPage:](self, "_executeConfigurationActionsWithServiceProductPage:", self->_storeProductViewController);
  -[ServiceStoreProductViewController setDelegate:](self->_storeProductViewController, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageViewController cardContainerViewController](self, "cardContainerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v6, "setBackgroundColor:", v7);

  -[ServiceProductPageViewController _setupChildViewController:animated:](self, "_setupChildViewController:animated:", self->_storeProductViewController, 0);
  return self->_storeProductViewController;
}

- (void)serviceProductPageViewControllerFinishWithResult:(int64_t)a3
{
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSString *logKey;
  id v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  int64_t v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    LODWORD(v7) = v6 | 2;
  else
    LODWORD(v7) = v6;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    v7 = v7;
  else
    v7 &= 2u;
  if (!(_DWORD)v7)
    goto LABEL_10;
  v9 = (void *)objc_opt_class(self);
  logKey = self->_logKey;
  v13 = 138543874;
  v14 = v9;
  v15 = 2114;
  v16 = logKey;
  v17 = 2048;
  v18 = a3;
  v11 = v9;
  v12 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 0, "[%{public}@][%{public}@]: Legacy product page finished with result: %ld", &v13, 32);

  if (v12)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
    free(v12);
    SSFileLog(v5, CFSTR("%@"));
LABEL_10:

  }
  -[ServiceProductPageViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", a3);
}

- (void)showPageForLookupResult:(id)a3 productID:(id)a4 parameters:(id)a5 logKey:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_msgSend(objc_alloc((Class)AMSLookupItem), "initWithLookupDictionary:", v12);
  objc_initWeak(&location, self);
  v18 = -[NSString copy](self->_logKey, "copy");
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000202A0;
  v24[3] = &unk_100049CE8;
  objc_copyWeak(&v30, &location);
  v19 = v18;
  v25 = v19;
  v20 = v15;
  v26 = v20;
  v21 = v13;
  v27 = v21;
  v22 = v16;
  v29 = v22;
  v23 = v14;
  v28 = v23;
  -[ServiceProductPageViewController _requestRemoteViewControllerForItem:withParameters:completion:](self, "_requestRemoteViewControllerForItem:withParameters:completion:", v17, v23, v24);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (void)showErrorPageWithCompletion:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002078C;
  v4[3] = &unk_100049D10;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (UIViewController)errorViewController
{
  return self->_errorViewController;
}

- (void)setErrorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_errorViewController, a3);
}

- (UINavigationController)placeholderViewController
{
  return self->_placeholderViewController;
}

- (void)setPlaceholderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderViewController, a3);
}

- (BOOL)isRemoteViewControllerReady
{
  return self->_isRemoteViewControllerReady;
}

- (void)setIsRemoteViewControllerReady:(BOOL)a3
{
  self->_isRemoteViewControllerReady = a3;
}

- (NSNumber)desiredPresentationStyle
{
  return self->_desiredPresentationStyle;
}

- (void)setDesiredPresentationStyle:(id)a3
{
  objc_storeStrong((id *)&self->_desiredPresentationStyle, a3);
}

- (NSMutableArray)configurationActions
{
  return self->_configurationActions;
}

- (void)setConfigurationActions:(id)a3
{
  objc_storeStrong((id *)&self->_configurationActions, a3);
}

- (ServiceResilientRemoteViewContainerViewController)remoteContainerViewController
{
  return self->_remoteContainerViewController;
}

- (void)setRemoteContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteContainerViewController, a3);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (NSCopying)extensionRequest
{
  return self->_extensionRequest;
}

- (void)setExtensionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_extensionRequest, a3);
}

- (BOOL)isAskToBuy
{
  return self->_isAskToBuy;
}

- (void)setIsAskToBuy:(BOOL)a3
{
  self->_isAskToBuy = a3;
}

- (NSNumber)visibleInClientWindow
{
  return self->_visibleInClientWindow;
}

- (NSString)hostApplicationBundleIdentifierOverride
{
  return self->_hostApplicationBundleIdentifierOverride;
}

- (void)setHostApplicationBundleIdentifierOverride:(id)a3
{
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifierOverride, a3);
}

- (ServiceCardContainerViewController)cardContainerViewController
{
  return self->_cardContainerViewController;
}

- (void)setCardContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cardContainerViewController, a3);
}

- (id)remoteLoadDidFinishCompletion
{
  return self->_remoteLoadDidFinishCompletion;
}

- (void)setRemoteLoadDidFinishCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteLoadDidFinishCompletion, 0);
  objc_storeStrong((id *)&self->_cardContainerViewController, 0);
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifierOverride, 0);
  objc_storeStrong((id *)&self->_visibleInClientWindow, 0);
  objc_storeStrong((id *)&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_remoteContainerViewController, 0);
  objc_storeStrong((id *)&self->_configurationActions, 0);
  objc_storeStrong((id *)&self->_desiredPresentationStyle, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_errorViewController, 0);
  objc_storeStrong((id *)&self->_storeProductViewController, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end
