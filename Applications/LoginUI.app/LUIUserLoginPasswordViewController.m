@implementation LUIUserLoginPasswordViewController

+ (void)presentInNavigationController:(id)a3 user:(id)a4 passcodeViewDidAppearAction:(id)a5 passcodeCanceledAction:(id)a6 passcodeEnteredAction:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  LUIUserLoginPasswordViewController *v17;
  uint8_t v18[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Pushing the passcode view controller", v18, 2u);
  }
  v17 = objc_opt_new(LUIUserLoginPasswordViewController);
  -[LUIUserLoginPasswordViewController setUserInfo:](v17, "setUserInfo:", v12);
  -[LUIUserLoginPasswordViewController setPasscodeViewDidAppearAction:](v17, "setPasscodeViewDidAppearAction:", v13);
  -[LUIUserLoginPasswordViewController setPasscodeCanceledAction:](v17, "setPasscodeCanceledAction:", v14);
  -[LUIUserLoginPasswordViewController setPasscodeEnteredAction:](v17, "setPasscodeEnteredAction:", v15);
  objc_msgSend(v11, "pushViewController:animated:", v17, 1);

}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  LUIPasscodeView *v9;
  void *v10;
  LUIPasscodeView *v11;
  LUIPasscodeView *passcodeView;
  LUIPasscodeView *v13;
  void *v14;
  LUIPasscodeViewController *v15;
  void *v16;
  LUIPasscodeViewController *passcodeViewController;
  LUIPasscodeViewController *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)LUIUserLoginPasswordViewController;
  -[LUIUserLoginPasswordViewController viewDidLoad](&v21, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[LUIUserLoginPasswordViewController setKeyboardStyle](self, "setKeyboardStyle");
  v5 = objc_alloc((Class)UIVisualEffectView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 17));
  v7 = objc_msgSend(v5, "initWithEffect:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");

  objc_msgSend(v7, "setAutoresizingMask:", 18);
  v9 = [LUIPasscodeView alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  v11 = -[LUIPasscodeView initWithFrame:withPasscodeLockViewForStyle:](v9, "initWithFrame:withPasscodeLockViewForStyle:", self->_style);
  passcodeView = self->_passcodeView;
  self->_passcodeView = v11;

  -[LUIPasscodeView setAutoresizingMask:](self->_passcodeView, "setAutoresizingMask:", 18);
  v13 = self->_passcodeView;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController passcodeHintText](self, "passcodeHintText"));
  -[LUIPasscodeView setHintLabelText:](v13, "setHintLabelText:", v14);

  v15 = -[LUIPasscodeViewController initWithPasscodeView:]([LUIPasscodeViewController alloc], "initWithPasscodeView:", self->_passcodeView);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController userInfo](self, "userInfo"));
  -[LUIPasscodeViewController setUserInfo:](v15, "setUserInfo:", v16);

  -[LUIPasscodeViewController setDelegate:](v15, "setDelegate:", self);
  -[LUIPasscodeViewController checkForUserBackOff](v15, "checkForUserBackOff");
  -[LUIUserLoginPasswordViewController addChildViewController:](self, "addChildViewController:", v15);
  passcodeViewController = self->_passcodeViewController;
  self->_passcodeViewController = v15;
  v18 = v15;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController view](self, "view"));
  objc_msgSend(v19, "addSubview:", v7);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController view](self, "view"));
  objc_msgSend(v20, "addSubview:", self->_passcodeView);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIUserLoginPasswordViewController;
  -[LUIUserLoginPasswordViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  -[LUIPasscodeView becomeFirstResponder](self->_passcodeView, "becomeFirstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController passcodeViewDidAppearAction](self, "passcodeViewDidAppearAction"));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController passcodeViewDidAppearAction](self, "passcodeViewDidAppearAction"));
    v5[2]();

  }
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)LUIUserLoginPasswordViewController;
  -[LUIUserLoginPasswordViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)setKeyboardStyle
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;

  -[LUIUserLoginPasswordViewController setStyle:](self, "setStyle:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController userInfo](self, "userInfo"));

  if (v3)
  {
    v7 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController userInfo](self, "userInfo"));
    v6 = objc_msgSend(v4, "unlockScreenTypeForUser:outSimplePasscodeType:", v5, &v7);

    if (v6 == 1 || !v6 && v7 < 2)
      -[LUIUserLoginPasswordViewController setStyle:](self, "setStyle:");
  }
}

- (BOOL)shouldSetIdleTimerAsIfLocked
{
  return 0;
}

- (void)passcodeLockViewCancelButtonPressed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void (**v9)(void);
  uint8_t v10[16];

  v4 = a3;
  v5 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Password view is about to dissappear...", v10, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController navigationController](self, "navigationController"));
  v7 = objc_msgSend(v6, "popViewControllerAnimated:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController passcodeCanceledAction](self, "passcodeCanceledAction"));
  if (v8)
  {
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController passcodeCanceledAction](self, "passcodeCanceledAction"));
    v9[2]();

  }
}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Password entered", v10, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController passcodeEnteredAction](self, "passcodeEnteredAction"));

  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController passcodeEnteredAction](self, "passcodeEnteredAction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "passcode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserLoginPasswordViewController passcodeViewController](self, "passcodeViewController"));
    ((void (**)(_QWORD, void *, void *))v7)[2](v7, v8, v9);

  }
}

- (BOOL)shouldAllowUIUpdate
{
  return 0;
}

- (LKUser)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (NSString)passcodeHintText
{
  return self->_passcodeHintText;
}

- (void)setPasscodeHintText:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeHintText, a3);
}

- (id)passcodeViewDidAppearAction
{
  return self->_passcodeViewDidAppearAction;
}

- (void)setPasscodeViewDidAppearAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)passcodeCanceledAction
{
  return self->_passcodeCanceledAction;
}

- (void)setPasscodeCanceledAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)passcodeEnteredAction
{
  return self->_passcodeEnteredAction;
}

- (void)setPasscodeEnteredAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (LUIPasscodeView)passcodeView
{
  return self->_passcodeView;
}

- (void)setPasscodeView:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeView, a3);
}

- (LUIPasscodeViewController)passcodeViewController
{
  return self->_passcodeViewController;
}

- (void)setPasscodeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeViewController, a3);
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeViewController, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
  objc_storeStrong(&self->_passcodeEnteredAction, 0);
  objc_storeStrong(&self->_passcodeCanceledAction, 0);
  objc_storeStrong(&self->_passcodeViewDidAppearAction, 0);
  objc_storeStrong((id *)&self->_passcodeHintText, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
