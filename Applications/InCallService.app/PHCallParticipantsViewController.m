@implementation PHCallParticipantsViewController

- (PHCallParticipantsViewController)initWithCallDisplayStyleManager:(id)a3
{
  return -[PHCallParticipantsViewController initWithCallDisplayStyleManager:contactsCache:](self, "initWithCallDisplayStyleManager:contactsCache:", a3, 0);
}

- (PHCallParticipantsViewController)initWithCallDisplayStyleManager:(id)a3 contactsCache:(id)a4
{
  id v7;
  id v8;
  PHCallParticipantsViewController *v9;
  uint64_t v10;
  CNKFeatures *features;
  CNKCallParticipantLabelDescriptorFactory *v12;
  CNKCallParticipantLabelDescriptorFactory *labelDescriptorFactory;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PHCallParticipantsViewController;
  v9 = -[PHCallParticipantsViewController init](&v15, "init");
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
    features = v9->_features;
    v9->_features = (CNKFeatures *)v10;

    objc_storeStrong((id *)&v9->_callDisplayStyleManager, a3);
    v12 = objc_opt_new(CNKCallParticipantLabelDescriptorFactory);
    labelDescriptorFactory = v9->_labelDescriptorFactory;
    v9->_labelDescriptorFactory = v12;

    objc_storeStrong((id *)&v9->_contactsCache, a4);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHIntervalTimer oneSecondTimer](PHIntervalTimer, "oneSecondTimer"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PHCallParticipantsViewController;
  -[PHCallParticipantsViewController dealloc](&v5, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHCallParticipantsViewController;
  -[PHCallParticipantsViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "callStatusChangedNotification:", TUCallCenterCallStatusChangedNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "localSenderIdentityAccountUUIDChangedNotification:", TUCallLocalSenderIdentityAccountUUIDChangedNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "conferenceParticipantsChangedNotification:", TUCallCenterConferenceParticipantsChangedNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "isThirdPartyVideoChangedNotification:", TUCallIsThirdPartyVideoChangedNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "callModelChangedNotification:", TUCallModelChangedNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "displayContextChangedNotification:", TUCallDisplayContextChangedNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "keypadDataSourceChangedNotification:", CFSTR("PHInCallKeypadDataSourceChangedNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "callContinuityChangedNotification:", TUCallCenterCallContinuityStateChangedNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "handleAlertDisconnectingCallsNotification:", CFSTR("PHAlertDisconnectingCallsNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "tuCallHasBeenRedirectedChangedNotification:", TUCallHasBeenRedirectedChangedNotification, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationManager"));
  objc_msgSend(v6, "addDelegate:queue:", self, &_dispatch_main_q);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHIntervalTimer oneSecondTimer](PHIntervalTimer, "oneSecondTimer"));
  objc_msgSend(v7, "addObserver:selector:", self, "secondTickNotification:");

  -[PHCallParticipantsViewController _updateCallGroups](self, "_updateCallGroups");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHCallParticipantsViewController;
  -[PHCallParticipantsViewController viewDidDisappear:](&v8, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = objc_msgSend(v4, "currentAudioAndVideoCallCount");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
    objc_msgSend(v6, "removeAllObjects");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHIntervalTimer oneSecondTimer](PHIntervalTimer, "oneSecondTimer"));
  objc_msgSend(v7, "removeObserver:", self);

}

- (void)loadView
{
  PHCallParticipantsView *v3;
  void *v4;
  PHCallParticipantsView *v5;

  v3 = [PHCallParticipantsView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v5 = -[PHCallParticipantsView initWithCallDisplayStyleManager:](v3, "initWithCallDisplayStyleManager:", v4);

  -[PHCallParticipantsView setDelegate:](v5, "setDelegate:", self);
  -[PHCallParticipantsViewController setParticipantsView:](self, "setParticipantsView:", v5);
  -[PHCallParticipantsViewController setView:](self, "setView:", v5);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PHCallParticipantsViewController;
  -[PHCallParticipantsViewController viewDidLoad](&v2, "viewDidLoad");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPrioritizedCall:(id)a3
{
  id WeakRetained;
  unsigned __int8 v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_prioritizedCall);
  v5 = objc_msgSend(WeakRetained, "isEqualToCall:", obj);

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_prioritizedCall, obj);
    -[PHCallParticipantsViewController updateCallGroups](self, "updateCallGroups");
  }

}

- (TUCall)prioritizedCall
{
  id WeakRetained;

  if (-[PHCallParticipantsViewController usesCompactMulticallUI](self, "usesCompactMulticallUI"))
    WeakRetained = objc_loadWeakRetained((id *)&self->_prioritizedCall);
  else
    WeakRetained = 0;
  return (TUCall *)WeakRetained;
}

- (NSMutableArray)callGroups
{
  NSMutableArray *callGroups;
  NSMutableArray *v4;
  NSMutableArray *v5;

  callGroups = self->_callGroups;
  if (!callGroups)
  {
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = self->_callGroups;
    self->_callGroups = v4;

    -[PHCallParticipantsViewController _updateCallGroups](self, "_updateCallGroups");
    callGroups = self->_callGroups;
  }
  return callGroups;
}

- (id)currentCallGroups
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentCallGroups"));

  return v3;
}

