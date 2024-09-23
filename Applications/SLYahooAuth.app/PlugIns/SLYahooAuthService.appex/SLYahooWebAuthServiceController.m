@implementation SLYahooWebAuthServiceController

- (SLYahooWebAuthServiceController)initWithNibName:(id)a3 bundle:(id)a4
{
  SLYahooWebAuthServiceController *v4;
  SL_OOPAWebViewController *v5;
  SL_OOPAWebViewController *webViewController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SLYahooWebAuthServiceController;
  v4 = -[SLYahooWebAuthServiceController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (SL_OOPAWebViewController *)objc_alloc_init((Class)SL_OOPAWebViewController);
    webViewController = v4->_webViewController;
    v4->_webViewController = v5;

    -[SL_OOPAWebViewController setDelegate:](v4->_webViewController, "setDelegate:", v4);
  }
  return v4;
}

- (void)loadView
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SLYahooWebAuthServiceController;
  -[SLYahooWebAuthServiceController loadView](&v22, "loadView");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SLYahooWebAuthServiceController view](self, "view"));
  objc_msgSend(v4, "setOpaque:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SLYahooWebAuthServiceController view](self, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SLYahooWebAuthServiceController extensionContext](self, "extensionContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inputItems"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
  _SLLog(v2, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("description"), v10));
  -[SL_OOPAWebViewController setNavBarTitle:](self->_webViewController, "setNavBarTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("username")));
  if (v12)
    -[SL_OOPAWebViewController setUsername:](self->_webViewController, "setUsername:", v12);
  v13 = objc_opt_class(SLYahooWebClient);
  v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(SLAOLWebClient), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("webClient")));
  v21 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v15, v16, &v21));
  v18 = v21;

  if (v18)
  {
    v20 = v18;
    _SLLog(v2, 3);
  }
  -[SLYahooWebAuthServiceController pushViewController:animated:](self, "pushViewController:animated:", self->_webViewController, 0, v20);
  v19 = objc_msgSend(objc_alloc((Class)SLWebAuthFlowController), "initWithWebClient:", v17);
  -[SL_OOPAWebViewController setAuthFlowDelegate:](self->_webViewController, "setAuthFlowDelegate:", v19);

}

- (void)webViewController:(id)a3 didFinishWithSuccess:(BOOL)a4 response:(id)a5 error:(id)a6
{
  uint64_t v6;
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  v8 = a4;
  v10 = a6;
  v11 = v10;
  if (a5 || v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a5, 1, 0));
    v14 = objc_msgSend(objc_alloc((Class)NSItemProvider), "initWithItem:typeIdentifier:", v13, kUTTypeData);
    v21 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v16 = objc_alloc_init((Class)NSExtensionItem);
    objc_msgSend(v16, "setAttachments:", v15);
    _SLLog(v6, 7);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SLYahooWebAuthServiceController extensionContext](self, "extensionContext"));
    v20 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    objc_msgSend(v17, "completeRequestReturningItems:completionHandler:", v18, &stru_100004178);

  }
  else
  {
    v19 = v10;
    _SLLog(v6, 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SLYahooWebAuthServiceController extensionContext](self, "extensionContext", v19));
    objc_msgSend(v12, "cancelRequestWithError:", v11);

    _SLLog(v6, 7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewController, 0);
}

@end
