@implementation CAMMessagesExtensionViewController

+ (void)initialize
{
  CAMSignpostWithIDAndArgs(1, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  +[CAMCaptureEngine preheatCaptureResources](CAMCaptureEngine, "preheatCaptureResources");
}

+ (void)registerActivityAttribution
{
  +[STDynamicActivityAttributionPublisher setCurrentAttributionKey:andApp:](STDynamicActivityAttributionPublisher, "setCurrentAttributionKey:andApp:", 0, CFSTR("com.apple.MobileSMS"));
}

+ (int64_t)_deviceMemorySize
{
  if (qword_10001A540 != -1)
    dispatch_once(&qword_10001A540, &stru_1000145E0);
  return qword_10001A538;
}

+ (BOOL)_deviceSupportsFunEffects
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003680;
  block[3] = &unk_100014600;
  block[4] = a1;
  if (qword_10001A550 != -1)
    dispatch_once(&qword_10001A550, block);
  return byte_10001A548;
}

- (CAMMessagesExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  double Current;
  CAMMessagesExtensionViewController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  CAMMessagesExtensionViewController *v13;
  uint8_t v15[16];
  objc_super v16;

  v6 = a4;
  v7 = a3;
  CAMSignpostWithIDAndArgs(10015, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  Current = CFAbsoluteTimeGetCurrent();
  v16.receiver = self;
  v16.super_class = (Class)CAMMessagesExtensionViewController;
  v9 = -[CAMMessagesExtensionViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", v7, v6);

  if (v9)
  {
    -[CAMMessagesExtensionViewController _setLogReferenceTime:](v9, "_setLogReferenceTime:", Current);
    -[CAMMessagesExtensionViewController _setLogReferenceDescription:](v9, "_setLogReferenceDescription:", CFSTR("init"));
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CAMMessagesExtensionViewController init", v15, 2u);
    }

    v9->__shouldShowFunEffects = objc_msgSend((id)objc_opt_class(v9), "_deviceSupportsFunEffects");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, "_handlePreviewDidStartRunning:", AVCaptureVideoPreviewLayerDidStartRunningNotification, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, "_handleHostDidEnterBackgroundNotification:", NSExtensionHostDidEnterBackgroundNotification, 0);

    objc_msgSend((id)objc_opt_class(v9), "registerActivityAttribution");
    CAMSignpostWithIDAndArgs(10016, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
    v13 = v9;
  }

  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CAMMessagesExtensionViewController dealloc", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5 = -[CAMMessagesExtensionViewController _stopAndReleaseRegularCameraViewController](self, "_stopAndReleaseRegularCameraViewController");
  v6 = -[CAMMessagesExtensionViewController _stopAndReleaseCFXCameraViewController](self, "_stopAndReleaseCFXCameraViewController");
  v7.receiver = self;
  v7.super_class = (Class)CAMMessagesExtensionViewController;
  -[CAMMessagesExtensionViewController dealloc](&v7, "dealloc");
}

- (void)_prepareForPresentationWithCompletionHandler:(id)a3
{
  void (**v5)(id, uint64_t);
  double Current;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  void *v13;
  NSString *v14;
  int v15;
  void *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  void *v20;

  v5 = (void (**)(id, uint64_t))a3;
  CAMSignpostWithIDAndArgs(10017, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  Current = CFAbsoluteTimeGetCurrent();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _logReferenceDescription](self, "_logReferenceDescription"));

  if (v7)
  {
    -[CAMMessagesExtensionViewController _logReferenceTime](self, "_logReferenceTime");
    v9 = v8;
    v10 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _logReferenceDescription](self, "_logReferenceDescription"));
    v15 = 138543874;
    v16 = v12;
    v17 = 2048;
    v18 = Current - v9;
    v19 = 2114;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %.3f seconds after %{public}@", (uint8_t *)&v15, 0x20u);

  }
  else
  {
    -[CAMMessagesExtensionViewController _setLogReferenceTime:](self, "_setLogReferenceTime:", Current);
    -[CAMMessagesExtensionViewController _setLogReferenceDescription:](self, "_setLogReferenceDescription:", CFSTR("_prepareForPresentationWithCompletionHandler"));
    v10 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v14 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v15 = 138543362;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v15, 0xCu);
  }

LABEL_7:
  if (!-[CAMMessagesExtensionViewController _captureState](self, "_captureState"))
    -[CAMMessagesExtensionViewController _setCaptureState:](self, "_setCaptureState:", 1);
  if (v5)
    v5[2](v5, 1);
  CAMSignpostWithIDAndArgs(10018, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);

}

- (void)_handlePreviewDidStartRunning:(id)a3
{
  double Current;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  double v13;
  __int16 v14;
  void *v15;

  Current = CFAbsoluteTimeGetCurrent();
  -[CAMMessagesExtensionViewController _logReferenceTime](self, "_logReferenceTime");
  v6 = v5;
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _logReferenceDescription](self, "_logReferenceDescription"));
    *(_DWORD *)buf = 134218242;
    v13 = Current - v6;
    v14 = 2114;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AVCaptureVideoPreviewLayerDidStartRunningNotification %.3f seconds after %{public}@. Preloading frameworks.", buf, 0x16u);

  }
  if (-[CAMMessagesExtensionViewController _shouldShowFunEffects](self, "_shouldShowFunEffects"))
  {
    v9 = sub_100003CFC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    dispatch_async(v10, &stru_100014620);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003DB8;
  block[3] = &unk_100014668;
  block[4] = self;
  if (qword_10001A558 != -1)
    dispatch_once(&qword_10001A558, block);
}

- (void)dismiss
{
  objc_super v3;

  CAMSignpostWithIDAndArgs(10037, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)CAMMessagesExtensionViewController;
  -[CAMMessagesExtensionViewController dismiss](&v3, "dismiss");
  -[CAMMessagesExtensionViewController _setUserPreferenceOverrides:](self, "_setUserPreferenceOverrides:", 0);
}