- (void)_updateCallGroups
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _UNKNOWN **v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  char v34;
  void *i;
  void *v36;
  void *v37;
  id v38;
  int v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  _BOOL8 v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned __int8 v50;
  NSObject *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *j;
  void *v56;
  void *v57;
  void *v58;
  unsigned __int8 v59;
  NSObject *v60;
  id v61;
  id v62;
  uint64_t v63;
  void *k;
  void *v65;
  void *v66;
  id v67;
  char *v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned __int8 v72;
  char *v73;
  char *v74;
  dispatch_time_t v75;
  void *v76;
  char *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  char v94;
  id v95;
  NSObject *v96;
  void *v97;
  _BOOL8 v98;
  id v99;
  void *v100;
  id v101;
  NSObject *v102;
  NSObject *v103;
  _QWORD block[4];
  id v105;
  PHCallParticipantsViewController *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  void *v130;
  _BYTE v131[128];
  uint8_t v132[128];
  uint8_t buf[4];
  NSObject *v134;
  __int16 v135;
  NSObject *v136;

  if (!-[PHCallParticipantsViewController callIsAboutToEndForStewie](self, "callIsAboutToEndForStewie"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController currentCallGroups](self, "currentCallGroups"));
    v6 = objc_msgSend(v5, "mutableCopy");

    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
      *(_DWORD *)buf = 138412546;
      v134 = v9;
      v135 = 2112;
      v136 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_updateCallGroups: CACHED: %@ -> CURRENT: %@", buf, 0x16u);

    }
    v10 = CNKTranscriptionViewComposerFactory_ptr;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "callWithStatus:", 1));
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "callWithStatus:", 2));

    }
    if (-[PHCallParticipantsViewController usesCompactMulticallUI](self, "usesCompactMulticallUI"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController prioritizedCall](self, "prioritizedCall"));

      if (v16)
      {
        v125 = 0u;
        v126 = 0u;
        v123 = 0u;
        v124 = 0u;
        v17 = v6;
        v99 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
        if (!v99)
          goto LABEL_26;
        v18 = *(_QWORD *)v124;
        v101 = v14;
        v102 = v6;
LABEL_13:
        v19 = 0;
        while (1)
        {
          v20 = v18;
          if (*(_QWORD *)v124 != v18)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)v19);
          v119 = 0u;
          v120 = 0u;
          v121 = 0u;
          v122 = 0u;
          v100 = v21;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "calls", v99));
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
          if (v23)
            break;
LABEL_24:

          v19 = (char *)v19 + 1;
          v14 = v101;
          v6 = v102;
          v18 = v20;
          if (v19 == v99)
          {
            v10 = CNKTranscriptionViewComposerFactory_ptr;
            v99 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
            if (!v99)
            {
LABEL_26:

              goto LABEL_27;
            }
            goto LABEL_13;
          }
        }
        v24 = v23;
        v25 = *(_QWORD *)v120;
LABEL_18:
        v26 = 0;
        while (1)
        {
          if (*(_QWORD *)v120 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController prioritizedCall](self, "prioritizedCall"));
          LODWORD(v27) = objc_msgSend(v27, "isEqualToCall:", v28);

          if ((_DWORD)v27)
            break;
          if (v24 == (id)++v26)
          {
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
            if (!v24)
              goto LABEL_24;
            goto LABEL_18;
          }
        }
        v40 = sub_1000C5588();
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController prioritizedCall](self, "prioritizedCall"));
          *(_DWORD *)buf = 138412290;
          v134 = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Updated call groups using prioritizedCall: %@", buf, 0xCu);

        }
        v130 = v100;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v130, 1));
        v44 = objc_msgSend(v43, "mutableCopy");
        -[PHCallParticipantsViewController setCallGroups:](self, "setCallGroups:", v44);

        v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController participantsView](self, "participantsView"));
        objc_msgSend(v45, "updateParticipantsAnimated:", 1);

        v46 = -[PHCallParticipantsViewController shouldShowSingleDurationLabel](self, "shouldShowSingleDurationLabel");
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController participantsView](self, "participantsView"));
        objc_msgSend(v47, "setShouldShowSingleDurationLabel:", v46);

        v4 = v17;
        v14 = v101;
        goto LABEL_107;
      }
    }
