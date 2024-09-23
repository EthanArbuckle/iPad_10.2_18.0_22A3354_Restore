@implementation TVLatencyColorimeterSetupTryAgainViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  UIImageView *v21;
  UIImageView *statusImageViewIcon;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  id location;
  objc_super v59;
  _QWORD v60[9];

  v59.receiver = self;
  v59.super_class = (Class)TVLatencyColorimeterSetupTryAgainViewController;
  -[TVLatencyColorimeterSetupTryAgainViewController viewDidLoad](&v59, "viewDidLoad");
  -[TVLatencyColorimeterSetupTryAgainViewController setDismissalType:](self, "setDismissalType:", 3);
  location = 0;
  objc_initWeak(&location, self);
  v3 = sub_1001171A8(CFSTR("Localizable"), CFSTR("TRY_AGAIN"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1000F6184;
  v56[3] = &unk_10017E008;
  objc_copyWeak(&v57, &location);
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, 0, v56));

  v5 = -[TVLatencyColorimeterSetupTryAgainViewController addAction:](self, "addAction:", v52);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10017E3D8, CFSTR("Localizable")));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1000F61B0;
  v54[3] = &unk_10017E008;
  objc_copyWeak(&v55, &location);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v7, 1, v54));

  v8 = -[TVLatencyColorimeterSetupTryAgainViewController addAction:](self, "addAction:", v51);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = sub_100117218(v9, CFSTR("Localizable-TVLatencyColorimeter"), CFSTR("TLV_COLOR_TRYAGAIN_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[TVLatencyColorimeterSetupTryAgainViewController setTitle:](self, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = sub_100117218(v12, CFSTR("Localizable-TVLatencyColorimeter"), CFSTR("TLV_COLOR_TRYAGAIN_SUBTITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[TVLatencyColorimeterSetupTryAgainViewController setSubtitle:](self, "setSubtitle:", v14);

  v15 = objc_alloc((Class)UIImageView);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("TV_Colorimeter")));
  v17 = objc_msgSend(v15, "initWithImage:", v16);

  objc_msgSend(v17, "setContentMode:", 1);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupTryAgainViewController contentView](self, "contentView"));
  objc_msgSend(v18, "addSubview:", v17);

  v19 = objc_alloc((Class)UIImageView);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("exclamationmark.circle")));
  v21 = (UIImageView *)objc_msgSend(v19, "initWithImage:", v20);
  statusImageViewIcon = self->super._statusImageViewIcon;
  self->super._statusImageViewIcon = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  -[UIImageView setTintColor:](self->super._statusImageViewIcon, "setTintColor:", v23);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->super._statusImageViewIcon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupTryAgainViewController contentView](self, "contentView"));
  objc_msgSend(v24, "addSubview:", self->super._statusImageViewIcon);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupTryAgainViewController contentView](self, "contentView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mainContentGuide"));

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v60[0] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintLessThanOrEqualToAnchor:", v46));
  v60[1] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
  v60[2] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v60[3] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "heightAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToConstant:", 150.0));
  v60[4] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->super._statusImageViewIcon, "centerXAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v60[5] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->super._statusImageViewIcon, "centerYAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerYAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -6.0));
  v60[6] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->super._statusImageViewIcon, "widthAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToConstant:", 40.0));
  v60[7] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->super._statusImageViewIcon, "heightAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToConstant:", 40.0));
  v60[8] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

  objc_destroyWeak(&v55);
  objc_destroyWeak(&v57);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupTryAgainViewController viewWillAppear:]", 30, "TryAgain ViewWillAppear\n");
  v5.receiver = self;
  v5.super_class = (Class)TVLatencyColorimeterSetupTryAgainViewController;
  -[TVLatencyColorimeterSetupTryAgainViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupTryAgainViewController viewDidDisappear:]", 30, "TryAgain ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)TVLatencyColorimeterSetupTryAgainViewController;
  -[TVLatencyColorimeterSetupTryAgainViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)_handleTryAgainButton
{
  void *v3;
  id v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];

  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupTryAgainViewController _handleTryAgainButton]", 30, "TryAgain button\n");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
  v4 = objc_msgSend(v3, "testFlags");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
  objc_msgSend(v5, "showProgressUI");

  if (!v4)
  {
    v6 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F613C;
    block[3] = &unk_10017E1F0;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_handleDismissButton
{
  id v3;

  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupTryAgainViewController _handleDismissButton]", 30, "TryAgain button\n");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
  objc_msgSend(v3, "dismiss:", 5);

}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
