@implementation CBOpeningViewController

+ (id)openingViewControllerForBootIntent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  CBOpeningViewController *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBBootIntentManager sharedInstance](CBBootIntentManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DIAGNOSTICS_DESCRIPTION"), &stru_1000769A0, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DIAGNOSTICS"), &stru_1000769A0, 0));

  if (objc_msgSend(v3, "currentBootIntentReason") == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SELF_SERVICE_REPAIR"), &stru_1000769A0, CFSTR("Localizable-SSR")));

    v12 = CFSTR("SELF_SERVICE_REPAIR_DESCRIPTION_IPHONE");
    if (v9 == (id)1)
      v12 = CFSTR("SELF_SERVICE_REPAIR_DESCRIPTION_IPAD");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v13, &stru_1000769A0, CFSTR("Localizable-SSR")));

    v16 = CFSTR("screwdriver.fill");
    v5 = (void *)v15;
    v7 = (void *)v11;
  }
  else
  {
    v16 = CFSTR("diagnostics.fill");
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_welcomeImageForSymbol:", v16));
  if (!v17)
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Diagnostics")));
  v18 = -[CBOpeningViewController initWithTitle:detailText:icon:]([CBOpeningViewController alloc], "initWithTitle:detailText:icon:", v7, v5, v17);

  return v18;
}

+ (id)_welcomeImageForSymbol:(id)a3
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
  double v12;
  void *v13;
  void *v14;
  id v16;
  id v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = objc_msgSend(objc_alloc((Class)IFSymbol), "initWithSymbolName:bundleURL:", v3, 0);
  v7 = (void *)objc_opt_new(IFGraphicSymbolDescriptor);
  v8 = objc_msgSend(objc_alloc((Class)IFColor), "initWithSystemColor:", 11);
  v17 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  objc_msgSend(v7, "setSymbolColors:", v9);

  v10 = objc_msgSend(objc_alloc((Class)IFColor), "initWithSystemColor:", 7);
  v16 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  objc_msgSend(v7, "setEnclosureColors:", v11);

  objc_msgSend(v7, "setRenderingMode:", 3);
  v12 = 85.0;
  if (v5 == (id)1)
    v12 = 60.0;
  objc_msgSend(v7, "setSize:", v12, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageForGraphicSymbolDescriptor:", v7));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", objc_msgSend(v13, "CGImage")));

  return v14;
}

- (BOOL)showingDeviceInformation
{
  return self->_showingDeviceInformation;
}

- (void)setShowingDeviceInformation:(BOOL)a3
{
  self->_showingDeviceInformation = a3;
}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (void)setInfoButton:(id)a3
{
  objc_storeStrong((id *)&self->_infoButton, a3);
}

- (UIView)deviceInformationView
{
  return self->_deviceInformationView;
}

- (void)setDeviceInformationView:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInformationView, a3);
}

- (id)remoteSetupManager
{
  return self->_remoteSetupManager;
}

- (void)setRemoteSetupManager:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSetupManager, a3);
}

- (id)remoteSetupAuthController
{
  return self->_remoteSetupAuthController;
}

- (void)setRemoteSetupAuthController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSetupAuthController, a3);
}

- (id)remoteSetupConfiguringController
{
  return self->_remoteSetupConfiguringController;
}

- (void)setRemoteSetupConfiguringController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSetupConfiguringController, a3);
}

- (id)remoteSetupQRCodeScannerController
{
  return self->_remoteSetupQRCodeScannerController;
}

- (void)setRemoteSetupQRCodeScannerController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSetupQRCodeScannerController, a3);
}

- (id)remoteSetupQRCodeScanner
{
  return self->_remoteSetupQRCodeScanner;
}

- (void)setRemoteSetupQRCodeScanner:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSetupQRCodeScanner, a3);
}

- (void)viewDidLoad
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Welcome Screen pane loaded", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)CBOpeningViewController;
  -[CBOpeningViewController viewDidLoad](&v5, "viewDidLoad");
  -[CBOpeningViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 2);
  -[CBOpeningViewController _setupVersionFooter](self, "_setupVersionFooter");
  -[CBOpeningViewController _setupOnboardingButtons](self, "_setupOnboardingButtons");
  -[CBOpeningViewController setShowingDeviceInformation:](self, "setShowingDeviceInformation:", 0);
  -[CBOpeningViewController setupInfoButton](self, "setupInfoButton");
  -[CBOpeningViewController _setupLanguageButton](self, "_setupLanguageButton");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CBOpeningViewController;
  -[CBOpeningViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
}

