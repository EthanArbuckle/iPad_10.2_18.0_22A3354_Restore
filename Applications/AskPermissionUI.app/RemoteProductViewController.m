@implementation RemoteProductViewController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RemoteProductViewController;
  -[RemoteProductViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_activeiTunesAccountForMediaType:", AMSAccountMediaTypeProduction));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100001910;
  v7[3] = &unk_100014440;
  v7[4] = self;
  objc_msgSend(v5, "addSuccessBlock:", v7);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", CFSTR("AskPermission"), CFSTR("1")));
  -[RemoteProductViewController setBag:](self, "setBag:", v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;

  v12.receiver = self;
  v12.super_class = (Class)RemoteProductViewController;
  -[RemoteProductViewController viewDidAppear:](&v12, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previewURL"));

  if (v5)
  {
    -[RemoteProductViewController _presentWebProductViewController](self, "_presentWebProductViewController");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifier"));

    if (v7)
    {
      -[RemoteProductViewController _presentStoreProductViewController](self, "_presentStoreProductViewController");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](APLogConfig, "sharedUIServiceConfig"));
      if (!v8)
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "OSLogObject"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v14 = v10;
        v11 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@: Unsupported request", buf, 0xCu);

      }
      -[RemoteProductViewController _presentErrorAlert](self, "_presentErrorAlert");
    }
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController childViewController](self, "childViewController"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController childViewController](self, "childViewController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100001B78;
    v10[3] = &unk_100014468;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v4, v10);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController _viewControllerProxy](self, "_viewControllerProxy"));
    objc_msgSend(v9, "dismiss");

    if (v6)
      v6[2](v6);
  }

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  ApprovalRequest *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v8 = -[ApprovalRequest initWithDictionary:]([ApprovalRequest alloc], "initWithDictionary:", v7);
  -[RemoteProductViewController setRequest:](self, "setRequest:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController _viewControllerProxy](self, "_viewControllerProxy"));
  objc_msgSend(v9, "setDesiredHardwareButtonEvents:", 16);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](APLogConfig, "sharedUIServiceConfig"));
  if (!v10)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "OSLogObject"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class(self);
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
    v15 = 138543618;
    v16 = v12;
    v17 = 2114;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Configured with context. Request payload: %{public}@", (uint8_t *)&v15, 0x16u);

  }
  v6[2](v6);

}

- (void)handleButtonActions:(id)a3
{
  -[RemoteProductViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

+ (id)metricsEventForAccount:(id)a3 request:(id)a4 action:(unint64_t)a5
{
  void *v6;
  void *v7;
  _QWORD v9[5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APMetricsEvent metricsEventWithAccount:request:](APMetricsEvent, "metricsEventWithAccount:request:", a3, a4));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100001DE4;
  v9[3] = &unk_100014488;
  v9[4] = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "thenWithBlock:", v9));

  return v7;
}

- (void)_presentStoreProductViewController
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  BOOL v10;
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
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  id v41[2];
  _QWORD v42[2];
  __int128 buf;
  uint64_t v44;
  void *v45;
  uint64_t *v46;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](APLogConfig, "sharedUIServiceConfig"));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "OSLogObject"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class(self);
    v5 = *(id *)((char *)&buf + 4);
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Presenting store product view controller", (uint8_t *)&buf, 0xCu);

  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v6 = (void *)qword_10001BC00;
  v40 = qword_10001BC00;
  if (!qword_10001BC00)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v44 = (uint64_t)sub_1000033F8;
    v45 = &unk_1000145A0;
    v46 = &v37;
    sub_1000033F8((uint64_t)&buf);
    v6 = (void *)v38[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v37, 8);
  v8 = objc_alloc_init(v7);
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setAskToBuy:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
  v10 = objc_msgSend(v9, "status") == (id)-1;

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "decline"));
    objc_msgSend(v8, "setCancelButtonTitle:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizations"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "approve"));
    objc_msgSend(v8, "setRightBarButtonTitle:", v16);

    objc_msgSend(v8, "setShowsRightBarButton:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizations"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "body"));
    objc_msgSend(v8, "setPromptString:", v19);

  }
  else
  {
    objc_msgSend(v8, "setShowsRightBarButton:", 0);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v21 = objc_msgSend(v20, "userInterfaceIdiom") == (id)1;

  if (v21)
    objc_msgSend(v8, "setModalPresentationStyle:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentationController"));
  objc_msgSend(v22, "setDelegate:", self);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "itemIdentifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v24, "longLongValue")));

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v44 = 0x2020000000;
  v26 = (id *)qword_10001BC10;
  v45 = (void *)qword_10001BC10;
  if (!qword_10001BC10)
  {
    v27 = (void *)sub_10000344C();
    v26 = (id *)dlsym(v27, "SKStoreProductParameterITunesItemIdentifier");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v26;
    qword_10001BC10 = (uint64_t)v26;
  }
  _Block_object_dispose(&buf, 8);
  if (!v26)
    sub_10000BC3C();
  v41[0] = *v26;
  v41[1] = CFSTR("askToBuyItem");
  v42[0] = v25;
  v28 = v41[0];
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "compile"));
  v42[1] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 2));

  objc_initWeak((id *)&buf, self);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000023BC;
  v35[3] = &unk_1000144D8;
  objc_copyWeak(&v36, (id *)&buf);
  objc_msgSend(v8, "loadProductWithParameters:completionBlock:", v31, v35);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "window"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "_rootSheetPresentationController"));
  objc_msgSend(v34, "_setShouldScaleDownBehindDescendantSheets:", 0);

  -[RemoteProductViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  -[RemoteProductViewController setChildViewController:](self, "setChildViewController:", v8);
  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)&buf);

}

