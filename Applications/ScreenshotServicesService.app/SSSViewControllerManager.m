@implementation SSSViewControllerManager

- (SSSViewControllerManager)init
{
  SSSViewControllerManager *v2;
  uint64_t v3;
  NSMutableSet *receivedSessionIdentifiers;
  uint64_t v5;
  NSMutableArray *pendingScreenshotRecordsForRootViewController;
  void *v7;
  void *v8;
  SSRemoteAlertHandleProvider *v9;
  SSRemoteAlertHandleProvider *remoteAlertHandleProvider;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SSSViewControllerManager;
  v2 = -[SSSViewControllerManager init](&v13, "init");
  v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  receivedSessionIdentifiers = v2->_receivedSessionIdentifiers;
  v2->_receivedSessionIdentifiers = (NSMutableSet *)v3;

  v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  pendingScreenshotRecordsForRootViewController = v2->_pendingScreenshotRecordsForRootViewController;
  v2->_pendingScreenshotRecordsForRootViewController = (NSMutableArray *)v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_observeRemoteViewControllerNotification:", CFSTR("SSSDittoRemoteViewControllerIsReadyForViewControllerManagerNotificationName"), 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", v2, "_observeRemoteAlertViewControllerNotification:", CFSTR("SSSDittoRemoteAlertViewControllerIsReadyForViewControllerManagerNotificationName"), 0);

  v9 = (SSRemoteAlertHandleProvider *)objc_alloc_init((Class)SSRemoteAlertHandleProvider);
  remoteAlertHandleProvider = v2->_remoteAlertHandleProvider;
  v2->_remoteAlertHandleProvider = v9;

  -[SSRemoteAlertHandleProvider setDelegate:](v2->_remoteAlertHandleProvider, "setDelegate:", v2);
  -[SSSViewControllerManager _prepareRootViewControllerIfNecessary](v2, "_prepareRootViewControllerIfNecessary");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", v2, "_screenshotManagerHasNoScreenshotsBeingTracked:", CFSTR("SSSScreenshotManagerStoppedTrackingScreenshots"), 0);

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SSSViewControllerManager;
  -[SSSViewControllerManager dealloc](&v4, "dealloc");
}

- (void)_prepareRootViewControllerIfNecessary
{
  SSSDittoRootViewController *v3;
  SSSDittoRootViewController *rootViewController;

  if (!self->_rootViewController)
  {
    v3 = objc_alloc_init(SSSDittoRootViewController);
    rootViewController = self->_rootViewController;
    self->_rootViewController = v3;

    -[SSSDittoRootViewController setViewControllerManager:](self->_rootViewController, "setViewControllerManager:", self);
  }
}

- (void)preheatWithPresentationMode:(unint64_t)a3
{
  -[SSRemoteAlertHandleProvider preheat](self->_remoteAlertHandleProvider, "preheat", a3);
}

- (SSSDittoRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)receiveEnvironmentDescription:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  SSSPendingScreenshotRecord *v15;
  NSObject *v16;
  int v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[SSSViewControllerManager _prepareRootViewControllerIfNecessary](self, "_prepareRootViewControllerIfNecessary");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loggableDescription"));
  v9 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v17 = 138412290;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Service received environment description %@", (uint8_t *)&v17, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionIdentifier"));
  if ((-[NSMutableSet containsObject:](self->_receivedSessionIdentifiers, "containsObject:", v10) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_receivedSessionIdentifiers, "addObject:", v10);
    if ((objc_msgSend(v6, "skipShutterSound") & 1) == 0)
      +[SSScreenCapturer playScreenshotSound](SSScreenCapturer, "playScreenshotSound");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "createScreenshotWithEnvironmentDescription:", v6));

  if (objc_msgSend(v12, "saveLocation") == (id)3)
  {
    objc_msgSend(v12, "insertIntoQuickNoteWithCompletion:", v7);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController hostingViewController](self->_rootViewController, "hostingViewController"));

    if (v13)
    {
      -[SSSDittoRootViewController screenshotReceived:completion:](self->_rootViewController, "screenshotReceived:completion:", v12, v7);
    }
    else
    {
      v14 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "No hosting view controller to deliver environment description, waiting for remote view controller to deliver %@", (uint8_t *)&v17, 0xCu);
      }

      v15 = -[SSSPendingScreenshotRecord initWithScreenshot:deliveryCompletionBlock:]([SSSPendingScreenshotRecord alloc], "initWithScreenshot:deliveryCompletionBlock:", v12, v7);
      -[NSMutableArray addObject:](self->_pendingScreenshotRecordsForRootViewController, "addObject:", v15);
      if (self->_remoteViewController)
      {
        v16 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_100057EE0(v16);

        exit(0);
      }

    }
  }

}

- (void)_observeRemoteViewControllerNotification:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  -[SSSViewControllerManager registerRemoteViewController:](self, "registerRemoteViewController:", v4);

}

