@implementation CBRecordingIndicatorManager

- (CBRecordingIndicatorManager)initWithWindowScene:(id)a3
{
  id v4;
  CBRecordingIndicatorManager *v5;
  CBRecordingIndicatorManager *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unsigned int v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CBRecordingIndicatorManager;
  v5 = -[CBRecordingIndicatorManager init](&v19, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
    v10 = objc_msgSend(v9, "homeButtonType");

    v12 = objc_msgSend((id)objc_opt_class(v6, v11), "_supportsSecureIndicator");
    v13 = v10 != (id)2 || v8 == (id)1;
    v14 = 2;
    if (!v13)
      v14 = 0;
    if (v12)
      v14 = 1;
    v6->_displayMode = v14;
    if (v14 == 2)
    {
      -[CBRecordingIndicatorManager _createRecordingIndicatorForStandaloneLocation](v6, "_createRecordingIndicatorForStandaloneLocation");
      -[CBRecordingIndicatorManager _createRecordingIndicatorForStatusBarLocation](v6, "_createRecordingIndicatorForStatusBarLocation");
    }
    else
    {
      -[CBRecordingIndicatorManager _createRecordingIndicatorForStandaloneLocation](v6, "_createRecordingIndicatorForStandaloneLocation");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "delegate"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sensorActivityDataProvider"));
    objc_msgSend(v17, "addObserver:", v6);
    -[CBRecordingIndicatorManager activityDidChangeForSensorActivityDataProvider:](v6, "activityDidChangeForSensorActivityDataProvider:", v17);

  }
  return v6;
}

- (void)_createRecordingIndicatorForStandaloneLocation
{
  CBRecordingIndicatorWindow *v3;
  CBRecordingIndicatorViewController *v4;
  CBRecordingIndicatorViewController *recordingIndicatorViewController;
  UIWindow *recordingIndicatorWindow;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorManager windowScene](self, "windowScene"));
  v3 = -[CBRecordingIndicatorWindow initWithWindowScene:debugName:]([CBRecordingIndicatorWindow alloc], "initWithWindowScene:debugName:", v7, CFSTR("Recording Indicator"));
  v4 = -[CBRecordingIndicatorViewController initForLocation:]([CBRecordingIndicatorViewController alloc], "initForLocation:", 0);
  recordingIndicatorViewController = self->_recordingIndicatorViewController;
  self->_recordingIndicatorViewController = v4;

  -[CBRecordingIndicatorWindow setRootViewController:](v3, "setRootViewController:", self->_recordingIndicatorViewController);
  -[CBRecordingIndicatorWindow setWindowLevel:](v3, "setWindowLevel:", UIScreenshotServicesWindowLevel + 10.0);
  -[CBRecordingIndicatorWindow setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  -[CBRecordingIndicatorWindow setHidden:](v3, "setHidden:", 0);
  recordingIndicatorWindow = self->_recordingIndicatorWindow;
  self->_recordingIndicatorWindow = &v3->super.super.super;

}

