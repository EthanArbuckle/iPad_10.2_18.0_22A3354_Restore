@implementation CBRemoteSetupManager

+ (CBRemoteSetupManager)sharedInstance
{
  if (qword_10008BD08 != -1)
    dispatch_once(&qword_10008BD08, &stru_100075800);
  return (CBRemoteSetupManager *)(id)qword_10008BD00;
}

- (CBRemoteSetupManager)init
{
  CBRemoteSetupManager *v2;
  CBRemoteSetupManager *v3;
  SKSetupFieldDiagnosticsServer *setupServer;
  NSString *remoteLocaleCode;
  NSString *overridePin;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CBRemoteSetupManager;
  v2 = -[CBRemoteSetupManager init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    setupServer = v2->_setupServer;
    v2->_setupServer = 0;

    v3->_broadcastingForSetup = 0;
    remoteLocaleCode = v3->_remoteLocaleCode;
    v3->_remoteLocaleCode = 0;

    overridePin = v3->_overridePin;
    v3->_overridePin = 0;

    v3->_preferredPasswordType = 8;
    v3->_setupState = 1;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[CBRemoteSetupManager endRemoteSetupBroadcast](self, "endRemoteSetupBroadcast");
  v3.receiver = self;
  v3.super_class = (Class)CBRemoteSetupManager;
  -[CBRemoteSetupManager dealloc](&v3, "dealloc");
}

- (void)startRemoteSetupBroadcast
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id location;
  uint8_t buf[4];
  void *v23;

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting broadcast for remote setup", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager setupServer](self, "setupServer"));
  if (v5)
  {
    v6 = CheckerBoardLogHandleForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "We already have a setup server. Tearing down...", buf, 2u);
    }

    -[CBRemoteSetupManager endRemoteSetupBroadcast](self, "endRemoteSetupBroadcast");
  }
  v8 = objc_alloc_init((Class)SKSetupFieldDiagnosticsServer);
  -[CBRemoteSetupManager setSetupServer:](self, "setSetupServer:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager overridePin](self, "overridePin"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager overridePin](self, "overridePin"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager setupServer](self, "setupServer"));
    objc_msgSend(v11, "setPassword:", v10);

    -[CBRemoteSetupManager setPreferredPasswordType:](self, "setPreferredPasswordType:", 2);
  }
  v12 = -[CBRemoteSetupManager preferredPasswordType](self, "preferredPasswordType");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager setupServer](self, "setupServer"));
  objc_msgSend(v13, "setPasswordType:", v12);

  objc_initWeak(&location, self);
  objc_copyWeak(&v20, &location);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager setupServer](self, "setupServer", _NSConcreteStackBlock, 3221225472, sub_100011980, &unk_100075828));
  objc_msgSend(v14, "setEventHandler:", &v19);

  v15 = CheckerBoardLogHandleForCategory(1);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager setupServer](self, "setupServer"));
    *(_DWORD *)buf = 138412290;
    v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Beginning setup broadcast with setup server %@", buf, 0xCu);

  }
  -[CBRemoteSetupManager setBroadcastingForSetup:](self, "setBroadcastingForSetup:", 1);
  -[CBRemoteSetupManager setSetupState:](self, "setSetupState:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager setupServer](self, "setupServer"));
  objc_msgSend(v18, "activate");

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)endRemoteSetupBroadcast
{
  void *v3;
  void *v4;

  -[CBRemoteSetupManager setBroadcastingForSetup:](self, "setBroadcastingForSetup:", 0);
  -[CBRemoteSetupManager setSetupState:](self, "setSetupState:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager setupServer](self, "setupServer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager setupServer](self, "setupServer"));
    objc_msgSend(v4, "invalidate");

    -[CBRemoteSetupManager setSetupServer:](self, "setSetupServer:", 0);
  }
}

- (void)restartRemoteSetupBroadcast
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[CBRemoteSetupManager endRemoteSetupBroadcast](self, "endRemoteSetupBroadcast");
  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011AB4;
  block[3] = &unk_1000753E8;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)setOverrideAuthPin:(id)a3
{
  id v4;
  unsigned __int8 v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;

  v4 = a3;
  v5 = -[CBRemoteSetupManager broadcastingForSetup](self, "broadcastingForSetup");
  if (v4 && (v5 & 1) == 0 && objc_msgSend(v4, "length") == (id)6)
  {
    -[CBRemoteSetupManager setOverridePin:](self, "setOverridePin:", v4);
    v6 = 1;
  }
  else
  {
    v7 = CheckerBoardLogHandleForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000452EC((uint64_t)v4, self, v8);

    v6 = 0;
  }

  return v6;
}

