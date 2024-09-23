@implementation FontInstallMissingNavigationController

- (FontInstallMissingController)remoteController
{
  return (FontInstallMissingController *)objc_loadWeakRetained((id *)&self->_remoteController);
}

- (void)setRemoteController:(id)a3
{
  objc_storeWeak((id *)&self->_remoteController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteController);
}

@end
