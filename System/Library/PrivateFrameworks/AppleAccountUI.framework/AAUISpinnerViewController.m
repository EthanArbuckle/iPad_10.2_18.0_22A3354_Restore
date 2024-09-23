@implementation AAUISpinnerViewController

+ (id)newSignInProgressViewWithFullName:(id)a3
{
  return +[AAUISignInProgressViewShim newSignInProgressViewWithFullName:](AAUISignInProgressViewShim, "newSignInProgressViewWithFullName:", a3);
}

+ (id)newSignInProgressViewWithFullName:(id)a3 forAccount:(id)a4
{
  return +[AAUISignInProgressViewShim newSignInProgressViewWithFullName:forAccount:](AAUISignInProgressViewShim, "newSignInProgressViewWithFullName:forAccount:", a3, a4);
}

- (AAUISpinnerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AAUISpinnerViewController *v4;
  AAUISpinnerViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUISpinnerViewController;
  v4 = -[AAUISpinnerViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[AAUISpinnerViewController _commonInit](v4, "_commonInit");
  return v5;
}

- (AAUISpinnerViewController)initWithCoder:(id)a3
{
  AAUISpinnerViewController *v3;
  AAUISpinnerViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUISpinnerViewController;
  v3 = -[AAUISpinnerViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AAUISpinnerViewController _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UILabel *v3;
  UILabel *label;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *spinnerView;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  label = self->_label;
  self->_label = v3;

  -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:", 0);
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  spinnerView = self->_spinnerView;
  self->_spinnerView = v5;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinnerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AAUISpinnerViewController setSpinning:](self, "setSpinning:", 1);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[7];

  v31[5] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)AAUISpinnerViewController;
  -[AAUISpinnerViewController viewDidLoad](&v30, sel_viewDidLoad);
  -[AAUISpinnerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[AAUISpinnerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_label);

  -[AAUISpinnerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_spinnerView);

  v21 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel topAnchor](self->_label, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView bottomAnchor](self->_spinnerView, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 8.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v27;
  -[UILabel leadingAnchor](self->_label, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISpinnerViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "safeAreaLayoutGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v23, 8.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v22;
  -[UILabel trailingAnchor](self->_label, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISpinnerViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safeAreaLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, -8.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v7;
  -[UIActivityIndicatorView centerXAnchor](self->_spinnerView, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISpinnerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v11;
  -[UIActivityIndicatorView centerYAnchor](self->_spinnerView, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISpinnerViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v16);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AAUISpinnerViewController;
  -[AAUISpinnerViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[AAUISpinnerViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 1, v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AAUISpinnerViewController;
  -[AAUISpinnerViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[AAUISpinnerViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 0, v3);

}

- (BOOL)isSpinning
{
  return -[UIActivityIndicatorView isAnimating](self->_spinnerView, "isAnimating");
}

- (void)setSpinning:(BOOL)a3
{
  UIActivityIndicatorView *spinnerView;

  spinnerView = self->_spinnerView;
  if (a3)
    -[UIActivityIndicatorView startAnimating](spinnerView, "startAnimating");
  else
    -[UIActivityIndicatorView stopAnimating](spinnerView, "stopAnimating");
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
}

@end
