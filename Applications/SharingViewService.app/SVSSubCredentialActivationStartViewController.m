@implementation SVSSubCredentialActivationStartViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
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
  id v39;
  uint64_t v40;
  void *i;
  void *v42;
  uint64_t v43;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  id location;
  objc_super v89;
  _BYTE v90[128];
  _QWORD v91[8];

  v89.receiver = self;
  v89.super_class = (Class)SVSSubCredentialActivationStartViewController;
  -[SVSSubCredentialActivationStartViewController viewDidLoad](&v89, "viewDidLoad");
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController mainController](self, "mainController"));
  -[SVSSubCredentialActivationStartViewController setDismissalType:](self, "setDismissalType:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "cardTitle"));
  -[SVSSubCredentialActivationStartViewController setTitle:](self, "setTitle:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "cardSubtitle"));
  -[SVSSubCredentialActivationStartViewController setSubtitle:](self, "setSubtitle:", v4);

  location = 0;
  objc_initWeak(&location, self);
  v11 = sub_10011743C(CFSTR("Localizable-Subcredential"), CFSTR("SUBCREDENTIAL_ENTER_CODE"), v5, v6, v7, v8, v9, v10, v43);
  v78 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_10010DBB4;
  v86[3] = &unk_10017E008;
  objc_copyWeak(&v87, &location);
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v78, 0, v86));
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_10010DBE0;
  v84[3] = &unk_10017E008;
  objc_copyWeak(&v85, &location);
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", &stru_10017E3D8, 1, v84));
  -[SVSSubCredentialActivationStartViewController setOpenAction:](self, "setOpenAction:");
  v12 = -[SVSSubCredentialActivationStartViewController addAction:](self, "addAction:", v77);
  v13 = -[SVSSubCredentialActivationStartViewController addAction:](self, "addAction:", v76);
  v14 = objc_alloc_init((Class)UIImageView);
  -[SVSSubCredentialActivationStartViewController setAppIconImageView:](self, "setAppIconImageView:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  objc_msgSend(v16, "_setContinuousCornerRadius:", 20.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
  objc_msgSend(v18, "setMasksToBounds:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  objc_msgSend(v20, "setTintColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  objc_msgSend(v21, "addSubview:", v22);

  v23 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  -[SVSSubCredentialActivationStartViewController setActivityIndicator:](self, "setActivityIndicator:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController activityIndicator](self, "activityIndicator"));
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController activityIndicator](self, "activityIndicator"));
  objc_msgSend(v25, "setHidden:", 1);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController contentView](self, "contentView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController activityIndicator](self, "activityIndicator"));
  objc_msgSend(v26, "addSubview:", v27);

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "topAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController contentView](self, "contentView"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "mainContentGuide"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "topAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintGreaterThanOrEqualToAnchor:", v71));
  v91[0] = v70;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "centerYAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController contentView](self, "contentView"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "mainContentGuide"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "centerYAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
  v91[1] = v64;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "centerXAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController contentView](self, "contentView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "mainContentGuide"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "centerXAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
  v91[2] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "heightAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToConstant:", 98.0));
  v91[3] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "widthAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToConstant:", 98.0));
  v91[4] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bottomAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController contentView](self, "contentView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "mainContentGuide"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintLessThanOrEqualToAnchor:", v47));
  v91[5] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController activityIndicator](self, "activityIndicator"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "centerXAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "centerXAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v29));
  v91[6] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController activityIndicator](self, "activityIndicator"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "centerYAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerYAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));
  v91[7] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController contentView](self, "contentView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "actionButtons"));

  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v81;
    while (2)
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(_QWORD *)v81 != v40)
          objc_enumerationMutation(v38);
        v42 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v42, "proximityButtonType"))
        {
          v39 = v42;
          goto LABEL_11;
        }
      }
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
      if (v39)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v39, "setHidden:", 1);
  -[SVSSubCredentialActivationStartViewController setOpenButton:](self, "setOpenButton:", v39);

  objc_destroyWeak(&v85);
  objc_destroyWeak(&v87);

  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SVSSubCredentialActivationStartViewController;
  -[SVSSubCredentialActivationStartViewController viewWillAppear:](&v13, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController mainController](self, "mainController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImage](self, "appIconImage"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appName](self, "appName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImage](self, "appIconImage"));
    -[SVSSubCredentialActivationStartViewController updateAppName:image:](self, "updateAppName:image:", v7, v8);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
    objc_msgSend(v10, "setBackgroundColor:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController openButton](self, "openButton"));
    objc_msgSend(v11, "setHidden:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController activityIndicator](self, "activityIndicator"));
    objc_msgSend(v12, "setHidden:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController activityIndicator](self, "activityIndicator"));
    objc_msgSend(v7, "startAnimating");
  }

}

- (void)updateAppName:(id)a3 image:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  if (dword_1001A8AA8 <= 50 && (dword_1001A8AA8 != -1 || _LogCategory_Initialize(&dword_1001A8AA8, 50)))
    LogPrintF(&dword_1001A8AA8, "-[SVSSubCredentialActivationStartViewController updateAppName:image:]", 50, "Updating app icon.");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController activityIndicator](self, "activityIndicator"));
  objc_msgSend(v7, "setHidden:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController activityIndicator](self, "activityIndicator"));
  objc_msgSend(v8, "stopAnimating");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController openButton](self, "openButton"));
  if (objc_msgSend(v24, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController mainController](self, "mainController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appContent"));
    v12 = objc_msgSend(v11, "installed");

    if (v12)
      v19 = CFSTR("SUBCREDENTIAL_OPEN_BUTTON_INSTALLED");
    else
      v19 = CFSTR("SUBCREDENTIAL_OPEN_BUTTON_UNINSTALLED");
    v20 = sub_10011743C(CFSTR("Localizable-Subcredential"), v19, v13, v14, v15, v16, v17, v18, (uint64_t)v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v9, "setTitle:forState:", v21, 0);
    objc_msgSend(v9, "setHidden:", 0);

  }
  else
  {
    objc_msgSend(v9, "setHidden:", 1);
  }
  -[SVSSubCredentialActivationStartViewController setAppIconImage:](self, "setAppIconImage:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  objc_msgSend(v22, "setImage:", v6);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController appIconImageView](self, "appIconImageView"));
  objc_msgSend(v23, "setBackgroundColor:", 0);

}

