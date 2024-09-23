@implementation TVLatencyColorimeterSetupProgressViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UIView *v13;
  UIView *animationContainerView;
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
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;
  _QWORD v36[5];

  v35.receiver = self;
  v35.super_class = (Class)TVLatencyColorimeterSetupProgressViewController;
  -[TVLatencyColorimeterSetupProgressViewController viewDidLoad](&v35, "viewDidLoad");
  -[TVLatencyColorimeterSetupProgressViewController setDismissalType:](self, "setDismissalType:", 1);
  location = 0;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10017E3D8, CFSTR("Localizable")));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000F6C14;
  v32[3] = &unk_10017E008;
  objc_copyWeak(&v33, &location);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, 1, v32));

  v5 = -[TVLatencyColorimeterSetupProgressViewController addAction:](self, "addAction:", v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = sub_100117218(v6, CFSTR("Localizable-TVLatencyColorimeter"), CFSTR("TVL_COLOR_TURN_PHONE_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[TVLatencyColorimeterSetupProgressViewController setTitle:](self, "setTitle:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = sub_100117218(v9, CFSTR("Localizable-TVLatencyColorimeter"), CFSTR("TVL_COLOR_TURN_PHONE_SUBTITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[TVLatencyColorimeterSetupProgressViewController setSubtitle:](self, "setSubtitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupProgressViewController contentView](self, "contentView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mainContentGuide"));

  v13 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  animationContainerView = self->super._animationContainerView;
  self->super._animationContainerView = v13;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->super._animationContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupProgressViewController contentView](self, "contentView"));
  objc_msgSend(v15, "addSubview:", self->super._animationContainerView);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->super._animationContainerView, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v36[0] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->super._animationContainerView, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:", v16));
  v36[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->super._animationContainerView, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "centerXAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  v36[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->super._animationContainerView, "heightAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:", 150.0));
  v36[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->super._animationContainerView, "widthAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", 262.0));
  v36[4] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  dispatch_time_t v7;
  _QWORD block[5];
  objc_super v9;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupProgressViewController viewWillAppear:]", 30, "Progress ViewWillAppear\n");
  v9.receiver = self;
  v9.super_class = (Class)TVLatencyColorimeterSetupProgressViewController;
  -[TVLatencyColorimeterSetupProgressViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
  -[TVLatencyColorimeterSetupProgressViewController _prepareTrainingAnimation](self, "_prepareTrainingAnimation");
  -[TVLatencyColorimeterTrainingView animateToStateName:completionHandler:](self->super._trainingView, "animateToStateName:completionHandler:", CFSTR("State02_Phone_Animation_In"), &stru_10017D6B0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
  v6 = objc_msgSend(v5, "testFlags");

  if (v6)
  {
    v7 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F6B9C;
    block[3] = &unk_10017E1F0;
    block[4] = self;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupProgressViewController viewDidDisappear:]", 30, "Progress ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)TVLatencyColorimeterSetupProgressViewController;
  -[TVLatencyColorimeterSetupProgressViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)_handleDismissButton
{
  id v3;

  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupProgressViewController _handleDismissButton]", 30, "Progress Dismiss button\n");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
  objc_msgSend(v3, "dismiss:", 5);

}

- (void)handleProgressEvent:(unsigned int)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  if (a3 == 278)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = sub_100117218(v4, CFSTR("Localizable-TVLatencyColorimeter"), CFSTR("TVL_COLOR_TURN_PHONE_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[TVLatencyColorimeterSetupProgressViewController setTitle:](self, "setTitle:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = sub_100117218(v7, CFSTR("Localizable-TVLatencyColorimeter"), CFSTR("TVL_COLOR_TURN_PHONE_SUBTITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[TVLatencyColorimeterSetupProgressViewController setSubtitle:](self, "setSubtitle:", v9);

    -[TVLatencyColorimeterTrainingView animateToStateName:completionHandler:](self->super._trainingView, "animateToStateName:completionHandler:", CFSTR("State03_Phone_Animation_Loop"), &stru_10017D6D0);
  }
}

- (void)_prepareTrainingAnimation
{
  TVLatencyColorimeterTrainingView *trainingView;
  TVLatencyColorimeterTrainingView *v4;
  TVLatencyColorimeterTrainingView *v5;
  TVLatencyColorimeterTrainingView *v6;
  TVLatencyColorimeterTrainingView *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  -[UIView setBackgroundColor:](self->super._animationContainerView, "setBackgroundColor:", 0);
  -[UIView setClipsToBounds:](self->super._animationContainerView, "setClipsToBounds:", 1);
  trainingView = self->super._trainingView;
  if (!trainingView)
  {
    v4 = [TVLatencyColorimeterTrainingView alloc];
    -[UIView bounds](self->super._animationContainerView, "bounds");
    v5 = -[TVLatencyColorimeterTrainingView initWithFrame:](v4, "initWithFrame:");
    v6 = self->super._trainingView;
    self->super._trainingView = v5;

    CGAffineTransformMakeScale(&v9, 0.609756098, 0.609756098);
    v7 = self->super._trainingView;
    v8 = v9;
    -[TVLatencyColorimeterTrainingView setTransform:](v7, "setTransform:", &v8);
    -[TVLatencyColorimeterTrainingView setUserInteractionEnabled:](self->super._trainingView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](self->super._animationContainerView, "addSubview:", self->super._trainingView);
    trainingView = self->super._trainingView;
  }
  -[TVLatencyColorimeterTrainingView setInitialState](trainingView, "setInitialState");
  -[TVLatencyColorimeterTrainingView setStateName:](self->super._trainingView, "setStateName:", CFSTR("State01_TVIcon"));
}

@end
