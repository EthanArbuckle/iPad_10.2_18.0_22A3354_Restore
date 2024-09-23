@implementation SMSApplicationDelegate

+ (id)logHandle
{
  if (qword_10003AEE8 != -1)
    dispatch_once(&qword_10003AEE8, &stru_1000310C0);
  return (id)qword_10003AEE0;
}

- (id)logHandle
{
  return objc_msgSend((id)objc_opt_class(self), "logHandle");
}

- (SMSApplicationDelegate)init
{
  SMSApplicationDelegate *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SMSApplicationDelegate;
  v2 = -[SMSApplicationDelegate init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)SMSApplicationSoundHelper);
    -[SMSApplicationDelegate setSoundHelper:](v2, "setSoundHelper:", v3);

    v4 = objc_alloc_init((Class)CKSceneController);
    -[SMSApplicationDelegate setSceneController:](v2, "setSceneController:", v4);

    if (IMSharedHelperTurnOnUNUserNotificationsInIMDPersistence())
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplicationDelegate sceneController](v2, "sceneController"));
      objc_msgSend(v5, "setDelegate:", v6);

    }
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SMSApplicationDelegate;
  -[SMSApplicationDelegate dealloc](&v4, "dealloc");
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  uint64_t v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  id v59;
  __int16 v60;
  id v61;

  v49 = a3;
  v51 = a4;
  v50 = a5;
  if (IMOSLoggingEnabled(v50))
  {
    v8 = OSLogHandleForIMFoundationCategory("Scene");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v59 = v51;
      v60 = 2112;
      v61 = v50;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Application will create scene with session: %@ connectionOptions: %@", buf, 0x16u);
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "role"));
  v11 = objc_msgSend(v10, "isEqualToString:", UIWindowSceneSessionRoleExternalDisplayNonInteractive);

  if (v11
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "role")),
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("CPTemplateApplicationSceneSessionRoleApplication")), v12, v13)|| (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "role")), v15 = objc_msgSend(v14, "isEqualToString:", _UIWindowSceneSessionRoleSimplifiedApplication), v14, v15))
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "configuration"));
    goto LABEL_10;
  }
  v18 = (id)objc_opt_class(CKMessagesSceneDelegate);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "URLContexts"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "anyObject"));

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "URL"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplicationDelegate extractValueFromURL:forKey:](self, "extractValueFromURL:forKey:", v47, CFSTR("overlay")));
  if (objc_msgSend(v46, "isEqualToString:", CFSTR("1")))
    v18 = (id)objc_opt_class(CKChatSceneDelegate);
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "userActivities"));
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "allObjects"));
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v54;
    v23 = ShowDebugViewActivity;
    v52 = ShowMessageInspectorActivity;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v22)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "activityType"));
        v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.Messages.StateRestoration"));

        if (v27)
        {
          if (IMOSLoggingEnabled(v28))
          {
            v29 = OSLogHandleForIMFoundationCategory("Scene");
            v30 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v25;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "State restoration user activity found in user activities dictionaries set: %@", buf, 0xCu);
            }

          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "userInfo"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("CKCanvasStateRestorationContainerType")));

          v33 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
          {
            v18 = +[CKSceneDelegate containerClassForType:](CKSceneDelegate, "containerClassForType:", objc_msgSend(v32, "integerValue"));
            if (IMOSLoggingEnabled(v18))
            {
              v34 = OSLogHandleForIMFoundationCategory("Scene");
              v35 = objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v59 = v18;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "User activity has delegate class: %@", buf, 0xCu);
              }

            }
          }

        }
        else
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "activityType"));
          if (objc_msgSend(v36, "isEqualToString:", v23))
          {

          }
          else
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "activityType"));
            v38 = objc_msgSend(v37, "isEqualToString:", v52);

            if (!v38)
              continue;
          }
          v18 = (id)objc_opt_class(CKDebugSceneDelegate);
        }
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v21);
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "configuration"));
  v40 = objc_alloc((Class)UISceneConfiguration);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "name"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "role"));
  v16 = objc_msgSend(v40, "initWithName:sessionRole:", v41, v42);

  objc_msgSend(v16, "setDelegateClass:", v18);
  if (IMOSLoggingEnabled(objc_msgSend(v16, "setSceneClass:", objc_msgSend(v39, "sceneClass"))))
  {
    v43 = OSLogHandleForIMFoundationCategory("Scene");
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v16;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Returning scene configuration: %@", buf, 0xCu);
    }

  }