- (void)_createRecordingIndicatorForStatusBarLocation
{
  CBRecordingIndicatorWindow *v3;
  CBRecordingIndicatorViewController *v4;
  CBRecordingIndicatorViewController *recordingIndicatorViewControllerUIKitStatusBarPortal;
  UIWindow *recordingIndicatorWindowUIKitStatusBarPortal;
  CBRecordingIndicatorWindow *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorManager windowScene](self, "windowScene"));
  v3 = -[CBRecordingIndicatorWindow initWithWindowScene:debugName:]([CBRecordingIndicatorWindow alloc], "initWithWindowScene:debugName:", v12, CFSTR("Recording Indicator (UIKit Status Bar Portal)"));
  v4 = -[CBRecordingIndicatorViewController initForLocation:]([CBRecordingIndicatorViewController alloc], "initForLocation:", 1);
  recordingIndicatorViewControllerUIKitStatusBarPortal = self->_recordingIndicatorViewControllerUIKitStatusBarPortal;
  self->_recordingIndicatorViewControllerUIKitStatusBarPortal = v4;

  -[CBRecordingIndicatorWindow setRootViewController:](v3, "setRootViewController:", self->_recordingIndicatorViewControllerUIKitStatusBarPortal);
  -[CBRecordingIndicatorWindow setWindowLevel:](v3, "setWindowLevel:", UIWindowLevelNormal + -1.0);
  -[CBRecordingIndicatorWindow setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  -[CBRecordingIndicatorWindow setHidden:](v3, "setHidden:", 0);
  recordingIndicatorWindowUIKitStatusBarPortal = self->_recordingIndicatorWindowUIKitStatusBarPortal;
  self->_recordingIndicatorWindowUIKitStatusBarPortal = &v3->super.super.super;
  v7 = v3;

  v9 = (void *)objc_opt_class(STUIStatusBar_Wrapper, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorViewController indicatorView](self->_recordingIndicatorViewControllerUIKitStatusBarPortal, "indicatorView"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screen"));
  objc_msgSend(v9, "registerSensorActivityIndicator:forScreen:", v10, v11);

}

- (void)_createRecordingIndicatorForSystemApertureLocation
{
  CBRecordingIndicatorWindow *v3;
  CBRecordingIndicatorViewController *v4;
  CBRecordingIndicatorViewController *recordingIndicatorViewControllerSystemAperturePortal;
  UIWindow *recordingIndicatorWindowSystemAperturePortal;
  CBRecordingIndicatorWindow *v7;
  void *v8;
  id v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorManager windowScene](self, "windowScene"));
  v3 = -[CBRecordingIndicatorWindow initWithWindowScene:debugName:]([CBRecordingIndicatorWindow alloc], "initWithWindowScene:debugName:", v10, CFSTR("Recording Indicator (SystemAperture Portal)"));
  v4 = -[CBRecordingIndicatorViewController initForLocation:]([CBRecordingIndicatorViewController alloc], "initForLocation:", 2);
  recordingIndicatorViewControllerSystemAperturePortal = self->_recordingIndicatorViewControllerSystemAperturePortal;
  self->_recordingIndicatorViewControllerSystemAperturePortal = v4;

  -[CBRecordingIndicatorWindow setRootViewController:](v3, "setRootViewController:", self->_recordingIndicatorViewControllerSystemAperturePortal);
  -[CBRecordingIndicatorWindow setWindowLevel:](v3, "setWindowLevel:", UIScreenshotServicesWindowLevel + 5.0);
  -[CBRecordingIndicatorWindow setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  -[CBRecordingIndicatorWindow setHidden:](v3, "setHidden:", 0);
  recordingIndicatorWindowSystemAperturePortal = self->_recordingIndicatorWindowSystemAperturePortal;
  self->_recordingIndicatorWindowSystemAperturePortal = &v3->super.super.super;
  v7 = v3;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorViewController indicatorContainerView](self->_recordingIndicatorViewControllerSystemAperturePortal, "indicatorContainerView"));
  v9 = objc_msgSend(objc_alloc((Class)_UIPortalView), "initWithSourceView:", v8);
  objc_msgSend(v9, "setMatchesAlpha:", 1);
  -[CBRecordingIndicatorViewController setDelegate:](self->_recordingIndicatorViewControllerSystemAperturePortal, "setDelegate:", self);

}

- (void)updateRecordingIndicatorLocationIfNecessary
{
  -[CBRecordingIndicatorManager _updateRecordingIndicatorLocationIfNecessary](self, "_updateRecordingIndicatorLocationIfNecessary");
}

- (unint64_t)_indicatorTypeForSensorType:(int64_t)a3
{
  if (a3 != 1)
    return 0;
  if (UIAccessibilityShouldDifferentiateWithoutColor())
    return 2;
  return 1;
}

