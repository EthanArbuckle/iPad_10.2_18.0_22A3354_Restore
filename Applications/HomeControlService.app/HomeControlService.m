void sub_100002D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002D34(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dropInViewController"));
  objc_msgSend(v1, "beginAppearanceTransition:animated:", 1, 0);

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dropInViewController"));
  objc_msgSend(WeakRetained, "addChildViewController:", v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dropInViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v3, "addSubview:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dropInViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
  objc_msgSend(v16, "setFrame:", v8, v10, v12, v14);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dropInViewController"));
  objc_msgSend(v17, "didMoveToParentViewController:", WeakRetained);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dropInViewController"));
  objc_msgSend(v18, "endAppearanceTransition");

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(HCSAppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

void sub_100003990(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  v4 = HFLogForCategory(34);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100003ED8(a1, (uint64_t)v3, v5);

}

void sub_100003B30(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100003B54(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a2;
  if ((objc_msgSend(v3, "events") & 0x10) != 0)
  {
    v7 = HFLogForCategory(68);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Home button pressed.", buf, 2u);
    }

    v6 = *(_QWORD *)(a1 + 32);
    goto LABEL_9;
  }
  if ((objc_msgSend(v3, "events") & 1) != 0)
  {
    v4 = HFLogForCategory(68);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Lock button pressed.", v9, 2u);
    }

    v6 = *(_QWORD *)(a1 + 40);
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(v6 + 8) + 24) = 1;
  }

}

void sub_100003C48(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  objc_msgSend(v3, "visibleBounds");
  CGAffineTransformMakeTranslation(&v10, 0.0, -v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v9 = v10;
  objc_msgSend(v6, "setTransform:", &v9);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "setAlpha:", 0.0);

}

void sub_100003D1C(uint64_t a1, int a2)
{
  id v2;

  if (a2)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
    objc_msgSend(v2, "invalidate");

  }
}

void sub_100003E44(const char *a1, NSObject *a2)
{
  NSString *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@ Remote View Controller Proxy is nil, returning", (uint8_t *)&v5, 0xCu);

}

void sub_100003ED8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  NSString *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@ Remote View Service Error Handler called with error %@", (uint8_t *)&v7, 0x16u);

}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__layoutAnnounceViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_layoutAnnounceViewController");
}

id objc_msgSend__layoutDashboardViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_layoutDashboardViewController");
}

id objc_msgSend__layoutDropInViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_layoutDropInViewController");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__setupBackgroundViewWithBlurEffectStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupBackgroundViewWithBlurEffectStyle:");
}

id objc_msgSend__updateNavigationView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateNavigationView");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_announceRecordingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "announceRecordingViewController");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authorizeIfLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizeIfLocked");
}

id objc_msgSend_beginAppearanceTransition_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginAppearanceTransition:animated:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionView");
}

id objc_msgSend_configureHomeControlServiceWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureHomeControlServiceWithContext:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_dashboardNavigationView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dashboardNavigationView");
}

id objc_msgSend_dashboardViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dashboardViewController");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_disableNotificationsForSelectedHomeWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableNotificationsForSelectedHomeWithReason:");
}

id objc_msgSend_dropInViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dropInViewController");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_enableNotificationsForSelectedHomeWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableNotificationsForSelectedHomeWithReason:");
}

id objc_msgSend_endAppearanceTransition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endAppearanceTransition");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "events");
}

id objc_msgSend_executionEnvironmentDidEnterBackground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executionEnvironmentDidEnterBackground");
}

id objc_msgSend_executionEnvironmentWillEnterForeground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executionEnvironmentWillEnterForeground");
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_gradientLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gradientLayer");
}

id objc_msgSend_hf_keyColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_keyColor");
}

id objc_msgSend_hu_preloadContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hu_preloadContent");
}

id objc_msgSend_initWithAlertConfigurationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAlertConfigurationContext:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithServiceContext_blurEffectStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceContext:blurEffectStyle:");
}

id objc_msgSend_initWithServiceType_homeIdentifier_roomIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceType:homeIdentifier:roomIdentifier:");
}

id objc_msgSend_insertSubview_aboveSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSubview:aboveSubview:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAnIPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAnIPad");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMarginsGuide");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_lockAuthFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockAuthFuture");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_openSensitiveURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:");
}

id objc_msgSend_quickControlsPresentationDidUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "quickControlsPresentationDidUpdate:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reason");
}

id objc_msgSend_remoteViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteViewController");
}

id objc_msgSend_remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteViewControllerProxy");
}

id objc_msgSend_requestDismissal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestDismissal");
}

id objc_msgSend_runningState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runningState");
}

id objc_msgSend_serviceContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceContext");
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceType");
}

id objc_msgSend_setActivationReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivationReason:");
}

id objc_msgSend_setAllowsAlertItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertItems:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsBanners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsBanners:");
}

id objc_msgSend_setAllowsControlCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsControlCenter:");
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsMenuButtonDismissal:");
}

id objc_msgSend_setAllowsSiri_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsSiri:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAnnounceRecordingViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnnounceRecordingViewController:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setColors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColors:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setDashboardNavigationView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDashboardNavigationView:");
}

id objc_msgSend_setDashboardViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDashboardViewController:");
}

id objc_msgSend_setDefaultEffectiveBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultEffectiveBundleIdentifier:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDismissalAnimationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalAnimationStyle:");
}

id objc_msgSend_setDropInViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDropInViewController:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGradientLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGradientLayer:");
}

id objc_msgSend_setHasTitleAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasTitleAction:");
}

id objc_msgSend_setHeaderTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderTitle:");
}

id objc_msgSend_setHitTestsAsOpaque_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHitTestsAsOpaque:");
}

id objc_msgSend_setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimerDisabled:forReason:");
}

id objc_msgSend_setLocations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocations:");
}

id objc_msgSend_setLockAuthFuture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLockAuthFuture:");
}

id objc_msgSend_setLockAuthorizationDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLockAuthorizationDelegate:");
}

id objc_msgSend_setMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMask:");
}

id objc_msgSend_setQuickControlPresentationDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQuickControlPresentationDelegate:");
}

id objc_msgSend_setRemoteViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteViewController:");
}

id objc_msgSend_setRemoteViewControllerProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteViewControllerProxy:");
}

id objc_msgSend_setStatusBarHidden_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:withDuration:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setWallpaperStyle_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallpaperStyle:withDuration:");
}

id objc_msgSend_sharedDispatcher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDispatcher");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_visibleBounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleBounds");
}

id objc_msgSend_warmup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "warmup");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
