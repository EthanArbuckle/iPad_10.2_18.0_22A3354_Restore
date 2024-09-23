@implementation LUIDashBoardViewController

- (void)loadView
{
  LUIDashBoardView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  LUIDashBoardView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)LUIDashBoardViewController;
  -[LUIDashBoardViewController loadView](&v19, "loadView");
  v3 = [LUIDashBoardView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController callToActionLabelText](self, "callToActionLabelText"));
  v14 = -[LUIDashBoardView initWithFrame:callToActionLabelText:](v3, "initWithFrame:callToActionLabelText:", v13, v6, v8, v10, v12);
  -[LUIDashBoardViewController setDashBoardView:](self, "setDashBoardView:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController dashBoardView](self, "dashBoardView"));
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController dashBoardView](self, "dashBoardView"));
  objc_msgSend(v16, "addSubview:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController view](self, "view"));
  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("LUIDashBoardView"));

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUIDashBoardViewController;
  -[LUIDashBoardViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  if (MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0) == 2)
    -[LUIDashBoardViewController _setupGesture](self, "_setupGesture");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIHomeButtonController sharedController](LUIHomeButtonController, "sharedController"));
  objc_msgSend(v5, "activateTapType:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "homeButtonSingleTapped", CFSTR("LUIHomeButtonSingleTapNofication"), 0);

  v7.receiver = self;
  v7.super_class = (Class)LUIDashBoardViewController;
  -[LUIMajorViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LUIHomeButtonController sharedController](LUIHomeButtonController, "sharedController"));
  objc_msgSend(v6, "deactivateTapType:", 0);

  v7.receiver = self;
  v7.super_class = (Class)LUIDashBoardViewController;
  -[LUIDashBoardViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v3 = objc_msgSend(v2, "statusBarStyle");

  return (int64_t)v3;
}

- (void)_setupGesture
{
  LUISwipeUpAnimationController *v3;
  void *v4;
  id v5;

  v3 = objc_opt_new(LUISwipeUpAnimationController);
  -[LUIDashBoardViewController setSwipeUpAnimationController:](self, "setSwipeUpAnimationController:", v3);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController swipeUpAnimationController](self, "swipeUpAnimationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController dashBoardView](self, "dashBoardView"));
  objc_msgSend(v5, "startTrackingSwipeUpGestureForView:delegate:", v4, self);

}

- (id)callToActionLabelText
{
  return 0;
}

- (void)bottomLeftVibrantButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t v7[16];

  v4 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dashboard vcreen is about to dissappear...", v7, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController navigationController](self, "navigationController"));
  v6 = objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (BOOL)shouldShowBottomLeftVibrantButton
{
  return 1;
}

- (int64_t)imageTypeForBottomLeftVibrantButton
{
  return 2;
}

- (id)titleForBottomLeftVibrantButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOT_YOU_BUTTON_TITLE"), &stru_100069EB8, 0));

  return v3;
}

- (void)homeButtonSingleTapped
{
  -[LUIDashBoardViewController userActionTriggered](self, "userActionTriggered");
}

- (void)swipeUpAnimationControllerSwipeGestureDidPassThreshold:(id)a3
{
  -[LUIDashBoardViewController userActionTriggered](self, "userActionTriggered", a3);
}

- (void)swipeUpAnimationControllerSwipeGestureDidBegin:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController dashBoardView](self, "dashBoardView", a3));
  objc_msgSend(v3, "setCallToActionLabelEnabled:", 0);

}

- (void)swipeUpAnimationControllerSwipeGestureDidEnd:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController dashBoardView](self, "dashBoardView", a3));
  objc_msgSend(v3, "setCallToActionLabelEnabled:", 1);

}

- (LKUser)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (LUIDashBoardView)dashBoardView
{
  return self->_dashBoardView;
}

- (void)setDashBoardView:(id)a3
{
  objc_storeStrong((id *)&self->_dashBoardView, a3);
}

- (LUISwipeUpAnimationController)swipeUpAnimationController
{
  return self->_swipeUpAnimationController;
}

- (void)setSwipeUpAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_swipeUpAnimationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeUpAnimationController, 0);
  objc_storeStrong((id *)&self->_dashBoardView, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