- (id)_indicatorIdentifierForSensorType:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("microphone-recording-indicator");
  else
    return CFSTR("camera-recording-indicator");
}

- (void)_dataProviderDidUpdate:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  CBRecordingIndicatorManager *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  NSTimer *v17;
  NSTimer *minimumTimeOnScreenTimer;
  void **v19;
  uint64_t v20;
  id (*v21)(uint64_t);
  void *v22;
  CBRecordingIndicatorManager *v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  double v28;

  v5 = a3;
  objc_storeStrong((id *)&self->_dataProvider, a3);
  if (self->_visibilityIsForcedByPrototypeSettings)
  {
    v6 = CheckerBoardLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Visibility is forced by prototype settings", buf, 2u);
    }
    goto LABEL_19;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeCameraAndMicrophoneActivityAttributions"));
  if (-[NSObject count](v7, "count"))
  {
    -[CBRecordingIndicatorManager _updateIndicatorStyleForSensorActivityAttributions:](self, "_updateIndicatorStyleForSensorActivityAttributions:", v7);
    v8 = self;
    v9 = 1;
LABEL_6:
    -[CBRecordingIndicatorManager setIndicatorVisible:](v8, "setIndicatorVisible:", v9);
    goto LABEL_17;
  }
  if (-[CBRecordingIndicatorManager isIndicatorVisible](self, "isIndicatorVisible"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v10, "timeIntervalSinceDate:", self->_indicatorDisplayTime);
    v12 = v11;

    if (v12 <= 2.0)
    {
      v13 = -[NSTimer isValid](self->_minimumTimeOnScreenTimer, "isValid");
      v14 = CheckerBoardLogHandleForCategory(6);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Timer is already valid", buf, 2u);
        }

      }
      else
      {
        if (v16)
        {
          *(_DWORD *)buf = 134349312;
          v26 = 0x4000000000000000;
          v27 = 2050;
          v28 = v12;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Starting a timer to keep the indicator on screen for a minimum of %{public}.2f seconds (elapsed %{public}.2fs)", buf, 0x16u);
        }

        v19 = _NSConcreteStackBlock;
        v20 = 3221225472;
        v21 = sub_100021D14;
        v22 = &unk_100075DE8;
        v23 = self;
        v24 = v5;
        v17 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v19, 2.0 - v12));
        minimumTimeOnScreenTimer = self->_minimumTimeOnScreenTimer;
        self->_minimumTimeOnScreenTimer = v17;

      }
      goto LABEL_17;
    }
    v8 = self;
    v9 = 0;
    goto LABEL_6;
  }
LABEL_17:
  if (-[CBRecordingIndicatorManager _supportsStatusBarItem](self, "_supportsStatusBarItem", v19, v20, v21, v22, v23))
    -[CBRecordingIndicatorManager _updateRecordingIndicatorForStatusBarChanges](self, "_updateRecordingIndicatorForStatusBarChanges");
LABEL_19:

}

