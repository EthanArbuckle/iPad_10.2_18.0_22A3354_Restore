@implementation ICSApplicationDelegate

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICSApplicationDelegate;
  -[ICSApplicationDelegate dealloc](&v4, "dealloc");
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  unsigned int v10;
  BOOL v11;
  CNKScreenSharingStateMonitorFactory *v12;
  CNKScreenSharingStateMonitorFactory *screenSharingMonitorFactory;
  CNKScreenSharingInteractionControllerFactory *v14;
  CNKScreenSharingInteractionControllerFactory *screenSharingInteractionControllerFactory;
  id v16;
  void *v17;
  TURTCCallReporter *v18;
  TURTCCallReporter *callReporter;
  CNKAnsweringMachine *answeringMachine;
  void *v21;
  CNKAnsweringMachine *v22;
  id v23;
  id v24;
  id v25;
  ICSSceneManager *v26;
  void *v27;
  id v28;
  ICSAmbientActivityController *v29;
  void *v30;
  void *v31;
  void *v32;
  ICSAmbientActivityController *v33;
  ICSAmbientActivityController *ambientActivityController;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  void *i;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  void *j;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  unsigned int v77;
  void *v78;
  void *v80;
  char v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  objc_super v91;
  _BYTE v92[128];
  uint8_t v93[128];
  uint8_t buf[4];
  id v95;
  __int16 v96;
  id v97;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v95 = v6;
    v96 = 2112;
    v97 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@, didFinishLaunchingWithOptions: %@", buf, 0x16u);
  }

  v91.receiver = self;
  v91.super_class = (Class)ICSApplicationDelegate;
  v10 = -[PHApplicationDelegate application:didFinishLaunchingWithOptions:](&v91, "application:didFinishLaunchingWithOptions:", v6, v7);
  v11 = v10;
  if (v10)
  {
    v81 = v10;
    v12 = objc_opt_new(CNKScreenSharingStateMonitorFactory);
    screenSharingMonitorFactory = self->_screenSharingMonitorFactory;
    self->_screenSharingMonitorFactory = v12;

    v14 = objc_opt_new(CNKScreenSharingInteractionControllerFactory);
    screenSharingInteractionControllerFactory = self->_screenSharingInteractionControllerFactory;
    self->_screenSharingInteractionControllerFactory = v14;

    -[ICSApplicationDelegate addNotificationObservers](self, "addNotificationObservers");
    -[ICSApplicationDelegate installCameraStateMonitor](self, "installCameraStateMonitor");
    -[ICSApplicationDelegate installPillStateMonitor](self, "installPillStateMonitor");
    v16 = objc_alloc((Class)TURTCCallReporter);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v18 = (TURTCCallReporter *)objc_msgSend(v16, "initWithCallCenter:", v17);
    callReporter = self->_callReporter;
    self->_callReporter = v18;

    answeringMachine = (CNKAnsweringMachine *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
    if (TUCallScreeningActivatable(answeringMachine, 0))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate answeringMachine](self, "answeringMachine"));

      if (v21)
      {
LABEL_8:
        v82 = v6;
        TURegisterIDSAvailabilityListener();
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100285738);
        v23 = objc_alloc_init((Class)NSMutableSet);
        -[ICSApplicationDelegate setAllInCallScenes:](self, "setAllInCallScenes:", v23);

        v24 = objc_alloc_init((Class)NSMutableSet);
        -[ICSApplicationDelegate setConnectedSceneSessionIdentifiers:](self, "setConnectedSceneSessionIdentifiers:", v24);

        v25 = objc_alloc_init((Class)NSMutableSet);
        -[ICSApplicationDelegate setConnectedCallIdentifiers:](self, "setConnectedCallIdentifiers:", v25);

        v26 = objc_alloc_init(ICSSceneManager);
        -[ICSApplicationDelegate setSceneManager:](self, "setSceneManager:", v26);

        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
        -[ICSApplicationDelegate setBackgroundPIPAuthorizationForSceneType:](self, "setBackgroundPIPAuthorizationForSceneType:", v27);

        v28 = objc_alloc_init((Class)CARSessionStatus);
        -[ICSApplicationDelegate setCarKitSessionStatus:](self, "setCarKitSessionStatus:", v28);

        v29 = [ICSAmbientActivityController alloc];
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
        v33 = -[ICSAmbientActivityController initWithCallCenter:notificationCenter:sceneManager:](v29, "initWithCallCenter:notificationCenter:sceneManager:", v30, v31, v32);
        ambientActivityController = self->_ambientActivityController;
        self->_ambientActivityController = v33;

        v35 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "frontmostAudioOrVideoCall"));

        -[ICSApplicationDelegate updateRemoteAlertStateIfNecessaryForCall:](self, "updateRemoteAlertStateIfNecessaryForCall:", v36);
        v80 = (void *)v36;
        if (!v36)
          -[ICSApplicationDelegate showBannerIfNecessaryForHandoffEligibleConversation](self, "showBannerIfNecessaryForHandoffEligibleConversation");
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "callServicesClientCapabilities"));
        objc_msgSend(v38, "setWantsCallStopStreamingOnInvalidation:", 1);

        v39 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "callServicesClientCapabilities"));
        objc_msgSend(v40, "setWantsCallNotificationsDisabledWhileSuspended:", 1);

        v41 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "callServicesClientCapabilities"));
        objc_msgSend(v42, "save");

        v43 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "routeController"));
        objc_msgSend(v44, "addDelegate:", self);

        v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
        if (objc_msgSend(v45, "conversationOneToOneModeEnabled"))
          v46 = 2;
        else
          v46 = 0;
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "conversationManager"));
        objc_msgSend(v48, "setNonSessionBackedConversationCreationMode:", v46);

        v49 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "conversationManager"));
        objc_msgSend(v50, "setNonSessionBackedConversationCreationQueue:", &_dispatch_main_q);

        v51 = objc_msgSend(objc_alloc((Class)TUUIXPCHost), "initWithDelegate:delegateQueue:", self, &_dispatch_main_q);
        -[ICSApplicationDelegate setXpcHost:](self, "setXpcHost:", v51);

        v52 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate xpcHost](self, "xpcHost"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endpoint"));
        objc_msgSend(v52, "registerAnonymousXPCEndpoint:", v54);

        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "currentVideoCalls"));

        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
        if (v57)
        {
          v58 = v57;
          v59 = *(_QWORD *)v88;
          do
          {
            for (i = 0; i != v58; i = (char *)i + 1)
            {
              if (*(_QWORD *)v88 != v59)
                objc_enumerationMutation(v56);
              v61 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
              if ((objc_msgSend(v61, "isConversation") & 1) == 0)
              {
                v62 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
                v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "conversationManager"));
                objc_msgSend(v63, "updateConversationsNotBackedByGroupSessionWithCall:", v61);

              }
            }
            v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
          }
          while (v58);
        }

        v64 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "conversationManager"));
        objc_msgSend(v65, "addDelegate:queue:", self, &_dispatch_main_q);

        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "conversationManager"));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "activeConversations"));

        v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
        if (v69)
        {
          v70 = v69;
          v71 = *(_QWORD *)v84;
          do
          {
            for (j = 0; j != v70; j = (char *)j + 1)
            {
              if (*(_QWORD *)v84 != v71)
                objc_enumerationMutation(v68);
              v73 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)j);
              v74 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
              v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "conversationManager"));
              -[ICSApplicationDelegate conversationManager:addedActiveConversation:](self, "conversationManager:addedActiveConversation:", v75, v73);

            }
            v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
          }
          while (v70);
        }

        -[ICSApplicationDelegate prewarmBannerPresentationManager](self, "prewarmBannerPresentationManager");
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
        v77 = objc_msgSend(v76, "nameAndPhotoEnabled");

        if (v77)
        {
          v78 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
          objc_msgSend(v78, "addListenerID:capabilities:", TUBundleIdentifierInCallServiceApplication, kFZListenerCapAccounts);

        }
        +[CNKNameAndPhotoUtilities prewarm](CNKNameAndPhotoUtilities, "prewarm");

        v6 = v82;
        v11 = v81;
        goto LABEL_32;
      }
      v22 = (CNKAnsweringMachine *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate makeAnsweringMachineWithPrivateSelf:](self, "makeAnsweringMachineWithPrivateSelf:", self));
      answeringMachine = self->_answeringMachine;
      self->_answeringMachine = v22;
    }

    goto LABEL_8;
  }
LABEL_32:

  return v11;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  unsigned __int8 v32;
  NSObject *v33;
  id v34;
  unsigned __int8 v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  unsigned int v54;
  id v55;
  NSObject *v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  void *v67;
  id v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  void *v72;
  id v73;
  _BOOL4 v74;
  void *v75;
  NSObject *v76;
  NSObject *v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  objc_super v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  const __CFString *v92;
  uint8_t buf[4];
  id v94;
  __int16 v95;
  id v96;
  __int16 v97;
  id v98;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_1000C5588();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v94 = v8;
    v95 = 2112;
    v96 = v9;
    v97 = 2112;
    v98 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@, url: %@ options: %@", buf, 0x20u);
  }

  v13 = sub_1000C5588();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v9, "isLaunchForScreeningURL");
    v16 = CFSTR("NO");
    if (v15)
      v16 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v94 = (id)v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Are we launched for screening: %@", buf, 0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  objc_msgSend(v17, "fetchCurrentCalls");

  if (-[ICSApplicationDelegate isSOSCall:](self, "isSOSCall:", v9))
  {
    v18 = sub_1000C5588();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SOS url detected", buf, 2u);
    }

    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sos_urlActivationReason"));
    -[ICSApplicationDelegate startSOSFlowWithActivationReason:](self, "startSOSFlowWithActivationReason:", v20);
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "isShowInCallUIURL") || objc_msgSend(v9, "isShowKeypadURL"))
    goto LABEL_14;
  if (objc_msgSend(v9, "isShowSystemCallControlsURL"))
  {
    if (!TUCallScreeningEnabled(0, 0)
      || (v22 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance")),
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "frontmostCall")),
          v24 = objc_msgSend(v23, "isScreening"),
          v23,
          v22,
          !v24))
    {
      if (-[ICSApplicationDelegate showSystemCallControlsURL:](self, "showSystemCallControlsURL:", v9))
        goto LABEL_15;
      goto LABEL_20;
    }
LABEL_14:
    if (-[ICSApplicationDelegate openUserInterfaceURL:](self, "openUserInterfaceURL:", v9))
      goto LABEL_15;
LABEL_20:
    v87.receiver = self;
    v87.super_class = (Class)ICSApplicationDelegate;
    v21 = -[PHApplicationDelegate application:openURL:options:](&v87, "application:openURL:options:", v8, v9, v10);
    goto LABEL_21;
  }
  if (objc_msgSend(v9, "isShowHandoffEligibleNearbyURL")
    || objc_msgSend(v9, "isShowLagunaPullConversationURL"))
  {
    goto LABEL_14;
  }
  if (objc_msgSend(v9, "isShowScreenSharingURL"))
  {
    if (-[ICSApplicationDelegate showScreenSharingURL:](self, "showScreenSharingURL:", v9))
      goto LABEL_15;
    goto LABEL_20;
  }
  if (objc_msgSend(v9, "isShowIncomingTransmissionNoticeURL")
    || objc_msgSend(v9, "isShowAccessoryButtonEventsNoticeURL"))
  {
    goto LABEL_14;
  }
  if (objc_msgSend(v9, "isUpdateForegroundAppURL"))
  {
    if (-[ICSApplicationDelegate updateForegroundAppURL:](self, "updateForegroundAppURL:", v9))
      goto LABEL_15;
    goto LABEL_20;
  }
  if (objc_msgSend(v9, "isRefreshShareableContentURL"))
  {
    if (-[ICSApplicationDelegate refreshShareableContentURL:](self, "refreshShareableContentURL:", v9))
      goto LABEL_15;
    goto LABEL_20;
  }
  if (objc_msgSend(v9, "isFaceTimeMultiwayURL"))
  {
    v26 = objc_msgSend(objc_alloc((Class)TUJoinConversationRequest), "initWithURL:", v9);
    if (!v26)
      goto LABEL_20;
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", _UIApplicationOpenURLOptionsSourceProcessHandleKey));
    v30 = objc_opt_class(BSProcessHandle, v29);
    if ((objc_opt_isKindOfClass(v28, v30) & 1) != 0)
    {
      v31 = (objc_msgSend(v27, "showUIPrompt") & 1) != 0
         || -[ICSApplicationDelegate shouldShowPromptForProcessHandle:](self, "shouldShowPromptForProcessHandle:", v28);
      objc_msgSend(v27, "setShowUIPrompt:", v31);
      v32 = -[ICSApplicationDelegate openJoinConversationRequest:](self, "openJoinConversationRequest:", v27);
LABEL_50:
      v35 = v32;

      if ((v35 & 1) != 0)
        goto LABEL_15;
      goto LABEL_20;
    }
    v34 = sub_1000C5588();
    v33 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_1001A8680();
LABEL_47:

    goto LABEL_20;
  }
  if (objc_msgSend(v9, "isFaceTimeOpenLinkURL"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "conversationLinkURLForOpenLinkURL"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[TUConversationLink conversationLinkForURL:](TUConversationLink, "conversationLinkForURL:", v27));
    v32 = -[ICSApplicationDelegate application:openJoinConversationRequestForConversationLink:webpageURL:](self, "application:openJoinConversationRequestForConversationLink:webpageURL:", v8, v28, v9);
    goto LABEL_50;
  }
  if (objc_msgSend(v9, "isLaunchForIncomingCallURL"))
    goto LABEL_14;
  if (objc_msgSend(v9, "isAnswerRequestURL"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate incomingVideoCallUsingCallContainer:](self, "incomingVideoCallUsingCallContainer:", v27));
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "answerRequestSourceIdentifier"));
    -[ICSApplicationDelegate handleHeadsetButtonPressForCall:sourceIdentifier:urlOptions:](self, "handleHeadsetButtonPressForCall:sourceIdentifier:urlOptions:", v28, v33, v10);
    goto LABEL_47;
  }
  if (objc_msgSend(v9, "isFaceTimeNeedsBackgroundLaunchURL"))
  {
    if (-[ICSApplicationDelegate handleBackgroundLaunchURL:](self, "handleBackgroundLaunchURL:", v9))
      goto LABEL_15;
    goto LABEL_20;
  }
  if (objc_msgSend(v9, "isVideoMessagePlaybackURL"))
  {
    if (-[ICSApplicationDelegate openVideoMessagePlaybackURL:](self, "openVideoMessagePlaybackURL:", v9))
      goto LABEL_15;
    goto LABEL_20;
  }
  if (objc_msgSend(v9, "isLaunchForScreeningURL"))
  {
    v36 = sub_1000C5588();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate answeringMachine](self, "answeringMachine"));
      *(_DWORD *)buf = 138412290;
      v94 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Launched for screening %@", buf, 0xCu);

    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate answeringMachine](self, "answeringMachine"));
    objc_msgSend(v39, "openURL:completion:", v9, &stru_100285758);

    goto LABEL_15;
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  if (objc_msgSend(v40, "isRunningTest:", CFSTR("PlaceOutgoingCall")))
  {

LABEL_65:
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v43, "finishedSubTest:forTest:", CFSTR("applicationOpenURL"), qword_1002E2CB0);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v45 = qword_1002E2CB0;
    v92 = CFSTR("time");
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v92, 1));
    objc_msgSend(v44, "startedSubTest:forTest:withMetrics:", CFSTR("CreateDialRequest"), v45, v46);

    v20 = objc_msgSend(objc_alloc((Class)TUDialRequest), "initWithURL:", v9);
    v47 = sub_1000C5588();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v94 = v20;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Running test, made dial request: %@", buf, 0xCu);
    }

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v49, "finishedSubTest:forTest:", CFSTR("CreateDialRequest"), qword_1002E2CB0);
    goto LABEL_68;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v42 = objc_msgSend(v41, "isRunningTest:", CFSTR("FaceTimePlaceOutgoingCall"));

  if (v42)
    goto LABEL_65;
  v20 = objc_msgSend(objc_alloc((Class)TUDialRequest), "initWithURL:", v9);
  v57 = sub_1000C5588();
  v58 = objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v94 = v20;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Not running test, made dial request: %@", buf, 0xCu);
  }

  if (+[PHDevice isGeminiCapable](PHDevice, "isGeminiCapable"))
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "provider"));
    if (!objc_msgSend(v49, "isTelephonyProvider"))
    {
LABEL_68:

      goto LABEL_69;
    }
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localSenderIdentityAccountUUID"));

    if (!v59)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[ICSApplicationServices sharedInstance](ICSApplicationServices, "sharedInstance"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "contactGeminiManager"));

      v61 = (void *)objc_claimAutoreleasedReturnValue(+[ICSApplicationServices sharedInstance](ICSApplicationServices, "sharedInstance"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "contactStore"));

      v62 = (void *)objc_claimAutoreleasedReturnValue(+[CNGeminiManager descriptorForRequiredKeys](CNGeminiManager, "descriptorForRequiredKeys"));
      v91 = v62;
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v91, 1));

      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "contactIdentifier"));
      if (v86)
      {
        v63 = sub_1000C5588();
        v64 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v94 = v86;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Retrieving contact with identifier %@", buf, 0xCu);
        }

        v90 = 0;
        v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "unifiedContactWithIdentifier:keysToFetch:error:", v86, v84, &v90));
        v66 = v90;
        v67 = v66;
        if (!v65)
        {
          if (!v66 || objc_msgSend(v66, "code") == (id)200)
            goto LABEL_113;
          v78 = sub_1000C5588();
          v70 = objc_claimAutoreleasedReturnValue(v78);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            sub_1001A87A0();
          v82 = v67;
          goto LABEL_105;
        }
        v68 = sub_1000C5588();
        v69 = objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v94 = v65;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Retrieving sender identity for contact %@", buf, 0xCu);
        }

        v89 = v67;
        v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bestSenderIdentityForContact:error:", v65, &v89));
        v82 = v89;

        if (v70)
        {
          v71 = objc_claimAutoreleasedReturnValue(-[NSObject accountUUID](v70, "accountUUID"));
          objc_msgSend(v20, "setLocalSenderIdentityAccountUUID:", v71);
        }
        else
        {
          if (!v82)
          {
LABEL_105:

            v67 = v82;
LABEL_113:

            goto LABEL_68;
          }
          v79 = sub_1000C5588();
          v71 = objc_claimAutoreleasedReturnValue(v79);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            sub_1001A8800();
        }

        goto LABEL_105;
      }
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "handle"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "cnHandle"));

      v73 = sub_1000C5588();
      v65 = objc_claimAutoreleasedReturnValue(v73);
      v74 = os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
      if (!v67)
      {
        if (v74)
        {
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "handle"));
          *(_DWORD *)buf = 138412290;
          v94 = v80;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Could not create a contact handle from dial request handle %@.", buf, 0xCu);

        }
        goto LABEL_113;
      }
      if (v74)
      {
        *(_DWORD *)buf = 138412290;
        v94 = v67;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Retrieving sender identity for contact handle %@", buf, 0xCu);
      }

      v88 = 0;
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bestSenderIdentityForHandle:contactStore:error:", v67, v85, &v88));
      v76 = v88;
      v65 = v76;
      v83 = v75;
      if (v75)
      {
        v77 = objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "accountUUID"));
        objc_msgSend(v20, "setLocalSenderIdentityAccountUUID:", v77);
      }
      else
      {
        if (!v76)
        {
LABEL_112:

          goto LABEL_113;
        }
        v81 = sub_1000C5588();
        v77 = objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          sub_1001A8740();
      }

      goto LABEL_112;
    }
  }
LABEL_69:
  if (!v20)
    goto LABEL_20;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", _UIApplicationOpenURLOptionsSourceProcessHandleKey));
  v52 = objc_opt_class(BSProcessHandle, v51);
  if ((objc_opt_isKindOfClass(v50, v52) & 1) == 0)
  {
    v55 = sub_1000C5588();
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      sub_1001A86E0();
    goto LABEL_89;
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "provider"));
  v54 = objc_msgSend(v53, "isSystemProvider");

  if (!v54)
  {
    v56 = objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    -[NSObject launchAppForDialRequest:completion:](v56, "launchAppForDialRequest:completion:", v20, 0);
LABEL_89:

    goto LABEL_90;
  }
  -[ICSApplicationDelegate openDialRequest:forProcessHandle:](self, "openDialRequest:forProcessHandle:", v20, v50);
LABEL_90:

LABEL_11:
LABEL_15:
  v21 = 1;
LABEL_21:

  return v21;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  unsigned int v42;
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v60;
  unsigned __int8 v61;
  id v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  id v66;

  v7 = a3;
  v8 = a4;
  v9 = sub_1000C5588();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v64 = v7;
    v65 = 2112;
    v66 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@, continueUserActivity: %@", buf, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  objc_msgSend(v11, "fetchCurrentCalls");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType"));
  if ((objc_msgSend(v12, "isEqual:", NSUserActivityTypeBrowsingWeb) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "webpageURL"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "webpageURL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUConversationLink conversationLinkForURL:](TUConversationLink, "conversationLinkForURL:", v14));

      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "webpageURL"));
      v17 = -[ICSApplicationDelegate application:openJoinConversationRequestForConversationLink:webpageURL:](self, "application:openJoinConversationRequestForConversationLink:webpageURL:", v7, v15, v16);
LABEL_58:

      goto LABEL_59;
    }
  }
  else
  {

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  if ((objc_msgSend(v18, "conversationHandoffEnabled") & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType"));
    v20 = objc_msgSend(v19, "isEqualToString:", TUUserActivityTypeConversationHandoff);

    if (v20)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      objc_msgSend(v15, "continueHandoffEligibleConversation");
      v17 = 1;
      goto LABEL_59;
    }
  }
  else
  {

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType"));
  v22 = objc_msgSend(v21, "isEqualToString:", TUUserActivityTypeJoinConversationRequest);

  if (!v22)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interaction"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "intentResponse"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dialRequestAttachment"));
    v30 = v29;
    if (v29)
    {
      v16 = v29;
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userActivity"));
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "dialRequestAttachment"));

    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "joinRequestAttachment"));
    v35 = v34;
    if (v34)
    {
      v36 = v34;
    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userActivity"));
      v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "joinRequestAttachment"));

    }
    if (v16)
    {
      v38 = sub_1000C5588();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v16;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Opening TUDialRequest from NSUserActivity attachment: %@", buf, 0xCu);
      }

      if (!objc_msgSend(v16, "originatingUIType"))
      {
        v40 = sub_1000C5588();
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Setting dialRequest originatingUIType to Siri", buf, 2u);
        }

        objc_msgSend(v16, "setOriginatingUIType:", 11);
      }
      v42 = objc_msgSend(v16, "originatingUIType");
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[BSProcessHandle processHandle](BSProcessHandle, "processHandle"));
      v17 = -[ICSApplicationDelegate openDialRequest:forProcessHandle:](self, "openDialRequest:forProcessHandle:", v16, v43);