LABEL_10:

  return v16;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3, a4));
  objc_msgSend(v4, "registerDefaults:", &off_100034E10);

  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  void *v20;
  void *v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  dispatch_time_t v23;
  _QWORD block[5];
  uint8_t buf[16];

  v5 = kdebug_trace(733872284, 0, 0, 0, 0);
  v6 = IMClientTelemetryLogHandle(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ClientLaunchToViewAppears", " enableTelemetry=YES ", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  if (qword_10003AEF0 != -1)
    dispatch_once(&qword_10003AEF0, &stru_1000310E0);
  v9 = dispatch_time(0, 2500000000);
  global_queue = dispatch_get_global_queue(9, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_after(v9, v11, &stru_100031140);

  v12 = +[IMSWHighlightCenterController sharedControllerWithAppIdentifier:](IMSWHighlightCenterController, "sharedControllerWithAppIdentifier:", CFSTR("com.apple.MobileSMS"));
  v13 = objc_claimAutoreleasedReturnValue(-[SMSApplicationDelegate logHandle](self, "logHandle"));
  v14 = objc_claimAutoreleasedReturnValue(-[SMSApplicationDelegate logHandle](self, "logHandle"));
  v15 = os_signpost_id_make_with_pointer(v14, "IMCoreSetup");

  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "IMCoreSetup", " enableTelemetry=YES ", buf, 2u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v16, "blockUntilConnected");

  v17 = objc_claimAutoreleasedReturnValue(-[SMSApplicationDelegate logHandle](self, "logHandle"));
  v18 = objc_claimAutoreleasedReturnValue(-[SMSApplicationDelegate logHandle](self, "logHandle"));
  v19 = os_signpost_id_make_with_pointer(v18, "IMCoreSetup");

  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v19, "IMCoreSetup", " enableTelemetry=YES ", buf, 2u);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](IMSystemMonitor, "sharedInstance"));
  objc_msgSend(v20, "setActive:", 1);

  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_messageReceived:", IMChatMessageReceivedNotification, 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_messageSent:", IMChatRegistryMessageSentNotification, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry"));
  objc_msgSend(v21, "_setPostMessageSentNotifications:", 1);

  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_messageSendFailed:", IMChatMessageSendFailedNotification, 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CKClientDidResumeNotification, 0, 0, 1u);
  CKPrewarmBalloonPluginManagerForLaunch(-[SMSApplicationDelegate _clearFailureBadge](self, "_clearFailureBadge"));
  v23 = dispatch_time(0, 15000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C400;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v23, (dispatch_queue_t)&_dispatch_main_q, block);

  return 1;
}

- (void)applicationSignificantTimeChange:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3));
  objc_msgSend(v3, "invalidateTranscriptDrawerWidth");

}

- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5
{
  id v5;

  if (!a5)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3, a4));
    objc_msgSend(v5, "setBool:forKey:", 1, CFSTR("kHasSetupHashtagImages"));

  }
}

