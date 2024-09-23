@implementation CAMMotionController

- (CAMMotionController)init
{
  CAMMotionController *v2;
  BKSAccelerometer *v3;
  BKSAccelerometer *accelerometer;
  void *v5;
  CAMMotionController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMMotionController;
  v2 = -[CAMMotionController init](&v8, sel_init);
  if (v2)
  {
    v3 = (BKSAccelerometer *)objc_alloc_init(MEMORY[0x1E0D00C40]);
    accelerometer = v2->__accelerometer;
    v2->__accelerometer = v3;

    -[BKSAccelerometer setDelegate:](v2->__accelerometer, "setDelegate:", v2);
    -[BKSAccelerometer setOrientationEventsEnabled:](v2->__accelerometer, "setOrientationEventsEnabled:", 1);
    -[CAMMotionController _updateInitialOrientation](v2, "_updateInitialOrientation");
    +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__handleApplicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__handleApplicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);
    v6 = v2;

  }
  return v2;
}

- (id)_debugStringForDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)a3 < 7)
    return off_1EA3299E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected:%ld"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)captureOrientation
{
  int64_t v3;

  v3 = -[CAMMotionController _cachedCaptureOrientation](self, "_cachedCaptureOrientation");
  if (-[CAMMotionController forceLandscapeOrientation](self, "forceLandscapeOrientation"))
    return -[CAMMotionController _orientationIfForcedToLandscape](self, "_orientationIfForcedToLandscape");
  if ((unint64_t)(v3 - 1) >= 4)
    return -[CAMMotionController _fallbackCaptureOrientation](self, "_fallbackCaptureOrientation");
  return v3;
}

- (int64_t)_cachedCaptureOrientation
{
  return self->__cachedCaptureOrientation;
}

- (int64_t)dominantPhysicalButton
{
  return self->_dominantPhysicalButton;
}

- (void)endUpdatingActiveLevelViewModel
{
  void *v3;
  void *v4;
  id v5;

  -[CAMMotionController activeLevelViewModel](self, "activeLevelViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "unregisterChangeObserver:context:", self, 0);
    -[CAMMotionController activeLevelViewModel](self, "activeLevelViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reset");

    -[CAMMotionController _setActiveLevelViewModel:](self, "_setActiveLevelViewModel:", 0);
    -[CAMMotionController _updateAttitudeAlignmentMotionManager](self, "_updateAttitudeAlignmentMotionManager");
    v3 = v5;
  }

}

- (CAMLevelViewModel)activeLevelViewModel
{
  return self->_activeLevelViewModel;
}

- (void)beginGeneratingDominantPhysicalButtonNotifications
{
  -[CAMMotionController _setNumberOfDominantPhysicalButtonObservers:](self, "_setNumberOfDominantPhysicalButtonObservers:", -[CAMMotionController _numberOfDominantPhysicalButtonObservers](self, "_numberOfDominantPhysicalButtonObservers")+ 1);
  -[CAMMotionController _updatePhysicalButtonObservation](self, "_updatePhysicalButtonObservation");
}

- (int64_t)_numberOfDominantPhysicalButtonObservers
{
  return self->__numberOfDominantPhysicalButtonObservers;
}

- (void)_setNumberOfDominantPhysicalButtonObservers:(int64_t)a3
{
  self->__numberOfDominantPhysicalButtonObservers = a3;
}