- (void)viewDidLoad
{
  double Current;
  double v5;
  double v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  _QWORD v12[6];
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  void *v19;

  CAMSignpostWithIDAndArgs(10019, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  Current = CFAbsoluteTimeGetCurrent();
  -[CAMMessagesExtensionViewController _logReferenceTime](self, "_logReferenceTime");
  v6 = v5;
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _logReferenceDescription](self, "_logReferenceDescription"));
    *(_DWORD *)buf = 138543874;
    v15 = v9;
    v16 = 2048;
    v17 = Current - v6;
    v18 = 2114;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %.3f seconds after %{public}@", buf, 0x20u);

  }
  v13.receiver = self;
  v13.super_class = (Class)CAMMessagesExtensionViewController;
  -[CAMMessagesExtensionViewController viewDidLoad](&v13, "viewDidLoad");
  -[CAMMessagesExtensionViewController _setCaptureState:](self, "_setCaptureState:", 1);
  v11 = dispatch_time(0, 2000000000);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000415C;
  v12[3] = &unk_100014690;
  v12[4] = self;
  v12[5] = 0x4000000000000000;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v12);
  CAMSignpostWithIDAndArgs(10020, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  double Current;
  double v7;
  double v8;
  NSObject *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  void *v24;

  v3 = a3;
  CAMSignpostWithIDAndArgs(10021, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  Current = CFAbsoluteTimeGetCurrent();
  -[CAMMessagesExtensionViewController _logReferenceTime](self, "_logReferenceTime");
  v8 = v7;
  v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _logReferenceDescription](self, "_logReferenceDescription"));
    *(_DWORD *)buf = 138543874;
    v20 = v11;
    v21 = 2048;
    v22 = Current - v8;
    v23 = 2114;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %.3f seconds after %{public}@", buf, 0x20u);

  }
  v18.receiver = self;
  v18.super_class = (Class)CAMMessagesExtensionViewController;
  -[CAMMessagesExtensionViewController viewWillAppear:](&v18, "viewWillAppear:", v3);
  -[CAMMessagesExtensionViewController _setDidReceiveViewWillAppear:](self, "_setDidReceiveViewWillAppear:", 1);
  -[CAMMessagesExtensionViewController _setCaptureState:](self, "_setCaptureState:", 1);
  -[CAMMessagesExtensionViewController _startActiveCameraSession](self, "_startActiveCameraSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "context"));
  LODWORD(v17) = 1065361605;
  objc_msgSend(v16, "setDesiredDynamicRange:", v17);

  CAMSignpostWithIDAndArgs(10022, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  double Current;
  double v7;
  double v8;
  NSObject *v9;
  NSString *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  void *v19;

  v3 = a3;
  CAMSignpostWithIDAndArgs(10023, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  Current = CFAbsoluteTimeGetCurrent();
  -[CAMMessagesExtensionViewController _logReferenceTime](self, "_logReferenceTime");
  v8 = v7;
  v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _logReferenceDescription](self, "_logReferenceDescription"));
    *(_DWORD *)buf = 138543874;
    v15 = v11;
    v16 = 2048;
    v17 = Current - v8;
    v18 = 2114;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %.3f seconds after %{public}@", buf, 0x20u);

  }
  v13.receiver = self;
  v13.super_class = (Class)CAMMessagesExtensionViewController;
  -[CAMMessagesExtensionViewController viewDidAppear:](&v13, "viewDidAppear:", v3);
  CAMSignpostWithIDAndArgs(10024, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  double Current;
  double v7;
  double v8;
  NSObject *v9;
  NSString *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  void *v19;

  v3 = a3;
  CAMSignpostWithIDAndArgs(10025, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  Current = CFAbsoluteTimeGetCurrent();
  -[CAMMessagesExtensionViewController _logReferenceTime](self, "_logReferenceTime");
  v8 = v7;
  v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _logReferenceDescription](self, "_logReferenceDescription"));
    *(_DWORD *)buf = 138543874;
    v15 = v11;
    v16 = 2048;
    v17 = Current - v8;
    v18 = 2114;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %.3f seconds after %{public}@", buf, 0x20u);

  }
  v13.receiver = self;
  v13.super_class = (Class)CAMMessagesExtensionViewController;
  -[CAMMessagesExtensionViewController viewWillDisappear:](&v13, "viewWillDisappear:", v3);
  -[CAMMessagesExtensionViewController _stopActiveCameraSession](self, "_stopActiveCameraSession");
  CAMSignpostWithIDAndArgs(10026, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  double Current;
  double v7;
  double v8;
  NSObject *v9;
  NSString *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  void *v19;

  v3 = a3;
  CAMSignpostWithIDAndArgs(10027, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  Current = CFAbsoluteTimeGetCurrent();
  -[CAMMessagesExtensionViewController _logReferenceTime](self, "_logReferenceTime");
  v8 = v7;
  v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _logReferenceDescription](self, "_logReferenceDescription"));
    *(_DWORD *)buf = 138543874;
    v15 = v11;
    v16 = 2048;
    v17 = Current - v8;
    v18 = 2114;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %.3f seconds after %{public}@", buf, 0x20u);

  }
  v13.receiver = self;
  v13.super_class = (Class)CAMMessagesExtensionViewController;
  -[CAMMessagesExtensionViewController viewDidDisappear:](&v13, "viewDidDisappear:", v3);
  -[CAMMessagesExtensionViewController _dismissReviewController](self, "_dismissReviewController");
  -[CAMMessagesExtensionViewController _setCaptureState:](self, "_setCaptureState:", 0);
  -[CAMMessagesExtensionViewController _setLogReferenceDescription:](self, "_setLogReferenceDescription:", 0);
  -[CAMMessagesExtensionViewController _setLogReferenceTime:](self, "_setLogReferenceTime:", 0.0);
  CAMSignpostWithIDAndArgs(10028, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  double v15;
  double v16;
  id v17;
  objc_super v18;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CAMMessagesExtensionViewController;
  -[CAMMessagesExtensionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v18, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _reviewController](self, "_reviewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reviewBarsModel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));

  if (v11)
  {
    v12 = objc_msgSend(v11, "_toWindowOrientation");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100004A1C;
    v13[3] = &unk_1000146B8;
    v15 = width;
    v16 = height;
    v13[4] = self;
    v14 = v9;
    v17 = v12;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v13, 0);

  }
}

- (void)viewWillLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CAMMessagesExtensionViewController;
  -[CAMMessagesExtensionViewController viewWillLayoutSubviews](&v2, "viewWillLayoutSubviews");
}

- (void)_adoptChildViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CAMMessagesExtensionViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];

  if (a3)
  {
    v20 = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController view](self, "view"));
    -[CAMMessagesExtensionViewController addChildViewController:](self, "addChildViewController:", v20);
    objc_msgSend(v5, "addSubview:", v4);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leftAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
    v21[0] = v17;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rightAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
    v21[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
    v21[2] = v9;
    v14 = self;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    v21[3] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

    objc_msgSend(v20, "didMoveToParentViewController:", v14);
  }
}

+ (void)_removeChildViewController:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "willMoveToParentViewController:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(v4, "removeFromParentViewController");
}

- (void)_createAndEmbedRegularCameraViewControllerIfNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  CAMCameraViewController *v6;
  CAMCameraViewController *regularCameraViewController;
  id v8;

  if (!self->__regularCameraViewController)
  {
    CAMSignpostWithIDAndArgs(10029, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController view](self, "view"));
    v4 = CAMLayoutStyleForView();

    v8 = (id)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _userPreferenceOverrides](self, "_userPreferenceOverrides"));
    if (-[CAMMessagesExtensionViewController _shouldShowFunEffects](self, "_shouldShowFunEffects"))
      v5 = 5;
    else
      v5 = 1;
    v6 = (CAMCameraViewController *)objc_msgSend(objc_alloc((Class)CAMCameraViewController), "initWithOverrides:initialLayoutStyle:privateOptions:", v8, v4, v5);
    regularCameraViewController = self->__regularCameraViewController;
    self->__regularCameraViewController = v6;

    -[CAMCameraViewController setUberDelegate:](self->__regularCameraViewController, "setUberDelegate:", self);
    -[CAMCameraViewController setAutomaticallyManagesCameraSession:](self->__regularCameraViewController, "setAutomaticallyManagesCameraSession:", 0);
    -[CAMCameraViewController setPersistenceBehavior:](self->__regularCameraViewController, "setPersistenceBehavior:", 1);
    -[CAMCameraViewController setDisablingAdditionalCaptures:](self->__regularCameraViewController, "setDisablingAdditionalCaptures:", 1);
    -[CAMCameraViewController setDisablingMultipleCaptureFeatures:](self->__regularCameraViewController, "setDisablingMultipleCaptureFeatures:", 1);
    -[CAMMessagesExtensionViewController _adoptChildViewController:](self, "_adoptChildViewController:", self->__regularCameraViewController);
    CAMSignpostWithIDAndArgs(10030, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);

  }
}

- (void)_createAndEmbedCFXCameraViewControllerIfNecessary
{
  id v3;
  id v4;
  id v5;
  id v6;
  CFXCameraViewController *v7;
  CFXCameraViewController *cfxCameraViewController;
  id v9;

  if (!self->__cfxCameraViewController)
  {
    CAMSignpostWithIDAndArgs(10031, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _userPreferenceOverrides](self, "_userPreferenceOverrides"));
    v3 = objc_msgSend((id)objc_opt_class(self), "_cfxCaptureModeFromUserPreferenceOverrides:", v9);
    v4 = objc_msgSend((id)objc_opt_class(self), "_avDevicePositionFromUserPreferenceOverrides:", v9);
    v5 = objc_msgSend((id)objc_opt_class(self), "_avFlashModeFromUserPreferenceOverrides:", v9);
    v6 = objc_msgSend((id)objc_opt_class(self), "_cfxAspectRatioCropFromUserPreferenceOverrides:", v9);
    v7 = (CFXCameraViewController *)objc_msgSend(objc_alloc((Class)sub_100004F9C()), "initWithCaptureMode:devicePosition:flashMode:aspectRatioCrop:", v3, v4, v5, v6);
    cfxCameraViewController = self->__cfxCameraViewController;
    self->__cfxCameraViewController = v7;

    -[CFXCameraViewController setDelegate:](self->__cfxCameraViewController, "setDelegate:", self);
    -[CAMMessagesExtensionViewController _adoptChildViewController:](self, "_adoptChildViewController:", self->__cfxCameraViewController);
    CAMSignpostWithIDAndArgs(10032, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);

  }
}

