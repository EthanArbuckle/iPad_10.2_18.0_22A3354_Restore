@implementation PHRingtoneController

- (PHRingtoneController)init
{
  PHRingtoneController *v2;
  PHRingtoneController *v3;
  TUUserConfiguration *v4;
  TUUserConfiguration *userConfiguration;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSObject *v10;
  _QWORD block[4];
  PHRingtoneController *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PHRingtoneController;
  v2 = -[PHRingtoneController init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    v2->_audioSessionIdentifier = 0;
    v4 = (TUUserConfiguration *)objc_alloc_init((Class)TUUserConfiguration);
    userConfiguration = v3->_userConfiguration;
    v3->_userConfiguration = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.InCallService.PHRingtoneController", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    v10 = v3->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003EDE4;
    block[3] = &unk_100284898;
    v13 = v3;
    dispatch_async(v10, block);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  -[PHRingtoneController stopObservingNotificationsForAVSystemController:](self, "stopObservingNotificationsForAVSystemController:", v3);

  v4.receiver = self;
  v4.super_class = (Class)PHRingtoneController;
  -[PHRingtoneController dealloc](&v4, "dealloc");
}

- (void)startObservingNotificationsForAVSystemController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[2];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRingtoneController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributeForKey:", AVSystemController_PlayingSessionsDescriptionAttribute));
  if (v6)
    -[PHRingtoneController setAudioSessionIdentifier:](self, "setAudioSessionIdentifier:", -[PHRingtoneController audioSessionIdentifierForSessionDescriptors:](self, "audioSessionIdentifierForSessionDescriptors:", v6));
  v13[0] = AVSystemController_ServerConnectionDiedNotification;
  v13[1] = AVSystemController_SomeSessionIsPlayingDidChangeNotification;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  v12 = 0;
  v8 = objc_msgSend(v4, "setAttribute:forKey:error:", v7, AVSystemController_SubscribeToNotificationsAttribute, &v12);
  v9 = v12;
  if (v8)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    -[NSObject addObserver:selector:name:object:](v10, "addObserver:selector:name:object:", self, "handleAVSystemController_ServerConnectionDiedNotification:", AVSystemController_ServerConnectionDiedNotification, v4);
    -[NSObject addObserver:selector:name:object:](v10, "addObserver:selector:name:object:", self, "handleAVSystemController_SomeSessionIsPlayingDidChangeNotification:", AVSystemController_SomeSessionIsPlayingDidChangeNotification, v4);
  }
  else
  {
    v11 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001A84F4((uint64_t)v9, v10);
  }

}

- (void)stopObservingNotificationsForAVSystemController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, AVSystemController_ServerConnectionDiedNotification, v4);
  objc_msgSend(v5, "removeObserver:name:object:", self, AVSystemController_SomeSessionIsPlayingDidChangeNotification, v4);

}

- (BOOL)_isActivePreferredOutputPort:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  int v11;
  const __CFString *v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUAudioSystemController sharedAudioSystemController](TUAudioSystemController, "sharedAudioSystemController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pickableRouteWithUniqueIdentifier:", v5));
  v7 = objc_msgSend(v6, "isPreferredAndActive");
  if (v7)
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = CFSTR("YES");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preferred output port detected, setting preferredOutputPortEnabled = %@.", (uint8_t *)&v11, 0xCu);
    }

  }
  return v7;
}