- (void)_updatePhysicalButtonObservation
{
  CMMotionManager *v3;
  void *v4;
  CMMotionManager *v5;
  CMMotionManager *physicalButtonMotionManager;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[CAMMotionController _physicalButtonMotionManager](self, "_physicalButtonMotionManager");
  v3 = (CMMotionManager *)objc_claimAutoreleasedReturnValue();
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isLockAsShutterEnabled")
    && -[CAMMotionController _numberOfDominantPhysicalButtonObservers](self, "_numberOfDominantPhysicalButtonObservers") >= 1)
  {
    if (!-[CMMotionManager isDeviceMotionActive](v3, "isDeviceMotionActive"))
    {
      if (!v3)
      {
        v5 = (CMMotionManager *)objc_alloc_init(MEMORY[0x1E0CA5670]);
        physicalButtonMotionManager = self->__physicalButtonMotionManager;
        self->__physicalButtonMotionManager = v5;

        -[CMMotionManager setDeviceMotionUpdateInterval:](self->__physicalButtonMotionManager, "setDeviceMotionUpdateInterval:", 0.05);
        -[CMMotionManager setPowerConservationMode:](self->__physicalButtonMotionManager, "setPowerConservationMode:", 2);
        v3 = self->__physicalButtonMotionManager;
      }
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __55__CAMMotionController__updatePhysicalButtonObservation__block_invoke;
      v8[3] = &unk_1EA329980;
      objc_copyWeak(&v9, &location);
      -[CMMotionManager startDeviceMotionUpdatesToQueue:withHandler:](v3, "startDeviceMotionUpdatesToQueue:withHandler:", v7, v8);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  else if (-[CMMotionManager isDeviceMotionActive](v3, "isDeviceMotionActive"))
  {
    -[CMMotionManager stopDeviceMotionUpdates](v3, "stopDeviceMotionUpdates");
  }

}

- (CMMotionManager)_physicalButtonMotionManager
{
  return self->__physicalButtonMotionManager;
}

- (void)debugValidateCaptureOrientationForMode:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = -[CAMMotionController _cachedCaptureOrientation](self, "_cachedCaptureOrientation");
  if ((unint64_t)(v5 - 1) >= 4)
  {
    v6 = v5;
    v7 = -[CAMMotionController _fallbackCaptureOrientation](self, "_fallbackCaptureOrientation");
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "activeInterfaceOrientation");

    if ((unint64_t)a3 <= 9 && ((1 << a3) & 0x251) != 0 && !v6)
    {
      v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[CAMMotionController _debugStringForInterfaceOrientation:](self, "_debugStringForInterfaceOrientation:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMMotionController _debugStringForDeviceOrientation:](self, "_debugStringForDeviceOrientation:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMMotionController _debugStringForInterfaceOrientation:](self, "_debugStringForInterfaceOrientation:", v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543874;
        v21 = v17;
        v22 = 2114;
        v23 = v18;
        v24 = 2114;
        v25 = v19;
        _os_log_error_impl(&dword_1DB760000, v14, OS_LOG_TYPE_ERROR, "Capturing with fallback orientation %{public}@ because accelerometer returned %{public}@ (activeInterfaceOrientation is %{public}@).", (uint8_t *)&v20, 0x20u);

      }
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v10 = objc_claimAutoreleasedReturnValue();
      v15 = -[NSObject isInternalInstall](v10, "isInternalInstall");
      v16 = -[CAMMotionController _didNotifyCaptureOrientationWasInvalid](self, "_didNotifyCaptureOrientationWasInvalid");
      if (v15 && !v16)
      {
        CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
        if (!CFPreferencesGetAppBooleanValue(CFSTR("CAMDebugSuppressOrientationAlert"), CFSTR("com.apple.camera"), 0))
        {
          dispatch_time(0, 600000000);
          pl_dispatch_after();
        }
        -[CAMMotionController _setDidNotifyCaptureOrientationWasInvalid:](self, "_setDidNotifyCaptureOrientationWasInvalid:", 1);
      }
    }
    else
    {
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[CAMMotionController _debugStringForInterfaceOrientation:](self, "_debugStringForInterfaceOrientation:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMMotionController _debugStringForDeviceOrientation:](self, "_debugStringForDeviceOrientation:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMMotionController _debugStringForInterfaceOrientation:](self, "_debugStringForInterfaceOrientation:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543874;
        v21 = v11;
        v22 = 2114;
        v23 = v12;
        v24 = 2114;
        v25 = v13;
        _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Capturing with fallback orientation %{public}@ because accelerometer returned %{public}@ (activeInterfaceOrientation is %{public}@).", (uint8_t *)&v20, 0x20u);

      }
    }

  }
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = -[CAMMotionController _cachedCaptureOrientation](self, "_cachedCaptureOrientation", a3);
  if ((unint64_t)(a4 - 1) < 4)
  {
    if ((unint64_t)(a4 - 3) <= 1)
      -[CAMMotionController _setOrientationWhenForcedToLandscape:](self, "_setOrientationWhenForcedToLandscape:", a4);
LABEL_12:
    -[CAMMotionController setDeviceOrientation:](self, "setDeviceOrientation:", a4);
LABEL_13:
    -[CAMMotionController _setCachedCaptureOrientation:](self, "_setCachedCaptureOrientation:", a4);
    return;
  }
  v7 = v6;
  v8 = v6 - 1;
  v9 = os_log_create("com.apple.camera", "Camera");
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 >= 4)
  {
    if (v10)
    {
      -[CAMMotionController _debugStringForDeviceOrientation:](self, "_debugStringForDeviceOrientation:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMMotionController _debugStringForDeviceOrientation:](self, "_debugStringForDeviceOrientation:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Received device orientation change from accelerometer as %{public}@ (was %{public}@)", (uint8_t *)&v16, 0x16u);

    }
    goto LABEL_12;
  }
  v11 = v7 - 5;
  if (v10)
  {
    -[CAMMotionController _debugStringForDeviceOrientation:](self, "_debugStringForDeviceOrientation:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMMotionController _debugStringForDeviceOrientation:](self, "_debugStringForDeviceOrientation:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v12;
    v18 = 2114;
    v19 = v13;
    _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Received device orientation change from accelerometer as %{public}@ (ignoring and keeping %{public}@)", (uint8_t *)&v16, 0x16u);

  }
  -[CAMMotionController setDeviceOrientation:](self, "setDeviceOrientation:", a4);
  if (v11 <= 0xFFFFFFFFFFFFFFFBLL)
    goto LABEL_13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CAMMotionController _accelerometer](self, "_accelerometer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOrientationEventsEnabled:", 0);

  v4.receiver = self;
  v4.super_class = (Class)CAMMotionController;
  -[CAMMotionController dealloc](&v4, sel_dealloc);
}