- (void)_messageReceived:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  _QWORD block[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", IMChatValueKey));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "guid"));
  v9 = objc_msgSend(v7, "isRead");
  if ((_DWORD)v9)
  {
    if (IMOSLoggingEnabled(v9))
    {
      v10 = OSLogHandleForIMFoundationCategory("SMSApplication");
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Not playing message receive sound for message that is already read: %@", buf, 0xCu);
      }
LABEL_15:

    }
  }
  else
  {
    v12 = objc_msgSend(v7, "isFromMe");
    if ((_DWORD)v12)
    {
      if (IMOSLoggingEnabled(v12))
      {
        v13 = OSLogHandleForIMFoundationCategory("SMSApplication");
        v11 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v8;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Not playing message receive sound for message that is from me: %@", buf, 0xCu);
        }
        goto LABEL_15;
      }
    }
    else
    {
      v14 = objc_msgSend(v5, "isMuted");
      if ((_DWORD)v14)
      {
        if (IMOSLoggingEnabled(v14))
        {
          v15 = OSLogHandleForIMFoundationCategory("SMSApplication");
          v11 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "guid"));
            *(_DWORD *)buf = 138412546;
            v28 = v8;
            v29 = 2112;
            v30 = v16;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Not playing message receive sound for chat that is muted. MessageGuid: %@ ChatGuid: %@", buf, 0x16u);

          }
          goto LABEL_15;
        }
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sender"));
        v18 = -[SMSApplicationDelegate isFromFilteredSender:fromSender:](self, "isFromFilteredSender:fromSender:", v5, v17);
        if (v18)
        {
          if (IMOSLoggingEnabled(v18))
          {
            v19 = OSLogHandleForIMFoundationCategory("SMSApplication");
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ID"));
              *(_DWORD *)buf = 138412546;
              v28 = v8;
              v29 = 2112;
              v30 = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Not playing message receive sound for message that is from a filtered sender. MessageGuid: %@ Sender: %@", buf, 0x16u);

            }
          }
        }
        else if (+[NSThread isMainThread](NSThread, "isMainThread"))
        {
          -[SMSApplicationDelegate _playMessageReceivedForMessage:inChat:](self, "_playMessageReceivedForMessage:inChat:", v7, v5);
        }
        else
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10001C9E0;
          block[3] = &unk_100030A58;
          block[4] = self;
          v25 = v7;
          v26 = v5;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
        v23 = objc_msgSend(v22, "resetsIdleTimer");

        if (v23)
          -[SMSApplicationDelegate _resetIdleTimer](self, "_resetIdleTimer");

      }
    }
  }

}

- (void)_messageSent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  if ((objc_msgSend(v5, "isMuted") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", IMChatRegistryMessageSendIsReplicatingKey));
    v8 = objc_msgSend(v7, "BOOLValue");

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", IMChatRegistryMessageSentMessageKey));

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001CAFC;
      v12[3] = &unk_100030B70;
      v12[4] = self;
      v13 = v10;
      v11 = v10;
      im_main_thread(v12);

    }
  }

}

- (void)_messageSendFailed:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", IMChatValueKey));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "error"));
  v6 = objc_msgSend(v5, "code");

  v7 = v33;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "sender"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "service"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](IMMobileNetworkManager, "sharedInstance"));
    v11 = objc_msgSend(v10, "isAirplaneModeEnabled");
    v12 = objc_msgSend(v10, "isWiFiEnabled");
    if (v11)
    {
      v13 = v12;
      if ((objc_msgSend(v9, "__ck_isCarrierBased") & 1) != 0
        || (v13 & 1) == 0 && objc_msgSend(v9, "__ck_isiMessage"))
      {
        v14 = MGGetBoolAnswer(CFSTR("wapi"));
        v15 = CKFrameworkBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if (v14)
          v18 = CFSTR("TURN_OFF_AIRPLANE_MODE_OR_TURN_ON_WLAN");
        else
          v18 = CFSTR("TURN_OFF_AIRPLANE_MODE_OR_TURN_ON_WIFI");
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_100031270, CFSTR("ChatKit")));

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v32, 0, 1));
        v20 = CKFrameworkBundle();
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100031270, CFSTR("ChatKit")));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v22, 1, 0));

        v24 = CKFrameworkBundle();
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SETTINGS"), &stru_100031270, CFSTR("ChatKit")));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v26, 0, &stru_100031180));

        objc_msgSend(v19, "addAction:", v23);
        objc_msgSend(v19, "addAction:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplicationDelegate sceneController](self, "sceneController"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "messagesSceneDelegate"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "window"));

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "rootViewController"));
        objc_msgSend(v19, "presentFromViewController:animated:completion:", v31, 1, 0);
        +[CKStarkManager isCarPlayConnected](CKStarkManager, "isCarPlayConnected");

      }
    }

    v7 = v33;
  }

}

