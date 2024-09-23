@implementation PHPIPController

+ (id)defaultPIPController
{
  if (qword_1002DC680 != -1)
    dispatch_once(&qword_1002DC680, &stru_100284EB8);
  return (id)qword_1002DC678;
}

+ (id)newScreenSharingPIPController
{
  id v2;

  v2 = -[PHPIPController initForScreenSharing:]([PHPIPController alloc], "initForScreenSharing:", 1);
  objc_msgSend(v2, "setShouldObtainDismissalAssertions:", 0);
  return v2;
}

- (id)initForScreenSharing:(BOOL)a3
{
  _BOOL8 v3;
  PHPIPController *v4;
  PHPIPController *v5;
  CNKScreenSharingStateMonitorFactory *v6;
  CNKScreenSharingStateMonitorFactory *screenSharingMonitorFactory;
  CNKScreenSharingInteractionControllerFactory *v8;
  CNKScreenSharingInteractionControllerFactory *screenSharingInteractionControllerFactory;
  TUFeatureFlags *v10;
  TUFeatureFlags *featureFlags;
  PHPIPWrapperViewController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  _QWORD v28[4];
  BOOL v29;
  objc_super v30;

  v3 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PHPIPController;
  v4 = -[PHPIPController init](&v30, "init");
  v5 = v4;
  if (v4)
  {
    v4->_pipState = 0;
    v4->_currentPIPAnimationStyle = 0;
    v6 = objc_opt_new(CNKScreenSharingStateMonitorFactory);
    screenSharingMonitorFactory = v5->_screenSharingMonitorFactory;
    v5->_screenSharingMonitorFactory = v6;

    v8 = objc_opt_new(CNKScreenSharingInteractionControllerFactory);
    screenSharingInteractionControllerFactory = v5->_screenSharingInteractionControllerFactory;
    v5->_screenSharingInteractionControllerFactory = v8;

    v10 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v5->_featureFlags;
    v5->_featureFlags = v10;

    v12 = objc_alloc_init(PHPIPWrapperViewController);
    -[PHPIPController setWrapperViewController:](v5, "setWrapperViewController:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController wrapperViewController](v5, "wrapperViewController"));
    objc_msgSend(v13, "setDelegate:", v5);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
    if (objc_msgSend(v14, "isIPadIdiom") & !v3)
      v15 = 2;
    else
      v15 = 4;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController wrapperViewController](v5, "wrapperViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[PGPictureInPictureProxy pictureInPictureProxyWithControlsStyle:viewController:](PGPictureInPictureProxy, "pictureInPictureProxyWithControlsStyle:viewController:", v15, v16));
    -[PHPIPController setPipProxy:](v5, "setPipProxy:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](v5, "pipProxy"));
    objc_msgSend(v18, "setDelegate:", v5);

    -[PHPIPController setShouldObtainDismissalAssertions:](v5, "setShouldObtainDismissalAssertions:", 1);
    -[PHPIPController setIsUsedForScreenSharing:](v5, "setIsUsedForScreenSharing:", v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](v5, "pipProxy"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001B708;
    v28[3] = &unk_100284ED8;
    v29 = v3;
    objc_msgSend(v19, "updatePlaybackStateUsingBlock:", v28);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v5, "callCenterCallStatusChangedNotification:", TUCallCenterVideoCallStatusChangedNotification, 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v5, "callCenterCallStatusChangedNotification:", TUCallCenterCallStatusChangedNotification, 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v5, "callCenterCallStatusChangedNotification:", TUCallCenterCallConnectedNotification, 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v5, "callCenterCallStatusChangedNotification:", TUCallUpgradedToVideoNotification, 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v5, "uplinkMuteStatusChangedNotification:", TUCallIsUplinkMutedChangedNotification, 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v5, "callIsSendingVideoChanged:", TUCallIsSendingVideoChangedNotification, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](v5, "pipProxy"));
    objc_msgSend(v21, "addObserver:forKeyPath:options:context:", v5, CFSTR("pictureInPictureActive"), 0, &off_100284EF8);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](v5, "pipProxy"));
    objc_msgSend(v22, "addObserver:forKeyPath:options:context:", v5, CFSTR("pictureInPicturePossible"), 0, &off_100284F00);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "conversationManager"));
    objc_msgSend(v24, "addDelegate:queue:", v5, &_dispatch_main_q);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CNKScreenSharingStateMonitorFactory sharedMonitor](v5->_screenSharingMonitorFactory, "sharedMonitor"));
    objc_msgSend(v25, "addObserver:", v5);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CNKScreenSharingInteractionControllerFactory sharedController](v5->_screenSharingInteractionControllerFactory, "sharedController"));
    objc_msgSend(v26, "addDelegate:", v5);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("pictureInPictureActive"), &off_100284EF8);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("pictureInPicturePossible"), &off_100284F00);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNKScreenSharingStateMonitorFactory sharedMonitor](self->_screenSharingMonitorFactory, "sharedMonitor"));
  objc_msgSend(v6, "removeObserver:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNKScreenSharingInteractionControllerFactory sharedController](self->_screenSharingInteractionControllerFactory, "sharedController"));
  objc_msgSend(v7, "removeDelegate:", self);

  v8.receiver = self;
  v8.super_class = (Class)PHPIPController;
  -[PHPIPController dealloc](&v8, "dealloc");
}

+ (Class)inCallRootViewControllerClass
{
  return (Class)objc_opt_class(PHInCallRootViewController, a2);
}

- (void)setWindowForTransitionAnimation:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  int v7;
  PHPIPController *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowForTransitionAnimation);

  if (WeakRetained != v4)
  {
    v6 = sub_1000C5668();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543618;
      v8 = self;
      v9 = 2112;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating PIP with window %@", (uint8_t *)&v7, 0x16u);
    }
    objc_storeWeak((id *)&self->_windowForTransitionAnimation, v4);
    -[PHPIPController updateShouldPIPWhenEnteringBackground](self, "updateShouldPIPWhenEnteringBackground");
    -[PHPIPController updatePIPFrame](self, "updatePIPFrame");
  }

}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: isUsedForScreenSharing=%d>"), objc_opt_class(self, a2), self, -[PHPIPController isUsedForScreenSharing](self, "isUsedForScreenSharing"));
}

- (void)setPipContentViewController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController wrapperViewController](self, "wrapperViewController"));
  objc_msgSend(v5, "setWrappedViewController:", v4);

  -[PHPIPController updatePIPFrame](self, "updatePIPFrame");
}

- (UIViewController)pipContentViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController wrapperViewController](self, "wrapperViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "wrappedViewController"));

  return (UIViewController *)v3;
}