- (void)_updateInitialOrientation
{
  int64_t v3;
  NSObject *v4;
  void *v5;
  int64_t v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[BKSAccelerometer currentDeviceOrientation](self->__accelerometer, "currentDeviceOrientation");
  v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[CAMMotionController _debugStringForDeviceOrientation:](self, "_debugStringForDeviceOrientation:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v5;
    _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Capture orientation %{public}@ (initial)", (uint8_t *)&v14, 0xCu);

  }
  self->__cachedCaptureOrientation = v3;
  self->_deviceOrientation = v3;
  if ((unint64_t)(v3 - 3) <= 1)
  {
    -[CAMMotionController _setOrientationWhenForcedToLandscape:](self, "_setOrientationWhenForcedToLandscape:", v3);
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  if ((unint64_t)(v3 - 1) < 4)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "activeInterfaceOrientation");

  v8 = os_log_create("com.apple.camera", "Camera");
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      -[CAMMotionController _debugStringForDeviceOrientation:](self, "_debugStringForDeviceOrientation:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMMotionController _debugStringForInterfaceOrientation:](self, "_debugStringForInterfaceOrientation:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Device orientation from accelerometer is not usable for capture orientation: (%{public}@). Will use activeInterfaceOrientation %{public}@ as fallback.", (uint8_t *)&v14, 0x16u);

    }
  }
  else
  {
    if (v9)
    {
      -[CAMMotionController _debugStringForDeviceOrientation:](self, "_debugStringForDeviceOrientation:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMMotionController _debugStringForInterfaceOrientation:](self, "_debugStringForInterfaceOrientation:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Device orientation from accelerometer is not usable for capture orientation (%{public}@) and neither is -[UIApplication activeInterfaceOrientation] (%{public}@). Will use Portrait as fallback.", (uint8_t *)&v14, 0x16u);

    }
    v6 = 1;
  }
LABEL_7:
  self->__fallbackCaptureOrientation = v6;
}

- (void)_handleApplicationDidEnterBackground:(id)a3
{
  id v3;

  -[CAMMotionController _accelerometer](self, "_accelerometer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOrientationEventsEnabled:", 0);

}

- (void)_handleApplicationWillEnterForeground:(id)a3
{
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = -[CAMMotionController captureOrientation](self, "captureOrientation", a3);
  v5 = -[CAMMotionController deviceOrientation](self, "deviceOrientation");
  -[CAMMotionController _updateInitialOrientation](self, "_updateInitialOrientation");
  -[CAMMotionController _accelerometer](self, "_accelerometer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOrientationEventsEnabled:", 1);

  if (-[CAMMotionController captureOrientation](self, "captureOrientation") != v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("CAMMotionControllerCaptureOrientationChangedNotification"), self);

  }
  if (-[CAMMotionController deviceOrientation](self, "deviceOrientation") != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("CAMMotionControllerCaptureDeviceOrientationChangedNotification"), self);

  }
}

