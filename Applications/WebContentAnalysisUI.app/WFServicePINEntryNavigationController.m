@implementation WFServicePINEntryNavigationController

- (void)viewDidLoad
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  WFServicePINEntryViewController *v6;
  WFServicePINEntryViewController *PINEntryViewController;
  UINavigationController *v8;
  UINavigationController *navController;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = (unint64_t)objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = 16;
  else
    v5 = 17;
  -[WFServicePINEntryNavigationController setModalPresentationStyle:](self, "setModalPresentationStyle:", v5);
  v6 = objc_alloc_init(WFServicePINEntryViewController);
  PINEntryViewController = self->_PINEntryViewController;
  self->_PINEntryViewController = v6;

  -[WFServicePINEntryViewController setDelegate:](self->_PINEntryViewController, "setDelegate:", self);
  v12 = (id)objc_claimAutoreleasedReturnValue(-[WFServicePINEntryNavigationController view](self, "view"));
  v8 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_PINEntryViewController);
  navController = self->_navController;
  self->_navController = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navController, "view"));
  -[WFServicePINEntryNavigationController addChildViewController:](self, "addChildViewController:", self->_navController);
  objc_msgSend(v12, "addSubview:", v10);
  -[UINavigationController didMoveToParentViewController:](self->_navController, "didMoveToParentViewController:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  objc_msgSend(v11, "userInterfaceIdiom");

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

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___WFServicePINEntryControllerProtocol);
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___WFPINEntryViewControllerProtocol);
}

- (void)_willAppearInRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewControllerProxy, a3);
}

- (void)setURL:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  NSURL *v10;
  NSURL *URL;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self->_URL, "host"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "host"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scheme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "host"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://%@"), v7, v8));
    v10 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));
    URL = self->_URL;
    self->_URL = v10;

  }
}

- (void)setPageTitle:(id)a3
{
  NSString *v4;
  NSString *pageTitle;
  id v6;

  v6 = a3;
  if ((-[NSString isEqual:](self->_pageTitle, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    pageTitle = self->_pageTitle;
    self->_pageTitle = v4;

  }
}

- (void)getIsPINPresentWithCompletion:(id)a3
{
  void (**v3)(id, BOOL, _QWORD);

  v3 = (void (**)(id, BOOL, _QWORD))a3;
  v3[2](v3, +[WFServicePINEntryViewController settingEnabled](WFServicePINEntryViewController, "settingEnabled"), 0);

}

- (void)permitURLWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  NSURL *URL;
  NSString *pageTitle;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_opt_new(STManagementState);
  URL = self->_URL;
  pageTitle = self->_pageTitle;
  v12 = 0;
  v8 = objc_msgSend(v5, "permitWebFilterURL:pageTitle:error:", URL, pageTitle, &v12);
  v9 = v12;
  v10 = v9;
  v11 = 0;
  if ((v8 & 1) == 0)
  {
    NSLog(CFSTR("Couldn't add URL to Screen Time: %@"), 0, v9);
    v11 = v10;
  }
  ((void (**)(id, void *))v4)[2](v4, v11);

}

- (void)cancel
{
  NSLog(CFSTR("cancelling"), a2);
}

- (void)didAcceptEnteredPIN
{
  -[WFServicePINEntryNavigationController permitURLWithCompletion:](self, "permitURLWithCompletion:", &stru_1000041B8);
  -[WFPINEntryViewControllerProtocol userEnteredCorrectPIN](self->_remoteViewControllerProxy, "userEnteredCorrectPIN");
}

- (void)didCancelEnteringPIN
{
  -[WFPINEntryViewControllerProtocol userDidCancel](self->_remoteViewControllerProxy, "userDidCancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_PINEntryViewController, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerProxy, 0);
}

@end