- (void)setSourceProvider:(id)a3
{
  CNKFaceTimePiPSourceProviding **p_sourceProvider;
  id v5;
  id v6;

  p_sourceProvider = &self->_sourceProvider;
  v5 = a3;
  objc_storeWeak((id *)p_sourceProvider, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllerForPiP"));

  -[PHPIPController setPipContentViewController:](self, "setPipContentViewController:", v6);
}

- (void)resetPipContentViewController
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PHPIPController wrapperViewController](self, "wrapperViewController"));
  objc_msgSend(v2, "setWrappedViewController:", 0);

}

- (void)rotatePIPDeviceOrientationTo:(int64_t)a3 withCompletion:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  void (**v14)(_QWORD);
  id v15;
  uint8_t buf[4];
  PHPIPController *v17;
  __int16 v18;
  int64_t v19;

  v6 = (void (**)(_QWORD))a4;
  if (-[PHPIPController pipDeviceOrientation](self, "pipDeviceOrientation") != a3)
  {
    v7 = sub_1000C5668();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2048;
      v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Rotating pip to device orientation %ld", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001BD88;
    v13[3] = &unk_100284F10;
    objc_copyWeak(&v15, (id *)buf);
    v13[4] = self;
    v14 = v6;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001BE8C;
    v11[3] = &unk_100284F38;
    v11[4] = self;
    v8 = objc_retainBlock(v13);
    v12 = v8;
    v9 = objc_retainBlock(v11);
    switch(a3)
    {
      case 1:
        if ((id)-[PHPIPController pipDeviceOrientation](self, "pipDeviceOrientation") == (id)3)
          goto LABEL_18;
        if ((id)-[PHPIPController pipDeviceOrientation](self, "pipDeviceOrientation") == (id)4)
          goto LABEL_16;
        if ((id)-[PHPIPController pipDeviceOrientation](self, "pipDeviceOrientation") == (id)2)
          goto LABEL_20;
        goto LABEL_24;
      case 2:
        if ((id)-[PHPIPController pipDeviceOrientation](self, "pipDeviceOrientation") == (id)1)
          goto LABEL_20;
        if ((id)-[PHPIPController pipDeviceOrientation](self, "pipDeviceOrientation") == (id)3)
          goto LABEL_16;
        if ((id)-[PHPIPController pipDeviceOrientation](self, "pipDeviceOrientation") == (id)4)
          goto LABEL_18;
        goto LABEL_24;
      case 3:
        if ((id)-[PHPIPController pipDeviceOrientation](self, "pipDeviceOrientation") == (id)1)
          goto LABEL_16;
        if ((id)-[PHPIPController pipDeviceOrientation](self, "pipDeviceOrientation") == (id)4)
        {
LABEL_20:
          v10 = 2;
          goto LABEL_23;
        }
        if ((id)-[PHPIPController pipDeviceOrientation](self, "pipDeviceOrientation") == (id)2)
          goto LABEL_18;
        goto LABEL_24;
      case 4:
        if ((id)-[PHPIPController pipDeviceOrientation](self, "pipDeviceOrientation") == (id)1)
        {
LABEL_18:
          v10 = 0;
        }
        else if ((id)-[PHPIPController pipDeviceOrientation](self, "pipDeviceOrientation") == (id)3)
        {
          v10 = 3;
        }
        else
        {
          if ((id)-[PHPIPController pipDeviceOrientation](self, "pipDeviceOrientation") != (id)2)
            goto LABEL_24;
LABEL_16:
          v10 = 1;
        }
LABEL_23:
        ((void (*)(_QWORD *, uint64_t))v9[2])(v9, v10);
LABEL_24:
        -[PHPIPController setPipDeviceOrientation:](self, "setPipDeviceOrientation:", a3);

        objc_destroyWeak(&v15);
        objc_destroyWeak((id *)buf);
        goto LABEL_25;
      default:
        goto LABEL_24;
    }
  }
  if (v6)
    v6[2](v6);
LABEL_25:

}

- (id)viewControllerToRestoreWhenCancellingPIP
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController sourceProvider](self, "sourceProvider"));
  v4 = objc_msgSend(v3, "restoreViewControllerHierarchyWhenExitingPiP");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController sourceProvider](self, "sourceProvider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllerForPiP"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setScreenSharingTitle:(id)a3 andAvatarIfNeeded:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  _BYTE v15[12];
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;

  v6 = a3;
  v7 = a4;
  if (-[PHPIPController isUsedForScreenSharing](self, "isUsedForScreenSharing"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController featureFlags](self, "featureFlags"));
    v9 = objc_msgSend(v8, "supportsScreenSharing");

    if (v9)
    {
      v10 = sub_1000C5668();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 138543874;
        *(_QWORD *)&v15[4] = self;
        v16 = 1024;
        v17 = v6 != 0;
        v18 = 1024;
        v19 = v7 != 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating screen sharing title and avatar on PiP Proxy; hasTitle: %i; hasImage: %i",
          v15,
          0x18u);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy", *(_QWORD *)v15));
      v12 = objc_opt_respondsToSelector(v11, "setScreenSharingTitle:avatar:");

      if ((v12 & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
        objc_msgSend(v13, "setScreenSharingTitle:avatar:", v6, v7);

      }
      else
      {
        v14 = sub_1000C5668();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_1001A8160((uint64_t)self, v14);
      }
    }
  }

}

- (void)startPIPWithCompletion:(id)a3
{
  CNKFaceTimePiPSourceProviding **p_sourceProvider;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  p_sourceProvider = &self->_sourceProvider;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sourceProvider);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewControllerForPiP"));

  -[PHPIPController setPipContentViewController:](self, "setPipContentViewController:", v8);
  -[PHPIPController setStartCompletionBlock:](self, "setStartCompletionBlock:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  LODWORD(v5) = objc_msgSend(v7, "isPictureInPicturePossible");

  if ((_DWORD)v5)
    -[PHPIPController startPIPNow](self, "startPIPNow");
  else
    -[PHPIPController setShouldStartPIPWhenPossible:](self, "setShouldStartPIPWhenPossible:", 1);

}

