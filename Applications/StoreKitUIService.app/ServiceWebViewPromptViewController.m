@implementation ServiceWebViewPromptViewController

- (ServiceWebViewPromptViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ServiceWebViewPromptViewController *v4;
  ServiceWebViewPromptViewController *v5;
  id v6;
  uint64_t v7;
  SUClientInterface *clientInterface;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ServiceWebViewPromptViewController;
  v4 = -[ServiceWebViewPromptViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend((id)objc_opt_class(v4), "_generateClientInterface");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    clientInterface = v5->_clientInterface;
    v5->_clientInterface = (SUClientInterface *)v7;

    -[SUClientInterface setDelegate:](v5->_clientInterface, "setDelegate:", v5);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SUClientInterface setDelegate:](self->_clientInterface, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ServiceWebViewPromptViewController;
  -[ServiceWebViewPromptViewController dealloc](&v3, "dealloc");
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned __int8 v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void (**v17)(void);

  v17 = (void (**)(void))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("URLString")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referrer")));
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scheme"));
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ams-ui"));

    if (v11)
      -[ServiceWebViewPromptViewController setShouldUseAMS:](self, "setShouldUseAMS:", 1);
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.appstored"))
      && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "host")),
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("localhost")),
          v12,
          (v13 & 1) != 0))
    {
      v14 = CFSTR("http");
    }
    else
    {
      v14 = CFSTR("https");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "urlByReplacingSchemeWithScheme:", v14));

    -[ServiceWebViewPromptViewController setURL:](self, "setURL:", v15);
  }
  if (objc_msgSend(v8, "length"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController clientInterface](self, "clientInterface"));
    objc_msgSend(v16, "setHostApplicationIdentifier:", v8);

  }
  v17[2]();

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "events") & 0x10) != 0)
          -[ServiceWebViewPromptViewController _dismiss](self, "_dismiss");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ServiceWebViewPromptViewController;
  -[ServiceWebViewPromptViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)_willAppearInRemoteViewController
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ServiceWebViewPromptViewController;
  -[ServiceWebViewPromptViewController _willAppearInRemoteViewController](&v4, "_willAppearInRemoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v3, "setAllowsAlertItems:", 1);
  objc_msgSend(v3, "setAllowsAlertStacking:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ServiceWebViewPromptViewController;
  -[ServiceWebViewPromptViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_rootSheetPresentationController"));
  objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

  if (!-[ServiceWebViewPromptViewController viewControllerShown](self, "viewControllerShown"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceHostRegistry sharedInstance](ServiceHostRegistry, "sharedInstance"));
    objc_msgSend(v7, "setRegisteredHostBundleId:", 0);

    -[ServiceWebViewPromptViewController _presentViewController](self, "_presentViewController");
    -[ServiceWebViewPromptViewController setViewControllerShown:](self, "setViewControllerShown:", 1);
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)1)
    return 30;
  else
    return 2;
}

- (BOOL)shouldAutorotate
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (unint64_t)objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (void)attemptDismissHostViewController
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController presentedViewController](self, "presentedViewController"));

  if (!v3)
    -[ServiceWebViewPromptViewController _dismiss](self, "_dismiss");
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return 2;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)UIPresentationController), "initWithPresentedViewController:presentingViewController:", v8, v7);

  objc_msgSend(v9, "setDelegate:", self);
  return v9;
}

- (id)_bag
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v2 = objc_msgSend(sub_1000188A4(), "bagSubProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(sub_1000188A4(), "bagSubProfileVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(sub_1000188A4(), "bagKeySet");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  +[AMSBagKeySet registerBagKeySet:forProfile:profileVersion:](AMSBagKeySet, "registerBagKeySet:forProfile:profileVersion:", v7, v3, v5);

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v8 = (void *)qword_100063308;
  v16 = qword_100063308;
  if (!qword_100063308)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000194A8;
    v12[3] = &unk_100049840;
    v12[4] = &v13;
    sub_1000194A8((uint64_t)v12);
    v8 = (void *)v14[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v13, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bagForProfile:profileVersion:", v3, v5));

  return v10;
}

- (void)_determineTypeForURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  if (-[ServiceWebViewPromptViewController shouldUseAMS](self, "shouldUseAMS"))
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v8 = (void *)qword_100063318;
    v24 = qword_100063318;
    if (!qword_100063318)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000195A8;
      v20[3] = &unk_100049840;
      v20[4] = &v21;
      sub_1000195A8((uint64_t)v20);
      v8 = (void *)v22[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v21, 8);
    v10 = [v9 alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController _bag](self, "_bag"));
    v12 = objc_msgSend(v10, "initWithBag:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController _sanitizedURL](self, "_sanitizedURL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "typeForURL:", v13));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100018B58;
    v16[3] = &unk_100049970;
    v17 = v7;
    v15 = v7;
    objc_msgSend(v14, "addFinishBlock:", v16);

  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018B48;
    block[3] = &unk_100048FF8;
    v19 = v7;
    v12 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v14 = v19;
  }

}

