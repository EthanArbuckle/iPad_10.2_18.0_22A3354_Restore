@implementation MusicUIServiceAppEnvironment

- (void)setScene:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  UIWindow *v16;
  UIWindow *window;
  void *v18;
  NSString *v19;
  NSString *applicationIdentifier;
  void *v21;
  id v22;

  v4 = a3;
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_FBSScene"));
  v5 = objc_alloc((Class)UIWindow);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "settings"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
  v16 = (UIWindow *)objc_msgSend(v5, "_initWithFrame:debugName:windowScene:", v15, v4, v8, v10, v12, v14);

  window = self->_window;
  self->_window = v16;

  -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "settings"));
  v19 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "proxiedApplicationBundleIdentifier"));
  applicationIdentifier = self->_applicationIdentifier;
  self->_applicationIdentifier = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment applicationIdentifier](self, "applicationIdentifier"));
  -[UIWindow setAccessibilityLabel:](self->_window, "setAccessibilityLabel:", v21);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment processAssertion](self, "processAssertion"));
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)MusicUIServiceAppEnvironment;
  -[MusicUIServiceAppEnvironment dealloc](&v4, "dealloc");
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6;
  MusicUIServiceCarDisplayBrowsableContentViewController *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  -[MusicUIServiceAppEnvironment setScene:](self, "setScene:", v6);
  v7 = objc_alloc_init(MusicUIServiceCarDisplayBrowsableContentViewController);
  -[MusicUIServiceAppEnvironment setContentViewController:](self, "setContentViewController:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment contentViewController](self, "contentViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment window](self, "window"));
  objc_msgSend(v9, "setRootViewController:", v8);

  v10 = objc_msgSend(v6, "activationState");
  -[MusicUIServiceAppEnvironment setAppMustBeRunning:](self, "setAppMustBeRunning:", (unint64_t)v10 < 2);
  -[MusicUIServiceAppEnvironment _launchTargetApp](self, "_launchTargetApp");
}

- (void)sceneDidDisconnect:(id)a3
{
  void *v4;
  void *v5;

  -[MusicUIServiceAppEnvironment setAppMustBeRunning:](self, "setAppMustBeRunning:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment delegate](self, "delegate"));
  objc_msgSend(v4, "appEnvironmentWillDisconnect:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment processAssertion](self, "processAssertion"));
  objc_msgSend(v5, "invalidate");

  -[MusicUIServiceAppEnvironment setProcessAssertion:](self, "setProcessAssertion:", 0);
}

- (void)sceneDidBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  MusicUIDisplayNowPlayingStateContext *v6;

  v6 = -[MusicUIDisplayNowPlayingStateContext initWithStateContext:]([MusicUIDisplayNowPlayingStateContext alloc], "initWithStateContext:", CFSTR("current"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment applicationIdentifier](self, "applicationIdentifier"));
  -[MusicUIDisplayNowPlayingStateContext setAssociatedBundleID:](v6, "setAssociatedBundleID:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment contentViewController](self, "contentViewController"));
  objc_msgSend(v5, "switchToState:", v6);

}

- (void)sceneWillResignActive:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment contentViewController](self, "contentViewController", a3));
  objc_msgSend(v3, "switchToState:", 0);

}

- (void)sceneWillEnterForeground:(id)a3
{
  -[MusicUIServiceAppEnvironment setAppMustBeRunning:](self, "setAppMustBeRunning:", 1);
  -[MusicUIServiceAppEnvironment _launchTargetApp](self, "_launchTargetApp");
}

- (void)sceneDidEnterBackground:(id)a3
{
  void *v4;

  -[MusicUIServiceAppEnvironment setAppMustBeRunning:](self, "setAppMustBeRunning:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment processAssertion](self, "processAssertion"));
  objc_msgSend(v4, "invalidate");

  -[MusicUIServiceAppEnvironment setProcessAssertion:](self, "setProcessAssertion:", 0);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006804;
  v4[3] = &unk_10000C3C8;
  v4[4] = self;
  objc_msgSend(a4, "enumerateObjectsUsingBlock:", v4);
}

- (void)_switchToNowPlaying
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MusicUIDisplayNowPlayingStateContext stateContextForNowPlaying](MusicUIDisplayNowPlayingStateContext, "stateContextForNowPlaying"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment applicationIdentifier](self, "applicationIdentifier"));
  objc_msgSend(v5, "setAssociatedBundleID:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment contentViewController](self, "contentViewController"));
  objc_msgSend(v4, "switchToState:", v5);

}

- (void)_launchTargetApp
{
  if (-[MusicUIServiceAppEnvironment appMustBeRunning](self, "appMustBeRunning"))
  {
    -[MusicUIServiceAppEnvironment _launchTargetAppIfNecessary](self, "_launchTargetAppIfNecessary");
  }
  else
  {
    -[MusicUIServiceAppEnvironment setAppMustBeRunning:](self, "setAppMustBeRunning:", 1);
    -[MusicUIServiceAppEnvironment _launchTargetAppIfNecessary](self, "_launchTargetAppIfNecessary");
    -[MusicUIServiceAppEnvironment setAppMustBeRunning:](self, "setAppMustBeRunning:", 0);
  }
}

- (void)_launchTargetAppIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id location;
  uint64_t v13;
  void *v14;

  if (-[MusicUIServiceAppEnvironment appMustBeRunning](self, "appMustBeRunning")
    && !-[MusicUIServiceAppEnvironment launchRequested](self, "launchRequested"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment appHandle](self, "appHandle"));

    if (!v3)
    {
      -[MusicUIServiceAppEnvironment setLaunchRequested:](self, "setLaunchRequested:", 1);
      objc_initWeak(&location, self);
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
      v13 = FBSOpenApplicationOptionKeyActivateSuspended;
      v14 = &__kCFBooleanTrue;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v5));

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppEnvironment applicationIdentifier](self, "applicationIdentifier"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100006B14;
      v9[3] = &unk_10000C3F0;
      v9[4] = self;
      objc_copyWeak(&v11, &location);
      v8 = v4;
      v10 = v8;
      objc_msgSend(v8, "openApplication:withOptions:completion:", v7, v6, v9);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

- (MusicUIServiceAppEnvironmentDelegate)delegate
{
  return (MusicUIServiceAppEnvironmentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (BOOL)appMustBeRunning
{
  return self->_appMustBeRunning;
}

- (void)setAppMustBeRunning:(BOOL)a3
{
  self->_appMustBeRunning = a3;
}

- (BOOL)launchRequested
{
  return self->_launchRequested;
}

- (void)setLaunchRequested:(BOOL)a3
{
  self->_launchRequested = a3;
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_processAssertion, a3);
}

- (BSProcessHandle)appHandle
{
  return self->_appHandle;
}

- (void)setAppHandle:(id)a3
{
  objc_storeStrong((id *)&self->_appHandle, a3);
}

- (MusicUIServiceCarDisplayBrowsableContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_appHandle, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
