@implementation AXSBUIOnboardingRootViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  Class v8;
  Class v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = NSClassFromString(CFSTR("AXOnboardingObjC"));
  if (v8)
  {
    v9 = v8;
    if ((objc_opt_respondsToSelector(v8, "viewControllerForType:onDismiss:") & 1) != 0)
    {
      objc_initWeak(&location, self);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type")));
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("voicecontrol"));

      if (v12)
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1000127EC;
        v20[3] = &unk_100024840;
        v13 = &v21;
        objc_copyWeak(&v21, &location);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class viewControllerForType:onDismiss:](v9, "viewControllerForType:onDismiss:", 0, v20));
        -[AXSBUIOnboardingRootViewController setHostingController:](self, "setHostingController:", v14);
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("type")));
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("voiceover"));

        if (!v17)
        {
LABEL_8:
          objc_destroyWeak(&location);
          goto LABEL_9;
        }
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100012818;
        v18[3] = &unk_100024840;
        v13 = &v19;
        objc_copyWeak(&v19, &location);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class viewControllerForType:onDismiss:](v9, "viewControllerForType:onDismiss:", 1, v18));
        -[AXSBUIOnboardingRootViewController setHostingController:](self, "setHostingController:", v14);
      }

      objc_destroyWeak(v13);
      goto LABEL_8;
    }
  }
LABEL_9:
  if (v7)
    v7[2](v7);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AXSBUIOnboardingRootViewController;
  -[AXSBUIOnboardingRootViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXSBUIOnboardingRootViewController;
  -[AXSBUIOnboardingRootViewController viewDidAppear:](&v9, "viewDidAppear:", a3);
  -[AXSBUIOnboardingRootViewController _setupRemoteProxy](self, "_setupRemoteProxy");
  v4 = objc_alloc((Class)UINavigationController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBUIOnboardingRootViewController hostingController](self, "hostingController"));
  v6 = objc_msgSend(v4, "initWithRootViewController:", v5);

  objc_msgSend(v6, "setModalPresentationStyle:", 0);
  if (AXDeviceIsPhone(objc_msgSend(v6, "setModalTransitionStyle:", 0)))
    objc_msgSend(v6, "setModalPresentationStyle:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBUIOnboardingRootViewController hostingController](self, "hostingController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentationController"));
  objc_msgSend(v8, "setDelegate:", v7);

  -[AXSBUIOnboardingRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, &stru_100024E28);
}

- (void)dismiss
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000129D0;
  v2[3] = &unk_100024748;
  v2[4] = self;
  -[AXSBUIOnboardingRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

- (void)_setupRemoteProxy
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AXSBUIOnboardingRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "setDismissalAnimationStyle:", 2);
  objc_msgSend(v2, "setOrientationChangedEventsEnabled:", 0);
  objc_msgSend(v2, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v2, "setWallpaperTunnelActive:", 0);

}

- (UIAdaptivePresentationControllerDelegate)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
  objc_storeStrong((id *)&self->_hostingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingController, 0);
}

@end
