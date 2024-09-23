void sub_10000504C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

id sub_100005558()
{
  if (qword_100017498 != -1)
    dispatch_once(&qword_100017498, &stru_100010378);
  return (id)qword_1000174A0;
}

void sub_100005598(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bannerSourceForPresentable:", *(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "requestIdentifier"));
  v3 = objc_msgSend(v4, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v2, CFSTR("done"), 1, &__NSDictionary0__struct, 0);

}

void sub_100005614(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create(WFLogSubsystem, "ViewServiceApplication");
  v2 = (void *)qword_1000174A0;
  qword_1000174A0 = (uint64_t)v1;

}

void sub_100005648(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_100005558();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[WFViewServiceApplication _handlePlatformSpecificActions:forScene:withTransitionContext:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s XPC connection interrupted", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(WeakRetained, "setActiveConnection:", 0);
}

void sub_100005708(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_100005558();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[WFViewServiceApplication _handlePlatformSpecificActions:forScene:withTransitionContext:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s XPC connection invalidated", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(WeakRetained, "setActiveConnection:", 0);
}

void sub_100006750(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "micaView"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_100006784(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "micaView"));
  objc_msgSend(v1, "setHidden:", 1);

}

id sub_1000067B8(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100006820;
  v2[3] = &unk_1000105B0;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.4);
}

void sub_100006820(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "micaView"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

id sub_100006854(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setProgressSuppressionState:", 3);
  return objc_msgSend(*(id *)(a1 + 32), "setProgressSuppressionTimer:", 0);
}

id sub_100006884(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  id result;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "updateMicaViewState");
  v2 = *(_QWORD *)(a1 + 40) != 4;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cancelButton"));
  objc_msgSend(v3, "setHidden:", v2);

  result = objc_msgSend(*(id *)(a1 + 32), "progressSuppressionState");
  if (result != (id)3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "activeLayoutMode") == (id)4)
    {
      v5 = 0;
      v6 = 1;
    }
    else
    {
      v5 = 1;
      v6 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 32), "setMicaViewHidden:animated:", v5, v6);
  }
  return result;
}

id sub_100006920(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLastKnownProgressValue:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "updateMicaViewState");
}

id sub_10000694C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGColor"));
}

id sub_1000076E8()
{
  if (qword_1000174A8 != -1)
    dispatch_once(&qword_1000174A8, &stru_100010458);
  return (id)qword_1000174B0;
}

void sub_100007728(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "compactViewController"));
  objc_msgSend(v2, "dismissPersistentChromeWithSuccess:customAttribution:completionHandler:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void sub_10000776C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create(WFLogSubsystem, "RemoteAlert");
  v2 = (void *)qword_1000174B0;
  qword_1000174B0 = (uint64_t)v1;

}

void sub_1000077A0(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "compactViewController"));
  objc_msgSend(v2, "dismissPresentedContentWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

void sub_1000077E0(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "compactViewController"));
  objc_msgSend(v2, "handleRequest:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void sub_100007820(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "compactViewController"));
  objc_msgSend(v2, "preparePersistentChromeWithContext:attribution:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

id sub_100007860(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000078B4;
  v3[3] = &unk_1000105B0;
  v3[4] = v1;
  return objc_msgSend(v1, "dismissPresentedContentWithCompletionHandler:", v3);
}

id sub_1000078B4(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007910;
  v3[3] = &unk_1000105B0;
  v3[4] = v1;
  return objc_msgSend(v1, "dismissPersistentChromeWithSuccess:customAttribution:completionHandler:", 0, 0, v3);
}

void sub_100007910(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "xpcConnection"));
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "remoteObjectProxy"));

  objc_msgSend(v2, "requestDismissalWithReason:", WFViewServiceDismissalReasonUserCancelledWithHomeButton);
}

void sub_100007968(id a1)
{
  id v1;
  NSObject *v2;
  int v3;
  const char *v4;

  v1 = sub_1000076E8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[WFRemoteAlertViewController configureWithContext:completion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s XPC connection invalidated", (uint8_t *)&v3, 0xCu);
  }

}