- (void)sendAuthPassword:(id)a3
{
  id v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;

  v4 = a3;
  v5 = -[CBRemoteSetupManager broadcastingForSetup](self, "broadcastingForSetup");
  v6 = CheckerBoardLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending password %@ to SetupKit", (uint8_t *)&v17, 0xCu);
    }

    v8 = objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager setupServer](self, "setupServer"));
    v9 = objc_msgSend(objc_alloc((Class)SKAuthenticationResponseEvent), "initWithPassword:", v4);
    -[NSObject postEvent:](v8, "postEvent:", v9);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100045388(v8, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)changeDesiredAuthType:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[CBRemoteSetupManager broadcastingForSetup](self, "broadcastingForSetup"))
  {
    -[CBRemoteSetupManager setPreferredPasswordType:](self, "setPreferredPasswordType:", v3);
    -[CBRemoteSetupManager restartRemoteSetupBroadcast](self, "restartRemoteSetupBroadcast");
  }
}

- (void)setupFailed
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setup failed", v6, 2u);
  }

  -[CBRemoteSetupManager endRemoteSetupBroadcast](self, "endRemoteSetupBroadcast");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("CBRemoteSetupFailedNotification"), self);

}

- (void)handleSetupEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  NSObject *v42;
  uint32_t v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  _QWORD v47[2];
  const __CFString *v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;

  v4 = a3;
  v5 = CheckerBoardLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setup server event %@", buf, 0xCu);
  }

  v7 = objc_msgSend(v4, "eventType");
  if (v7 > 40)
  {
    if (v7 > 119)
    {
      if (v7 != 120)
      {
        if (v7 != 140)
        {
          if (v7 == 300)
          {
            v8 = CheckerBoardLogHandleForCategory(1);
            v9 = objc_claimAutoreleasedReturnValue(v8);
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setup server received updated configuration", buf, 2u);
            }

            -[CBRemoteSetupManager _processBasicConfigFromEvent:](self, "_processBasicConfigFromEvent:", v4);
            goto LABEL_50;
          }
          goto LABEL_46;
        }
        v37 = CheckerBoardLogHandleForCategory(1);
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Setup server authentication completed", buf, 2u);
        }

        -[CBRemoteSetupManager setSetupState:](self, "setSetupState:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v16, "postNotificationName:object:", CFSTR("CBRemoteSetupConfiguringNotification"), self);
LABEL_43:

        goto LABEL_50;
      }
      v34 = CheckerBoardLogHandleForCategory(1);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "passwordType")));
        *(_DWORD *)buf = 138412290;
        v53 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Setup server wants us to respond with a password of auth type %@", buf, 0xCu);

      }
      -[CBRemoteSetupManager setSetupState:](self, "setSetupState:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v48 = CFSTR("type");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "passwordType")));
      v49 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
      v23 = CFSTR("CBRemoteSetupAuthenticationRequestNotification");
      goto LABEL_38;
    }
    if (v7 != 41)
    {
      if (v7 != 110)
        goto LABEL_46;
      v12 = CheckerBoardLogHandleForCategory(1);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "password"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "passwordType")));
        *(_DWORD *)buf = 138412546;
        v53 = v14;
        v54 = 2112;
        v55 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setup server wants us to show the pin %@ with auth type %@", buf, 0x16u);

      }
      -[CBRemoteSetupManager setSetupState:](self, "setSetupState:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v50[0] = CFSTR("type");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "passwordType")));
      v50[1] = CFSTR("pin");
      v51[0] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "password"));
      v51[1] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 2));
      objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("CBRemoteSetupAuthenticaitonDisplayNotification"), self, v19);

      goto LABEL_39;
    }
    goto LABEL_28;
  }
  if (v7 > 29)
  {
    if (v7 == 30)
    {
LABEL_28:
      if (-[CBRemoteSetupManager broadcastingForSetup](self, "broadcastingForSetup")
        && (id)-[CBRemoteSetupManager setupState](self, "setupState") == (id)4)
      {
        v24 = CheckerBoardLogHandleForCategory(1);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1000453BC(v25, v26, v27, v28, v29, v30, v31, v32);

        -[CBRemoteSetupManager setupFailed](self, "setupFailed");
      }
      else if ((id)-[CBRemoteSetupManager setupState](self, "setupState") == (id)3)
      {
        -[CBRemoteSetupManager setSetupState:](self, "setSetupState:", 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v33, "postNotificationName:object:userInfo:", CFSTR("CBRemoteSetupCancelledNotification"), self, 0);

        -[CBRemoteSetupManager restartRemoteSetupBroadcast](self, "restartRemoteSetupBroadcast");
      }
      goto LABEL_50;
    }
    if (v7 != 40)
      goto LABEL_46;
    v20 = CheckerBoardLogHandleForCategory(1);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Setup server has connected to a device", buf, 2u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager overridePin](self, "overridePin"));
    if (v22)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager overridePin](self, "overridePin", CFSTR("type"), CFSTR("pin"), &off_100078BD8));
      v47[1] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, &v46, 2));
      v23 = CFSTR("CBRemoteSetupAuthenticaitonDisplayNotification");
