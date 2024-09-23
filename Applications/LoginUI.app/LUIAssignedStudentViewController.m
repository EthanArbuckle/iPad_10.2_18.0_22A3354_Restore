@implementation LUIAssignedStudentViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUIAssignedStudentViewController;
  -[LUIDashBoardViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController dashBoardView](self, "dashBoardView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController userInfo](self, "userInfo"));
  objc_msgSend(v3, "setUser:isTemporarySession:", v4, 0);

  if (MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0) == 2)
    -[LUIAssignedStudentViewController _fetchAuthMode](self, "_fetchAuthMode");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIAssignedStudentViewController;
  -[LUIAssignedStudentViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController userInfo](self, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  +[CRKStudentDaemonProxy setActiveStudentIdentifier:completion:](CRKStudentDaemonProxy, "setActiveStudentIdentifier:completion:", v5, &stru_1000694D8);

}

- (void)userActionTriggered
{
  -[LUIAssignedStudentViewController _startUnlockingDevice](self, "_startUnlockingDevice");
}

- (id)callToActionLabelText
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2 == 2)
    v5 = CFSTR("SWIPE_UP_TO_UNLOCK");
  else
    v5 = CFSTR("PRESS_HOME_TO_UNLOCK");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_100069EB8, 0));

  return v6;
}

- (void)bottomLeftVibrantButtonTapped:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  +[CRKStudentDaemonProxy setActiveStudentIdentifier:completion:](CRKStudentDaemonProxy, "setActiveStudentIdentifier:completion:", 0, &stru_1000694F8);
  v5.receiver = self;
  v5.super_class = (Class)LUIAssignedStudentViewController;
  -[LUIDashBoardViewController bottomLeftVibrantButtonTapped:](&v5, "bottomLeftVibrantButtonTapped:", v4);

}

- (void)presentPasscodeViewControllerForUser:(id)a3 passcodeViewDidAppearAction:(id)a4 passcodeCanceledAction:(id)a5 passcodeEnteredAction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[LUIAssignedStudentViewController navigationController](self, "navigationController"));
  +[LUIUserLoginPasswordViewController presentInNavigationController:user:passcodeViewDidAppearAction:passcodeCanceledAction:passcodeEnteredAction:](LUIUserLoginPasswordViewController, "presentInNavigationController:user:passcodeViewDidAppearAction:passcodeCanceledAction:passcodeEnteredAction:", v14, v13, v12, v11, v10);

}

- (BOOL)shouldUpdateStudentStatusWithClassroom
{
  return 0;
}

- (void)_fetchAuthMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[LUIAssignedStudentViewController setIsFetchingAuthMode:](self, "setIsFetchingAuthMode:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController swipeUpAnimationController](self, "swipeUpAnimationController"));
  objc_msgSend(v3, "setEnabled:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController dashBoardView](self, "dashBoardView"));
  objc_msgSend(v4, "setCallToActionLabelEnabled:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController dashBoardView](self, "dashBoardView"));
  objc_msgSend(v5, "startProgressAnimation");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LUIAuthenticationController sharedController](LUIAuthenticationController, "sharedController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController userInfo](self, "userInfo"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100018AF0;
  v8[3] = &unk_100069520;
  v8[4] = self;
  objc_msgSend(v6, "fetchAuthModeIfNeededWithUser:completionHandler:", v7, v8);

}

- (void)_startUnlockingDevice
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController userInfo](self, "userInfo"));
  if (objc_msgSend(v3, "userExists:", v4))
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
    v6 = objc_msgSend(v5, "presentUserLimitIsReachedAlertIfNeeded");

    if ((v6 & 1) != 0)
      return;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(+[LUIAuthenticationController sharedController](LUIAuthenticationController, "sharedController"));
  objc_msgSend(v8, "setDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController userInfo](self, "userInfo"));
  objc_msgSend(v8, "startLoginFlowForUser:", v7);

}

- (BOOL)isFetchingAuthMode
{
  return self->_isFetchingAuthMode;
}

- (void)setIsFetchingAuthMode:(BOOL)a3
{
  self->_isFetchingAuthMode = a3;
}

@end
