@implementation ViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setAllowsAlertStacking:", 1);
  objc_msgSend(v5, "setAllowsBanners:", 1);
  objc_msgSend(v5, "setAllowsSiri:", 1);
  objc_msgSend(v5, "setAllowsControlCenter:", 1);
  objc_msgSend(v5, "setAllowsAlertItems:", 1);
  objc_msgSend(v5, "setShouldDisableFadeInAnimation:", 1);
  objc_msgSend(v5, "setSwipeDismissalStyle:", 1);
  objc_msgSend(v5, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v5, "setSceneDeactivationReason:", &off_100008298);
  if (v6)
    v6[2]();

}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "events") & 0x10) != 0)
        {
          v9[0] = _NSConcreteStackBlock;
          v9[1] = 3221225472;
          v9[2] = sub_100004A7C;
          v9[3] = &unk_100008148;
          v9[4] = self;
          -[ViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  PortalView *v14;
  void *v15;
  PortalView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("renderID")));
  v10 = objc_msgSend(v9, "unsignedLongLongValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("contextID")));
  v13 = objc_msgSend(v12, "unsignedIntValue");

  if (v10 && (_DWORD)v13)
  {
    v14 = [PortalView alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ViewController view](self, "view"));
    objc_msgSend(v15, "bounds");
    v16 = -[PortalView initWithFrame:](v14, "initWithFrame:");

    -[PortalView setAutoresizingMask:](v16, "setAutoresizingMask:", 18);
    -[PortalView setSourceLayerRenderId:](v16, "setSourceLayerRenderId:", v10);
    -[PortalView setSourceContextId:](v16, "setSourceContextId:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ViewController view](self, "view"));
    objc_msgSend(v17, "addSubview:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ViewController view](self, "view"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "window"));
    objc_msgSend(v20, "setBackgroundColor:", v18);

  }
  else
  {
    v16 = (PortalView *)objc_claimAutoreleasedReturnValue(-[ViewController view](self, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PortalView window](v16, "window"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_rootSheetPresentationController"));
    objc_msgSend(v19, "_setShouldScaleDownBehindDescendantSheets:", 0);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "userInfo"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("userActivityData")));
  -[ViewController setUserActivityData:](self, "setUserActivityData:", v22);

  if (v6)
    v6[2](v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ViewController;
  -[ViewController viewDidAppear:](&v9, "viewDidAppear:", a3);
  if (!-[ViewController didPresent](self, "didPresent"))
  {
    -[ViewController setDidPresent:](self, "setDidPresent:", 1);
    v4 = objc_msgSend(UIApp, "activeInterfaceOrientation");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    objc_msgSend(v6, "_setWindowInterfaceOrientation:", v4);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ViewController userActivityData](self, "userActivityData"));
    +[ICSystemPaperPresenter presentSystemPaperWithUserActivityData:presentingViewController:completion:](ICSystemPaperPresenter, "presentSystemPaperWithUserActivityData:presentingViewController:completion:", v7, self, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "dismissalDidEnd:", UIPresentationControllerDismissalTransitionDidEndNotification, 0);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ViewController;
  -[ViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[ViewController teardown](self, "teardown");
}

- (void)dismissalDidEnd:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "object"));
  v6 = objc_opt_class(_EXHostViewController, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", UIPresentationControllerDismissalTransitionDidEndCompletedKey));
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
      -[ViewController teardown](self, "teardown");
  }
  else
  {

  }
}

- (void)teardown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!-[ViewController didTeardown](self, "didTeardown"))
  {
    -[ViewController setDidTeardown:](self, "setDidTeardown:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    objc_msgSend(v3, "performExpiringActivityWithReason:usingBlock:", CFSTR("Extending runtime for teardown"), &stru_100008188);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[ViewController extensionHostViewController](self, "extensionHostViewController"));
    objc_msgSend(v7, "setConfiguration:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("connection")));
    objc_msgSend(v4, "invalidate");

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentingViewController"));
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    objc_msgSend(v6, "invalidate");

  }
}

- (id)extensionHostViewController
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));

  if (v4)
  {
    do
    {
      v6 = objc_opt_class(_EXHostViewController, v5);
      if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
        break;
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));

      v4 = (void *)v7;
    }
    while (v7);
  }
  return v4;
}

- (BOOL)didPresent
{
  return self->_didPresent;
}

- (void)setDidPresent:(BOOL)a3
{
  self->_didPresent = a3;
}

- (BOOL)didTeardown
{
  return self->_didTeardown;
}

- (void)setDidTeardown:(BOOL)a3
{
  self->_didTeardown = a3;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void)setUserActivityData:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityData, 0);
}

@end
