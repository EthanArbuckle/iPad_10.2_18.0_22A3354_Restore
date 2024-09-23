uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  objc_class *v8;
  NSString *v9;
  NSString *v10;
  uint64_t v11;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(UIApplication);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (objc_class *)objc_opt_class(AppDelegate);
  v9 = NSStringFromClass(v8);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
  v11 = UIApplicationMain(a1, a2, v7, v10);

  objc_autoreleasePoolPop(v4);
  return v11;
}

id sub_100001A00(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

void sub_100001D98(id a1)
{
  objc_msgSend(UIApp, "terminateWithSuccess");
}

id objc_msgSend__nearbyDevicesNavigationControllerDidDismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nearbyDevicesNavigationControllerDidDismiss");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__setupRemoteProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupRemoteProxy");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_dismissObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissObserver");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setDismissObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissObserver:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavigationController:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setWallpaperStyle_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallpaperStyle:withDuration:");
}

id objc_msgSend_setWallpaperTunnelActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallpaperTunnelActive:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
