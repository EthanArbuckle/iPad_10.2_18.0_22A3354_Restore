@implementation CSNowPlayingController

- (CSNowPlayingController)init
{
  CSNowPlayingController *v2;
  CSMediaControlsViewController *v3;
  CSMediaControlsViewController *controlsViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSNowPlayingController;
  v2 = -[CSNowPlayingController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CSMediaControlsViewController);
    controlsViewController = v2->_controlsViewController;
    v2->_controlsViewController = v3;

  }
  return v2;
}

- (CSMediaControlsViewController)controlsViewController
{
  return self->_controlsViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlsViewController, 0);
}

@end
