@implementation FBALoginViewController

- (id)log
{
  if (qword_100117FB8 != -1)
    dispatch_once(&qword_100117FB8, &stru_1000E66C8);
  return (id)qword_100117FB0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  id v32;
  id v33;
  void **v34;
  uint64_t v35;
  void (*v36)(uint64_t, int);
  void *v37;
  FBALoginViewController *v38;
  id v39;
  id location;
  objc_super v41;
  _QWORD v42[2];
  _QWORD v43[2];

  v41.receiver = self;
  v41.super_class = (Class)FBALoginViewController;
  -[FBALoginViewController viewDidLoad](&v41, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForKey:", CFSTR("LastSuccessfulLogin")));
  -[FBALoginViewController setPrefilledUsername:](self, "setPrefilledUsername:", v4);

  v5 = objc_alloc_init((Class)AAUISignInViewController);
  -[FBALoginViewController setSignInViewController:](self, "setSignInViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
  objc_msgSend(v6, "setDelegate:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
  objc_msgSend(v7, "setAllowsAccountCreation:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
  objc_msgSend(v8, "setCanEditUsername:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
  objc_msgSend(v9, "setShowServiceIcons:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("fba-ios-128")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
  objc_msgSend(v11, "setHeaderImage:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController prefilledUsername](self, "prefilledUsername"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
  objc_msgSend(v13, "setUsername:", v12);

  if (+[FBARootSplitViewController presentsAuthKitUIModally](FBARootSplitViewController, "presentsAuthKitUIModally"))
  {
    if ((-[FBALoginViewController pendingStartupUI](self, "pendingStartupUI") & 2) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController storyboard](self, "storyboard"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "instantiateViewControllerWithIdentifier:", CFSTR("FBALegalViewController")));

      objc_initWeak(&location, self);
      v34 = _NSConcreteStackBlock;
      v35 = 3221225472;
      v36 = sub_1000177FC;
      v37 = &unk_1000E6730;
      objc_copyWeak(&v39, &location);
      v38 = self;
      objc_msgSend(v15, "setCompletion:", &v34);
      v32 = objc_alloc((Class)UINavigationController);
      v33 = objc_msgSend(v32, "initWithRootViewController:", v15, v34, v35, v36, v37);
      objc_msgSend(v33, "setToolbarHidden:", 0);
      -[FBALoginViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v33, 0, 0);

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
      objc_msgSend(v14, "setModalInPresentation:", 1);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
      -[FBALoginViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 0, 0);
    }
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController view](self, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
    objc_msgSend(v16, "addSubview:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
    objc_msgSend(v19, "willMoveToParentViewController:", self);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
    -[FBALoginViewController addChildViewController:](self, "addChildViewController:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
    objc_msgSend(v21, "didMoveToParentViewController:", self);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v42[0] = CFSTR("childView");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "view"));
    v43[0] = v25;
    v42[1] = CFSTR("containerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController view](self, "view"));
    v43[1] = v26;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-padding-[childView]-padding-|"), 0, &off_1000EEA70, v15));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-padding-[childView]-padding-|"), 0, &off_1000EEA98, v15));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController view](self, "view"));
    objc_msgSend(v29, "addConstraints:", v27);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController view](self, "view"));
    objc_msgSend(v30, "addConstraints:", v28);

  }
}

- (id)environmentDescription
{
  unsigned int v2;
  unsigned int v3;
  __CFString *v4;
  uint64_t v5;
  const __CFString *v6;

  if (FBKIsInternalInstall(self, a2))
  {
    v2 = +[iFBAConstants environment](iFBAConstants, "environment");
    v3 = +[iFBAConstants currentIDMSEnvironmentMatchesCurrentFBKSEnvironment](iFBAConstants, "currentIDMSEnvironmentMatchesCurrentFBKSEnvironment");
    if ((v3 & (v2 == 0)) != 0)
      v4 = 0;
    else
      v4 = CFSTR("[Error: FBA ≠ IDMS Environment]");
    if ((v3 & (v2 == 0)) == 0 && v3)
    {
      v5 = (int)+[iFBAConstants environment](iFBAConstants, "environment") - 1;
      if (v5 > 3)
        v6 = CFSTR("Prod");
      else
        v6 = *(&off_1000E6798 + v5);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Environment: %@]"), v6));
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBALoginViewController;
  -[FBALoginViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController navigationController](self, "navigationController"));
  objc_msgSend(v4, "setNavigationBarHidden:", 1);

  -[FBALoginViewController updateLoginViewVisibility](self, "updateLoginViewVisibility");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  objc_msgSend(v6, "removeBlurView");

}