- (void)_observeRemoteAlertViewControllerNotification:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  -[SSSViewControllerManager registerRemoteAlertViewController:](self, "registerRemoteAlertViewController:", v4);

}

- (void)_cleanupForDeadAlertHandle
{
  -[SSSViewControllerManager unregisterRemoteAlertViewController:](self, "unregisterRemoteAlertViewController:", self->_remoteAlertViewController);
}

- (void)remoteAlertHandleProviderDidDeactivate:(id)a3
{
  SSSDittoRemoteAlertViewController *v4;
  SSSDittoRemoteAlertViewController *remoteAlertViewController;
  id v6;

  v6 = a3;
  v4 = (SSSDittoRemoteAlertViewController *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController hostingViewController](self->_rootViewController, "hostingViewController"));
  remoteAlertViewController = self->_remoteAlertViewController;

  if (v4 == remoteAlertViewController)
    -[SSSViewControllerManager dismissScreenshots](self, "dismissScreenshots");
  objc_msgSend(v6, "invalidate");

}

- (void)remoteAlertHandleProvider:(id)a3 didInvalidateWithError:(id)a4
{
  -[SSSViewControllerManager _cleanupForDeadAlertHandle](self, "_cleanupForDeadAlertHandle", a3, a4);
}

- (void)registerRemoteViewController:(id)a3
{
  SSSDittoRemoteViewController *v5;
  NSObject *v6;
  SSSDittoRemoteViewController *remoteViewController;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  SSSDittoRemoteViewController *v22;
  __int16 v23;
  SSSDittoRemoteViewController *v24;

  v5 = (SSSDittoRemoteViewController *)a3;
  v6 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    remoteViewController = self->_remoteViewController;
    *(_DWORD *)buf = 138412546;
    v22 = remoteViewController;
    v23 = 2112;
    v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Registered new remote view controller old: %@ new: %@", buf, 0x16u);
  }

  if (self->_remoteViewController != v5)
  {
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    -[SSSDittoRemoteViewController setViewControllerManager:](self->_remoteViewController, "setViewControllerManager:", self);
    -[SSSViewControllerManager _moveDittoRootViewControllerFromViewController:toViewController:](self, "_moveDittoRootViewControllerFromViewController:toViewController:", 0, v5);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = self->_pendingScreenshotRecordsForRootViewController;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "screenshot", (_QWORD)v16));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deliveryCompletionBlock"));
          -[SSSDittoRootViewController screenshotReceived:completion:](self->_rootViewController, "screenshotReceived:completion:", v14, v15);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    -[NSMutableArray removeAllObjects](self->_pendingScreenshotRecordsForRootViewController, "removeAllObjects");
  }

}

- (void)unregisterRemoteViewController:(id)a3
{
  NSObject *v4;
  SSSDittoRemoteViewController *remoteViewController;
  uint8_t v6[16];

  v4 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Unregistered remote view controller", v6, 2u);
  }

  -[SSRemoteAlertHandleProvider invalidate](self->_remoteAlertHandleProvider, "invalidate");
  -[SSSDittoRemoteViewController setViewControllerManager:](self->_remoteViewController, "setViewControllerManager:", 0);
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

}

- (void)registerRemoteAlertViewController:(id)a3
{
  SSSDittoRemoteAlertViewController *v4;
  NSObject *v5;
  SSSDittoRemoteAlertViewController *remoteAlertViewController;
  SSSDittoRemoteAlertViewController *v7;
  uint8_t v8[16];

  v4 = (SSSDittoRemoteAlertViewController *)a3;
  v5 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Registered new remote alert view controller", v8, 2u);
  }

  remoteAlertViewController = self->_remoteAlertViewController;
  self->_remoteAlertViewController = v4;
  v7 = v4;

  -[SSSDittoRemoteAlertViewController setViewControllerManager:](self->_remoteAlertViewController, "setViewControllerManager:", self);
  -[SSSDittoRemoteAlertViewController setDittoRemoteAlertDelegate:](self->_remoteAlertViewController, "setDittoRemoteAlertDelegate:", self);

}

- (void)unregisterRemoteAlertViewController:(id)a3
{
  NSObject *v4;
  SSSDittoRemoteAlertViewController *remoteAlertViewController;
  uint8_t v6[16];

  v4 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Unregistered remote alert view controller", v6, 2u);
  }

  -[SSSDittoRemoteAlertViewController setViewControllerManager:](self->_remoteAlertViewController, "setViewControllerManager:", 0);
  -[SSSDittoRemoteAlertViewController setDittoRemoteAlertDelegate:](self->_remoteAlertViewController, "setDittoRemoteAlertDelegate:", 0);
  remoteAlertViewController = self->_remoteAlertViewController;
  self->_remoteAlertViewController = 0;

}

