@implementation _SUUIStatusBarAlertViewController

- (_SUUIStatusBarAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _SUUIStatusBarAlertViewController *v4;
  _SUUIStatusBarAlertViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SUUIStatusBarAlertViewController;
  v4 = -[_SUUIStatusBarAlertViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[_SUUIStatusBarAlertViewController setSupportedInterfaceOrientations:](v4, "setSupportedInterfaceOrientations:", -[_SUUIStatusBarAlertViewController defaultInterfaceOrientations](v4, "defaultInterfaceOrientations"));
  return v5;
}

- (void)viewDidLoad
{
  UILabel *v3;
  UILabel *label;
  void *v5;
  _BOOL4 v6;
  double v7;
  id v8;
  uint64_t v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_SUUIStatusBarAlertViewController;
  -[_SUUIStatusBarAlertViewController viewDidLoad](&v14, sel_viewDidLoad);
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  label = self->_label;
  self->_label = v3;

  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 1);
  -[UILabel setMarqueeEnabled:](self->_label, "setMarqueeEnabled:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_label, "setTextColor:", v5);

  v6 = -[_SUUIStatusBarAlertViewController isOnScreen](self, "isOnScreen");
  v7 = 0.0;
  if (v6)
    v7 = 1.0;
  -[UILabel setAlpha:](self->_label, "setAlpha:", v7);
  SUUIStatusBarAlertStyleGetColor((void *)-[_SUUIStatusBarAlertViewController style](self, "style"));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGColor");
  -[UILabel layer](self->_label, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  -[UILabel setUserInteractionEnabled:](self->_label, "setUserInteractionEnabled:", 1);
  v11 = self->_label;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleLabelTap_);
  -[UILabel addGestureRecognizer:](v11, "addGestureRecognizer:", v12);

  -[_SUUIStatusBarAlertViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_label);

  -[_SUUIStatusBarAlertViewController updateLabelFrame](self, "updateLabelFrame");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  UILabel *label;
  id v6;
  _QWORD v7[5];

  label = self->_label;
  v6 = a4;
  -[UILabel setHidden:](label, "setHidden:", 1);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88___SUUIStatusBarAlertViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_2511F4640;
  v7[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v7);

}

- (void)updateLabelFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  CGRect v24;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBarFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_SUUIStatusBarAlertViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUUIStatusBarAlertViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v14, v5, v7, v9, v11);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[UILabel setFrame:](self->_label, "setFrame:", v16, v18, v20, v22);
  v24.origin.x = v16;
  v24.origin.y = v18;
  v24.size.width = v20;
  v24.size.height = v22;
  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", CGRectGetHeight(v24) * 0.7);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v23);

}

- (void)endAllAnimations
{
  id v2;

  -[UILabel layer](self->_label, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllAnimations");

}

- (void)handleLabelTap:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[_SUUIStatusBarAlertViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statusBarAlertViewControllerWasTapped:", self);

  }
}

- (UIView)statusBarView
{
  -[_SUUIStatusBarAlertViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return (UIView *)self->_label;
}

- (void)setOnScreen:(BOOL)a3
{
  _BOOL8 v3;
  double v5;

  if (self->_onScreen != a3)
  {
    v3 = a3;
    self->_onScreen = a3;
    v5 = 0.0;
    if (a3)
      v5 = 1.0;
    -[UILabel setAlpha:](self->_label, "setAlpha:", v5);
    -[UILabel setMarqueeRunning:](self->_label, "setMarqueeRunning:", v3);
  }
}

- (void)setStyle:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  if (self->_style != a3)
  {
    self->_style = a3;
    SUUIStatusBarAlertStyleGetColor((void *)a3);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v6, "CGColor");
    -[UILabel layer](self->_label, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
}

- (void)setMessage:(id)a3
{
  id v4;

  v4 = a3;
  -[_SUUIStatusBarAlertViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[UILabel setText:](self->_label, "setText:", v4);

  -[UILabel setMarqueeRunning:](self->_label, "setMarqueeRunning:", -[_SUUIStatusBarAlertViewController isOnScreen](self, "isOnScreen"));
}

- (NSString)message
{
  return -[UILabel text](self->_label, "text");
}

- (unint64_t)defaultInterfaceOrientations
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SUUIStatusBarAlertViewController;
  return -[_SUUIStatusBarAlertViewController supportedInterfaceOrientations](&v3, sel_supportedInterfaceOrientations);
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

- (_SUUIStatusBarAlertViewControllerDelegate)delegate
{
  return (_SUUIStatusBarAlertViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
