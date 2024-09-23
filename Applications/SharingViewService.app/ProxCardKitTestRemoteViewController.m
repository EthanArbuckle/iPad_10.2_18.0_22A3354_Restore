@implementation ProxCardKitTestRemoteViewController

- (void)viewDidAppear:(BOOL)a3
{
  ProxCardKitTestStartViewController *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ProxCardKitTestRemoteViewController;
  -[ProxCardKitTestRemoteViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = objc_alloc_init(ProxCardKitTestStartViewController);
  v5 = -[ProxCardKitTestRemoteViewController presentProxCardFlowWithDelegate:initialViewController:](self, "presentProxCardFlowWithDelegate:initialViewController:", self, v4);

}

- (void)proxCardFlowWillPresent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ProxCardKitTestRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "setStatusBarHidden:withDuration:", 1, 0.0);

}

- (void)proxCardFlowDidDismiss
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ProxCardKitTestRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "dismiss");

}

- (unint64_t)supportedInterfaceOrientations
{
  return PRXSupportedInterfaceOrientations(self, 1);
}

@end
