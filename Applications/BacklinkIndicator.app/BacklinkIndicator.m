id sub_100002020()
{
  if (qword_10000E680 != -1)
    dispatch_once(&qword_10000E680, &stru_100008270);
  return (id)qword_10000E678;
}

void sub_100002060(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.BacklinkIndicator", "UI");
  v2 = (void *)qword_10000E678;
  qword_10000E678 = (uint64_t)v1;

}

void sub_100002760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000027A4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;

  v5 = a2;
  v6 = sub_100002020();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2048;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "background pip authorization: %@, state: %lu", (uint8_t *)&v9, 0x16u);
  }

  if (a3 == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_createPipProxyIfNeeded");

  }
}

void sub_100002920(id a1, PGMutablePlaybackState *a2)
{
  -[PGMutablePlaybackState setContentType:](a2, "setContentType:", 6);
}

void sub_100003094(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    v4 = sub_100002020();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100003D14(a1);

  }
}

void sub_100003234(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000335C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_100003940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100003B18(uint64_t a1)
{
  Class result;

  sub_100003B6C();
  result = objc_getClass("NPNotePreviewProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_100003ECC();
  qword_10000E688 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100003B6C()
{
  uint64_t v0;
  void *v2;
  __int128 v3;
  uint64_t v4;

  v2 = 0;
  if (!qword_10000E690)
  {
    v3 = off_100008348;
    v4 = 0;
    qword_10000E690 = _sl_dlopen(&v3, &v2);
  }
  v0 = qword_10000E690;
  if (!qword_10000E690)
    sub_100003F44(&v2);
  if (v2)
    free(v2);
  return v0;
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

void sub_100003C84(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userActivity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "_syLoggableDescription"));
  sub_100003258();
  sub_100003234((void *)&_mh_execute_header, v3, v4, "backlink indicator failed to show for user activity: %@, error: %@", v5, v6, v7, v8, v9);

  sub_100003248();
}

void sub_100003D14(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_syLoggableDescription"));
  sub_100003258();
  sub_100003234((void *)&_mh_execute_header, v2, v3, "failed to activate Notes with user activity: %@, error: %@", v4, v5, v6, v7, v8);

  sub_100003248();
}

void sub_100003D98()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSString *getNPNotePreviewKeyPreview(void)"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BacklinkIndicatorViewController.m"), 18, CFSTR("%s"), dlerror());

  __break(1u);
}

void sub_100003E0C(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userActivity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_syLoggableDescription"));
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "request to retrieve note preview for user activity: %@, failed with error: %@", (uint8_t *)&v7, 0x16u);

}

void sub_100003ECC()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getNPNotePreviewProviderClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BacklinkIndicatorViewController.m"), 17, CFSTR("Unable to find class %s"), "NPNotePreviewProvider");

  __break(1u);
}

void sub_100003F44(_QWORD *a1)
{
  void *v2;
  void *v3;
  Class v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *NotesPreviewKitLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BacklinkIndicatorViewController.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
  NSStringFromClass(v4);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__createPipProxyIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createPipProxyIfNeeded");
}

id objc_msgSend__pipSessionIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pipSessionIdentifier");
}

id objc_msgSend__showBacklinkIndicatorForUserActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showBacklinkIndicatorForUserActivity:");
}

id objc_msgSend__syIsBacklinkUserActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_syIsBacklinkUserActivity");
}

id objc_msgSend__syIsShowBacklinkIndicatorUserActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_syIsShowBacklinkIndicatorUserActivity");
}

id objc_msgSend__syLoggableDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_syLoggableDescription");
}

id objc_msgSend__syUserInfoDomainIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_syUserInfoDomainIdentifiers");
}

id objc_msgSend__syUserInfoLinkIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_syUserInfoLinkIdentifiers");
}

id objc_msgSend__updateUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateUI");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activateWithMetaActivity_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithMetaActivity:completion:");
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationState");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_backlinkIndicator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backlinkIndicator");
}

id objc_msgSend_backlinkIndicatorViewControllerDidReceiveTap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backlinkIndicatorViewControllerDidReceiveTap:");
}

id objc_msgSend_backlinkIndicatorViewControllerWillDismiss_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backlinkIndicatorViewControllerWillDismiss:");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedScenes");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hide");
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageView");
}

id objc_msgSend_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivitySessionIdentifier:appBundleIdentifier:stateTransitionHandler:");
}

id objc_msgSend_initWithControlsStyle_viewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithControlsStyle:viewController:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_isBacklinkIndicatorRequestForScene_continueUserActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBacklinkIndicatorRequestForScene:continueUserActivity:");
}

id objc_msgSend_isBacklinkIndicatorRequestForScene_willConnectToSession_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBacklinkIndicatorRequestForScene:willConnectToSession:options:");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_previewForUserActivity_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previewForUserActivity:error:");
}

id objc_msgSend_previewProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previewProvider");
}

id objc_msgSend_revoke(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revoke");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBacklinkIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBacklinkIndicator:");
}

id objc_msgSend_setClientSessionIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientSessionIdentifier:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImageView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageView:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUserActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserActivity:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_showWithUserActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showWithUserActivity:");
}

id objc_msgSend_stopPictureInPictureAndRestoreUserInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopPictureInPictureAndRestoreUserInterface:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_updatePlaybackStateUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePlaybackStateUsingBlock:");
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userActivities");
}

id objc_msgSend_userActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userActivity");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewIfLoaded");
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windows");
}