LABEL_40:
      if (v42 == 11)
        +[TPTipsHelper donateEventOriginatedCallWithSiri](TPTipsHelper, "donateEventOriginatedCallWithSiri");
      goto LABEL_57;
    }
    if (v36)
    {
      v44 = sub_1000C5588();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v36;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Opening TUJoinConversationRequest from NSUserActivity attachment: %@", buf, 0xCu);
      }

      if (!objc_msgSend(v36, "originatingUIType"))
      {
        v46 = sub_1000C5588();
        v47 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Setting joinRequest originatingUIType to Siri", buf, 2u);
        }

        objc_msgSend(v36, "setOriginatingUIType:", 11);
      }
      v42 = objc_msgSend(v36, "originatingUIType");
      v17 = -[ICSApplicationDelegate openJoinConversationRequest:](self, "openJoinConversationRequest:", v36);
      goto LABEL_40;
    }
    v48 = objc_msgSend(objc_alloc((Class)TUJoinConversationRequest), "initWithUserActivity:", v8);
    v49 = v48;
    if (v48)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "remoteMembers"));
      v51 = objc_msgSend(v50, "count");

      if ((unint64_t)v51 >= 2)
      {
        v52 = sub_1000C5588();
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v49;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "More than one valid contact found. Making a group facetime call with joinRequest: %@", buf, 0xCu);
        }

        v17 = -[ICSApplicationDelegate openJoinConversationRequest:](self, "openJoinConversationRequest:", v49);
        goto LABEL_56;
      }
    }
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType"));
    if ((objc_msgSend(v54, "isEqualToString:", TUDialRequestUserActivityTypeCall) & 1) == 0)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType"));
      if (!objc_msgSend(v55, "isEqualToString:", TUDialRequestUserActivityTypeAudioCall))
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType"));
        v61 = objc_msgSend(v60, "isEqualToString:", TUDialRequestUserActivityTypeVideoCall);

        if ((v61 & 1) == 0)
        {
          v17 = 0;
LABEL_56:

LABEL_57:
          goto LABEL_58;
        }
LABEL_51:
        v56 = objc_msgSend(objc_alloc((Class)TUDialRequest), "initWithUserActivity:", v8);
        v57 = v56;
        if (v56 && objc_msgSend(v56, "isValid"))
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[BSProcessHandle processHandle](BSProcessHandle, "processHandle"));
          v17 = -[ICSApplicationDelegate openDialRequest:forProcessHandle:](self, "openDialRequest:forProcessHandle:", v57, v58);

        }
        else
        {
          v17 = 0;
        }

        goto LABEL_56;
      }

    }
    goto LABEL_51;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", TUUserActivityJoinConversationRequestUserInfoKey));

  v62 = 0;
  v25 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(TUJoinConversationRequest, v24), v15, &v62);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = v62;
  if (v26)
  {
    v17 = -[ICSApplicationDelegate openJoinConversationRequest:](self, "openJoinConversationRequest:", v26);
  }
  else
  {
    v31 = sub_1000C5588();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_1001A8860();

    v17 = 0;
  }

LABEL_59:
  return v17;
}

- (BOOL)application:(id)a3 openJoinConversationRequestForConversationLink:(id)a4 webpageURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  unsigned __int8 v20;
  void *v21;
  unsigned int v22;
  ICSInterruptCallAlert *v23;
  ICSInterruptCallAlert *v24;
  id v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unsigned int v35;
  id v36;
  NSObject *v37;
  id v38;
  id v39;
  NSObject *v40;
  void *v41;
  _QWORD v43[4];
  NSObject *v44;
  uint8_t v45[8];
  id v46;
  _QWORD v47[4];
  id v48;
  ICSApplicationDelegate *v49;
  id v50;
  id location;
  uint8_t buf[24];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    objc_initWeak(&location, self);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10004A44C;
    v47[3] = &unk_100285780;
    objc_copyWeak(&v50, &location);
    v48 = v9;
    v49 = self;
    v11 = objc_retainBlock(v47);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](FTDeviceSupport, "sharedInstance"));
    v13 = objc_msgSend(v12, "faceTimeAvailable");

    if ((v13 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
      if ((objc_msgSend(v14, "greenTeaLinksEnabled") & 1) != 0)
      {

        goto LABEL_12;
      }
      v20 = +[TUConversationManager supportsConversations](TUConversationManager, "supportsConversations");

      if ((v20 & 1) != 0)
      {
LABEL_12:
        if (-[ICSApplicationDelegate isFaceTimeLoggedIn](self, "isFaceTimeLoggedIn"))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
          v22 = objc_msgSend(v21, "hasCurrentCalls");

          if (!v22)
          {
            LODWORD(v17) = ((unsigned __int8 (*)(_QWORD *))v11[2])(v11);
LABEL_33:

            objc_destroyWeak(&v50);
            objc_destroyWeak(&location);
            goto LABEL_34;
          }
          v23 = [ICSInterruptCallAlert alloc];
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_10004A5E4;
          v43[3] = &unk_100284E18;
          v44 = v11;
          v24 = -[ICSInterruptCallAlert initWithCallback:](v23, "initWithCallback:", v43);
          -[ICSInterruptCallAlert show](v24, "show");

          LOBYTE(v17) = 0;
          v19 = v44;
        }
        else
        {
          v25 = sub_1000C5588();
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Cannot open FaceTime link since the user is not logged into FaceTime", buf, 2u);
          }

          v27 = objc_alloc((Class)LSApplicationRecord);
          v28 = TUPreferredFaceTimeBundleIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
          v46 = 0;
          v17 = objc_msgSend(v27, "initWithBundleIdentifier:allowPlaceholder:error:", v29, 0, &v46);
          v19 = v46;

          if (!v17)
          {
            v30 = sub_1000C5588();
            v31 = objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v32 = TUPreferredFaceTimeBundleIdentifier();
              v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
              sub_1001A8920(v33, (uint64_t)v19, buf, v31);
            }

          }
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "applicationState"));
          v35 = objc_msgSend(v34, "isInstalled");

          if (v35)
          {
            v36 = sub_1000C5588();
            v37 = objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v45 = 0;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Opening FaceTime application to login screen", v45, 2u);
            }

            TUOpenFaceTimeAppWithCompletion(&stru_1002857A0);
          }
          else
          {
            v39 = sub_1000C5588();
            v40 = objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v45 = 0;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Opening Settings application to allow user to sign into FaceTime since the FaceTime application is not installed", v45, 2u);
            }

            v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=FaceTime")));
            TUOpenSensitiveURL();

          }
          LOBYTE(v17) = 1;
        }
LABEL_32:

        goto LABEL_33;
      }
      v38 = sub_1000C5588();
      v19 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1001A8984();
    }
    else
    {
      v18 = sub_1000C5588();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1001A89B0();
    }
    LOBYTE(v17) = 0;
    goto LABEL_32;
  }
  v15 = sub_1000C5588();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_1001A88C0();

  LOBYTE(v17) = 0;
LABEL_34:

  return (char)v17;
}

- (BOOL)isFaceTimeLoggedIn
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if ((TUIsIDSAvailableForFaceTime(self, a2) & 1) != 0)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](IMAccountController, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMService facetimeService](IMService, "facetimeService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountsForService:", v4));

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = v5;
    v2 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v2)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v2; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "registrationStatus", (_QWORD)v10) == (id)5)
          {
            LOBYTE(v2) = 1;
            goto LABEL_13;
          }
        }
        v2 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v2)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return (char)v2;
}

- (BOOL)isSOSCall:(id)a3
{
  return objc_msgSend(a3, "isSOS");
}

- (BOOL)isAnsweringMachineAvailable
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate answeringMachine](self, "answeringMachine"));
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)setMostRecentlyDisconnectedAudioCall:(id)a3
{
  TUCall *v5;
  TUCall **p_mostRecentlyDisconnectedAudioCall;
  TUCall *mostRecentlyDisconnectedAudioCall;
  TUCall *v8;
  void *v9;
  TUCall *v10;

  v5 = (TUCall *)a3;
  p_mostRecentlyDisconnectedAudioCall = &self->_mostRecentlyDisconnectedAudioCall;
  mostRecentlyDisconnectedAudioCall = self->_mostRecentlyDisconnectedAudioCall;
  if (mostRecentlyDisconnectedAudioCall != v5)
  {
    v10 = v5;
    v8 = mostRecentlyDisconnectedAudioCall;
    objc_storeStrong((id *)p_mostRecentlyDisconnectedAudioCall, a3);
    if (!v10)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("ICSApplicationDelegateMostRecentlyDisconnectedAudioCallDidClearNotification"), v8);

    }
    v5 = v10;
  }

}

- (TUSenderIdentityClient)senderIdentityClient
{
  TUSenderIdentityClient *senderIdentityClient;
  TUSenderIdentityClient *v4;
  TUSenderIdentityClient *v5;

  senderIdentityClient = self->_senderIdentityClient;
  if (!senderIdentityClient)
  {
    v4 = (TUSenderIdentityClient *)objc_alloc_init((Class)TUSenderIdentityClient);
    v5 = self->_senderIdentityClient;
    self->_senderIdentityClient = v4;

    senderIdentityClient = self->_senderIdentityClient;
  }
  return senderIdentityClient;
}

- (id)getEvolvedSubscriptionLabelID:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;

  v5 = a3;
  v7 = objc_msgSend((id)objc_opt_class(PHInCallUIUtilities, v6), "telephonyClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_opt_respondsToSelector(v8, "getEvolvedSubscriptionLabelID:error:");

  if ((v9 & 1) != 0)
  {
    v11 = objc_msgSend((id)objc_opt_class(PHInCallUIUtilities, v10), "telephonyClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getEvolvedSubscriptionLabelID:error:", v5, a4));

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (ICSCarPlayServicesController)carPlayServicesController
{
  ICSCarPlayServicesController *carPlayServicesController;
  ICSCarPlayServicesController *v4;
  ICSCarPlayServicesController *v5;

  carPlayServicesController = self->_carPlayServicesController;
  if (!carPlayServicesController)
  {
    v4 = objc_alloc_init(ICSCarPlayServicesController);
    v5 = self->_carPlayServicesController;
    self->_carPlayServicesController = v4;

    carPlayServicesController = self->_carPlayServicesController;
  }
  return carPlayServicesController;
}

- (void)showCarPlayUIWithActivation:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate carPlayServicesController](self, "carPlayServicesController"));
  objc_msgSend(v7, "acquireAssertionWithActivation:", v3);

}

- (void)hideCarPlayUI
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  if (-[ICSApplicationDelegate shouldIgnoreCarPlayAssertionInvalidations](self, "shouldIgnoreCarPlayAssertionInvalidations"))
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring CarPlay assertion invalidation request", v7, 2u);
    }
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate carPlayServicesController](self, "carPlayServicesController"));
    -[NSObject invalidateAssertion](v6, "invalidateAssertion");
  }

}

- (void)setAllowsCarPlayBanners:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate carPlayServicesController](self, "carPlayServicesController"));
  objc_msgSend(v4, "setAllowsBanners:", v3);

}

- (void)setActivationContext:(id)a3
{
  ICSActivationContext *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  ICSActivationContext *v10;

  v5 = (ICSActivationContext *)a3;
  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updated activation context: %@", (uint8_t *)&v9, 0xCu);
  }

  if (self->_activationContext != v5)
  {
    objc_storeStrong((id *)&self->_activationContext, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("ICSActivationContextDidChangeNotification"), 0);

  }
}

- (SBSUIInCallWindowScene)currentInCallScene
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "callScene"));

  return (SBSUIInCallWindowScene *)v3;
}

- (void)prewarmBannerPresentationManager
{

}

- (CNKBannerPresentationManager)bannerPresentationManager
{
  CNKBannerPresentationManager *bannerPresentationManager;
  CNKBannerPresentationManager *v4;
  CNKBannerPresentationManager *v5;

  bannerPresentationManager = self->_bannerPresentationManager;
  if (!bannerPresentationManager)
  {
    v4 = (CNKBannerPresentationManager *)objc_msgSend(objc_alloc((Class)CNKBannerPresentationManager), "initWithDelegate:", self);
    v5 = self->_bannerPresentationManager;
    self->_bannerPresentationManager = v4;

    -[CNKBannerPresentationManager setAudioRoutingDelegate:](self->_bannerPresentationManager, "setAudioRoutingDelegate:", self);
    bannerPresentationManager = self->_bannerPresentationManager;
  }
  return bannerPresentationManager;
}

- (id)screenSharingRootViewController
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sceneOfType:", 1));

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate remoteAlertShellViewControllerForWindowScene:](self, "remoteAlertShellViewControllerForWindowScene:", v4));
  else
    v5 = 0;

  return v5;
}

- (void)initiateCallForDialRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  unsigned int v30;
  void *v31;
  uint64_t v32;
  uint8_t buf[4];
  _BYTE v34[10];
  const __CFString *v35;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "'%@'", buf, 0xCu);
  }

  v10 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (!v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1001A89DC();
    goto LABEL_20;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "dialing call with dial request %@", buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallRootViewController dismissalAssertions](PHInCallRootViewController, "dismissalAssertions"));
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
    objc_msgSend(v15, "startSuppressingInCallStatusBarForReason:", CFSTR("PHSuppressInCallStatusBarForDialReason"));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  if (objc_msgSend(v16, "isRunningTest:", CFSTR("PlaceOutgoingCall")))
  {

    goto LABEL_13;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v18 = objc_msgSend(v17, "isRunningTest:", CFSTR("FaceTimePlaceOutgoingCall"));

  if (v18)
  {
LABEL_13:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v21 = qword_1002E2CB0;
    v35 = CFSTR("time");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
    objc_msgSend(v20, "startedSubTest:forTest:withMetrics:", CFSTR("CreateCall"), v21, v22);

    v24 = sub_10004B0C4(v23, v6);
    v12 = objc_claimAutoreleasedReturnValue(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v25, "finishedSubTest:forTest:", CFSTR("CreateCall"), qword_1002E2CB0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v26, "startedSubTest:forTest:", CFSTR("sbRemoteAlert"), qword_1002E2CB0);

    if (!v12)
      goto LABEL_17;
    goto LABEL_16;
  }
  v27 = sub_10004B0C4(v19, v6);
  v12 = objc_claimAutoreleasedReturnValue(v27);
  if (!v12)
  {
LABEL_17:
    v28 = sub_1000C5588();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = -[NSObject status](v12, "status");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v34 = v12 == 0;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = v30 == 6;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[WARN] cannot dial call, the call we received was nil (%d) or in the disconnected state (%d)", buf, 0xEu);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
    objc_msgSend(v31, "stopSuppressingInCallStatusBarForReason:", CFSTR("PHSuppressInCallStatusBarForDialReason"));

LABEL_20:
    v32 = 0;
    goto LABEL_21;
  }
LABEL_16:
  if (-[NSObject status](v12, "status") == 6)
    goto LABEL_17;
  if (-[ICSApplicationDelegate shouldActivateSpringBoardRemoteAlertForCall:](self, "shouldActivateSpringBoardRemoteAlertForCall:", v12))
  {
    -[ICSApplicationDelegate requestPresentationForCall:dialRequest:](self, "requestPresentationForCall:dialRequest:", v12, v6);
  }
  v32 = 1;
LABEL_21:

  if (v7)
    v7[2](v7, v32);

}

- (void)showOrCreateCallForConversationRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callMatchingConversationRequest:", v9));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeConversationForCall:", v5));

  if (v5
    && objc_msgSend(v7, "resolvedAudioVideoMode") == (id)2
    && !-[ICSApplicationDelegate isPresentingFullScreenCallUI](self, "isPresentingFullScreenCallUI"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
    objc_msgSend(v8, "ics_requestTransitionToPresentationMode:", 2);

  }
  else
  {
    -[ICSApplicationDelegate initiateCallForConversationRequest:](self, "initiateCallForConversationRequest:", v9);
  }

}

- (void)initiateCallForConversationRequest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  unsigned int v22;
  void *v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  _QWORD v31[2];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
    *(_DWORD *)buf = 138412290;
    v31[0] = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "conversationRequestUUID=%@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugDescription"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "debugDescription"));
  v11 = sub_1000793B0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_10004B5BC;
  v27 = &unk_100285158;
  v28 = v9;
  v29 = v10;
  v13 = v10;
  v14 = v9;
  dispatch_async(v12, &v24);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallRootViewController dismissalAssertions](PHInCallRootViewController, "dismissalAssertions", v24, v25, v26, v27));
  v16 = objc_msgSend(v15, "count");

  if (!v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
    objc_msgSend(v17, "startSuppressingInCallStatusBarForReason:", CFSTR("PHSuppressInCallStatusBarForDialReason"));

  }
  -[ICSApplicationDelegate setCurrentJoinConversationRequest:](self, "setCurrentJoinConversationRequest:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "joinConversationWithConversationRequest:", v4));

  if (objc_msgSend(v19, "status") == 6)
  {
    v20 = sub_1000C5588();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v19, "status");
      *(_DWORD *)buf = 67109376;
      LODWORD(v31[0]) = v19 == 0;
      WORD2(v31[0]) = 1024;
      *(_DWORD *)((char *)v31 + 6) = v22 == 6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Could not join multiway call, the call we received was nil (%d) or in the disconnected state (%d)", buf, 0xEu);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
    objc_msgSend(v23, "stopSuppressingInCallStatusBarForReason:", CFSTR("PHSuppressInCallStatusBarForDialReason"));

  }
  else if (-[ICSApplicationDelegate shouldActivateSpringBoardRemoteAlertForCall:](self, "shouldActivateSpringBoardRemoteAlertForCall:", v19))
  {
    -[ICSApplicationDelegate requestPresentationForCall:dialRequest:](self, "requestPresentationForCall:dialRequest:", v19, 0);
  }
  -[ICSApplicationDelegate setCurrentJoinConversationRequest:](self, "setCurrentJoinConversationRequest:", 0);

}

- (void)configureDialRequest:(id)a3 forProcessHandle:(id)a4
{
  id v6;
  _BOOL8 v7;
  id v8;

  v8 = a4;
  v6 = a3;
  v7 = (objc_msgSend(v6, "showUIPrompt") & 1) != 0
    || -[ICSApplicationDelegate shouldShowPromptForProcessHandle:](self, "shouldShowPromptForProcessHandle:", v8);
  objc_msgSend(v6, "setShowUIPrompt:", v7);
  objc_msgSend(v6, "setProcessHandle:", v8);

}

- (BOOL)shouldShowPromptForProcessHandle:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  char v11;
  void *v12;
  unsigned __int8 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];
  uint8_t buf[4];
  id v22;

  v3 = a3;
  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v20[0] = CFSTR("com.apple.springboard.allowallcallurls");
  v20[1] = CFSTR("com.apple.springboard.opensensitiveurl");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v3, "hasEntitlement:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), (_QWORD)v15) & 1) != 0)
        {
          v11 = 0;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_13:

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.InCallService.RemotePeoplePicker"));

  return v11 & (v13 ^ 1);
}

- (BOOL)canModifyCallsForProcessHandle:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  int v14;
  id v15;

  v3 = a3;
  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v14, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", TUBundleIdentifierCallServicesDaemon));
  if (v7 && (v8 = objc_opt_class(NSArray, v6), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
    v9 = objc_msgSend(v7, "containsObject:", CFSTR("modify-calls"));
  else
    v9 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
    v12 = objc_msgSend(v11, "isEqual:", TUBundleIdentifierTelephonyUtilitiesFramework);

    v9 |= v12;
  }

  return v9;
}

- (void)addNotificationObservers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "audioCallStatusChanged:", TUCallCenterCallStatusChangedNotification, 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "videoCallStatusChanged:", TUCallCenterVideoCallStatusChangedNotification, 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "handleTUCallTTYTypeChangedNotification:", TUCallTTYTypeChangedNotification, 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "handleSupportsEmergencyFallbackChangedNotification:", TUCallCenterSupportsEmergencyFallbackChangedNotification, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification PHAlertInvoked](NSNotification, "PHAlertInvoked"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "handleAlertInvokedNotification:", v3, 0);

  objc_msgSend(v6, "addObserver:selector:name:object:", self, "handleLockScreenStatusChangedNotification:", CFSTR("PHLockScreenStatusChangedNotification"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNKScreenSharingStateMonitorFactory sharedMonitor](self->_screenSharingMonitorFactory, "sharedMonitor"));
  objc_msgSend(v4, "addObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNKScreenSharingInteractionControllerFactory sharedController](self->_screenSharingInteractionControllerFactory, "sharedController"));
  objc_msgSend(v5, "addDelegate:", self);

}

- (void)installCameraStateMonitor
{
  ICSCameraStateMonitor *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = objc_alloc_init(ICSCameraStateMonitor);
  -[ICSApplicationDelegate setCameraStateMonitor:](self, "setCameraStateMonitor:", v3);

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004BD14;
  v11[3] = &unk_1002857F0;
  objc_copyWeak(&v12, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate cameraStateMonitor](self, "cameraStateMonitor"));
  objc_msgSend(v4, "setIsDisplayedInBanner:", v11);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004BD78;
  v9[3] = &unk_1002857F0;
  objc_copyWeak(&v10, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate cameraStateMonitor](self, "cameraStateMonitor"));
  objc_msgSend(v5, "setIsDisplayedInMiniWindow:", v9);

  objc_copyWeak(&v8, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate cameraStateMonitor](self, "cameraStateMonitor", _NSConcreteStackBlock, 3221225472, sub_10004BDE8, &unk_1002857F0));
  objc_msgSend(v6, "setIsDismissed:", &v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)installPillStateMonitor
{
  ICSPillStateMonitor *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id location;

  v3 = objc_alloc_init(ICSPillStateMonitor);
  -[ICSApplicationDelegate setPillStateMonitor:](self, "setPillStateMonitor:", v3);

  objc_initWeak(&location, self);
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate pillStateMonitor](self, "pillStateMonitor", _NSConcreteStackBlock, 3221225472, sub_10004BFFC, &unk_1002857F0));
  objc_msgSend(v4, "setIsDismissedWithoutPictureInPicture:", &v8);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate pillStateMonitor](self, "pillStateMonitor"));
  objc_msgSend(v5, "setIsActiveAndHiddenPictureInPicture:", &stru_100285830);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate pillStateMonitor](self, "pillStateMonitor"));
  objc_msgSend(v6, "setHasCurrentCalls:", &stru_100285850);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate pillStateMonitor](self, "pillStateMonitor"));
  objc_msgSend(v7, "setHasOutstandingPillAssertions:", &stru_100285870);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)audioCallStatusChanged:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }

  -[ICSApplicationDelegate handleCallStatusChangedNotification:](self, "handleCallStatusChangedNotification:", v4);
}

- (void)videoCallStatusChanged:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }

  -[ICSApplicationDelegate handleCallStatusChangedNotification:](self, "handleCallStatusChangedNotification:", v4);
}

- (void)handleCallStatusChangedNotification:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (v4)
  {
    v5 = v4;
    -[ICSApplicationDelegate callStatusChanged:](self, "callStatusChanged:", v4);
    v4 = v5;
  }

}

