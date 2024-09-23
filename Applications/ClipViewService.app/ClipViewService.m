void sub_100003C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003CBC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003CCC(uint64_t a1)
{

}

void sub_100003CD4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = sub_100003DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "App Clip request finished with error: %@", (uint8_t *)&v8, 0xCu);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

uint64_t sub_100003DCC()
{
  if (qword_10000D2F8 != -1)
    dispatch_once(&qword_10000D2F8, &stru_1000082A8);
  return qword_10000D2F0;
}

void sub_100003E0C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.ClipViewService", "ClipViewService");
  v2 = (void *)qword_10000D2F0;
  qword_10000D2F0 = (uint64_t)v1;

}

void sub_100003F24(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = sub_100003DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100004EB0((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void sub_100003FE8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForSetting:", 0));
  v3 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = v2;
    v21 = 0;
    v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(CPSLocationConfirmationRequest), v4, &v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = v21;
    if (v6)
    {
      v8 = objc_alloc_init((Class)UIViewController);
      objc_msgSend(v8, "setModalPresentationStyle:", 5);
      v9 = *(void **)(a1 + 40);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100004154;
      v18[3] = &unk_100008338;
      v18[4] = v9;
      v19 = v6;
      v20 = v8;
      v10 = v8;
      objc_msgSend(v9, "presentViewController:animated:completion:", v10, 1, v18);

    }
    else
    {
      v11 = sub_100003DCC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100004F18((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
    }

  }
}

void sub_100004154(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  id v9;
  id location;

  v2 = objc_msgSend(objc_alloc((Class)CPSLocationConsentViewController), "initWithRequest:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setModalPresentationStyle:", 2);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_100004260;
  v8 = &unk_100008310;
  objc_copyWeak(&v9, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setActionHandler:", &v5);
  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 1, 0, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void sub_100004240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004260(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissLocationContentViewControllerAnimated:response:", 1, a2);

}

void sub_100004350(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "canSendResponse"))
  {
    v2 = objc_alloc_init((Class)BSMutableSettings);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40)));
    objc_msgSend(v2, "setObject:forSetting:", v3, 0);

    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse responseWithInfo:](BSActionResponse, "responseWithInfo:", v2));
    objc_msgSend(v4, "sendResponse:", v5);

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = 0;

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v10, "dismiss");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = 0;

}

void sub_1000044EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(AppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

uint64_t sub_100004570()
{
  uint64_t v0;
  void *v2;
  __int128 v3;
  uint64_t v4;

  v2 = 0;
  if (!qword_10000D300)
  {
    v3 = off_1000083E8;
    v4 = 0;
    qword_10000D300 = _sl_dlopen(&v3, &v2);
  }
  v0 = qword_10000D300;
  if (!qword_10000D300)
    sub_100004F80(&v2);
  if (v2)
    free(v2);
  return v0;
}

void sub_1000048DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100004970(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc((Class)CPSLaunchContentViewController), "initWithURL:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:");
  return objc_msgSend(*(id *)(a1 + 32), "_displayLaunchContentViewController");
}

void sub_100004AF0(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = sub_100003DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100004EB0((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void sub_100004BA8(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = sub_100003DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100004FFC((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void sub_100004C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class sub_100004DE8(uint64_t a1)
{
  Class result;

  sub_100004570();
  result = objc_getClass("PRXFlowConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_1000050D8();
  qword_10000D308 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100004E3C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138739971;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received an invalid URL from NSUserActivity. %{sensitive}@", (uint8_t *)&v2, 0xCu);
}

void sub_100004EB0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000044EC((void *)&_mh_execute_header, a2, a3, "configureWithContext: error when configuring remote view controller proxy: %{public}@", a5, a6, a7, a8, 2u);
}

void sub_100004F18(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000044EC((void *)&_mh_execute_header, a2, a3, "Fail to decode location confirmation request with error: %@", a5, a6, a7, a8, 2u);
}

void sub_100004F80(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *ProxCardKitLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CPSAlertViewController.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_100004FFC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000044EC((void *)&_mh_execute_header, a2, a3, "configureWithContext: error when preparing remote view controller proxy: %{public}@", a5, a6, a7, a8, 2u);
}

void sub_100005064()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "UIInterfaceOrientationMask _PRXSupportedInterfaceOrientations(UIViewController *__strong, BOOL)"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSAlertViewController.m"), 23, CFSTR("%s"), dlerror());

  __break(1u);
}

void sub_1000050D8()
{
  void *v0;
  void *v1;
  Class v2;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getPRXFlowConfigurationClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSAlertViewController.m"), 22, CFSTR("Unable to find class %s"), "PRXFlowConfiguration");

  __break(1u);
  NSStringFromClass(v2);
}

id objc_msgSend__configureRemoteAlertWithSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureRemoteAlertWithSettings:");
}

id objc_msgSend__configureRemoteAlertWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureRemoteAlertWithURL:");
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismiss");
}

id objc_msgSend__dismissLocationContentViewControllerAnimated_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissLocationContentViewControllerAnimated:response:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__sourceApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sourceApplication");
}

id objc_msgSend__wp_urlByRemovingTrackingInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_wp_urlByRemovingTrackingInformation");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actions");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityType");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_canSendResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canSendResponse");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_cps_fallbackBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cps_fallbackBundleIdentifier");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultConfiguration");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deviceHasHomeButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceHasHomeButton");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dismissalInProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissalInProgress");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "info");
}

id objc_msgSend_initWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequest:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_launchContentViewControllerDidDisappear_didOpenClip_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchContentViewControllerDidDisappear:didOpenClip:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForSetting:");
}

id objc_msgSend_presentProxCardFlowWithDelegate_initialViewController_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentProxCardFlowWithDelegate:initialViewController:configuration:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_requestClipWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestClipWithCompletion:");
}

id objc_msgSend_responseForOpenClipAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseForOpenClipAction:");
}

id objc_msgSend_responseWithInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseWithInfo:");
}

id objc_msgSend_sendResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendResponse:");
}

id objc_msgSend_sessionProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionProxy");
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionHandler:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setLaunchReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchReason:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setObject_forSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forSetting:");
}

id objc_msgSend_setReachabilityDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReachabilityDisabled:");
}

id objc_msgSend_setReferrerBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReferrerBundleID:");
}

id objc_msgSend_setStatusBarHidden_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:withDuration:");
}

id objc_msgSend_setSupportsDarkMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsDarkMode:");
}

id objc_msgSend_setViewControllers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllers:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllers");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webpageURL");
}
