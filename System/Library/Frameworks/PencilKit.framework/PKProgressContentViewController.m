@implementation PKProgressContentViewController

- (void)loadView
{
  id v3;

  v3 = (id)objc_opt_new();
  -[PKProgressContentViewController setView:](self, "setView:", v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKProgressContentViewController;
  -[PKProgressContentViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[PKProgressContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  -[PKProgressContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)setProgress:(double)a3
{
  id v4;

  -[PKProgressContentViewController _contentView](self, "_contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgress:", a3);

}

- (double)progress
{
  return self->_progress;
}

@end