- (BOOL)_supportsStatusBarItem
{
  return ((-[CBRecordingIndicatorManager displayMode](self, "displayMode") - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)setIndicatorVisible:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  NSTimer *minimumTimeOnScreenTimer;
  NSDate *v9;
  NSDate *indicatorDisplayTime;
  unint64_t v11;
  CBRecordingIndicatorManager *v12;
  _BOOL8 v13;
  uint64_t v14;
  int v15;
  const __CFString *v16;

  if (self->_indicatorVisible != a3)
  {
    v3 = a3;
    self->_indicatorVisible = a3;
    v5 = CheckerBoardLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("off");
      if (v3)
        v7 = CFSTR("on");
      v15 = 138543362;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@...", (uint8_t *)&v15, 0xCu);
    }

    -[NSTimer invalidate](self->_minimumTimeOnScreenTimer, "invalidate");
    minimumTimeOnScreenTimer = self->_minimumTimeOnScreenTimer;
    self->_minimumTimeOnScreenTimer = 0;

    if (v3)
    {
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      indicatorDisplayTime = self->_indicatorDisplayTime;
      self->_indicatorDisplayTime = v9;
    }
    else
    {
      indicatorDisplayTime = self->_indicatorDisplayTime;
      self->_indicatorDisplayTime = 0;
    }

    v11 = -[CBRecordingIndicatorManager displayMode](self, "displayMode");
    if (v11 < 2)
    {
      v12 = self;
      v13 = v3;
      v14 = 0;
LABEL_15:
      -[CBRecordingIndicatorManager _setIndicatorVisible:atLocation:](v12, "_setIndicatorVisible:atLocation:", v13, v14);
      return;
    }
    if (v11 - 3 < 2)
    {
      -[CBRecordingIndicatorManager _updateSystemApertureElementAssertion](self, "_updateSystemApertureElementAssertion");
      return;
    }
    if (v11 == 2)
    {
      -[CBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:", 0, 0);
      v12 = self;
      v13 = v3;
      v14 = 1;
      goto LABEL_15;
    }
  }
}

- (void)setIndicatorVisibleAtStatusBarLocation:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;

  if (self->_indicatorVisibleAtStatusBarLocation != a3)
  {
    v3 = a3;
    self->_indicatorVisibleAtStatusBarLocation = a3;
    v4 = CheckerBoardLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("off");
      if (v3)
        v6 = CFSTR("on");
      v8 = 138543362;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at Status Bar location (via status bar data change)", (uint8_t *)&v8, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBStatusBarStateAggregator sharedInstance](CBStatusBarStateAggregator, "sharedInstance"));
    objc_msgSend(v7, "updateStatusBarItem:", 28);

  }
}