+ (int64_t)_cfxCaptureModeFromUserPreferenceOverrides:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "captureMode"));
  v4 = v3;
  if (v3)
    v5 = 2 * (objc_msgSend(v3, "integerValue") == (id)1);
  else
    v5 = 0;

  return v5;
}

+ (int64_t)_cfxAspectRatioCropFromUserPreferenceOverrides:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "aspectRatioCrop"));
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
    if (v5 == (id)2)
      v6 = 1;
    else
      v6 = 2 * (v5 == (id)1);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)_avDevicePositionFromUserPreferenceOverrides:(id)a3
{
  void *v3;
  void *v4;
  char *v5;
  uint64_t v6;
  int64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "captureDevice"));
  v4 = v3;
  if (v3)
  {
    v5 = (char *)objc_msgSend(v3, "integerValue");
    if ((unint64_t)(v5 - 1) > 0xA)
      v6 = 0;
    else
      v6 = qword_100012EE0[(_QWORD)(v5 - 1)];
    v7 = (int64_t)+[CAMCaptureConversions AVDevicePositionForCAMDevicePosition:](CAMCaptureConversions, "AVDevicePositionForCAMDevicePosition:", v6);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (int64_t)_avFlashModeFromUserPreferenceOverrides:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  v5 = objc_msgSend(a1, "_cfxCaptureModeFromUserPreferenceOverrides:", v4);
  if ((unint64_t)v5 >= 2)
  {
    if (v5 == (id)2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "torchMode"));
      v7 = v9;
      if (v9)
      {
        v8 = objc_msgSend((id)objc_opt_class(a1), "_AVFlashModeForCAMTorchMode:", objc_msgSend(v9, "integerValue"));
        goto LABEL_8;
      }
LABEL_9:
      v10 = 2;
      goto LABEL_10;
    }
    if (v5 != (id)3)
    {
      v10 = 2;
      goto LABEL_11;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flashMode"));
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  v8 = +[CAMCaptureConversions captureFlashModeForFlashMode:](CAMCaptureConversions, "captureFlashModeForFlashMode:", objc_msgSend(v6, "integerValue"));
LABEL_8:
  v10 = (int64_t)v8;
LABEL_10:

LABEL_11:
  return v10;
}

- (void)_preheatCFXCameraFromUserPreferenceOverrides:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "_cfxCaptureModeFromUserPreferenceOverrides:", v4);
  v6 = objc_msgSend((id)objc_opt_class(self), "_avDevicePositionFromUserPreferenceOverrides:", v4);
  v7 = objc_msgSend((id)objc_opt_class(self), "_cfxAspectRatioCropFromUserPreferenceOverrides:", v4);

  v8 = sub_100004F9C();
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  objc_msgSend(v8, "preheatWithWindow:captureMode:devicePosition:aspectRatioCrop:", v9, v5, v6, v7);

}

- (id)_stopAndReleaseRegularCameraViewController
{
  void *v3;
  CAMCameraViewController *regularCameraViewController;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));
  if (v3)
  {
    -[CAMCameraViewController setUberDelegate:](self->__regularCameraViewController, "setUberDelegate:", 0);
    regularCameraViewController = self->__regularCameraViewController;
    self->__regularCameraViewController = 0;

    objc_msgSend((id)objc_opt_class(self), "_stopRegularCamera:", v3);
    v5 = v3;
  }

  return v3;
}

- (id)_stopAndReleaseCFXCameraViewController
{
  void *v3;
  CFXCameraViewController *cfxCameraViewController;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _cfxCameraViewController](self, "_cfxCameraViewController"));
  if (v3)
  {
    -[CFXCameraViewController setDelegate:](self->__cfxCameraViewController, "setDelegate:", 0);
    cfxCameraViewController = self->__cfxCameraViewController;
    self->__cfxCameraViewController = 0;

    objc_msgSend((id)objc_opt_class(self), "_stopCFXCamera:", v3);
    v5 = v3;
  }

  return v3;
}

+ (id)_userPreferenceOverridesFromRegularCamera:(id)a3 baseUserPreferenceOverrides:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)CAMUserPreferenceOverrides), "initWithOverrides:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "captureMode")));
  objc_msgSend(v7, "setCaptureMode:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "captureDevice")));
  objc_msgSend(v7, "setCaptureDevice:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "flashMode")));
  objc_msgSend(v7, "setFlashMode:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "torchMode")));
  objc_msgSend(v7, "setTorchMode:", v11);

  if (!objc_msgSend(v5, "captureMode"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "photoModeAspectRatioCrop")));
    objc_msgSend(v7, "setAspectRatioCrop:", v12);

  }
  return v7;
}

+ (id)_userPreferenceOverridesFromCFXCamera:(id)a3 baseUserPreferenceOverrides:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _UNKNOWN **v13;
  NSNumber *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)CAMUserPreferenceOverrides), "initWithOverrides:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[CAMCaptureConversions CAMDevicePositionForAVDevicePosition:](CAMCaptureConversions, "CAMDevicePositionForAVDevicePosition:", objc_msgSend(v6, "devicePosition")) == (id)1));
  objc_msgSend(v8, "setCaptureDevice:", v9);

  v10 = objc_msgSend(v6, "captureMode");
  if ((unint64_t)v10 < 2)
    goto LABEL_4;
  if (v10 == (id)2)
  {
    objc_msgSend(v8, "setCaptureMode:", &off_100014C20);
    v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend((id)objc_opt_class(a1), "_CAMTorchModeForAVFlashMode:", objc_msgSend(v6, "flashMode")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v8, "setTorchMode:", v15);

    goto LABEL_12;
  }
  if (v10 == (id)3)
  {
LABEL_4:
    objc_msgSend(v8, "setCaptureMode:", &off_100014C08);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[CAMCaptureConversions flashModeForCaptureFlashMode:](CAMCaptureConversions, "flashModeForCaptureFlashMode:", objc_msgSend(v6, "flashMode"))));
    objc_msgSend(v8, "setFlashMode:", v11);

    v12 = objc_msgSend(v6, "aspectRatioCrop");
    if (v12 == (id)2)
    {
      v13 = &off_100014C20;
      goto LABEL_11;
    }
    if (v12 == (id)1)
    {
      v13 = &off_100014C38;
      goto LABEL_11;
    }
    if (!v12)
    {
      v13 = &off_100014C08;
LABEL_11:
      objc_msgSend(v8, "setAspectRatioCrop:", v13);
    }
  }
LABEL_12:

  return v8;
}

- (void)_stopActiveCameraSession
{
  -[CAMMessagesExtensionViewController _stopRegularCamera](self, "_stopRegularCamera");
  -[CAMMessagesExtensionViewController _stopCFXCamera](self, "_stopCFXCamera");
}

- (void)_startActiveCameraSession
{
  int64_t v3;

  v3 = -[CAMMessagesExtensionViewController _captureState](self, "_captureState");
  if ((unint64_t)(v3 - 3) < 2)
  {
    -[CAMMessagesExtensionViewController _startCFXCamera](self, "_startCFXCamera");
  }
  else if (v3 == 6 || v3 == 1)
  {
    -[CAMMessagesExtensionViewController _startRegularCamera](self, "_startRegularCamera");
  }
}