- (BOOL)_shouldAnnounceCalls
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  id v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  unsigned int v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  id v41;
  void *v42;
  unsigned int v43;
  id v44;
  NSObject *v45;
  void *v46;
  unsigned int v47;
  id v48;
  NSObject *v49;
  _BOOL4 v50;
  __CFString *v51;
  id v52;
  char v53;
  char v54;
  id v55;
  id v56;
  char v57;
  char v58;
  char v59;
  NSObject *v61;
  __CFString *v62;
  id v63;
  char v64;
  uint64_t v65;
  PHRingtoneController *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  const __CFString *v72;
  __int16 v73;
  id v74;
  _BYTE v75[128];

  v3 = objc_claimAutoreleasedReturnValue(-[PHRingtoneController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v66 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingtoneController userConfiguration](self, "userConfiguration"));
  v5 = objc_msgSend(v4, "announceCalls");

  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString tu_stringWithTUConfigurationAnnounceCalls:](NSString, "tu_stringWithTUConfigurationAnnounceCalls:", v5));
    *(_DWORD *)buf = 138412290;
    v72 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Call announcement preference set to %@", buf, 0xCu);

  }
  if (!v5)
    goto LABEL_74;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v9 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Suppressing the call announcement, Voice Over is active.", buf, 2u);
    }

    goto LABEL_74;
  }
  v11 = (id)-[PHRingtoneController audioSessionIdentifier](v66, "audioSessionIdentifier");
  if (!(_DWORD)v11)
  {
    v12 = sub_1000C5588();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deferring call announcement until audio session is available.", buf, 2u);
    }

  }
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[AVAudioSession retrieveSessionWithID:](AVAudioSession, "retrieveSessionWithID:", v11));
  v15 = v14;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString currentRoute](v14, "currentRoute"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "outputs"));

    if (-[NSObject count](v17, "count"))
    {
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v18 = v17;
      v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      if (v19)
      {
        v61 = v17;
        v62 = v15;
        v63 = v5;
        v65 = 0;
        v64 = 0;
        v20 = 0;
        v21 = *(_QWORD *)v68;
        while (1)
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v68 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)v22);
            v24 = sub_1000C5588();
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "portName"));
              v27 = objc_msgSend(v23, "endpointType");
              *(_DWORD *)buf = 138412546;
              v72 = v26;
              v73 = 2048;
              v74 = v27;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Verifying call announcement eligibility of output port %@ with endpoint type '%tu'.", buf, 0x16u);

            }
            v28 = (uint64_t)objc_msgSend(v23, "endpointType");
            if (v28 <= 1953790302)
            {
              if (v28 != 1751412846)
              {
                if (v28 != 1936747378)
                  goto LABEL_45;
                v31 = sub_1000C5588();
                v32 = objc_claimAutoreleasedReturnValue(v31);
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v72 = CFSTR("YES");
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Connected to an external speaker, setting speakerEnabled = %@.", buf, 0xCu);
                }

                goto LABEL_33;
              }
              v41 = sub_1000C5588();
              v38 = objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v72 = CFSTR("YES");
                v39 = v38;
                v40 = "Headphones output port detected, setting headphonesEnabled = %@.";
LABEL_42:
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 0xCu);
              }
LABEL_43:

              BYTE4(v65) = -[PHRingtoneController _isActivePreferredOutputPort:](v66, "_isActivePreferredOutputPort:", v23);
LABEL_44:
              v20 = 1;
              goto LABEL_45;
            }
            switch(v28)
            {
              case 1953790303:
                v33 = sub_1000C5588();
                v34 = objc_claimAutoreleasedReturnValue(v33);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Call announcements via TTY are not supported.", buf, 2u);
                }

                break;
              case 1969977198:
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "portType"));
                v36 = objc_msgSend(v35, "isEqualToString:", AVAudioSessionPortBluetoothHFP);

                if (v36)
                {
                  v37 = sub_1000C5588();
                  v38 = objc_claimAutoreleasedReturnValue(v37);
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v72 = CFSTR("YES");
                    v39 = v38;
                    v40 = "Bluetooth Hands-Free Profile output port detected, setting headphonesEnabled = %@.";
                    goto LABEL_42;
                  }
                  goto LABEL_43;
                }
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "portType"));
                v43 = objc_msgSend(v42, "isEqualToString:", AVAudioSessionPortHeadphones);

                if (v43)
                {
                  v44 = sub_1000C5588();
                  v45 = objc_claimAutoreleasedReturnValue(v44);
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v72 = CFSTR("YES");
                    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Headphone or headset output port detected, setting headphonesEnabled = %@.", buf, 0xCu);
                  }

                  goto LABEL_44;
                }
                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "portType"));
                v47 = objc_msgSend(v46, "isEqualToString:", AVAudioSessionPortBuiltInSpeaker);

                v48 = sub_1000C5588();
                v49 = objc_claimAutoreleasedReturnValue(v48);
                v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
                if (v47)
                {
                  if (v50)
                  {
                    *(_DWORD *)buf = 138412290;
                    v72 = CFSTR("YES");
                    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Built-in speaker output port detected, setting speakerEnabled = %@.", buf, 0xCu);
                  }

LABEL_33:
                  LOBYTE(v65) = 1;
                  break;
                }
                if (v50)
                {
                  v51 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "portName"));
                  *(_DWORD *)buf = 138412290;
                  v72 = v51;
                  _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Call announcements via %@ are not supported.", buf, 0xCu);

                }
                break;
              case 1986552684:
                v29 = sub_1000C5588();
                v30 = objc_claimAutoreleasedReturnValue(v29);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v72 = CFSTR("YES");
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Connected to a vehicle via bluetooth, setting connectedToVehicle = %@.", buf, 0xCu);
                }

                v64 = 1;
                break;
            }
