@implementation PHAudioInterruptionController

+ (id)sharedInstance
{
  if (qword_1002DC6C0 != -1)
    dispatch_once(&qword_1002DC6C0, &stru_1002851B8);
  return (id)qword_1002DC6B8;
}

- (PHAudioInterruptionController)init
{
  PHAudioInterruptionController *v2;
  PHRingtoneController *v3;
  PHRingtoneController *ringtoneController;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  int out_token;
  objc_super v17;
  uint8_t buf[4];
  void *v19;

  v17.receiver = self;
  v17.super_class = (Class)PHAudioInterruptionController;
  v2 = -[PHAudioInterruptionController init](&v17, "init");
  if (v2)
  {
    v3 = objc_alloc_init(PHRingtoneController);
    ringtoneController = v2->_ringtoneController;
    v2->_ringtoneController = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "_callStatusChanged:", TUCallCenterCallStatusChangedNotification, 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "_callShouldSuppressRingtoneChanged:", TUCallShouldSuppressRingingChangedNotification, 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "handlePHRingtoneControllerAudioSessionIdentifierDidChangeNotification:", CFSTR("PHRingtoneControllerAudioSessionIdentifierDidChangeNotification"), v2->_ringtoneController);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "_callStatusChanged:", TUCallCenterVideoCallStatusChangedNotification, 0);
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "INTERRUPT: PHAudioInterruptionController Created", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "frontmostAudioOrVideoCall"));

    if (v9)
    {
      v10 = sub_1000C5588();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "INTERRUPT: ... upon creation there was a current call, updating interruptions for %@", buf, 0xCu);
      }

      -[PHAudioInterruptionController _updateAudioInterruptionsForCall:](v2, "_updateAudioInterruptionsForCall:", v9);
    }
    out_token = 0;
    objc_initWeak((id *)buf, v2);
    v12 = &_dispatch_main_q;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100022E74;
    v14[3] = &unk_1002851E0;
    objc_copyWeak(&v15, (id *)buf);
    notify_register_dispatch("com.apple.ScreenTimeAgent.CommunicationPolicyWarningNotification", &out_token, (dispatch_queue_t)&_dispatch_main_q, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);

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
  v4.super_class = (Class)PHAudioInterruptionController;
  -[PHAudioInterruptionController dealloc](&v4, "dealloc");
}

- (void)_callStatusChanged:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  -[PHAudioInterruptionController _updateAudioInterruptionsForCall:](self, "_updateAudioInterruptionsForCall:", v4);

}

- (void)handleCommunicationPolicyChangedNotification
{
  -[PHAudioInterruptionController _playDowntimeStartingAnnouncementForCallIfNecessary](self, "_playDowntimeStartingAnnouncementForCallIfNecessary");
}

- (void)handlePHRingtoneControllerAudioSessionIdentifierDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  PHAudioInterruptionController *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v7, 0x16u);
  }

  -[PHAudioInterruptionController _playAnnouncementForIncomingCallIfNecessary](self, "_playAnnouncementForIncomingCallIfNecessary");
}

- (void)_updateAudioInterruptionsForCall:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = objc_msgSend(v4, "status");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "INTERRUPT: Call Status changing to: %d", (uint8_t *)v8, 8u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioInterruptionController ringtoneController](self, "ringtoneController"));
  objc_msgSend(v7, "stopAnnouncement");

  if (objc_msgSend(v4, "status") == 4)
    -[PHAudioInterruptionController _playAnnouncementForIncomingCallIfNecessary](self, "_playAnnouncementForIncomingCallIfNecessary");

}

- (void)_callShouldSuppressRingtoneChanged:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "INTERRUPT: shouldSuppressRingtoneChanged notification for call: %@", (uint8_t *)&v8, 0xCu);
  }

  if (v4 && objc_msgSend(v4, "status") == 4)
  {
    if (objc_msgSend(v4, "shouldSuppressRingtone"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioInterruptionController ringtoneController](self, "ringtoneController"));
      objc_msgSend(v7, "stopAnnouncement");

    }
    else
    {
      -[PHAudioInterruptionController _playAnnouncementForIncomingCallIfNecessary](self, "_playAnnouncementForIncomingCallIfNecessary");
    }
  }

}

- (void)_playAnnouncementForIncomingCallIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  unsigned int v19;
  int v20;
  _BYTE v21[10];
  __int16 v22;
  unsigned int v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "incomingCall"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "incomingVideoCall"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayedAudioAndVideoCalls"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  v11 = sub_1000C5588();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    *(_QWORD *)v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "INTERRUPT: incomingCall: %@", (uint8_t *)&v20, 0xCu);
  }

  if (v10
    || !v6
    || (objc_msgSend(v6, "shouldSuppressRingtone") & 1) != 0
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "announceProviderIdentifier")),
        v14 = objc_msgSend(v13, "isEqualToString:", TUBundleIdentifierInCallServiceApplication),
        v13,
        !v14))
  {
    v18 = sub_1000C5588();
    v17 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "shouldSuppressRingtone");
      v20 = 67109632;
      *(_DWORD *)v21 = v6 == 0;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = v10 != 0;
      v22 = 1024;
      v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not playing call announcement since incomingCall is nil (%d) or activeCalls is non-nil (%d) or incomingCall shouldSuppressRingtone (%d)", (uint8_t *)&v20, 0x14u);
    }
  }
  else
  {
    v15 = sub_1000C5588();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      *(_QWORD *)v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Playing call announcement for incoming call %@", (uint8_t *)&v20, 0xCu);
    }

    v17 = objc_claimAutoreleasedReturnValue(-[PHAudioInterruptionController ringtoneController](self, "ringtoneController"));
    -[NSObject playAnnouncementForCall:](v17, "playAnnouncementForCall:", v6);
  }

}

- (void)_playDowntimeStartingAnnouncementForCallIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  int v23;
  _BYTE v24[10];
  __int16 v25;
  id v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayedAudioAndVideoCalls"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "frontmostAudioOrVideoCall"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioInterruptionController handlesForCall:](self, "handlesForCall:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioInterruptionController bundleIdentifierForCall:](self, "bundleIdentifierForCall:", v7));
  if (objc_msgSend(v9, "count") && objc_msgSend(v10, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "callFilterController"));
    v13 = objc_msgSend(v12, "willRestrictAddresses:forBundleIdentifier:", v9, v10);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "routeController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pickedRoute"));
    v17 = objc_msgSend(v16, "isSpeaker");

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v19 = objc_msgSend(v18, "countOfCallsPassingTest:", &stru_100285220);

    v20 = sub_1000C5588();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (!v7 || !v13 || (v17 & 1) != 0 || v19)
    {
      if (v22)
      {
        v23 = 67109634;
        *(_DWORD *)v24 = v13;
        *(_WORD *)&v24[4] = 1024;
        *(_DWORD *)&v24[6] = v17 ^ 1;
        v25 = 2112;
        v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Not playing downtime starting alert: callWillEndDuringDowntime: %d currentRouteIsNotSpeaker: %d call: %@", (uint8_t *)&v23, 0x18u);
      }
    }
    else
    {
      if (v22)
      {
        v23 = 138412290;
        *(_QWORD *)v24 = v7;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Playing downtime starting alert for call %@", (uint8_t *)&v23, 0xCu);
      }

      v21 = objc_claimAutoreleasedReturnValue(-[PHAudioInterruptionController ringtoneController](self, "ringtoneController"));
      -[NSObject playDowntimeStartingAnnouncementForCall:](v21, "playDowntimeStartingAnnouncementForCall:", v7);
    }

  }
}

- (id)handlesForCall:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *j;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteParticipantHandles"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v4, "count")));

  if (objc_msgSend(v3, "isConversation"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v31 = v3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeConversationForCall:", v3));

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v30 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeRemoteParticipants"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v37;
      v12 = (void *)TUCallFilterUnknownCallerAddress;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "handle"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "value"));
          if (objc_msgSend(v16, "length"))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "handle"));
            v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));

          }
          else
          {
            v18 = v12;
          }

          objc_msgSend(v5, "addObject:", v18);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v10);
    }

    v3 = v31;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteParticipantHandles"));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      v23 = (void *)TUCallFilterUnknownCallerAddress;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value"));
          if (objc_msgSend(v26, "length"))
            v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value"));
          else
            v27 = v23;
          v28 = v27;

          objc_msgSend(v5, "addObject:", v28);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v21);
    }

  }
  return v5;
}

- (id)bundleIdentifierForCall:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
  v5 = objc_msgSend(v4, "isTelephonyProvider");

  if (v5)
  {
    v6 = TUBundleIdentifierMobilePhoneApplication;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
    v8 = objc_msgSend(v7, "isFaceTimeProvider");

    if (!v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));

      goto LABEL_7;
    }
    v9 = TUPreferredFaceTimeBundleIdentifier();
    v6 = (id)objc_claimAutoreleasedReturnValue(v9);
  }
  v10 = v6;
LABEL_7:

  return v10;
}

- (PHRingtoneController)ringtoneController
{
  return self->_ringtoneController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringtoneController, 0);
}

@end