- (void)_startRegularCamera
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;

  v3 = -[CAMMessagesExtensionViewController _captureState](self, "_captureState");
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x3D) != 0)
    {
      v4 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", -[CAMMessagesExtensionViewController _captureState](self, "_captureState")));
        *(_DWORD *)buf = 138543362;
        v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Should not be trying to start regular camera from %{public}@", buf, 0xCu);

      }
    }
    else
    {
      v6 = (void *)objc_opt_class(self);
      v7 = (id)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));
      objc_msgSend(v6, "_startRegularCamera:");

    }
  }
}

- (void)_startCFXCamera
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;

  v3 = -[CAMMessagesExtensionViewController _captureState](self, "_captureState");
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x67) != 0)
    {
      v4 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", -[CAMMessagesExtensionViewController _captureState](self, "_captureState")));
        *(_DWORD *)buf = 138543362;
        v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Should not be trying to start CFX camera from %{public}@", buf, 0xCu);

      }
    }
    else
    {
      v6 = (void *)objc_opt_class(self);
      v7 = (id)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _cfxCameraViewController](self, "_cfxCameraViewController"));
      objc_msgSend(v6, "_startCFXCamera:");

    }
  }
}

- (void)_stopRegularCamera
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class(self);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));
  objc_msgSend(v3, "_stopRegularCamera:", v4);

}

- (void)_stopCFXCamera
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class(self);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _cfxCameraViewController](self, "_cfxCameraViewController"));
  objc_msgSend(v3, "_stopCFXCamera:", v4);

}

+ (void)_startRegularCamera:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (v3)
  {
    CAMSignpostWithIDAndArgs(10002, 0xEEEEB0B5B2B2EEEELL, v3, 0, 0, 0);
    objc_msgSend(v3, "resumeCameraSession");
  }
  else
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trying to start RegularCamera but no view controller found", v5, 2u);
    }

  }
}

+ (void)_stopRegularCamera:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    CAMSignpostWithIDAndArgs(10004, 0xEEEEB0B5B2B2EEEELL, a3, 0, 0, 0);
    objc_msgSend(v4, "suspendCameraSession");

  }
}

+ (void)_startCFXCamera:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (v3)
  {
    CAMSignpostWithIDAndArgs(10006, 0xEEEEB0B5B2B2EEEELL, v3, 0, 0, 0);
    objc_msgSend(v3, "startCaptureSession");
  }
  else
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trying to start CFXCamera but no view controller found", v5, 2u);
    }

  }
}

+ (void)_stopCFXCamera:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    CAMSignpostWithIDAndArgs(10008, 0xEEEEB0B5B2B2EEEELL, a3, 0, 0, 0);
    objc_msgSend(v4, "stopCaptureSession");

  }
}

- (void)_fadeInViewController:(id)a3 overOutgoingViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  v7 = v6;
  if (v5)
    v8 = 0.3;
  else
    v8 = 0.0;
  v12 = v5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005DA0;
  v13[3] = &unk_100014668;
  v14 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005DAC;
  v11[3] = &unk_1000146E0;
  v9 = v5;
  v10 = v7;
  +[CAMView animateIfNeededWithDuration:options:animations:completion:](CAMView, "animateIfNeededWithDuration:options:animations:completion:", 2, v13, v11, v8);

}

- (void)_setCaptureState:(int64_t)a3
{
  int64_t captureState;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  double v37;

  captureState = self->__captureState;
  if (captureState != a3)
  {
    if (-[CAMMessagesExtensionViewController _isValidStateTransitionFrom:to:](self, "_isValidStateTransitionFrom:to:", self->__captureState, a3))
    {
      CAMSignpostWithIDAndArgs(10014, 0xEEEEB0B5B2B2EEEELL, a3, 0, 0, 0);
      -[CAMMessagesExtensionViewController _stateChangeReferenceTime](self, "_stateChangeReferenceTime");
      v7 = v6;
      -[CAMMessagesExtensionViewController _setStateChangeReferenceTime:](self, "_setStateChangeReferenceTime:", CFAbsoluteTimeGetCurrent());
      if (v7 == 0.0)
      {
        v9 = 0.0;
      }
      else
      {
        -[CAMMessagesExtensionViewController _stateChangeReferenceTime](self, "_stateChangeReferenceTime");
        v9 = v8 - v7;
      }
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", self->__captureState));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", a3));
        v32 = 138543874;
        v33 = v12;
        v34 = 2114;
        v35 = v13;
        v36 = 2048;
        v37 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Changing state from %{public}@ to %{public}@ (took %.3f seconds)", (uint8_t *)&v32, 0x20u);

      }
      self->__captureState = a3;
      switch(a3)
      {
        case 0:
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _stopAndReleaseRegularCameraViewController](self, "_stopAndReleaseRegularCameraViewController"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _stopAndReleaseCFXCameraViewController](self, "_stopAndReleaseCFXCameraViewController"));
          objc_msgSend((id)objc_opt_class(self), "_removeChildViewController:", v14);
          objc_msgSend((id)objc_opt_class(self), "_removeChildViewController:", v15);
          goto LABEL_18;
        case 1:
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _stopAndReleaseCFXCameraViewController](self, "_stopAndReleaseCFXCameraViewController"));
          -[CAMMessagesExtensionViewController _createAndEmbedRegularCameraViewControllerIfNecessary](self, "_createAndEmbedRegularCameraViewControllerIfNecessary");
          -[CAMMessagesExtensionViewController _startRegularCamera](self, "_startRegularCamera");
          v23 = objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));
          goto LABEL_17;
        case 2:
          -[CAMMessagesExtensionViewController _stopRegularCamera](self, "_stopRegularCamera");
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));
          objc_msgSend(v16, "setMessagesTransitionState:animated:", 1, 1);
          goto LABEL_20;
        case 3:
          v17 = (void *)objc_opt_class(self);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _userPreferenceOverrides](self, "_userPreferenceOverrides"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_userPreferenceOverridesFromRegularCamera:baseUserPreferenceOverrides:", v18, v19));
          -[CAMMessagesExtensionViewController _setUserPreferenceOverrides:](self, "_setUserPreferenceOverrides:", v20);

          -[CAMMessagesExtensionViewController _createAndEmbedCFXCameraViewControllerIfNecessary](self, "_createAndEmbedCFXCameraViewControllerIfNecessary");
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _cfxCameraViewController](self, "_cfxCameraViewController"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
          objc_msgSend(v22, "setAlpha:", 0.0);

          -[CAMMessagesExtensionViewController _startCFXCamera](self, "_startCFXCamera");
          return;
        case 4:
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _stopAndReleaseRegularCameraViewController](self, "_stopAndReleaseRegularCameraViewController"));
          -[CAMMessagesExtensionViewController _createAndEmbedCFXCameraViewControllerIfNecessary](self, "_createAndEmbedCFXCameraViewControllerIfNecessary");
          -[CAMMessagesExtensionViewController _startCFXCamera](self, "_startCFXCamera");
          v23 = objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _cfxCameraViewController](self, "_cfxCameraViewController"));
LABEL_17:
          v15 = (void *)v23;
          -[CAMMessagesExtensionViewController _fadeInViewController:overOutgoingViewController:](self, "_fadeInViewController:overOutgoingViewController:", v23, v14);
LABEL_18:

          break;
        case 5:
          -[CAMMessagesExtensionViewController _stopCFXCamera](self, "_stopCFXCamera");
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _cfxCameraViewController](self, "_cfxCameraViewController"));
          objc_msgSend(v16, "setTransitionState:animated:", 2, 1);
