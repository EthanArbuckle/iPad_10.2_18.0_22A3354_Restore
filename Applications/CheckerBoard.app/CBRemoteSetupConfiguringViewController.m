@implementation CBRemoteSetupConfiguringViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CBRemoteSetupConfiguringViewController;
  -[CBRemoteSetupConfiguringViewController viewDidLoad](&v3, "viewDidLoad");
  -[CBRemoteSetupConfiguringViewController setupView](self, "setupView");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBRemoteSetupConfiguringViewController;
  -[CBRemoteSetupConfiguringViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController activityView](self, "activityView"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController activityView](self, "activityView"));
    objc_msgSend(v5, "startAnimating");

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBRemoteSetupConfiguringViewController;
  -[CBRemoteSetupConfiguringViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)setupView
{
  void *v3;
  void *v4;
  double v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id location;
  _QWORD v40[4];

  -[CBRemoteSetupConfiguringViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController view](self, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController headerView](self, "headerView"));
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setTitleHyphenationFactor:", v5);

  v6 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  -[CBRemoteSetupConfiguringViewController setActivityView:](self, "setActivityView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController activityView](self, "activityView"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = objc_alloc_init((Class)UIView);
  -[CBRemoteSetupConfiguringViewController setContainerView:](self, "setContainerView:", v8);

  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController containerView](self, "containerView"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100020008;
  v37[3] = &unk_100075C60;
  objc_copyWeak(&v38, &location);
  -[CBRemoteSetupConfiguringViewController addContentSubView:heightConstraintForLayout:](self, "addContentSubView:heightConstraintForLayout:", v9, v37);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController containerView](self, "containerView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController activityView](self, "activityView"));
  objc_msgSend(v12, "addSubview:", v13);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController activityView](self, "activityView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController containerView](self, "containerView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v40[0] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController activityView](self, "activityView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController containerView](self, "containerView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v40[1] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController activityView](self, "activityView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastBaselineAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController containerView](self, "containerView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v16 = 96.0;
  if (v11 == (id)1)
    v16 = 106.0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v15, v16));
  v40[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController containerView](self, "containerView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController activityView](self, "activityView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:", v21));
  v40[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupConfiguringViewController view](self, "view"));
  objc_msgSend(v24, "setNeedsLayout");

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_activityView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
}

@end
