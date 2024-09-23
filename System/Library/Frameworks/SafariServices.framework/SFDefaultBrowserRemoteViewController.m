@implementation SFDefaultBrowserRemoteViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("SFDefaultBrowserServiceViewController"), CFSTR("com.apple.SafariViewService"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78C200);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE72F188);
}

- (void)serviceViewControllerDidFinishWithResult:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteViewController:didFinishWithResult:", self, a3);

}

- (void)serviceViewControllerFailed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteViewControllerFailed:", self);

}

- (SFDefaultBrowserRemoteViewControllerDelegate)delegate
{
  return (SFDefaultBrowserRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
