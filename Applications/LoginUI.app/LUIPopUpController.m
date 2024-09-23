@implementation LUIPopUpController

+ (id)sharedInstance
{
  if (qword_100088EE0 != -1)
    dispatch_once(&qword_100088EE0, &stru_100069DE8);
  return (id)qword_100088ED8;
}

- (LUIPopUpController)init
{
  LUIPopUpController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIPopUpController;
  v2 = -[LUIPopUpController init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
    objc_storeWeak((id *)&v2->_appDelegate, v4);

    objc_storeWeak((id *)&v2->_presentationControllerForPopUpViewOnScreen, 0);
  }
  return v2;
}

- (void)showPopUp:(unint64_t)a3 forUser:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPopUpController presentationControllerForPopUpViewOnScreen](self, "presentationControllerForPopUpViewOnScreen"));
  if (v10)
  {

    goto LABEL_4;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
  v12 = objc_msgSend(v11, "isViewUpdateDisabled");

  if ((v12 & 1) != 0)
  {
LABEL_4:
    v13 = qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Can't present the pop up view because there is already a popover presented on the screen or view updates are disabled", v18, 2u);
    }
    goto LABEL_6;
  }
  switch(a3)
  {
    case 0uLL:
      v14 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Presenting the WiFi Picker...", buf, 2u);
      }
      -[LUIPopUpController presentWiFiPickerWithCompletionHandler:](self, "presentWiFiPickerWithCompletionHandler:", v9);
      break;
    case 1uLL:
      v17 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Presenting the Privacy View...", v21, 2u);
      }
      -[LUIPopUpController presentPrivacyViewWithCompletionHandler:](self, "presentPrivacyViewWithCompletionHandler:", v9);
      break;
    case 2uLL:
      v15 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Presenting the User Info View...", v20, 2u);
      }
      -[LUIPopUpController presentUserInfoForUser:completionHandler:](self, "presentUserInfoForUser:completionHandler:", v8, v9);
      break;
    case 3uLL:
      v16 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Presenting the perf test done view...", v19, 2u);
      }
      -[LUIPopUpController presentPerformanceTestHintView](self, "presentPerformanceTestHintView");
      break;
    default:
      break;
  }
LABEL_6:

}

- (void)presentWiFiPickerWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  LUINavigationController *v13;
  uint8_t v14[16];

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPopUpController appDelegate](self, "appDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
    v9 = objc_msgSend(v8, "isWiFiPickerSuppressed");

    if (!v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIWiFiController sharedController](LUIWiFiController, "sharedController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewController"));

      v13 = -[LUINavigationController initWithRootViewController:]([LUINavigationController alloc], "initWithRootViewController:", v12);
      -[LUINavigationController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 2);
      -[LUINavigationController setModalTransitionStyle:](v13, "setModalTransitionStyle:", 2);
      objc_msgSend(v6, "presentViewController:animated:completion:", v13, 1, 0);

      if (!v4)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v10 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There is already a pop up view on the screen or wifi picker is suppressed. WiFi picker can't be shown", v14, 2u);
  }
  if (v4)
LABEL_6:
    v4[2](v4);
LABEL_7:

}

- (void)presentUserInfoForUser:(id)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  LUIUserInfoViewController *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v12)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPopUpController appDelegate](self, "appDelegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topViewController"));

    if (v9)
    {
      v10 = -[LUIUserInfoViewController initWithNibName:bundle:]([LUIUserInfoViewController alloc], "initWithNibName:bundle:", 0, 0);
      -[LUIUserInfoViewController setUser:](v10, "setUser:", v12);
      -[LUIUserInfoViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 2);
      -[LUIUserInfoViewController setModalTransitionStyle:](v10, "setModalTransitionStyle:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationController"));
      objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

    }
  }
  if (v6)
    v6[2](v6);

}

- (void)presentPrivacyViewWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LUIManagedDevicesNavigationController *v12;
  void *v13;
  void (**v14)(void);

  v14 = (void (**)(void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPopUpController appDelegate](self, "appDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cloudConfigurationDetails"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMCCCOrganizationNameKey));

    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "classConfiguration"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "schoolName"));

    }
    v12 = -[LUIManagedDevicesNavigationController initWithOrganizationName:]([LUIManagedDevicesNavigationController alloc], "initWithOrganizationName:", v10);
    -[LUIManagedDevicesNavigationController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 2);
    -[LUIManagedDevicesNavigationController setModalTransitionStyle:](v12, "setModalTransitionStyle:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationController"));
    objc_msgSend(v13, "presentViewController:animated:completion:", v12, 1, 0);

  }
  if (v14)
    v14[2]();

}

- (void)presentPerformanceTestHintView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  LUIPerformanceTestHintViewController *v7;

  v7 = objc_opt_new(LUIPerformanceTestHintViewController);
  -[LUIPerformanceTestHintViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
  -[LUIPerformanceTestHintViewController setModalTransitionStyle:](v7, "setModalTransitionStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPopUpController appDelegate](self, "appDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationController"));
  objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

}

- (AppDelegate)appDelegate
{
  return (AppDelegate *)objc_loadWeakRetained((id *)&self->_appDelegate);
}

- (UIPopoverPresentationController)presentationControllerForPopUpViewOnScreen
{
  return (UIPopoverPresentationController *)objc_loadWeakRetained((id *)&self->_presentationControllerForPopUpViewOnScreen);
}

- (void)setPresentationControllerForPopUpViewOnScreen:(id)a3
{
  objc_storeWeak((id *)&self->_presentationControllerForPopUpViewOnScreen, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationControllerForPopUpViewOnScreen);
  objc_destroyWeak((id *)&self->_appDelegate);
}

@end