- (void)_setCachedCaptureOrientation:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->__cachedCaptureOrientation != a3)
  {
    self->__cachedCaptureOrientation = a3;
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMMotionController _debugStringForDeviceOrientation:](self, "_debugStringForDeviceOrientation:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Capture orientation %{public}@ (updated)", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("CAMMotionControllerCaptureOrientationChangedNotification"), self);

  }
}

- (void)setDeviceOrientation:(int64_t)a3
{
  id v4;

  if (self->_deviceOrientation != a3)
  {
    self->_deviceOrientation = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("CAMMotionControllerCaptureDeviceOrientationChangedNotification"), self);

  }
}

- (int64_t)panoramaCaptureOrientation
{
  return +[CAMOrientationUtilities panoramaCaptureOrientationFromCaptureOrientation:](CAMOrientationUtilities, "panoramaCaptureOrientationFromCaptureOrientation:", -[CAMMotionController captureOrientation](self, "captureOrientation"));
}

- (void)setForceLandscapeOrientation:(BOOL)a3
{
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_forceLandscapeOrientation != a3)
  {
    if (a3)
    {
      v5 = -[CAMMotionController captureOrientation](self, "captureOrientation");
      self->_forceLandscapeOrientation = a3;
      v6 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[CAMMotionController _debugStringForInterfaceOrientation:](self, "_debugStringForInterfaceOrientation:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMMotionController _debugStringForInterfaceOrientation:](self, "_debugStringForInterfaceOrientation:", -[CAMMotionController _orientationIfForcedToLandscape](self, "_orientationIfForcedToLandscape"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v7;
        v16 = 2114;
        v17 = v8;
        _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Beginning force landscape orientation, changing orientation from %{public}@ to %{public}@", (uint8_t *)&v14, 0x16u);

      }
      if (v5 <= 2)
      {
        -[CAMMotionController _setOrientationWhenForcedToLandscape:](self, "_setOrientationWhenForcedToLandscape:", 3);
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "postNotificationName:object:", CFSTR("CAMMotionControllerCaptureOrientationChangedNotification"), self);

      }
    }
    else
    {
      self->_forceLandscapeOrientation = 0;
      v9 = -[CAMMotionController captureOrientation](self, "captureOrientation");
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[CAMMotionController _debugStringForInterfaceOrientation:](self, "_debugStringForInterfaceOrientation:", -[CAMMotionController _orientationIfForcedToLandscape](self, "_orientationIfForcedToLandscape"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMMotionController _debugStringForInterfaceOrientation:](self, "_debugStringForInterfaceOrientation:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v11;
        v16 = 2114;
        v17 = v12;
        _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Ending force landscape orientation, changing orientation from %{public}@ to %{public}@", (uint8_t *)&v14, 0x16u);

      }
      if (-[CAMMotionController _orientationIfForcedToLandscape](self, "_orientationIfForcedToLandscape") != v9)
        goto LABEL_10;
    }
  }
}

void __55__CAMMotionController__updatePhysicalButtonObservation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  _BOOL4 v11;
  BOOL v12;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v3 = a2;
  objc_msgSend(v3, "attitude");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rotationRate");
  v5 = v4;

  objc_msgSend(v19, "roll");
  v7 = v6 * 57.2957795;
  objc_msgSend(v19, "pitch");
  v9 = fabs(v8 * 57.2957795);
  v10 = v7 < 115.0;
  if (v7 <= 65.0)
    v10 = 0;
  v11 = v9 <= 35.0 && v7 < 0.0;
  if (v9 > 35.0)
    v10 = 0;
  v12 = v11 || v10;
  if (!v11 && !v10 || v5 <= 1.0)
  {
    if (v11)
    {
      v14 = _updatePhysicalButtonObservation_numberOfConsecutiveSamplesWantingDominantLockButton++;
      _updatePhysicalButtonObservation_numberOfConsecutiveSamplesWantingDominantVolumeButton = 0;
      if (v14 >= 1)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        v16 = WeakRetained;
        v17 = 3;
        goto LABEL_22;
      }
    }
    else
    {
      _updatePhysicalButtonObservation_numberOfConsecutiveSamplesWantingDominantLockButton = 0;
      if (v10)
      {
        v18 = _updatePhysicalButtonObservation_numberOfConsecutiveSamplesWantingDominantVolumeButton++;
        if (v18 >= 1)
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
          v16 = WeakRetained;
          v17 = 2;
          goto LABEL_22;
        }
      }
      else
      {
        _updatePhysicalButtonObservation_numberOfConsecutiveSamplesWantingDominantVolumeButton = 0;
      }
    }
    if (v12)
      goto LABEL_23;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v16 = WeakRetained;
    v17 = 0;
