@implementation ServiceReviewRemoteAlertViewController

+ (int64_t)convertInterfaceOrientation:(unint64_t)a3
{
  if (a3 - 1 >= 4)
    return 0;
  else
    return a3;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  ServiceReviewViewController *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];

  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceReviewRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v8, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v8, "setAllowsAlertStacking:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("orientation")));

  objc_msgSend(v8, "setLaunchingInterfaceOrientation:", +[ServiceReviewRemoteAlertViewController convertInterfaceOrientation:](ServiceReviewRemoteAlertViewController, "convertInterfaceOrientation:", v10));
  v11 = objc_alloc_init(ServiceReviewViewController);
  v26[0] = SKUIServiceReviewSandboxMode;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("sandboxed")));
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = &__kCFBooleanTrue;
  v26[1] = CFSTR("bundleID");
  v27[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
  v18 = v17;
  if (!v17)
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v27[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  -[ServiceReviewViewController setupWithParameters:](v11, "setupWithParameters:", v19);

  if (!v17)
  -[ServiceReviewRemoteAlertViewController setChildViewController:](self, "setChildViewController:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceReviewRemoteAlertViewController childViewController](self, "childViewController"));
  -[ServiceReviewRemoteAlertViewController addChildViewController:](self, "addChildViewController:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceReviewRemoteAlertViewController childViewController](self, "childViewController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceReviewRemoteAlertViewController view](self, "view"));
  objc_msgSend(v23, "bounds");
  objc_msgSend(v22, "setFrame:");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceReviewRemoteAlertViewController view](self, "view"));
  objc_msgSend(v24, "addSubview:", v22);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceReviewRemoteAlertViewController childViewController](self, "childViewController"));
  objc_msgSend(v25, "didMoveToParentViewController:", self);

  if (v6)
    v6[2](v6);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (ServiceReviewViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_childViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end