LABEL_27:
    if (-[NSObject count](v6, "count", v99))
    {
      v103 = v6;
      v29 = v14;
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v115, v129, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v116;
        v34 = 1;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(_QWORD *)v116 != v33)
              objc_enumerationMutation(v30);
            v36 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)i);
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "calls"));
            v38 = objc_msgSend(v37, "count");

            if (v38 && objc_msgSend(v36, "disconnectedReasonRequiresCallBackUI"))
              v34 = 0;
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v115, v129, 16);
        }
        while (v32);
      }
      else
      {
        v34 = 1;
      }

      v39 = v34 & 1;
      v14 = v29;
      v6 = v103;
      v10 = CNKTranscriptionViewComposerFactory_ptr;
    }
    else
    {
      v39 = 1;
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[176], "sharedInstance"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "incomingCall"));
    if (v49 && v14 && (unint64_t)-[NSObject count](v6, "count") >= 2)
    {
      v50 = -[PHCallParticipantsViewController handlesCallWaitingCalls](self, "handlesCallWaitingCalls");

      if ((v50 & 1) == 0)
      {
        v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v111 = 0u;
        v112 = 0u;
        v113 = 0u;
        v114 = 0u;
        v51 = v6;
        v52 = -[NSObject countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v111, v128, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v112;
          do
          {
            for (j = 0; j != v53; j = (char *)j + 1)
            {
              if (*(_QWORD *)v112 != v54)
                objc_enumerationMutation(v51);
              v56 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v56, "status") != 4)
                -[NSObject addObject:](v4, "addObject:", v56);
            }
            v53 = -[NSObject countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v111, v128, 16);
          }
          while (v53);
        }

        if ((v39 & 1) == 0)
          goto LABEL_92;
        goto LABEL_79;
      }
    }
    else
    {

    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[176], "sharedInstance"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "incomingCalls"));
    if ((unint64_t)objc_msgSend(v58, "count") <= 1)
    {
      v59 = -[PHCallParticipantsViewController handlesCallWaitingCalls](self, "handlesCallWaitingCalls");

      if ((v59 & 1) == 0)
      {
        v4 = v6;
        if (!v39)
          goto LABEL_92;
LABEL_79:
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
        v67 = objc_msgSend(v66, "count");

        if (!v67)
          goto LABEL_92;
        v68 = 0;
        while (1)
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectAtIndex:", v68));

          if ((-[NSObject containsObject:](v4, "containsObject:", v70) & 1) == 0)
          {
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "calls"));
            if (objc_msgSend(v71, "count") == (id)1)
            {
              v72 = objc_msgSend(v70, "isConferenced");

              if ((v72 & 1) != 0 || (unint64_t)-[NSObject count](v4, "count") > 1)
                goto LABEL_91;
              v73 = (char *)-[NSObject count](v4, "count");
              v74 = v73 >= v68 ? v68 : v73;
              -[NSObject insertObject:atIndex:](v4, "insertObject:atIndex:", v70, v74);
              if ((objc_msgSend(v70, "disconnectedReasonRequiresCallBackUI") & 1) != 0)
                goto LABEL_91;
              v75 = dispatch_time(0, 3000000000);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_1000A0370;
              block[3] = &unk_100285158;
              v105 = v70;
              v106 = self;
              dispatch_after(v75, (dispatch_queue_t)&_dispatch_main_q, block);
              v71 = v105;
            }

          }
LABEL_91:

          ++v68;
          v76 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
          v77 = (char *)objc_msgSend(v76, "count");

          if (v77 <= v68)
            goto LABEL_92;
        }
      }
    }
    else
    {

    }
    v60 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v4 = v6;
    v61 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v108;
      while (2)
      {
        for (k = 0; k != v62; k = (char *)k + 1)
        {
          if (*(_QWORD *)v108 != v63)
            objc_enumerationMutation(v4);
          v65 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)k);
          if (objc_msgSend(v65, "status") == 4)
          {
            -[NSObject addObject:](v60, "addObject:", v65);
            goto LABEL_74;
          }
        }
        v62 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
        if (v62)
          continue;
        break;
      }
    }
LABEL_74:

    if (-[NSObject count](v60, "count"))
    {

      v4 = v60;
      goto LABEL_92;
    }

    if ((v39 & 1) == 0)
    {
LABEL_92:
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController features](self, "features"));
      if ((objc_msgSend(v78, "callManagerEnabled") & 1) != 0)
      {
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        v80 = objc_msgSend(v79, "callDisplayStyle");

        if (v80 != (id)3)
          goto LABEL_97;
      }
      else
      {

      }
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject __imArrayByFilteringWithBlock:](v4, "__imArrayByFilteringWithBlock:", &stru_100287068));
      v82 = objc_msgSend(v81, "mutableCopy");

      v4 = v82;
LABEL_97:
      if (!-[NSObject count](v4, "count"))
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "delegate"));
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "mostRecentlyDisconnectedAudioCall"));

        if (v85)
        {
          v86 = objc_alloc((Class)TUCallGroup);
          v87 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "delegate"));
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "mostRecentlyDisconnectedAudioCall"));
          v90 = objc_msgSend(v86, "initWithCall:", v89);

          -[NSObject addObject:](v4, "addObject:", v90);
        }
      }
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
      v92 = objc_msgSend(v91, "count");
      if (v92 != -[NSObject count](v4, "count"))
      {
        v93 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
        v94 = objc_opt_respondsToSelector(v93, "callParticipantsViewController:willShowMultipleLabel:");

        if ((v94 & 1) == 0)
        {
LABEL_104:
          v95 = sub_1000C5588();
          v96 = objc_claimAutoreleasedReturnValue(v95);
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v134 = v4;
            _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "Updated call groups: %@", buf, 0xCu);
          }

          -[PHCallParticipantsViewController setCallGroups:](self, "setCallGroups:", v4);
          v97 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController participantsView](self, "participantsView"));
          objc_msgSend(v97, "updateParticipantsAnimated:", 1);

          v98 = -[PHCallParticipantsViewController shouldShowSingleDurationLabel](self, "shouldShowSingleDurationLabel");
          v17 = objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController participantsView](self, "participantsView"));
          -[NSObject setShouldShowSingleDurationLabel:](v17, "setShouldShowSingleDurationLabel:", v98);
LABEL_107:

          goto LABEL_108;
        }
        v91 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
        objc_msgSend(v91, "callParticipantsViewController:willShowMultipleLabel:", self, (unint64_t)-[NSObject count](v4, "count") > 1);
      }

      goto LABEL_104;
    }
    goto LABEL_79;
  }
  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Call is about to be ended by presenting Stewie, skip all the updates from now on", buf, 2u);
  }
LABEL_108:

}

- (NSNumberFormatter)numberFormatter
{
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;

  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    -[NSNumberFormatter setNumberStyle:](self->_numberFormatter, "setNumberStyle:", 1);
    numberFormatter = self->_numberFormatter;
  }
  return numberFormatter;
}