LABEL_20:

          break;
        case 6:
          v24 = (void *)objc_opt_class(self);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _cfxCameraViewController](self, "_cfxCameraViewController"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _userPreferenceOverrides](self, "_userPreferenceOverrides"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_userPreferenceOverridesFromCFXCamera:baseUserPreferenceOverrides:", v25, v26));
          -[CAMMessagesExtensionViewController _setUserPreferenceOverrides:](self, "_setUserPreferenceOverrides:", v27);

          -[CAMMessagesExtensionViewController _createAndEmbedRegularCameraViewControllerIfNecessary](self, "_createAndEmbedRegularCameraViewControllerIfNecessary");
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "view"));
          objc_msgSend(v29, "setAlpha:", 0.0);

          -[CAMMessagesExtensionViewController _startRegularCamera](self, "_startRegularCamera");
          break;
        default:
          return;
      }
    }
    else
    {
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", captureState));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", a3));
        v32 = 138543618;
        v33 = v30;
        v34 = 2114;
        v35 = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Ignoring invalid transition from %{public}@ to %{public}@", (uint8_t *)&v32, 0x16u);

      }
    }
  }
}

- (BOOL)_isValidStateTransitionFrom:(int64_t)a3 to:(int64_t)a4
{
  int64_t v5;

  v5 = -[CAMMessagesExtensionViewController _nextStateForCaptureTransitionFromState:](self, "_nextStateForCaptureTransitionFromState:", a3);
  return !a4 || v5 == a4;
}

- (int64_t)_nextStateForCaptureTransitionFromState:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 0;
  else
    return qword_100012F38[a3];
}

- (BOOL)_transitionIfPossibleToNextCaptureState:(int64_t)a3
{
  int64_t v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v5 = -[CAMMessagesExtensionViewController _captureState](self, "_captureState");
  v6 = -[CAMMessagesExtensionViewController _isValidStateTransitionFrom:to:](self, "_isValidStateTransitionFrom:to:", v5, a3);
  if (v6)
  {
    if (-[CAMMessagesExtensionViewController _isReviewControllerPresented](self, "_isReviewControllerPresented"))
    {
      v7 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", v5));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", a3));
        v11 = 138543618;
        v12 = v8;
        v13 = 2114;
        v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Ignoring capture state transition from %{public}@ to %{public}@ because review controller is presented", (uint8_t *)&v11, 0x16u);

      }
      LOBYTE(v6) = 0;
    }
    else
    {
      -[CAMMessagesExtensionViewController _setCaptureState:](self, "_setCaptureState:", a3);
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (id)_descriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 0;
  else
    return off_100014838[a3];
}

- (void)_volumeButtonPressed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  int64_t v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  int v14;
  NSObject *v15;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _reviewController](self, "_reviewController"));

  if (v5)
  {
    if (!v3)
      return;
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring volume button press because review view controller is presented", (uint8_t *)&v14, 2u);
    }
    goto LABEL_19;
  }
  v7 = -[CAMMessagesExtensionViewController _captureState](self, "_captureState");
  if (-[CAMMessagesExtensionViewController _canCaptureFromMessagesCaptureState:](self, "_canCaptureFromMessagesCaptureState:", v7))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));
    v6 = v8;
    if (v8)
    {
      if (v3)
        -[NSObject handleVolumeButtonPressed](v8, "handleVolumeButtonPressed");
      else
        -[NSObject handleVolumeButtonReleased](v8, "handleVolumeButtonReleased");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _cfxCameraViewController](self, "_cfxCameraViewController"));

    if (!v13 || !v3)
      goto LABEL_19;
    v9 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    LOWORD(v14) = 0;
    v10 = "Ignoring volume button press for CFXCamera since no capture API available";
    v11 = v9;
    v12 = 2;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
LABEL_18:

    goto LABEL_19;
  }
  if (!v3)
    return;
  v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", v7));
    v14 = 138543362;
    v15 = v9;
    v10 = "Ignoring volume button press during state %{public}@";
    v11 = v6;
    v12 = 12;
    goto LABEL_17;
  }
LABEL_19:

}

- (BOOL)_canCaptureFromMessagesCaptureState:(int64_t)a3
{
  return a3 == 1 || a3 == 4;
}

- (BOOL)_isReviewControllerPresented
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _reviewController](self, "_reviewController"));
  v3 = v2 != 0;

  return v3;
}

- (void)_presentReviewControllerForAsset:(id)a3 source:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  CAMSignpostWithIDAndArgs(10033, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v8 = objc_alloc_init((Class)CAMAnalyticsMessagesCaptureEvent);
  objc_msgSend(v8, "populateFromReviewAsset:withSourceType:", v6, a4);
  objc_msgSend(v8, "publish");
  -[CAMMessagesExtensionViewController _stopActiveCameraSession](self, "_stopActiveCameraSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _reviewViewControllerForAsset:source:](self, "_reviewViewControllerForAsset:source:", v6, a4));
  objc_msgSend(v7, "setTransitioningDelegate:", self);
  objc_msgSend(v7, "setModalPresentationStyle:", 0);
  -[CAMMessagesExtensionViewController _setCurrentReviewAssset:](self, "_setCurrentReviewAssset:", v6);

  -[CAMMessagesExtensionViewController _setReviewController:](self, "_setReviewController:", v7);
  -[CAMMessagesExtensionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, &stru_100014700);
  CAMSignpostWithIDAndArgs(10034, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);

}

- (void)_dismissReviewController
{
  CAMSignpostWithIDAndArgs(10035, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  -[CAMMessagesExtensionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[CAMMessagesExtensionViewController _setCurrentReviewAssset:](self, "_setCurrentReviewAssset:", 0);
  -[CAMMessagesExtensionViewController _setReviewController:](self, "_setReviewController:", 0);
  CAMSignpostWithIDAndArgs(10036, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

- (void)_updateLayoutParametersForReviewBarsModel:(id)a3 viewBounds:(CGRect)a4 orientation:(int64_t)a5 forceLayout:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[11];
  BOOL v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController view](self, "view"));
  v15 = CAMLayoutStyleForView();

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000697C;
  v16[3] = &unk_100014748;
  *(CGFloat *)&v16[5] = x;
  *(CGFloat *)&v16[6] = y;
  *(CGFloat *)&v16[7] = width;
  *(CGFloat *)&v16[8] = height;
  v16[4] = self;
  v16[9] = v15;
  v16[10] = a5;
  v17 = a6;
  objc_msgSend(v13, "performChanges:", v16);

}

- (id)_reviewViewControllerForAsset:(id)a3 source:(unint64_t)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;

  v5 = a3;
  v6 = objc_alloc_init((Class)PUReviewDataSource);
  objc_msgSend(v6, "insertAsset:", v5);
  v19 = objc_msgSend(objc_alloc((Class)PUReviewAssetsDataSourceManager), "initWithReviewDataSource:", v6);
  v7 = objc_alloc_init((Class)PUReviewScreenBarsModel);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

  v10 = objc_msgSend(v9, "_windowInterfaceOrientation");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController view](self, "view"));
  objc_msgSend(v11, "bounds");
  -[CAMMessagesExtensionViewController _updateLayoutParametersForReviewBarsModel:viewBounds:orientation:forceLayout:](self, "_updateLayoutParametersForReviewBarsModel:viewBounds:orientation:forceLayout:", v7, v10, 0);

  v12 = objc_alloc((Class)PUAssetExplorerReviewScreenViewController);
  v13 = objc_alloc_init((Class)PUReviewAssetsMediaProvider);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v15));
  v17 = objc_msgSend(v12, "initWithDataSourceManager:mediaProvider:reviewAssetProvider:initialIndexPath:initialSelectedAssetUUIDs:initialDisabledLivePhotoAssetUUIDs:sourceType:reviewBarsModel:options:", v19, v13, 0, v14, v16, 0, a4, v7, 1);

  objc_msgSend(v17, "setDelegate:", self);
  return v17;
}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  unsigned int v15;
  void *v16;
  char v17;
  unsigned int v18;
  char v19;
  BOOL v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = 0;
  if (a4 <= 8)
  {
    if (((1 << a4) & 0x157) != 0)
    {
      v13 = 1;
    }
    else if (a4 == 5)
    {
      v13 = objc_msgSend(v11, "mediaType") == (id)1;
    }
    else if (a4 == 7)
    {
      v15 = objc_msgSend(v11, "mediaSubtypes");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
      v17 = CEKIsViewInMultitask();

      v18 = -[CAMMessagesExtensionViewController _shouldShowFunEffects](self, "_shouldShowFunEffects");
      v19 = v17 ^ 1;
      if ((v15 & 1) != 0)
        v19 = 0;
      if ((*(_QWORD *)&v15 & 0x20000) != 0)
        v20 = 0;
      else
        v20 = v19;
      if (v18)
        v13 = v20;
      else
        v13 = 0;
    }
  }

  return v13;
}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 shouldEnableActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  id v9;
  id v10;
  id v11;
  unsigned int v12;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  LOBYTE(v12) = 0;
  if (a4 <= 8)
  {
    if (((1 << a4) & 0x172) == 0)
    {
      if (((1 << a4) & 5) != 0)
      {
        LOBYTE(v12) = 1;
        goto LABEL_6;
      }
      if (a4 != 7)
        goto LABEL_6;
    }
    v12 = objc_msgSend(v10, "isTemporaryPlaceholder") ^ 1;
  }