LABEL_45:
            v22 = (char *)v22 + 1;
          }
          while (v19 != v22);
          v52 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
          v19 = v52;
          if (!v52)
          {
            v15 = v62;
            v5 = v63;
            v17 = v61;
            v53 = v64;
            v54 = v65;
            LOBYTE(v19) = BYTE4(v65);
            goto LABEL_68;
          }
        }
      }
      v54 = 0;
    }
    else
    {
      v56 = sub_1000C5588();
      v18 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v15;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Suppressing the call announcement, could not retrieve any output routes for the specified audio session (%@).", buf, 0xCu);
      }
      v5 = 0;
      v54 = 0;
      LOBYTE(v19) = 0;
    }
    v53 = 0;
    v20 = 0;
LABEL_68:

  }
  else
  {
    v55 = sub_1000C5588();
    v17 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1001A8568((int)v11, v17);
    v54 = 0;
    LOBYTE(v19) = 0;
    v53 = 0;
    v20 = 0;
  }

  if (v15)
  {
    if (v5 == (id)1)
    {
      v57 = v20 | v19;
      v58 = v54 | v53;
    }
    else
    {
      if (v5 == (id)3)
      {
        v59 = v20 & ((v54 & 1) == 0) | v19;
        return v59 & 1;
      }
      if (v5 != (id)2)
        goto LABEL_74;
      v57 = v20 & ((v54 & 1) == 0);
      v58 = v19 | v53;
    }
    v59 = v57 | v58;
    return v59 & 1;
  }
LABEL_74:
  v59 = 0;
  return v59 & 1;
}

- (void)_playCallAnnouncement:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;

  v4 = a3;
  if (-[PHRingtoneController _shouldAnnounceCalls](self, "_shouldAnnounceCalls"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingtoneController callAnnouncement](self, "callAnnouncement"));

    if (v5)
    {
      v6 = sub_1000C5588();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingtoneController callAnnouncement](self, "callAnnouncement"));
        v13 = 138412546;
        v14 = v8;
        v15 = 2112;
        v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Announcements are enabled but already playing a call announcement (%@), so will not play call announcement (%@).", (uint8_t *)&v13, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v4, "setAudioSessionIdentifier:", -[PHRingtoneController audioSessionIdentifier](self, "audioSessionIdentifier"));
      -[PHRingtoneController setCallAnnouncement:](self, "setCallAnnouncement:", v4);
      v10 = sub_1000C5588();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingtoneController callAnnouncement](self, "callAnnouncement"));
        v13 = 138412290;
        v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Announcements are enabled, playing call announcement (%@).", (uint8_t *)&v13, 0xCu);

      }
      v7 = objc_claimAutoreleasedReturnValue(-[PHRingtoneController callAnnouncement](self, "callAnnouncement"));
      -[NSObject start](v7, "start");
    }
  }
  else
  {
    v9 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Announcements are disabled, will not play call announcement (%@).", (uint8_t *)&v13, 0xCu);
    }
  }

}