- (void)_updateRecordingIndicatorLocationIfNecessary
{
  _BOOL8 v3;

  v3 = -[CBRecordingIndicatorManager isIndicatorVisible](self, "isIndicatorVisible");
  if (!v3 || (char *)-[CBRecordingIndicatorManager displayMode](self, "displayMode") - 3 <= (char *)1)
  {
    -[CBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:", v3, 0);
    -[CBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:", 0, 1);
    -[CBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:", 0, 2);
  }
}

+ (BOOL)_supportsSecureIndicator
{
  if (qword_10008BD78 != -1)
    dispatch_once(&qword_10008BD78, &stru_100075E08);
  return byte_10008BD80;
}

- (void)_setIndicatorVisible:(BOOL)a3 atLocation:(unint64_t)a4
{
  _BOOL4 v4;
  unint64_t v6;
  CBRecordingIndicatorViewController *recordingIndicatorViewController;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      -[CBRecordingIndicatorManager setIndicatorVisibleAtStatusBarLocation:](self, "setIndicatorVisibleAtStatusBarLocation:", a3);
      return;
    }
    if (a4)
      return;
    v6 = -[CBRecordingIndicatorViewController indicatorState](self->_recordingIndicatorViewController, "indicatorState");
    if (v4)
    {
      if (v6 - 1 >= 2)
      {
        recordingIndicatorViewController = self->_recordingIndicatorViewController;
LABEL_10:
        v9 = 1;
LABEL_22:
        -[CBRecordingIndicatorViewController updateIndicatorVisibility:](recordingIndicatorViewController, "updateIndicatorVisibility:", v9);
        return;
      }
      return;
    }
    if (!v6 || v6 == 3)
      return;
    recordingIndicatorViewController = self->_recordingIndicatorViewController;
LABEL_21:
    v9 = 0;
    goto LABEL_22;
  }
  v8 = -[CBRecordingIndicatorViewController indicatorState](self->_recordingIndicatorViewControllerSystemAperturePortal, "indicatorState");
  if (!v4)
  {
    if (v8)
      v10 = v8 == 3;
    else
      v10 = 1;
    if (v10)
      return;
    recordingIndicatorViewController = self->_recordingIndicatorViewControllerSystemAperturePortal;
    goto LABEL_21;
  }
  if (v8 - 1 >= 2)
  {
    recordingIndicatorViewController = self->_recordingIndicatorViewControllerSystemAperturePortal;
    goto LABEL_10;
  }
}

- (void)_updateRecordingIndicatorForStatusBarChanges
{
  unint64_t v3;
  CBRecordingIndicatorViewController *recordingIndicatorViewController;
  CBRecordingIndicatorManager *v5;
  uint64_t v6;

  v3 = -[CBRecordingIndicatorManager displayMode](self, "displayMode");
  if (v3 == 4)
  {
    -[CBRecordingIndicatorManager _updateRecordingIndicatorLocationIfNecessary](self, "_updateRecordingIndicatorLocationIfNecessary");
    return;
  }
  if (v3 == 2 && -[CBRecordingIndicatorManager isIndicatorVisible](self, "isIndicatorVisible"))
  {
    recordingIndicatorViewController = self->_recordingIndicatorViewController;
    if (self->_indicatorStatusBarPartIsHidden)
    {
      if ((id)-[CBRecordingIndicatorViewController indicatorState](recordingIndicatorViewController, "indicatorState") == (id)1)
        return;
      -[CBRecordingIndicatorViewController updateIndicatorVisibilityWithFastFadeAnimation:](self->_recordingIndicatorViewController, "updateIndicatorVisibilityWithFastFadeAnimation:", 1);
      v5 = self;
      v6 = 0;
    }
    else
    {
      -[CBRecordingIndicatorViewController updateIndicatorVisibilityWithFastFadeAnimation:](recordingIndicatorViewController, "updateIndicatorVisibilityWithFastFadeAnimation:", 0);
      v5 = self;
      v6 = 1;
    }
    -[CBRecordingIndicatorManager _setIndicatorVisible:atLocation:](v5, "_setIndicatorVisible:atLocation:", v6, 1);
  }
}

- (void)_updateIndicatorStyleForSensorActivityAttributions:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "sensor", (_QWORD)v10))
          {
            -[CBRecordingIndicatorManager _updateIndicatorViewForSensorType:](self, "_updateIndicatorViewForSensorType:", 0);

            goto LABEL_12;
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v7)
          continue;
        break;
      }
    }

    -[CBRecordingIndicatorManager _updateIndicatorViewForSensorType:](self, "_updateIndicatorViewForSensorType:", 1);
  }
LABEL_12:

}

- (void)_updateIndicatorViewForSensorType:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  id v7;

  v5 = -[CBRecordingIndicatorManager _indicatorTypeForSensorType:](self, "_indicatorTypeForSensorType:");
  -[CBRecordingIndicatorViewController updateIndicatorType:](self->_recordingIndicatorViewController, "updateIndicatorType:", v5);
  -[CBRecordingIndicatorViewController updateIndicatorType:](self->_recordingIndicatorViewControllerUIKitStatusBarPortal, "updateIndicatorType:", v5);
  -[CBRecordingIndicatorViewController updateIndicatorType:](self->_recordingIndicatorViewControllerSystemAperturePortal, "updateIndicatorType:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorManager _indicatorIdentifierForSensorType:](self, "_indicatorIdentifierForSensorType:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorViewController indicatorView](self->_recordingIndicatorViewController, "indicatorView"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", v7);

}

- (void)recordingIndicatorViewController:(id)a3 didUpdateIndicatorState:(unint64_t)a4
{
  CBRecordingIndicatorViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  CBRecordingIndicatorViewController *v12;

  v5 = (CBRecordingIndicatorViewController *)a3;
  v12 = v5;
  if (self->_recordingIndicatorViewControllerSystemAperturePortal == v5)
  {
    -[CBRecordingIndicatorManager _updateSystemApertureElementAssertion](self, "_updateSystemApertureElementAssertion");
    v5 = v12;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorViewController viewIfLoaded](v5, "viewIfLoaded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitCollection"));
  v10 = objc_msgSend(v9, "_backlightLuminance");

  if (v10 == (id)1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_backlightSceneEnvironment"));
    objc_msgSend(v11, "invalidateAllTimelinesForReason:", CFSTR("recording indicator visibility change"));

  }
}

