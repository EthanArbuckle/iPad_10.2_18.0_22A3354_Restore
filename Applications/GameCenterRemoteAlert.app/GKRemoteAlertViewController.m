@implementation GKRemoteAlertViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers();
  v9 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoteAlertViewController gameCenterViewController](self, "gameCenterViewController"));
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "RemoteAlert: configureWithContext: %@\ngameCenterViewController=%@", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v12, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v12, "setAllowsAlertStacking:", 1);
  objc_msgSend(v12, "setSwipeDismissalStyle:", 1);
  objc_msgSend(v12, "setDismissalAnimationStyle:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayerAuthenticator authenticatorForPlayerWithUsername:password:withPresentingViewController:](GKLocalPlayerAuthenticator, "authenticatorForPlayerWithUsername:password:withPresentingViewController:", 0, 0, self));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000044C4;
  v15[3] = &unk_100008200;
  v15[4] = self;
  v16 = v7;
  v14 = v7;
  objc_msgSend(v13, "authenticateWithCompletionHandler:", v15);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void (**v15)(_QWORD);
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  NSObject *v38;
  void (**v39)(_QWORD);
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  int v44;
  BOOL v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  unsigned int v51;
  __int16 v52;
  void *v53;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers();
  v9 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayer local](GKLocalPlayer, "local"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayer local](GKLocalPlayer, "local"));
    v14 = objc_msgSend(v13, "isAuthenticated");
    v15 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoteAlertViewController gameCenterViewController](self, "gameCenterViewController"));
    *(_DWORD *)buf = 138413058;
    v47 = v11;
    v48 = 2112;
    v49 = v12;
    v50 = 1024;
    v51 = v14;
    v52 = 2112;
    v53 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "RemoteAlert: prepareForActivationWithContext: userInfo=%@\nlocalPlayer=%@\nisAuthenticated=%d\ngameCenterViewController=%@", buf, 0x26u);

    v7 = v15;
  }
  if (MKBGetDeviceLockState(0) - 1 > 1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v21 = -[GKRemoteAlertViewController contextCanBypassAuthentication:](self, "contextCanBypassAuthentication:", v20);

    if (!v21)
    {
      v22 = objc_claimAutoreleasedReturnValue(+[GKLocalPlayer local](GKLocalPlayer, "local"));
      if (!v22
        || (v23 = (void *)v22,
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayer local](GKLocalPlayer, "local")),
            v25 = objc_msgSend(v24, "isAuthenticated"),
            v24,
            v23,
            (v25 & 1) == 0))
      {
        if (!os_log_GKGeneral)
          v37 = (id)GKOSLoggers();
        v38 = os_log_GKError;
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        {
          sub_10000556C(v38);
          if (!v7)
            goto LABEL_25;
        }
        else if (!v7)
        {
          goto LABEL_25;
        }
        v7[2](v7);
        goto LABEL_25;
      }
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo", v7));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", GKRemoteAlertUserInfoSerializedGameKey));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", GKRemoteAlertUserInfoDeeplinkKey));

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", GKRemoteAlertUserInfoDashboardLaunchContextKey));

    v32 = (void *)v27;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoteAlertViewController deserializeGameFromData:](self, "deserializeGameFromData:", v27));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", GKRemoteAlertUserInfoHostPIDKey));
    v36 = objc_msgSend(v35, "integerValue");

    if (-[GKRemoteAlertViewController needToShowGreenBuddy](self, "needToShowGreenBuddy"))
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100004B10;
      v40[3] = &unk_100008228;
      v40[4] = self;
      v44 = (int)v36;
      v41 = v33;
      v45 = v21;
      v42 = v29;
      v43 = v31;
      -[GKRemoteAlertViewController showGreenBuddyWithCompletionHandler:](self, "showGreenBuddyWithCompletionHandler:", v40);
      -[GKRemoteAlertViewController setNeedToShowGreenBuddy:](self, "setNeedToShowGreenBuddy:", 0);

    }
    else
    {
      -[GKRemoteAlertViewController dismissExistingAndInvokeDashboardWithHostPID:game:byPassPreAuthentication:deepLink:launchContext:](self, "dismissExistingAndInvokeDashboardWithHostPID:game:byPassPreAuthentication:deepLink:launchContext:", v36, v33, v21, v29, v31);
    }
    v7 = v39;
    if (v39)
      v39[2](v39);

  }
  else
  {
    if (!os_log_GKGeneral)
      v17 = (id)GKOSLoggers();
    v18 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "RemoteAlert: Not going to show the remote alert because the device is locked.", buf, 2u);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    objc_msgSend(v19, "invalidate");

  }
LABEL_25:

}

