@implementation TVAccessViewServiceViewController

- (TVAccessViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TVAccessViewServiceViewController *v4;
  id v5;
  NSObject *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TVAccessViewServiceViewController;
  v4 = -[TVAccessViewServiceViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  if (v4)
  {
    v5 = sub_100003530();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TVAccessViewServiceViewController init", v8, 2u);
    }

  }
  return v4;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (unint64_t)objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 30;
  else
    return 2;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSString *accountName;
  __CFString *v6;
  void *v7;
  id v8;
  NSArray *bundleIDs;
  VUIAccessViewController *v10;
  VUIAccessViewController *accessViewController;
  VUIAccessViewController *v12;
  objc_super v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[2];
  _QWORD v19[2];

  v3 = a3;
  objc_initWeak(&location, self);
  accountName = self->_accountName;
  if (accountName)
    v6 = accountName;
  else
    v6 = &stru_100004200;
  v18[0] = VUIAccessOptionsAccountKey;
  v18[1] = VUIAccessOptionsShouldDenyOnCancelKey;
  v19[0] = v6;
  v19[1] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
  v8 = objc_alloc((Class)VUIAccessViewController);
  bundleIDs = self->_bundleIDs;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003120;
  v15[3] = &unk_100004178;
  objc_copyWeak(&v16, &location);
  v10 = (VUIAccessViewController *)objc_msgSend(v8, "initWithBundleIDs:options:completionHandler:", bundleIDs, v7, v15);
  accessViewController = self->_accessViewController;
  self->_accessViewController = v10;

  -[VUIAccessViewController setModalPresentationStyle:](self->_accessViewController, "setModalPresentationStyle:", 2);
  -[VUIAccessViewController setModalPresentationCapturesStatusBarAppearance:](self->_accessViewController, "setModalPresentationCapturesStatusBarAppearance:", 1);
  v12 = self->_accessViewController;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000314C;
  v14[3] = &unk_1000041A0;
  v14[4] = self;
  -[TVAccessViewServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, v14);
  v13.receiver = self;
  v13.super_class = (Class)TVAccessViewServiceViewController;
  -[TVAccessViewServiceViewController viewDidAppear:](&v13, "viewDidAppear:", v3);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 0;
}

- (void)configureWithUserInfo:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", WLKViewServiceAppBundlesKey));
  v5 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    objc_storeStrong((id *)&self->_bundleIDs, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", WLKViewServiceAccountNameKey));
  v7 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    objc_storeStrong((id *)&self->_accountName, v6);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  -[TVAccessViewServiceViewController configureWithUserInfo:](self, "configureWithUserInfo:", v8);
  v9.receiver = self;
  v9.super_class = (Class)TVAccessViewServiceViewController;
  -[TVAccessViewServiceViewController configureWithContext:completion:](&v9, "configureWithContext:completion:", v7, v6);

}

- (void)_willAppearInRemoteViewController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_100003530();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TVAccessViewServiceViewController _willAppearInRemoteViewController:", buf, 2u);
  }

  objc_msgSend(v4, "setShouldDisableFadeInAnimation:", 1);
  objc_msgSend(v4, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v4, "setShouldDismissOnUILock:", 1);
  objc_msgSend(v4, "setAllowsAlertStacking:", 1);
  v7.receiver = self;
  v7.super_class = (Class)TVAccessViewServiceViewController;
  -[TVAccessViewServiceViewController _willAppearInRemoteViewController:](&v7, "_willAppearInRemoteViewController:", v4);

}

- (void)_dismiss
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000033D8;
  v2[3] = &unk_1000041A0;
  v2[4] = self;
  -[TVAccessViewServiceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_accessViewController, 0);
}

@end
