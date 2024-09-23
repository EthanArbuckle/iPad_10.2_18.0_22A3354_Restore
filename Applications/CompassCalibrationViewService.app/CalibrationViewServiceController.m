@implementation CalibrationViewServiceController

+ (void)load
{
  int out_token;

  out_token = 0;
  notify_register_dispatch("com.apple.DismissCalibration", &out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_100004130);
}

+ (void)dismissCalibrationAlert
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100008AE0, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "dismiss");

  v3 = (void *)qword_100008AE0;
  qword_100008AE0 = 0;

}

- (CalibrationViewServiceController)init
{
  CalibrationViewServiceController *v2;
  CalibrationViewServiceController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CalibrationViewServiceController;
  v2 = -[CalibrationViewServiceController init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(v2), "dismissCalibrationAlert");
    objc_storeStrong((id *)&qword_100008AE0, v3);
  }
  return v3;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CalibrationViewServiceController;
  -[CalibrationViewServiceController viewDidLoad](&v3, "viewDidLoad");
  -[CalibrationViewServiceController reset](self, "reset");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CalibrationViewServiceController;
  -[CalibrationViewServiceController viewWillAppear:](&v13, "viewWillAppear:", a3);
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalibrationViewServiceController motionManager](self, "motionManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100002270;
  v10 = &unk_100004158;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:", 1, v5, &v7);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalibrationViewServiceController locationManager](self, "locationManager", v7, v8, v9, v10));
  objc_msgSend(v6, "startUpdatingHeading");

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "finishedCalibrating", 0, 0, 15.0));
  -[CalibrationViewServiceController setMaximumTimer:](self, "setMaximumTimer:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "minimumTimeElapsed", 0, 0, 5.0));
  -[CalibrationViewServiceController setMinimumTimer:](self, "setMinimumTimer:", v6);

  self->_minTimeElapsed = 0;
  self->_maxTimeElapsed = 0;
  self->_calibrated = 0;
  self->_hasPresented = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CalibrationViewServiceController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
  self->_finalOrientation = (int64_t)objc_msgSend(v9, "interfaceOrientation");

  -[CalibrationViewServiceController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  -[CalibrationViewServiceController addChildViewController:](self, "addChildViewController:", self->_calibrationViewController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CalibrationViewServiceController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CalibrationViewController view](self->_calibrationViewController, "view"));
  objc_msgSend(v10, "addSubview:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CalibrationViewServiceController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CATransition animation](CATransition, "animation"));
  objc_msgSend(v13, "addAnimation:forKey:", v14, CFSTR("fade"));

  -[CalibrationViewController didMoveToParentViewController:](self->_calibrationViewController, "didMoveToParentViewController:", self);
  v15.receiver = self;
  v15.super_class = (Class)CalibrationViewServiceController;
  -[CalibrationViewServiceController viewDidAppear:](&v15, "viewDidAppear:", v3);
}

- (void)reset
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CalibrationViewServiceController calibrationViewController](self, "calibrationViewController"));
  objc_msgSend(v2, "reset");

}

- (CalibrationViewController)calibrationViewController
{
  CalibrationViewController *calibrationViewController;
  CalibrationViewController *v4;
  CalibrationViewController *v5;

  calibrationViewController = self->_calibrationViewController;
  if (!calibrationViewController)
  {
    v4 = (CalibrationViewController *)objc_alloc_init((Class)CalibrationViewController);
    v5 = self->_calibrationViewController;
    self->_calibrationViewController = v4;

    calibrationViewController = self->_calibrationViewController;
  }
  return calibrationViewController;
}

- (CMMotionManager)motionManager
{
  CMMotionManager *motionManager;
  CMMotionManager *v4;
  CMMotionManager *v5;

  motionManager = self->_motionManager;
  if (!motionManager)
  {
    v4 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
    v5 = self->_motionManager;
    self->_motionManager = v4;

    -[CMMotionManager setDeviceMotionUpdateInterval:](self->_motionManager, "setDeviceMotionUpdateInterval:", 0.0500000007);
    motionManager = self->_motionManager;
  }
  return motionManager;
}

- (CLLocationManager)locationManager
{
  CLLocationManager *locationManager;
  CLLocationManager *v4;
  CLLocationManager *v5;

  locationManager = self->_locationManager;
  if (!locationManager)
  {
    v4 = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/CompassCalibration.bundle"), self, &_dispatch_main_q);
    v5 = self->_locationManager;
    self->_locationManager = v4;

    -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
    locationManager = self->_locationManager;
  }
  return locationManager;
}

- (void)minimumTimeElapsed
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalibrationViewServiceController minimumTimer](self, "minimumTimer"));
  objc_msgSend(v3, "invalidate");

  -[CalibrationViewServiceController setMinimumTimer:](self, "setMinimumTimer:", 0);
  self->_minTimeElapsed = 1;
  -[CalibrationViewServiceController tryToDismissCalibration](self, "tryToDismissCalibration");
}

- (void)maximumTimeElapsed
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalibrationViewServiceController maximumTimer](self, "maximumTimer"));
  objc_msgSend(v3, "invalidate");

  -[CalibrationViewServiceController setMaximumTimer:](self, "setMaximumTimer:", 0);
  self->_maxTimeElapsed = 1;
  -[CalibrationViewServiceController tryToDismissCalibration](self, "tryToDismissCalibration");
}

- (void)finishedCalibrating
{
  self->_calibrated = 1;
  -[CalibrationViewServiceController tryToDismissCalibration](self, "tryToDismissCalibration");
}

- (void)tryToDismissCalibration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_minTimeElapsed && self->_calibrated || self->_maxTimeElapsed)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalibrationViewServiceController motionManager](self, "motionManager"));
    objc_msgSend(v3, "stopDeviceMotionUpdates");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalibrationViewServiceController locationManager](self, "locationManager"));
    objc_msgSend(v4, "stopUpdatingHeading");

    objc_msgSend((id)objc_opt_class(self), "dismissCalibrationAlert");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalibrationViewServiceController maximumTimer](self, "maximumTimer"));
    objc_msgSend(v5, "invalidate");

    -[CalibrationViewServiceController setMaximumTimer:](self, "setMaximumTimer:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalibrationViewServiceController minimumTimer](self, "minimumTimer"));
    objc_msgSend(v6, "invalidate");

    -[CalibrationViewServiceController setMinimumTimer:](self, "setMinimumTimer:", 0);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_maximumTimer, "invalidate");
  -[NSTimer invalidate](self->_minimumTimer, "invalidate");
  -[CMMotionManager stopDeviceMotionUpdates](self->_motionManager, "stopDeviceMotionUpdates");
  -[CLLocationManager stopUpdatingHeading](self->_locationManager, "stopUpdatingHeading");
  v3.receiver = self;
  v3.super_class = (Class)CalibrationViewServiceController;
  -[CalibrationViewServiceController dealloc](&v3, "dealloc");
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t v2;

  if (!self->_hasPresented)
    return 30;
  v2 = self->_finalOrientation - 2;
  if (v2 > 2)
    return 2;
  else
    return qword_100003060[v2];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (NSTimer)maximumTimer
{
  return self->_maximumTimer;
}

- (void)setMaximumTimer:(id)a3
{
  objc_storeStrong((id *)&self->_maximumTimer, a3);
}

- (NSTimer)minimumTimer
{
  return self->_minimumTimer;
}

- (void)setMinimumTimer:(id)a3
{
  objc_storeStrong((id *)&self->_minimumTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumTimer, 0);
  objc_storeStrong((id *)&self->_maximumTimer, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_calibrationViewController, 0);
}

@end
