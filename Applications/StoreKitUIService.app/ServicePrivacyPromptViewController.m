@implementation ServicePrivacyPromptViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (!+[objc_LockscreenStatus isDeviceUnlocked](_TtC17StoreKitUIService21objc_LockscreenStatus, "isDeviceUnlocked"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100029890();
    exit(0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "actions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  -[ServicePrivacyPromptViewController setDidContinueAction:](self, "setDidContinueAction:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privacyIdentifier")));
  -[ServicePrivacyPromptViewController setPrivacyIdentifier:](self, "setPrivacyIdentifier:", v11);

  v6[2](v6);
}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "events") & 0x10) != 0)
          -[ServicePrivacyPromptViewController _dismiss](self, "_dismiss");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ServicePrivacyPromptViewController;
  -[ServicePrivacyPromptViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePrivacyPromptViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[ServicePrivacyPromptViewController _applyCustomTintColorToViewController:](self, "_applyCustomTintColorToViewController:", self);
}

- (void)_willAppearInRemoteViewController
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ServicePrivacyPromptViewController;
  -[ServicePrivacyPromptViewController _willAppearInRemoteViewController](&v4, "_willAppearInRemoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePrivacyPromptViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "setDesiredHardwareButtonEvents:", 16);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ServicePrivacyPromptViewController;
  -[ServicePrivacyPromptViewController viewDidAppear:](&v12, "viewDidAppear:", a3);
  if (!-[ServicePrivacyPromptViewController privacyControllerShown](self, "privacyControllerShown"))
  {
    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePrivacyPromptViewController privacyIdentifier](self, "privacyIdentifier"));
    v6 = _NSConcreteStackBlock;
    v7 = 3221225472;
    v8 = sub_10000CCA8;
    v9 = &unk_1000495B8;
    objc_copyWeak(&v10, &location);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSUIPrivacyViewController privacyControllerWithIdentifier:acknowledgementHandler:](AMSUIPrivacyViewController, "privacyControllerWithIdentifier:acknowledgementHandler:", v4, &v6));

    -[ServicePrivacyPromptViewController _applyCustomTintColorToViewController:](self, "_applyCustomTintColorToViewController:", v5, v6, v7, v8, v9);
    -[ServicePrivacyPromptViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
    -[ServicePrivacyPromptViewController setPrivacyControllerShown:](self, "setPrivacyControllerShown:", 1);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (unint64_t)objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = objc_msgSend(v4, "statusBarOrientation");

  if (MGCopyAnswer(CFSTR("8olRm6C1xqr7AJGpLRnpSw"), 0))
    return 30;
  else
    return 1 << v5;
}

- (BOOL)shouldAutorotate
{
  uint64_t v2;
  void *v3;
  unint64_t v4;

  v2 = MGCopyAnswer(CFSTR("8olRm6C1xqr7AJGpLRnpSw"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = (unint64_t)objc_msgSend(v3, "userInterfaceIdiom");

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v2 != 0;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)splashDoneButtonPressed:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePrivacyPromptViewController splashNavigationController](self, "splashNavigationController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000CEC8;
  v6[3] = &unk_100048FD0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)_applyCustomTintColorToViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (qword_1000632C0 != -1)
    dispatch_once(&qword_1000632C0, &stru_1000495D8);
  v4 = (void *)qword_1000632B8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePrivacyPromptViewController privacyIdentifier](self, "privacyIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    objc_msgSend(v7, "setTintColor:", v6);

  }
}

- (void)_dismiss
{
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePrivacyPromptViewController didContinueAction](self, "didContinueAction"));
  v4 = objc_msgSend(v3, "canSendResponse");

  if (v4)
  {
    v5 = objc_alloc_init((Class)BSMutableSettings);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ServicePrivacyPromptViewController acknowledgementReceived](self, "acknowledgementReceived")));
    objc_msgSend(v5, "setObject:forSetting:", v6, 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePrivacyPromptViewController didContinueAction](self, "didContinueAction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse responseWithInfo:](BSActionResponse, "responseWithInfo:", v5));
    objc_msgSend(v7, "sendResponse:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePrivacyPromptViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePrivacyPromptViewController presentedViewController](self, "presentedViewController"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePrivacyPromptViewController presentedViewController](self, "presentedViewController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000D1B4;
    v12[3] = &unk_1000490B8;
    v13 = v9;
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v12);

  }
  else
  {
    objc_msgSend(v9, "dismiss");
  }

}

- (void)_privacyViewControllerDidFinishWithResult:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  if (a3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePrivacyPromptViewController privacyIdentifier](self, "privacyIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[OBPrivacySplashController splashPageWithBundleIdentifier:](OBPrivacySplashController, "splashPageWithBundleIdentifier:", v4));

    if (-[ServicePrivacyPromptViewController _shouldIncludeAcknowledgementButtonInSplashController](self, "_shouldIncludeAcknowledgementButtonInSplashController"))
    {
      objc_initWeak(&location, self);
      v9 = _NSConcreteStackBlock;
      v10 = 3221225472;
      v11 = sub_10000D378;
      v12 = &unk_100048FD0;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v5, "setDismissHandlerForDefaultButton:", &v9);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v5, "setShowsLinkToUnifiedAbout:", 1, v9, v10, v11, v12);
    v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "splashDoneButtonPressed:");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationItem"));
    objc_msgSend(v7, "setRightBarButtonItem:", v6);

    v8 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v5);
    objc_msgSend(v8, "setModalPresentationStyle:", 2);
    -[ServicePrivacyPromptViewController _applyCustomTintColorToViewController:](self, "_applyCustomTintColorToViewController:", v8);
    -[ServicePrivacyPromptViewController setSplashNavigationController:](self, "setSplashNavigationController:", v8);
    -[ServicePrivacyPromptViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  }
  else
  {
    -[ServicePrivacyPromptViewController setAcknowledgementReceived:](self, "setAcknowledgementReceived:", 1);
    -[ServicePrivacyPromptViewController _dismiss](self, "_dismiss");
  }
}

- (BOOL)_shouldIncludeAcknowledgementButtonInSplashController
{
  void *v3;
  void *v4;

  if (qword_1000632D0 != -1)
    dispatch_once(&qword_1000632D0, &stru_1000495F8);
  v3 = (void *)qword_1000632C8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePrivacyPromptViewController privacyIdentifier](self, "privacyIdentifier"));
  LOBYTE(v3) = objc_msgSend(v3, "containsObject:", v4);

  return (char)v3;
}

- (BOOL)privacyControllerShown
{
  return self->_privacyControllerShown;
}

- (void)setPrivacyControllerShown:(BOOL)a3
{
  self->_privacyControllerShown = a3;
}

- (BOOL)acknowledgementReceived
{
  return self->_acknowledgementReceived;
}

- (void)setAcknowledgementReceived:(BOOL)a3
{
  self->_acknowledgementReceived = a3;
}

- (NSString)privacyIdentifier
{
  return self->_privacyIdentifier;
}

- (void)setPrivacyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BSAction)didContinueAction
{
  return self->_didContinueAction;
}

- (void)setDidContinueAction:(id)a3
{
  objc_storeStrong((id *)&self->_didContinueAction, a3);
}

- (UINavigationController)splashNavigationController
{
  return self->_splashNavigationController;
}

- (void)setSplashNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_splashNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splashNavigationController, 0);
  objc_storeStrong((id *)&self->_didContinueAction, 0);
  objc_storeStrong((id *)&self->_privacyIdentifier, 0);
}

@end