- (void)callStatusChangedNotification:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "callStatusChangedNotification: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHCallParticipantsViewController _updateCallGroups](self, "_updateCallGroups");
}

- (void)localSenderIdentityAccountUUIDChangedNotification:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "localSenderIdentityAccountUUIDChangedNotification: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHCallParticipantsViewController _updateCallGroups](self, "_updateCallGroups");
}

- (void)conferenceParticipantsChangedNotification:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "conferenceParticipantsChangedNotification: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHCallParticipantsViewController _updateCallGroups](self, "_updateCallGroups");
}

- (void)isThirdPartyVideoChangedNotification:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "isThirdPartyVideoChangedNotification: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHCallParticipantsViewController _updateCallGroups](self, "_updateCallGroups");
}

- (void)callModelChangedNotification:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  _BOOL8 v9;
  void *v10;
  int v11;
  const __CFString *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", a3));
  v5 = objc_msgSend(v4, "isAmbiguous");

  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NOT AMBIGUOUS");
    if (v5)
      v8 = CFSTR("AMBIGUOUS");
    v11 = 138412290;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "callModelChanged: %@", (uint8_t *)&v11, 0xCu);
  }

  v9 = -[PHCallParticipantsViewController shouldShowSingleDurationLabel](self, "shouldShowSingleDurationLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController participantsView](self, "participantsView"));
  objc_msgSend(v10, "setShouldShowSingleDurationLabel:", v9);

}

- (void)displayContextChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "displayNameChanged", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController participantsView](self, "participantsView"));
  objc_msgSend(v6, "updateParticipants");

}

- (void)secondTickNotification:(id)a3
{
  id v4;

  if (-[PHCallParticipantsViewController anyLabelDescriptorIsDynamic](self, "anyLabelDescriptorIsDynamic", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController participantsView](self, "participantsView"));
    objc_msgSend(v4, "updateParticipants");

  }
}

- (void)callContinuityChangedNotification:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "callContinuityChangedNotification: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHCallParticipantsViewController _updateCallGroups](self, "_updateCallGroups");
}

- (void)handleAlertDisconnectingCallsNotification:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "handleAlertDisconnectingCallsNotification: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHCallParticipantsViewController setCallIsAboutToEndForStewie:](self, "setCallIsAboutToEndForStewie:", 1);
}

- (void)tuCallHasBeenRedirectedChangedNotification:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "tuCallHasBeenRedirectedChangedNotification: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHCallParticipantsViewController _updateCallGroups](self, "_updateCallGroups");
}

- (void)keypadDataSourceChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController numberFormatter](self, "numberFormatter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numberFromString:", v5));

  if (v6)
    v7 = objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v6, 0));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "object"));
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController nameOverrideString](self, "nameOverrideString"));

  if (v9)
  {
    if (-[PHCallParticipantsViewController shouldInsertSpaceBeforeNextOverrideStringCharacter](self, "shouldInsertSpaceBeforeNextOverrideStringCharacter"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController nameOverrideString](self, "nameOverrideString"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v10, v8));
      -[PHCallParticipantsViewController setNameOverrideString:](self, "setNameOverrideString:", v11);

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController nameOverrideString](self, "nameOverrideString"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", v8));
      -[PHCallParticipantsViewController setNameOverrideString:](self, "setNameOverrideString:", v13);

    }
  }
  else
  {
    -[PHCallParticipantsViewController setNameOverrideString:](self, "setNameOverrideString:", v8);
  }
  if (-[PHCallParticipantsViewController allowsFieldModeSendButton](self, "allowsFieldModeSendButton"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController nameOverrideString](self, "nameOverrideString"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15));
    v17 = sub_100086EA4(v16, (char)objc_msgSend(v8, "characterAtIndex:", 0));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController participantsView](self, "participantsView"));
      -[PHCallParticipantsViewController fieldModeSendButtonTappedInParticipantsView:](self, "fieldModeSendButtonTappedInParticipantsView:", v18);

    }
  }
  -[PHCallParticipantsViewController setShouldInsertSpaceBeforeNextOverrideStringCharacter:](self, "setShouldInsertSpaceBeforeNextOverrideStringCharacter:", 0);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "setShouldInsertSpaceBeforeNextOverrideStringCharacter", 0);
  -[PHCallParticipantsViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "setShouldInsertSpaceBeforeNextOverrideStringCharacter", 0, 4.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController participantsView](self, "participantsView"));
  objc_msgSend(v19, "updateParticipants");

}

- (void)setShouldInsertSpaceBeforeNextOverrideStringCharacter
{
  -[PHCallParticipantsViewController setShouldInsertSpaceBeforeNextOverrideStringCharacter:](self, "setShouldInsertSpaceBeforeNextOverrideStringCharacter:", 1);
}

- (void)resetNameOverrideString
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController nameOverrideString](self, "nameOverrideString"));

  if (v3)
  {
    -[PHCallParticipantsViewController setNameOverrideString:](self, "setNameOverrideString:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController participantsView](self, "participantsView"));
    objc_msgSend(v4, "updateParticipantsAnimated:", 1);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController participantsView](self, "participantsView"));
    objc_msgSend(v5, "layoutIfNeeded");

  }
  -[PHCallParticipantsViewController setAllowsFieldModeSendButton:](self, "setAllowsFieldModeSendButton:", 0);
}

