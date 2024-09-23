@implementation CBUserSettings

+ (id)sharedInstance
{
  if (qword_10008BC98 != -1)
    dispatch_once(&qword_10008BC98, &stru_100075478);
  return (id)qword_10008BC90;
}

- (CBUserSettings)init
{
  CBUserSettings *v2;
  uint64_t v3;
  NSObject *v4;
  CBSProxyServer *proxyServer;
  NSTimer *wifiReconnectTimer;
  NSString *wifiSSIDFromNvram;
  NSString *wifiPasswordFromNvram;
  uint64_t v9;
  CBRemoteSetupManager *remoteSetupManager;
  __int16 v12[8];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CBUserSettings;
  v2 = -[CBUserSettings init](&v13, "init");
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory(1);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating user settings keeper…", (uint8_t *)v12, 2u);
    }

    *(_WORD *)&v2->_checkedInWiFiSettings = 0;
    proxyServer = v2->_proxyServer;
    v2->_proxyServer = 0;

    wifiReconnectTimer = v2->_wifiReconnectTimer;
    v2->_wifiReconnectTimer = 0;
    v2->_wifiJoinAttemptCount = 0;

    wifiSSIDFromNvram = v2->_wifiSSIDFromNvram;
    v2->_wifiSSIDFromNvram = 0;

    wifiPasswordFromNvram = v2->_wifiPasswordFromNvram;
    v2->_wifiPasswordFromNvram = 0;

    v9 = objc_claimAutoreleasedReturnValue(+[CBRemoteSetupManager sharedInstance](CBRemoteSetupManager, "sharedInstance"));
    remoteSetupManager = v2->_remoteSetupManager;
    v2->_remoteSetupManager = (CBRemoteSetupManager *)v9;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBUserSettings wifiReconnectTimer](self, "wifiReconnectTimer"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBUserSettings wifiReconnectTimer](self, "wifiReconnectTimer"));
    objc_msgSend(v5, "invalidate");

    -[CBUserSettings setWifiReconnectTimer:](self, "setWifiReconnectTimer:", 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)CBUserSettings;
  -[CBUserSettings dealloc](&v6, "dealloc");
}

- (void)checkInWiFiSettings:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  unsigned int v9;
  _DWORD v10[2];

  v3 = a3;
  v5 = CheckerBoardLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Checking in user's Wi-Fi settings…", (uint8_t *)v10, 2u);
  }

  -[CBUserSettings setCheckedInWiFiSettings:](self, "setCheckedInWiFiSettings:", 1);
  -[CBUserSettings setWifiPowerStateOn:](self, "setWifiPowerStateOn:", v3);
  v7 = CheckerBoardLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[CBUserSettings wifiPowerStateOn](self, "wifiPowerStateOn");
    v10[0] = 67109120;
    v10[1] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User's Setting [Wi-Fi]: %d", (uint8_t *)v10, 8u);
  }

}

- (void)assignProxyServer:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = CheckerBoardLogHandleForCategory(11);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting proxy server..", v7, 2u);
  }

  -[CBUserSettings setProxyServer:](self, "setProxyServer:", v4);
}

- (void)applyPreUISettingsFromNvram
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  -[CBUserSettings _setDesiredUserDefaults](self, "_setDesiredUserDefaults");
  if (MGGetBoolAnswer(CFSTR("EqrsVvjcYDdxHBiQmGhAWw"), v3, v4))
  {
    -[CBUserSettings _setOverrideRemoteSetupPin](self, "_setOverrideRemoteSetupPin");
  }
  else
  {
    v5 = CheckerBoardLogHandleForCategory(1);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CheckerBoard is running on customer install. Ignoring remote setup pin override", v7, 2u);
    }

  }
}

- (void)applyPostUISettingsFromNvramWithNavigationController:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  if (+[CBUtilities isInternalInstall](CBUtilities, "isInternalInstall"))
  {
    v5 = dispatch_semaphore_create(0);
    -[CBUserSettings setDiagsLaunchDependenciesSemaphore:](self, "setDiagsLaunchDependenciesSemaphore:", v5);

    -[CBUserSettings _setLanguageFromNVRam](self, "_setLanguageFromNVRam");
    -[CBUserSettings _setWiFiFromNVRam](self, "_setWiFiFromNVRam");
    -[CBUserSettings _setSkipDiagsTermsAndConditionsFromNVRam](self, "_setSkipDiagsTermsAndConditionsFromNVRam");
    -[CBUserSettings _setAutoDiagsFromNVRamWithNavController:](self, "_setAutoDiagsFromNVRamWithNavController:", v4);
  }
  else
  {
    v6 = CheckerBoardLogHandleForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CheckerBoard is running on customer install. Ignoring automation assistance settings", v8, 2u);
    }

  }
}