- (void)callStatusChanged:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int HasChinaSKU;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *i;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  _BOOL8 v69;
  void *v70;
  void *v71;
  void *v72;
  unsigned __int8 v73;
  NSObject *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t v85[128];
  uint8_t buf[4];
  _BYTE v87[14];

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "callConnected:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "callsPassingTest:", &stru_100285890));
  v9 = objc_msgSend(v8, "count");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
  if ((objc_msgSend(v10, "supportsDynamicSystemUI") & 1) == 0)
    goto LABEL_6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  if ((objc_msgSend(v11, "groupConversations") & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  HasChinaSKU = TUDeviceHasChinaSKU();

  if (HasChinaSKU)
    -[ICSApplicationDelegate updatePresentationIfNecessaryForGreenTea3PCall:](self, "updatePresentationIfNecessaryForGreenTea3PCall:", v4);
LABEL_7:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate connectedCallIdentifiers](self, "connectedCallIdentifiers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifierUUID"));
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if (v6)
  {
    if ((v15 & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate connectedCallIdentifiers](self, "connectedCallIdentifiers"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifierUUID"));
      objc_msgSend(v16, "addObject:", v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CNKScreenSharingStateMonitorFactory sharedMonitor](self->_screenSharingMonitorFactory, "sharedMonitor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "call"));
    v20 = objc_msgSend(v4, "isEqual:", v19);

    if ((v20 & 1) == 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CNKScreenSharingStateMonitorFactory sharedMonitor](self->_screenSharingMonitorFactory, "sharedMonitor"));
      v22 = v21;
      v23 = v4;
LABEL_18:
      objc_msgSend(v21, "setCall:", v23);

      goto LABEL_19;
    }
  }
  else if (v15)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate connectedCallIdentifiers](self, "connectedCallIdentifiers"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifierUUID"));
    objc_msgSend(v24, "removeObject:", v25);

  }
  if (objc_msgSend(v4, "status") == 5 || objc_msgSend(v4, "status") == 6)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CNKScreenSharingStateMonitorFactory sharedMonitor](self->_screenSharingMonitorFactory, "sharedMonitor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "call"));
    v28 = objc_msgSend(v4, "isEqual:", v27);

    if (v28)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CNKScreenSharingStateMonitorFactory sharedMonitor](self->_screenSharingMonitorFactory, "sharedMonitor"));
      v22 = v21;
      v23 = 0;
      goto LABEL_18;
    }
  }
LABEL_19:
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate connectedCallIdentifiers](self, "connectedCallIdentifiers"));
    v31 = objc_msgSend(v30, "count");

    v32 = sub_1000C5588();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate connectedCallIdentifiers](self, "connectedCallIdentifiers"));
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v87 = v31 != 0;
      *(_WORD *)&v87[4] = 2112;
      *(_QWORD *)&v87[6] = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Setting scene callConnected: %d connectedCallIdentifiers: %@", buf, 0x12u);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
    objc_msgSend(v35, "setCallConnected:", v31 != 0);

  }
  if (!v9)
  {
    v36 = objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate alertCoordinator](self, "alertCoordinator"));
    if (v36)
    {
      v37 = (void *)v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate alertCoordinator](self, "alertCoordinator"));
      if ((objc_msgSend(v38, "isAlertRequestPending") & 1) != 0
        || objc_msgSend(v4, "disconnectedReason") == 34)
      {

      }
      else
      {
        v46 = objc_msgSend(v4, "disconnectedReasonRequiresCallBackUI");

        if ((v46 & 1) == 0)
        {
          v47 = sub_1000C5588();
          v48 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "No calls remaining, nil-ing out AlertCoordinator", buf, 2u);
          }

          -[ICSApplicationDelegate setAlertCoordinator:](self, "setAlertCoordinator:", 0);
        }
      }
    }
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  if (objc_msgSend(v39, "FTUserScore"))
    goto LABEL_36;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  if ((objc_msgSend(v40, "TTRBannerEnabled") & 1) == 0)
  {
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
  if ((objc_msgSend(v41, "isFaceTimeProvider") & 1) == 0)
  {

    goto LABEL_35;
  }
  v42 = objc_msgSend(v4, "disconnectedReason");

  if (v42 == 7)
    goto LABEL_37;
  if (objc_msgSend(v4, "status") == 1)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[TTRBannerControllerFactory makeBannerController](TTRBannerControllerFactory, "makeBannerController"));
    -[ICSApplicationDelegate setTTRBannerViewController:](self, "setTTRBannerViewController:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate TTRBannerViewController](self, "TTRBannerViewController"));
    objc_msgSend(v44, "setDelegate:", self);
LABEL_57:

    goto LABEL_58;
  }
  if (objc_msgSend(v4, "status") == 6)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate TTRBannerViewController](self, "TTRBannerViewController"));

    if (v49)
    {
      v79 = v9;
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v80 = v4;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "activeConversationForCall:", v4));

      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "messagesGroupUUID"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "activeRemoteParticipants"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v52, "count")));

      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v78 = v51;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "remoteMembers"));
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v82;
        do
        {
          for (i = 0; i != v56; i = (char *)i + 1)
          {
            if (*(_QWORD *)v82 != v57)
              objc_enumerationMutation(v54);
            v59 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "handle"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "value"));
            v62 = objc_msgSend(v61, "length");

            if (v62)
            {
              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "handle"));
              v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "value"));
              objc_msgSend(v53, "addObject:", v64);

            }
          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
        }
        while (v56);
      }

      v65 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate TTRBannerViewController](self, "TTRBannerViewController"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "UUIDString"));
      objc_msgSend(v65, "buildTTRMessageBubbleRecipientsListWithGroupMessageUUID:with:", v66, v53);

      v4 = v80;
      objc_msgSend(v80, "callDuration");
      if (v67 >= 900.0)
      {
        v69 = 1;
      }
      else
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "remoteParticipantHandles"));
        v69 = (unint64_t)objc_msgSend(v68, "count") > 0xE;

      }
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate TTRBannerViewController](self, "TTRBannerViewController"));
      objc_msgSend(v70, "showTTRBannerWithFullLogArchive:", v69);

      v44 = v78;
      v9 = v79;
      goto LABEL_57;
    }
  }
LABEL_58:
  if (!v9)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
    if ((objc_msgSend(v71, "wantsBannerWithoutScene") & 1) != 0)
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallRootViewController dismissalAssertions](PHInCallRootViewController, "dismissalAssertions"));
      v73 = objc_msgSend(v72, "containsObject:", CFSTR("PHAVLessConversationDetailsViewAssertionReason"));

      if ((v73 & 1) == 0)
      {
        v74 = sub_1000C56D8();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          v75 = v74;
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v87 = v76;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Call %@ disconnected, no calls remaining, still have placeholderCall that wants banner without scene in HUD, requesting scene dismissal", buf, 0xCu);

        }
        -[ICSApplicationDelegate dismissInCallSceneSession](self, "dismissInCallSceneSession");
      }
    }
    else
    {

    }
  }
LABEL_37:
  -[ICSApplicationDelegate updateRemoteAlertStateIfNecessaryForCall:](self, "updateRemoteAlertStateIfNecessaryForCall:", v4);
  -[ICSApplicationDelegate showBannerIfNecessaryForHandoffEligibleConversation](self, "showBannerIfNecessaryForHandoffEligibleConversation");
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate routeListController](self, "routeListController"));
  objc_msgSend(v45, "reload");

}

+ (BOOL)callConnected:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "status");
  return (v3 > 6) | (0xEu >> v3) & 1;
}

- (void)updateRemoteAlertStateIfNecessaryForCall:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int HasChinaSKU;
  void *v14;
  unsigned __int8 v15;
  int v16;
  int v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  unsigned __int8 v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;

  v6 = a3;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "isEndpointOnCurrentDevice"))
    goto LABEL_35;
  v8 = objc_msgSend(v7, "status");
  switch(v8)
  {
    case 3u:
      if (!-[ICSApplicationDelegate shouldActivateSpringBoardRemoteAlertForCall:](self, "shouldActivateSpringBoardRemoteAlertForCall:", v7))goto LABEL_34;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "provider"));
      v15 = objc_msgSend(v14, "isSystemProvider");
      if ((v15 & 1) != 0)
      {
        v16 = 0;
        v17 = 0;
      }
      else
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUIUtilities sharedInstance](PHInCallUIUtilities, "sharedInstance"));
        if ((objc_msgSend(v3, "isSpringBoardLocked") & 1) != 0)
        {
          v16 = 0;
          v17 = 0;
        }
        else
        {
          v23 = objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
          if (v23)
          {
            v4 = (void *)v23;
            v17 = 0;
            v16 = 1;
          }
          else
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
            if ((objc_msgSend(v25, "existingCallsHaveMultipleProviders") & 1) == 0)
            {

              goto LABEL_34;
            }
            v26 = v25;
            v4 = 0;
            v16 = 1;
            v17 = 1;
          }
        }
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "provider"));
      if (objc_msgSend(v18, "isFaceTimeProvider") && (objc_msgSend(v7, "isVideo") & 1) == 0)
        v19 = !-[ICSApplicationDelegate hasExistingDismissedInCallScene](self, "hasExistingDismissedInCallScene");
      else
        v19 = 1;

      if (v17)
      {

        if ((v16 & 1) == 0)
          goto LABEL_44;
      }
      else if (!v16)
      {
LABEL_44:
        if ((v15 & 1) != 0)
        {

          if (!v19)
            goto LABEL_34;
        }
        else
        {

          if ((v19 & 1) == 0)
            goto LABEL_34;
        }
        v24 = sub_1000C5588();
        v20 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v7;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Heard a call change notification and it was sending, so InCallService will show the alert for %@", buf, 0xCu);
        }
        goto LABEL_31;
      }

      goto LABEL_44;
    case 6u:
      if (objc_msgSend(v7, "isVideo"))
        -[ICSApplicationDelegate setMostRecentlyDisconnectedVideoCall:](self, "setMostRecentlyDisconnectedVideoCall:", v7);
      else
        -[ICSApplicationDelegate setMostRecentlyDisconnectedAudioCall:](self, "setMostRecentlyDisconnectedAudioCall:", v7);
      if (objc_msgSend(v7, "isSOS"))
      {
        if (-[ICSApplicationDelegate isClarityBoardActive](self, "isClarityBoardActive"))
          -[ICSApplicationDelegate requestClarityBoardPresentationForSOS](self, "requestClarityBoardPresentationForSOS");
        else
          -[ICSApplicationDelegate requestSpringBoardPresentationForSOS](self, "requestSpringBoardPresentationForSOS");
      }
      break;
    case 4u:
      v9 = sub_1000C5588();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Heard a call change notification and it was ringing, so InCallService will show the alert for %@", buf, 0xCu);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "provider"));
      if (objc_msgSend(v11, "supportsDynamicSystemUI"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
        if (objc_msgSend(v12, "groupConversations"))
          HasChinaSKU = TUDeviceHasChinaSKU();
        else
          HasChinaSKU = 0;

      }
      else
      {
        HasChinaSKU = 0;
      }

      v20 = objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate features](self, "features"));
      if ((-[NSObject isSystemApertureEnabled](v20, "isSystemApertureEnabled") & 1) == 0 && !HasChinaSKU)
      {
LABEL_31:

LABEL_33:
        -[ICSApplicationDelegate requestPresentationForCall:dialRequest:](self, "requestPresentationForCall:dialRequest:", v7, 0);
        goto LABEL_34;
      }
      v21 = -[ICSApplicationDelegate isClarityBoardActive](self, "isClarityBoardActive");

      if ((v21 & 1) != 0)
        goto LABEL_33;
LABEL_34:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate ambientActivityController](self, "ambientActivityController"));
      objc_msgSend(v22, "requestActivityForCall:", v7);

      break;
  }
LABEL_35:

}

- (void)showBannerIfNecessaryForHandoffEligibleConversation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = objc_msgSend(v3, "currentAudioAndVideoCallCount");

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationManager"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handoffEligibleConversation"));

    if (v7)
      -[ICSApplicationDelegate requestHandoffEligibleConversationPresentation](self, "requestHandoffEligibleConversationPresentation");

  }
}

- (void)handleTUCallTTYTypeChangedNotification:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  int v20;
  NSObject *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUIUtilities sharedInstance](PHInCallUIUtilities, "sharedInstance"));
  v6 = objc_msgSend(v5, "isSpringBoardLocked");

  if (v6)
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class(self, v9);
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v20 = 138412546;
      v21 = v10;
      v22 = 2112;
      v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v20, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v15 = objc_opt_class(TUCall, v14);
    if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
    {
      v16 = v13;
      if (-[NSObject isEndpointOnCurrentDevice](v16, "isEndpointOnCurrentDevice")
        && -[NSObject status](v16, "status") == 1
        && -[ICSApplicationDelegate shouldActivateSpringBoardRemoteAlertForCall:](self, "shouldActivateSpringBoardRemoteAlertForCall:", v16))
      {
        v17 = sub_1000C5588();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 138412290;
          v21 = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received a TTY type change notification while SpringBoard is locked; InCallService will present a remote ale"
            "rt for active call %@",
            (uint8_t *)&v20,
            0xCu);
        }

        -[ICSApplicationDelegate requestPresentationForCall:dialRequest:](self, "requestPresentationForCall:dialRequest:", v16, 0);
      }
    }
    else
    {
      v19 = sub_1000C5588();
      v16 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1001A8A08();
    }

  }
}

- (void)handleLockScreenStatusChangedNotification:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager", a3));
  objc_msgSend(v3, "handleLockScreenStatusChanged");

}

- (BOOL)shouldPresentDismissedForCall:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ICSApplicationDelegate *v23;
  const __CFString *v24;
  char v26;
  char v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  ICSApplicationDelegate *v41;
  __int16 v42;
  const __CFString *v43;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "wantsStagingArea") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
      objc_msgSend(v7, "preloadCallChanges");

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest provider](self->_currentJoinConversationRequest, "provider"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUConversationProvider expanseProvider](TUConversationProvider, "expanseProvider"));
      v10 = objc_msgSend(v8, "isEqual:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate avUpgradedCallUUIDForDismissedScene](self, "avUpgradedCallUUIDForDismissedScene"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueProxyIdentifierUUID"));
      LODWORD(self) = objc_msgSend(v11, "isEqual:", v12);

      if ((_DWORD)v10
        && objc_msgSend(v5, "callStatus") == 3
        && objc_msgSend(v5, "isOutgoing"))
      {
        LODWORD(v13) = objc_msgSend(v5, "isSendingVideo") ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "provider"));
      if ((objc_msgSend(v14, "isSystemProvider") & 1) != 0)
        v15 = 0;
      else
        v15 = objc_msgSend(v5, "isOutgoing");

      v16 = sub_1000C5588();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v26 = v13;
        v27 = (char)self;
        v13 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "callStatus")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "isConversation")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "isOutgoing")));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "isSendingVideo") ^ 1));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "wantsStagingArea")));
        v23 = (ICSApplicationDelegate *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self));
        self = v23;
        *(_DWORD *)buf = 138414082;
        v24 = CFSTR("NO");
        v29 = v13;
        if (v15)
          v24 = CFSTR("YES");
        v30 = 2112;
        v31 = v18;
        v32 = 2112;
        v33 = v19;
        v34 = 2112;
        v35 = v20;
        v36 = 2112;
        v37 = v21;
        v38 = 2112;
        v39 = v22;
        v40 = 2112;
        v41 = v23;
        v42 = 2112;
        v43 = v24;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "shouldPresentDismissedForCall: callStatus:%@, isExpanseProvider:%@, isConversation:%@, isOutgoing:%@, isAudioCall:%@, wantsStagingArea:%@ avLessWantsDismised:%@ callProviderWantsDismissed:%@", buf, 0x52u);

        LOBYTE(self) = v27;
        LOBYTE(v13) = v26;
      }

      v6 = v15 | v13 | self;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)performPresentationForSOS
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate configurationForSOS](self, "configurationForSOS"));
  -[ICSApplicationDelegate performPresentationWithConfiguration:forSceneType:](self, "performPresentationWithConfiguration:forSceneType:", v3, 0);

}

- (void)performPresentationForScreenTime
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate configurationForScreenTime](self, "configurationForScreenTime"));
  -[ICSApplicationDelegate performPresentationWithConfiguration:forSceneType:](self, "performPresentationWithConfiguration:forSceneType:", v3, 0);

}

- (void)performPresentationForScreenSharingInitiallyInPiP:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate configurationForScreenSharingInitiallyInPiP:](self, "configurationForScreenSharingInitiallyInPiP:", a3));
  -[ICSApplicationDelegate performPresentationWithConfiguration:forSceneType:](self, "performPresentationWithConfiguration:forSceneType:", v4, 1);

}

- (void)performPersentationForScreenSharingObserver
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate configurationForScreenShareBroadcast](self, "configurationForScreenShareBroadcast"));
  -[ICSApplicationDelegate performPresentationWithConfiguration:forSceneType:](self, "performPresentationWithConfiguration:forSceneType:", v3, 2);

}

- (void)performDismissedPresentationForCallDetailsView
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate configurationForCallDetailsViewWithFullScreenRequest:](self, "configurationForCallDetailsViewWithFullScreenRequest:", 0));
  -[ICSApplicationDelegate performPresentationWithConfiguration:forSceneType:](self, "performPresentationWithConfiguration:forSceneType:", v3, 0);

}

- (void)performFullScreenPresentationForCallDetailsView
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate configurationForCallDetailsViewWithFullScreenRequest:](self, "configurationForCallDetailsViewWithFullScreenRequest:", 1));
  -[ICSApplicationDelegate performPresentationWithConfiguration:forSceneType:](self, "performPresentationWithConfiguration:forSceneType:", v3, 0);

}

- (id)configurationForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int HasChinaSKU;
  void *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "incomingCall"));
  if (v6)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "incomingVideoCall"));
    v7 = v9 != 0;

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  if (!objc_msgSend(v10, "groupConversations"))
  {
    v13 = 0;
    goto LABEL_8;
  }
  HasChinaSKU = TUDeviceHasChinaSKU();

  if (HasChinaSKU)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "callsPassingTest:", &stru_1002858B0));
    v13 = objc_msgSend(v12, "count") != 0;

LABEL_8:
    goto LABEL_10;
  }
  v13 = 0;
LABEL_10:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate features](self, "features"));
  v15 = objc_msgSend(v14, "isIncomingCallBannerEnabled") ^ 1;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
  v17 = objc_msgSend(v16, "hasBannersEnabled");
  if (v13)
    v18 = 2;
  else
    v18 = v15;
  if (v17)
    v19 = v18;
  else
    v19 = 2;

  if (-[ICSApplicationDelegate shouldPresentDismissedForCall:](self, "shouldPresentDismissedForCall:", v4))
    v20 = 0;
  else
    v20 = 2;
  if (v7)
    v21 = v19;
  else
    v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[ICSApplicationDelegate configurationForCall:preferredPresentationMode:](ICSApplicationDelegate, "configurationForCall:preferredPresentationMode:", v4, v21));

  return v22;
}

+ (id)configurationForCall:(id)a3 preferredPresentationMode:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  double v12;
  int v14;
  uint64_t v15;

  v5 = a3;
  v6 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  v7 = objc_msgSend(v6, "initWithSceneBundleIdentifier:", TUBundleIdentifierInCallServiceApplication);
  objc_msgSend(v7, "setShouldDismissCMASAlerts:", objc_msgSend(v5, "isOutgoing"));
  objc_msgSend(v7, "setPreferredPresentationMode:", a4);
  v8 = objc_msgSend(v5, "isOutgoing");

  v9 = MGGetProductType(objc_msgSend(v7, "setShouldPreferContinuityDisplayForFullScreenPresentation:", v8));
  v10 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting preferredBannerHeight based on productType %ld", (uint8_t *)&v14, 0xCu);
  }

  v12 = 104.0;
  if (v9 == 2487868872)
    v12 = 108.0;
  objc_msgSend(v7, "setPreferredBannerHeight:", v12);
  objc_msgSend(v7, "setSupportsSystemAperture:", 1);
  objc_msgSend(v7, "setSupportsAmbient:", 1);
  return v7;
}

- (id)configurationForSOS
{
  id v2;
  id v3;

  v2 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  v3 = objc_msgSend(v2, "initWithSceneBundleIdentifier:", TUBundleIdentifierInCallServiceApplication);
  objc_msgSend(v3, "setShouldDismissCMASAlerts:", 1);
  objc_msgSend(v3, "setShouldPreventBannersWhenPresentedAsOverlay:", 1);
  objc_msgSend(v3, "setPreferredPresentationMode:", 3);
  objc_msgSend(v3, "setShouldPreferContinuityDisplayForFullScreenPresentation:", 1);
  return v3;
}

- (id)configurationForScreenTime
{
  id v2;
  id v3;

  v2 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  v3 = objc_msgSend(v2, "initWithSceneBundleIdentifier:", TUBundleIdentifierInCallServiceApplication);
  objc_msgSend(v3, "setShouldDismissCMASAlerts:", 0);
  objc_msgSend(v3, "setPreferredPresentationMode:", 3);
  objc_msgSend(v3, "setShouldPreferContinuityDisplayForFullScreenPresentation:", 1);
  return v3;
}

- (id)configurationForScreenShareBroadcast
{
  id v2;
  id v3;

  v2 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  v3 = objc_msgSend(v2, "initWithSceneBundleIdentifier:", TUBundleIdentifierInCallServiceApplication);
  objc_msgSend(v3, "setShouldDismissCMASAlerts:", 0);
  objc_msgSend(v3, "setPreferredPresentationMode:", 3);
  objc_msgSend(v3, "setShouldPreferContinuityDisplayForFullScreenPresentation:", 1);
  return v3;
}

- (id)configurationForScreenSharingInitiallyInPiP:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  id v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  v5 = objc_msgSend(v4, "initWithSceneBundleIdentifier:", TUBundleIdentifierInCallServiceApplication);
  objc_msgSend(v5, "setShouldDismissCMASAlerts:", 0);
  if (v3)
    v6 = 0;
  else
    v6 = 2;
  objc_msgSend(v5, "setPreferredPresentationMode:", v6);
  objc_msgSend(v5, "setScreenSharingPresentation:", 1);
  objc_msgSend(v5, "setShouldPreferContinuityDisplayForFullScreenPresentation:", 1);
  return v5;
}

- (id)configurationForCallDetailsViewWithFullScreenRequest:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  id v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  v5 = objc_msgSend(v4, "initWithSceneBundleIdentifier:", TUBundleIdentifierInCallServiceApplication);
  objc_msgSend(v5, "setShouldDismissCMASAlerts:", 0);
  if (v3)
    v6 = 2;
  else
    v6 = 0;
  objc_msgSend(v5, "setPreferredPresentationMode:", v6);
  objc_msgSend(v5, "setShouldPreferContinuityDisplayForFullScreenPresentation:", 1);
  objc_msgSend(v5, "setSupportsSystemAperture:", 1);
  return v5;
}

- (id)configurationForPTTSessionWithCall:(id)a3 preferredPresentationMode:(int64_t)a4
{
  id v5;
  id v6;

  v5 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  v6 = objc_msgSend(v5, "initWithSceneBundleIdentifier:", TUBundleIdentifierInCallServiceApplication);
  objc_msgSend(v6, "setShouldDismissCMASAlerts:", 0);
  objc_msgSend(v6, "setPreferredPresentationMode:", a4);
  objc_msgSend(v6, "setSupportsSystemAperture:", 1);
  objc_msgSend(v6, "setShouldPreferContinuityDisplayForFullScreenPresentation:", 1);
  return v6;
}