- (id)contactForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  if (-[PHCallParticipantsViewController shouldShowParticipantImageAtIndex:inParticipantsView:](self, "shouldShowParticipantImageAtIndex:inParticipantsView:", a3, a4))
  {
    if (-[PHCallParticipantsViewController usesCompactMulticallUI](self, "usesCompactMulticallUI"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController frontmostCallGroup](self, "frontmostCallGroup"));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
      if ((unint64_t)objc_msgSend(v8, "count") <= a3)
      {
        v6 = 0;
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", a3));

      }
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calls"));
    v11 = objc_msgSend(v10, "count");

    if (v11 == (id)1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calls"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForCall:", v13));
      v15 = objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contactIdentifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallViewController contactKeysToFetch](PHAudioCallViewController, "contactKeysToFetch"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController contactsCache](self, "contactsCache"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contactForIdentifier:keysToFetch:usingCache:", v16, v17, v18));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)localizedSenderIdentityForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (+[PHDevice isGeminiCapable](PHDevice, "isGeminiCapable", a3, a4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calls"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "provider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "prioritizedSenderIdentities"));
    v12 = objc_msgSend(v11, "count");

    if ((unint64_t)v12 < 2)
    {
      v16 = 0;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calls"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localSenderIdentity"));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedShortName"));
    }

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (BOOL)shouldShowSingleDurationLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  if (objc_msgSend(v3, "isAmbiguous"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "callWithStatus:", 1));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "model"));
      v8 = objc_msgSend(v7, "supportsHolding") ^ 1;

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)shouldShowInfoButtonForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a3));

  if (objc_msgSend(v6, "currentCallCount"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calls"));
    if ((unint64_t)objc_msgSend(v9, "count") < 2)
      LOBYTE(v10) = 0;
    else
      v10 = objc_msgSend(v6, "isAmbiguous") ^ 1;

  }
  else
  {
    LOBYTE(v10) = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "frontmostCall"));
  if (objc_msgSend(v11, "isConversation"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "frontmostCall"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "remoteParticipantHandles"));
    if ((unint64_t)objc_msgSend(v13, "count") < 2)
    {
      v16 = 0;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "frontmostCall"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "provider"));
      v16 = objc_msgSend(v15, "isTelephonyProvider");

    }
  }
  else
  {
    v16 = 0;
  }

  return v10 | v16;
}

- (BOOL)shouldShowCallDetailsViewButton
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[PHCallParticipantsViewController isFrontmostCallFaceTimeAudio](self, "isFrontmostCallFaceTimeAudio"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "frontmostCall"));
  if (objc_msgSend(v4, "isConnected"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v6 = objc_msgSend(v5, "callDisplayStyle") != (id)3;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isFrontmostCallFaceTimeAudio
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "frontmostCall"));

  if (objc_msgSend(v3, "isConversation"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
    if (objc_msgSend(v4, "isFaceTimeProvider"))
      v5 = objc_msgSend(v3, "isVideo") ^ 1;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (unint64_t)numberOfParticipantLabels
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  if (objc_msgSend(v3, "isAmbiguous"))
  {
    v4 = -[PHCallParticipantsViewController shouldShowSingleDurationLabel](self, "shouldShowSingleDurationLabel");

    if ((v4 & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
      v6 = objc_msgSend(v5, "count");

      v7 = v6 != 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
  v7 = (unint64_t)objc_msgSend(v8, "count");

LABEL_6:
  if (-[PHCallParticipantsViewController usesCompactMulticallUI](self, "usesCompactMulticallUI") && v7 > 1)
    return 1;
  else
    return v7;
}

- (id)nameForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  void *v6;
  void *v7;
  void *v8;

  if (-[PHCallParticipantsViewController usesCompactMulticallUI](self, "usesCompactMulticallUI", a3, a4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController frontmostCallGroup](self, "frontmostCallGroup"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController nameForCallGroup:](self, "nameForCallGroup:", v6));

  return v8;
}

- (id)nameForCallGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController nameOverrideString](self, "nameOverrideString"));
  if (v5)
    goto LABEL_30;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calls"));
  if (objc_msgSend(v6, "count") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calls"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = objc_msgSend(v8, "isConversation");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calls"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeConversationForCall:", v12));

      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayName"));
      if (v5)
        goto LABEL_30;
    }
  }
  else
  {

  }
  if (objc_msgSend(v4, "status") != 4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    if ((objc_msgSend(v14, "isAmbiguous") & 1) != 0)
    {
      v15 = -[PHCallParticipantsViewController shouldShowSingleDurationLabel](self, "shouldShowSingleDurationLabel");

      if ((v15 & 1) == 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("AMBIGUOUS_CALL_LABEL"), &stru_10028DC20, CFSTR("InCallService")));

        if (v5)
          goto LABEL_30;
      }
    }
    else
    {

    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
  if (objc_msgSend(v17, "count") != (id)1 || objc_msgSend(v4, "status") != 1)
  {

    goto LABEL_18;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calls"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "callDirectoryName"));
  if (v20)
  {

  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calls"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));
    v29 = objc_msgSend(v28, "isBranded");

    if ((v29 & 1) == 0)
      goto LABEL_18;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calls"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "firstObject"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "callDurationString"));
  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calls"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "callDurationString"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%02d:%02d"), 0, 0));
  }

  if (v5)
    goto LABEL_30;