- (void)startPIPNow
{
  id v3;

  -[PHPIPController setShouldStartPIPWhenPossible:](self, "setShouldStartPIPWhenPossible:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  objc_msgSend(v3, "startPictureInPicture");

}

- (void)stopPIPAndStealViewController:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void (**v14)(_QWORD, _QWORD);
  uint64_t v15;
  id v16;
  id location;
  uint8_t buf[4];
  PHPIPController *v19;
  __int16 v20;
  id v21;

  v4 = a3;
  v5 = sub_1000C5668();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController restoreUserInterfaceForPictureInPictureStopCompletionBlock](self, "restoreUserInterfaceForPictureInPictureStopCompletionBlock"));
    v8 = objc_retainBlock(v7);
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2112;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: stopPIPAndStealViewController (we have this restore UI block %@)", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));

  if (v9)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v16, &location);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController wrapperViewController](self, "wrapperViewController", _NSConcreteStackBlock, 3221225472, sub_10001C43C, &unk_100284F60));
    objc_msgSend(v10, "setWillAnimatePictureInPictureStopCompletionBlock:", &v15);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController wrapperViewController](self, "wrapperViewController"));
    objc_msgSend(v11, "setDidAnimatePictureInPictureStopCompletionBlock:", v4);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController restoreUserInterfaceForPictureInPictureStopCompletionBlock](self, "restoreUserInterfaceForPictureInPictureStopCompletionBlock"));
    if (v12)
    {
      v13 = sub_1000C5668();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: ... stopPIPAndStealViewController running the restore UI block", buf, 0xCu);
      }
      v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHPIPController restoreUserInterfaceForPictureInPictureStopCompletionBlock](self, "restoreUserInterfaceForPictureInPictureStopCompletionBlock"));
      v14[2](v14, 1);

      -[PHPIPController setRestoreUserInterfaceForPictureInPictureStopCompletionBlock:](self, "setRestoreUserInterfaceForPictureInPictureStopCompletionBlock:", 0);
    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (void)manuallyStopPIPWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  PHPIPController *v8;

  v4 = a3;
  if ((id)-[PHPIPController pipState](self, "pipState") == (id)2)
  {
    v5 = sub_1000C5668();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Manually calling stop picture in picture", (uint8_t *)&v7, 0xCu);
    }
    -[PHPIPController setPreparedToAnimateToFullScreenCompletionBlock:](self, "setPreparedToAnimateToFullScreenCompletionBlock:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
    objc_msgSend(v6, "stopPictureInPictureAndRestoreUserInterface:", 1);

  }
}

- (void)cancelPIPIfNeeded
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  PHPIPController *v12;

  if (!-[PHPIPController isPippedOrStartingPIP](self, "isPippedOrStartingPIP"))
  {
    v7 = sub_1000C5668();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      return;
    v11 = 138543362;
    v12 = self;
    v8 = "%{public}@: No need to cancel PiP since it's not starting or active";
    v9 = v7;
    v10 = OS_LOG_TYPE_INFO;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v11, 0xCu);
    return;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));

  v4 = sub_1000C5668();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (!v5)
      return;
    v11 = 138543362;
    v12 = self;
    v8 = "%{public}@: Not cancelling PiP because pipProxy is nil";
    v9 = v4;
    v10 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_10;
  }
  if (v5)
  {
    v11 = 138543362;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: cancelPIP", (uint8_t *)&v11, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  objc_msgSend(v6, "stopPictureInPictureAndRestoreUserInterface:", 0);

  -[PHPIPController setPipState:](self, "setPipState:", 3);
}

- (BOOL)isPreparedToAnimateToFullScreen
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController restoreUserInterfaceForPictureInPictureStopCompletionBlock](self, "restoreUserInterfaceForPictureInPictureStopCompletionBlock"));
  v3 = v2 != 0;

  return v3;
}

- (void)pictureInPictureProxy:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  void *v5;
  void *v6;
  void (**v7)(void);

  -[PHPIPController setRestoreUserInterfaceForPictureInPictureStopCompletionBlock:](self, "setRestoreUserInterfaceForPictureInPictureStopCompletionBlock:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PHPIPControllerDidRequestReturnToFullScreenNotification"), self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController preparedToAnimateToFullScreenCompletionBlock](self, "preparedToAnimateToFullScreenCompletionBlock"));
  if (v6)
  {
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PHPIPController preparedToAnimateToFullScreenCompletionBlock](self, "preparedToAnimateToFullScreenCompletionBlock"));
    v7[2]();

    -[PHPIPController setPreparedToAnimateToFullScreenCompletionBlock:](self, "setPreparedToAnimateToFullScreenCompletionBlock:", 0);
  }
}

- (BOOL)isPipped
{
  return -[PHPIPController pipState](self, "pipState") != 0;
}

- (BOOL)isPippedOrStartingPIP
{
  return (id)-[PHPIPController pipState](self, "pipState") == (id)2
      || (id)-[PHPIPController pipState](self, "pipState") == (id)1;
}

- (BOOL)isPIPProxyActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  v3 = objc_msgSend(v2, "isPictureInPictureActive");

  return v3;
}

- (BOOL)isPIPProxyInterrupted
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  v3 = objc_msgSend(v2, "isPictureInPictureInterrupted");

  return v3;
}

- (BOOL)isPIPProxyActiveAndHidden
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  if (objc_msgSend(v3, "isPictureInPictureActive"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
    v5 = objc_msgSend(v4, "isPictureInPictureStashedOrUnderLock");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setPipState:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  PHPIPController *v10;
  __int16 v11;
  void *v12;

  if (self->_pipState != a3)
  {
    self->_pipState = a3;
    v5 = sub_1000C5668();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController stringForPIPState:](self, "stringForPIPState:", a3));
      v9 = 138543618;
      v10 = self;
      v11 = 2112;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: PIPState changed to %@", (uint8_t *)&v9, 0x16u);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("PHPIPControllerStateDidChangeNotification"), self, 0);

  }
}

- (void)wrapperViewControllerNeedsCleanup:(id)a3
{
  float v4;
  dispatch_time_t v5;
  _QWORD block[5];

  v4 = UIAnimationDragCoefficient(-[PHPIPController setPipState:](self, "setPipState:", 0));
  v5 = dispatch_time(0, (uint64_t)(float)(v4 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CA3C;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)wrapperViewControllerShouldReturnRestoreWrappedViewControllerHierarchy:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController sourceProvider](self, "sourceProvider", a3));
  v4 = objc_msgSend(v3, "restoreViewControllerHierarchyWhenExitingPiP");

  return v4;
}

- (CGSize)wrapperViewControllerPreferredContentSize:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController sourceProvider](self, "sourceProvider", a3));
  objc_msgSend(v3, "preferredPiPContentAspectRatio");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)stringForPIPState:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_100285000[a3];
}

- (CGRect)pictureInPictureProxyViewFrameForTransitionAnimation:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController sourceProvider](self, "sourceProvider", a3));
  objc_msgSend(v3, "frameForRestoreAnimation");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)pictureInPictureProxyViewControllerWindowForTransitionAnimation:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v8;
  PHPIPController *v9;
  __int16 v10;
  void *v11;

  v4 = sub_1000C5668();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController windowForTransitionAnimation](self, "windowForTransitionAnimation"));
    v8 = 138543618;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP controller checked which ICS window to use for PIP: %@", (uint8_t *)&v8, 0x16u);

  }
  return (id)objc_claimAutoreleasedReturnValue(-[PHPIPController windowForTransitionAnimation](self, "windowForTransitionAnimation"));
}

