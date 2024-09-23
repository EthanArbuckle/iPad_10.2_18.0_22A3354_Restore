void sub_1000030E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003120(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismiss");

}

id sub_10000314C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

void sub_1000033D8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = sub_100003530();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TVAccessViewServiceViewController _dismiss", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v4, "dismiss");

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;

  v4 = objc_autoreleasePoolPush();
  v5 = UIApplicationMain(a1, a2, 0, 0);
  objc_autoreleasePoolPop(v4);
  return v5;
}

id sub_100003530()
{
  if (qword_100008280 != -1)
    dispatch_once(&qword_100008280, &stru_1000041E0);
  return (id)qword_100008278;
}

void sub_100003570(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.TVAccessViewService", "Default");
  v2 = (void *)qword_100008278;
  qword_100008278 = (uint64_t)v1;

}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismiss");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend_configureWithUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureWithUserInfo:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_initWithBundleIDs_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIDs:options:completionHandler:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsMenuButtonDismissal:");
}

id objc_msgSend_setModalPresentationCapturesStatusBarAppearance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationCapturesStatusBarAppearance:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setShouldDisableFadeInAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDisableFadeInAnimation:");
}

id objc_msgSend_setShouldDismissOnUILock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDismissOnUILock:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}