- (void)_dismiss
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController presentedViewController](self, "presentedViewController"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController presentedViewController](self, "presentedViewController"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100018CB8;
    v6[3] = &unk_1000490B8;
    v7 = v3;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  }
  else
  {
    objc_msgSend(v3, "dismiss");
  }

}

+ (id)_generateClientInterface
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_alloc_init((Class)SUClientInterface);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  objc_msgSend(v2, "setClientIdentifier:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUWebViewManager defaultLocalStoragePath](SUWebViewManager, "defaultLocalStoragePath"));
  objc_msgSend(v2, "setLocalStoragePath:", v5);

  v6 = objc_alloc_init((Class)SKUIViewControllerFactory);
  objc_msgSend(v2, "setViewControllerFactory:", v6);

  return v2;
}

- (void)_presentViewController
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController _sanitizedURL](self, "_sanitizedURL"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100018DE0;
  v4[3] = &unk_100049998;
  v4[4] = self;
  -[ServiceWebViewPromptViewController _determineTypeForURL:completion:](self, "_determineTypeForURL:completion:", v3, v4);

}

- (id)_sanitizedURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController URL](self, "URL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));

  v5 = objc_alloc((Class)NSURLComponents);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController URL](self, "URL"));
  v7 = objc_msgSend(v5, "initWithURL:resolvingAgainstBaseURL:", v6, 0);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queryItems", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("url"));

        if (v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));

          v4 = (void *)v16;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));
  return v17;
}

- (id)_viewControllerForType:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  ServiceAMSUIWebViewController *v7;
  ServiceSUAccountViewController *v8;
  void *v9;
  void *v10;
  ServiceAMSUIWebViewController *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  ServiceSUAccountViewController *v16;
  void *v17;
  ServiceSUAccountViewController *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  switch(a3)
  {
    case 0:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore"));
      v8 = (ServiceSUAccountViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_activeiTunesAccount"));

      v11 = [ServiceAMSUIWebViewController alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController _bag](self, "_bag"));
      v7 = -[ServiceAMSUIWebViewController initWithBag:account:clientInfo:](v11, "initWithBag:account:clientInfo:", v12, v8, 0);

      -[ServiceAMSUIWebViewController setEmbeddedParent:](v7, "setEmbeddedParent:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController URL](self, "URL"));
      v13 = -[ServiceAMSUIWebViewController loadURL:](v7, "loadURL:", v9);
      goto LABEL_16;
    case 1:
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activeAccount"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController URL](self, "URL"));
      if (v15)
      {
        v16 = [ServiceSUAccountViewController alloc];
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController URL](self, "URL"));
        v8 = -[ServiceSUAccountViewController initWithExternalAccountURL:](v16, "initWithExternalAccountURL:", v17);

      }
      else
      {
        v18 = objc_alloc_init(ServiceSUAccountViewController);
        v8 = v18;
        if (v9)
          v19 = 2;
        else
          v19 = 1;
        -[ServiceSUAccountViewController setStyle:](v18, "setStyle:", v19);
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController clientInterface](self, "clientInterface"));
      -[ServiceSUAccountViewController setClientInterface:](v8, "setClientInterface:", v20);

      -[ServiceSUAccountViewController setEmbeddedParent:](v8, "setEmbeddedParent:", self);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceSUAccountViewController authenticationContext](v8, "authenticationContext"));
      v22 = objc_msgSend(v21, "mutableCopy");

      if (!v22)
        v22 = objc_msgSend(objc_alloc((Class)SSMutableAuthenticationContext), "initWithAccount:", v9);
      objc_msgSend(v22, "setDisplaysOnLockScreen:", 1);
      -[ServiceSUAccountViewController setAuthenticationContext:](v8, "setAuthenticationContext:", v22);
      v7 = (ServiceAMSUIWebViewController *)objc_msgSend(objc_alloc((Class)SUNavigationContainerViewController), "initWithChildViewController:", v8);

      goto LABEL_16;
    case 2:
      v4 = objc_alloc((Class)AMSUIDynamicViewController);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController _bag](self, "_bag"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceWebViewPromptViewController _sanitizedURL](self, "_sanitizedURL"));
      v7 = (ServiceAMSUIWebViewController *)objc_msgSend(v4, "initWithBag:URL:", v5, v6);

      v8 = (ServiceSUAccountViewController *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceSUAccountViewController ams_activeiTunesAccount](v8, "ams_activeiTunesAccount"));
      -[ServiceAMSUIWebViewController setAccount:](v7, "setAccount:", v9);
LABEL_16:

      return v7;
  }
  v7 = 0;
  return v7;
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (void)setClientInterface:(id)a3
{
  objc_storeStrong((id *)&self->_clientInterface, a3);
}

- (BOOL)shouldUseAMS
{
  return self->_shouldUseAMS;
}

- (void)setShouldUseAMS:(BOOL)a3
{
  self->_shouldUseAMS = a3;
}

- (UIViewController)underlyingViewController
{
  return self->_underlyingViewController;
}

- (void)setUnderlyingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingViewController, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (BOOL)viewControllerShown
{
  return self->_viewControllerShown;
}

- (void)setViewControllerShown:(BOOL)a3
{
  self->_viewControllerShown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_underlyingViewController, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
}

@end