- (void)performPresentationWithConfiguration:(id)a3 forSceneType:(unint64_t)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  unint64_t v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004DCD8;
  v7[3] = &unk_100285900;
  v8 = a3;
  v9 = a4;
  v7[4] = self;
  v6 = v8;
  TUDispatchMainIfNecessary(v7);

}

- (void)requestPresentationForCall:(id)a3 dialRequest:(id)a4
{
  -[ICSApplicationDelegate requestPresentationForCall:dialRequest:tappedPill:](self, "requestPresentationForCall:dialRequest:tappedPill:", a3, a4, 0);
}

- (void)requestPresentationForCall:(id)a3 dialRequest:(id)a4 tappedPill:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = sub_1000C56D8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for call %@", (uint8_t *)&v11, 0xCu);
  }
  +[ICSAriadne trace:](ICSAriadne, "trace:", 3);
  if (-[ICSApplicationDelegate isClarityBoardActive](self, "isClarityBoardActive"))
    -[ICSApplicationDelegate requestClarityBoardPresentationForCall:dialRequest:](self, "requestClarityBoardPresentationForCall:dialRequest:", v8, v9);
  else
    -[ICSApplicationDelegate requestSpringBoardPresentationForCall:dialRequest:tappedPill:](self, "requestSpringBoardPresentationForCall:dialRequest:tappedPill:", v8, v9, v5);

}

- (BOOL)isClarityBoardActive
{
  if (qword_1002DC8D8 != -1)
    dispatch_once(&qword_1002DC8D8, &stru_100285920);
  return byte_1002DC8D0;
}

- (void)requestSpringBoardPresentationForCall:(id)a3 dialRequest:(id)a4 tappedPill:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  id v14;
  _BOOL4 v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  unsigned int v22;
  NSObject *v23;
  void *v24;
  unsigned int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned __int8 v51;
  NSObject *v52;
  _BOOL4 v53;
  NSObject *v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  uint8_t buf[4];
  void *v59;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
  v11 = objc_msgSend(v10, "hasAdoptedModernInCallAPI");

  if ((v11 & 1) == 0)
  {
    v29 = sub_1000C56D8();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Activating a new SpringBoard remote alert", buf, 2u);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate springBoardRemoteAlertOptionsForCall:dialRequest:](self, "springBoardRemoteAlertOptionsForCall:dialRequest:", v8, v9));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    SBSUIActivateRemoteAlert(objc_msgSend(v27, "bundleIdentifier"), v12);
    goto LABEL_26;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate configurationForCall:](self, "configurationForCall:", v8));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
  v14 = objc_msgSend(v13, "presentationMode");

  v15 = v14 == (id)1 && v5;
  v16 = -[ICSApplicationDelegate hasExistingDismissedInCallScene](self, "hasExistingDismissedInCallScene");
  if ((objc_msgSend(v8, "isConnected") & 1) != 0 || objc_msgSend(v12, "preferredPresentationMode"))
  {
    v17 = 0;
  }
  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate features](self, "features"));
    v17 = objc_msgSend(v35, "isIncomingCallBannerEnabled");

  }
  v18 = v16 | v15;
  if (objc_msgSend(v12, "preferredPresentationMode"))
  {
    v17 = 1;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate ambientActivityController](self, "ambientActivityController"));
    objc_msgSend(v19, "requestActivityForCall:", v8);

  }
  if ((v18 & v17) == 1)
  {
    v20 = sub_1000C56D8();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Already have a dismissed in-call scene. Requesting transition to full-screen", buf, 2u);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    v22 = objc_msgSend(v21, "isPipped");

    if (!v22)
    {
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_10004E87C;
      v56[3] = &unk_100285158;
      v56[4] = self;
      v57 = v8;
      TUDispatchMainIfNecessary(v56);

      goto LABEL_27;
    }
    v23 = sub_1000C56D8();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "InCallService is currently PIPped. Un-PIPping before going full-screen", buf, 2u);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    if (objc_msgSend(v24, "isPIPProxyInterrupted"))
    {
      v25 = objc_msgSend(v8, "status");

      if (v25 != 4)
      {
LABEL_22:
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
        objc_msgSend(v27, "postNotificationName:object:", CFSTR("PHPIPControllerDidRequestReturnToFullScreenNotification"), v28);

LABEL_26:
        goto LABEL_27;
      }
      v26 = sub_1000C56D8();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "InCallService is presenting full-screen for a ringing call during a pip interrupted call", buf, 2u);
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
      objc_msgSend(v24, "setExpectingSystemInitiatedPIPInterruptionStop:", 1);
    }

    goto LABEL_22;
  }
  if (!-[ICSApplicationDelegate hasExistingFullScreenInCallScene](self, "hasExistingFullScreenInCallScene"))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
    if (v34)
    {

    }
    else if (-[ICSApplicationDelegate hasActiveOrPendingInCallPresentation](self, "hasActiveOrPendingInCallPresentation"))
    {
      v36 = sub_1000C56D8();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
      }
    }
    if (objc_msgSend(v12, "preferredPresentationMode") == (id)1)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "placeholderCallGroupUUID"));
      if (v38)
      {
        v39 = (void *)v38;
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "callGroupUUID"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "placeholderCallGroupUUID"));
        v43 = objc_msgSend(v40, "isEqual:", v42);

        if (!v43)
          goto LABEL_50;
        v44 = sub_1000C5588();
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Presenting banner scene for call that matches systemHUD's AVLess convo. Dismissing HUD.", buf, 2u);
        }

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
        objc_msgSend(v37, "dismissPresentedBannerForReason:animated:", CFSTR("Showing invite for existing AVLess call"), 1);
      }

    }
LABEL_50:
    -[ICSApplicationDelegate performPresentationWithConfiguration:forSceneType:](self, "performPresentationWithConfiguration:forSceneType:", v12, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
    if (objc_msgSend(v46, "expanseEnabled"))
    {
      v47 = objc_msgSend(v12, "preferredPresentationMode");

      if (v47)
        goto LABEL_27;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "callUUID"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueProxyIdentifierUUID"));
      v51 = objc_msgSend(v49, "isEqual:", v50);

      v52 = sub_1000C56D8();
      v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
      if ((v51 & 1) != 0)
      {
        if (v53)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Requested to present scene as dismissed, so requesting to present call controls", buf, 2u);
        }
        -[ICSApplicationDelegate showCallControlsForCurrentContext](self, "showCallControlsForCurrentContext");
        goto LABEL_27;
      }
      if (v53)
      {
        v54 = v52;
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueProxyIdentifierUUID"));
        *(_DWORD *)buf = 138412290;
        v59 = v55;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Waiting to present banner for callUUID %@", buf, 0xCu);

      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueProxyIdentifierUUID"));
      -[ICSApplicationDelegate setCallUUIDWaitingToPresentBanner:](self, "setCallUUIDWaitingToPresentBanner:", v46);
    }

    goto LABEL_27;
  }
  v30 = sub_1000C56D8();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Already have a full-screen scene, assuming the status bar was tapped", buf, 2u);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v31, "postNotificationName:object:", CFSTR("ICSStatusBarTappedNotification"), 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  LODWORD(v31) = objc_msgSend(v32, "callManagerEnabled");

  if ((_DWORD)v31 && v5)
  {
    v33 = sub_1000C56D8();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Passing along fullscreen tap", buf, 2u);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "postNotificationName:object:", CFSTR("ICSStatusBarTapInFullScreenNotification"), 0);
    goto LABEL_26;
  }
LABEL_27:

}

- (void)requestSpringBoardPresentationForScreenSharingBroadcaster:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  v6 = objc_msgSend(v5, "screenSharingRemoteControlEnabled");

  v7 = sub_1000C56D8();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting presentation for screen sharing broadcaster: %@", (uint8_t *)&v14, 0xCu);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
    objc_msgSend(v9, "didRequestSceneOfType:withIdentifier:", 2, 0);

    v10 = (void *)objc_opt_new(SBSUIScreenSharingOverlaySceneSpecification);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uiSceneSessionRole"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UISceneSessionActivationRequest requestWithRole:](UISceneSessionActivationRequest, "requestWithRole:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v13, "activateSceneSessionForRequest:errorHandler:", v12, &stru_100285988);

  }
  else if (v8)
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not requesting presentation for screen sharing broadcaster, Essonite features are disabled.", (uint8_t *)&v14, 2u);
  }

}

- (void)requestClarityBoardPresentationForCall:(id)a3 dialRequest:(id)a4
{
  void *v5;
  unsigned int v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t buf[2];
  __int16 v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager", a3, a4));
  v6 = objc_msgSend(v5, "hasPendingSceneOfType:", 3);

  if (v6)
  {
    v7 = sub_1000C56D8();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      return;
    v19 = 0;
    v8 = "Already requested presentation from ClarityBoard, so skipping new request.";
    v9 = (uint8_t *)&v19;
    v10 = v7;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    return;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clarityUIScene"));

  v13 = sub_1000C56D8();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (!v14)
      return;
    *(_WORD *)buf = 0;
    v8 = "Already presented by ClarityBoard, so skipping new request.";
    v9 = buf;
    v10 = v13;
    goto LABEL_7;
  }
  if (v14)
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Requesting presentation from ClarityBoard.", v17, 2u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  objc_msgSend(v15, "didRequestSceneOfType:withIdentifier:", 3, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v16, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, 0, 0, &stru_1002859A8);

}

- (void)requestPTTPresentation:(int64_t)a3 forCall:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  void *v14;
  unsigned __int8 v15;
  NSObject *v16;
  int v17;
  id v18;

  v6 = a4;
  v7 = sub_1000C56D8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting PTT presentation for call %@", (uint8_t *)&v17, 0xCu);
  }
  switch(a3)
  {
    case 0:
      v8 = sub_1000C56D8();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not activating PTT user interface because presentation was unknown", (uint8_t *)&v17, 2u);
      }
      goto LABEL_18;
    case 1:
      v9 = sub_1000C56D8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activating PTT user interface as banner", (uint8_t *)&v17, 2u);
      }
      -[ICSApplicationDelegate presentDismissedPTTSceneForCall:](self, "presentDismissedPTTSceneForCall:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
      objc_msgSend(v10, "showPTTHUD");
      break;
    case 2:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUIUtilities sharedInstance](PHInCallUIUtilities, "sharedInstance"));
      v12 = objc_msgSend(v11, "isSpringBoardLocked");

      if ((v12 & 1) != 0)
        goto LABEL_18;
      v13 = sub_1000C56D8();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Activating PTT user interface as notice for incoming transmission if needed", (uint8_t *)&v17, 2u);
      }
      -[ICSApplicationDelegate presentDismissedPTTSceneForCall:](self, "presentDismissedPTTSceneForCall:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
      objc_msgSend(v10, "showRemoteParticipantNoticeIfNeeded");
      break;
    case 3:
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUIUtilities sharedInstance](PHInCallUIUtilities, "sharedInstance"));
      v15 = objc_msgSend(v14, "isSpringBoardLocked");

      if ((v15 & 1) != 0)
        goto LABEL_18;
      v16 = sub_1000C56D8();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Activating PTT user interface as notice for acessory button events if needed", (uint8_t *)&v17, 2u);
      }
      -[ICSApplicationDelegate presentDismissedPTTSceneForCall:](self, "presentDismissedPTTSceneForCall:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
      objc_msgSend(v10, "showAccessoryButtonEventsNoticeIfNeeded");
      break;
    default:
      goto LABEL_18;
  }

LABEL_18:
}

- (void)presentDismissedPTTSceneForCall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = sub_1000C56D8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activating InCallService PTT user interface as full screen scene in dismissed mode", v7, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate configurationForPTTSessionWithCall:preferredPresentationMode:](self, "configurationForPTTSessionWithCall:preferredPresentationMode:", v4, 0));

  -[ICSApplicationDelegate performPresentationWithConfiguration:forSceneType:](self, "performPresentationWithConfiguration:forSceneType:", v6, 0);
}

- (void)dismissPTTSessionPresentation
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = sub_1000C56D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing PTT session presentation", v5, 2u);
  }
  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHInitialPTTFullScreenPresentationAssertionReason"));
  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHPTTCallDetailsViewAssertionReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
  objc_msgSend(v4, "dismissPresentedBannerForReason:animated:", CFSTR("Dismissing PTT Banner"), 1);

}

- (void)bannerPresentationManagerDidDismissBanner
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "frontmostBargeCall"));

  if (v4 && objc_msgSend(v4, "isPTT"))
    -[ICSApplicationDelegate dismissPTTSessionPresentation](self, "dismissPTTSessionPresentation");
  -[ICSApplicationDelegate setIsShowingIncomingNameUpdate:](self, "setIsShowingIncomingNameUpdate:", 0);

}

- (BOOL)bannerPresentationManagerWantsSpringBoardIsLockedStatus
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUIUtilities sharedInstance](PHInCallUIUtilities, "sharedInstance"));
  v3 = objc_msgSend(v2, "isSpringBoardLocked");

  return v3;
}

- (void)bannerPresentationManagerShowFullscreenPTTCallDetailsView
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deep linking to PushToTalk call details view", v5, 2u);
  }

  -[ICSApplicationDelegate setDidDeepLinkToPTTCallDetailsView:](self, "setDidDeepLinkToPTTCallDetailsView:", 1);
  +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHPTTCallDetailsViewAssertionReason"));
  -[ICSApplicationDelegate requestFullScreenSpringBoardPresentationForCallDetailsView](self, "requestFullScreenSpringBoardPresentationForCallDetailsView");
}

- (void)requestGreenTea3PPresentationForCall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = sub_1000C56D8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting GreenTea3P presentation for call %@", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate configurationForGreenTea3P](self, "configurationForGreenTea3P"));
  -[ICSApplicationDelegate performPresentationWithConfiguration:forSceneType:](self, "performPresentationWithConfiguration:forSceneType:", v6, 6);
  v7 = objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene")),
        v10 = objc_msgSend(v9, "presentationMode"),
        v9,
        v8,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004F380;
    v12[3] = &unk_100285948;
    v12[4] = self;
    objc_msgSend(v11, "ics_requestTransitionToPresentationMode:shouldDismissCMASAlerts:analyticsSource:completion:", 0, 0, 0, v12);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
    objc_msgSend(v11, "showGreenTea3PHUD");
  }

  -[ICSApplicationDelegate showCarPlayUIWithActivation:](self, "showCarPlayUIWithActivation:", 1);
}

- (id)configurationForGreenTea3P
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  char v9;

  v2 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  v3 = objc_msgSend(v2, "initWithSceneBundleIdentifier:", TUBundleIdentifierInCallServiceApplication);
  objc_msgSend(v3, "setShouldDismissCMASAlerts:", 0);
  objc_msgSend(v3, "setPreferredPresentationMode:", 0);
  objc_msgSend(v3, "setShouldPreferContinuityDisplayForFullScreenPresentation:", 1);
  objc_msgSend(v3, "setSupportsSystemAperture:", 0);
  if ((objc_opt_respondsToSelector(v3, "requiresDismissedPresentationmode") & 1) != 0)
  {
    v9 = 1;
    v5 = objc_msgSend((id)objc_opt_class(SBSInCallPresentationConfiguration, v4), "instanceMethodSignatureForSelector:", "setRequiresDismissedPresentationmode:");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v6));
    objc_msgSend(v7, "setTarget:", v3);
    objc_msgSend(v7, "setSelector:", "setRequiresDismissedPresentationmode:");
    objc_msgSend(v7, "setArgument:atIndex:", &v9, 2);
    objc_msgSend(v7, "invoke");

  }
  return v3;
}

- (void)updatePresentationIfNecessaryForGreenTea3PCall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v4 = a3;
  v5 = sub_1000C56D8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating presentation if necessary for GreenTea3P call: %@", (uint8_t *)&v14, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callsPassingTest:", &stru_1002859C8));
  v8 = objc_msgSend(v7, "count");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "frontmostAudioOrVideoCall"));
  v11 = -[ICSApplicationDelegate shouldActivateSpringBoardRemoteAlertForCall:](self, "shouldActivateSpringBoardRemoteAlertForCall:", v10);

  if ((objc_msgSend(v4, "isActive") & 1) == 0)
    -[ICSApplicationDelegate dismissInCallSceneOfType:](self, "dismissInCallSceneOfType:", 6);
  if ((objc_msgSend(v4, "isActive") & 1) == 0 && v8 && ((v11 ^ 1) & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "frontmostAudioOrVideoCall"));
    -[ICSApplicationDelegate requestPresentationForCall:dialRequest:](self, "requestPresentationForCall:dialRequest:", v13, 0);

  }
}

- (void)requestHandoffEligibleConversationPresentation
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = sub_1000C56D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for handoff-eligible nearby conversation", v5, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
  objc_msgSend(v4, "showHandoffHUD");

}

- (void)requestLagunaPullConversationPresentation
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = sub_1000C56D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for laguna pull conversation", v5, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
  objc_msgSend(v4, "showLagunaPullConversationHUD");

}

- (void)requestSpringBoardPresentationForScreenSharingAsPiP:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned __int8 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  v6 = objc_msgSend(v5, "supportsScreenSharing");

  v7 = sub_1000C56D8();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for Screen Sharing with initially PiPped: %i", (uint8_t *)v10, 8u);
    }
    if (v3)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate configurationForScreenSharingInitiallyInPiP:](self, "configurationForScreenSharingInitiallyInPiP:", 1));
      -[ICSApplicationDelegate requestBackgroundPiPAuthorizationForSceneType:withConfiguration:](self, "requestBackgroundPiPAuthorizationForSceneType:withConfiguration:", 1, v9);

    }
    else
    {
      -[ICSApplicationDelegate performPresentationForScreenSharingInitiallyInPiP:](self, "performPresentationForScreenSharingInitiallyInPiP:", 0);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1001A8B28();
  }
}

- (void)requestBackgroundPiPAuthorizationOfDismissedInCallSceneForCall:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  unsigned int v14;

  v4 = a3;
  v5 = -[ICSApplicationDelegate hasExistingDismissedInCallScene](self, "hasExistingDismissedInCallScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  v7 = objc_msgSend(v6, "hasPendingCompletionForSceneType:presentationMode:", 0, 2);

  v8 = v5 ^ 1;
  v9 = sub_1000C56D8();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0 || v7)
  {
    if (v10)
    {
      v12[0] = 67109376;
      v12[1] = v8;
      v13 = 1024;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not requesting background PiP authorization since there isn't a dismissed in-call scene (%d) or we're in the midst of presenting a fullscreen scene (%d)", (uint8_t *)v12, 0xEu);
    }
  }
  else
  {
    if (v10)
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requesting background PiP authorization for dismissed in-call scene", (uint8_t *)v12, 2u);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICSApplicationDelegate configurationForCall:preferredPresentationMode:](ICSApplicationDelegate, "configurationForCall:preferredPresentationMode:", v4, 0));
    -[ICSApplicationDelegate requestBackgroundPiPAuthorizationForSceneType:withConfiguration:](self, "requestBackgroundPiPAuthorizationForSceneType:withConfiguration:", 0, v11);

  }
}

- (void)requestBackgroundPiPAuthorizationForSceneType:(unint64_t)a3 withConfiguration:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, uint64_t);
  void *v32;
  id v33;
  id v34;
  id v35[2];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;

  v6 = a4;
  if (a3 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));

  }
  else
  {
    v8 = TUBundleIdentifierInCallServiceApplication;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate backgroundPIPAuthorizationForSceneType](self, "backgroundPIPAuthorizationForSceneType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));

  if (v11)
  {
    v12 = sub_1000C56D8();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = sub_10000EF40(a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543362;
      v37 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Already have existing background authorization request for scene of type %{public}@; removing old request",
        buf,
        0xCu);

    }
    -[ICSApplicationDelegate revokeAndRemoveBackgroundPiPAuthorizationForSceneTypeIfNeeded:](self, "revokeAndRemoveBackgroundPiPAuthorizationForSceneTypeIfNeeded:", a3);
  }
  v16 = sub_1000C56D8();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = sub_10000EF40(a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138543618;
    v37 = v19;
    v38 = 2114;
    v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Requesting background PiP authorization for %{public}@ scene with activity session identifier '%{public}@'", buf, 0x16u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v20, "didRequestSceneOfType:withIdentifier:", a3, v21);

  objc_initWeak((id *)buf, self);
  v22 = objc_alloc((Class)PGBackgroundPIPAuthorization);
  v29 = _NSConcreteStackBlock;
  v30 = 3221225472;
  v31 = sub_10004FD4C;
  v32 = &unk_100285A18;
  objc_copyWeak(v35, (id *)buf);
  v23 = TUBundleIdentifierInCallServiceApplication;
  v35[1] = (id)a3;
  v24 = v8;
  v33 = v24;
  v25 = v6;
  v34 = v25;
  v26 = objc_msgSend(v22, "initWithActivitySessionIdentifier:appBundleIdentifier:stateTransitionHandler:", v24, v23, &v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate backgroundPIPAuthorizationForSceneType](self, "backgroundPIPAuthorizationForSceneType", v29, v30, v31, v32));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v28);

  objc_destroyWeak(v35);
  objc_destroyWeak((id *)buf);

}

- (void)revokeAndRemoveBackgroundPiPAuthorizationForSceneTypeIfNeeded:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate backgroundPIPAuthorizationForSceneType](self, "backgroundPIPAuthorizationForSceneType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    v8 = sub_1000C56D8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      v10 = sub_10000EF40(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v14 = 138543362;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Revoking and removing existing background authorization for %{public}@ scene", (uint8_t *)&v14, 0xCu);

    }
  }
  objc_msgSend(v7, "revoke");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate backgroundPIPAuthorizationForSceneType](self, "backgroundPIPAuthorizationForSceneType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v12, "removeObjectForKey:", v13);

}

- (void)dismissInCallSceneSession
{
  if (-[ICSApplicationDelegate isClarityBoardActive](self, "isClarityBoardActive"))
    -[ICSApplicationDelegate dismissClarityUIScene](self, "dismissClarityUIScene");
  else
    -[ICSApplicationDelegate dismissInCallSceneOfType:](self, "dismissInCallSceneOfType:", 0);
}

- (void)dismissScreenSharingSceneSession
{
  void *v3;
  unsigned __int8 v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  v4 = objc_msgSend(v3, "supportsScreenSharing");

  if ((v4 & 1) != 0)
  {
    -[ICSApplicationDelegate dismissInCallSceneOfType:](self, "dismissInCallSceneOfType:", 1);
  }
  else
  {
    v5 = sub_1000C56D8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Ignoring request to dismiss Screen Sharing scene since the feature is disabled", v6, 2u);
    }
  }
}

- (void)dismissScreenSharingBroadcasterSession
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  v4 = objc_msgSend(v3, "screenSharingDrawToHighlightEnabled");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "screenSharingBroadcasterScene"));

    v7 = sub_1000C56D8();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dismissing Sharing Broadcasing scene.", v12, 2u);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
      objc_msgSend(v9, "requestSceneSessionDestruction:options:errorHandler:", v10, 0, &stru_100285A38);

    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sub_1001A8B54();
    }

  }
  else
  {
    v11 = sub_1000C56D8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Ignoring request to dismiss Broadcaster scene since the feature is disabled", buf, 2u);
    }
  }
}