- (void)_handleEnterCode
{
  id v3;
  _QWORD v4[4];
  id v5;

  if (dword_1001A8AA8 <= 50 && (dword_1001A8AA8 != -1 || _LogCategory_Initialize(&dword_1001A8AA8, 50)))
    LogPrintF(&dword_1001A8AA8, "-[SVSSubCredentialActivationStartViewController _handleEnterCode]", 50, "Enter code button pressed.");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10010D9A8;
  v4[3] = &unk_10017E1F0;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController mainController](self, "mainController"));
  v3 = v5;
  objc_msgSend(v3, "dismissAnimated:completion:", 1, v4);

}

- (void)_handleOpenApp
{
  void *v3;
  _QWORD v4[5];

  if (dword_1001A8AA8 <= 50 && (dword_1001A8AA8 != -1 || _LogCategory_Initialize(&dword_1001A8AA8, 50)))
    LogPrintF(&dword_1001A8AA8, "-[SVSSubCredentialActivationStartViewController _handleOpenApp]", 50, "Open app button pressed.");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SVSSubCredentialActivationStartViewController mainController](self, "mainController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10010D848;
  v4[3] = &unk_10017E1F0;
  v4[4] = self;
  objc_msgSend(v3, "dismissAnimated:completion:", 1, v4);

}

- (SubCredentialActivationMainController)mainController
{
  return (SubCredentialActivationMainController *)objc_loadWeakRetained((id *)&self->_mainController);
}

- (void)setMainController:(id)a3
{
  objc_storeWeak((id *)&self->_mainController, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImageView)appIconImageView
{
  return self->_appIconImageView;
}

- (void)setAppIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_appIconImageView, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UIImage)appIconImage
{
  return self->_appIconImage;
}

- (void)setAppIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_appIconImage, a3);
}

- (PRXAction)openAction
{
  return (PRXAction *)objc_loadWeakRetained((id *)&self->_openAction);
}

- (void)setOpenAction:(id)a3
{
  objc_storeWeak((id *)&self->_openAction, a3);
}

- (PRXButton)openButton
{
  return (PRXButton *)objc_loadWeakRetained((id *)&self->_openButton);
}

- (void)setOpenButton:(id)a3
{
  objc_storeWeak((id *)&self->_openButton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_openButton);
  objc_destroyWeak((id *)&self->_openAction);
  objc_storeStrong((id *)&self->_appIconImage, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_appIconImageView, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_destroyWeak((id *)&self->_mainController);
}

@end