- (void)pictureInPictureProxy:(id)a3 willStartPictureInPictureWithAnimationType:(int64_t)a4
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  PHPIPController *v11;
  __int16 v12;
  int64_t v13;

  v6 = sub_1000C5668();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = self;
    v12 = 2048;
    v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: willStart animationType: %ld", (uint8_t *)&v10, 0x16u);
  }
  -[PHPIPController setShouldStartPIPWhenPossible:](self, "setShouldStartPIPWhenPossible:", 0);
  if (a4)
    v7 = 1;
  else
    v7 = 2;
  -[PHPIPController setCurrentPIPAnimationStyle:](self, "setCurrentPIPAnimationStyle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  objc_msgSend(v8, "preferredContentSizeDidChangeForViewController");

  -[PHPIPController setPipState:](self, "setPipState:", 1);
  if (-[PHPIPController shouldObtainDismissalAssertions](self, "shouldObtainDismissalAssertions"))
    objc_msgSend(objc_msgSend((id)objc_opt_class(self, v9), "inCallRootViewControllerClass"), "obtainDismissalAssertionForReason:", CFSTR("PHPIPPresenceReason"));
}

- (void)pictureInPictureProxy:(id)a3 didStartPictureInPictureWithAnimationType:(int64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(void);
  int v12;
  PHPIPController *v13;
  __int16 v14;
  int64_t v15;

  v6 = sub_1000C5668();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = self;
    v14 = 2048;
    v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didStart animationType: %ld", (uint8_t *)&v12, 0x16u);
  }
  if (!-[PHPIPController shouldPIPWhenEnteringBackground](self, "shouldPIPWhenEnteringBackground"))
  {
    v7 = sub_1000C5668();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_1001A81D4(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
    objc_msgSend(v8, "stopPictureInPictureAndRestoreUserInterface:", 0);

    -[PHPIPController setPipState:](self, "setPipState:", 3);
    -[PHPIPController updateShouldPIPWhenEnteringBackground](self, "updateShouldPIPWhenEnteringBackground");
  }
  if (a4)
    v9 = 1;
  else
    v9 = 2;
  -[PHPIPController setCurrentPIPAnimationStyle:](self, "setCurrentPIPAnimationStyle:", v9);
  -[PHPIPController setPipState:](self, "setPipState:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController startCompletionBlock](self, "startCompletionBlock"));

  if (v10)
  {
    v11 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PHPIPController startCompletionBlock](self, "startCompletionBlock"));
    v11[2]();

    -[PHPIPController setStartCompletionBlock:](self, "setStartCompletionBlock:", 0);
  }
}

- (void)pictureInPictureProxy:(id)a3 failedToStartPictureInPictureWithAnimationType:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  PHPIPController *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  id v17;

  v8 = a5;
  v9 = a3;
  v10 = sub_1000C5668();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543874;
    v13 = self;
    v14 = 2048;
    v15 = a4;
    v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: failedToStart animationType: %ld error: %@", (uint8_t *)&v12, 0x20u);
  }
  -[PHPIPController setCurrentPIPAnimationStyle:](self, "setCurrentPIPAnimationStyle:", 0);
  objc_msgSend(v9, "stopPictureInPictureAndRestoreUserInterface:", 1);

  -[PHPIPController setPipState:](self, "setPipState:", 0);
  if (-[PHPIPController shouldObtainDismissalAssertions](self, "shouldObtainDismissalAssertions"))
    objc_msgSend(objc_msgSend((id)objc_opt_class(self, v11), "inCallRootViewControllerClass"), "releaseDismissalAssertionForReason:", CFSTR("PHPIPPresenceReason"));

}

- (void)pictureInPictureProxy:(id)a3 willStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5
{
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  PHPIPController *v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  int64_t v16;

  v8 = sub_1000C5668();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543874;
    v12 = self;
    v13 = 2048;
    v14 = a4;
    v15 = 2048;
    v16 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: willStop animationType: %ld reason: %ld", (uint8_t *)&v11, 0x20u);
  }
  if (a4)
    v9 = 1;
  else
    v9 = 2;
  -[PHPIPController setCurrentPIPAnimationStyle:](self, "setCurrentPIPAnimationStyle:", v9);
  if (a5 == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("PHPIPControllerWillCancelNotification"), self);

  }
}

- (void)pictureInPictureProxy:(id)a3 didStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5
{
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  PHPIPController *v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  int64_t v16;

  v8 = sub_1000C5668();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543874;
    v12 = self;
    v13 = 2048;
    v14 = a4;
    v15 = 2048;
    v16 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: didStop animationType: %ld reason: %ld", (uint8_t *)&v11, 0x20u);
  }
  -[PHPIPController setCurrentPIPAnimationStyle:](self, "setCurrentPIPAnimationStyle:", 0);
  -[PHPIPController setPipState:](self, "setPipState:", 0);
  if (-[PHPIPController shouldObtainDismissalAssertions](self, "shouldObtainDismissalAssertions"))
    objc_msgSend(objc_msgSend((id)objc_opt_class(self, v9), "inCallRootViewControllerClass"), "releaseDismissalAssertionForReason:", CFSTR("PHPIPPresenceReason"));
  if (a5 == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("PHPIPControllerDidCancelNotification"), self);
  }
  else
  {
    if (a5)
      return;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
    objc_msgSend(v10, "preferredContentSizeDidChangeForViewController");
  }

}