void sub_100007A0C(id a1)
{
  id v1;
  NSObject *v2;
  int v3;
  const char *v4;

  v1 = sub_1000076E8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[WFRemoteAlertViewController configureWithContext:completion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s XPC connection interrupted", (uint8_t *)&v3, 0xCu);
  }

}

uint64_t start(int a1, char **a2)
{
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  uint64_t v7;

  +[WFInitialization initializeProcessWithDatabase:](WFInitialization, "initializeProcessWithDatabase:", 0);
  v4 = (objc_class *)objc_opt_class(WFViewServiceApplication);
  v5 = NSStringFromClass(v4);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(v5);
  v7 = UIApplicationMain(a1, a2, v6, 0);

  return v7;
}

void sub_100008D60(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "activeLayoutMode") == (id)4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setOverrideLayoutMode:", 3);
    v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "systemApertureElementContext"));
    objc_msgSend(v2, "requestTransitionToPreferredLayoutMode");

  }
}

void sub_100008DC8(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progress"));
  objc_msgSend(v2, "fractionCompleted");
  objc_msgSend(v3, "updateProgressWithValue:");

}

id sub_100008E20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void sub_100008E28(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setInitialPresentationTransitioning:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingDelayedAttribution"));

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pendingDelayedAttribution"));
    objc_msgSend(v3, "setAttribution:", v4);

    objc_msgSend(*(id *)(a1 + 32), "setPendingDelayedAttribution:", 0);
  }
}

void sub_100009364(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAwaitingIconOwnershipSwap:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "systemApertureElementContext"));
  objc_msgSend(v2, "setElementNeedsUpdate");

}

void sub_1000093AC(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "systemApertureElementContext"));
  objc_msgSend(v1, "setElementNeedsUpdate");

}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_SBUISA_systemApertureObstructedAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SBUISA_systemApertureObstructedAreaLayoutGuide");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__defaultAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultAttributes");
}

id objc_msgSend__firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_firstBaselineOffsetFromTop");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend_actionInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionInterface");
}

id objc_msgSend_actionInterfaceListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionInterfaceListener");
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_activeConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeConnection");
}

id objc_msgSend_activeLayoutMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeLayoutMode");
}

id objc_msgSend_addAction_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:forControlEvents:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appBundleIdentifier");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attribution(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attribution");
}

id objc_msgSend_awaitingIconOwnershipSwap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "awaitingIconOwnershipSwap");
}

id objc_msgSend_bannerSourceForDestination_forRequesterIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerSourceForDestination:forRequesterIdentifier:");
}

id objc_msgSend_bannerSourceForPresentable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerSourceForPresentable:");
}

id objc_msgSend_beginConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginConnection");
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_buttonWithConfiguration_primaryAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithConfiguration:primaryAction:");
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelButton");
}

id objc_msgSend_cancelPresentationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPresentationWithCompletionHandler:");
}

id objc_msgSend_collapseTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collapseTimer");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_compactViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compactViewController");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dismissPersistentChromeWithSuccess_customAttribution_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissPersistentChromeWithSuccess:customAttribution:completionHandler:");
}

id objc_msgSend_dismissPresentedContentWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissPresentedContentWithCompletionHandler:");
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayScale");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fractionCompleted");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_getRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRed:green:blue:alpha:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleRequest:completionHandler:");
}

id objc_msgSend_hasCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasCompleted");
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "icon");
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconView");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "info");
}

id objc_msgSend_initWithIcon_runningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIcon:runningContext:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithPackageName_inBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPackageName:inBundle:");
}

id objc_msgSend_initWithRunningContext_attribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRunningContext:attribution:");
}

id objc_msgSend_initWithScreenLocked_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithScreenLocked:delegate:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTintColor_runningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTintColor:runningContext:");
}

id objc_msgSend_initialPresentationTransitioning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialPresentationTransitioning");
}

id objc_msgSend_initializeProcessWithDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeProcessWithDatabase:");
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intrinsicContentSize");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isRunningFromActionButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunningFromActionButton");
}

id objc_msgSend_isTouchingDownButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTouchingDownButton");
}

id objc_msgSend_lastKnownProgressValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastKnownProgressValue");
}

id objc_msgSend_lastPresentedStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPresentedStatus");
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutFrame");
}

id objc_msgSend_leadingView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingView");
}

