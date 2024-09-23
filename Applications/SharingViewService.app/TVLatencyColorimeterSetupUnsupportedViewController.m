@implementation TVLatencyColorimeterSetupUnsupportedViewController

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
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  UIImageView *v18;
  UIImageView *statusImageViewIcon;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id location;
  objc_super v53;
  _QWORD v54[9];

  v53.receiver = self;
  v53.super_class = (Class)TVLatencyColorimeterSetupUnsupportedViewController;
  -[TVLatencyColorimeterSetupUnsupportedViewController viewDidLoad](&v53, "viewDidLoad");
  -[TVLatencyColorimeterSetupUnsupportedViewController setDismissalType:](self, "setDismissalType:", 3);
  location = 0;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10017E3D8, CFSTR("Localizable")));
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000F86EC;
  v50[3] = &unk_10017E008;
  objc_copyWeak(&v51, &location);
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, 1, v50));

  v5 = -[TVLatencyColorimeterSetupUnsupportedViewController addAction:](self, "addAction:", v48);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = sub_100117218(v6, CFSTR("Localizable-TVLatencyColorimeter"), CFSTR("TLV_COLOR_UNSUPPORTED_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[TVLatencyColorimeterSetupUnsupportedViewController setTitle:](self, "setTitle:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = sub_100117218(v9, CFSTR("Localizable-TVLatencyColorimeter"), CFSTR("TLV_COLOR_UNSUPPORTED_SUBTITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[TVLatencyColorimeterSetupUnsupportedViewController setSubtitle:](self, "setSubtitle:", v11);

  v12 = objc_alloc((Class)UIImageView);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("TV_Colorimeter")));
  v14 = objc_msgSend(v12, "initWithImage:", v13);

  objc_msgSend(v14, "setContentMode:", 1);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupUnsupportedViewController contentView](self, "contentView"));
  objc_msgSend(v15, "addSubview:", v14);

  v16 = objc_alloc((Class)UIImageView);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("exclamationmark.circle")));
  v18 = (UIImageView *)objc_msgSend(v16, "initWithImage:", v17);
  statusImageViewIcon = self->super._statusImageViewIcon;
  self->super._statusImageViewIcon = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  -[UIImageView setTintColor:](self->super._statusImageViewIcon, "setTintColor:", v20);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->super._statusImageViewIcon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupUnsupportedViewController contentView](self, "contentView"));
  objc_msgSend(v21, "addSubview:", self->super._statusImageViewIcon);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupUnsupportedViewController contentView](self, "contentView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mainContentGuide"));

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v54[0] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:", v43));
  v54[1] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v54[2] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v54[3] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "heightAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToConstant:", 150.0));
  v54[4] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->super._statusImageViewIcon, "centerXAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerXAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v54[5] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->super._statusImageViewIcon, "centerYAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -6.0));
  v54[6] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->super._statusImageViewIcon, "widthAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToConstant:", 40.0));
  v54[7] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->super._statusImageViewIcon, "heightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToConstant:", 40.0));
  v54[8] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

  objc_destroyWeak(&v51);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupUnsupportedViewController viewWillAppear:]", 30, "Unsupported ViewWillAppear\n");
  v5.receiver = self;
  v5.super_class = (Class)TVLatencyColorimeterSetupUnsupportedViewController;
  -[TVLatencyColorimeterSetupUnsupportedViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupUnsupportedViewController viewDidDisappear:]", 30, "Unsupported ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)TVLatencyColorimeterSetupUnsupportedViewController;
  -[TVLatencyColorimeterSetupUnsupportedViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)_handleDismissButton
{
  id v3;

  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupUnsupportedViewController _handleDismissButton]", 30, "Unsupported button\n");
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