- (void)pictureInPictureProxyPictureInPictureInterruptionBegan:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  unsigned int v10;
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
  int v21;
  PHPIPController *v22;
  __int16 v23;
  unsigned int v24;

  v4 = sub_1000C5668();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138543362;
    v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP interruption began", (uint8_t *)&v21, 0xCu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PHPIPControllerInterruptionChangeNotification"), self);

  if (!-[PHPIPController isUsedForScreenSharing](self, "isUsedForScreenSharing"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentVideoCall"));
    -[PHPIPController setVideoWasPausedForInterruption:](self, "setVideoWasPausedForInterruption:", objc_msgSend(v7, "isSendingVideo"));

    v8 = sub_1000C5668();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = -[PHPIPController videoWasPausedForInterruption](self, "videoWasPausedForInterruption");
      v21 = 138543618;
      v22 = self;
      v23 = 1024;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Storing videoWasPausedForInterruption as %d before stopping sending video", (uint8_t *)&v21, 0x12u);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentVideoCall"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeConversationForCall:", v12));

    if (objc_msgSend(v12, "isConversation")
      && (objc_msgSend(v14, "isOneToOneModeEnabled") & 1) == 0)
    {
      if (-[PHPIPController videoWasPausedForInterruption](self, "videoWasPausedForInterruption"))
        objc_msgSend(v12, "setRemoteVideoPresentationState:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "videoDeviceController"));
      objc_msgSend(v16, "stopPreview");
    }
    else
    {
      if (-[PHPIPController videoWasPausedForInterruption](self, "videoWasPausedForInterruption"))
        objc_msgSend(v12, "setIsSendingVideo:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "videoDeviceController"));
      objc_msgSend(v16, "pausePreview");
    }

    if (-[PHPIPController videoWasPausedForInterruption](self, "videoWasPausedForInterruption"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v17, "postNotificationName:object:", CFSTR("PHPIPControllerDidHandleVideoMuteControlAction"), self);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentVideoCall"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uniqueProxyIdentifier"));
    -[PHPIPController setPipInterruptedCallIdentifier:](self, "setPipInterruptedCallIdentifier:", v20);

  }
}

- (void)pictureInPictureProxyPictureInPictureInterruptionEnded:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  PHPIPController *v20;

  v4 = sub_1000C5668();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138543362;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP interruption ended", (uint8_t *)&v19, 0xCu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PHPIPControllerInterruptionChangeNotification"), self);

  if (-[PHPIPController isPipped](self, "isPipped"))
  {
    if (!-[PHPIPController isUsedForScreenSharing](self, "isUsedForScreenSharing"))
    {
      if (-[PHPIPController videoWasPausedForInterruption](self, "videoWasPausedForInterruption"))
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "frontmostAudioOrVideoCall"));
        v8 = objc_msgSend(v7, "isVideo");

        if (v8)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentVideoCall"));

          v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeConversationForCall:", v10));

          if (objc_msgSend(v10, "isConversation")
            && (objc_msgSend(v12, "isOneToOneModeEnabled") & 1) == 0)
          {
            objc_msgSend(v10, "setRemoteVideoPresentationState:", 1);
          }
          else
          {
            objc_msgSend(v10, "setIsSendingVideo:", 1);
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "videoDeviceController"));
          objc_msgSend(v15, "startPreview");

        }
        -[PHPIPController setVideoWasPausedForInterruption:](self, "setVideoWasPausedForInterruption:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v16, "postNotificationName:object:", CFSTR("PHPIPControllerDidHandleVideoMuteControlAction"), self);

        if (-[PHPIPController expectingSystemInitiatedPIPInterruptionStop](self, "expectingSystemInitiatedPIPInterruptionStop"))
        {
          v17 = sub_1000C5668();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v19 = 138543362;
            v20 = self;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP interruption was ended by system, posting notification...", (uint8_t *)&v19, 0xCu);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
          objc_msgSend(v18, "postNotificationName:object:", CFSTR("PHPIPControllerSystemInitiatedPIPInterruptionStoppedNotification"), self);

        }
      }
      -[PHPIPController setExpectingSystemInitiatedPIPInterruptionStop:](self, "setExpectingSystemInitiatedPIPInterruptionStop:", 0);
      -[PHPIPController setPipInterruptedCallIdentifier:](self, "setPipInterruptedCallIdentifier:", 0);
    }
  }
  else
  {
    v13 = sub_1000C5668();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Not handling PIP interruption ended because we are not PIPped", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)pictureInPictureProxy:(id)a3 didUpdateStashedOrUnderLockState:(BOOL)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3, a4));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PHPIPControllerStashChangeNotification"), self);

}

- (void)pictureInPictureProxyWillSetupPictureInPictureStop:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  PHPIPController *v7;

  v4 = sub_1000C5668();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP will set up for picture-in-picture stop", (uint8_t *)&v6, 0xCu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PHPIPControllerWillSetupPIPStopNotification"), self);

}

- (int64_t)pictureInPictureProxyContentType:(id)a3
{
  if (-[PHPIPController isUsedForScreenSharing](self, "isUsedForScreenSharing", a3))
    return 5;
  else
    return 4;
}

- (BOOL)pipIsBeingResized
{
  void *v3;
  unsigned __int8 v4;

  if ((id)-[PHPIPController pipState](self, "pipState") != (id)2)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController wrapperViewController](self, "wrapperViewController"));
  v4 = objc_msgSend(v3, "pipIsBeingResized");

  return v4;
}

- (void)callCenterCallStatusChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  int v12;
  PHPIPController *v13;

  -[PHPIPController updateShouldPIPWhenEnteringBackground](self, "updateShouldPIPWhenEnteringBackground", a3);
  if ((id)-[PHPIPController pipState](self, "pipState") == (id)2
    && !-[PHPIPController isUsedForScreenSharing](self, "isUsedForScreenSharing"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingCall"));
    if (v5)
    {

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "incomingVideoCall"));

      if (!v7)
        goto LABEL_9;
    }
    v8 = sub_1000C5668();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Call center call status changed to an incoming call, manually animating out of the PIP to show call waiting", (uint8_t *)&v12, 0xCu);
    }
    -[PHPIPController manuallyStopPIPWithCompletion:](self, "manuallyStopPIPWithCompletion:", 0);
  }
LABEL_9:
  if ((id)-[PHPIPController pipState](self, "pipState") == (id)2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    if (objc_msgSend(v9, "hasCurrentCalls"))
    {

    }
    else
    {
      v10 = +[PHSOSViewController isSOSDismissalAssertionActive](PHSOSViewController, "isSOSDismissalAssertionActive");

      if (v10)
      {
        v11 = sub_1000C5668();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138543362;
          v13 = self;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Call center status changed to no current calls, but InCallRootViewController still wants to show SOS. Manually animating out of PIP", (uint8_t *)&v12, 0xCu);
        }
        -[PHPIPController manuallyStopPIPWithCompletion:](self, "manuallyStopPIPWithCompletion:", 0);
      }
    }
  }
  -[PHPIPController updatePIPProxyControlStates](self, "updatePIPProxyControlStates");
}

- (void)updatePipSharePlaySessionWithConversation:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  NSBundle *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  PHPIPController *v31;
  __int16 v32;
  void *v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController featureFlags](self, "featureFlags"));
  if (!objc_msgSend(v5, "expanseEnabled"))
  {
LABEL_17:

    goto LABEL_18;
  }
  v6 = -[PHPIPController isUsedForScreenSharing](self, "isUsedForScreenSharing");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v8 = objc_msgSend(v7, "hasCurrentVideoCalls");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentVideoCall"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeConversationForCall:", v10));

      if (v5 && objc_msgSend(v4, "isEqualToConversation:", v5))
      {
        v12 = sub_1000C5668();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupUUID"));
          v30 = 138543618;
          v31 = self;
          v32 = 2112;
          v33 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring conversation update for groupUUID %@.", (uint8_t *)&v30, 0x16u);

        }
        goto LABEL_17;
      }
    }
    else
    {
      v5 = 0;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activitySessions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allObjects"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tu_firstObjectPassingTest:", &stru_100284FA0));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activity"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activityIdentifier"));
    v20 = objc_msgSend(v19, "isEqualToString:", TUGroupActivityIdentifierScreenSharing);

    if ((v20 & 1) != 0
      || (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activity")),
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bundleIdentifier")),
          v21,
          !v22))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeRemoteParticipants"));
      v24 = objc_msgSend(v23, "tu_containsObjectPassingTest:", &stru_100284FE0);

      if (v24)
      {
        v26 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v25));
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleIdentifier"));

      }
      else
      {
        v22 = 0;
      }
    }
    v28 = sub_1000C5668();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138543618;
      v31 = self;
      v32 = 2114;
      v33 = v22;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting PiP to SharePlay session ID: %{public}@", (uint8_t *)&v30, 0x16u);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
    objc_msgSend(v29, "setClientSessionIdentifier:", v22);

    goto LABEL_17;
  }
