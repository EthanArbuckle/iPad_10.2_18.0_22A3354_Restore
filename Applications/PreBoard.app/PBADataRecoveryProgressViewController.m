@implementation PBADataRecoveryProgressViewController

- (void)loadView
{
  id v3;
  double y;
  double width;
  double height;
  id v7;
  SBUIAppleLogoView *v8;
  SBUIAppleLogoView *appleLogoView;
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
  _QWORD v23[4];

  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = (SBUIAppleLogoView *)objc_msgSend(objc_alloc((Class)SBUIAppleLogoView), "initWithFrame:progressBarVisible:", 1, CGRectZero.origin.x, y, width, height);
  appleLogoView = self->_appleLogoView;
  self->_appleLogoView = v8;

  -[SBUIAppleLogoView setTranslatesAutoresizingMaskIntoConstraints:](self->_appleLogoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "addSubview:", self->_appleLogoView);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SBUIAppleLogoView leadingAnchor](self->_appleLogoView, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v23[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SBUIAppleLogoView trailingAnchor](self->_appleLogoView, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v23[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SBUIAppleLogoView topAnchor](self->_appleLogoView, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v23[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SBUIAppleLogoView bottomAnchor](self->_appleLogoView, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  v23[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  -[PBADataRecoveryProgressViewController setView:](self, "setView:", v7);
}

- (void)viewDidLoad
{
  double progress;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBADataRecoveryProgressViewController;
  -[PBADataRecoveryProgressViewController viewDidLoad](&v4, "viewDidLoad");
  progress = self->_progress;
  *(float *)&progress = progress;
  -[SBUIAppleLogoView setProgress:](self->_appleLogoView, "setProgress:", progress);
  -[SBUIAppleLogoView setStatusText:](self->_appleLogoView, "setStatusText:", self->_statusText);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PBADataRecoveryProgressViewController;
  -[PBADataRecoveryProgressViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
  *(float *)&a3 = a3;
  -[SBUIAppleLogoView setProgress:](self->_appleLogoView, "setProgress:", a3);
}

- (void)setStatusText:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_statusText, a3);
  v5 = a3;
  -[SBUIAppleLogoView setStatusText:](self->_appleLogoView, "setStatusText:", v5);

}

- (double)progress
{
  return self->_progress;
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_appleLogoView, 0);
}

@end