- (void)dismissVideoMessageSceneSession
{
  -[ICSApplicationDelegate dismissInCallSceneOfType:](self, "dismissInCallSceneOfType:", 4);
}

- (void)dismissInCallSceneOfType:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100050698;
  v3[3] = &unk_1002850B0;
  v3[4] = self;
  v3[5] = a3;
  TUDispatchMainIfNecessary(v3);
}

- (void)dismissClarityUIScene
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clarityUIScene"));

  v5 = sub_1000C56D8();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing Assistive Access scene.", v10, 2u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
    objc_msgSend(v7, "requestSceneSessionDestruction:options:errorHandler:", v8, 0, &stru_100285A58);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
    objc_msgSend(v9, "didDismissSceneOfType:", 3);

  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempted to dismiss Assistive Access scene, but none was showing.", buf, 2u);
  }

}

- (BOOL)hasActiveOrPendingInCallPresentation
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  v3 = objc_msgSend(v2, "hasPendingOrExistingSceneOfType:", 0);

  return v3;
}

- (BOOL)hasActiveOrPendingVideoMessagePresentation
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  v3 = objc_msgSend(v2, "hasPendingOrExistingSceneOfType:", 4);

  return v3;
}

- (BOOL)hasExistingDismissedInCallScene
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[ICSApplicationDelegate hasActiveOrPendingInCallPresentation](self, "hasActiveOrPendingInCallPresentation"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
    v5 = objc_msgSend(v4, "presentationMode") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasExistingFullScreenInCallScene
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[ICSApplicationDelegate hasActiveOrPendingInCallPresentation](self, "hasActiveOrPendingInCallPresentation"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
    v5 = objc_msgSend(v4, "presentationMode") == (id)2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)requestSpringBoardPresentationForSOS
{
  NSObject *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = sub_1000C56D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for SOS", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
  v5 = objc_msgSend(v4, "hasAdoptedModernInCallAPI");

  if (v5)
  {
    if (-[ICSApplicationDelegate hasActiveOrPendingInCallPresentation](self, "hasActiveOrPendingInCallPresentation"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
        v8 = objc_msgSend(v7, "isPipped");

        v9 = sub_1000C56D8();
        v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        if (v8)
        {
          if (v10)
          {
            *(_WORD *)v15 = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "InCallService is currently PIPped. Un-PIPping now, then the scene should transition to full-screen overlay after the call disconnects.", v15, 2u);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
          objc_msgSend(v11, "postNotificationName:object:", CFSTR("PHPIPControllerDidRequestReturnToFullScreenNotification"), v12);

        }
        else
        {
          if (v10)
          {
            *(_WORD *)v14 = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "There's an existing in-call scene, transitioning to full-screen overlay for SOS", v14, 2u);
          }
          -[ICSApplicationDelegate transitionSceneToOverlayForSOS](self, "transitionSceneToOverlayForSOS");
        }
      }
      else
      {
        v13 = sub_1000C56D8();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "While requesting a new scene for SOS, hasActiveOrPendingInCallPresentation is YES but currentInCallScene is nil. This is likely because we already requested a scene, but it hasn't been created yet. The new scene should transition to full-screen overlay as soon as it connects.", v16, 2u);
        }
      }
    }
    else
    {
      -[ICSApplicationDelegate performPresentationForSOS](self, "performPresentationForSOS");
    }
  }
  else
  {
    -[ICSApplicationDelegate activateSpringBoardRemoteAlertForSOSCall](self, "activateSpringBoardRemoteAlertForSOSCall");
  }
}

- (void)requestClarityBoardPresentationForSOS
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1000C56D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Requesting presentation from ClarityBoard.", v6, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  objc_msgSend(v4, "didRequestSceneOfType:withIdentifier:", 3, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v5, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, 0, 0, &stru_100285A78);

}

- (void)requestSpringBoardPresentationForScreenTime
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = sub_1000C56D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for ScreenTime", buf, 2u);
  }
  if (-[ICSApplicationDelegate hasActiveOrPendingInCallPresentation](self, "hasActiveOrPendingInCallPresentation"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));

    v5 = sub_1000C56D8();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "There's an existing in-call scene, transitioning to full-screen overlay for ScreenTime", v8, 2u);
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
      objc_msgSend(v7, "requestTransitionToPresentationMode:shouldDismissCMASAlerts:", 2, 0);

    }
    else if (v6)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "While requesting a new scene for ScreenTime, hasActiveOrPendingInCallPresentation is YES but currentInCallScene is nil. This is likely because we already requested a scene, but it hasn't been created yet. The new scene should transition to full-screen overlay as soon as it connects.", v9, 2u);
    }
  }
  else
  {
    -[ICSApplicationDelegate performPresentationForScreenTime](self, "performPresentationForScreenTime");
  }
}

- (void)requestSpringBoardPresentationForCallDetailsView
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = sub_1000C56D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for call details view", v4, 2u);
  }
  if (!-[ICSApplicationDelegate hasActiveOrPendingInCallPresentation](self, "hasActiveOrPendingInCallPresentation"))
    -[ICSApplicationDelegate performDismissedPresentationForCallDetailsView](self, "performDismissedPresentationForCallDetailsView");
}

- (void)requestFullScreenSpringBoardPresentationForCallDetailsView
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v3 = sub_1000C56D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface, in fullscreen, for call details view", buf, 2u);
  }
  if (-[ICSApplicationDelegate hasActiveOrPendingInCallPresentation](self, "hasActiveOrPendingInCallPresentation"))
  {
    v4 = sub_1000C56D8();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already have a scene, requesting scene to be presented FullScreen", v6, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
    objc_msgSend(v5, "requestTransitionToPresentationMode:shouldDismissCMASAlerts:", 2, 0);

  }
  else
  {
    -[ICSApplicationDelegate performFullScreenPresentationForCallDetailsView](self, "performFullScreenPresentationForCallDetailsView");
  }
}

- (void)transitionSceneToOverlayForSOS
{
  -[ICSApplicationDelegate transitionScenetoOverlayAndDismissCMASAlerts:](self, "transitionScenetoOverlayAndDismissCMASAlerts:", 1);
}

- (void)transitionSceneToOverlayForScreenTime
{
  -[ICSApplicationDelegate transitionScenetoOverlayAndDismissCMASAlerts:](self, "transitionScenetoOverlayAndDismissCMASAlerts:", 0);
}

- (void)transitionScenetoOverlayAndDismissCMASAlerts:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  BOOL v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
  v6 = objc_msgSend(v5, "presentationMode");

  if (v6 != (id)3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100051454;
    v7[3] = &unk_100284C98;
    v7[4] = self;
    v8 = a3;
    TUDispatchMainIfNecessary(v7);
  }
}

- (void)activateSpringBoardRemoteAlertForSOSCall
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1000C56D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for SOS call", v6, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate springBoardRemoteAlertOptionsForSOSCall](self, "springBoardRemoteAlertOptionsForSOSCall"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  SBSUIActivateRemoteAlert(objc_msgSend(v5, "bundleIdentifier"), v4);

}

- (BOOL)shouldActivateSpringBoardRemoteAlertForCall:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  char v9;
  NSObject *v10;
  int v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  v6 = objc_msgSend(v5, "avLessSharePlayEnabled");
  if (v4)
    v7 = 0;
  else
    v7 = v6;

  if (v7 == 1)
  {
    v8 = sub_1000C56D8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Suppressing showing scene for nil call", (uint8_t *)&v12, 2u);
    }
  }
  v9 = v7 ^ 1;
  if (objc_msgSend(v4, "isEmergency"))
  {
    if (sub_1000873E4()
      && (objc_msgSend(v4, "isRTT") & 1) == 0
      && (objc_msgSend(v4, "isTTY") & 1) == 0)
    {
      v10 = sub_1000C56D8();
      v9 = 0;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "suppressing showing alert for call because it's an emergency call, the emergency dialer presence token is set, and call is not RTT/TTY: %@", (uint8_t *)&v12, 0xCu);
        v9 = 0;
      }
    }
  }

  return v9;
}

- (id)springBoardRemoteAlertOptionsForCall:(id)a3 dialRequest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _UNKNOWN **v10;
  _QWORD *v11;
  _BOOL8 v12;
  void *v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = TUInCallRemoteAlertViewControllerClassName();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, SBSUIRemoteAlertOptionViewControllerClass);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBSUIRemoteAlertOptionDismissWithHomeButton);
  if (objc_msgSend(v5, "status") != 4)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_100296880, SBSUIRemoteAlertOptionSwipeDismissalStyle);
  if (objc_msgSend(v5, "isVideo"))
  {
    v10 = (_UNKNOWN **)&__kCFBooleanFalse;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, SBSUIRemoteAlertOptionWantsWallpaperTunnel);
    v11 = &SBSUIRemoteAlertOptionHasTranslucentBackground;
  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBSUIRemoteAlertOptionWantsWallpaperTunnel);
    if (v6)
      v12 = objc_msgSend(v6, "originatingUIType") == 1;
    else
      v12 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, SBSUIRemoteAlertOptionDisableFadeInAnimation);

    objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_100296880, SBSUIRemoteAlertOptionDismissalAnimationStyle);
    v10 = &off_100296898;
    v11 = &SBSUIRemoteAlertOptionInitialBackgroundStyle;
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *v11);
  v14 = objc_msgSend(v7, "copy");

  return v14;
}

- (id)springBoardRemoteAlertOptionsForSOSCall
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = TUInCallRemoteAlertViewControllerClassName();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, SBSUIRemoteAlertOptionViewControllerClass);

  objc_msgSend(v2, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, SBSUIRemoteAlertOptionDismissWithHomeButton);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBSUIRemoteAlertOptionWantsWallpaperTunnel);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &off_100296880, SBSUIRemoteAlertOptionDismissalAnimationStyle);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &off_100296898, SBSUIRemoteAlertOptionInitialBackgroundStyle);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &off_100296880, SBSUIRemoteAlertOptionSwipeDismissalStyle);
  v5 = objc_msgSend(v2, "copy");

  return v5;
}

- (BOOL)shouldShowAirplaneEmergencyCallAlertForDialRequest:(id)a3
{
  id v3;
  unsigned __int8 v4;
  void *v6;

  v3 = a3;
  if (sub_1000873AC()
    && objc_msgSend(v3, "isValid")
    && (objc_msgSend(v3, "isSOS") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localSenderIdentityUUID"));
    if (+[TUCallCapabilities canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:](TUCallCapabilities, "canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:", v6))v4 = +[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling");
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)shouldShowEmergencyCallbackModeAlertForDialRequest:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (+[PHDevice isGeminiCapable](PHDevice, "isGeminiCapable")
    && objc_msgSend(v4, "isValid")
    && (objc_msgSend(v4, "isSOS") & 1) == 0
    && objc_msgSend(v4, "dialType") != (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
    if (objc_msgSend(v8, "length"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
      if (objc_msgSend(v9, "isTelephonyProvider"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate senderIdentityClient](self, "senderIdentityClient"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localSenderIdentityUUID"));
        v5 = objc_msgSend(v10, "shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:", v11);

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowTelephonyAccountUnavailableAlertForDialRequest:(id)a3
{
  id v3;
  unsigned int v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (+[PHDevice isGeminiCapable](PHDevice, "isGeminiCapable")
    && objc_msgSend(v3, "isValid")
    && (objc_msgSend(v3, "isSOS") & 1) == 0
    && !objc_msgSend(v3, "dialType"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
    if (objc_msgSend(v6, "isTelephonyProvider"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "prioritizedSenderIdentities"));
      if (objc_msgSend(v8, "count"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localSenderIdentityAccountUUID"));
        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localSenderIdentity"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountUUID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localSenderIdentityAccountUUID"));
          v4 = objc_msgSend(v11, "isEqual:", v12) ^ 1;

        }
        else
        {
          LOBYTE(v4) = 0;
        }

      }
      else
      {
        LOBYTE(v4) = 0;
      }

    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)shouldShowRTTAlertForDialRequest:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  if (objc_msgSend(v4, "currentCallCount")
    || !objc_msgSend(v3, "isValid")
    || (objc_msgSend(v3, "isSOS") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "handle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
    if (objc_msgSend(v8, "length"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
      if (objc_msgSend(v9, "isTelephonyProvider") && !objc_msgSend(v3, "ttyType"))
      {
        if ((objc_msgSend(v3, "isRTTAvailable") & 1) != 0)
          v5 = 1;
        else
          v5 = objc_msgSend(v3, "isTTYAvailable");
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)shouldShowScreenTimeAlertForDialRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callFilterController"));
  v6 = objc_msgSend(v5, "shouldRestrictDialRequest:", v3);

  return v6;
}

- (BOOL)shouldShowScreenTimeAlertForJoinConversationRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  BOOL v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversationManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteMembers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversationLink"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeConversationWithRemoteMembers:andLink:", v6, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeRemoteParticipants"));
  v10 = objc_msgSend(v9, "count");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "callFilterController"));
  v13 = v12;
  if (v10)
    v14 = objc_msgSend(v12, "shouldRestrictConversation:performSynchronously:", v8, 0);
  else
    v14 = objc_msgSend(v12, "shouldRestrictJoinConversationRequest:performSynchronously:", v3, 0);
  v15 = v14;

  return v15;
}

- (BOOL)shouldActivateSOS
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate activationContext](self, "activationContext"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate activationContext](self, "activationContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reason"));
    if ((objc_msgSend(v5, "isEqualToString:", SOSRemoteAlertActivationReasonActivatingForSOSWithClicks) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate activationContext](self, "activationContext"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reason"));
      if ((objc_msgSend(v8, "isEqualToString:", SOSRemoteAlertActivationReasonActivatingForSOSWithKappa) & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate activationContext](self, "activationContext"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reason"));
        if ((objc_msgSend(v10, "isEqualToString:", SOSRemoteAlertActivationReasonActivatingForSOSAlertRestingScreen) & 1) != 0)
        {
          v6 = 1;
        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate activationContext](self, "activationContext"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "reason"));
          v6 = objc_msgSend(v12, "isEqualToString:", SOSRemoteAlertActivationReasonActivatingForSOSWithVolumeLockHold);

        }
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)startSOSFlowWithActivationReason:(id)a3
{
  id v4;
  NSObject *v5;
  ICSActivationContext *v6;
  void *v7;
  __CFString **v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = sub_1000C5828();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting SOS flow with activation reason %@", (uint8_t *)&v11, 0xCu);
  }
  v6 = -[ICSActivationContext initWithReason:userInfo:]([ICSActivationContext alloc], "initWithReason:userInfo:", v4, 0);
  -[ICSApplicationDelegate setActivationContext:](self, "setActivationContext:", v6);

  if (objc_msgSend(v4, "isEqualToString:", SOSRemoteAlertActivationReasonActivatingForSOSAlertRestingScreen))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    objc_msgSend(v7, "disconnectAllCallsWithNoPreflight");
    v8 = off_100287118;
    goto LABEL_10;
  }
  if (!-[ICSApplicationDelegate hasOngoingEmergencyCall](self, "hasOngoingEmergencyCall"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    objc_msgSend(v7, "disconnectAllCalls");
    v8 = off_1002870D0;
LABEL_10:

    +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", *v8);
    if (-[ICSApplicationDelegate isClarityBoardActive](self, "isClarityBoardActive"))
    {
      -[ICSApplicationDelegate requestClarityBoardPresentationForSOS](self, "requestClarityBoardPresentationForSOS");
    }
    else
    {
      -[ICSApplicationDelegate requestSpringBoardPresentationForSOS](self, "requestSpringBoardPresentationForSOS");
      +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHAudioCallViewControllerDismissalAssertionHandlingCallFailure"));
      +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHCallEndedBlockAndReportInProgressAssertionReason"));
      +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHMulitwayCallAssertionReason"));
      +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHAVLessConversationDetailsViewAssertionReason"));
      +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHAVLessConversationAssertionReason"));
      +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHPTTCallDetailsViewAssertionReason"));
    }
    goto LABEL_13;
  }
  v9 = sub_1000C5828();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cancelling SOS due to ongoing emergency call", (uint8_t *)&v11, 2u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SOSStatusReporter sharedInstance](SOSStatusReporter, "sharedInstance"));
  objc_msgSend(v10, "updateSOSFlowState:", 6);

LABEL_13:
}

- (BOOL)hasOngoingEmergencyCall
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = objc_alloc((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentCalls"));
  v5 = objc_msgSend(v2, "initWithArray:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callsOnDefaultPairedDevice"));
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (v12 && (objc_msgSend(v12, "isEmergency", (_QWORD)v14) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_12;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v9;
}

- (void)startScreenTimeFlowWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  ICSActivationContext *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ICSActivationContext *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  id v15;

  v4 = a3;
  v5 = sub_1000C57B8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting ScreenTime flow with URL %@", buf, 0xCu);
  }
  v6 = [ICSActivationContext alloc];
  v7 = SOSRemoteAlertActivationReasonActivatingForScreenTime;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString", SOSRemoteAlertActivationContextUserInfoRequestURLStringKey));
  v13 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v10 = -[ICSActivationContext initWithReason:userInfo:](v6, "initWithReason:userInfo:", v7, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSActivationContext pendingRestrictedScreenTimeRequest](v10, "pendingRestrictedScreenTimeRequest"));
  if (v11)
  {
    +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHScreenTimeAlertAssertionReason"));
    -[ICSApplicationDelegate setActivationContext:](self, "setActivationContext:", v10);
    -[ICSApplicationDelegate requestSpringBoardPresentationForScreenTime](self, "requestSpringBoardPresentationForScreenTime");
  }

}

- (void)updateDialRequestAccountIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localSenderIdentityAccountUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localSenderIdentity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    if (objc_msgSend(v6, "isEqualToString:", v9))
    {

LABEL_15:
      goto LABEL_16;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
    v11 = objc_msgSend(v10, "isTelephonyProvider");

    if (v11)
    {
      v12 = sub_1000C5588();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] The localSenderIdentity and localSenderIdentityAccountUUID do not match for a telephony dial request, checking with the core telephony client", buf, 2u);
      }

      v19 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate getEvolvedSubscriptionLabelID:error:](self, "getEvolvedSubscriptionLabelID:error:", v6, &v19));
      v7 = v19;
      if (v14 && (objc_msgSend(v14, "isEqualToString:", v6) & 1) == 0)
      {
        v16 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v14);
        v17 = sub_1000C5588();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v21 = v4;
          v22 = 2112;
          v23 = v14;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Updating dial request %@ with accountUUID: %@", buf, 0x16u);
        }

        objc_msgSend(v4, "setLocalSenderIdentityAccountUUID:", v16);
      }
      else
      {
        v15 = sub_1000C5588();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v21 = v6;
          v22 = 2112;
          v23 = v7;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Failed to get an updated labelID for %@ with error %@", buf, 0x16u);
        }
      }

      goto LABEL_15;
    }
  }
LABEL_16:

}