- (void)_moveDittoRootViewControllerFromViewController:(id)a3 toViewController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  -[SSSViewControllerManager _prepareRootViewControllerIfNecessary](self, "_prepareRootViewControllerIfNecessary");
  if (v7)
  {
    objc_msgSend(v6, "cleanupRootViewController");
    objc_msgSend(v7, "becomeParentOfDittoRootViewController:", self->_rootViewController);
  }
  else
  {
    v8 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Moving to a nil view controller", v9, 2u);
    }

    objc_msgSend(v6, "stopBeingParentOfDittoRootViewController:", self->_rootViewController);
    objc_msgSend(v6, "cleanupRootViewController");
  }
  -[SSSDittoRootViewController setHostingViewController:](self->_rootViewController, "setHostingViewController:", v7);

}

- (void)_actuallyMoveFromRemoteViewControllerToRemoteAlertViewController
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Moving from remote view controller to remote alert view controller", v4, 2u);
  }

  -[SSSViewControllerManager _moveDittoRootViewControllerFromViewController:toViewController:](self, "_moveDittoRootViewControllerFromViewController:toViewController:", self->_remoteViewController, self->_remoteAlertViewController);
  -[SSSDittoRemoteViewController setWillSoonUnparentChildDittoRootViewController:](self->_remoteViewController, "setWillSoonUnparentChildDittoRootViewController:", 0);
}

- (void)moveFromRemoteViewControllerToRemoteAlertViewControllerExecutingChangeBlockWhenReady:(id)a3
{
  id v4;
  id changeBlockForWhenAlertWillAppear;

  v4 = objc_msgSend(a3, "copy");
  changeBlockForWhenAlertWillAppear = self->_changeBlockForWhenAlertWillAppear;
  self->_changeBlockForWhenAlertWillAppear = v4;

  -[SSSDittoRemoteViewController setWillSoonUnparentChildDittoRootViewController:](self->_remoteViewController, "setWillSoonUnparentChildDittoRootViewController:", 1);
  -[SSRemoteAlertHandleProvider activate](self->_remoteAlertHandleProvider, "activate");
}

- (void)moveFromRemoteAlertViewControllerToRemoteViewController
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Moving from remote alert view controller to remote view controller", v4, 2u);
  }

  -[SSSViewControllerManager _moveDittoRootViewControllerFromViewController:toViewController:](self, "_moveDittoRootViewControllerFromViewController:toViewController:", self->_remoteAlertViewController, self->_remoteViewController);
  -[SSRemoteAlertHandleProvider invalidate](self->_remoteAlertHandleProvider, "invalidate");
  -[SSRemoteAlertHandleProvider prepare](self->_remoteAlertHandleProvider, "prepare");
}

- (void)dismissScreenshots
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Service asked to dismiss screenshots from the host", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002CD6C;
  v4[3] = &unk_100091920;
  v4[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
  -[SSRemoteAlertHandleProvider invalidate](self->_remoteAlertHandleProvider, "invalidate");
}

- (void)screenshotsDismissed
{
  void *v3;
  SSSDittoRootViewController *rootViewController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController hostingViewController](self->_rootViewController, "hostingViewController"));
  -[SSSViewControllerManager _moveDittoRootViewControllerFromViewController:toViewController:](self, "_moveDittoRootViewControllerFromViewController:toViewController:", v3, 0);

  rootViewController = self->_rootViewController;
  self->_rootViewController = 0;

  -[SSSDittoRemoteViewController informHostThatScreenshotsHaveDismissed](self->_remoteViewController, "informHostThatScreenshotsHaveDismissed");
  -[SSRemoteAlertHandleProvider invalidate](self->_remoteAlertHandleProvider, "invalidate");
  -[SSSViewControllerManager unregisterRemoteViewController:](self, "unregisterRemoteViewController:", 0);
}

- (BOOL)shouldAnimateDragCancel
{
  return -[SSSDittoRootViewController shouldAnimateDragCancel](self->_rootViewController, "shouldAnimateDragCancel");
}

- (void)dittoRemoteAlertViewControllerViewWillAppear:(id)a3
{
  id changeBlockForWhenAlertWillAppear;

  if (self->_changeBlockForWhenAlertWillAppear)
  {
    -[SSSViewControllerManager _actuallyMoveFromRemoteViewControllerToRemoteAlertViewController](self, "_actuallyMoveFromRemoteViewControllerToRemoteAlertViewController", a3);
    (*((void (**)(void))self->_changeBlockForWhenAlertWillAppear + 2))();
    changeBlockForWhenAlertWillAppear = self->_changeBlockForWhenAlertWillAppear;
    self->_changeBlockForWhenAlertWillAppear = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertViewController, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong(&self->_changeBlockForWhenAlertWillAppear, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandleProvider, 0);
  objc_storeStrong((id *)&self->_pendingScreenshotRecordsForRootViewController, 0);
  objc_storeStrong((id *)&self->_receivedSessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end
