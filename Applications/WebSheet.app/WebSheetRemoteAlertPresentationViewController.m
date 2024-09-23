@implementation WebSheetRemoteAlertPresentationViewController

- (void)dismissPresentationController:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004BE4;
  v3[3] = &unk_1000082F0;
  v3[4] = self;
  v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (void)handleHomeButtonPressed
{
  uint64_t v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[WebSheetRemoteAlertPresentationViewController presentedViewController](self, "presentedViewController"));
  if (v3)
  {
    v2 = objc_opt_class(WSWebSheetViewController);
    if ((objc_opt_isKindOfClass(v3, v2) & 1) != 0)
      objc_msgSend(v3, "dismissViewController:", 1);
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_willAppearInRemoteViewController
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[WebSheetRemoteAlertPresentationViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v5, "setSwipeDismissalStyle:", 1);
  objc_msgSend(v5, "setLaunchingInterfaceOrientation:", objc_msgSend(UIApp, "activeInterfaceOrientation"));
  objc_msgSend(v5, "setAllowsAlertStacking:", 1);
  objc_msgSend(v5, "setAllowsBanners:", 1);
  objc_msgSend(v5, "setShouldDisableFadeInAnimation:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));

  objc_msgSend(v4, "setRemotePresentationController:", self);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebSheetRemoteAlertPresentationViewController;
  -[WebSheetRemoteAlertPresentationViewController viewDidAppear:](&v9, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "webSheetCont"));
  objc_msgSend(v6, "setModalPresentationStyle:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "webSheetCont"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004ED8;
  v8[3] = &unk_1000082C8;
  v8[4] = self;
  -[WebSheetRemoteAlertPresentationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, v8);

}

@end