- (BOOL)openDialRequest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  id v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  void (**v41)(_QWORD);
  _QWORD *v42;
  void (**v43)(_QWORD);
  _QWORD *v44;
  id v45;
  NSObject *v46;
  PHAirplaneEmergencyCallAlert *v47;
  PHMisconfiguredAccountAlert *v48;
  BOOL v49;
  id v50;
  NSObject *v51;
  void *v52;
  unsigned int v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *i;
  id v65;
  NSObject *v66;
  void *v67;
  void (**v68)(_QWORD);
  void (**v69)(_QWORD);
  id v70;
  NSObject *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  NSObject *v76;
  id v77;
  void *v78;
  id v80;
  NSObject *v81;
  id v82;
  void (**v83)(_QWORD);
  _QWORD *v84;
  id v85;
  _QWORD *v86;
  void *v87;
  void *v88;
  _TtC13InCallService16AlertCoordinator *v89;
  void *v90;
  void *v91;
  unsigned int v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  NSString *v101;
  char v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  char v107;
  id v108;
  NSObject *v109;
  uint64_t v110;
  char v111;
  void *v112;
  void *v113;
  void *v114;
  void (**v115)(_QWORD);
  void (**v116)(_QWORD);
  _QWORD *v117;
  unsigned int v118;
  void *v119;
  _QWORD *v120;
  _QWORD *v121;
  _QWORD *v122;
  _QWORD *v123;
  void (**v124)(_QWORD);
  _QWORD *v125;
  _QWORD *v126;
  _QWORD v127[4];
  PHMisconfiguredAccountAlert *v128;
  _QWORD *v129;
  _QWORD v130[4];
  id v131;
  _QWORD *v132;
  _QWORD v133[4];
  void (**v134)(_QWORD);
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _QWORD v140[5];
  id v141;
  _QWORD *v142;
  void (**v143)(_QWORD);
  _QWORD *v144;
  _QWORD v145[4];
  id v146;
  ICSApplicationDelegate *v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  _QWORD v153[5];
  id v154;
  id v155;
  id v156;
  _QWORD v157[4];
  id v158;
  id v159;
  id v160;
  _QWORD v161[4];
  id v162;
  ICSApplicationDelegate *v163;
  id v164;
  _QWORD v165[4];
  id v166;
  ICSApplicationDelegate *v167;
  id v168;
  _QWORD v169[4];
  id v170;
  uint8_t v171[128];
  uint8_t buf[4];
  id v173;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v173 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  +[ICSAriadne trace:](ICSAriadne, "trace:", 2);
  -[ICSApplicationDelegate updateDialRequestAccountIfNecessary:](self, "updateDialRequestAccountIfNecessary:", v4);
  v169[0] = _NSConcreteStackBlock;
  v169[1] = 3221225472;
  v169[2] = sub_100053694;
  v169[3] = &unk_1002848C0;
  v7 = v4;
  v170 = v7;
  v8 = objc_retainBlock(v169);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "provider"));
  if (!objc_msgSend(v9, "isTelephonyProvider"))
    goto LABEL_13;
  v10 = MGGetBoolAnswer(CFSTR("green-tea"));

  if (!v10)
  {
LABEL_14:
    if (+[SOSUtilities shouldBlockNonEmergencyCalls](SOSUtilities, "shouldBlockNonEmergencyCalls"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v21 = objc_msgSend(v20, "_isEmergencyDialRequest:", v7);

      if ((v21 & 1) == 0)
      {
        v50 = sub_1000C5588();
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Dial request rejected due to SOS being active", buf, 2u);
        }

        ((void (*)(_QWORD *, _QWORD))v8[2])(v8, 0);
        goto LABEL_32;
      }
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "frontmostCall"));

    if (v23 && objc_msgSend(v23, "isEmergency"))
    {
      v24 = sub_1000C5588();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Dial request rejected due to active emergency call", buf, 2u);
      }

      goto LABEL_28;
    }
    if (!v7)
    {
LABEL_28:
      ((void (*)(_QWORD *, _QWORD))v8[2])(v8, 0);
      v49 = 0;
LABEL_71:

      goto LABEL_72;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate senderIdentityClient](self, "senderIdentityClient"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dialRequestByResolvingDialTypeUsingSenderIdentityClient:", v26));

    v165[0] = _NSConcreteStackBlock;
    v165[1] = 3221225472;
    v165[2] = sub_10005377C;
    v165[3] = &unk_100285AA0;
    v28 = v27;
    v166 = v28;
    v167 = self;
    v29 = v8;
    v168 = v29;
    v30 = objc_retainBlock(v165);
    v161[0] = _NSConcreteStackBlock;
    v161[1] = 3221225472;
    v161[2] = sub_1000537FC;
    v161[3] = &unk_100285AA0;
    v31 = v28;
    v162 = v31;
    v163 = self;
    v32 = v29;
    v164 = v32;
    v33 = objc_retainBlock(v161);
    v157[0] = _NSConcreteStackBlock;
    v157[1] = 3221225472;
    v157[2] = sub_100053A38;
    v157[3] = &unk_100285B18;
    v34 = v31;
    v158 = v34;
    v35 = v30;
    v159 = v35;
    v36 = v32;
    v160 = v36;
    v153[0] = _NSConcreteStackBlock;
    v153[1] = 3221225472;
    v153[2] = sub_100053DB0;
    v153[3] = &unk_100285B68;
    v153[4] = self;
    v37 = objc_retainBlock(v157);
    v154 = v37;
    v38 = v35;
    v155 = v38;
    v39 = v36;
    v156 = v39;
    v40 = objc_retainBlock(v153);
    v145[0] = _NSConcreteStackBlock;
    v145[1] = 3221225472;
    v145[2] = sub_100053F7C;
    v145[3] = &unk_100285BB8;
    v7 = v34;
    v146 = v7;
    v147 = self;
    v126 = v40;
    v148 = v126;
    v41 = v33;
    v149 = v41;
    v42 = v37;
    v150 = v42;
    v43 = v38;
    v151 = v43;
    v125 = v39;
    v152 = v125;
    v44 = objc_retainBlock(v145);
    if (objc_msgSend(v7, "dialType") == (id)1
      && -[ICSApplicationDelegate shouldShowAirplaneEmergencyCallAlertForDialRequest:](self, "shouldShowAirplaneEmergencyCallAlertForDialRequest:", v7))
    {
      v45 = sub_1000C5588();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Device is in airplane mode. Showing airplane mode emergency call alert", buf, 2u);
      }

      v47 = [PHAirplaneEmergencyCallAlert alloc];
      v140[0] = _NSConcreteStackBlock;
      v140[1] = 3221225472;
      v140[2] = sub_100054210;
      v140[3] = &unk_100285BE0;
      v140[4] = self;
      v141 = v7;
      v142 = v42;
      v143 = v43;
      v144 = v125;
      v48 = -[PHAirplaneEmergencyCallAlert initWithDialAction:](v47, "initWithDialAction:", v140);

      if (!v48)
        goto LABEL_69;
      goto LABEL_53;
    }
    v124 = (void (**)(_QWORD))v42;
    if ((sub_100086FC4(v7) & 1) != 0)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "provider"));
      v53 = objc_msgSend(v52, "isFaceTimeProvider");

      if (v53)
      {
        v115 = v41;
        v54 = sub_1000C5588();
        v55 = objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Provider is FaceTime. Make sure we can initiate calls", buf, 2u);
        }

        v56 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](IMAccountController, "sharedInstance"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[IMService facetimeService](IMService, "facetimeService"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "accountsForService:", v57));

        v59 = v58;
        if (objc_msgSend(v58, "count"))
        {
          v116 = v43;
          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          v60 = v58;
          v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v136, v171, 16);
          if (v61)
          {
            v62 = v61;
            v63 = *(_QWORD *)v137;
            v120 = v44;
            while (2)
            {
              for (i = 0; i != v62; i = (char *)i + 1)
              {
                if (*(_QWORD *)v137 != v63)
                  objc_enumerationMutation(v60);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)i), "canSendMessages") & 1) != 0)
                {

                  v75 = sub_1000C5588();
                  v76 = objc_claimAutoreleasedReturnValue(v75);
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "At least one account can initiate calls for open dial request", buf, 2u);
                  }
                  v43 = v116;
                  v44 = v120;
                  v59 = v58;
                  goto LABEL_59;
                }
              }
              v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v136, v171, 16);
              v44 = v120;
              if (v62)
                continue;
              break;
            }
          }

          v65 = sub_1000C5588();
          v66 = objc_claimAutoreleasedReturnValue(v65);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            sub_1001A8BE0();

          ((void (*)(_QWORD *, _QWORD))v125[2])(v125, 0);
          v48 = objc_alloc_init(PHMisconfiguredAccountAlert);

          v41 = v115;
          v43 = v116;
LABEL_52:
          v42 = v124;
          if (!v48)
          {
LABEL_69:
            v78 = v126;
            goto LABEL_70;
          }
LABEL_53:
          -[ICSApplicationDelegate acquireLongPreventSuspensionAssertion](self, "acquireLongPreventSuspensionAssertion");
          -[PHMisconfiguredAccountAlert show](v48, "show");
          goto LABEL_69;
        }
        v77 = sub_1000C5588();
        v76 = objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "No accounts found when attempting to open dial request", buf, 2u);
        }
LABEL_59:
        v41 = v115;

      }
      if (-[ICSApplicationDelegate shouldShowTelephonyAccountUnavailableAlertForDialRequest:](self, "shouldShowTelephonyAccountUnavailableAlertForDialRequest:", v7))
      {
        -[ICSApplicationDelegate acquireLongPreventSuspensionAssertion](self, "acquireLongPreventSuspensionAssertion");
        ((void (*)(_QWORD *))v44[2])(v44);
        v48 = 0;
        v42 = v124;
        goto LABEL_69;
      }
      v42 = v124;
      if (-[ICSApplicationDelegate shouldShowEmergencyCallbackModeAlertForDialRequest:](self, "shouldShowEmergencyCallbackModeAlertForDialRequest:", v7))
      {
        -[ICSApplicationDelegate acquireLongPreventSuspensionAssertion](self, "acquireLongPreventSuspensionAssertion");
        v78 = v126;
        ((void (*)(_QWORD *, id))v126[2])(v126, v7);
        v48 = 0;
LABEL_70:

        v49 = 1;
        goto LABEL_71;
      }
      if (-[ICSApplicationDelegate shouldShowScreenTimeAlertForDialRequest:](self, "shouldShowScreenTimeAlertForDialRequest:", v7))
      {
        v41[2](v41);
      }
      else if (-[ICSApplicationDelegate shouldShowRTTAlertForDialRequest:](self, "shouldShowRTTAlertForDialRequest:", v7))
      {
        v124[2](v124);
      }
      else
      {
        if (objc_msgSend(v7, "showUIPrompt"))
        {
          v122 = v44;
          v80 = sub_1000C5588();
          v81 = objc_claimAutoreleasedReturnValue(v80);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Dial request's showUIPrompt is set to YES, so we will show an alert", buf, 2u);
          }

          v82 = objc_alloc((Class)TPDialPromptAlert);
          v133[0] = _NSConcreteStackBlock;
          v133[1] = 3221225472;
          v133[2] = sub_1000542B4;
          v133[3] = &unk_100285C08;
          v83 = v43;
          v134 = v43;
          v84 = v125;
          v135 = v84;
          v85 = objc_msgSend(v82, "initWithDialRequest:dialAction:", v7, v133);

          if (v85)
          {
            -[ICSApplicationDelegate acquireLongPreventSuspensionAssertion](self, "acquireLongPreventSuspensionAssertion");
            v127[0] = _NSConcreteStackBlock;
            v127[1] = 3221225472;
            v127[2] = sub_100054454;
            v127[3] = &unk_100285C30;
            v48 = (PHMisconfiguredAccountAlert *)v85;
            v128 = v48;
            v129 = v84;
            v86 = objc_retainBlock(v127);
            v87 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
            objc_msgSend(v87, "requestPasscodeUnlockWithCompletion:", v86);

          }
          else
          {
            v48 = 0;
          }
          v43 = v83;
          v44 = v122;
          v42 = v124;
          goto LABEL_69;
        }
        v88 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate alertCoordinator](self, "alertCoordinator"));

        if (!v88)
        {
          v89 = objc_alloc_init(_TtC13InCallService16AlertCoordinator);
          -[ICSApplicationDelegate setAlertCoordinator:](self, "setAlertCoordinator:", v89);

          v90 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate alertCoordinator](self, "alertCoordinator"));
          objc_msgSend(v90, "startMonitoring");

          v88 = 0;
        }
        v91 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate alertCoordinator](self, "alertCoordinator"));
        v92 = objc_msgSend(v91, "isStewieActive");
        if (v92)
        {
          v112 = v88;
          v111 = v92;
          v93 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
          v118 = objc_msgSend(v93, "_isEmergencyDialRequest:", v7);

          if (v118)
          {
            v119 = v43;
            v123 = v44;
            v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "handle"));
            v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "value"));
            v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "formattedDisplayID"));

            v97 = v96;
            v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v99 = v98;
            v113 = (void *)v96;
            if (v96)
            {
              v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("ALERT_ACTION_END_STEWIE_AND_CALL_%@"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
              v101 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v100, v97);
            }
            else
            {
              v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("ALERT_ACTION_END_STEWIE_AND_CALL"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
              v101 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v100, v110);
            }
            v103 = (void *)objc_claimAutoreleasedReturnValue(v101);

            v130[0] = _NSConcreteStackBlock;
            v130[1] = 3221225472;
            v130[2] = sub_100054384;
            v130[3] = &unk_100285C08;
            v131 = v119;
            v132 = v125;
            v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "localizedStringForKey:value:table:", CFSTR("ALERT_TITLE_END_STEWIE"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
            v48 = (PHMisconfiguredAccountAlert *)objc_claimAutoreleasedReturnValue(+[PHEmergencyEndCallAlert alertWithDialRequest:dialAction:title:buttonTitle:](PHEmergencyEndCallAlert, "alertWithDialRequest:dialAction:title:buttonTitle:", v7, v130, v105, v103));

            v43 = (void (**)(_QWORD))v119;
            v44 = v123;
            v102 = v111;
            v88 = v112;

          }
          else
          {
            v48 = 0;
            v102 = 0;
            v88 = v112;
          }
        }
        else
        {
          v114 = v91;
          v48 = 0;
          v102 = 0;

        }
        if (!v88)
        {
          v106 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate alertCoordinator](self, "alertCoordinator"));

          if (v106)
          {
            v107 = v102;
            v108 = sub_1000C5588();
            v109 = objc_claimAutoreleasedReturnValue(v108);
            if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "clean AlertCoordinator", buf, 2u);
            }

            -[ICSApplicationDelegate setAlertCoordinator:](self, "setAlertCoordinator:", 0);
            v102 = v107;
          }
        }
        v42 = v124;
        if (v48)
          goto LABEL_53;
        if ((v102 & 1) == 0)
          v43[2](v43);
      }
      v48 = 0;
      goto LABEL_69;
    }
    v117 = v8;
    v121 = v44;
    v67 = v23;
    v68 = v41;
    v69 = v43;
    v70 = sub_1000C5588();
    v71 = objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      sub_1001A8C0C();

    ((void (*)(_QWORD *, _QWORD))v125[2])(v125, 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "provider"));
    v73 = objc_msgSend(v7, "dialType");
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localSenderIdentityUUID"));
    v48 = (PHMisconfiguredAccountAlert *)objc_claimAutoreleasedReturnValue(+[PHNetworkUnavailableAlert alertWithCallProvider:dialType:senderIdentityUUID:](PHNetworkUnavailableAlert, "alertWithCallProvider:dialType:senderIdentityUUID:", v72, v73, v74));

    v43 = v69;
    v41 = v68;
    v23 = v67;
    v8 = v117;
    v44 = v121;
    goto LABEL_52;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet pn_verticalServiceCharacterSet](NSCharacterSet, "pn_verticalServiceCharacterSet"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "handle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
  v13 = objc_msgSend(v12, "rangeOfCharacterFromSet:", v9);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "processHandle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "handle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "value"));
  if (!objc_msgSend(v16, "length") || v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {

    goto LABEL_12;
  }
  v17 = -[ICSApplicationDelegate shouldShowPromptForProcessHandle:](self, "shouldShowPromptForProcessHandle:", v14);

  if (!v17)
  {
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  v18 = sub_1000C5588();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v173 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Vertical service code cannot be dialed for process handle %@", buf, 0xCu);
  }

  ((void (*)(_QWORD *, _QWORD))v8[2])(v8, 0);
LABEL_32:
  v49 = 0;
LABEL_72:

  return v49;
}

- (BOOL)openJoinConversationRequest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  Block_layout *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  PHMisconfiguredAccountAlert *v29;
  void *v30;
  __CFNotificationCenter *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v42[5];
  _QWORD v43[4];
  id v44;
  id v45;
  id v46[2];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  Block_layout *v52;
  uint8_t v53[128];
  __int128 buf;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Opening %@", (uint8_t *)&buf, 0xCu);
  }

  +[ICSAriadne trace:](ICSAriadne, "trace:", 1);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v55 = 0x3032000000;
  v56 = sub_10004B19C;
  v57 = sub_10004B1AC;
  v58 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "providerManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "faceTimeProvider"));

  v10 = -[ICSApplicationDelegate shouldShowScreenTimeAlertForJoinConversationRequest:](self, "shouldShowScreenTimeAlertForJoinConversationRequest:", v4);
  if (v10)
  {
    v11 = sub_1000C5588();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v46[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to initiate a call, restricted by Screen Time.", (uint8_t *)v46, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
    v14 = objc_msgSend(v13, "hasAdoptedModernInCallAPI");

    if (v14)
    {
      v15 = (Block_layout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
      -[ICSApplicationDelegate startScreenTimeFlowWithURL:](self, "startScreenTimeFlowWithURL:", v15);
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[SOSInCallUILauncher sharedInCallUILauncher](SOSInCallUILauncher, "sharedInCallUILauncher"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100054AF0;
      v51[3] = &unk_100285AC8;
      v52 = &stru_100285C50;
      objc_msgSend(v32, "launchInCallUIForReason:withRequestURL:completion:", 3, v33, v51);

      v15 = v52;
    }
    goto LABEL_36;
  }
  if ((sub_100087228() & 1) == 0)
  {
    v16 = sub_1000C5588();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1001A8C0C();

    v18 = objc_claimAutoreleasedReturnValue(+[PHNetworkUnavailableAlert alertWithCallProvider:dialType:senderIdentityUUID:](PHNetworkUnavailableAlert, "alertWithCallProvider:dialType:senderIdentityUUID:", v9, 0, 0));
    v19 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v18;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, TUCallCenterInCallServiceDialRequestFailureNotification, 0, 0, 1u);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](IMAccountController, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMService facetimeService](IMService, "facetimeService"));
  v15 = (Block_layout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "accountsForService:", v22));

  if (-[Block_layout count](v15, "count"))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v23 = v15;
    v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (!v24)
    {
LABEL_21:

      v27 = sub_1000C5588();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_1001A8C38();

      v29 = objc_alloc_init(PHMisconfiguredAccountAlert);
      v30 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v29;

      v31 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v31, TUCallCenterInCallServiceDialRequestFailureNotification, 0, 0, 1u);
      goto LABEL_28;
    }
    v25 = *(_QWORD *)v48;
LABEL_15:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v25)
        objc_enumerationMutation(v23);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v26), "canSendMessages") & 1) != 0)
        break;
      if (v24 == (id)++v26)
      {
        v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        if (v24)
          goto LABEL_15;
        goto LABEL_21;
      }
    }
  }
  else
  {
    v34 = sub_1000C5588();
    v23 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v46[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No accounts found when attempting to join conversation", (uint8_t *)v46, 2u);
    }
  }

LABEL_28:
  if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40) && objc_msgSend(v4, "showUIPrompt"))
  {
    v35 = sub_1000C5588();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v46[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Join request's showUIPrompt is set to YES, so we will show an alert", (uint8_t *)v46, 2u);
    }

    objc_initWeak(v46, self);
    v37 = objc_alloc((Class)TPDialPromptAlert);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100054BA8;
    v43[3] = &unk_100285C78;
    objc_copyWeak(&v45, v46);
    v44 = v4;
    v38 = objc_msgSend(v37, "initWithJoinRequest:dialAction:", v44, v43);
    v39 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v38;

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100054C84;
    v42[3] = &unk_100285628;
    v42[4] = &buf;
    -[ICSApplicationDelegate setProcessAssertionCompletion:](self, "setProcessAssertionCompletion:", v42);
    -[ICSApplicationDelegate acquireLongPreventSuspensionAssertion](self, "acquireLongPreventSuspensionAssertion");

    objc_destroyWeak(&v45);
    objc_destroyWeak(v46);
  }
  v40 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v40)
  {
    objc_msgSend(v40, "show");
  }
  else
  {
    -[ICSApplicationDelegate setProcessAssertionCompletion:](self, "setProcessAssertionCompletion:", 0);
    -[ICSApplicationDelegate showOrCreateCallForConversationRequest:](self, "showOrCreateCallForConversationRequest:", v4);
  }
LABEL_36:

  _Block_object_dispose(&buf, 8);
  return v10 ^ 1;
}

- (BOOL)openDialRequest:(id)a3 forProcessHandle:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[ICSApplicationDelegate configureDialRequest:forProcessHandle:](self, "configureDialRequest:forProcessHandle:", v6, v7);
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Initiating dial request %@ for process handle %@.", (uint8_t *)&v12, 0x16u);
  }

  v10 = -[ICSApplicationDelegate openDialRequest:](self, "openDialRequest:", v6);
  return v10;
}

- (BOOL)openUserInterfaceURL:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int HasChinaSKU;
  unsigned int v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v20;
  id v21;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "'%@'", (uint8_t *)&v20, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "frontmostAudioOrVideoCall"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "frontmostBargeCall"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "provider"));
  if (objc_msgSend(v11, "supportsDynamicSystemUI"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
    if (objc_msgSend(v12, "groupConversations"))
      HasChinaSKU = TUDeviceHasChinaSKU();
    else
      HasChinaSKU = 0;

  }
  else
  {
    HasChinaSKU = 0;
  }

  v14 = -[ICSApplicationDelegate shouldActivateSpringBoardRemoteAlertForCall:](self, "shouldActivateSpringBoardRemoteAlertForCall:", v8);
  if (objc_msgSend(v4, "isShowCarPlayInCallUIURL"))
  {
    v15 = 1;
    -[ICSApplicationDelegate showCarPlayUIWithActivation:](self, "showCarPlayUIWithActivation:", 1);
    goto LABEL_34;
  }
  if (v8 && ((HasChinaSKU ^ 1) & 1) == 0)
  {
    -[ICSApplicationDelegate requestGreenTea3PPresentationForCall:](self, "requestGreenTea3PPresentationForCall:", v8);
LABEL_33:
    v15 = 1;
    goto LABEL_34;
  }
  if (v8 && ((v14 ^ 1) & 1) == 0)
  {
    -[ICSApplicationDelegate requestSpringBoardPresentationForCall:dialRequest:tappedPill:](self, "requestSpringBoardPresentationForCall:dialRequest:tappedPill:", v8, 0, objc_msgSend(v4, "isShowInCallUIURL"));
    goto LABEL_33;
  }
  if (!v8 && objc_msgSend(v4, "isShowHandoffEligibleNearbyURL"))
  {
    -[ICSApplicationDelegate requestHandoffEligibleConversationPresentation](self, "requestHandoffEligibleConversationPresentation");
    goto LABEL_33;
  }
  if (objc_msgSend(v4, "isShowLagunaPullConversationURL"))
  {
    -[ICSApplicationDelegate requestLagunaPullConversationPresentation](self, "requestLagunaPullConversationPresentation");
    goto LABEL_33;
  }
  if (!v8 && v10)
  {
    if ((objc_msgSend(v4, "isShowIncomingTransmissionNoticeURL") & 1) != 0)
    {
      v16 = 2;
    }
    else if (objc_msgSend(v4, "isShowAccessoryButtonEventsNoticeURL"))
    {
      v16 = 3;
    }
    else
    {
      v16 = 1;
    }
    -[ICSApplicationDelegate requestPTTPresentation:forCall:](self, "requestPTTPresentation:forCall:", v16, v10);
    goto LABEL_33;
  }
  v17 = sub_1000C56D8();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_1001A8C64(v17);
  v15 = 0;
LABEL_34:
  if (objc_msgSend(v4, "isShowKeypadURL"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
    objc_msgSend(v18, "waitForRegistrationOfSceneWithType:completion:", 0, &stru_100285CB8);

  }
  return v15;
}

- (BOOL)openVideoMessagePlaybackURL:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  ICSMessageStoreClient *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  v6 = objc_msgSend(v5, "videoMessagingEnabled");

  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1001A8D60();
    goto LABEL_13;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Opening video message playback URL '%@'", buf, 0xCu);
  }

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "videoMessageUUID"));
  if (!v9)
  {
    v16 = sub_1000C5588();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1001A8D34();

LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate messageStoreClient](self, "messageStoreClient"));
  v11 = v10 == 0;

  if (v11)
  {
    v12 = objc_alloc_init(ICSMessageStoreClient);
    -[ICSApplicationDelegate setMessageStoreClient:](self, "setMessageStoreClient:", v12);

  }
  objc_initWeak((id *)buf, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate messageStoreClient](self, "messageStoreClient"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "videoMessageUUID"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100055374;
  v19[3] = &unk_100285CE0;
  objc_copyWeak(&v21, (id *)buf);
  v9 = v9;
  v20 = v9;
  objc_msgSend(v13, "urlForVideoMessageWithUUID:completionHandler:", v14, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
  v15 = 1;
LABEL_14:

  return v15;
}

- (void)performPresentationForVideoMessage
{
  id v3;
  id v4;

  v3 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  v4 = objc_msgSend(v3, "initWithSceneBundleIdentifier:", TUBundleIdentifierInCallServiceApplication);
  objc_msgSend(v4, "setShouldDismissCMASAlerts:", 0);
  objc_msgSend(v4, "setPreferredPresentationMode:", 2);
  objc_msgSend(v4, "setShouldPreferContinuityDisplayForFullScreenPresentation:", 1);
  -[ICSApplicationDelegate performPresentationWithConfiguration:forSceneType:](self, "performPresentationWithConfiguration:forSceneType:", v4, 4);

}

- (void)acquirePreventSuspensionAssertion
{
  -[ICSApplicationDelegate acquirePreventSuspensionAssertionForDuration:](self, "acquirePreventSuspensionAssertionForDuration:", 15.0);
}

- (void)acquireLongPreventSuspensionAssertion
{
  -[ICSApplicationDelegate acquirePreventSuspensionAssertionForDuration:](self, "acquirePreventSuspensionAssertionForDuration:", 30.0);
}

- (void)acquirePreventSuspensionAssertionForDuration:(double)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  int v19;
  void *v20;

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Asked to acquire temporary prevent suspension assertion", (uint8_t *)&v19, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate processAssertion](self, "processAssertion"));
  if (v7)
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate processAssertion](self, "processAssertion"));
      v19 = 138412290;
      v20 = v10;
      v11 = "There's already an existing temporary prevent suspension assertion: %@";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, 0xCu);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v12 = objc_alloc((Class)BKSProcessAssertion);
  v13 = objc_msgSend(v12, "initWithBundleIdentifier:flags:reason:name:", TUBundleIdentifierInCallServiceApplication, 15, 4, CFSTR("InCallServicePreventSuspensionAssertion"));
  -[ICSApplicationDelegate setProcessAssertion:](self, "setProcessAssertion:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate processAssertion](self, "processAssertion"));
  objc_msgSend(v14, "acquire");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate processAssertion](self, "processAssertion"));
  v16 = objc_msgSend(v15, "valid");

  v17 = sub_1000C5588();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v9 = v18;
  if (v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate processAssertion](self, "processAssertion"));
      v19 = 138412290;
      v20 = v10;
      v11 = "Acquired temporary prevent suspension assertion: %@";
      goto LABEL_9;
    }