- (void)_playMessageReceivedForMessage:(id)a3 inChat:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  unsigned __int8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  unsigned __int8 v36;
  id v37;
  char v38;
  int v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  unsigned __int8 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  unint64_t v72;
  __int16 v73;
  uint64_t v74;

  v7 = a3;
  v8 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SMSApplicationDelegate.m"), 413, CFSTR("Should be running on main thread."));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "guid"));
  if (IMOSLoggingEnabled(v9))
  {
    v10 = OSLogHandleForIMFoundationCategory("SMSApplication");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Message %@ received. Determining if we should play in-app message received sound", buf, 0xCu);
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplicationDelegate soundHelper](self, "soundHelper"));
  objc_msgSend(v12, "stopPlayingAlert");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v14 = objc_msgSend(v13, "isSuspended");

  v15 = +[CKApplicationState isApplicationActive](CKApplicationState, "isApplicationActive");
  v16 = CKIsRunningInMacCatalyst();
  if ((_DWORD)v16)
    v17 = (void *)v15;
  else
    v17 = (void *)(v14 ^ 1);
  v18 = IMOSLoggingEnabled(v16);
  if ((_DWORD)v18)
  {
    v19 = OSLogHandleForIMFoundationCategory("SMSApplication");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v70 = v17;
      v71 = 2048;
      v72 = v14;
      v73 = 2048;
      v74 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "For receive sound playblack, Messages isActive: %ld. (isAppSuspended: %ld, isAppStateActive: %ld)", buf, 0x20u);
    }

  }
  if ((_DWORD)v17)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistentID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personCentricID"));
    v23 = CKSuppressionContextsForIdentifiers(v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplicationDelegate sceneController](self, "sceneController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "alertSuppressionContextsFromForegroundActiveScenes"));

    v27 = -[SMSApplicationDelegate isBulletinSuppressed:messageContexts:](self, "isBulletinSuppressed:messageContexts:", v26, v24);
    if (!v27)
    {
      if (!IMOSLoggingEnabled(v27))
      {
LABEL_75:

        goto LABEL_80;
      }
      v33 = OSLogHandleForIMFoundationCategory("SMSApplication");
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v9;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "System notification is not suppressed for %@, letting notifications play sound", buf, 0xCu);
      }
LABEL_25:

      goto LABEL_75;
    }
    v28 = objc_msgSend(v12, "allowedByScreenTimeToPlayReceiveSoundForChat:", v8);
    v29 = CKIsSuppressingReceiveSoundForMessageGUID(v9);
    if ((v28 & 1) == 0)
    {
      v30 = IMOSLoggingEnabled(v29);
      if (!(_DWORD)v30)
        goto LABEL_61;
      v35 = OSLogHandleForIMFoundationCategory("SMSApplication");
      v32 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v9;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Message %@ will not play sound due to screentime suppression", buf, 0xCu);
      }
      goto LABEL_21;
    }
    if ((_DWORD)v29)
    {
      v30 = IMOSLoggingEnabled(v29);
      if (!(_DWORD)v30)
      {
LABEL_61:
        if (!IMOSLoggingEnabled(v30))
          goto LABEL_75;
        v58 = OSLogHandleForIMFoundationCategory("SMSApplication");
        v34 = objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v9;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Not playing sound for message: %@", buf, 0xCu);
        }
        goto LABEL_25;
      }
      v31 = OSLogHandleForIMFoundationCategory("SMSApplication");
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v9;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Message %@ will not play sound due to sound being suppressed for that message guid", buf, 0xCu);
      }