LABEL_18:

}

- (void)setClientSessionIdentifierFromPiPAuthorization:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  int v9;
  PHPIPController *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController featureFlags](self, "featureFlags"));
  v6 = objc_msgSend(v5, "supportsScreenSharing");

  if (v6)
  {
    v7 = sub_1000C5668();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting PiP client session identifier for background PiP authorization to session ID: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
    objc_msgSend(v8, "setClientSessionIdentifier:", v4);

  }
}

- (void)updateShouldPIPWhenEnteringBackground
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  int v6;
  PHPIPController *v7;
  __int16 v8;
  _BOOL4 v9;

  v3 = -[PHPIPController shouldPIPWhenEnteringBackground](self, "shouldPIPWhenEnteringBackground");
  v4 = sub_1000C5668();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 1024;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating shouldPIPWhenEnteringBackground to %d", (uint8_t *)&v6, 0x12u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  objc_msgSend(v5, "setPictureInPictureShouldStartWhenEnteringBackground:", v3);

}

- (BOOL)shouldPIPWhenEnteringBackground
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unsigned __int8 v10;
  NSObject *v11;
  const char *v12;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  void *v31;
  id v32;
  _BOOL4 v33;
  int v34;
  PHPIPController *v35;
  __int16 v36;
  void *v37;

  if ((+[PGPictureInPictureProxy isPictureInPictureSupported](PGPictureInPictureProxy, "isPictureInPictureSupported") & 1) == 0)
  {
    v11 = sub_1000C5668();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      return 0;
    v34 = 138543362;
    v35 = self;
    v12 = "%{public}@: isPictureInPictureSupported is false";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v34, 0xCu);
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController windowForTransitionAnimation](self, "windowForTransitionAnimation"));

  if (!v3)
  {
    v11 = sub_1000C5668();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      return 0;
    v34 = 138543362;
    v35 = self;
    v12 = "%{public}@: windowForTransitionAnimation is nil";
    goto LABEL_15;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = objc_msgSend(v4, "currentAudioAndVideoCallCount");

  if (v5 == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentAudioAndVideoCalls"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    if ((objc_msgSend(v8, "isConnected") & 1) == 0 && objc_msgSend(v8, "status") != 3)
    {
      v14 = sub_1000C5668();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v34 = 138543362;
        v35 = self;
        v15 = "%{public}@: call is not connected or sending";
        goto LABEL_27;
      }
LABEL_28:
      v10 = 0;
LABEL_29:

      return v10;
    }
    if (-[PHPIPController isUsedForScreenSharing](self, "isUsedForScreenSharing"))
    {
      v9 = sub_1000C5668();
      v10 = 1;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v34 = 138543362;
        v35 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@: pip isUsedForScreenSharing", (uint8_t *)&v34, 0xCu);
      }
      goto LABEL_29;
    }
    if ((objc_msgSend(v8, "isVideo") & 1) == 0)
    {
      v14 = sub_1000C5668();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v34 = 138543362;
        v35 = self;
        v15 = "%{public}@: call is not video";
        goto LABEL_27;
      }
      goto LABEL_28;
    }
    if ((objc_msgSend(v8, "isConversation") & 1) == 0)
    {
      v16 = sub_1000C5668();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = v16;
        v18 = NSStringFromBOOL(objc_msgSend(v8, "isVideo"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v34 = 138543618;
        v35 = self;
        v36 = 2112;
        v37 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@: call isVideo is %@", (uint8_t *)&v34, 0x16u);

      }
      v10 = objc_msgSend(v8, "isVideo");
      goto LABEL_29;
    }
    if (objc_msgSend(v8, "wantsHoldMusic"))
    {
      v14 = sub_1000C5668();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v34 = 138543362;
        v35 = self;
        v15 = "%{public}@: call wantsHoldMusic";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v34, 0xCu);
        goto LABEL_28;
      }
      goto LABEL_28;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activeConversationForCall:", v8));

    if (!v21)
    {
      v24 = sub_1000C5668();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = v24;
        v26 = NSStringFromBOOL(objc_msgSend(v8, "isVideo"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v34 = 138543618;
        v35 = self;
        v36 = 2112;
        v37 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%{public}@: conversation is nil, call isVideo is %@", (uint8_t *)&v34, 0x16u);

      }
      v10 = objc_msgSend(v8, "isVideo");
      goto LABEL_42;
    }
    if (objc_msgSend(v21, "isContinuitySession"))
    {
      v22 = sub_1000C5668();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
LABEL_38:
        v10 = 0;
LABEL_42:

        goto LABEL_29;
      }
      v34 = 138543362;
      v35 = self;
      v23 = "%{public}@: conversation presentationMode is continuitySession";
LABEL_37:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v34, 0xCu);
      goto LABEL_38;
    }
    if (objc_msgSend(v21, "state") != (id)2 && objc_msgSend(v21, "state") != (id)3)
    {
      v22 = sub_1000C5668();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        goto LABEL_38;
      v34 = 138543362;
      v35 = self;
      v23 = "%{public}@: conversation has not been joined";
      goto LABEL_37;
    }
    if (objc_msgSend(v21, "isOneToOneModeEnabled"))
    {
      v28 = sub_1000C5668();
      v10 = 1;
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        goto LABEL_42;
      v34 = 138543362;
      v35 = self;
      v29 = "%{public}@: conversation isOneToOneModeEnabled";
      v30 = v28;
    }
    else
    {
      if (!-[PHPIPController hasParticipantVideoForActiveConversation](self, "hasParticipantVideoForActiveConversation"))
      {
        v22 = sub_1000C5668();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          goto LABEL_38;
        v34 = 138543362;
        v35 = self;
        v23 = "%{public}@: conversation hasParticipantVideoForActiveConversation is false";
        goto LABEL_37;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "remoteMembers"));
      v32 = objc_msgSend(v31, "count");

      v22 = sub_1000C5668();
      v33 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
      if (!v32)
      {
        if (!v33)
          goto LABEL_38;
        v34 = 138543362;
        v35 = self;
        v23 = "%{public}@: conversation remoteMembers equals 0";
        goto LABEL_37;
      }
      if (!v33)
      {
        v10 = 1;
        goto LABEL_42;
      }
      v34 = 138543362;
      v35 = self;
      v29 = "%{public}@: shouldPIPWhenEnteringBackground";
      v30 = v22;
      v10 = 1;
    }
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, v29, (uint8_t *)&v34, 0xCu);
    goto LABEL_42;
  }
  v11 = sub_1000C5668();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v34 = 138543362;
    v35 = self;
    v12 = "%{public}@: currentAudioAndVideoCallCount is not 1";
    goto LABEL_15;
  }
  return 0;
}