LABEL_22:
    objc_msgSend(WeakRetained, "_setDominantPhysicalButton:", v17);

  }
LABEL_23:

}

- (void)endGeneratingDominantPhysicalButtonNotifications
{
  -[CAMMotionController _setNumberOfDominantPhysicalButtonObservers:](self, "_setNumberOfDominantPhysicalButtonObservers:", -[CAMMotionController _numberOfDominantPhysicalButtonObservers](self, "_numberOfDominantPhysicalButtonObservers")- 1);
  -[CAMMotionController _updatePhysicalButtonObservation](self, "_updatePhysicalButtonObservation");
}

- (void)_setDominantPhysicalButton:(int64_t)a3
{
  id v4;

  if (self->_dominantPhysicalButton != a3)
  {
    self->_dominantPhysicalButton = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("CAMMotionControllerDominantPhysicalCaptureButtonChangedNotification"), self);

  }
}

- (void)beginUpdatingLevelViewModel:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[CAMMotionController activeLevelViewModel](self, "activeLevelViewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5)
  {
    if (v4)
      -[CAMMotionController endUpdatingActiveLevelViewModel](self, "endUpdatingActiveLevelViewModel");
    -[CAMMotionController _setActiveLevelViewModel:](self, "_setActiveLevelViewModel:", v5);
    objc_msgSend(v5, "registerChangeObserver:context:", self, 0);
    -[CAMMotionController _updateAttitudeAlignmentMotionManager](self, "_updateAttitudeAlignmentMotionManager");
  }

}

- (void)observable:(id)a3 didPublishChange:(unint64_t)a4 withContext:(void *)a5
{
  if (!a5 && (a4 & 8) != 0)
    -[CAMMotionController _updateAttitudeAlignmentMotionManager](self, "_updateAttitudeAlignmentMotionManager", a3);
}

- (void)beginUpdatingPreviewAlignmentModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CAMMotionController activePreviewAlignmentModel](self, "activePreviewAlignmentModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 != v7)
  {
    -[CAMMotionController activePreviewAlignmentModel](self, "activePreviewAlignmentModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[CAMMotionController endUpdatingPreviewAlignmentModel](self, "endUpdatingPreviewAlignmentModel");
    objc_msgSend(v7, "reset");
    -[CAMMotionController _setActivePreviewAlignmentModel:](self, "_setActivePreviewAlignmentModel:", v7);
    -[CAMMotionController _updateAttitudeAlignmentMotionManager](self, "_updateAttitudeAlignmentMotionManager");
    v5 = v7;
  }

}

- (void)endUpdatingPreviewAlignmentModel
{
  void *v3;

  -[CAMMotionController activePreviewAlignmentModel](self, "activePreviewAlignmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CAMMotionController _setActivePreviewAlignmentModel:](self, "_setActivePreviewAlignmentModel:", 0);
    -[CAMMotionController _updateAttitudeAlignmentMotionManager](self, "_updateAttitudeAlignmentMotionManager");
  }
}

- (void)_updateAttitudeAlignmentMotionManager
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  __objc2_class *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id location;

  -[CAMMotionController _attitudeAlignmentMotionManager](self, "_attitudeAlignmentMotionManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMMotionController activeLevelViewModel](self, "activeLevelViewModel");
  v4 = objc_claimAutoreleasedReturnValue();
  -[CAMMotionController activePreviewAlignmentModel](self, "activePreviewAlignmentModel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v3 && v4 | v5)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CA5670]);
    objc_storeStrong((id *)&self->__attitudeAlignmentMotionManager, v3);
  }
  v6 = objc_msgSend(v3, "isDeviceMotionActive");
  if (v4 | v5)
  {
    if ((v6 & 1) == 0)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __60__CAMMotionController__updateAttitudeAlignmentMotionManager__block_invoke;
      v16 = &unk_1EA329980;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v3, "startDeviceMotionUpdatesToQueue:withHandler:", v7, &v13);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    if (v5 && v4)
    {
      +[CAMPreviewAlignmentModel desiredUpdateInterval](CAMPreviewAlignmentModel, "desiredUpdateInterval");
      v9 = v8;
      objc_msgSend((id)v4, "desiredUpdateInterval");
      if (v9 >= v10)
        v9 = v10;
    }
    else
    {
      if (v5)
      {
        v11 = CAMPreviewAlignmentModel;
      }
      else
      {
        if (!v4)
        {
          v9 = 0.0;
          goto LABEL_19;
        }
        v11 = (__objc2_class *)v4;
      }
      -[__objc2_class desiredUpdateInterval](v11, "desiredUpdateInterval", v13, v14, v15, v16);
      v9 = v12;
    }
  }
  else
  {
    v9 = 0.0;
    if (v6)
      objc_msgSend(v3, "stopDeviceMotionUpdates");
  }
LABEL_19:
  objc_msgSend(v3, "setDeviceMotionUpdateInterval:", v9, v13, v14, v15, v16);

}

