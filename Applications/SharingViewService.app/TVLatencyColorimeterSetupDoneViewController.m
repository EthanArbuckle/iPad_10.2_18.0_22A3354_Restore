@implementation TVLatencyColorimeterSetupDoneViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  UIImageView *v12;
  UIImageView *statusImageViewIcon;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id location;
  objc_super v47;
  _QWORD v48[9];

  v47.receiver = self;
  v47.super_class = (Class)TVLatencyColorimeterSetupDoneViewController;
  -[TVLatencyColorimeterSetupDoneViewController viewDidLoad](&v47, "viewDidLoad");
  -[TVLatencyColorimeterSetupDoneViewController setDismissalType:](self, "setDismissalType:", 3);
  location = 0;
  objc_initWeak(&location, self);
  v3 = sub_1001171A8(CFSTR("Localizable"), CFSTR("DONE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000F7D34;
  v44[3] = &unk_10017E008;
  objc_copyWeak(&v45, &location);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, 0, v44));

  v5 = -[TVLatencyColorimeterSetupDoneViewController addAction:](self, "addAction:", v42);
  v6 = objc_alloc((Class)UIImageView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("TV_Colorimeter")));
  v8 = objc_msgSend(v6, "initWithImage:", v7);

  objc_msgSend(v8, "setContentMode:", 1);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupDoneViewController contentView](self, "contentView"));
  objc_msgSend(v9, "addSubview:", v8);

  v10 = objc_alloc((Class)UIImageView);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("exclamationmark.circle")));
  v12 = (UIImageView *)objc_msgSend(v10, "initWithImage:", v11);
  statusImageViewIcon = self->super._statusImageViewIcon;
  self->super._statusImageViewIcon = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  -[UIImageView setTintColor:](self->super._statusImageViewIcon, "setTintColor:", v14);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->super._statusImageViewIcon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupDoneViewController contentView](self, "contentView"));
  objc_msgSend(v15, "addSubview:", self->super._statusImageViewIcon);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupDoneViewController contentView](self, "contentView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mainContentGuide"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v48[0] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintLessThanOrEqualToAnchor:", v37));
  v48[1] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v48[2] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v48[3] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "heightAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToConstant:", 150.0));
  v48[4] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->super._statusImageViewIcon, "centerXAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v48[5] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->super._statusImageViewIcon, "centerYAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -6.0));
  v48[6] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->super._statusImageViewIcon, "widthAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:", 40.0));
  v48[7] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->super._statusImageViewIcon, "heightAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", 40.0));
  v48[8] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSError *error;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  objc_super v24;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupDoneViewController viewWillAppear:]", 30, "Done ViewWillAppear\n");
  v24.receiver = self;
  v24.super_class = (Class)TVLatencyColorimeterSetupDoneViewController;
  -[TVLatencyColorimeterSetupDoneViewController viewWillAppear:](&v24, "viewWillAppear:", v3);
  error = self->_error;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if (error)
  {
    v8 = sub_100117218(v6, CFSTR("Localizable-TVLatencyColorimeter"), CFSTR("TLV_COLOR_FAILED_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[TVLatencyColorimeterSetupDoneViewController setTitle:](self, "setTitle:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = sub_100117218(v10, CFSTR("Localizable-TVLatencyColorimeter"), CFSTR("TLV_COLOR_FAILED_SUBTITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[TVLatencyColorimeterSetupDoneViewController setSubtitle:](self, "setSubtitle:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v14 = CFSTR("exclamationmark.circle");
  }
  else
  {
    if (self->_completed)
      v15 = CFSTR("TVL_COLOR_SUCCESS_TITLE");
    else
      v15 = CFSTR("TVL_COLOR_SUCCESS2_TITLE");
    v16 = sub_100117218(v6, CFSTR("Localizable-TVLatencyColorimeter"), v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[TVLatencyColorimeterSetupDoneViewController setTitle:](self, "setTitle:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = v18;
    if (self->_completed)
      v20 = CFSTR("TVL_COLOR_SUCCESS_SUBTITLE");
    else
      v20 = CFSTR("TVL_COLOR_SUCCESS2_SUBTITLE");
    v21 = sub_100117218(v18, CFSTR("Localizable-TVLatencyColorimeter"), v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[TVLatencyColorimeterSetupDoneViewController setSubtitle:](self, "setSubtitle:", v22);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.203921569, 0.470588235, 0.964705882, 1.0));
    v14 = CFSTR("checkmark.circle");
  }
  -[UIImageView setTintColor:](self->super._statusImageViewIcon, "setTintColor:", v13);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v14));
  -[UIImageView setImage:](self->super._statusImageViewIcon, "setImage:", v23);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupDoneViewController viewDidDisappear:]", 30, "Done ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)TVLatencyColorimeterSetupDoneViewController;
  -[TVLatencyColorimeterSetupDoneViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)_handleDismissButton
{
  id v3;

  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupDoneViewController _handleDismissButton]", 30, "Done button\n");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
  objc_msgSend(v3, "dismiss:", 5);

}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