- (BOOL)pipStateIsTransitory
{
  int64_t v3;

  v3 = -[PHPIPController pipState](self, "pipState");
  if (v3 != 1)
    LOBYTE(v3) = (id)-[PHPIPController pipState](self, "pipState") == (id)3;
  return v3;
}

- (void)updatePIPSize
{
  id v3;

  if (-[PHPIPController isRotating](self, "isRotating"))
  {
    -[PHPIPController setWantsPreferredContentSizeUpdateAfterRotationFinishes:](self, "setWantsPreferredContentSizeUpdateAfterRotationFinishes:", 1);
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
    objc_msgSend(v3, "preferredContentSizeDidChangeForViewController");

  }
}

- (void)updatePIPFrame
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  objc_msgSend(v2, "viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController");

}

- (void)sceneDidUpdate
{
  NSObject *v3;
  void *v4;
  int v5;
  PHPIPController *v6;

  v3 = sub_1000C5668();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating PIP proxy scene info", (uint8_t *)&v5, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  objc_msgSend(v4, "viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController");

}

- (void)pictureInPictureProxy:(id)a3 didRequestFaceTimeAction:(int64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  PHPIPController *v9;
  __int16 v10;
  int64_t v11;

  v6 = sub_1000C5668();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 2048;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP proxy requested FaceTime action %ld", (uint8_t *)&v8, 0x16u);
  }
  switch(a4)
  {
    case 1:
      -[PHPIPController handleEnableCameraAction](self, "handleEnableCameraAction");
      break;
    case 2:
      -[PHPIPController handleDisableCameraAction](self, "handleDisableCameraAction");
      break;
    case 3:
      -[PHPIPController handleMuteMicrophoneAction](self, "handleMuteMicrophoneAction");
      break;
    case 4:
      -[PHPIPController handleUnmuteMicrophoneAction](self, "handleUnmuteMicrophoneAction");
      break;
    case 5:
      -[PHPIPController handleFlipCameraAction](self, "handleFlipCameraAction");
      break;
    case 6:
      -[PHPIPController handleShowSystemHUDAction](self, "handleShowSystemHUDAction");
      break;
    default:
      v7 = sub_1000C5668();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1001A8214((uint64_t)self, a4, v7);
      break;
  }
}

- (void)callIsSendingVideoChanged:(id)a3
{
  -[PHPIPController updatePIPProxyCameraControlStates](self, "updatePIPProxyCameraControlStates", a3);
}

- (void)updatePIPProxyMicrophoneControlStates
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentVideoCall"));

  v4 = objc_msgSend(v6, "isUplinkMuted");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  objc_msgSend(v5, "setMicrophoneMuted:", v4);

}

- (void)updatePIPProxyLayerCloning
{
  NSObject *v3;
  NSObject *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;

  v3 = sub_1000C5668();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    if (-[PHPIPController isBroadcastingScreenSharing](self, "isBroadcastingScreenSharing"))
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    if (-[PHPIPController isBeingRemoteControlled](self, "isBeingRemoteControlled"))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating disables layer cloning for PiP, isBroadcastingScreenSharing: %@ isBeingRemoteControlled: %@", (uint8_t *)&v9, 0x16u);

  }
  if (-[PHPIPController isBroadcastingScreenSharing](self, "isBroadcastingScreenSharing"))
    v7 = -[PHPIPController isBeingRemoteControlled](self, "isBeingRemoteControlled") ^ 1;
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  objc_msgSend(v8, "setDisablesLayerCloning:", v7);

}

- (void)updatePIPProxyCameraControlStates
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentVideoCall"));
  v5 = objc_msgSend(v4, "isSendingVideo");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  objc_msgSend(v6, "setCameraActive:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  objc_msgSend(v7, "setCanSwitchCamera:", v5);

}

- (void)updatePIPProxyControlStates
{
  -[PHPIPController updatePIPProxyMicrophoneControlStates](self, "updatePIPProxyMicrophoneControlStates");
  -[PHPIPController updatePIPProxyCameraControlStates](self, "updatePIPProxyCameraControlStates");
}

- (void)handleEnableCameraAction
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentVideoCall"));
  objc_msgSend(v3, "setIsSendingVideo:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "videoDeviceController"));
  objc_msgSend(v4, "startPreview");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PHPIPControllerDidHandleVideoMuteControlAction"), self);

}

- (void)handleDisableCameraAction
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentVideoCall"));
  objc_msgSend(v3, "setIsSendingVideo:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "videoDeviceController"));
  objc_msgSend(v4, "stopPreview");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PHPIPControllerDidHandleVideoMuteControlAction"), self);

}

- (void)handleMuteMicrophoneAction
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentVideoCall"));
  objc_msgSend(v2, "setUplinkMuted:", 1);

}

- (void)handleUnmuteMicrophoneAction
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentVideoCall"));
  objc_msgSend(v2, "setUplinkMuted:", 0);

}

- (void)handleFlipCameraAction
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "videoDeviceController"));
  objc_msgSend(v2, "flipCamera");

}

- (void)handleShowSystemHUDAction
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bannerPresentationManager"));
  objc_msgSend(v3, "presentSystemHUD");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  PHPIPController *v24;
  __int16 v25;
  unsigned int v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == &off_100284EF8)
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("pictureInPictureActive")))
      goto LABEL_13;
    v16 = objc_opt_class(PGPictureInPictureProxy, v15);
    if ((objc_opt_isKindOfClass(v11, v16) & 1) == 0)
      goto LABEL_13;
    v13 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
    v18 = objc_msgSend(v13, "isEqual:", v17);

    if (v18)
    {
      v19 = sub_1000C5668();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
        v23 = 138543618;
        v24 = self;
        v25 = 1024;
        v26 = objc_msgSend(v21, "isPictureInPictureActive");
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: PGPictureInPictureProxy isPictureInPictureActive changed to %d, firing state change notification", (uint8_t *)&v23, 0x12u);

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("PHPIPControllerPIPProxyActiveDidChangeNotification"), self, 0);

    }
LABEL_12:

    goto LABEL_13;
  }
  if (a6 != &off_100284F00)
    goto LABEL_13;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[PHPIPController pipProxy](self, "pipProxy"));
  if (!objc_msgSend(v13, "isPictureInPicturePossible"))
    goto LABEL_12;
  v14 = -[PHPIPController shouldStartPIPWhenPossible](self, "shouldStartPIPWhenPossible");

  if (v14)
    -[PHPIPController startPIPNow](self, "startPIPNow");
