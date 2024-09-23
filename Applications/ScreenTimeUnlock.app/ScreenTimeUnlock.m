uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;

  v4 = objc_autoreleasePoolPush();
  v5 = UIApplicationMain(a1, a2, 0, 0);
  objc_autoreleasePoolPop(v4);
  return v5;
}

void sub_100003D40(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
  objc_msgSend(v1, "openApplication:withOptions:completion:", CFSTR("com.apple.springboard"), 0, &stru_1000082B0);

}

void sub_100003D88(id a1, BSProcessHandle *a2, NSError *a3)
{
  BSProcessHandle *v4;
  NSError *v5;
  uint8_t v6[16];

  v4 = a2;
  v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100005190();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Returned to Springboard.", v6, 2u);
  }

}

void sub_100003FC8(id a1)
{
  NSLog(CFSTR("presented restrictions PIN controller"));
}

id sub_100004064(uint64_t a1)
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  return objc_msgSend(*(id *)(a1 + 32), "_restrictionsPINControllerDidDismiss:", 1);
}

uint64_t sub_100004180(uint64_t a1)
{
  uint64_t result;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_msgSend(*(id *)(a1 + 32), "_restrictionsPINControllerDidDismiss:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1000044DC(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;

  v2 = a2;
  v3 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100005258();

}

void sub_100004534(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000052B8();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Client completed with success", (uint8_t *)&v7, 0xCu);
  }

}

void sub_100004618(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;

  v2 = a2;
  v3 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100005258();

}

void sub_100004670(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000052B8();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Client completed with success", (uint8_t *)&v7, 0xCu);
  }

}

void sub_100004860(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;

  v2 = a2;
  v3 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100005258();

}

void sub_1000048B8(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  v3 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10000531C();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client completed with success", v5, 2u);
  }

}

void sub_100004950(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;

  v2 = a2;
  v3 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100005258();

}

void sub_1000049A8(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  v3 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10000531C();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client completed with success", v5, 2u);
  }

}

void sub_100004C24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004C48(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id sub_100004DA8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustToSuperviewFrame");
}

id sub_100004DB0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPrefersStatusBarHiddenOverride:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

void sub_100004EA8(id a1)
{
  id v1;

  v1 = (id)MGGetStringAnswer(CFSTR("DeviceClass"));
  byte_10000D348 = objc_msgSend(v1, "isEqualToString:", CFSTR("iPad"));

}

void sub_100005190()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100004C3C();
  sub_100004C24((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to return to Springboard: %{public}@", v1, v2, v3, v4, v5);
  sub_100004C34();
}

void sub_1000051F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C3C();
  sub_100004C24((void *)&_mh_execute_header, v0, v1, "%{public}@: Unable to provide pin to client: no connection", v2, v3, v4, v5, v6);
  sub_100004C34();
}

void sub_100005258()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C3C();
  sub_100004C24((void *)&_mh_execute_header, v0, v1, "Unable to connect to client: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C34();
}

void sub_1000052B8()
{
  uint64_t v0;
  os_log_t v1;

  sub_100004C5C();
  sub_100004C48((void *)&_mh_execute_header, v0, v1, "%{public}@: Client completed with error: %{public}@");
  sub_100004C34();
}

void sub_10000531C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C3C();
  sub_100004C24((void *)&_mh_execute_header, v0, v1, "Client completed with error: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C34();
}

void sub_10000537C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed validating restrictions PIN", v1, 2u);
}

id objc_msgSend__dismissPINControllerWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissPINControllerWithCompletionHandler:");
}

id objc_msgSend__freezeSupportedOrientations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_freezeSupportedOrientations");
}

id objc_msgSend__provideAuthenticationResultToClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_provideAuthenticationResultToClient:");
}

id objc_msgSend__providePINToClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_providePINToClient:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__restrictionsPINControllerDidDismiss_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restrictionsPINControllerDidDismiss:");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend_additionalParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "additionalParameters");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appearance");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_clientBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientBundleID");
}

id objc_msgSend_clientConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection");
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientName");
}

id objc_msgSend_contextWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextWithData:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissPinController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissPinController");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodedData");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventType");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithPasscode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPasscode:");
}

id objc_msgSend_initWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResult:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelColor");
}

id objc_msgSend_lastKnownSuperviewFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastKnownSuperviewFrame");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_passcodeMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeMode");
}

id objc_msgSend_postNotificationName_object_userInfo_deliverImmediately_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:deliverImmediately:");
}

id objc_msgSend_prefersStatusBarHiddenOverride(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefersStatusBarHiddenOverride");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_receivePasscode_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivePasscode:completionHandler:");
}

id objc_msgSend_receivePasscodeAuthenticationResult_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivePasscodeAuthenticationResult:completionHandler:");
}

id objc_msgSend_remoteViewService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteViewService");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceWithDefaultShellEndpoint");
}

id objc_msgSend_setClientConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientConnection:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setLastKnownSuperviewFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastKnownSuperviewFrame:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsStatusBarAppearanceUpdate");
}

id objc_msgSend_setPasscodeMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeMode:");
}

id objc_msgSend_setPinDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPinDelegate:");
}

id objc_msgSend_setPrefersStatusBarHiddenOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrefersStatusBarHiddenOverride:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setStyleOverridesToCancel_animationSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStyleOverridesToCancel:animationSettings:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_showRestrictionsPINControllerWithMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showRestrictionsPINControllerWithMode:");
}

id objc_msgSend_st_isPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "st_isPad");
}

id objc_msgSend_st_shouldAnimate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "st_shouldAnimate");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "success");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superview");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_validatePIN_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validatePIN:");
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

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEndpoint");
}