LABEL_10:

    -[ICSApplicationDelegate startOrResetTimerForDuration:](self, "startOrResetTimerForDuration:", a3);
    return;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_1001A8E00(self, v9);

}

- (void)invalidatePreventSuspensionAssertion
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate processAssertion](self, "processAssertion"));
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating temporary prevent suspension assertion: %@", (uint8_t *)&v7, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate processAssertion](self, "processAssertion"));
  objc_msgSend(v6, "invalidate");

  -[ICSApplicationDelegate setProcessAssertion:](self, "setProcessAssertion:", 0);
}

- (void)startOrResetTimerForDuration:(double)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  uint8_t buf[4];
  void *v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate processAssertionTimer](self, "processAssertionTimer"));

  if (v5)
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "We have an existing timer -- invalidate and reschedule the invalidation", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate processAssertionTimer](self, "processAssertionTimer"));
    objc_msgSend(v8, "invalidate");

  }
  objc_initWeak(&location, self);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10005598C;
  v16 = &unk_100284DC8;
  objc_copyWeak(&v17, &location);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v13, a3));
  -[ICSApplicationDelegate setProcessAssertionTimer:](self, "setProcessAssertionTimer:", v9, v13, v14, v15, v16);

  v10 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate processAssertionTimer](self, "processAssertionTimer"));
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Scheduled prevent suspension invalidation timer: %@", buf, 0xCu);

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (BOOL)showSystemCallControlsURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  uint8_t v25[16];
  uint8_t buf[4];
  id v27;

  v4 = a3;
  v5 = sub_1000C55F8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requested system call controls with URL: '%{public}@'", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callScene"));

  if (v7)
  {
    if (-[ICSApplicationDelegate hasExistingFullScreenInCallScene](self, "hasExistingFullScreenInCallScene"))
    {
      v8 = sub_1000C56D8();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "System call controls requested via URL while a call is full-screen, assuming the status bar was tapped", buf, 2u);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("ICSStatusBarTappedNotification"), 0);

      goto LABEL_22;
    }
LABEL_14:
    -[ICSApplicationDelegate showCallControlsForCurrentContext](self, "showCallControlsForCurrentContext");
LABEL_22:
    v17 = 1;
    goto LABEL_23;
  }
  v10 = sub_1000C55F8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requested to show system call controls using URL scheme; callScene is nil, will request new call scene",
      buf,
      2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
  v12 = objc_msgSend(v11, "hasAssociatedCall");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
    v14 = objc_msgSend(v13, "wantsBannerWithoutScene");

    if (!v14)
    {
      objc_initWeak((id *)buf, self);
      v18 = sub_1000C55F8();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Presenting system call controls by creating call scene since one didn't exist before", v25, 2u);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activeCall"));
      -[ICSApplicationDelegate requestPresentationForCall:dialRequest:](self, "requestPresentationForCall:dialRequest:", v20, 0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100055DC4;
      v23[3] = &unk_100285D08;
      objc_copyWeak(&v24, (id *)buf);
      objc_msgSend(v21, "waitForRegistrationOfSceneWithType:completion:", 0, v23);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
      goto LABEL_22;
    }
    v15 = sub_1000C55F8();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Banner tracking placeholder call for conversation, do not create scene", buf, 2u);
    }
    goto LABEL_14;
  }
  v16 = sub_1000C55F8();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_1001A8E90();
  v17 = 0;
LABEL_23:

  return v17;
}

- (void)showCallControlsForCurrentContext
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void ***v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  unsigned int v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callScene"));

  v5 = objc_msgSend(v4, "systemControlsShouldPresentAsEmbedded");
  v6 = objc_msgSend(v4, "presentationMode");
  v7 = sub_1000C55F8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = SBSInCallPresentationModeDescription(v6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)v10;
    v12 = CFSTR("NO");
    *(_DWORD *)buf = 138543874;
    v36 = v4;
    if (v5)
      v12 = CFSTR("YES");
    v37 = 2114;
    v38 = v10;
    v39 = 2112;
    v40 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requested to show system call controls for the current context; callScene=%{public}@ presentationMode=%{public}@; "
      "shouldShowInCallControls:%@",
      buf,
      0x20u);

  }
  if (v5)
  {
    if (v6 == (id)2)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
      objc_msgSend(v13, "showInCallHUD");

    }
    else
    {
      v18 = sub_1000C55F8();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Presenting call controls by taking Call scene full-screen since the scene wants embedded controls and the scene isn't full-screen", buf, 2u);
      }
      objc_initWeak((id *)buf, self);
      v29 = _NSConcreteStackBlock;
      v30 = 3221225472;
      v31 = sub_100056234;
      v32 = &unk_100285D30;
      v33 = v4;
      objc_copyWeak(&v34, (id *)buf);
      v19 = objc_retainBlock(&v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController", v29, v30, v31, v32));
      v21 = objc_msgSend(v20, "pipState") == (id)2;

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
        objc_msgSend(v22, "manuallyStopPIPWithCompletion:", v19);

      }
      else
      {
        ((void (*)(void ***))v19[2])(v19);
      }

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate features](self, "features"));
    v15 = objc_msgSend(v14, "isSystemApertureEnabled");

    if (v15)
    {
      v16 = sub_1000C5588();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Ignoring request to show system HUD, because the HUD lifecycle on this device is managed by SpringBoard", buf, 2u);
      }

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate features](self, "features"));
      v24 = objc_msgSend(v23, "isIncomingCallBannerEnabled");

      v25 = sub_1000C55F8();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v24)
      {
        if (v26)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Presenting call controls banner for current context", buf, 2u);
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
        objc_msgSend(v27, "presentHUDForCurrentContext");

      }
      else
      {
        if (v26)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Presenting system call controls banner", buf, 2u);
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
        objc_msgSend(v28, "presentSystemHUD");

      }
    }
  }

}

- (BOOL)showScreenSharingURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  id v17;

  v4 = a3;
  v5 = sub_1000C5748();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User requested launching Screen Sharing full screen after potential unlock with URL: %@", (uint8_t *)&v16, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  v7 = objc_msgSend(v6, "supportsScreenSharing");

  if ((v7 & 1) == 0)
  {
    v12 = sub_1000C5748();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1001A8EBC();
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNKScreenSharingStateMonitorFactory sharedMonitor](self->_screenSharingMonitorFactory, "sharedMonitor"));
  v9 = objc_msgSend(v8, "isBroadcastingScreenSharing");

  if (v9)
  {
    v10 = sub_1000C5748();
    v11 = 0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not presenting screen sharing scene because this device is the one sharing its screen", (uint8_t *)&v16, 2u);
LABEL_9:
      v11 = 0;
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "screenSharingScene"));

    if (v14)
      objc_msgSend(v14, "requestTransitionToPresentationMode:isUserInitiated:analyticsSource:", 2, 1, 0);
    else
      -[ICSApplicationDelegate requestSpringBoardPresentationForScreenSharingAsPiP:](self, "requestSpringBoardPresentationForScreenSharingAsPiP:", 0);

    v11 = 1;
  }

  return v11;
}

- (BOOL)updateForegroundAppURL:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  int v10;
  id v11;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "'%@'", (uint8_t *)&v10, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
  v8 = -[ICSApplicationDelegate updateForegroundAppURL:using:](self, "updateForegroundAppURL:using:", v4, v7);

  return v8;
}

- (BOOL)handleBackgroundLaunchURL:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  id v11;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "'%@'", (uint8_t *)&v10, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "frontmostCall"));

  if (objc_msgSend(v8, "isEmergency") && objc_msgSend(v8, "supportsEmergencyFallback"))
    -[ICSApplicationDelegate handleSupportsEmergencyFallbackChangedForCall:](self, "handleSupportsEmergencyFallbackChangedForCall:", v8);

  return 1;
}

- (BOOL)refreshShareableContentURL:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  id v11;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "'%@'", (uint8_t *)&v10, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "foregroundAppBundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
  objc_msgSend(v8, "refreshShareableContentWithBundleIdentifier:", v7);

  return 1;
}

- (void)handleHeadsetButtonPressForCall:(id)a3 sourceIdentifier:(id)a4 urlOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", _UIApplicationOpenURLOptionsSourceProcessHandleKey));
  v13 = objc_opt_class(BSProcessHandle, v12);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0
    && -[ICSApplicationDelegate canModifyCallsForProcessHandle:](self, "canModifyCallsForProcessHandle:", v11))
  {
    -[ICSApplicationDelegate handleHeadsetButtonPressForCall:sourceIdentifier:](self, "handleHeadsetButtonPressForCall:sourceIdentifier:", v8, v9);
  }
  else
  {
    v14 = sub_1000C5588();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1001A8EE8();

  }
}

- (void)handleHeadsetButtonPressForCall:(id)a3 sourceIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v14
    && objc_msgSend(v14, "isIncoming")
    && objc_msgSend(v14, "isVideo")
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene")),
        v8 = objc_msgSend(v7, "presentationMode"),
        v7,
        v8 == (id)1))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
    objc_msgSend(v9, "requestTransitionToPresentationMode:shouldDismissCMASAlerts:analyticsSource:", 2, 0, CFSTR("SBSUIInCallTransitionAnalyticsSourceHeadsetButtonPress"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
    v12 = objc_msgSend(v11, "isAttachedToWindowedAccessoryWithValidFrameForCurrentScene");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    if (v12 && objc_msgSend(v14, "isConversation"))
      v13 = objc_msgSend(v14, "isIncoming");
    else
      v13 = 0;
    objc_msgSend(v9, "handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:allowBluetoothAnswerWithoutDowngrade:shouldForceDowngradeToAudio:", v6, 1, v13);
  }

}

- (id)incomingVideoCallUsingCallContainer:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callPassingTest:", &stru_100285D50));
  if (!v4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callPassingTest:", &stru_100285D70));
    if (!v4)
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "incomingVideoCall"));
  }

  return v4;
}

- (id)currentVideoCallUsingCallContainer:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callPassingTest:", &stru_100285D90));
  if (!v4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callPassingTest:", &stru_100285DB0));
    if (!v4)
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentVideoCall"));
  }

  return v4;
}

- (id)remoteAlertShellViewControllerForWindowScene:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  id v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v6 = objc_opt_class(ICSInCallSceneDelegate, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowSceneToWindowMap"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v3));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootViewController"));
    v13 = objc_opt_class(PHInCallRemoteAlertShellViewController, v12);
    v14 = objc_opt_isKindOfClass(v11, v13);

    if ((v14 & 1) != 0)
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootViewController"));
    else
      v15 = 0;
    v16 = v15;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (PHInCallRemoteAlertShellViewController)inCallShellViewController
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate remoteAlertShellViewControllerForWindowScene:](self, "remoteAlertShellViewControllerForWindowScene:", v3));

  return (PHInCallRemoteAlertShellViewController *)v4;
}

- (void)updatePrefersBannersHiddenFromClonedDisplay
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  _BYTE v16[24];
  const __CFString *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate screenSharingMonitorFactory](self, "screenSharingMonitorFactory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharedMonitor"));
  v5 = objc_msgSend(v4, "isBroadcastingScreenSharing");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate screenSharingInteractionControllerFactory](self, "screenSharingInteractionControllerFactory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharedController"));
  v8 = objc_msgSend(v7, "remoteControlStatus");

  if (v8 == (id)2)
    v9 = 0;
  else
    v9 = v5;
  v10 = sub_1000C5748();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if ((_DWORD)v9)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    if (v5)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    *(_DWORD *)v16 = 138543874;
    *(_QWORD *)&v16[4] = v12;
    *(_WORD *)&v16[12] = 2114;
    *(_QWORD *)&v16[14] = v13;
    if (v8 == (id)2)
      v11 = CFSTR("YES");
    *(_WORD *)&v16[22] = 2114;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Screen sharing callScene setPrefersBannersHiddenFromClonedDisplay: %{public}@ (isBroadcastingScreenSharing: %{public}@ isUnderRemoteControl: %{public}@)", v16, 0x20u);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager", *(_OWORD *)v16, *(_QWORD *)&v16[16]));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "callScene"));
  objc_msgSend(v15, "setPrefersBannersHiddenFromClonedDisplay:", v9);

}

- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingState:(BOOL)a4
{
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "call"));
    v6 = objc_msgSend(v5, "isConnected");

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempting to show screen sharing for a call that isn't connected yet")));
      NSLog(CFSTR("** TUAssertion failure: %@"), v7);

      _TUAssertShouldCrashApplication();
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
    v9 = objc_msgSend(v8, "hasPendingOrExistingSceneOfType:", 1);

    if (v9)
    {
      v10 = sub_1000C5748();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        sub_1001A8F48();
    }
    else
    {
      -[ICSApplicationDelegate requestSpringBoardPresentationForScreenSharingAsPiP:](self, "requestSpringBoardPresentationForScreenSharingAsPiP:", 1);
    }
  }
  else
  {
    -[ICSApplicationDelegate dismissScreenSharingSceneSession](self, "dismissScreenSharingSceneSession", a3);
  }
}

- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingBroadcastingState:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v4 = a4;
  -[ICSApplicationDelegate updatePrefersBannersHiddenFromClonedDisplay](self, "updatePrefersBannersHiddenFromClonedDisplay", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags"));
  v7 = objc_msgSend(v6, "screenSharingDrawToHighlightEnabled");

  if (v7)
  {
    if (v4)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "frontmostCall"));
      -[ICSApplicationDelegate requestSpringBoardPresentationForScreenSharingBroadcaster:](self, "requestSpringBoardPresentationForScreenSharingBroadcaster:", v8);

    }
    else
    {
      -[ICSApplicationDelegate dismissScreenSharingBroadcasterSession](self, "dismissScreenSharingBroadcasterSession");
    }
  }
}

- (void)screenSharingInteractionController:(id)a3 didUpdateRemoteControlStatus:(BOOL)a4
{
  void *v5;
  unsigned int v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate featureFlags](self, "featureFlags", a3, a4));
  v6 = objc_msgSend(v5, "screenSharingRemoteControlEnabled");

  if (v6)
  {
    -[ICSApplicationDelegate updatePrefersBannersHiddenFromClonedDisplay](self, "updatePrefersBannersHiddenFromClonedDisplay");
  }
  else
  {
    v7 = sub_1000C5748();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not updating banner state for remote control, screen sharing remote control feature flag is disabled", v8, 2u);
    }
  }
}

- (void)routesChangedForRouteController:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate routeListController](self, "routeListController", a3));
  objc_msgSend(v3, "reload");

}

- (void)bannerPresentationManagerRequestToPresentBanner:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  _QWORD v18[4];
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t *v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  char v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationRequestTimer](self, "bannerPresentationRequestTimer"));

  if (v5)
  {
    v6 = sub_1000C55F8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "requestToPresentBanner already pending, ignoring this request", buf, 2u);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000573C4;
    v29[3] = &unk_100285DD8;
    objc_copyWeak(&v31, &location);
    v7 = v4;
    v30 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v29, 3.0));
    -[ICSApplicationDelegate setBannerPresentationRequestTimer:](self, "setBannerPresentationRequestTimer:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
    v10 = objc_msgSend(v9, "wantsBannerWithoutScene");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationRequestTimer](self, "bannerPresentationRequestTimer"));
      objc_msgSend(v11, "invalidate");

      -[ICSApplicationDelegate setBannerPresentationRequestTimer:](self, "setBannerPresentationRequestTimer:", 0);
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
    else
    {
      *(_QWORD *)buf = 0;
      v26 = buf;
      v27 = 0x2020000000;
      v28 = 0;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100057460;
      v22[3] = &unk_100285E00;
      v24 = buf;
      v22[4] = self;
      v23 = v7;
      v12 = objc_retainBlock(v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100057558;
      v20[3] = &unk_100285E28;
      v14 = v12;
      v21 = v14;
      objc_msgSend(v13, "waitForRegistrationOfSceneWithType:completion:", 0, v20);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate features](self, "features"));
      v16 = objc_msgSend(v15, "isDominoEnabled");

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100057640;
        v18[3] = &unk_100284B90;
        v19 = v14;
        objc_msgSend(v17, "waitForRegistrationOfGenericSceneWithType:completion:", 5, v18);

      }
      _Block_object_dispose(buf, 8);
    }

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

}

- (void)bannerPresentationManagerUpdatedControlsManagerCallUUID:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate callUUIDWaitingToPresentBanner](self, "callUUIDWaitingToPresentBanner"));
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    -[ICSApplicationDelegate setCallUUIDWaitingToPresentBanner:](self, "setCallUUIDWaitingToPresentBanner:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
    v8 = objc_msgSend(v7, "presentationMode");

    if (!v8)
    {
      v9 = sub_1000C55F8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543362;
        v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Banner presentation manager updated call UUID to %{public}@ and scene is still dismissed, requesting to show controls", (uint8_t *)&v10, 0xCu);
      }
      -[ICSApplicationDelegate showCallControlsForCurrentContext](self, "showCallControlsForCurrentContext");
    }
  }

}

- (void)bannerPresentationManagerBannerPresentationManagerAVUpgradedCallUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callWithCallUUID:", v7));

    if (!v8 || objc_msgSend(v8, "status") != 4)
    {
      v9 = sub_1000C55F8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Banner presentation manager detected AVLess -> AV upgrade, requesting to present scene", v12, 2u);
      }
      -[ICSApplicationDelegate setAvUpgradedCallUUIDForDismissedScene:](self, "setAvUpgradedCallUUIDForDismissedScene:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeCall"));
      -[ICSApplicationDelegate requestPresentationForCall:dialRequest:](self, "requestPresentationForCall:dialRequest:", v11, 0);

      -[ICSApplicationDelegate setAvUpgradedCallUUIDForDismissedScene:](self, "setAvUpgradedCallUUIDForDismissedScene:", 0);
    }

  }
}

- (void)bannerPresentationManagerAVDowngradedGroupUUID:(id)a3
{
  NSObject *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = sub_1000C55F8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Banner presentation manager detected AV -> AVLess downgrade, dismissing scene", v9, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHApplicationDelegate features](self, "features"));
  v6 = objc_msgSend(v5, "isSystemApertureEnabled");

  if (v6)
  {
    +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHAVLessConversationAssertionReason"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
      objc_msgSend(v8, "requestTransitionToPresentationMode:shouldDismissCMASAlerts:", 0, 0);

    }
    else
    {
      -[ICSApplicationDelegate requestSpringBoardPresentationForCallDetailsView](self, "requestSpringBoardPresentationForCallDetailsView");
    }
  }
}

- (void)bannerPresentationManagerShowFullscreenUI
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "frontmostAudioOrVideoCall"));

  -[ICSApplicationDelegate requestSpringBoardPresentationForCall:dialRequest:tappedPill:](self, "requestSpringBoardPresentationForCall:dialRequest:tappedPill:", v4, 0, 1);
}

- (void)bannerPresentationManagerShowFullscreenCallDetailsView
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deep linking to call details view", v5, 2u);
  }

  -[ICSApplicationDelegate setDidDeepLinkToCallDetailsView:](self, "setDidDeepLinkToCallDetailsView:", 1);
  +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHAVLessConversationDetailsViewAssertionReason"));
  -[ICSApplicationDelegate requestFullScreenSpringBoardPresentationForCallDetailsView](self, "requestFullScreenSpringBoardPresentationForCallDetailsView");
}

- (NSString)inCallSceneSessionIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "callScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "session"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentIdentifier"));

  return (NSString *)v5;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return (NSSet *)sub_1000A33EC(0);
}

- (BOOL)hasPresentedFullScreenCallUI
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  v3 = objc_msgSend(v2, "callSceneHasPresentedFullScreen");

  return v3;
}

- (BOOL)isPresentingFullScreenCallUI
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
  v3 = objc_msgSend(v2, "presentationMode") == (id)2;

  return v3;
}

- (BOOL)isPresentingFullScreenOverlayCallUI
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
  v3 = objc_msgSend(v2, "presentationMode") == (id)3;

  return v3;
}

- (BOOL)isAlertAvailable
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate alertCoordinator](self, "alertCoordinator"));
  v3 = objc_msgSend(v2, "isAvailable");

  return v3;
}

- (id)audioRouteMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate routeListController](self, "routeListController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate routeListController](self, "routeListController"));
    objc_msgSend(v4, "reload");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioRoutingMenuController menuControllerWithCallStyle:dataSource:delegate:](PHAudioRoutingMenuController, "menuControllerWithCallStyle:dataSource:delegate:", 1, self, self));
    -[ICSApplicationDelegate setRouteListController:](self, "setRouteListController:", v4);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate routeListController](self, "routeListController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "menu"));

  return v6;
}

- (id)audioRouteGlyphFor:(id)a3
{
  return objc_msgSend(a3, "audioRouteGlyphForDisplayStyle:", 4);
}

- (UIImage)audioRouteGlyphForDevice
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHDevice currentDevice](PHDevice, "currentDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "audioRouteGlyphImage"));

  return (UIImage *)v3;
}

- (id)routesForAudioRoutingMenuController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedRoutes"));

  return v5;
}

- (void)audioRoutingMenuController:(id)a3 didSelectRoute:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeController"));
  objc_msgSend(v5, "pickRoute:", v4);

}

- (void)audioRoutingMenuController:(id)a3 didSelectLagunaActionForHandle:(id)a4 conversation:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "neighborhoodActivityConduit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100057ED0;
  v12[3] = &unk_100285E50;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "handoffConversation:toTVDevice:completion:", v10, v11, v12);

}

- (void)cleanupTTRBanner
{
  -[ICSApplicationDelegate setTTRBannerViewController:](self, "setTTRBannerViewController:", 0);
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  uint8_t v13[16];

  -[ICSApplicationDelegate handleStateChangeForAVLessConversation:fromConversation:](self, "handleStateChangeForAVLessConversation:fromConversation:", a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "frontmostAudioOrVideoCall"));

  if (-[ICSApplicationDelegate shouldAttemptRePresentationOfBannerOnConversationUpdate](self, "shouldAttemptRePresentationOfBannerOnConversationUpdate")&& v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeConversationForCall:", v6));
    if (!v8)
    {
LABEL_7:

      goto LABEL_8;
    }
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
    if (objc_msgSend(v10, "presentationMode") || objc_msgSend(v6, "status") == 5)
    {

      goto LABEL_7;
    }
    v11 = objc_msgSend(v6, "status");

    if (v11 != 6)
    {
      v12 = sub_1000C55F8();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "New conversation has been added that matches frontmost call, requesting HUD to be presented", v13, 2u);
      }
      -[ICSApplicationDelegate setShouldAttemptRePresentationOfBannerOnConversationUpdate:](self, "setShouldAttemptRePresentationOfBannerOnConversationUpdate:", 0);
      -[ICSApplicationDelegate showCallControlsForCurrentContext](self, "showCallControlsForCurrentContext");
    }
  }
