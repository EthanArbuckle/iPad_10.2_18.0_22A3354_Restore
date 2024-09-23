void sub_100004218(id a1, FAFamilyCircle *a2, NSError *a3)
{
  FAFamilyCircle *v3;
  _QWORD block[4];
  FAFamilyCircle *v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004290;
  block[3] = &unk_100008248;
  v5 = a2;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100004290(uint64_t a1)
{
  id v1;

  v1 = objc_msgSend(objc_alloc((Class)FACacheImageMarqueeOperationWrapper), "initWithFamilyCircle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v1, "createAndCacheData");

}

void sub_100004508(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];

  v3 = a2;
  v4 = objc_msgSend(v3, "loadSuccess");
  v5 = (int)v4;
  v8 = _FALogSystem(v4, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_100004F4C(v10);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_100004F8C(v3, v10);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000045D4;
  block[3] = &unk_100008248;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_1000045D4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_destroyCurrentSceneSession");
}

void sub_10000466C(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  NSError *v8;

  v2 = a2;
  v5 = _FALogSystem(v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error destroying sceneSession: %@", (uint8_t *)&v7, 0xCu);
  }

}

void sub_10000494C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
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
  v8 = UIApplicationMain(a1, a2, 0, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_100004D88(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to connect to the session.", v1, 2u);
}

void sub_100004DC8()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100004934();
  sub_10000494C((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unable to handle aaaction (%{public}@) with components: %{private}@", v1);
}

void sub_100004E34(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "scheme"));
  v6 = 138543619;
  v7 = v4;
  v8 = 2113;
  v9 = a1;
  sub_10000494C((void *)&_mh_execute_header, a2, v5, "Received unsupported scheme (%{public}@) from url: %{private}@", (uint8_t *)&v6);

}

void sub_100004ED8()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100004934();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Handling event type (%{public}@) with components: %{private}@", v1, 0x16u);
}

void sub_100004F4C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Successfully performed circle operation!", v1, 2u);
}

void sub_100004F8C(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to perform circle operation, error: %{public}@", (uint8_t *)&v4, 0xCu);

}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLContexts");
}

id objc_msgSend__currentSceneSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentSceneSession");
}

id objc_msgSend__handleFamilyURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleFamilyURL:");
}

id objc_msgSend__handleFamilyURLComponents_eventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleFamilyURLComponents:eventType:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
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

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createAndCacheData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAndCacheData");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_fa_queryItemsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fa_queryItemsDictionary");
}

id objc_msgSend_fa_valueForQueryItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fa_valueForQueryItem:");
}

id objc_msgSend_initWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBool:");
}

id objc_msgSend_initWithEventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventType:");
}

id objc_msgSend_initWithFamilyCircle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFamilyCircle:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithPresenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPresenter:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftAnchor");
}

id objc_msgSend_loadSuccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadSuccess");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_openSessions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSessions");
}

id objc_msgSend_performWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performWithContext:completion:");
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestSceneSessionDestruction:options:errorHandler:");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_scene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scene");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAdditionalParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditionalParameters:");
}

id objc_msgSend_setCachePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachePolicy:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_startRequestWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRequestWithCompletionHandler:");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windows");
}