- (void)showLogInUI
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  if (v3 && objc_msgSend(v3, "isHidden"))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "showing login UI", v5, 2u);
    }

    objc_msgSend(v3, "setHidden:", 0);
  }

}

- (void)hideLogInUI
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "hiding login UI", v5, 2u);
    }

    objc_msgSend(v3, "setHidden:", 1);
  }

}

- (void)updateLoginViewVisibility
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loginManager"));
  v5 = objc_msgSend(v4, "loginState");

  if (v5 == (id)1)
    -[FBALoginViewController hideLogInUI](self, "hideLogInUI");
  else
    -[FBALoginViewController showLogInUI](self, "showLogInUI");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 6;
}

- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  const char *v19;

  v7 = a4;
  v8 = a5;
  v9 = sub_100017978();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v19 = "-[FBALoginViewController signInViewController:didCompleteWithAuthenticationResults:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}s", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", AKAuthenticationUsernameKey));
  v12 = objc_claimAutoreleasedReturnValue(-[FBALoginViewController log](self, "log"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_100099480((uint64_t)v11, v7, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "loginManager"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100017E60;
  v16[3] = &unk_1000E6758;
  v16[4] = self;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v14, "loginWithUsername:authenticationResults:completion:", v11, v7, v16);

}

- (void)signInViewControllerDidCancel:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = sub_100017978();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446210;
    v6 = "-[FBALoginViewController signInViewControllerDidCancel:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v5, 0xCu);
  }

}

- (void)signInViewControllerDidSkip:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = sub_100017978();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446210;
    v6 = "-[FBALoginViewController signInViewControllerDidSkip:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v5, 0xCu);
  }

}

- (void)signInViewController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6 completion:(id)a7
{
  id v8;
  void (**v9)(id, BOOL);
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;

  v8 = a5;
  v9 = (void (**)(id, BOOL))a7;
  v10 = sub_100017978();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136446210;
    v15 = "-[FBALoginViewController signInViewController:shouldContinueWithAuthenticationResults:error:forContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v14, 0xCu);
  }

  if (v8)
  {
    v12 = sub_100017978();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10009953C((uint64_t)v8, v13);

  }
  v9[2](v9, v8 == 0);

}

- (void)signInViewControllerDidSelectChildSignIn:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = sub_100017978();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446210;
    v6 = "-[FBALoginViewController signInViewControllerDidSelectChildSignIn:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v5, 0xCu);
  }

}

- (id)authenticationContext
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;

  v3 = sub_100017978();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136446210;
    v14 = "-[FBALoginViewController authenticationContext]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v13, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loginManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "authenticationContextForUsername:", 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FEEDBACK_ASSISTANT"), &stru_1000EA660, 0));
  objc_msgSend(v7, "setTitle:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController environmentDescription](self, "environmentDescription"));
  if (v10)
    objc_msgSend(v7, "setReason:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBALoginViewController signInViewController](self, "signInViewController"));
  objc_msgSend(v7, "setPresentingViewController:", v11);

  return v7;
}

- (unint64_t)pendingStartupUI
{
  return self->_pendingStartupUI;
}

- (void)setPendingStartupUI:(unint64_t)a3
{
  self->_pendingStartupUI = a3;
}

- (AAUISignInViewController)signInViewController
{
  return self->_signInViewController;
}

- (void)setSignInViewController:(id)a3
{
  objc_storeStrong((id *)&self->_signInViewController, a3);
}

- (NSString)prefilledUsername
{
  return self->_prefilledUsername;
}

- (void)setPrefilledUsername:(id)a3
{
  objc_storeStrong((id *)&self->_prefilledUsername, a3);
}

- (UITraitChangeRegistration)traitCollectionObservationToken
{
  return self->_traitCollectionObservationToken;
}

- (void)setTraitCollectionObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollectionObservationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollectionObservationToken, 0);
  objc_storeStrong((id *)&self->_prefilledUsername, 0);
  objc_storeStrong((id *)&self->_signInViewController, 0);
}

@end
