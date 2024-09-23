@implementation CFXNonTransformedLiveCaptureContainerViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CFXNonTransformedLiveCaptureContainerViewController;
  -[CFXNonTransformedLiveCaptureContainerViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  void *v5;
  char isKindOfClass;
  CFXLiveCaptureViewController *v7;
  CFXLiveCaptureViewController *liveCaptureViewController;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "destinationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "destinationViewController");
    v7 = (CFXLiveCaptureViewController *)objc_claimAutoreleasedReturnValue();
    liveCaptureViewController = self->_liveCaptureViewController;
    self->_liveCaptureViewController = v7;

  }
}

- (UIView)liveCaptureContainer
{
  return self->_liveCaptureContainer;
}

- (void)setLiveCaptureContainer:(id)a3
{
  objc_storeStrong((id *)&self->_liveCaptureContainer, a3);
}

- (UIView)liveCaptureContainerContainer
{
  return self->_liveCaptureContainerContainer;
}

- (void)setLiveCaptureContainerContainer:(id)a3
{
  objc_storeStrong((id *)&self->_liveCaptureContainerContainer, a3);
}

- (CFXLiveCaptureViewController)liveCaptureViewController
{
  return self->_liveCaptureViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveCaptureViewController, 0);
  objc_storeStrong((id *)&self->_liveCaptureContainerContainer, 0);
  objc_storeStrong((id *)&self->_liveCaptureContainer, 0);
}

@end