LABEL_38:
      objc_msgSend(v16, "postNotificationName:object:userInfo:", v23, self, v18);
LABEL_39:

      goto LABEL_43;
    }
  }
  else
  {
    if (v7 == 10)
    {
      v39 = CheckerBoardLogHandleForCategory(1);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v41 = "Setup server started";
        v42 = v40;
        v43 = 2;
LABEL_48:
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
      }
LABEL_49:

      goto LABEL_50;
    }
    if (v7 != 20)
    {
LABEL_46:
      v44 = CheckerBoardLogHandleForCategory(1);
      v40 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v45 = objc_msgSend(v4, "eventType");
        *(_DWORD *)buf = 138412546;
        v53 = v4;
        v54 = 1024;
        LODWORD(v55) = v45;
        v41 = "Unhandled setup event %@ with type %d";
        v42 = v40;
        v43 = 18;
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    v10 = CheckerBoardLogHandleForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setup server is finished.", buf, 2u);
    }

    -[CBRemoteSetupManager _handleSetupServerFinished](self, "_handleSetupServerFinished");
  }
LABEL_50:

}

- (void)_processBasicConfigFromEvent:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "basicConfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_locale")));
  -[CBRemoteSetupManager setRemoteLocaleCode:](self, "setRemoteLocaleCode:", v5);

  v6 = CheckerBoardLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupManager remoteLocaleCode](self, "remoteLocaleCode"));
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Locale from basic config: %@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)_handleSetupServerFinished
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  CBRemoteSetupManager *v13;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setup server finished. Checking for network reachability", buf, 2u);
  }

  -[CBRemoteSetupManager endRemoteSetupBroadcast](self, "endRemoteSetupBroadcast");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CPNetworkObserver sharedNetworkObserver](CPNetworkObserver, "sharedNetworkObserver"));
  v6 = objc_msgSend(v5, "isNetworkReachable");
  v7 = CheckerBoardLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Network is reachable. Completing remote setup flow", buf, 2u);
    }

    -[CBRemoteSetupManager _handleRemoteSetupFinished](self, "_handleRemoteSetupFinished");
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Network is unreachable. Waiting for network...", buf, 2u);
    }

    objc_msgSend(v5, "addObserver:selector:forHostname:", self, "_reachabilityChanged:", CFSTR("apple.com"));
    v10 = dispatch_time(0, 10000000000);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000126D4;
    v11[3] = &unk_1000754E8;
    v12 = v5;
    v13 = self;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);

  }
}

- (void)_reachabilityChanged:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CPNetworkObserverReachable));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = CheckerBoardLogHandleForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Network is now reachable. Completing remote setup.", v10, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CPNetworkObserver sharedNetworkObserver](CPNetworkObserver, "sharedNetworkObserver"));
    objc_msgSend(v9, "removeObserver:", self);

    -[CBRemoteSetupManager _handleRemoteSetupFinished](self, "_handleRemoteSetupFinished");
  }
}

- (void)_handleRemoteSetupFinished
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote setup completed!", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("CBRemoteSetupCompletedNotification"), self);

  -[CBRemoteSetupManager endRemoteSetupBroadcast](self, "endRemoteSetupBroadcast");
}

- (NSString)remoteLocaleCode
{
  return self->_remoteLocaleCode;
}

- (void)setRemoteLocaleCode:(id)a3
{
  objc_storeStrong((id *)&self->_remoteLocaleCode, a3);
}

- (unint64_t)setupState
{
  return self->_setupState;
}

- (void)setSetupState:(unint64_t)a3
{
  self->_setupState = a3;
}

- (SKSetupFieldDiagnosticsServer)setupServer
{
  return self->_setupServer;
}

- (void)setSetupServer:(id)a3
{
  objc_storeStrong((id *)&self->_setupServer, a3);
}

- (BOOL)broadcastingForSetup
{
  return self->_broadcastingForSetup;
}

- (void)setBroadcastingForSetup:(BOOL)a3
{
  self->_broadcastingForSetup = a3;
}

- (NSString)overridePin
{
  return self->_overridePin;
}

- (void)setOverridePin:(id)a3
{
  objc_storeStrong((id *)&self->_overridePin, a3);
}

- (int)preferredPasswordType
{
  return self->_preferredPasswordType;
}

- (void)setPreferredPasswordType:(int)a3
{
  self->_preferredPasswordType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridePin, 0);
  objc_storeStrong((id *)&self->_setupServer, 0);
  objc_storeStrong((id *)&self->_remoteLocaleCode, 0);
}

@end
