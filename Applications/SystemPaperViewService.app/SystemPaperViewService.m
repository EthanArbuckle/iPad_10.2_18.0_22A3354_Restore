id sub_100004A7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "teardown");
}

void sub_100004F8C(id a1, BOOL a2)
{
  if (!a2)
    sleep(1u);
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;

  v4 = objc_autoreleasePoolPush();
  v6 = (objc_class *)objc_opt_class(AppDelegate, v5);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  objc_autoreleasePoolPop(v4);
  v9 = UIApplicationMain(a1, a2, 0, v8);

  return v9;
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__setWindowInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setWindowInterfaceOrientation:");
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeInterfaceOrientation");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_allowsBackdropGroups(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowsBackdropGroups");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_didPresent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didPresent");
}

id objc_msgSend_didTeardown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didTeardown");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "events");
}

id objc_msgSend_extensionHostViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionHostViewController");
}

id objc_msgSend_hidesSourceLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hidesSourceLayer");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_matchesOpacity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchesOpacity");
}

id objc_msgSend_matchesPosition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchesPosition");
}

id objc_msgSend_matchesTransform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchesTransform");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "object");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_performExpiringActivityWithReason_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performExpiringActivityWithReason:usingBlock:");
}

id objc_msgSend_portalLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "portalLayer");
}

id objc_msgSend_presentSystemPaperWithUserActivityData_presentingViewController_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentSystemPaperWithUserActivityData:presentingViewController:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_setAllowsAlertItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertItems:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsBackdropGroups_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsBackdropGroups:");
}

id objc_msgSend_setAllowsBanners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsBanners:");
}

id objc_msgSend_setAllowsControlCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsControlCenter:");
}

id objc_msgSend_setAllowsSiri_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsSiri:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDidPresent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidPresent:");
}

id objc_msgSend_setDidTeardown_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidTeardown:");
}

id objc_msgSend_setHidesSourceLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidesSourceLayer:");
}

id objc_msgSend_setMatchesOpacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMatchesOpacity:");
}

id objc_msgSend_setMatchesPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMatchesPosition:");
}

id objc_msgSend_setMatchesTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMatchesTransform:");
}

id objc_msgSend_setSceneDeactivationReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSceneDeactivationReason:");
}

id objc_msgSend_setShouldDisableFadeInAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDisableFadeInAnimation:");
}

id objc_msgSend_setSourceContextId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceContextId:");
}

id objc_msgSend_setSourceLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceLayer:");
}

id objc_msgSend_setSourceLayerRenderId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceLayerRenderId:");
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwipeDismissalStyle:");
}

id objc_msgSend_setUserActivityData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserActivityData:");
}

id objc_msgSend_sourceContextId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceContextId");
}

id objc_msgSend_sourceLayerRenderId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceLayerRenderId");
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlackColor");
}

id objc_msgSend_teardown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teardown");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_userActivityData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userActivityData");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