- (void)_setDesiredUserDefaults
{
  void *v3;
  id v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  uint64_t v10;
  __int16 v11;
  uint8_t buf[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier")));
  v5 = os_variant_uses_ephemeral_storage(objc_msgSend(v4, "cStringUsingEncoding:", 4));

  if (v5)
  {
    -[CBUserSettings _disableContinousPath](self, "_disableContinousPath");
    if (-[CBUserSettings _isPermittedToUpdateASTDefaults](self, "_isPermittedToUpdateASTDefaults"))
    {
      -[CBUserSettings _updateASTDefaultsFromNVRam](self, "_updateASTDefaultsFromNVRam");
      return;
    }
    v10 = CheckerBoardLogHandleForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "Not permitted to update AST defaults";
      v9 = buf;
      goto LABEL_8;
    }
  }
  else
  {
    v6 = CheckerBoardLogHandleForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v8 = "CheckerBoard launched without ephemeral storage. Not altering user defaults";
      v9 = (uint8_t *)&v11;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }

}

- (void)_disableContinousPath
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.keyboard.ContinuousPath"));
  objc_msgSend(v2, "setBool:forKey:", 0, CFSTR("KeyboardContinuousPathEnabled"));
  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Disabled keyboard continuous path.", v5, 2u);
  }

}

- (BOOL)_isPermittedToUpdateASTDefaults
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unsigned int v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CBAPTicket sharedInstance](CBAPTicket, "sharedInstance"));
  v3 = objc_msgSend(v2, "isEntitledForTag:", 1633776739);

  v6 = MGGetBoolAnswer(CFSTR("a5BRUxn1QBPXkAnbAHbmeg"), v4, v5);
  v16 = 0;
  v7 = +[CBSNVRamUtil readNVRamVariable:value:](CBSNVRamUtil, "readNVRamVariable:value:", CFSTR("AlwaysEnforceAATCInCheckerBoard"), &v16);
  v8 = v16;
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10 || !objc_msgSend(v8, "length"))
  {
    v12 = 0;
  }
  else
  {
    v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v9, 4);
    v12 = objc_msgSend(v11, "BOOLValue");

  }
  v13 = CheckerBoardLogHandleForCategory(1);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    v18 = v3 | (v6 | v12) ^ 1;
    v19 = 1024;
    v20 = v3;
    v21 = 1024;
    v22 = v6;
    v23 = 1024;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Permitted to update AST Defaults: (%d). Entitled: (%d)  Fusing: (%d) Fusing Ignored: (%d)", buf, 0x1Au);
  }

  return v3 | (v6 | v12) ^ 1;
}

- (BOOL)shouldShowInfoPane
{
  if (qword_10008BCA8 != -1)
    dispatch_once(&qword_10008BCA8, &stru_100075498);
  return byte_10008BCA0;
}

- (void)_updateASTDefaultsFromNVRam
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  unsigned int v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint8_t buf[4];
  NSObject *v24;

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.AppleServiceToolkit"));
  v3 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.AppleServiceToolkit"), CFSTR("Server")));
  v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.AppleServiceToolkit"), CFSTR("CustomServerURL")));
  v22 = 0;
  v5 = +[CBSNVRamUtil readNVRamVariable:value:](CBSNVRamUtil, "readNVRamVariable:value:", v3, &v22);
  v6 = v22;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8 && objc_msgSend(v6, "length"))
  {
    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSObject integerValue](v9, "integerValue")));
    objc_msgSend(v2, "setValue:forKey:", v10, CFSTR("Server"));
    v11 = CheckerBoardLogHandleForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Set AST Server environment to %@", buf, 0xCu);
    }

    if (objc_msgSend(v10, "isEqualToNumber:", &off_100078BC0))
    {
      v21 = 0;
      v13 = +[CBSNVRamUtil readNVRamVariable:value:](CBSNVRamUtil, "readNVRamVariable:value:", v4, &v21);
      v14 = v21;
      v15 = v14;
      if (v13 && v14 && objc_msgSend(v14, "length"))
      {
        v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v15, 4);
        objc_msgSend(v2, "setValue:forKey:", v16, CFSTR("CustomServerURL"));
        v17 = CheckerBoardLogHandleForCategory(1);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Set AST Server URL to %@", buf, 0xCu);
        }

