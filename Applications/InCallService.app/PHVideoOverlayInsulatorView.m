@implementation PHVideoOverlayInsulatorView

- (PHVideoOverlayInsulatorView)init
{
  PHVideoOverlayInsulatorView *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHVideoOverlayInsulatorView;
  v2 = -[PHVideoOverlayInsulatorView init](&v9, "init");
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)_UIBackdropView), "initWithPrivateStyle:", 2030);
    -[PHVideoOverlayInsulatorView setBackgroundView:](v2, "setBackgroundView:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "handlePIPControllerNotification:", CFSTR("PHPIPControllerWillRotateNotification"), 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "handlePIPControllerNotification:", CFSTR("PHPIPControllerDidRotateNotification"), 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, "handlePIPControllerNotification:", CFSTR("PHPIPControllerDidStartResizingNotification"), 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "handlePIPControllerNotification:", CFSTR("PHPIPControllerDidFinishResizingNotification"), 0);

  }
  return v2;
}

- (void)setVideoOverlayContentView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  double v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;
  _QWORD v12[5];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayInsulatorView contentView](self, "contentView"));

  if (v6 && v7)
  {
    if (v4)
      v8 = 0.00749999983;
    else
      v8 = 0.0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000F83EC;
    v12[3] = &unk_100284898;
    v12[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000F8420;
    v9[3] = &unk_100287EE8;
    v9[4] = self;
    v10 = v6;
    v11 = v4;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, v9, v8);

  }
  else if (v6)
  {
    -[PHVideoOverlayInsulatorView displayContentView:animated:](self, "displayContentView:animated:", v6, v4);
  }

}

- (void)displayContentView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  _QWORD v26[5];

  v4 = a4;
  objc_storeStrong((id *)&self->_contentView, a3);
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayInsulatorView contentView](self, "contentView"));
  objc_msgSend(v8, "setAlpha:", 0.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayInsulatorView contentView](self, "contentView"));
  -[PHVideoOverlayInsulatorView addSubview:](self, "addSubview:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, -1, self, 7, 0.600000024, 0.0));
  LODWORD(v11) = 1144913920;
  objc_msgSend(v10, "setPriority:", v11);
  -[PHVideoOverlayInsulatorView addConstraint:](self, "addConstraint:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v13 = dbl_1002402B0[objc_msgSend(v12, "userInterfaceIdiom") == (id)1];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, -1, 0, 0, 1.0, v13));
  LODWORD(v15) = 1148846080;
  objc_msgSend(v14, "setPriority:", v15);
  -[PHVideoOverlayInsulatorView addConstraint:](self, "addConstraint:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, 1, 0, 0, 1.0, 150.0));
  LODWORD(v17) = 1148846080;
  objc_msgSend(v16, "setPriority:", v17);
  -[PHVideoOverlayInsulatorView addConstraint:](self, "addConstraint:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 9, 0, self, 9, 1.0, 0.0));
  -[PHVideoOverlayInsulatorView addConstraint:](self, "addConstraint:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 10, 0, self, 10, 1.0, 0.0));
  LODWORD(v20) = 1144750080;
  objc_msgSend(v19, "setPriority:", v20);
  -[PHVideoOverlayInsulatorView addConstraint:](self, "addConstraint:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 4, -1, self, 4, 1.0, -70.0));
  LODWORD(v22) = 1148846080;
  objc_msgSend(v21, "setPriority:", v22);
  -[PHVideoOverlayInsulatorView addConstraint:](self, "addConstraint:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 3, 1, self, 3, 1.0, 20.0));
  LODWORD(v24) = 1148846080;
  objc_msgSend(v23, "setPriority:", v24);
  -[PHVideoOverlayInsulatorView addConstraint:](self, "addConstraint:", v23);
  v25 = 0.00749999983;
  if (!v4)
    v25 = 0.0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000F878C;
  v26[3] = &unk_100284898;
  v26[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v26, v25);

}

- (void)setBackgroundView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PHVideoOverlayInsulatorView addSubview:](self, "addSubview:", v4);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 9, 0, self, 9, 1.0, 0.0));
  -[PHVideoOverlayInsulatorView addConstraint:](self, "addConstraint:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 10, 0, self, 10, 1.0, 0.0));
  -[PHVideoOverlayInsulatorView addConstraint:](self, "addConstraint:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 7, 0, self, 7, 1.0, 0.0));
  -[PHVideoOverlayInsulatorView addConstraint:](self, "addConstraint:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 8, 0, self, 8, 1.0, 0.0));
  -[PHVideoOverlayInsulatorView addConstraint:](self, "addConstraint:", v8);

}

- (void)handlePIPControllerNotification:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  double v7;

  v4 = -[PHVideoOverlayInsulatorView isContentViewRotatingOrResizing](self, "isContentViewRotatingOrResizing", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayInsulatorView contentView](self, "contentView"));
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "resetView");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayInsulatorView contentView](self, "contentView"));
    v6 = v5;
    v7 = 1.0;
  }
  else
  {
    v7 = 0.0;
  }
  objc_msgSend(v5, "setAlpha:", v7);

  -[PHVideoOverlayInsulatorView setIsContentViewRotatingOrResizing:](self, "setIsContentViewRotatingOrResizing:", v4 ^ 1);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHVideoOverlayInsulatorView;
  -[PHVideoOverlayInsulatorView dealloc](&v4, "dealloc");
}

- (PHVideoOverlayContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (BOOL)isContentViewRotatingOrResizing
{
  return self->_isContentViewRotatingOrResizing;
}

- (void)setIsContentViewRotatingOrResizing:(BOOL)a3
{
  self->_isContentViewRotatingOrResizing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