LABEL_18:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
  v22 = objc_msgSend(v21, "count");

  if (v22 != (id)2)
  {
LABEL_29:
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
    goto LABEL_30;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calls"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));

  if (objc_msgSend(v24, "isBranded"))
  {
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedLabel"));
    goto LABEL_23;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "callDirectoryName"));

  if (!v26)
  {

    goto LABEL_29;
  }
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "callDirectoryName"));
LABEL_23:
  v5 = (void *)v25;

  if (!v5)
    goto LABEL_29;
LABEL_30:

  return v5;
}

- (id)callForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  void *v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", a3, a4));
  if (objc_msgSend(v6, "isAmbiguous"))
  {
    v7 = -[PHCallParticipantsViewController shouldShowSingleDurationLabel](self, "shouldShowSingleDurationLabel");

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      goto LABEL_6;
    }
  }
  else
  {

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", a3));
LABEL_6:
  v10 = (void *)v9;

  if (-[PHCallParticipantsViewController usesCompactMulticallUI](self, "usesCompactMulticallUI"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
    if ((unint64_t)objc_msgSend(v11, "count") < 2)
    {
LABEL_10:

      return v10;
    }
    v12 = objc_msgSend(v10, "status");

    if (v12 == 2)
    {
      v11 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController frontmostCallGroup](self, "frontmostCallGroup"));
      goto LABEL_10;
    }
  }
  return v10;
}

- (id)labelForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4 allowsDuration:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  CNKCallParticipantLabelDescriptorFactory *labelDescriptorFactory;
  void *v13;
  void *v14;

  v5 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callForParticipantAtIndex:inParticipantsView:](self, "callForParticipantAtIndex:inParticipantsView:", a3, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "shouldRenderAlertTextColor");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
    v11 = objc_msgSend(v10, "shouldRenderAlertTextColor");

  }
  else
  {
    v11 = 0;
  }
  labelDescriptorFactory = self->_labelDescriptorFactory;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CNKCallParticipantLabelDescriptorFactory labelDescriptorWithStringsForCall:callCount:alertAvailable:allowsDuration:](labelDescriptorFactory, "labelDescriptorWithStringsForCall:callCount:alertAvailable:allowsDuration:", v7, objc_msgSend(v13, "count"), v11, v5));

  return v14;
}

- (BOOL)anyLabelDescriptorIsDynamic
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = -[PHCallParticipantsViewController numberOfParticipantLabels](self, "numberOfParticipantLabels");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 1;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController traitCollection](self, "traitCollection"));
      v8 = objc_msgSend(v7, "_backlightLuminance") != (id)1;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController labelForParticipantAtIndex:inParticipantsView:allowsDuration:](self, "labelForParticipantAtIndex:inParticipantsView:allowsDuration:", v5, 0, v8));
      LODWORD(v8) = objc_msgSend(v9, "isDynamic");

      if ((_DWORD)v8)
        break;
      v6 = ++v5 < v4;
    }
    while (v4 != v5);
  }
  else
  {
    return 0;
  }
  return v6;
}

- (id)supplementalParticipantLabelFormatStringAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callForParticipantAtIndex:inParticipantsView:](self, "callForParticipantAtIndex:inParticipantsView:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supplementalInCallString"));
  if (v5 && (objc_msgSend(v4, "status") | 2) == 3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@_FROM_OR_VIA_FORMAT_%@"), &stru_10028DC20, CFSTR("CallStatus")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, CFSTR("%@"), v5));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)activityStateForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  if (-[PHCallParticipantsViewController usesCompactMulticallUI](self, "usesCompactMulticallUI", a3, a4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController frontmostCallGroup](self, "frontmostCallGroup"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v9 = objc_msgSend(v8, "isAmbiguous");

  if ((v9 & 1) != 0)
    goto LABEL_5;
  if (objc_msgSend(v6, "status") == 2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calls"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v13 = objc_msgSend(v12, "statusIsProvisional");

    if ((v13 & 1) != 0)
    {
      v10 = 2;
      goto LABEL_18;
    }
  }
  if (objc_msgSend(v6, "status") == 5)
  {
    v10 = 0;
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "status") == 6
    && (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calls")),
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject")),
        v16 = objc_msgSend(v15, "disconnectedReasonRequiresCallBackUI"),
        v15,
        v14,
        (v16 & 1) != 0))
  {
LABEL_5:
    v10 = 3;
  }
  else if (objc_msgSend(v6, "status") == 2)
  {
    v10 = 1;
  }
  else if (objc_msgSend(v6, "status") == 6)
  {
    v10 = 1;
  }
  else
  {
    v10 = 3;
  }
LABEL_18:

  return v10;
}

- (BOOL)shouldShowParticipantImageAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  char v26;
  unsigned __int8 v27;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController parentViewController](self, "parentViewController", a3, a4));
  v8 = objc_opt_class(PHAudioCallViewController, v7);
  isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) == 0)
    goto LABEL_5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController parentViewController](self, "parentViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController features](self, "features"));
  v12 = objc_msgSend(v11, "isHeroImageEnabled");

  if ((v12 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v14 = objc_msgSend(v13, "callDisplayStyle");

    if (v14 != (id)3)
    {
      v27 = objc_msgSend(v10, "isShowingBackgroundImage");

      if ((v27 & 1) == 0)
        goto LABEL_5;
      return 0;
    }
  }
  v15 = objc_msgSend(v10, "shouldShowCircularAvatar");

  if ((v15 & 1) == 0)
    return 0;
LABEL_5:
  if (-[PHCallParticipantsViewController usesCompactMulticallUI](self, "usesCompactMulticallUI"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController frontmostCallGroup](self, "frontmostCallGroup"));
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
    if (objc_msgSend(v17, "count"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", a3));

    }
    else
    {
      v16 = 0;
    }

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "calls"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "handle"));
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "siriDisplayName"));
  if (v22)
  {
    v23 = (void *)v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "handle"));
    v25 = objc_msgSend(v24, "shouldHideContact");

    v26 = v25 ^ 1;
  }
  else
  {

    v26 = 1;
  }

  return v26;
}