LABEL_6:

  return v12;
}

- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  CAMMessagesExtensionViewController *v25;

  v11 = a3;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a7, "allValues"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  if (v14)
  {
    v15 = (void *)v14;

LABEL_4:
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    v17 = objc_msgSend(v12, "containsObject:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window"));

    objc_msgSend(v19, "setUserInteractionEnabled:", 0);
    -[CAMMessagesExtensionViewController _saveAsset:](self, "_saveAsset:", v15);
    v20 = objc_msgSend(v11, "sourceType");
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100006FB0;
    v23[3] = &unk_100014770;
    v24 = v19;
    v25 = self;
    v21 = v19;
    -[CAMMessagesExtensionViewController _transportAsset:forCompletionAction:sourceType:suppressLivePhoto:completion:](self, "_transportAsset:forCompletionAction:sourceType:suppressLivePhoto:completion:", v15, a4, v20, v17, v23);

    goto LABEL_5;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _currentReviewAssset](self, "_currentReviewAssset"));

  if (v15)
    goto LABEL_4;
  v22 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    sub_10000AD3C();

  -[CAMMessagesExtensionViewController dismiss](self, "dismiss");
LABEL_5:

}

- (void)assetExplorerReviewScreenViewControllerDidPressCancel:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _currentReviewAssset](self, "_currentReviewAssset", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007138;
  v9[3] = &unk_1000146E0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "performExpiringActivityWithReason:usingBlock:", CFSTR("Marking files purgeable"), v9);

  v7 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dismissing from assetExplorerReviewScreenViewControllerDidPressCancel", v8, 2u);
  }

  -[CAMMessagesExtensionViewController dismiss](self, "dismiss");
}

- (void)assetExplorerReviewScreenViewControllerDidPressRetake:(id)a3
{
  void *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _currentReviewAssset](self, "_currentReviewAssset", a3));
  global_queue = dispatch_get_global_queue(17, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007254;
  block[3] = &unk_100014668;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

  -[CAMMessagesExtensionViewController _dismissReviewController](self, "_dismissReviewController");
  -[CAMMessagesExtensionViewController _startActiveCameraSession](self, "_startActiveCameraSession");

}

- (void)assetExplorerReviewScreenViewController:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  -[CAMMessagesExtensionViewController viewWillTransitionToSize:withTransitionCoordinator:](self, "viewWillTransitionToSize:withTransitionCoordinator:", a5, a4.width, a4.height);
}

- (void)_transportAsset:(id)a3 forCompletionAction:(unint64_t)a4 sourceType:(unint64_t)a5 suppressLivePhoto:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CAMAssetTransportController *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _BOOL8 v28;
  id v29;
  _QWORD *v30;
  void *v31;
  os_log_t v32;
  _Unwind_Exception *v33;
  uint8_t v34;
  uint64_t v35;
  void **v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  v8 = a6;
  v12 = a3;
  v13 = a7;
  v14 = 5;
  if (a5 == 4)
    v14 = 2;
  if (a5 == 2)
    v15 = 1;
  else
    v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController activeConversation](self, "activeConversation"));
  if (v16)
  {
    v17 = [CAMAssetTransportController alloc];
    v41 = 0;
    v42 = &v41;
    v43 = 0x2050000000;
    v18 = (void *)qword_10001A598;
    v44 = qword_10001A598;
    if (!qword_10001A598)
    {
      v36 = _NSConcreteStackBlock;
      v37 = 3221225472;
      v38 = (uint64_t)sub_100008D14;
      v39 = &unk_1000147F8;
      v40 = &v41;
      sub_100008D14((uint64_t)&v36);
      v18 = (void *)v42[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v41, 8);
    v41 = 0;
    v42 = &v41;
    v43 = 0x2050000000;
    v27 = (void *)qword_10001A5A0;
    v44 = qword_10001A5A0;
    if (!qword_10001A5A0)
    {
      v36 = _NSConcreteStackBlock;
      v37 = 3221225472;
      v38 = (uint64_t)sub_100008EA8;
      v39 = &unk_1000147F8;
      v40 = &v41;
      sub_100008EA8((uint64_t)&v36, v20, v21, v22, v23, v24, v25, v26, v34);
      v27 = (void *)v42[3];
    }
    v35 = v15;
    v28 = v8;
    v29 = objc_retainAutorelease(v27);
    _Block_object_dispose(&v41, 8);
    v36 = 0;
    v37 = (uint64_t)&v36;
    v38 = 0x2020000000;
    v30 = (_QWORD *)qword_10001A5A8;
    v39 = (void *)qword_10001A5A8;
    if (!qword_10001A5A8)
    {
      v31 = (void *)sub_100008D68();
      v30 = dlsym(v31, "kUTTypeAssetPreviewImage");
      *(_QWORD *)(v37 + 24) = v30;
      qword_10001A5A8 = (uint64_t)v30;
    }
    _Block_object_dispose(&v36, 8);
    if (!v30)
    {
      v33 = (_Unwind_Exception *)sub_10000ADC0();
      _Block_object_dispose(&v41, 8);
      _Unwind_Resume(v33);
    }
    v32 = -[CAMAssetTransportController initWithConversation:packageGeneratorClass:statisticsManagerClass:previewImageKey:](v17, "initWithConversation:packageGeneratorClass:statisticsManagerClass:previewImageKey:", v16, v19, v29, *v30);
    if (a4 == 1)
    {
      CAMSignpostWithIDAndArgs(10010, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
      -[NSObject sendAsset:suppressLivePhoto:mediaOrigin:completion:](v32, "sendAsset:suppressLivePhoto:mediaOrigin:completion:", v12, v28, v35, v13);
    }
    else if (!a4)
    {
      CAMSignpostWithIDAndArgs(10012, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
      -[NSObject stageAsset:suppressLivePhoto:mediaOrigin:completion:](v32, "stageAsset:suppressLivePhoto:mediaOrigin:completion:", v12, v28, v35, v13);
    }
  }
  else
  {
    v32 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_10000AD94();
  }

}

- (void)_saveAsset:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007610;
  v6[3] = &unk_100014668;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performChanges:completionHandler:", v6, &stru_1000147B0);

}

- (BOOL)_shouldDisableCameraForMultitasking
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  double v10;
  double width;
  double v12;
  double height;
  unsigned int v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities"));
  v4 = objc_msgSend(v3, "isSplitScreenSupported");

  if (-[CAMMessagesExtensionViewController isViewLoaded](self, "isViewLoaded"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController view](self, "view"));
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
  if (v6)
  {
    objc_msgSend(v6, "bounds");
    width = v10;
    height = v12;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  if (v7)
    v14 = v4;
  else
    v14 = 0;
  if (v14 == 1 && (v15 = width, v16 = height, !CGRectIsEmpty(*(CGRect *)&x)))
  {
    objc_msgSend(v7, "_referenceBounds");
    v19 = v18;
    v21 = v20;
    -[CAMMessagesExtensionViewController _portraitOrientedSizeForSize:](self, "_portraitOrientedSizeForSize:", width, height);
    v17 = v23 != v21 || v22 != v19;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (CGSize)_portraitOrientedSizeForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
  objc_msgSend(v7, "_referenceBounds");
  v9 = v8;
  v11 = v10;

  v12 = width < height;
  if (v9 < v11)
    v12 = width > height;
  if (v12)
    v13 = width;
  else
    v13 = height;
  if (v12)
    v14 = height;
  else
    v14 = width;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)cameraViewController:(id)a3 didCapturePhoto:(id)a4 withProperties:(id)a5 error:(id)a6
{
  NSObject *v7;
  id v8;

  if (!a4 || a6)
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000ADE0();

  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[CAMCameraReviewAdapter reviewAssetForPhoto:withProperties:](CAMCameraReviewAdapter, "reviewAssetForPhoto:withProperties:", a4, a5));
    -[CAMMessagesExtensionViewController _presentReviewControllerForAsset:source:](self, "_presentReviewControllerForAsset:source:", v8, 2);

  }
}

