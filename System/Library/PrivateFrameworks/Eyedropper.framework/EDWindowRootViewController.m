@implementation EDWindowRootViewController

- (EDWindowRootViewController)initWithScreenBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  EDWindowRootViewController *v7;
  double MidX;
  double MidY;
  EDLensView *v10;
  EDLensView *lensView;
  void *v12;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)EDWindowRootViewController;
  v7 = -[EDWindowRootViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  -[EDWindowRootViewController _setIgnoreAppSupportedOrientations:](v7, "_setIgnoreAppSupportedOrientations:", 1);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MidX = CGRectGetMidX(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MidY = CGRectGetMidY(v16);
  v10 = -[EDLensView initWithFrame:]([EDLensView alloc], "initWithFrame:", MidX, MidY, 288.0, 288.0);
  lensView = v7->_lensView;
  v7->_lensView = v10;

  -[EDLensView setLastPosition:](v7->_lensView, "setLastPosition:", MidX, MidY);
  -[EDWindowRootViewController view](v7, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v7->_lensView);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EDWindowRootViewController;
  -[EDWindowRootViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDWindowRootViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  a3->var6 = 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (EDLensView)lensView
{
  return self->_lensView;
}

- (void)setLensView:(id)a3
{
  objc_storeStrong((id *)&self->_lensView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lensView, 0);
}

@end