LABEL_21:

      goto LABEL_61;
    }
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[IMFocusStateManager sharedManager](IMFocusStateManager, "sharedManager"));
    if (!objc_msgSend(v68, "shouldFilterConversationsByFocus"))
    {
LABEL_37:

      v43 = objc_msgSend(v7, "__ck_isAcknowledgmentMessage");
      v44 = (uint64_t)objc_msgSend(v26, "containsObject:", v21);
      if ((v44 & 1) != 0)
      {
        if ((v43 & 1) == 0)
        {
LABEL_51:
          v45 = 1;
          goto LABEL_70;
        }
      }
      else
      {
        v44 = (uint64_t)objc_msgSend(v26, "containsObject:", v22);
        v45 = v44;
        if ((v43 & 1) == 0)
        {
LABEL_70:
          if (IMOSLoggingEnabled(v44))
          {
            v61 = OSLogHandleForIMFoundationCategory("SMSApplication");
            v62 = objc_claimAutoreleasedReturnValue(v61);
            if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v9;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "Playing standard incoming message sound for message: %@", buf, 0xCu);
            }

          }
          objc_msgSend(v12, "playIncomingMessageSoundAndHapticForMessage:messageIsForCurrentTranscript:", v7, v45);
          goto LABEL_75;
        }
        if (!(_DWORD)v44)
        {
          v44 = IMOSLoggingEnabled(v44);
          if ((_DWORD)v44)
          {
            v59 = OSLogHandleForIMFoundationCategory("SMSApplication");
            v60 = objc_claimAutoreleasedReturnValue(v59);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v9;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Message %@ is a received tapback, but the chat for this message is not currently visible. Attempting fall back to standard incoming message sound.", buf, 0xCu);
            }

          }
          v45 = 0;
          goto LABEL_70;
        }
      }
      if (IMOSLoggingEnabled(v44))
      {
        v46 = OSLogHandleForIMFoundationCategory("SMSApplication");
        v47 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v9;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Playing tapback message sound for message: %@", buf, 0xCu);
        }

      }
      v48 = objc_msgSend(v12, "playTapbackReceivedSoundForMessageInCurrentTranscript:", v7);
      if ((v48 & 1) != 0)
        goto LABEL_75;
      v44 = IMOSLoggingEnabled(v48);
      if ((_DWORD)v44)
      {
        v49 = OSLogHandleForIMFoundationCategory("SMSApplication");
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v9;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Message %@ is a received tapback, but did not generate a tapback sound. Attempting fall back to standard incoming message sound.", buf, 0xCu);
        }

      }
      goto LABEL_51;
    }
    v36 = objc_msgSend(v68, "chatMatchesActiveFocusMode:", v8);
    v37 = objc_msgSend(v68, "senderMatchesActiveFocusModeForMessage:", v7);
    v38 = (char)v37;
    v39 = IMOSLoggingEnabled(v37);
    if ((v36 & 1) != 0)
    {
      if ((v38 & 1) != 0)
      {
        if (v39)
        {
          v40 = OSLogHandleForIMFoundationCategory("SMSApplication");
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "guid"));
            *(_DWORD *)buf = 138412546;
            v70 = v9;
            v71 = 2112;
            v72 = (unint64_t)v42;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Conversations are being filtered by focus, but message %@ is part of chat %@ which is allowed in the active focus, so allowing received message sound to play.", buf, 0x16u);

          }
        }
        goto LABEL_37;
      }
      if (v39)
      {
        v54 = OSLogHandleForIMFoundationCategory("SMSApplication");
        v52 = objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sender"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "ID"));
          v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "guid"));
          v66 = v55;
          *(_DWORD *)buf = 138412802;
          v70 = v9;
          v71 = 2112;
          v72 = (unint64_t)v67;
          v73 = 2112;
          v74 = v56;
          v57 = (void *)v56;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "Conversations are being filtered by focus. Message %@ is from sender %@ in chat %@. The chat is allowed by focus, but this sender is not, so not allowing received message sound to play.", buf, 0x20u);

        }
