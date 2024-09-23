@implementation HUCCRemoteDashboardViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend_requestViewController_fromServiceWithBundleIdentifier_connectionHandler_(v4, v5, (uint64_t)CFSTR("HCSRemoteViewController"), CFSTR("com.apple.Home.HomeControlService"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend_delegate(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteDashboard_viewServiceDidTerminateWithError_(v8, v7, (uint64_t)self, v4);

}

+ (id)serviceViewControllerInterface
{
  return (id)((uint64_t (*)(_QWORD, char *))MEMORY[0x24BEDD108])(MEMORY[0x24BDD1990], sel_hu_homeControlServiceXPCInterface);
}

+ (id)exportedInterface
{
  return (id)((uint64_t (*)(_QWORD, char *))MEMORY[0x24BEDD108])(MEMORY[0x24BDD1990], sel_hu_homeControlXPCInterface);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)authorizeIfLocked
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_delegate(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestLockAuthenticationForRemoteDashboard_(v5, v4, (uint64_t)self);

}

- (void)quickControlsPresentationDidUpdate:(BOOL)a3
{
  _BOOL8 v3;
  const char *v4;
  id v5;

  v3 = a3;
  objc_msgSend_delegate(self, a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_quickControlsPresentationDidUpdate_(v5, v4, v3);

}

- (void)requestDismissal
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_delegate(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestDismissal(v5, v3, v4);

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
