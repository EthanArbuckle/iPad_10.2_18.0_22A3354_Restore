@implementation HUCCRemoteDashboardViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("HCSRemoteViewController"), CFSTR("com.apple.Home.HomeControlService"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUCCRemoteDashboardViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteDashboard:viewServiceDidTerminateWithError:", self, v4);

}

+ (id)serviceViewControllerInterface
{
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDD1990], sel_hu_homeControlServiceXPCInterface);
}

+ (id)exportedInterface
{
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDD1990], sel_hu_homeControlXPCInterface);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)authorizeIfLocked
{
  id v3;

  -[HUCCRemoteDashboardViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestLockAuthenticationForRemoteDashboard:", self);

}

- (void)quickControlsPresentationDidUpdate:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUCCRemoteDashboardViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quickControlsPresentationDidUpdate:", v3);

}

- (void)requestDismissal
{
  id v2;

  -[HUCCRemoteDashboardViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestDismissal");

}

- (HUCCRemoteDashboardDelegate)delegate
{
  return (HUCCRemoteDashboardDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