LABEL_59:

      }
    }
    else if (v39)
    {
      v51 = OSLogHandleForIMFoundationCategory("SMSApplication");
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "guid"));
        *(_DWORD *)buf = 138412546;
        v70 = v9;
        v71 = 2112;
        v72 = (unint64_t)v53;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "Conversations are being filtered by focus. Message %@ is part of chat %@ which is not allowed in the active focus, so not allowing received message sound to play.", buf, 0x16u);

      }
      goto LABEL_59;
    }

    goto LABEL_61;
  }
  if (IMOSLoggingEnabled(v18))
  {
    v64 = OSLogHandleForIMFoundationCategory("SMSApplication");
    v65 = objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v9;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "App is not active, letting Notifications play sound for %@", buf, 0xCu);
    }

  }
LABEL_80:

}

- (BOOL)isBulletinSuppressed:(id)a3 messageContexts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if (-[SMSApplicationDelegate shouldGetBulletinSuppressedStateFromHelper](self, "shouldGetBulletinSuppressedStateFromHelper"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplicationDelegate soundHelper](self, "soundHelper"));
    LODWORD(self) = objc_msgSend(v8, "bulletinSuppressed");

    if (IMOSLoggingEnabled(v9))
    {
      v10 = OSLogHandleForIMFoundationCategory("SMSApplication");
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v14 = 134217984;
        v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Forced notification suppression state is %ld. (This is a unit testing path).", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplicationDelegate sceneController](self, "sceneController"));
    LOBYTE(self) = objc_msgSend(v12, "shouldSuppressNotificationForMessageWithRelevantContext:withAlertSupressionContextForScenes:", v7, v6);

  }
  return (char)self;
}

- (void)_resetIdleTimer
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v2, "setIdleTimerDisabled:", 1);

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v3, "setIdleTimerDisabled:", 0);

}

- (id)smsApplication
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_opt_class(SMSApplication);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (BOOL)isFromFilteredSender:(id)a3 fromSender:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "supportsFilteringExtensions");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastFinishedMessageItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "service"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMService serviceWithName:](IMService, "serviceWithName:", v9));

  v11 = objc_msgSend(v10, "supportsCapability:", IMServiceCapabilitySpamFilteringExtensions);
  if ((objc_msgSend(v5, "isCategorized") & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForChatProperty:", kWasDetectedAsiMessageSpam));
    v12 = (uint64_t)objc_msgSend(v13, "BOOLValue");

  }
  v14 = objc_msgSend(v5, "isFiltered");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cnContactWithKeys:", &__NSArray0__struct));

  v16 = CKMessageIsFromFilteredSenderIsUnderFirstUnlock(v7, v11, +[IMContactStore isCNContactAKnownContact:](IMContactStore, "isCNContactAKnownContact:", v15), v14, v12, 0) != 0;
  return v16;
}

- (void)_clearFailureBadge
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("__kMessagesBadgeControllerClearFailureBadgeNotification"), 0, 0, 1u);
}

- (id)extractValueFromURL:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resourceSpecifier"));

  if (objc_msgSend(v8, "hasPrefix:", CFSTR("//")))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringFromIndex:", 2));

    v8 = (void *)v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sms:/open?address=%@"), v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
  v13 = (id)ExtractURLQueries(v12, v7);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v5));
  return v14;
}