void __60__CAMMotionController__updateAttitudeAlignmentMotionManager__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleLevelMotionUpdate:error:", v6, v5);

}

- (void)_handleLevelMotionUpdate:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CAMMotionController _handleLevelMotionUpdate:error:].cold.1((uint64_t)v7, v8);

    -[CAMMotionController _attitudeAlignmentMotionManager](self, "_attitudeAlignmentMotionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopDeviceMotionUpdates");
  }
  else
  {
    -[CAMMotionController activeLevelViewModel](self, "activeLevelViewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applyDeviceMotion:captureOrientation:", v6, -[CAMMotionController captureOrientation](self, "captureOrientation"));

    -[CAMMotionController activePreviewAlignmentModel](self, "activePreviewAlignmentModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applyDeviceMotion:", v6);
  }

}

- (id)_debugStringForInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)a3 < 5)
    return off_1EA329A20[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected:%ld"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __62__CAMMotionController_debugValidateCaptureOrientationForMode___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Orientation Error"), CFSTR("There was a problem detecting the orientation for the photo. Please take a sysdiagnose and file a radar.\n\nTo trigger a sysdiagnose, press Volume Up + Down, and Power button simultaneously.\n\n(This message is internal only)"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3448];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__CAMMotionController_debugValidateCaptureOrientationForMode___block_invoke_2;
    v8[3] = &unk_1EA3299C8;
    v9 = v3;
    v5 = v3;
    objc_msgSend(v4, "actionWithTitle:style:handler:", CFSTR("OK"), 0, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v6);
    objc_msgSend(v2, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

uint64_t __62__CAMMotionController_debugValidateCaptureOrientationForMode___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (BOOL)forceLandscapeOrientation
{
  return self->_forceLandscapeOrientation;
}

- (void)_setActiveLevelViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_activeLevelViewModel, a3);
}

- (CAMPreviewAlignmentModel)activePreviewAlignmentModel
{
  return self->_activePreviewAlignmentModel;
}

- (void)_setActivePreviewAlignmentModel:(id)a3
{
  objc_storeStrong((id *)&self->_activePreviewAlignmentModel, a3);
}

- (int64_t)_fallbackCaptureOrientation
{
  return self->__fallbackCaptureOrientation;
}

- (BOOL)_didNotifyCaptureOrientationWasInvalid
{
  return self->__didNotifyCaptureOrientationWasInvalid;
}

- (void)_setDidNotifyCaptureOrientationWasInvalid:(BOOL)a3
{
  self->__didNotifyCaptureOrientationWasInvalid = a3;
}

- (BKSAccelerometer)_accelerometer
{
  return self->__accelerometer;
}

- (void)_setAccelerometer:(id)a3
{
  objc_storeStrong((id *)&self->__accelerometer, a3);
}

- (CMMotionManager)_attitudeAlignmentMotionManager
{
  return self->__attitudeAlignmentMotionManager;
}

- (int64_t)_orientationIfForcedToLandscape
{
  return self->__orientationIfForcedToLandscape;
}

- (void)_setOrientationWhenForcedToLandscape:(int64_t)a3
{
  self->__orientationIfForcedToLandscape = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__attitudeAlignmentMotionManager, 0);
  objc_storeStrong((id *)&self->__physicalButtonMotionManager, 0);
  objc_storeStrong((id *)&self->__accelerometer, 0);
  objc_storeStrong((id *)&self->_activePreviewAlignmentModel, 0);
  objc_storeStrong((id *)&self->_activeLevelViewModel, 0);
}

- (void)_handleLevelMotionUpdate:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "CMMotionManager encountered an error. Device motion will stop delivery to attitude alignment models. %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
