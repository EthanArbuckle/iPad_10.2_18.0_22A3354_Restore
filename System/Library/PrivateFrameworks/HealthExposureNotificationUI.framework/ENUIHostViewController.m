@implementation ENUIHostViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ENUIHostViewController;
  -[ENUIHostViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)setPresentationRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ENUIHostViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentationRequest:", v4);

}

- (void)show
{
  id v2;

  -[ENUIHostViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "show");

}

- (void)didFinishWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ENUIHostViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostViewControllerDidFinishWithError:", v4);

}

+ (id)requestRemoteViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("ENUIRemotePresentationViewController"), CFSTR("com.apple.PublicHealthRemoteUI"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ENUIHostViewControllerDelegate)delegate
{
  return (ENUIHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
