@implementation SLRemoteComposeViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v5 = a3;
  _SLLog(v3, 3, CFSTR("SLRemoteComposeViewController: (this may be harmless) viewServiceDidTerminateWithError: %@"));
  v8.receiver = self;
  v8.super_class = (Class)SLRemoteComposeViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v8, sel_viewServiceDidTerminateWithError_, v5, v5);
  -[SLRemoteComposeViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "remoteViewController:didTerminateWithError:", self, v5);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SLRemoteComposeViewControllerDelegateProtocol)delegate
{
  return (SLRemoteComposeViewControllerDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
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
