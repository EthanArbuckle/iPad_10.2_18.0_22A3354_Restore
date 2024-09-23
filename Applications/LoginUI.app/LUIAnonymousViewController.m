@implementation LUIAnonymousViewController

- (LUIAnonymousViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  LUIAnonymousViewController *v4;
  LUIAnonymousViewController *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LUIAnonymousViewController;
  v4 = -[LUIAnonymousViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAnonymousViewController _anonymousUser](v4, "_anonymousUser"));
    -[LUIDashBoardViewController setUserInfo:](v5, "setUserInfo:", v6);

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LUIAnonymousViewController;
  -[LUIDashBoardViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TEMPORARY_SESSION_WARNING"), &stru_100069EB8, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController dashBoardView](self, "dashBoardView"));
  objc_msgSend(v5, "setSubtitleString:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController dashBoardView](self, "dashBoardView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardViewController userInfo](self, "userInfo"));
  objc_msgSend(v6, "setUser:isTemporarySession:", v7, 1);

}

- (void)userActionTriggered
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[LUIAuthenticationController sharedController](LUIAuthenticationController, "sharedController"));
  objc_msgSend(v3, "startLoginFlowForAnonymousTemporaryUserWithResultResponder:", self);

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
    v5 = CFSTR("SWIPE_UP_TO_SIGNIN");
  else
    v5 = CFSTR("PRESS_HOME_TO_SIGNIN");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_100069EB8, 0));

  return v6;
}

- (int64_t)imageTypeForBottomLeftVibrantButton
{
  return 3;
}

- (id)titleForBottomLeftVibrantButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100069EB8, 0));

  return v3;
}

- (BOOL)shouldShowBottomLeftVibrantButton
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUITemporarySessionSupport sharedInstance](LUITemporarySessionSupport, "sharedInstance"));
  v3 = objc_msgSend(v2, "isTemporarySessionOnly") ^ 1;

  return v3;
}

- (id)_anonymousUser
{
  LKUser *v2;
  void *v3;
  void *v4;

  v2 = objc_opt_new(LKUser);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("GUEST"), &stru_100069EB8, 0));
  -[LKUser setGivenName:](v2, "setGivenName:", v4);

  return v2;
}

- (void)presentAlertForErrorTitle:(id)a3 message:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100069EB8, 0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100019144;
  v13[3] = &unk_100068C08;
  v8 = v5;
  v14 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 0, v13));

  objc_msgSend(v8, "addAction:", v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019154;
  block[3] = &unk_100068C30;
  block[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)passcodeVerificationFailedWithErrorMessage:(id)a3
{
  -[LUIAnonymousViewController presentAlertForErrorTitle:message:](self, "presentAlertForErrorTitle:message:", 0, a3);
}

@end