- (BOOL)shouldShowLargeAvatar
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "callParticipantsViewControllerShouldShowLargeAvatar:");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "callParticipantsViewControllerShouldShowLargeAvatar:", self);

  return v6;
}

- (BOOL)isCallRinging
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController frontmostCallGroup](self, "frontmostCallGroup"));
  v3 = objc_msgSend(v2, "status") == 4;

  return v3;
}

- (BOOL)shouldShowParticipantLabel
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "participantsViewShouldShowParticipantLabel");

  if ((v4 & 1) == 0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "participantsViewShouldShowParticipantLabel");

  return v6;
}

- (void)participantTappedAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  id v16;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups", a3, a4));
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calls"));
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  }
  else
  {
    v16 = 0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "callWithStatus:", 1));

  if (objc_msgSend(v16, "isOnHold"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));
    v13 = objc_msgSend(v12, "supportsHolding");

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      objc_msgSend(v14, "swapCalls");

    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController participantsView](self, "participantsView"));
  objc_msgSend(v15, "updateParticipantsAnimated:", 1);

}

- (void)participantViewInfoButtonTappedAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  void *v5;
  PHConferenceParticipantsViewController *v6;

  v6 = objc_alloc_init(PHConferenceParticipantsViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)participantViewCallDetailsGestureRecognizerTapped
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
  objc_msgSend(v3, "callParticipantsViewControllerDidTapCallDetailsGestureRecognizer:", self);

}

- (id)compactLabelTextForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups", a3, a4));
  if ((unint64_t)objc_msgSend(v5, "count") <= a3)
  {
    v10 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", a3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calls"));
    v8 = objc_msgSend(v7, "count");

    if ((unint64_t)v8 < 2)
    {
      v10 = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CONFERENCE"), &stru_10028DC20, CFSTR("InCallService")));

    }
  }

  return v10;
}

- (void)setBannerButtonsState:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController view](self, "view"));
  objc_msgSend(v4, "setBannerButtonsState:", a3);

}

- (void)setBannerAudioRouteButtonSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController view](self, "view"));
  objc_msgSend(v4, "setBannerAudioRouteButtonSelected:", v3);

}

- (id)colorForStatusLabelForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callDisplayStyleManager](self, "callDisplayStyleManager", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration statusLabelFontColorForCallDisplayStyle:](PHUIConfiguration, "statusLabelFontColorForCallDisplayStyle:", objc_msgSend(v6, "callDisplayStyle")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
  v10 = objc_opt_respondsToSelector(v9, "customColorForStatusLabelWithCall:");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController frontmostCall](self, "frontmostCall"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "customColorForStatusLabelWithCall:", v12));

    if (v13)
    {
      v14 = v13;

      v7 = v14;
    }

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
  v16 = objc_opt_respondsToSelector(v15, "shouldRenderAlertTextColor");

  if ((v16 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
    v18 = objc_msgSend(v17, "shouldRenderAlertTextColor");

  }
  else
  {
    v18 = 0;
  }
  if ((unint64_t)objc_msgSend(v8, "count") > a3)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", a3));
    if ((objc_msgSend(v19, "isSOS") | v18) == 1)
    {
      v20 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));

      v7 = (void *)v20;
    }
    if ((v18 & 1) == 0 && objc_msgSend(v19, "isBranded"))
    {
      v21 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));

      v7 = (void *)v21;
    }

  }
  return v7;
}

- (id)colorForParticipantLabelView:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "customColorForParticipantLabelWithCall:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController frontmostCall](self, "frontmostCall"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "customColorForParticipantLabelWithCall:", v8));

    if (v9)
    {
      v10 = v9;

      v4 = v10;
    }

  }
  return v4;
}

- (BOOL)usesCompactMulticallUI
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController features](self, "features"));
  if (objc_msgSend(v3, "callManagerEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v5 = objc_msgSend(v4, "callDisplayStyle") != (id)3;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fontForParticipantLabelView:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  double v24;
  double v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "updatedParticipantMarqueeLabelFont"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "shouldRenderAlertTextFont");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
    v8 = objc_msgSend(v7, "shouldRenderAlertTextFont");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
      v10 = objc_msgSend(v9, "isButtonLayoutEnabled");

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleLargeTitle));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fontDescriptor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fontDescriptorWithDesign:", UIFontDescriptorSystemDesignDefault));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v13, 0.0));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fontDescriptor"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fontDescriptorWithSymbolicTraits:", 2));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v16, 96.0));

        v4 = v11;
        goto LABEL_19;
      }
    }
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups", 0));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v19)
    goto LABEL_15;
  v20 = v19;
  v21 = *(_QWORD *)v28;
  while (2)
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(_QWORD *)v28 != v21)
        objc_enumerationMutation(v18);
      v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
      if (-[CNKFeatures isEnhancedEmergencyEnabled](self->_features, "isEnhancedEmergencyEnabled")
        && objc_msgSend(v23, "isEmergency"))
      {
        v25 = UIFontWeightBold;
        v24 = 76.0;
        goto LABEL_18;
      }
      if (objc_msgSend(v23, "isSOS"))
      {
        objc_msgSend(v4, "pointSize");
        v25 = UIFontWeightSemibold;
LABEL_18:
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v24, v25));

        goto LABEL_19;
      }
    }
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v20)
      continue;
    break;
  }