- (void)_updateSystemApertureElementAssertion
{
  -[CBRecordingIndicatorManager _updateRecordingIndicatorLocationIfNecessary](self, "_updateRecordingIndicatorLocationIfNecessary");
}

- (void)activityDidChangeForSensorActivityDataProvider:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeCameraAndMicrophoneActivityAttributions"));
  if (!-[NSSet isEqualToSet:](self->_activeCameraAndMicrophoneActivityAttributions, "isEqualToSet:", v5))
  {
    objc_storeStrong((id *)&self->_activeCameraAndMicrophoneActivityAttributions, v5);
    v6 = CheckerBoardLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Active camera/microphone activity changed:\n%{public}@", (uint8_t *)&v8, 0xCu);
    }

    -[CBRecordingIndicatorManager _dataProviderDidUpdate:](self, "_dataProviderDidUpdate:", v4);
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  id v6;
  CBRecordingIndicatorManager *v7;
  uint64_t v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBRecordingIndicatorDomain rootSettings](CBRecordingIndicatorDomain, "rootSettings", a3, a4));
  v6 = objc_msgSend(v5, "sensorType");

  if (v6 == (id)1)
  {
    self->_visibilityIsForcedByPrototypeSettings = 1;
    -[CBRecordingIndicatorManager setIndicatorVisible:](self, "setIndicatorVisible:", 1);
    v7 = self;
    v8 = 0;
    goto LABEL_5;
  }
  if (v6 == (id)2)
  {
    self->_visibilityIsForcedByPrototypeSettings = 1;
    -[CBRecordingIndicatorManager setIndicatorVisible:](self, "setIndicatorVisible:", 1);
    v7 = self;
    v8 = 1;
LABEL_5:
    -[CBRecordingIndicatorManager _updateIndicatorViewForSensorType:](v7, "_updateIndicatorViewForSensorType:", v8);
    return;
  }
  self->_visibilityIsForcedByPrototypeSettings = 0;
  -[CBRecordingIndicatorManager setIndicatorVisible:](self, "setIndicatorVisible:", 0);
}

- (BOOL)isIndicatorVisible
{
  return self->_indicatorVisible;
}

- (BOOL)isIndicatorVisibleAtStatusBarLocation
{
  return self->_indicatorVisibleAtStatusBarLocation;
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (NSSet)activeCameraAndMicrophoneActivityAttributions
{
  return self->_activeCameraAndMicrophoneActivityAttributions;
}

- (void)setActiveCameraAndMicrophoneActivityAttributions:(id)a3
{
  objc_storeStrong((id *)&self->_activeCameraAndMicrophoneActivityAttributions, a3);
}

- (BOOL)systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden
{
  return self->_systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden;
}

- (void)setSystemApertureIsSoLargeThatTheStatusBarIsProbablyHidden:(BOOL)a3
{
  self->_systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden = a3;
}

- (BOOL)isSystemApertureEmpty
{
  return self->_systemApertureEmpty;
}

- (void)setSystemApertureEmpty:(BOOL)a3
{
  self->_systemApertureEmpty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCameraAndMicrophoneActivityAttributions, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_minimumTimeOnScreenTimer, 0);
  objc_storeStrong((id *)&self->_indicatorDisplayTime, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorViewControllerSystemAperturePortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorViewControllerUIKitStatusBarPortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorViewController, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorWindowSystemAperturePortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorWindowUIKitStatusBarPortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorWindow, 0);
}

@end