- (void)handleButtonActions:(id)a3
{
  -[GKRemoteAlertViewController dismiss](self, "dismiss", a3);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)gameCenterViewControllerDidFinish:(id)a3
{
  -[GKRemoteAlertViewController dismiss](self, "dismiss", a3);
}

- (BOOL)contextCanBypassAuthentication:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", GKRemoteAlertUserInfoBypassPreAuthenticationKey));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)deserializeGameFromData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v11;

  v3 = a3;
  v11 = 0;
  v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(GKGameInternal), v3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v6 = v11;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = (id)GKOSLoggers();
    v8 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1000055AC((uint64_t)v6, v8);
    v9 = 0;
  }
  else
  {
    v9 = objc_msgSend(objc_alloc((Class)GKGame), "initWithInternalRepresentation:", v5);
  }

  return v9;
}

- (void)showGreenBuddyWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayer local](GKLocalPlayer, "local"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004D64;
  v7[3] = &unk_1000082A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[GKAccountRemoteUIController accountRemoteUIControllerForPlayer:mode:url:postBody:completionHandler:](GKAccountRemoteUIController, "accountRemoteUIControllerForPlayer:mode:url:postBody:completionHandler:", v5, 1, 0, 0, v7);

}

- (void)dismissExistingAndInvokeDashboardWithHostPID:(int)a3 game:(id)a4 byPassPreAuthentication:(BOOL)a5 deepLink:(id)a6 launchContext:(id)a7
{
  _BOOL8 v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int v21;
  BOOL v22;

  v9 = a5;
  v10 = *(_QWORD *)&a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoteAlertViewController gameCenterViewController](self, "gameCenterViewController"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoteAlertViewController gameCenterViewController](self, "gameCenterViewController"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100005104;
    v17[3] = &unk_1000082C8;
    v17[4] = self;
    v21 = v10;
    v18 = v12;
    v22 = v9;
    v19 = v13;
    v20 = v14;
    objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 0, v17);

  }
  else
  {
    -[GKRemoteAlertViewController invokeDashboardWithHostPID:game:byPassPreAuthentication:deepLink:launchContext:](self, "invokeDashboardWithHostPID:game:byPassPreAuthentication:deepLink:launchContext:", v10, v12, v9, v13, v14);
  }

}

- (void)invokeDashboardWithHostPID:(int)a3 game:(id)a4 byPassPreAuthentication:(BOOL)a5 deepLink:(id)a6 launchContext:(id)a7
{
  _BOOL4 v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  v9 = a5;
  v10 = *(_QWORD *)&a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if (!os_log_GKGeneral)
    v15 = (id)GKOSLoggers();
  v16 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
    v23 = 138413314;
    v24 = v12;
    v25 = 2112;
    v26 = v18;
    v27 = 1024;
    v28 = v9;
    v29 = 2112;
    v30 = v13;
    v31 = 2112;
    v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "RemoteAlert: invokeDashboardWithHostPID: game=%@\n hostPID=%@\n byPassPreAuthentication=%d\n deeplink=%@\n launchContext=%@", (uint8_t *)&v23, 0x30u);

  }
  if (v9)
    v19 = 3;
  else
    v19 = 0;
  v20 = objc_msgSend(objc_alloc((Class)GKGameCenterViewController), "initWithGame:hostPID:restrictionMode:deeplink:launchContext:", v12, v10, v19, v13, v14);
  -[GKRemoteAlertViewController setGameCenterViewController:](self, "setGameCenterViewController:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoteAlertViewController gameCenterViewController](self, "gameCenterViewController"));
  objc_msgSend(v21, "setGameCenterDelegate:", self);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoteAlertViewController gameCenterViewController](self, "gameCenterViewController"));
  -[GKRemoteAlertViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, &stru_100008308);

}

- (void)dismiss
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self, a2);
  v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "RemoteAlert: Dismissing the remote alert dashboard", buf, 2u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005454;
  v7[3] = &unk_100008330;
  v7[4] = self;
  v5 = objc_retainBlock(v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoteAlertViewController presentedViewController](self, "presentedViewController"));
  if (v6)
    -[GKRemoteAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
  else
    ((void (*)(_QWORD *))v5[2])(v5);

}

- (GKGameCenterViewController)gameCenterViewController
{
  return self->_gameCenterViewController;
}

- (void)setGameCenterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_gameCenterViewController, a3);
}

- (BOOL)needToShowGreenBuddy
{
  return self->_needToShowGreenBuddy;
}

- (void)setNeedToShowGreenBuddy:(BOOL)a3
{
  self->_needToShowGreenBuddy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameCenterViewController, 0);
}

@end
