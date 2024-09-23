@implementation ServiceTFBetaLaunchHostViewController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ServiceTFBetaLaunchHostViewController;
  -[ServiceTFBetaLaunchHostViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFBetaLaunchHostViewController activeConfiguration](self, "activeConfiguration"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFBetaLaunchHostViewController activeConfiguration](self, "activeConfiguration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
    -[ServiceTFBetaLaunchHostViewController _presentLaunchViewControllerForIdentifier:](self, "_presentLaunchViewControllerForIdentifier:", v6);

  }
  else
  {
    -[ServiceTFBetaLaunchHostViewController _dismissViewService](self, "_dismissViewService");
  }
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

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ServiceTFBetaLaunchHostViewController;
  -[ServiceTFBetaLaunchHostViewController traitCollectionDidChange:](&v6, "traitCollectionDidChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFBetaLaunchHostViewController launchViewController](self, "launchViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFBetaLaunchHostViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v4, "launchScreenHost:traitCollectionDidChange:", self, v5);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFBetaLaunchHostViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v7, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v7, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v7, "setWallpaperTunnelActive:", 0);
  objc_msgSend(v7, "setAllowsAlertStacking:", 1);
  objc_msgSend(v7, "setDismissalAnimationStyle:", 2);
  objc_msgSend(v7, "setReachabilityDisabled:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v9 = (unint64_t)objc_msgSend(v8, "userInterfaceIdiom");

  objc_msgSend(v7, "setSwipeDismissalStyle:", (v9 & 0xFFFFFFFFFFFFFFFBLL) != 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v11 = (unint64_t)objc_msgSend(v10, "userInterfaceIdiom");

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v13 = objc_msgSend(v12, "statusBarOrientation");

    objc_msgSend(v7, "setLaunchingInterfaceOrientation:", v13);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TFBetaLaunchHandleConfiguration configurationFromUserInfo:](TFBetaLaunchHandleConfiguration, "configurationFromUserInfo:", v14));
  -[ServiceTFBetaLaunchHostViewController setActiveConfiguration:](self, "setActiveConfiguration:", v15);

  if (v6)
    v6[2](v6);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
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
          -[ServiceTFBetaLaunchHostViewController _dismissViewService](self, "_dismissViewService");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_presentLaunchViewControllerForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFBetaLaunchHostViewController activeConfiguration](self, "activeConfiguration", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFBetaLaunchHostViewController activeConfiguration](self, "activeConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchInfo"));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[TFBetaAppLaunchScreenProvider createBetaAppLaunchViewControllerForIdentifier:hostedIn:withSidepackLaunchInfo:](TFBetaAppLaunchScreenProvider, "createBetaAppLaunchViewControllerForIdentifier:hostedIn:withSidepackLaunchInfo:", v5, self, v7));

  -[ServiceTFBetaLaunchHostViewController setLaunchViewController:](self, "setLaunchViewController:", v11);
  v8 = objc_alloc((Class)UINavigationController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFBetaLaunchHostViewController launchViewController](self, "launchViewController"));
  v10 = objc_msgSend(v8, "initWithRootViewController:", v9);

  objc_msgSend(v10, "setDelegate:", self);
  -[ServiceTFBetaLaunchHostViewController _setupViewController:forPresentationInTraitEnvironment:](self, "_setupViewController:forPresentationInTraitEnvironment:", v10, self);
  -[ServiceTFBetaLaunchHostViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)_setupViewController:(id)a3 forPresentationInTraitEnvironment:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "traitCollection"));
  v6 = objc_msgSend(v5, "horizontalSizeClass");

  if (v6 == (id)1)
  {
    objc_msgSend(v7, "setModalPresentationStyle:", 0);
    objc_msgSend(v7, "setModalTransitionStyle:", 2);
  }
  else
  {
    objc_msgSend(v7, "setModalPresentationStyle:", 2);
  }

}

- (void)_dismissViewService
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFBetaLaunchHostViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFBetaLaunchHostViewController presentedViewController](self, "presentedViewController"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFBetaLaunchHostViewController presentedViewController](self, "presentedViewController"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100009FF4;
    v6[3] = &unk_1000490B8;
    v7 = v3;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  }
  else
  {
    objc_msgSend(v3, "dismiss");
  }

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice", a3));
  v4 = (unint64_t)objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 30;
  else
    return 2;
}

- (TFBetaLaunchHandleConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)setActiveConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_activeConfiguration, a3);
}

- (TFHostedBetaAppLaunchScreenView)launchViewController
{
  return (TFHostedBetaAppLaunchScreenView *)objc_loadWeakRetained((id *)&self->_launchViewController);
}

- (void)setLaunchViewController:(id)a3
{
  objc_storeWeak((id *)&self->_launchViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_launchViewController);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
}

@end