- (void)cameraViewController:(id)a3 didCaptureLivePhoto:(id)a4 withProperties:(id)a5 error:(id)a6
{
  NSObject *v7;
  id v8;

  if (!a4 || a6)
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000AE0C();

  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[CAMCameraReviewAdapter reviewAssetForLivePhoto:withProperties:](CAMCameraReviewAdapter, "reviewAssetForLivePhoto:withProperties:", a4, a5));
    -[CAMMessagesExtensionViewController _presentReviewControllerForAsset:source:](self, "_presentReviewControllerForAsset:source:", v8, 2);

  }
}

- (void)cameraViewController:(id)a3 didCaptureAVAsset:(id)a4 andAudioMix:(id)a5 withProperties:(id)a6 error:(id)a7
{
  NSObject *v8;
  id v9;

  if (!a4 || a7)
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000AE38();

  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[CAMCameraReviewAdapter reviewAssetForAVAsset:audioMix:properties:](CAMCameraReviewAdapter, "reviewAssetForAVAsset:audioMix:properties:", a4, a5, a6));
    -[CAMMessagesExtensionViewController _presentReviewControllerForAsset:source:](self, "_presentReviewControllerForAsset:source:", v9, 2);

  }
}

- (void)cameraViewControllerDidRequestPhotosExtension
{
  if ((objc_opt_respondsToSelector(self, "_dismissAndPresentPhotosApp") & 1) != 0)
    -[CAMMessagesExtensionViewController _dismissAndPresentPhotosApp](self, "_dismissAndPresentPhotosApp");
}

- (void)cameraViewControllerDidRequestDismissal
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing for Done button pressed", v4, 2u);
  }

  -[CAMMessagesExtensionViewController dismiss](self, "dismiss");
}

- (void)cameraViewControllerCreativeCameraButtonWasPressed
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _userPreferenceOverrides](self, "_userPreferenceOverrides"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_userPreferenceOverridesFromRegularCamera:baseUserPreferenceOverrides:", v4, v5));

  -[CAMMessagesExtensionViewController _preheatCFXCameraFromUserPreferenceOverrides:](self, "_preheatCFXCameraFromUserPreferenceOverrides:", v6);
}

- (void)cameraViewControllerCreativeCameraButtonWasReleased
{
  -[CAMMessagesExtensionViewController _switchCameraViewControllers](self, "_switchCameraViewControllers");
}

- (void)_switchCameraViewControllers
{
  int64_t v3;
  CAMMessagesExtensionViewController *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = -[CAMMessagesExtensionViewController _captureState](self, "_captureState");
  if (v3 == 1)
  {
    v4 = self;
    v5 = 2;
LABEL_5:
    if (-[CAMMessagesExtensionViewController _transitionIfPossibleToNextCaptureState:](v4, "_transitionIfPossibleToNextCaptureState:", v5))
    {
      return;
    }
    goto LABEL_6;
  }
  if (v3 == 4)
  {
    v4 = self;
    v5 = 5;
    goto LABEL_5;
  }
LABEL_6:
  v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", -[CAMMessagesExtensionViewController _captureState](self, "_captureState")));
    v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cannot switch cameras from state %{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)cameraViewControllerDidSuspendCameraSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));

  if (v5 == v4)
    -[CAMMessagesExtensionViewController _regularCameraDidStopCaptureSession](self, "_regularCameraDidStopCaptureSession");
}

- (void)_regularCameraDidStopCaptureSession
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));

  CAMSignpostWithIDAndArgs(10005, 0xEEEEB0B5B2B2EEEELL, v3, 0, 0, 0);
  if (!-[CAMMessagesExtensionViewController _transitionIfPossibleToNextCaptureState:](self, "_transitionIfPossibleToNextCaptureState:", 3))
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", -[CAMMessagesExtensionViewController _captureState](self, "_captureState")));
      v6 = 138543362;
      v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Regular Camera stopped while in state %{public}@, not taking action", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (void)cameraViewControllerDidResumeCameraSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));

  if (v5 == v4)
    -[CAMMessagesExtensionViewController _regularCameraDidStartCaptureSession](self, "_regularCameraDidStartCaptureSession");
}

- (void)_regularCameraDidStartCaptureSession
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));

  CAMSignpostWithIDAndArgs(10003, 0xEEEEB0B5B2B2EEEELL, v3, 0, 0, 0);
  if (!-[CAMMessagesExtensionViewController _transitionIfPossibleToNextCaptureState:](self, "_transitionIfPossibleToNextCaptureState:", 1))
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", -[CAMMessagesExtensionViewController _captureState](self, "_captureState")));
      v6 = 138543362;
      v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Regular Camera started while in state %{public}@, not taking action", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (void)cameraViewControllerRequestedDismissal:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing from cameraViewControllerRequestedDismissal (CAMCameraViewController)", v5, 2u);
  }

  -[CAMMessagesExtensionViewController dismiss](self, "dismiss");
}

- (void)cameraViewControllerDidStopCaptureSession:(id)a3
{
  -[CAMMessagesExtensionViewController _cfxCameraDidStopCaptureSession](self, "_cfxCameraDidStopCaptureSession", a3);
}

- (void)_cfxCameraDidStopCaptureSession
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _cfxCameraViewController](self, "_cfxCameraViewController"));

  CAMSignpostWithIDAndArgs(10009, 0xEEEEB0B5B2B2EEEELL, v3, 0, 0, 0);
  if (!-[CAMMessagesExtensionViewController _transitionIfPossibleToNextCaptureState:](self, "_transitionIfPossibleToNextCaptureState:", 6))
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", -[CAMMessagesExtensionViewController _captureState](self, "_captureState")));
      v6 = 138543362;
      v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CFXCamera stopped while in state %{public}@, not taking action", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (void)cameraViewControllerDidStartCaptureSession:(id)a3
{
  -[CAMMessagesExtensionViewController _cfxCameraDidStartCaptureSession](self, "_cfxCameraDidStartCaptureSession", a3);
}

- (void)_cfxCameraDidStartCaptureSession
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _cfxCameraViewController](self, "_cfxCameraViewController"));

  CAMSignpostWithIDAndArgs(10007, 0xEEEEB0B5B2B2EEEELL, v3, 0, 0, 0);
  if (!-[CAMMessagesExtensionViewController _transitionIfPossibleToNextCaptureState:](self, "_transitionIfPossibleToNextCaptureState:", 4))
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _descriptionForState:](self, "_descriptionForState:", -[CAMMessagesExtensionViewController _captureState](self, "_captureState")));
      v6 = 138543362;
      v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CFXCamera started while in state %{public}@, not taking action", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (void)cameraViewController:(id)a3 didCaptureMediaItem:(id)a4
{
  void *v5;
  NSObject *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PUReviewAsset reviewAssetFromCFXMediaItem:](PUReviewAsset, "reviewAssetFromCFXMediaItem:", a4));
  if (v5)
  {
    -[CAMMessagesExtensionViewController _presentReviewControllerForAsset:source:](self, "_presentReviewControllerForAsset:source:", v5, 4);
  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000AE64();

  }
}

