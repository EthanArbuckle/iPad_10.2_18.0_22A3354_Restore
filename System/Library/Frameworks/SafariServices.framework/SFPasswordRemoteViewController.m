@implementation SFPasswordRemoteViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "passwordServiceViewControllerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", v6, CFSTR("com.apple.SafariViewService"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)passwordServiceViewControllerName
{
  return &stru_1E4AC8470;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE705F98);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  SFPasswordRemoteViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "remoteViewController:viewServiceDidTerminateWithError:", self, v5);

}

- (void)willDismissServiceViewController
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteViewControllerWillDismiss:", self);

}

- (SFPasswordRemoteViewControllerDelegate)delegate
{
  return (SFPasswordRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