LABEL_15:

  v4 = v4;
  v17 = v4;
LABEL_19:

  return v17;
}

- (id)customFontForParticipantLabel
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "customFontForParticipantLabelWithCall:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController frontmostCall](self, "frontmostCall"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "customFontForParticipantLabelWithCall:", v6));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)fontForParticipantLabelViewStatusLabel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callDisplayStyleManager](self, "callDisplayStyleManager", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallStatusLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallStatusLabelFontForCallDisplayStyle:", objc_msgSend(v4, "callDisplayStyle")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "shouldRenderAlertTextFont");

  if ((v7 & 1) != 0
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate")),
        v9 = objc_msgSend(v8, "shouldRenderAlertTextFont"),
        v8,
        v9))
  {
    objc_msgSend(v5, "pointSize");
    v10 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
  }
  else
  {
    v10 = v5;
  }
  v11 = v10;

  return v11;
}

- (id)iconInParticipantsView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider")),
        v6 = objc_msgSend(v5, "isSystemProvider"),
        v5,
        (v6 & 1) == 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v10, "scale");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 5));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)participantsView:(id)a3 didPerformActionType:(int64_t)a4
{
  void *v6;
  char v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate", a3));
  v7 = objc_opt_respondsToSelector(v6, "callParticipantsViewController:didPerformActionType:");

  if ((v7 & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController delegate](self, "delegate"));
    objc_msgSend(v8, "callParticipantsViewController:didPerformActionType:", self, a4);

  }
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "isOneToOneModeEnabled") && (objc_msgSend(v5, "isVideo") & 1) == 0)
    -[PHCallParticipantsViewController _updateCallGroups](self, "_updateCallGroups");

}

- (void)setAllowsFieldModeSendButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController participantsView](self, "participantsView"));
  objc_msgSend(v4, "setAllowsFieldModeSendButton:", v3);

}

- (void)fieldModeSendButtonTappedInParticipantsView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController nameOverrideString](self, "nameOverrideString", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5));

  if (objc_msgSend(v6, "length") && !sub_100087564(v6))
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Field Mode: Dialing digits %@", (uint8_t *)&v13, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "provider"));
    objc_msgSend(v11, "sendFieldModeDigits:forProvider:", v6, v12);

  }
}

- (BOOL)isDeviceCapableOfTelephonyCalls
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](FTDeviceSupport, "sharedInstance"));
  v3 = objc_msgSend(v2, "isTelephonyDevice");

  return v3;
}

- (id)frontmostCallGroup
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
      if (objc_msgSend(v8, "status") == 1)
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v9 = v8;

    if (v9)
      return v9;
  }
  else
  {
LABEL_9:

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController callGroups](self, "callGroups"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

  return v9;
}

- (id)frontmostCall
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController frontmostCallGroup](self, "frontmostCallGroup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "calls"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return v4;
}

- (PHCallParticipantsViewControllerDelegate)delegate
{
  return (PHCallParticipantsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)handlesCallWaitingCalls
{
  return self->_handlesCallWaitingCalls;
}

- (void)setHandlesCallWaitingCalls:(BOOL)a3
{
  self->_handlesCallWaitingCalls = a3;
}

- (BOOL)allowsFieldModeSendButton
{
  return self->_allowsFieldModeSendButton;
}

- (BOOL)shouldIgnoreUpdates
{
  return self->_shouldIgnoreUpdates;
}

- (void)setShouldIgnoreUpdates:(BOOL)a3
{
  self->_shouldIgnoreUpdates = a3;
}

- (unint64_t)bannerButtonsState
{
  return self->_bannerButtonsState;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (PHCallParticipantsView)participantsView
{
  return (PHCallParticipantsView *)objc_getProperty(self, a2, 48, 1);
}

- (void)setParticipantsView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setCallGroups:(id)a3
{
  objc_storeStrong((id *)&self->_callGroups, a3);
}

- (NSString)nameOverrideString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNameOverrideString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)shouldInsertSpaceBeforeNextOverrideStringCharacter
{
  return self->_shouldInsertSpaceBeforeNextOverrideStringCharacter;
}

- (void)setShouldInsertSpaceBeforeNextOverrideStringCharacter:(BOOL)a3
{
  self->_shouldInsertSpaceBeforeNextOverrideStringCharacter = a3;
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return (ICSCallDisplayStyleManager *)objc_getProperty(self, a2, 72, 1);
}

- (CNKCallParticipantLabelDescriptorFactory)labelDescriptorFactory
{
  return self->_labelDescriptorFactory;
}

- (CNKFeatures)features
{
  return self->_features;
}

- (BOOL)callIsAboutToEndForStewie
{
  return self->_callIsAboutToEndForStewie;
}

- (void)setCallIsAboutToEndForStewie:(BOOL)a3
{
  self->_callIsAboutToEndForStewie = a3;
}

- (NSCache)contactsCache
{
  return self->_contactsCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsCache, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_labelDescriptorFactory, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong((id *)&self->_nameOverrideString, 0);
  objc_storeStrong((id *)&self->_callGroups, 0);
  objc_storeStrong((id *)&self->_participantsView, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_prioritizedCall);
}

@end
