@implementation ServiceTFFeedbackFormHostViewController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ServiceTFFeedbackFormHostViewController;
  -[ServiceTFFeedbackFormHostViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFFeedbackFormHostViewController hostedFeedbackSession](self, "hostedFeedbackSession"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFFeedbackFormHostViewController hostedFeedbackSession](self, "hostedFeedbackSession"));
    -[ServiceTFFeedbackFormHostViewController _presentFormViewControllerForSession:](self, "_presentFormViewControllerForSession:", v5);

  }
  else
  {
    -[ServiceTFFeedbackFormHostViewController _dismissViewService](self, "_dismissViewService");
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

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFFeedbackFormHostViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v7, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v7, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v7, "setWallpaperTunnelActive:", 0);
  objc_msgSend(v7, "setAllowsAlertStacking:", 1);
  objc_msgSend(v7, "setDismissalAnimationStyle:", 2);
  objc_msgSend(v7, "setReachabilityDisabled:", 1);
  objc_msgSend(v7, "setSwipeDismissalStyle:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v9 = (unint64_t)objc_msgSend(v8, "userInterfaceIdiom");

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v11 = objc_msgSend(v10, "statusBarOrientation");

    objc_msgSend(v7, "setLaunchingInterfaceOrientation:", v11);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "userInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TFFeedbackHandleConfiguration configurationFromUserInfo:](TFFeedbackHandleConfiguration, "configurationFromUserInfo:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "incidentId"));
  LODWORD(v12) = v14 != 0;

  v15 = objc_alloc((Class)TFFeedbackSession);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));
  v17 = objc_msgSend(v15, "initForContext:betaApplicationIdentifier:", 2 * v12, v16);
  -[ServiceTFFeedbackFormHostViewController setHostedFeedbackSession:](self, "setHostedFeedbackSession:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFFeedbackFormHostViewController hostedFeedbackSession](self, "hostedFeedbackSession"));
  objc_msgSend(v18, "setDelegate:", self);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFFeedbackFormHostViewController hostedFeedbackSession](self, "hostedFeedbackSession"));
  objc_msgSend(v19, "initiateFeedbackSnapshot");

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFFeedbackFormHostViewController hostedFeedbackSession](self, "hostedFeedbackSession"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "incidentId"));
  objc_msgSend(v20, "associateIncidentId:", v21);

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
          -[ServiceTFFeedbackFormHostViewController _dismissViewService](self, "_dismissViewService");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_presentFormViewControllerForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFFeedbackFormHostViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_rootSheetPresentationController"));
  objc_msgSend(v7, "_setShouldScaleDownBehindDescendantSheets:", 0);

  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "createFeedbackViewControllerForCurrentState"));
  v8 = objc_alloc((Class)UIBarButtonItem);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("CANCEL"), 0));
  v10 = objc_msgSend(v8, "initWithTitle:style:target:action:", v9, 0, self, "cancelButtonPressed:");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "navigationItem"));
  objc_msgSend(v11, "setLeftBarButtonItem:", v10);

  v12 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v14);
  objc_msgSend(v12, "setModalPresentationStyle:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentationController"));
  objc_msgSend(v13, "setDelegate:", self);

  -[ServiceTFFeedbackFormHostViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
}

- (void)_dismissViewService
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFFeedbackFormHostViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFFeedbackFormHostViewController presentedViewController](self, "presentedViewController"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceTFFeedbackFormHostViewController presentedViewController](self, "presentedViewController"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000FA50;
    v6[3] = &unk_1000490B8;
    v7 = v3;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  }
  else
  {
    objc_msgSend(v3, "dismiss");
  }

}

- (TFFeedbackSession)hostedFeedbackSession
{
  return self->_hostedFeedbackSession;
}

- (void)setHostedFeedbackSession:(id)a3
{
  objc_storeStrong((id *)&self->_hostedFeedbackSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedFeedbackSession, 0);
}

@end
