void sub_1000044C4(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  unsigned int v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  id v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers();
  v13 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = objc_msgSend(v9, "isAuthenticated");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a2));
    v20 = 138413058;
    v21 = v9;
    v22 = 1024;
    v23 = v15;
    v24 = 2112;
    v25 = v16;
    v26 = 2112;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "RemoteAlert: authentication result: localPlayer=%@\nisAuthenticated=%d\nresult=%@\nerror=%@", (uint8_t *)&v20, 0x26u);

  }
  if (a2 == 2)
  {
    if (!os_log_GKGeneral)
      v17 = (id)GKOSLoggers();
    v18 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "RemoteAlert: Need to show the GreenBuddy flow", (uint8_t *)&v20, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setNeedToShowGreenBuddy:", 1);
  }
  v19 = *(_QWORD *)(a1 + 40);
  if (v19)
    (*(void (**)(void))(v19 + 16))();

}

void sub_100004B10(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_remoteViewControllerProxy"));
    objc_msgSend(v4, "invalidate");

  }
  else
  {
    objc_msgSend(v3, "dismissExistingAndInvokeDashboardWithHostPID:game:byPassPreAuthentication:deepLink:launchContext:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 68), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

void sub_100004D64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  if (objc_msgSend(v7, "isEqualToString:", GKRemoteUIErrorDomain))
  {
    v8 = objc_msgSend(v6, "code");

    if (v8 && v5)
      goto LABEL_4;
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_7;
  }

  if (!v5)
    goto LABEL_6;
LABEL_4:
  v9 = objc_msgSend(objc_alloc((Class)GKRemoteUINavigationController), "initWithRemoteUIController:", v5);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  objc_msgSend(v9, "setModalInPresentation:", 1);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100004EA8;
  v15 = &unk_100008278;
  v10 = *(id *)(a1 + 40);
  v16 = v9;
  v17 = v10;
  v11 = v9;
  objc_msgSend(v5, "setCompletionHandler:", &v12);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v11, 1, 0, v12, v13, v14, v15);

LABEL_7:
}

void sub_100004EA8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if ((objc_msgSend(a2, "isServerAuthenticated") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 2, 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayer local](GKLocalPlayer, "local"));
    objc_msgSend(v4, "authenticationDidCompleteWithError:", v3);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayer local](GKLocalPlayer, "local"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100004FC0;
    v8[3] = &unk_100008250;
    v6 = *(id *)(a1 + 40);
    v9 = v3;
    v10 = v6;
    v7 = v3;
    objc_msgSend(v5, "signOutWithCompletionHandler:", v8);

  }
}

uint64_t sub_100004FC0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id sub_100005104(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeDashboardWithHostPID:game:byPassPreAuthentication:deepLink:launchContext:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 68), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void sub_100005304(id a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "utilityServicePrivate"));
  objc_msgSend(v1, "notifyRemoteAlertCompletedPresentingDashboard");

}

void sub_100005454(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v2, "deactivate");
  objc_msgSend(*(id *)(a1 + 32), "setGameCenterViewController:", 0);

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

void sub_10000556C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "RemoteAlert: Could not launch the remote alert dashboard due to the unauthenticated local player", v1, 2u);
}

void sub_1000055AC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "RemoteAlert: Failed deserializing the game data with error=%@", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountRemoteUIControllerForPlayer:mode:url:postBody:completionHandler:");
}

id objc_msgSend_authenticateWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticateWithCompletionHandler:");
}

id objc_msgSend_authenticationDidCompleteWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationDidCompleteWithError:");
}

id objc_msgSend_authenticatorForPlayerWithUsername_password_withPresentingViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticatorForPlayerWithUsername:password:withPresentingViewController:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_contextCanBypassAuthentication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextCanBypassAuthentication:");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_deserializeGameFromData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deserializeGameFromData:");
}

id objc_msgSend_dismissExistingAndInvokeDashboardWithHostPID_game_byPassPreAuthentication_deepLink_launchContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissExistingAndInvokeDashboardWithHostPID:game:byPassPreAuthentication:deepLink:launchContext:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_gameCenterViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gameCenterViewController");
}

id objc_msgSend_initWithGame_hostPID_restrictionMode_deeplink_launchContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithGame:hostPID:restrictionMode:deeplink:launchContext:");
}

id objc_msgSend_initWithInternalRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInternalRepresentation:");
}

id objc_msgSend_initWithRemoteUIController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRemoteUIController:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invokeDashboardWithHostPID_game_byPassPreAuthentication_deepLink_launchContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invokeDashboardWithHostPID:game:byPassPreAuthentication:deepLink:launchContext:");
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAuthenticated");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isServerAuthenticated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isServerAuthenticated");
}

id objc_msgSend_local(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "local");
}

id objc_msgSend_needToShowGreenBuddy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needToShowGreenBuddy");
}

id objc_msgSend_notifyRemoteAlertCompletedPresentingDashboard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyRemoteAlertCompletedPresentingDashboard");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_proxyForLocalPlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyForLocalPlayer");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDismissalAnimationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalAnimationStyle:");
}

id objc_msgSend_setGameCenterDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGameCenterDelegate:");
}

id objc_msgSend_setGameCenterViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGameCenterViewController:");
}

id objc_msgSend_setModalInPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalInPresentation:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNeedToShowGreenBuddy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedToShowGreenBuddy:");
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwipeDismissalStyle:");
}

id objc_msgSend_showGreenBuddyWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showGreenBuddyWithCompletionHandler:");
}

id objc_msgSend_signOutWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signOutWithCompletionHandler:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_userErrorForCode_underlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userErrorForCode:underlyingError:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_utilityServicePrivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utilityServicePrivate");
}