- (void)playAnnouncementForCall:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICSCallAnnouncement announcementWithCall:](ICSSiriCallAnnouncement, "announcementWithCall:", a3));
  v5 = objc_claimAutoreleasedReturnValue(-[PHRingtoneController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003FC50;
  v7[3] = &unk_100285158;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)playDowntimeStartingAnnouncementForCall:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICSCallAnnouncement announcementWithCall:](ICSDowntimeAnnouncement, "announcementWithCall:", a3));
  -[PHRingtoneController setCallAnnouncement:](self, "setCallAnnouncement:", v4);
  v5 = objc_claimAutoreleasedReturnValue(-[PHRingtoneController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FD04;
  block[3] = &unk_100284898;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (void)stopAnnouncement
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[PHRingtoneController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FD78;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_async(v3, block);

}

- (unsigned)audioSessionIdentifier
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[PHRingtoneController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_audioSessionIdentifier;
}

- (void)setAudioSessionIdentifier:(unsigned int)a3
{
  NSObject *v5;
  _QWORD block[5];

  v5 = objc_claimAutoreleasedReturnValue(-[PHRingtoneController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (self->_audioSessionIdentifier != a3)
  {
    self->_audioSessionIdentifier = a3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003FED8;
    block[3] = &unk_100284898;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)handleAVSystemController_ServerConnectionDiedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *queue;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  PHRingtoneController *v14;
  __int16 v15;
  id v16;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v9 = objc_opt_class(AVSystemController, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100040068;
    v11[3] = &unk_100285158;
    v11[4] = self;
    v12 = v7;
    dispatch_async(queue, v11);

  }
}

- (void)handleAVSystemController_SomeSessionIsPlayingDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  PHRingtoneController *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", AVSystemController_SomeSessionIsPlayingDidChangeNotificationParameter_Sessions));

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[PHRingtoneController queue](self, "queue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100040214;
    v10[3] = &unk_100285158;
    v10[4] = self;
    v11 = v8;
    dispatch_async(v9, v10);

  }
}

- (unsigned)audioSessionIdentifierForSessionDescriptors:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  id v23;
  unsigned int v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  _BYTE v38[128];

  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v4)
  {
    v5 = v4;
    v25 = 0;
    v6 = *(_QWORD *)v33;
    v27 = TUBundleIdentifierCallServicesDaemon;
    v26 = v3;
    v29 = *(_QWORD *)v33;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v9 = AVSystemController_PlayingSessionsDescriptionKey_ClientPID;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));
        v12 = objc_opt_class(NSNumber, v11);
        if ((objc_opt_isKindOfClass(v10, v12) & 1) == 0)
        {
          v15 = 0;
          v22 = 3;
          goto LABEL_25;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", objc_msgSend(v10, "intValue")));
        if (v13)
        {
          v31 = 0;
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v13, &v31));
          v15 = v31;
          if (v14)
          {
            v16 = objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingServiceName:](RBSProcessPredicate, "predicateMatchingServiceName:", v27));
            if (v16)
            {
              v30 = 0;
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", v16, &v30));
              v28 = v30;

              if (v17 && objc_msgSend(v14, "isEqual:", v17))
              {
                v18 = AVSystemController_PlayingSessionsDescriptionKey_AudioSessionID;

                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v18));
                v21 = objc_opt_class(NSNumber, v20);
                if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0)
                {
                  v25 = objc_msgSend(v19, "unsignedIntValue");
                  v22 = 2;
                }
                else
                {
                  v22 = 3;
                }
                v10 = v19;
                v9 = v18;
              }
              else
              {
                v22 = 3;
              }
              v15 = v28;

              v3 = v26;
              goto LABEL_23;
            }
          }
          else
          {
            v23 = sub_1000C5588();
            v16 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Retrieving process handle failed with error %@", buf, 0xCu);
            }
          }
          v22 = 3;
LABEL_23:

          v6 = v29;
          goto LABEL_24;
        }
        v15 = 0;
        v22 = 3;
LABEL_24:

LABEL_25:
        if (v22 != 3)
          goto LABEL_30;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (!v5)
        goto LABEL_30;
    }
  }
  v25 = 0;
LABEL_30:

  return v25;
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (ICSCallAnnouncement)callAnnouncement
{
  return self->_callAnnouncement;
}

- (void)setCallAnnouncement:(id)a3
{
  objc_storeStrong((id *)&self->_callAnnouncement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callAnnouncement, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userConfiguration, 0);
}

@end