id objc_msgSend_micaView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "micaView");
}

id objc_msgSend_objectForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForSetting:");
}

id objc_msgSend_openURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:");
}

id objc_msgSend_overrideLayoutMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideLayoutMode");
}

id objc_msgSend_pendingDelayedAttribution(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingDelayedAttribution");
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plainButtonConfiguration");
}

id objc_msgSend_postOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postOptions");
}

id objc_msgSend_postPresentable_options_userInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postPresentable:options:userInfo:error:");
}

id objc_msgSend_preferredLayoutModeForRunningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLayoutModeForRunningContext:");
}

id objc_msgSend_preparePersistentChromeWithContext_attribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preparePersistentChromeWithContext:attribution:");
}

id objc_msgSend_previousLayoutMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousLayoutMode");
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryColor");
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progress");
}

id objc_msgSend_progressSuppressionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressSuppressionState");
}

id objc_msgSend_progressSuppressionTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressSuppressionTimer");
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressView");
}

id objc_msgSend_publishedObjectWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publishedObjectWithName:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_removeAction_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAction:forControlEvents:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_requestDismissalWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestDismissalWithReason:");
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestIdentifier");
}

id objc_msgSend_requestIdentifierForContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestIdentifierForContext:");
}

id objc_msgSend_requestTransitionToPreferredLayoutMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestTransitionToPreferredLayoutMode");
}

id objc_msgSend_requesterIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requesterIdentifier");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_revokePresentableWithRequestIdentifier_reason_animated_userInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_runKind(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runKind");
}

id objc_msgSend_runSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runSource");
}

id objc_msgSend_runningContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runningContext");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_setActiveConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveConnection:");
}

id objc_msgSend_setActiveLayoutMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveLayoutMode:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAssociatedRunningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssociatedRunningContext:");
}

id objc_msgSend_setAttribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttribution:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAwaitingIconOwnershipSwap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwaitingIconOwnershipSwap:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCancelAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelAction:");
}

id objc_msgSend_setCollapseTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCollapseTimer:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setElementNeedsUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setElementNeedsUpdate");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setHasCompleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasCompleted:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setIcon_associatedAppBundleIdentifier_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIcon:associatedAppBundleIdentifier:animated:");
}

id objc_msgSend_setInitialPresentationTransitioning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialPresentationTransitioning:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsTouchingDownButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsTouchingDownButton:");
}

id objc_msgSend_setLastKnownProgressValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastKnownProgressValue:");
}

id objc_msgSend_setMicaViewHidden_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMicaViewHidden:animated:");
}

id objc_msgSend_setMode_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMode:animated:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setOverrideLayoutMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverrideLayoutMode:");
}

id objc_msgSend_setPendingDelayedAttribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingDelayedAttribution:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setProgressSuppressionState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressSuppressionState:");
}

id objc_msgSend_setProgressSuppressionTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressSuppressionTimer:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeColor:");
}

id objc_msgSend_setStrokeStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeStart:");
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwipeDismissalStyle:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setWallpaperStyle_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallpaperStyle:withDuration:");
}

id objc_msgSend_setXpcConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcConnection:");
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedContext");
}

id objc_msgSend_startCollapseTimerIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCollapseTimerIfNecessary");
}

id objc_msgSend_statusViewControllerDidCollapseFromCustomLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusViewControllerDidCollapseFromCustomLayout:");
}

id objc_msgSend_statusViewControllerDidTransitionFromVisibleToCustomLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusViewControllerDidTransitionFromVisibleToCustomLayout:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_strokeColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strokeColor");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subviews");
}

id objc_msgSend_supportedInterfaceOrientations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedInterfaceOrientations");
}

id objc_msgSend_systemApertureElementContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemApertureElementContext");
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemWhiteColor");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_tintControlWithColor_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tintControlWithColor:animated:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_titleFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleFont");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_trailingView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingView");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_updateMicaViewState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMicaViewState");
}

id objc_msgSend_updateProgressWithValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateProgressWithValue:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_workflowIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workflowIdentifier");
}

id objc_msgSend_workflowStatusHostBeginConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workflowStatusHostBeginConnection");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEndpoint");
}