- (void)_presentWebProductViewController
{
  void *v3;
  NSObject *v4;
  id v5;
  WebProductViewController *v6;
  void *v7;
  WebProductViewController *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](APLogConfig, "sharedUIServiceConfig"));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "OSLogObject"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543362;
    v18 = (id)objc_opt_class(self);
    v5 = v18;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Presenting web product view controller", (uint8_t *)&v17, 0xCu);

  }
  v6 = [WebProductViewController alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
  v8 = -[WebProductViewController initWithRequest:](v6, "initWithRequest:", v7);

  -[WebProductViewController setActionDelegate:](v8, "setActionDelegate:", self);
  v9 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationBar"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationBar"));
  objc_msgSend(v12, "setTranslucent:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentationController"));
  objc_msgSend(v13, "setDelegate:", self);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_rootSheetPresentationController"));
  objc_msgSend(v16, "_setShouldScaleDownBehindDescendantSheets:", 0);

  -[RemoteProductViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  -[RemoteProductViewController setChildViewController:](self, "setChildViewController:", v8);

}

- (id)_viewControllerProxy
{
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000287C;
  v5[3] = &unk_100014500;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", v5));
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (void)_presentErrorAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](Localizations, "stringWithKey:", CFSTR("DEFAULT_ERROR_ACTION")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](Localizations, "stringWithKey:", CFSTR("DEFAULT_ERROR_MESSAGE")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](Localizations, "stringWithKey:", CFSTR("DEFAULT_ERROR_TITLE")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v4, 1));
  objc_initWeak(&location, self);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100002B54;
  v13 = &unk_100014528;
  objc_copyWeak(&v14, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v3, 0, &v10));
  objc_msgSend(v6, "addAction:", v7, v10, v11, v12, v13);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController childViewController](self, "childViewController"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController childViewController](self, "childViewController"));
    objc_msgSend(v9, "presentViewController:animated:completion:", v6, 1, 0);

  }
  else
  {
    -[RemoteProductViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_updateRequestWithAction:(int64_t)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
  v6 = objc_msgSend(v5, "isMocked");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](APLogConfig, "sharedUIServiceConfig"));
    if (!v7)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = (id)objc_opt_class(self);
      v9 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot update mocked request", buf, 0xCu);

    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestIdentifier"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100002D68;
    v12[3] = &unk_100014500;
    objc_copyWeak(&v13, (id *)buf);
    +[APRequestHandler updateRequestWithIdentifier:action:completion:](APRequestHandler, "updateRequestWithIdentifier:action:completion:", v11, a3, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[RemoteProductViewController productViewControllerDidFinishWithAction:](self, "productViewControllerDidFinishWithAction:", 2);
}

- (void)productViewControllerDidFinishWithAction:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  unint64_t v22;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](APLogConfig, "sharedUIServiceConfig"));
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = (id)objc_opt_class(self);
    v21 = 2050;
    v22 = a3;
    v7 = v20;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Product view controller finished. Action: %{public}ld", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
  v9 = objc_msgSend(v8, "status") == (id)-1;

  if (!v9)
    a3 = 2;
  v10 = (void *)objc_opt_class(self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController account](self, "account"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteProductViewController request](self, "request"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metricsEventForAccount:request:action:", v11, v12, a3));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100003200;
  v18[3] = &unk_100014550;
  v18[4] = self;
  objc_msgSend(v13, "resultWithCompletion:", v18);

  switch(a3)
  {
    case 0uLL:
      objc_initWeak((id *)buf, self);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000327C;
      v16[3] = &unk_100014578;
      objc_copyWeak(&v17, (id *)buf);
      -[RemoteProductViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v16);
      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
      break;
    case 1uLL:
      objc_initWeak((id *)buf, self);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000032AC;
      v14[3] = &unk_100014578;
      objc_copyWeak(&v15, (id *)buf);
      -[RemoteProductViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
      break;
    case 2uLL:
      -[RemoteProductViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      break;
    case 3uLL:
      -[RemoteProductViewController _presentErrorAlert](self, "_presentErrorAlert");
      break;
    default:
      return;
  }
}

- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  uint64_t v4;

  if (a4)
    v4 = 2 * (a4 != 5);
  else
    v4 = 1;
  -[RemoteProductViewController productViewControllerDidFinishWithAction:](self, "productViewControllerDidFinishWithAction:", v4);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (UIViewController)childViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_childViewController);
}

- (void)setChildViewController:(id)a3
{
  objc_storeWeak((id *)&self->_childViewController, a3);
}

- (ApprovalRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_childViewController);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
