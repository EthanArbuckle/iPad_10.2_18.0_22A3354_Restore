@implementation MPAudioAndSubtitlesController

- (UIViewController)viewControllerForOrientation
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewControllerForOrientation);
}

- (void)setViewControllerForOrientation:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerForOrientation, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerForOrientation);
}

@end