LABEL_8:

}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  -[ICSApplicationDelegate handleStateChangeForAVLessConversation:fromConversation:](self, "handleStateChangeForAVLessConversation:fromConversation:", a4, 0);
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  -[ICSApplicationDelegate handleStateChangeForAVLessConversation:fromConversation:](self, "handleStateChangeForAVLessConversation:fromConversation:", a4, 0);
}

- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  -[ICSApplicationDelegate handleStateChangeForAVLessConversation:fromConversation:](self, "handleStateChangeForAVLessConversation:fromConversation:", a4, a5);
}

- (void)handleStateChangeForAVLessConversation:(id)a3 fromConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "avMode") || objc_msgSend(v6, "state") == (id)4 || !objc_msgSend(v6, "state"))
    goto LABEL_13;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
  if (objc_msgSend(v8, "wantsBannerWithoutScene"))
  {

LABEL_13:
    +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHAVLessConversationAssertionReason"));
    goto LABEL_14;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeholderCallGroupUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupUUID"));
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (!v12)
    goto LABEL_13;
  if (v7 && objc_msgSend(v7, "avMode"))
  {
    v13 = sub_1000C55F8();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
      v22 = 138412546;
      v23 = v6;
      v24 = 2112;
      v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Detected transition from AV -> AVLess for conversation: %@. Dismissing currentInCallScene: %@", (uint8_t *)&v22, 0x16u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate currentInCallScene](self, "currentInCallScene"));
    objc_msgSend(v16, "requestTransitionToPresentationMode:shouldDismissCMASAlerts:", 0, 0);

  }
  +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHAVLessConversationAssertionReason"));
  -[ICSApplicationDelegate requestSpringBoardPresentationForCallDetailsView](self, "requestSpringBoardPresentationForCallDetailsView");
LABEL_14:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "conversationManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "avLessConversation"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    objc_msgSend(v20, "updatePipSharePlaySessionWithConversation:", v6);

  }
  else
  {
    v21 = sub_1000C56D8();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No AVLess conversations remaining. Removing dismissal assertion.", (uint8_t *)&v22, 2u);
    }
    +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHAVLessConversationDetailsViewAssertionReason"));
  }

}

- (void)conversationManager:(id)a3 sharePlayAvailableChanged:(BOOL)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate routeListController](self, "routeListController", a3, a4));
  objc_msgSend(v4, "reload");

}

- (void)conversationManager:(id)a3 screenSharingAvailableChanged:(BOOL)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate routeListController](self, "routeListController", a3, a4));
  objc_msgSend(v4, "reload");

}

- (void)handleSupportsEmergencyFallbackChangedNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "object"));
  v6 = objc_opt_class(TUCall, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "object"));
  else
    v8 = 0;
  -[ICSApplicationDelegate handleSupportsEmergencyFallbackChangedForCall:](self, "handleSupportsEmergencyFallbackChangedForCall:", v8);

}

- (void)handleAlertInvokedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint8_t v11[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "alert was invoked, nil-ing out AlertCoordinator", v11, 2u);
  }

  -[ICSApplicationDelegate setAlertCoordinator:](self, "setAlertCoordinator:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AlertCoordinator automaticallyInvokedKey](_TtC13InCallService16AlertCoordinator, "automaticallyInvokedKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
    -[ICSApplicationDelegate startSOSFlowWithActivationReason:](self, "startSOSFlowWithActivationReason:", SOSRemoteAlertActivationReasonActivatingForSOSAlertRestingScreen);
}

- (void)handleSupportsEmergencyFallbackChangedForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _TtC13InCallService16AlertCoordinator *v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isEmergency"))
    {
      if (objc_msgSend(v5, "supportsEmergencyFallback"))
      {
        -[ICSApplicationDelegate acquirePreventSuspensionAssertion](self, "acquirePreventSuspensionAssertion");
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate alertCoordinator](self, "alertCoordinator"));

        if (!v6)
        {
          v7 = sub_1000C5588();
          v8 = objc_claimAutoreleasedReturnValue(v7);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Emergency fallback changed and alertCoordinator not initialized. Starting monitoring to start background countdown if necessary", v11, 2u);
          }

          v9 = objc_alloc_init(_TtC13InCallService16AlertCoordinator);
          -[ICSApplicationDelegate setAlertCoordinator:](self, "setAlertCoordinator:", v9);

          v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate alertCoordinator](self, "alertCoordinator"));
          objc_msgSend(v10, "startMonitoring");

        }
      }
    }
  }

}

- (void)prepareForAmbientScene:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_1000C5898();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Preparing for ambient scene: %@", (uint8_t *)&v7, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  objc_msgSend(v6, "registerGenericScene:ofType:", v4, 5);

}

- (void)transitionFromAmbientScene
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  -[ICSApplicationDelegate setIsPresentingAmbient:](self, "setIsPresentingAmbient:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ambientScene"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate sceneManager](self, "sceneManager"));
    objc_msgSend(v5, "didDismissSceneOfType:", 5);

  }
  else
  {
    v6 = sub_1000C5898();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1001A8FF4();
  }

}

+ (BOOL)hasCarKitRoute
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedRoutes"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "isCarKitRoute") & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (BOOL)shouldHandleBluetoothCommand
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  id v13;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate carKitSessionStatus](self, "carKitSessionStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSession"));

  if (v4)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 0;
      v7 = "Not handling command because we are connected to carplay";
      v8 = (uint8_t *)&v18;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else if (-[ICSApplicationDelegate isPresentingFullScreenCallUI](self, "isPresentingFullScreenCallUI"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUIUtilities sharedInstance](PHInCallUIUtilities, "sharedInstance"));
    v10 = objc_msgSend(v9, "isSpringBoardLocked");

    if (v10)
    {
      v11 = sub_1000C5588();
      v6 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 0;
        v7 = "Not handling command because springboard is locked";
        v8 = (uint8_t *)&v16;
        goto LABEL_13;
      }
    }
    else
    {
      if (!+[ICSApplicationDelegate hasCarKitRoute](ICSApplicationDelegate, "hasCarKitRoute"))
        return 1;
      v13 = sub_1000C5588();
      v6 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 0;
        v7 = "Not handling command because we are connected to a carkit route";
        v8 = (uint8_t *)&v15;
        goto LABEL_13;
      }
    }
  }
  else
  {
    v12 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v7 = "Not handling command because we are not showing screening UI";
      v8 = (uint8_t *)&v17;
      goto LABEL_13;
    }
  }

  return 0;
}

- (void)shouldHandleMRCommand:(unsigned int)a3 completion:(id)a4
{
  void (**v6)(id, _BOOL8, _QWORD);
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  _DWORD v13[2];

  v6 = (void (**)(id, _BOOL8, _QWORD))a4;
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asked to handle MRCommand %u", (uint8_t *)v13, 8u);
  }

  v9 = -[ICSApplicationDelegate shouldHandleBluetoothCommand](self, "shouldHandleBluetoothCommand");
  v10 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received a MediaRemoteCommand for a screening call and we are presenting screening UI, so treating this as a regular button press and hijacking command from MR", (uint8_t *)v13, 2u);
    }

    v11 = objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    -[NSObject handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:allowBluetoothAnswerWithoutDowngrade:shouldForceDowngradeToAudio:](v11, "handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:allowBluetoothAnswerWithoutDowngrade:shouldForceDowngradeToAudio:", 0, 0, 1);
  }
  else if (v12)
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received a MediaRemoteCommand for a screening call but we are NOT presenting screening UI, so returning the command back to MR", (uint8_t *)v13, 2u);
  }

  v6[2](v6, v9, 0);
}

- (void)shouldHandleMRCommand:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _BOOL8, _QWORD);
  id v10;
  NSObject *v11;
  _BOOL8 v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  _DWORD v16[2];
  __int16 v17;
  id v18;

  v8 = a4;
  v9 = (void (**)(id, _BOOL8, _QWORD))a5;
  v10 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109378;
    v16[1] = a3;
    v17 = 2112;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Asked to handle MRCommand %u from routeUID: %@", (uint8_t *)v16, 0x12u);
  }

  v12 = -[ICSApplicationDelegate shouldHandleBluetoothCommand](self, "shouldHandleBluetoothCommand");
  v13 = sub_1000C5588();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v15)
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received a MediaRemoteCommand for a screening call and we are presenting screening UI, so treating this as a regular button press and hijacking command from MR", (uint8_t *)v16, 2u);
    }

    v14 = objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    -[NSObject handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:allowBluetoothAnswerWithoutDowngrade:shouldForceDowngradeToAudio:](v14, "handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:allowBluetoothAnswerWithoutDowngrade:shouldForceDowngradeToAudio:", v8, 0, 1);
  }
  else if (v15)
  {
    LOWORD(v16[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received a MediaRemoteCommand for a screening call but we are NOT presenting screening UI, so returning the command back to MR", (uint8_t *)v16, 2u);
  }

  v9[2](v9, v12, 0);
}

- (void)handleRedialCommandWhileScreening:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  unsigned int v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  int v28;
  id v29;
  __int16 v30;
  const __CFString *v31;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138412290;
    v29 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Asked to handle redial %@", (uint8_t *)&v28, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screeningCall"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
    v11 = objc_claimAutoreleasedReturnValue(+[TUHandle normalizedHandleWithDestinationID:](TUHandle, "normalizedHandleWithDestinationID:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[TUHandle normalizedHandleWithDestinationID:](TUHandle, "normalizedHandleWithDestinationID:", v13));

    v15 = -[__CFString isEqualToHandle:](v14, "isEqualToHandle:", v11);
    v16 = -[ICSApplicationDelegate shouldHandleBluetoothCommand](self, "shouldHandleBluetoothCommand");
    v17 = sub_1000C5588();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412546;
      v29 = v11;
      v30 = 2112;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Normalized handle from screening call %@ redial %@", (uint8_t *)&v28, 0x16u);
    }

    v19 = sub_1000C5588();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if ((v16 | v15) == 1)
    {
      if (v21)
      {
        v22 = CFSTR("NO");
        if (v16)
          v23 = CFSTR("YES");
        else
          v23 = CFSTR("NO");
        if (v15)
          v22 = CFSTR("YES");
        v28 = 138412546;
        v29 = (id)v23;
        v30 = 2112;
        v31 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Answering call for redial since ICS is presenting screening UI: %@ or is trying to call the same person we are screening %@", (uint8_t *)&v28, 0x16u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "audioSourceIdentifier"));
      objc_msgSend(v24, "handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:allowBluetoothAnswerWithoutDowngrade:shouldForceDowngradeToAudio:", v25, 0, 1);

    }
    else
    {
      if (v21)
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not presenting screening UI so dialing for redial", (uint8_t *)&v28, 2u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v27 = objc_msgSend(v24, "dialWithRequest:", v4);
    }

  }
  else
  {
    v26 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1001A9020();
  }

}

- (void)fetchInCallUIState:(id)a3
{
  void (**v4)(id, id, _QWORD);
  id v5;
  NSObject *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  int v16;
  uint64_t v17;

  v4 = (void (**)(id, id, _QWORD))a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Asked to fetch UI state", (uint8_t *)&v16, 2u);
  }

  v7 = -[ICSApplicationDelegate isPresentingFullScreenCallUI](self, "isPresentingFullScreenCallUI");
  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate inCallShellViewController](self, "inCallShellViewController"));
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate bannerPresentationManager](self, "bannerPresentationManager"));
  v9 = v8;
  v10 = objc_msgSend(v8, "isMicIndicatorVisible");

  v11 = 2;
  if (!v10)
    v11 = 0;
  v12 = v11 | v7;
  v13 = objc_msgSend(objc_alloc((Class)TUUIContext), "initWithState:", v12);
  v14 = sub_1000C5588();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134217984;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "UIState is %lu", (uint8_t *)&v16, 0xCu);
  }

  v4[2](v4, v13, 0);
}

- (void)fetchRemoteControlStatus:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  NSObject *v15;
  int v16;
  uint64_t v17;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate screenSharingInteractionControllerFactory](self, "screenSharingInteractionControllerFactory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sharedController"));
  v7 = (uint64_t)objc_msgSend(v6, "remoteControlStatus");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplicationDelegate screenSharingInteractionControllerFactory](self, "screenSharingInteractionControllerFactory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharedController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "latestRemoteControlDate"));

  if (v7 != 2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v11, "timeIntervalSinceDate:", v10);
    v13 = v12;

    if (v13 < 3.0)
      v7 = 2;
  }
  v14 = sub_1000C5588();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134217984;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Returning remote control status: %ld", (uint8_t *)&v16, 0xCu);
  }

  v4[2](v4, v7, 0);
}

- (CNKAnsweringMachine)answeringMachine
{
  return self->_answeringMachine;
}

- (CARSessionStatus)carKitSessionStatus
{
  return self->_carKitSessionStatus;
}

- (void)setCarKitSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_carKitSessionStatus, a3);
}

- (TUCall)mostRecentlyDisconnectedAudioCall
{
  return self->_mostRecentlyDisconnectedAudioCall;
}

- (TUCall)mostRecentlyDisconnectedVideoCall
{
  return self->_mostRecentlyDisconnectedVideoCall;
}

- (void)setMostRecentlyDisconnectedVideoCall:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentlyDisconnectedVideoCall, a3);
}

- (BOOL)allowsCarPlayBanners
{
  return self->_allowsCarPlayBanners;
}

- (BOOL)shouldIgnoreCarPlayAssertionInvalidations
{
  return self->_shouldIgnoreCarPlayAssertionInvalidations;
}

- (void)setShouldIgnoreCarPlayAssertionInvalidations:(BOOL)a3
{
  self->_shouldIgnoreCarPlayAssertionInvalidations = a3;
}

- (ICSActivationContext)activationContext
{
  return self->_activationContext;
}

- (BOOL)didDeepLinkToCallDetailsView
{
  return self->_didDeepLinkToCallDetailsView;
}

- (void)setDidDeepLinkToCallDetailsView:(BOOL)a3
{
  self->_didDeepLinkToCallDetailsView = a3;
}

- (AlertCoordinatorProtocol)alertCoordinator
{
  return self->_alertCoordinator;
}

- (void)setAlertCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_alertCoordinator, a3);
}

- (NSMutableSet)allInCallScenes
{
  return self->_allInCallScenes;
}

- (void)setAllInCallScenes:(id)a3
{
  objc_storeStrong((id *)&self->_allInCallScenes, a3);
}

- (NSMutableSet)connectedSceneSessionIdentifiers
{
  return self->_connectedSceneSessionIdentifiers;
}

- (void)setConnectedSceneSessionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_connectedSceneSessionIdentifiers, a3);
}

- (ICSSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (void)setSceneManager:(id)a3
{
  objc_storeStrong((id *)&self->_sceneManager, a3);
}

- (void)setBannerPresentationManager:(id)a3
{
  objc_storeStrong((id *)&self->_bannerPresentationManager, a3);
}

- (ICSPillStateMonitor)pillStateMonitor
{
  return self->_pillStateMonitor;
}

- (void)setPillStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_pillStateMonitor, a3);
}

- (BOOL)isShowingIncomingNameUpdate
{
  return self->_isShowingIncomingNameUpdate;
}

- (void)setIsShowingIncomingNameUpdate:(BOOL)a3
{
  self->_isShowingIncomingNameUpdate = a3;
}

- (BOOL)didDeepLinkToPTTCallDetailsView
{
  return self->_didDeepLinkToPTTCallDetailsView;
}

- (void)setDidDeepLinkToPTTCallDetailsView:(BOOL)a3
{
  self->_didDeepLinkToPTTCallDetailsView = a3;
}

- (NSUUID)callUUIDWaitingToPresentBanner
{
  return self->_callUUIDWaitingToPresentBanner;
}

- (void)setCallUUIDWaitingToPresentBanner:(id)a3
{
  objc_storeStrong((id *)&self->_callUUIDWaitingToPresentBanner, a3);
}

- (BOOL)shouldAttemptRePresentationOfBannerOnConversationUpdate
{
  return self->_shouldAttemptRePresentationOfBannerOnConversationUpdate;
}

- (void)setShouldAttemptRePresentationOfBannerOnConversationUpdate:(BOOL)a3
{
  self->_shouldAttemptRePresentationOfBannerOnConversationUpdate = a3;
}

- (BKSProcessAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_processAssertion, a3);
}

- (NSTimer)processAssertionTimer
{
  return self->_processAssertionTimer;
}

- (void)setProcessAssertionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_processAssertionTimer, a3);
}

- (NSTimer)bannerPresentationRequestTimer
{
  return self->_bannerPresentationRequestTimer;
}

- (void)setBannerPresentationRequestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_bannerPresentationRequestTimer, a3);
}

- (PHAudioRoutingMenuController)routeListController
{
  return self->_routeListController;
}

- (void)setRouteListController:(id)a3
{
  objc_storeStrong((id *)&self->_routeListController, a3);
}

- (NSMutableSet)connectedCallIdentifiers
{
  return self->_connectedCallIdentifiers;
}

- (void)setConnectedCallIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_connectedCallIdentifiers, a3);
}

- (ICSCameraStateMonitor)cameraStateMonitor
{
  return self->_cameraStateMonitor;
}

- (void)setCameraStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_cameraStateMonitor, a3);
}

- (TURTCCallReporter)callReporter
{
  return self->_callReporter;
}

- (void)setCallReporter:(id)a3
{
  objc_storeStrong((id *)&self->_callReporter, a3);
}

- (TUJoinConversationRequest)currentJoinConversationRequest
{
  return self->_currentJoinConversationRequest;
}

- (void)setCurrentJoinConversationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentJoinConversationRequest, a3);
}

- (NSMutableDictionary)backgroundPIPAuthorizationForSceneType
{
  return self->_backgroundPIPAuthorizationForSceneType;
}

- (void)setBackgroundPIPAuthorizationForSceneType:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundPIPAuthorizationForSceneType, a3);
}

- (TTRBannerControllerProtocol)TTRBannerViewController
{
  return self->_TTRBannerViewController;
}

- (void)setTTRBannerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_TTRBannerViewController, a3);
}

- (NSUUID)avUpgradedCallUUIDForDismissedScene
{
  return self->_avUpgradedCallUUIDForDismissedScene;
}

- (void)setAvUpgradedCallUUIDForDismissedScene:(id)a3
{
  self->_avUpgradedCallUUIDForDismissedScene = (NSUUID *)a3;
}

- (ICSMessageStoreClient)messageStoreClient
{
  return self->_messageStoreClient;
}

- (void)setMessageStoreClient:(id)a3
{
  objc_storeStrong((id *)&self->_messageStoreClient, a3);
}

- (CNKScreenSharingStateMonitorFactory)screenSharingMonitorFactory
{
  return self->_screenSharingMonitorFactory;
}

- (void)setScreenSharingMonitorFactory:(id)a3
{
  objc_storeStrong((id *)&self->_screenSharingMonitorFactory, a3);
}

- (CNKScreenSharingInteractionControllerFactory)screenSharingInteractionControllerFactory
{
  return self->_screenSharingInteractionControllerFactory;
}

- (ICSAmbientActivityController)ambientActivityController
{
  return self->_ambientActivityController;
}

- (TUUIXPCHost)xpcHost
{
  return self->_xpcHost;
}

- (void)setXpcHost:(id)a3
{
  objc_storeStrong((id *)&self->_xpcHost, a3);
}

- (id)processAssertionCompletion
{
  return self->_processAssertionCompletion;
}

- (void)setProcessAssertionCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processAssertionCompletion, 0);
  objc_storeStrong((id *)&self->_xpcHost, 0);
  objc_storeStrong((id *)&self->_ambientActivityController, 0);
  objc_storeStrong((id *)&self->_screenSharingInteractionControllerFactory, 0);
  objc_storeStrong((id *)&self->_screenSharingMonitorFactory, 0);
  objc_storeStrong((id *)&self->_messageStoreClient, 0);
  objc_storeStrong((id *)&self->_TTRBannerViewController, 0);
  objc_storeStrong((id *)&self->_backgroundPIPAuthorizationForSceneType, 0);
  objc_storeStrong((id *)&self->_currentJoinConversationRequest, 0);
  objc_storeStrong((id *)&self->_callReporter, 0);
  objc_storeStrong((id *)&self->_cameraStateMonitor, 0);
  objc_storeStrong((id *)&self->_connectedCallIdentifiers, 0);
  objc_storeStrong((id *)&self->_routeListController, 0);
  objc_storeStrong((id *)&self->_bannerPresentationRequestTimer, 0);
  objc_storeStrong((id *)&self->_processAssertionTimer, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_callUUIDWaitingToPresentBanner, 0);
  objc_storeStrong((id *)&self->_pillStateMonitor, 0);
  objc_storeStrong((id *)&self->_bannerPresentationManager, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_connectedSceneSessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_allInCallScenes, 0);
  objc_storeStrong((id *)&self->_alertCoordinator, 0);
  objc_storeStrong((id *)&self->_activationContext, 0);
  objc_storeStrong((id *)&self->_mostRecentlyDisconnectedVideoCall, 0);
  objc_storeStrong((id *)&self->_mostRecentlyDisconnectedAudioCall, 0);
  objc_storeStrong((id *)&self->_carKitSessionStatus, 0);
  objc_storeStrong((id *)&self->_answeringMachine, 0);
  objc_storeStrong((id *)&self->_carPlayServicesController, 0);
  objc_storeStrong((id *)&self->_senderIdentityClient, 0);
}

- (id)swiftui_rootViewForSimplifiedApplicationProvider
{
  ICSApplicationDelegate *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id (*v7[3])();
  uint64_t v8;

  v2 = self;
  sub_100120BB0(v7);

  v3 = v8;
  v4 = sub_10011ACB0(v7, v8);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  sub_100110DC0(v7);
  return v5;
}

- (BOOL)isPresentingAmbient
{
  ICSApplicationDelegate *v2;
  char v3;

  v2 = self;
  v3 = ICSApplicationDelegate.isPresentingAmbient.getter();

  return v3 & 1;
}

- (void)setIsPresentingAmbient:(BOOL)a3
{
  _BOOL8 v3;
  ICSApplicationDelegate *v4;

  v3 = a3;
  v4 = self;
  ICSApplicationDelegate.isPresentingAmbient.setter(v3);

}

- (BOOL)updateForegroundAppURL:(id)a3 using:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  ICSApplicationDelegate *v13;
  NSURL *v14;
  uint64_t v16;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = a4;
  v13 = self;
  LOBYTE(self) = ICSApplicationDelegate.updateForegroundApp(url:using:)((uint64_t)v12, v14);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return self & 1;
}

- (void)dismissAnsweredCallBannerIfNeeded
{
  ICSApplicationDelegate *v2;

  v2 = self;
  ICSApplicationDelegate.dismissAnsweredCallBannerIfNeeded()();

}

- (id)makeAnsweringMachineWithPrivateSelf:(id)a3
{
  ICSApplicationDelegate *v5;
  void *v6;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = (void *)sub_100121448();
  swift_unknownObjectRelease(a3);

  return v6;
}

@end