LABEL_13:

}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  -[PHPIPController updatePipSharePlaySessionWithConversation:](self, "updatePipSharePlaySessionWithConversation:", a4);
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  -[PHPIPController updatePipSharePlaySessionWithConversation:](self, "updatePipSharePlaySessionWithConversation:", a4);
}

- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4
{
  -[PHPIPController updatePipSharePlaySessionWithConversation:](self, "updatePipSharePlaySessionWithConversation:", a4);
}

- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingBroadcastingState:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (!-[PHPIPController isUsedForScreenSharing](self, "isUsedForScreenSharing", a3))
  {
    -[PHPIPController setIsBroadcastingScreenSharing:](self, "setIsBroadcastingScreenSharing:", v4);
    -[PHPIPController updatePIPProxyLayerCloning](self, "updatePIPProxyLayerCloning");
  }
}

- (void)screenSharingInteractionController:(id)a3 didUpdateRemoteControlStatus:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  _BOOL4 v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPController featureFlags](self, "featureFlags", a3));
  v7 = objc_msgSend(v6, "screenSharingRemoteControlEnabled");

  v8 = sub_1000C5668();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = CFSTR("NO");
      if (v4)
        v10 = CFSTR("YES");
      v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating state for remote control, remote control state is %@", (uint8_t *)&v11, 0xCu);
    }
    -[PHPIPController setIsBeingRemoteControlled:](self, "setIsBeingRemoteControlled:", v4);
    -[PHPIPController updatePIPProxyLayerCloning](self, "updatePIPProxyLayerCloning");
  }
  else if (v9)
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not updating state PiP state for remote control, screen sharing remote control feature flag is disabled", (uint8_t *)&v11, 2u);
  }
}

- (int64_t)pipState
{
  return self->_pipState;
}

- (unint64_t)currentPIPAnimationStyle
{
  return self->_currentPIPAnimationStyle;
}

- (void)setCurrentPIPAnimationStyle:(unint64_t)a3
{
  self->_currentPIPAnimationStyle = a3;
}

- (CNKFaceTimePiPSourceProviding)sourceProvider
{
  return (CNKFaceTimePiPSourceProviding *)objc_loadWeakRetained((id *)&self->_sourceProvider);
}

- (int64_t)pipDeviceOrientation
{
  return self->_pipDeviceOrientation;
}

- (void)setPipDeviceOrientation:(int64_t)a3
{
  self->_pipDeviceOrientation = a3;
}

- (NSString)pipInterruptedCallIdentifier
{
  return self->_pipInterruptedCallIdentifier;
}

- (void)setPipInterruptedCallIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)expectingSystemInitiatedPIPInterruptionStop
{
  return self->_expectingSystemInitiatedPIPInterruptionStop;
}

- (void)setExpectingSystemInitiatedPIPInterruptionStop:(BOOL)a3
{
  self->_expectingSystemInitiatedPIPInterruptionStop = a3;
}

- (UIWindow)windowForTransitionAnimation
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_windowForTransitionAnimation);
}

- (BOOL)shouldObtainDismissalAssertions
{
  return self->_shouldObtainDismissalAssertions;
}

- (void)setShouldObtainDismissalAssertions:(BOOL)a3
{
  self->_shouldObtainDismissalAssertions = a3;
}

- (BOOL)hasParticipantVideoForActiveConversation
{
  return self->_hasParticipantVideoForActiveConversation;
}

- (void)setHasParticipantVideoForActiveConversation:(BOOL)a3
{
  self->_hasParticipantVideoForActiveConversation = a3;
}

- (CNKScreenSharingStateMonitorFactory)screenSharingMonitorFactory
{
  return self->_screenSharingMonitorFactory;
}

- (CNKScreenSharingInteractionControllerFactory)screenSharingInteractionControllerFactory
{
  return self->_screenSharingInteractionControllerFactory;
}

- (PHPIPWrapperViewController)wrapperViewController
{
  return (PHPIPWrapperViewController *)objc_getProperty(self, a2, 88, 1);
}

- (void)setWrapperViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PGPictureInPictureProxy)pipProxy
{
  return (PGPictureInPictureProxy *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPipProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (id)startCompletionBlock
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setStartCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (id)preparedToAnimateToFullScreenCompletionBlock
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setPreparedToAnimateToFullScreenCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (id)restoreUserInterfaceForPictureInPictureStopCompletionBlock
{
  return self->_restoreUserInterfaceForPictureInPictureStopCompletionBlock;
}

- (void)setRestoreUserInterfaceForPictureInPictureStopCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)videoWasPausedForInterruption
{
  return self->_videoWasPausedForInterruption;
}

- (void)setVideoWasPausedForInterruption:(BOOL)a3
{
  self->_videoWasPausedForInterruption = a3;
}

- (BOOL)shouldStartPIPWhenPossible
{
  return self->_shouldStartPIPWhenPossible;
}

- (void)setShouldStartPIPWhenPossible:(BOOL)a3
{
  self->_shouldStartPIPWhenPossible = a3;
}

- (BOOL)isUsedForScreenSharing
{
  return self->_isUsedForScreenSharing;
}

- (void)setIsUsedForScreenSharing:(BOOL)a3
{
  self->_isUsedForScreenSharing = a3;
}

- (BOOL)isBroadcastingScreenSharing
{
  return self->_isBroadcastingScreenSharing;
}

- (void)setIsBroadcastingScreenSharing:(BOOL)a3
{
  self->_isBroadcastingScreenSharing = a3;
}

- (BOOL)isBeingRemoteControlled
{
  return self->_isBeingRemoteControlled;
}

- (void)setIsBeingRemoteControlled:(BOOL)a3
{
  self->_isBeingRemoteControlled = a3;
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (BOOL)wantsPreferredContentSizeUpdateAfterRotationFinishes
{
  return self->_wantsPreferredContentSizeUpdateAfterRotationFinishes;
}

- (void)setWantsPreferredContentSizeUpdateAfterRotationFinishes:(BOOL)a3
{
  self->_wantsPreferredContentSizeUpdateAfterRotationFinishes = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong(&self->_restoreUserInterfaceForPictureInPictureStopCompletionBlock, 0);
  objc_storeStrong(&self->_preparedToAnimateToFullScreenCompletionBlock, 0);
  objc_storeStrong(&self->_startCompletionBlock, 0);
  objc_storeStrong((id *)&self->_pipProxy, 0);
  objc_storeStrong((id *)&self->_wrapperViewController, 0);
  objc_storeStrong((id *)&self->_screenSharingInteractionControllerFactory, 0);
  objc_storeStrong((id *)&self->_screenSharingMonitorFactory, 0);
  objc_destroyWeak((id *)&self->_windowForTransitionAnimation);
  objc_storeStrong((id *)&self->_pipInterruptedCallIdentifier, 0);
  objc_destroyWeak((id *)&self->_sourceProvider);
}

@end