- (void)cameraViewControllerDoneButtonWasTapped:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing from cameraViewControllerDoneButtonWasTapped (CFXCameraViewController)", v5, 2u);
  }

  -[CAMMessagesExtensionViewController dismiss](self, "dismiss");
}

- (void)cameraViewControllerEffectsButtonWasTapped:(id)a3
{
  -[CAMMessagesExtensionViewController _switchCameraViewControllers](self, "_switchCameraViewControllers", a3);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  CAMReviewTransitionAnimator *v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = objc_alloc_init(CAMReviewTransitionAnimator);
  -[CAMReviewTransitionAnimator setTransitionDirection:](v6, "setTransitionDirection:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));
  -[CAMReviewTransitionAnimator setCameraViewController:](v6, "setCameraViewController:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _reviewController](self, "_reviewController"));
  -[CAMReviewTransitionAnimator setReviewViewController:](v6, "setReviewViewController:", v8);

  -[CAMReviewTransitionAnimator setDelegate:](v6, "setDelegate:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _cfxCameraViewController](self, "_cfxCameraViewController"));
  -[CAMReviewTransitionAnimator setFunCamViewController:](v6, "setFunCamViewController:", v9);

  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  CAMReviewTransitionAnimator *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(CAMReviewTransitionAnimator);
  -[CAMReviewTransitionAnimator setTransitionDirection:](v4, "setTransitionDirection:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));
  -[CAMReviewTransitionAnimator setCameraViewController:](v4, "setCameraViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _reviewController](self, "_reviewController"));
  -[CAMReviewTransitionAnimator setReviewViewController:](v4, "setReviewViewController:", v6);

  -[CAMReviewTransitionAnimator setDelegate:](v4, "setDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _cfxCameraViewController](self, "_cfxCameraViewController"));
  -[CAMReviewTransitionAnimator setFunCamViewController:](v4, "setFunCamViewController:", v7);

  return v4;
}

- (unint64_t)availableControlsCountForReviewTransition:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _currentReviewAssset](self, "_currentReviewAssset", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _reviewController](self, "_reviewController"));
  LODWORD(v6) = -[CAMMessagesExtensionViewController assetExplorerReviewScreenViewController:canPerformActionType:onAsset:inAssetCollection:](self, "assetExplorerReviewScreenViewController:canPerformActionType:onAsset:inAssetCollection:", v5, 6, v4, 0);
  v7 = -[CAMMessagesExtensionViewController assetExplorerReviewScreenViewController:canPerformActionType:onAsset:inAssetCollection:](self, "assetExplorerReviewScreenViewController:canPerformActionType:onAsset:inAssetCollection:", v5, 5, v4, 0);
  v8 = 1;
  if ((_DWORD)v6)
    v8 = 2;
  if (v7)
    v6 = v8;
  else
    v6 = v6;
  v9 = v6
     + -[CAMMessagesExtensionViewController assetExplorerReviewScreenViewController:canPerformActionType:onAsset:inAssetCollection:](self, "assetExplorerReviewScreenViewController:canPerformActionType:onAsset:inAssetCollection:", v5, 7, v4, 0);

  return v9;
}

+ (int64_t)_CAMTorchModeForAVFlashMode:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)_AVFlashModeForCAMTorchMode:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (void)_handleHostDidEnterBackgroundNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  unsigned int v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  uint8_t *v13;
  __int16 v14;
  __int16 v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _reviewController](self, "_reviewController", a3));

  if (v4)
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received NSExtensionHostDidEnterBackgroundNotification but ignoring since we are showing review screen.", buf, 2u);
    }
    goto LABEL_21;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _regularCameraViewController](self, "_regularCameraViewController"));
  v5 = v6;
  if (v6)
  {
    if ((-[NSObject isCapturingPhoto](v6, "isCapturingPhoto") & 1) != 0
      || (-[NSObject isCapturingLivePhoto](v5, "isCapturingLivePhoto") & 1) != 0
      || (-[NSObject isRecording](v5, "isRecording") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v7 = -[NSObject isPreventingAdditionalCaptures](v5, "isPreventingAdditionalCaptures");
    }
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAMMessagesExtensionViewController _cfxCameraViewController](self, "_cfxCameraViewController"));

  if (!v7)
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        v15 = 0;
        v12 = "Received NSExtensionHostDidEnterBackgroundNotification while showing CFXCamera (cannot verify if recording"
              "), dismissing CameraMessagesApp extension.";
        v13 = (uint8_t *)&v15;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      }
    }
    else if (v11)
    {
      v14 = 0;
      v12 = "Received NSExtensionHostDidEnterBackgroundNotification, dismissing CameraMessagesApp extension.";
      v13 = (uint8_t *)&v14;
      goto LABEL_19;
    }

    -[CAMMessagesExtensionViewController dismiss](self, "dismiss");
    goto LABEL_21;
  }
  v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received NSExtensionHostDidEnterBackgroundNotification but ignoring since we are capturing or awaiting review.", v16, 2u);
  }

LABEL_21:
}

- (int64_t)_captureState
{
  return self->__captureState;
}

- (CAMCameraViewController)_regularCameraViewController
{
  return self->__regularCameraViewController;
}

- (void)_setCameraViewController:(id)a3
{
  objc_storeStrong((id *)&self->__regularCameraViewController, a3);
}

- (CAMUserPreferenceOverrides)_userPreferenceOverrides
{
  return self->__userPreferenceOverrides;
}

- (void)_setUserPreferenceOverrides:(id)a3
{
  objc_storeStrong((id *)&self->__userPreferenceOverrides, a3);
}

- (CFXCameraViewController)_cfxCameraViewController
{
  return self->__cfxCameraViewController;
}

- (void)_setCfxCameraViewController:(id)a3
{
  objc_storeStrong((id *)&self->__cfxCameraViewController, a3);
}

- (PUReviewAsset)_currentReviewAssset
{
  return self->__currentReviewAssset;
}

- (void)_setCurrentReviewAssset:(id)a3
{
  objc_storeStrong((id *)&self->__currentReviewAssset, a3);
}

- (PUAssetExplorerReviewScreenViewController)_reviewController
{
  return self->__reviewController;
}

- (void)_setReviewController:(id)a3
{
  objc_storeStrong((id *)&self->__reviewController, a3);
}

- (BOOL)_didReceiveViewWillAppear
{
  return self->__didReceiveViewWillAppear;
}

- (void)_setDidReceiveViewWillAppear:(BOOL)a3
{
  self->__didReceiveViewWillAppear = a3;
}

- (BOOL)_shouldShowFunEffects
{
  return self->__shouldShowFunEffects;
}

- (double)_logReferenceTime
{
  return self->__logReferenceTime;
}

- (void)_setLogReferenceTime:(double)a3
{
  self->__logReferenceTime = a3;
}

- (NSString)_logReferenceDescription
{
  return self->__logReferenceDescription;
}

- (void)_setLogReferenceDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (double)_stateChangeReferenceTime
{
  return self->__stateChangeReferenceTime;
}

- (void)_setStateChangeReferenceTime:(double)a3
{
  self->__stateChangeReferenceTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__logReferenceDescription, 0);
  objc_storeStrong((id *)&self->__reviewController, 0);
  objc_storeStrong((id *)&self->__currentReviewAssset, 0);
  objc_storeStrong((id *)&self->__cfxCameraViewController, 0);
  objc_storeStrong((id *)&self->__userPreferenceOverrides, 0);
  objc_storeStrong((id *)&self->__regularCameraViewController, 0);
}

@end
