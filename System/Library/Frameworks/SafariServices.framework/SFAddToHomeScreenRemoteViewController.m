@implementation SFAddToHomeScreenRemoteViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("SFAddToHomeScreenServiceViewController"), CFSTR("com.apple.SafariViewService"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78AD78);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE77AA30);
}

- (void)serviceViewControllerDidFinishWithResult:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteViewController:didFinishWithResult:", self, v3);

}

- (SFAddToHomeScreenRemoteViewControllerDelegate)delegate
{
  return (SFAddToHomeScreenRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
