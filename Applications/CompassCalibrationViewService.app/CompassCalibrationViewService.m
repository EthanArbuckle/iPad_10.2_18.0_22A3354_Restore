int main(int argc, const char **argv, const char **envp)
{
  void *v5;

  v5 = objc_autoreleasePoolPush();
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, 0, 0);
  objc_autoreleasePoolPop(v5);
  return (int)argv;
}

void sub_100002058(id a1, int a2)
{
  +[CalibrationViewServiceController dismissCalibrationAlert](CalibrationViewServiceController, "dismissCalibrationAlert");
}

void sub_100002248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002270(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "setMotion:", v5);
    if (objc_msgSend(v4[1], "circleIsCompleted"))
      objc_msgSend(v4, "finishedCalibrating");
  }

}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animation");
}

id objc_msgSend_calibrationViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calibrationViewController");
}

id objc_msgSend_circleIsCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "circleIsCompleted");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissCalibrationAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissCalibrationAlert");
}

id objc_msgSend_finishedCalibrating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedCalibrating");
}

id objc_msgSend_initWithEffectiveBundlePath_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffectiveBundlePath:delegate:onQueue:");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationManager");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_maximumTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumTimer");
}

id objc_msgSend_minimumTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumTimer");
}

id objc_msgSend_motionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "motionManager");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeviceMotionUpdateInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceMotionUpdateInterval:");
}

id objc_msgSend_setMaximumTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumTimer:");
}

id objc_msgSend_setMinimumTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumTimer:");
}

id objc_msgSend_setMotion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMotion:");
}

id objc_msgSend_setNeedsUpdateOfSupportedInterfaceOrientations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

id objc_msgSend_startDeviceMotionUpdatesUsingReferenceFrame_toQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:");
}

id objc_msgSend_startUpdatingHeading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startUpdatingHeading");
}

id objc_msgSend_stopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopDeviceMotionUpdates");
}

id objc_msgSend_stopUpdatingHeading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopUpdatingHeading");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowScene");
}
