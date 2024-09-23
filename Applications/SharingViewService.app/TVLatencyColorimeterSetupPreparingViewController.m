@implementation TVLatencyColorimeterSetupPreparingViewController

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
  id v41;
  _QWORD v42[4];
  id v43;
  id location;
  objc_super v45;
  _QWORD v46[7];

  v45.receiver = self;
  v45.super_class = (Class)TVLatencyColorimeterSetupPreparingViewController;
  -[TVLatencyColorimeterSetupPreparingViewController viewDidLoad](&v45, "viewDidLoad");
  -[TVLatencyColorimeterSetupPreparingViewController setDismissalType:](self, "setDismissalType:", 1);
  location = 0;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10017E3D8, CFSTR("Localizable")));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000F7334;
  v42[3] = &unk_10017E008;
  objc_copyWeak(&v43, &location);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, 1, v42));

  v5 = -[TVLatencyColorimeterSetupPreparingViewController addAction:](self, "addAction:", v39);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = sub_100117218(v6, CFSTR("Localizable-TVLatency"), CFSTR("TLV_PREPARING_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[TVLatencyColorimeterSetupPreparingViewController setTitle:](self, "setTitle:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = sub_100117218(v9, CFSTR("Localizable-TVLatencyColorimeter"), CFSTR("TLV_SETTING_UP_COLOR_CALIBRATION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[TVLatencyColorimeterSetupPreparingViewController setSubtitle:](self, "setSubtitle:", v11);

  v12 = objc_alloc((Class)UIImageView);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("TV_Colorimeter")));
  v14 = objc_msgSend(v12, "initWithImage:", v13);

  objc_msgSend(v14, "setContentMode:", 1);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupPreparingViewController contentView](self, "contentView"));
  objc_msgSend(v15, "addSubview:", v14);

  v41 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupPreparingViewController contentView](self, "contentView"));
  objc_msgSend(v16, "addSubview:", v41);

  objc_msgSend(v41, "startAnimating");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupPreparingViewController contentView](self, "contentView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mainContentGuide"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v46[0] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:", v34));
  v46[1] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v46[2] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v46[3] = v27;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "heightAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 150.0));
  v46[4] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerXAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
  v46[5] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "centerYAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -6.0));
  v46[6] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupPreparingViewController viewWillAppear:]", 30, "Preparing ViewWillAppear\n");
  v5.receiver = self;
  v5.super_class = (Class)TVLatencyColorimeterSetupPreparingViewController;
  -[TVLatencyColorimeterSetupPreparingViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (void)_handleDismissButton
{
  id v3;

  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupPreparingViewController _handleDismissButton]", 30, "Dismiss button\n");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
  objc_msgSend(v3, "dismiss:", 5);

}

@end