LABEL_20:
        goto LABEL_21;
      }
    }
    else
    {
      v15 = 0;
    }
    v20 = CheckerBoardLogHandleForCategory(1);
    v16 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to read value for %@ from nvram", buf, 0xCu);
    }
    goto LABEL_20;
  }
  v19 = CheckerBoardLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to read value for %@ from nvram", buf, 0xCu);
  }
LABEL_21:

}

- (void)_attemptConnectingToWifi
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008AE0;
  block[3] = &unk_1000753E8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_setLanguageFromNVRam
{
  unsigned int v2;
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;

  v10 = 0;
  v2 = +[CBSNVRamUtil readNVRamVariable:value:](CBSNVRamUtil, "readNVRamVariable:value:", CFSTR("cb-language"), &v10);
  v3 = v10;
  v4 = v3;
  v5 = 0;
  if (v2)
    v6 = v3 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    if (objc_msgSend(v3, "length"))
    {
      v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v4, 4);
      v7 = CheckerBoardLogHandleForCategory(1);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to change language to %@", buf, 0xCu);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBLocationController sharedLocationController](CBLocationController, "sharedLocationController"));
      objc_msgSend(v9, "selectLanguage:restartAfterCompletion:", v5, 0);

    }
    else
    {
      v5 = 0;
    }
  }

}

- (void)_setWiFiFromNVRam
{
  unsigned int v3;
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  id v14;
  id v15;

  v15 = 0;
  v3 = +[CBSNVRamUtil readNVRamVariable:value:](CBSNVRamUtil, "readNVRamVariable:value:", CFSTR("cb-wifi-ssid"), &v15);
  v4 = v15;
  v5 = v4;
  v6 = 0;
  if (v3)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (objc_msgSend(v4, "length"))
      v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, 4);
    else
      v6 = 0;
  }
  v14 = 0;
  v8 = +[CBSNVRamUtil readNVRamVariable:value:](CBSNVRamUtil, "readNVRamVariable:value:", CFSTR("cb-wifi-password"), &v14);
  v9 = v14;
  v10 = v9;
  v11 = 0;
  if (v8)
    v12 = v9 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    if (!objc_msgSend(v9, "length"))
    {
      v11 = 0;
      if (v6)
        goto LABEL_15;
LABEL_17:
      v13 = objc_claimAutoreleasedReturnValue(-[CBUserSettings diagsLaunchDependenciesSemaphore](self, "diagsLaunchDependenciesSemaphore"));
      dispatch_semaphore_signal(v13);

      goto LABEL_18;
    }
    v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v10, 4);
    -[CBUserSettings setWifiRequiresPassword:](self, "setWifiRequiresPassword:", v11 != 0);
  }
  if (!v6)
    goto LABEL_17;
LABEL_15:
  -[CBUserSettings setWifiSSIDFromNvram:](self, "setWifiSSIDFromNvram:", v6);
  -[CBUserSettings setWifiPasswordFromNvram:](self, "setWifiPasswordFromNvram:", v11);
  -[CBUserSettings _attemptConnectingToWifi](self, "_attemptConnectingToWifi");
LABEL_18:

}

- (void)_setSkipDiagsTermsAndConditionsFromNVRam
{
  unsigned int v2;
  id v3;
  void *v4;
  BOOL v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[8];
  id v15;

  v15 = 0;
  v2 = +[CBSNVRamUtil readNVRamVariable:value:](CBSNVRamUtil, "readNVRamVariable:value:", CFSTR("cb-skip-diags-terms-conditions"), &v15);
  v3 = v15;
  v4 = v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5 && objc_msgSend(v3, "length"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v4, 4);
    v7 = objc_msgSend(v6, "BOOLValue");

    v8 = CheckerBoardLogHandleForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Disabling Diagnostics T&Cs", buf, 2u);
    }

    v10 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.Diagnostics"));
    objc_msgSend(v10, "setBool:forKey:", v7, CFSTR("SkipTermsAndConditions"));
    v11 = CheckerBoardLogHandleForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Disabled Diagnostics Terms And Conditions.", v13, 2u);
    }

  }
}

