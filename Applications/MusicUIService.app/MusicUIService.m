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
  v5 = (objc_class *)objc_opt_class(MusicUIServiceApplication);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (objc_class *)objc_opt_class(MusicUIServiceAppDelegate);
  v9 = NSStringFromClass(v8);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
  v11 = UIApplicationMain(a1, a2, v7, v10);

  objc_autoreleasePoolPop(v4);
  return v11;
}

void sub_10000547C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000054AC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cleanup");

}

void sub_1000054D8(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "customRowDidTap:", v3);

}

void sub_100005520(id a1, NSError *a2)
{
  int v3;
  NSError *v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error occured while atempting to retrive remote proxy to open connection: %@", (uint8_t *)&v3, 0xCu);
  }
}

id sub_100005614(uint64_t a1, void *a2)
{
  id result;
  uint8_t v4[16];

  result = objc_msgSend(a2, "events");
  if ((result & 0x10) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Dismissing view service due to home button event.", v4, 2u);
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "transitionToVisible:animated:", 0, 1);
  }
  return result;
}

void sub_1000057E4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "remoteViewController"));
  objc_msgSend(v2, "setConfiguration:", v1);

}

void sub_100005B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005B60(uint64_t a1)
{
  id WeakRetained;
  uint8_t v3[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "XPC connection to host app invalidated.", v3, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnection:", 0);

}

void sub_100005F34(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performSwitchToNowPlayingForBundleID:showNowPlaying:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

void sub_100006804(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  unsigned int v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "URL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("show-now-playing"));

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_switchToNowPlaying");
    *a3 = 1;
  }

}

void sub_100006AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006B14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  void *v33;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "processAssertion"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "processAssertion"));
      objc_msgSend(v8, "invalidate");

    }
    objc_msgSend(*(id *)(a1 + 32), "setAppHandle:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appHandle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", objc_msgSend(v9, "pid")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithProcessIdentifier:](RBSTarget, "targetWithProcessIdentifier:", v10));

    v12 = objc_alloc((Class)RBSAssertion);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.music"), CFSTR("MusicUIService")));
    v33 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
    v15 = objc_msgSend(v12, "initWithExplanation:target:attributes:", CFSTR("MusicUIService"), v11, v14);
    objc_msgSend(*(id *)(a1 + 32), "setProcessAssertion:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "processAssertion"));
    v26 = 0;
    LOBYTE(v15) = objc_msgSend(v16, "acquireWithError:", &v26);
    v17 = v26;

    if ((v15 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100007480((uint64_t)v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appHandle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "taskNameRight"));
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_100006E28;
    v24 = &unk_10000C2C0;
    objc_copyWeak(&v25, (id *)(a1 + 48));
    +[BSPortDeathSentinel monitorSendRight:withHandler:](BSPortDeathSentinel, "monitorSendRight:withHandler:", v19, &v21);

    objc_destroyWeak(&v25);
  }
  objc_msgSend(*(id *)(a1 + 32), "setLaunchRequested:", 0, v21, v22, v23, v24);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v28 = v20;
    v29 = 2114;
    v30 = v5;
    v31 = 2114;
    v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Open application completed. service:%{public}@, process:%{public}@, error:%{public}@", buf, 0x20u);
  }

}

void sub_100006E0C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100006E28(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006EA0;
  block[3] = &unk_10000C2C0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_100006EA0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAppHandle:", 0);
  objc_msgSend(WeakRetained, "_launchTargetAppIfNecessary");

}

void sub_100007480(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to acquire assertion. %{public}@", (uint8_t *)&v1, 0xCu);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_FBSScene");
}

id objc_msgSend__initWithFrame_debugName_windowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithFrame:debugName:windowScene:");
}

id objc_msgSend__isCarScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isCarScreen");
}

id objc_msgSend__keyWindowForScreen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_keyWindowForScreen:");
}

id objc_msgSend__launchTargetAppIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_launchTargetAppIfNecessary");
}

id objc_msgSend__performSwitchToNowPlayingForBundleID_showNowPlaying_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performSwitchToNowPlayingForBundleID:showNowPlaying:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend__switchToNowPlaying(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_switchToNowPlaying");
}

id objc_msgSend__userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_userInterfaceIdiom");
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationState");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_appEnvironmentWillDisconnect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appEnvironmentWillDisconnect:");
}

id objc_msgSend_appHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appHandle");
}

id objc_msgSend_appMustBeRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appMustBeRunning");
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIdentifier");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associatedBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedBundleID");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginGeneratingLibraryChangeNotifications");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanup");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_connectionWithEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionWithEndpoint:");
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentViewController");
}

id objc_msgSend_currentStack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentStack");
}

id objc_msgSend_customRowDidTap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customRowDidTap:");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultMediaLibrary");
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

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_environments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "environments");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "events");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierWithPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierWithPid:");
}

id objc_msgSend_initWithBundleID_stack_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleID:stack:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithStateContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStateContext:");
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

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_launchRequested(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchRequested");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_monitorSendRight_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorSendRight:withHandler:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "object");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_openConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openConnection");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_presentingAppBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingAppBundleID");
}

id objc_msgSend_processAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processAssertion");
}

id objc_msgSend_proxiedApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxiedApplicationBundleIdentifier");
}

id objc_msgSend_refreshNavigationStackForLaunch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshNavigationStackForLaunch");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_remoteViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteViewController");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_saveCurrentStack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCurrentStack");
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceWithDefaultShellEndpoint");
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityLabel:");
}

id objc_msgSend_setActiveWindow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveWindow:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsMenuButtonDismissal:");
}

id objc_msgSend_setAppHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppHandle:");
}

id objc_msgSend_setAppMustBeRunning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppMustBeRunning:");
}

id objc_msgSend_setAssociatedBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssociatedBundleID:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentViewController:");
}

id objc_msgSend_setCustomRowTappedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomRowTappedBlock:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegateClass:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDismissalAnimationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalAnimationStyle:");
}

id objc_msgSend_setDismissalBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalBlock:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLaunchRequested_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchRequested:");
}

id objc_msgSend_setNeedsFocusUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsFocusUpdate");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsStatusBarAppearanceUpdate");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOrientationChangedEventsEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrientationChangedEventsEnabled:");
}

id objc_msgSend_setProcessAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessAssertion:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScene:");
}

id objc_msgSend_setSceneDeactivationReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSceneDeactivationReason:");
}

id objc_msgSend_setStateName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateName:");
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwipeDismissalStyle:");
}

id objc_msgSend_setTappedCustomRowIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTappedCustomRowIdentifier:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settings");
}

id objc_msgSend_stateContextForNowPlaying(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateContextForNowPlaying");
}

id objc_msgSend_stateName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateName");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_switchToState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "switchToState:");
}

id objc_msgSend_targetWithProcessIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetWithProcessIdentifier:");
}

id objc_msgSend_taskNameRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskNameRight");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_transitionToVisible_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionToVisible:animated:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
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

id objc_msgSend_viewControllerForConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForConfiguration:");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEndpoint");
}