+ (id)addMessagesFileProviderDomain:(id *)a3
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10001DE78;
  v18 = sub_10001DE88;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_10001DE78;
  v12 = sub_10001DE88;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DE90;
  v7[3] = &unk_1000311D0;
  v7[4] = &v8;
  v7[5] = &v14;
  if (qword_10003AEF8 == -1)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_10003AEF8, v7);
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease((id)v15[5]);
LABEL_4:
  if (v15[5])
    v4 = 0;
  else
    v4 = (void *)v9[5];
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (id)_sceneIDForChat:(id)a3
{
  void *v3;
  id v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  __int128 v40;
  id v41;
  id obj;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];

  v41 = a3;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedScenes"));

  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (!v4)
  {

LABEL_29:
    if (IMOSLoggingEnabled(v24))
    {
      v33 = OSLogHandleForIMFoundationCategory("Warning");
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "chatIdentifier"));
        *(_DWORD *)buf = 138412290;
        v49 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "SMSApplication | Cant find sceneID for chatID: %@", buf, 0xCu);

      }
    }
    v13 = 0;
    v29 = 0;
    goto LABEL_40;
  }
  v6 = 0;
  v43 = *(_QWORD *)v45;
  *(_QWORD *)&v5 = 138412290;
  v40 = v5;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v45 != v43)
      objc_enumerationMutation(obj);
    v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate", v40));
    v10 = objc_opt_class(CKSceneDelegate);
    isKindOfClass = objc_opt_isKindOfClass(v9, v10);

    if ((isKindOfClass & 1) == 0)
      goto LABEL_15;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    if (objc_msgSend(v12, "type"))
    {
      v13 = v6;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "session"));
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "persistentIdentifier"));

      if (IMOSLoggingEnabled(v15))
      {
        v16 = OSLogHandleForIMFoundationCategory("SMSApplication");
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v40;
          v49 = v13;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Main window sceneID: %@", buf, 0xCu);
        }

      }
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "conversation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "chat"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "chatIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "chatIdentifier"));
    v22 = objc_msgSend(v20, "isEqualToString:", v21);

    if (v22)
      break;

    v6 = v13;
LABEL_15:
    if (v4 == (id)++v7)
    {
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v4)
        goto LABEL_3;

      if (!v6)
        goto LABEL_29;
LABEL_35:
      if (IMOSLoggingEnabled(v24))
      {
        v36 = OSLogHandleForIMFoundationCategory("SMSApplication");
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "chatIdentifier"));
          *(_DWORD *)buf = 138412546;
          v49 = v38;
          v50 = 2112;
          v51 = v6;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "No scene associated with chat %@, using main window sceneID: %@", buf, 0x16u);

        }
      }
      v13 = v6;
      v29 = v13;
      goto LABEL_40;
    }
  }
  if (IMOSLoggingEnabled(v23))
  {
    v25 = OSLogHandleForIMFoundationCategory("SMSApplication");
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = objc_msgSend(v12, "type");
      *(_DWORD *)buf = 134217984;
      v49 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "sceneDelegate type: %ld", buf, 0xCu);
    }

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "session"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "persistentIdentifier"));

  if (!v29)
  {
    v6 = v13;
    if (!v13)
      goto LABEL_29;
    goto LABEL_35;
  }
  if (IMOSLoggingEnabled(v24))
  {
    v30 = OSLogHandleForIMFoundationCategory("SMSApplication");
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "chatIdentifier"));
      *(_DWORD *)buf = 138412546;
      v49 = v29;
      v50 = 2112;
      v51 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "found sceneID: %@ for chatID: %@", buf, 0x16u);

    }
  }
LABEL_40:

  return v29;
}

- (id)swiftui_rootViewForSimplifiedApplicationProvider
{
  Class v2;

  v2 = NSClassFromString(CFSTR("CKClarityUIRootViewProvider"));
  return (id)objc_opt_new(v2);
}

- (CKSceneController)sceneController
{
  return self->_sceneController;
}

- (void)setSceneController:(id)a3
{
  objc_storeStrong((id *)&self->_sceneController, a3);
}

- (SMSApplicationSoundHelper)soundHelper
{
  return self->_soundHelper;
}

- (void)setSoundHelper:(id)a3
{
  objc_storeStrong((id *)&self->_soundHelper, a3);
}

- (BOOL)shouldGetBulletinSuppressedStateFromHelper
{
  return self->_shouldGetBulletinSuppressedStateFromHelper;
}

- (void)setShouldGetBulletinSuppressedStateFromHelper:(BOOL)a3
{
  self->_shouldGetBulletinSuppressedStateFromHelper = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundHelper, 0);
  objc_storeStrong((id *)&self->_sceneController, 0);
}

@end