- (void)viewDidLayoutSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double MidX;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  void *v38;
  double v39;
  objc_super v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v40.receiver = self;
  v40.super_class = (Class)CBOpeningViewController;
  -[CBOpeningViewController viewDidLayoutSubviews](&v40, "viewDidLayoutSubviews");
  v3 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController infoButton](self, "infoButton"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController infoButton](self, "infoButton"));
    objc_msgSend(v5, "bringSubviewToFront:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController view](self, "view"));
    if (v3 == (id)1)
      v8 = 4;
    else
      v8 = 8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController infoButton](self, "infoButton"));
    objc_msgSend(v9, "bounds");
    objc_msgSend(v7, "_rectTuckedInBoundingPathCorner:withSize:cornerRadii:minimumPadding:", v8, v10, v11, 0.0, 0.0, 0.0, 0.0, 0.0);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController infoButton](self, "infoButton"));
    v41.origin.x = v13;
    v41.origin.y = v15;
    v41.size.width = v17;
    v41.size.height = v19;
    MidX = CGRectGetMidX(v41);
    v42.origin.x = v13;
    v42.origin.y = v15;
    v42.size.width = v17;
    v42.size.height = v19;
    objc_msgSend(v20, "setCenter:", MidX, CGRectGetMidY(v42));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController languageButton](self, "languageButton"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController view](self, "view"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController languageButton](self, "languageButton"));
    objc_msgSend(v23, "bringSubviewToFront:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController view](self, "view"));
    if (v3 == (id)1)
      v26 = 8;
    else
      v26 = 4;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController languageButton](self, "languageButton"));
    objc_msgSend(v27, "bounds");
    objc_msgSend(v25, "_rectTuckedInBoundingPathCorner:withSize:cornerRadii:minimumPadding:", v26, v28, v29, 0.0, 0.0, 0.0, 0.0, 0.0);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController languageButton](self, "languageButton"));
    v43.origin.x = v31;
    v43.origin.y = v33;
    v43.size.width = v35;
    v43.size.height = v37;
    v39 = CGRectGetMidX(v43);
    v44.origin.x = v31;
    v44.origin.y = v33;
    v44.size.width = v35;
    v44.size.height = v37;
    objc_msgSend(v38, "setPosition:", v39, CGRectGetMidY(v44));

  }
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dealloc was called in Opening View Controller", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)CBOpeningViewController;
  -[CBOpeningViewController dealloc](&v6, "dealloc");
}

- (void)_setupVersionFooter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (void *)MGCopyAnswer(CFSTR("BuildVersion"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OS_VERSION"), &stru_1000769A0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "systemName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "systemVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6, v7, v3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v9, "setCaptionText:style:", v8, 1);

}

- (void)_setupOnboardingButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("START_DIAGNOSTICS"), &stru_1000769A0, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("EXIT_DIAGNOSTICS"), &stru_1000769A0, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBBootIntentManager sharedInstance](CBBootIntentManager, "sharedInstance"));
  v7 = objc_msgSend(v6, "currentBootIntentReason");

  if (v7 == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("EXIT_SELF_SERVICE_REPAIR"), &stru_1000769A0, CFSTR("Localizable-SSR")));

    v5 = (void *)v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  objc_msgSend(v10, "setTitle:forState:", v16, 0);
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, "didTappedStartDiagnosticsButton", 64);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v11, "addButton:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", v5, &stru_1000769A0, 0));
  objc_msgSend(v12, "setTitle:forState:", v14, 0);

  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "didTappedExitButton", 64);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v15, "addButton:", v12);

}

- (void)didTappedStartDiagnosticsButton
{
  uint64_t v3;
  NSObject *v4;
  CBNetworkViewController *v5;
  void *v6;
  uint8_t v7[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Start Diagnostics] button tapped", v7, 2u);
  }

  v5 = -[CBNetworkViewController initWithSetupPresentationTheme:]([CBNetworkViewController alloc], "initWithSetupPresentationTheme:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (void)didTappedExitButton
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CBAlertManager sharedInstance](CBAlertManager, "sharedInstance"));
  objc_msgSend(v2, "showExitConfirmationWithCompletion:response:", 0, &stru_100075770);

}

- (void)_setupLanguageButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("LanguageGlyph")));
  objc_msgSend(v3, "setImage:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "background"));
  objc_msgSend(v5, "setCornerRadius:", 0.0);

  objc_msgSend(v3, "setContentInsets:", 24.0, 6.0, 6.0, 24.0);
  objc_initWeak(&location, self);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100010F00;
  v14 = &unk_100075798;
  objc_copyWeak(&v15, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v11));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v3, v6, v11, v12, v13, v14));
  -[CBOpeningViewController setLanguageButton:](self, "setLanguageButton:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController languageButton](self, "languageButton"));
  objc_msgSend(v8, "addSubview:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBOpeningViewController languageButton](self, "languageButton"));
  objc_msgSend(v10, "sizeToFit");

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)didTappedLanguageSelectorButton
{
  uint64_t v3;
  NSObject *v4;
  CBLanguageSelectorViewController *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Language Selector] button tapped", v8, 2u);
  }

  v5 = objc_alloc_init(CBLanguageSelectorViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBLocationController sharedLocationController](CBLocationController, "sharedLocationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "languageComposite"));
  -[CBLanguageSelectorViewController setLanguageComposite:](v5, "setLanguageComposite:", v7);

  -[CBOpeningViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (UIButton)languageButton
{
  return self->_languageButton;
}

- (void)setLanguageButton:(id)a3
{
  objc_storeStrong((id *)&self->_languageButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageButton, 0);
  objc_storeStrong((id *)&self->_remoteSetupQRCodeScanner, 0);
  objc_storeStrong((id *)&self->_remoteSetupQRCodeScannerController, 0);
  objc_storeStrong((id *)&self->_remoteSetupConfiguringController, 0);
  objc_storeStrong((id *)&self->_remoteSetupAuthController, 0);
  objc_storeStrong((id *)&self->_remoteSetupManager, 0);
  objc_storeStrong((id *)&self->_deviceInformationView, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
}

@end