- (void)_setAutoDiagsFromNVRamWithNavController:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  global_queue = dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009374;
  v8[3] = &unk_1000754E8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)_setOverrideRemoteSetupPin
{
  unsigned int v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;

  v12 = 0;
  v3 = +[CBSNVRamUtil readNVRamVariable:value:](CBSNVRamUtil, "readNVRamVariable:value:", CFSTR("cb-remote-setup-pin"), &v12);
  v4 = v12;
  v5 = v4;
  v6 = 0;
  if (v3)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (objc_msgSend(v4, "length"))
    {
      v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, 4);
      v6 = v8;
      if (v8 && objc_msgSend(v8, "length") == (id)6)
      {
        v9 = CheckerBoardLogHandleForCategory(1);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v5;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting Remote Setup override pin of %@", buf, 0xCu);
        }

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBUserSettings remoteSetupManager](self, "remoteSetupManager"));
        objc_msgSend(v11, "setOverrideAuthPin:", v6);

      }
    }
    else
    {
      v6 = 0;
    }
  }

}

- (BOOL)checkedInWiFiSettings
{
  return self->_checkedInWiFiSettings;
}

- (void)setCheckedInWiFiSettings:(BOOL)a3
{
  self->_checkedInWiFiSettings = a3;
}

- (BOOL)wifiPowerStateOn
{
  return self->_wifiPowerStateOn;
}

- (void)setWifiPowerStateOn:(BOOL)a3
{
  self->_wifiPowerStateOn = a3;
}

- (CBSProxyServer)proxyServer
{
  return self->_proxyServer;
}

- (void)setProxyServer:(id)a3
{
  objc_storeStrong((id *)&self->_proxyServer, a3);
}

- (BOOL)wifiRequiresPassword
{
  return self->_wifiRequiresPassword;
}

- (void)setWifiRequiresPassword:(BOOL)a3
{
  self->_wifiRequiresPassword = a3;
}

- (NSTimer)wifiReconnectTimer
{
  return self->_wifiReconnectTimer;
}

- (void)setWifiReconnectTimer:(id)a3
{
  objc_storeStrong((id *)&self->_wifiReconnectTimer, a3);
}

- (unint64_t)wifiJoinAttemptCount
{
  return self->_wifiJoinAttemptCount;
}

- (void)setWifiJoinAttemptCount:(unint64_t)a3
{
  self->_wifiJoinAttemptCount = a3;
}

- (NSString)wifiSSIDFromNvram
{
  return self->_wifiSSIDFromNvram;
}

- (void)setWifiSSIDFromNvram:(id)a3
{
  objc_storeStrong((id *)&self->_wifiSSIDFromNvram, a3);
}

- (NSString)wifiPasswordFromNvram
{
  return self->_wifiPasswordFromNvram;
}

- (void)setWifiPasswordFromNvram:(id)a3
{
  objc_storeStrong((id *)&self->_wifiPasswordFromNvram, a3);
}

- (OS_dispatch_semaphore)diagsLaunchDependenciesSemaphore
{
  return self->_diagsLaunchDependenciesSemaphore;
}

- (void)setDiagsLaunchDependenciesSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_diagsLaunchDependenciesSemaphore, a3);
}

- (CBRemoteSetupManager)remoteSetupManager
{
  return self->_remoteSetupManager;
}

- (void)setRemoteSetupManager:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSetupManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteSetupManager, 0);
  objc_storeStrong((id *)&self->_diagsLaunchDependenciesSemaphore, 0);
  objc_storeStrong((id *)&self->_wifiPasswordFromNvram, 0);
  objc_storeStrong((id *)&self->_wifiSSIDFromNvram, 0);
  objc_storeStrong((id *)&self->_wifiReconnectTimer, 0);
  objc_storeStrong((id *)&self->_proxyServer, 0);
}

@end
