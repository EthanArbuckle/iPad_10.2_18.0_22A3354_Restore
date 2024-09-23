@implementation MUPlacePhotoSectionControllerConfiguration

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (BOOL)supportsARPCallToAction
{
  return self->_supportsARPCallToAction;
}

- (void)setSupportsARPCallToAction:(BOOL)a3
{
  self->_supportsARPCallToAction = a3;
}

- (BOOL)showLookAround
{
  return self->_showLookAround;
}

- (void)setShowLookAround:(BOOL)a3
{
  self->_showLookAround = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
